Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 499C179ED5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 01:49:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x081n9ZL003981
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jan 2019 17:49:09 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 7 Jan 2019 17:49:08 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1543484174.git.Qi.Chen@windriver.com>
	<75835e51f6c88a58056350759080d5c0004562b7.1543484174.git.Qi.Chen@windriver.com>
	<CAJTo0LaEJ6FTnsbAydx18wKAvHa8dfSAoSo0BpXdVtszAtHn8A@mail.gmail.com>
	<e8d6a8d1ee7ff0d86ae25c22a09367f0cdb2eeae.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <d81ce264-e98f-48dc-9de8-05fac71b97a1@windriver.com>
Date: Tue, 8 Jan 2019 09:57:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <e8d6a8d1ee7ff0d86ae25c22a09367f0cdb2eeae.camel@linuxfoundation.org>
X-Originating-IP: [128.224.163.141]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase: add entry to /etc/hosts according to /etc/hostname
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2019 01:49:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2019 10:38 PM, Richard Purdie wrote:
> On Fri, 2018-12-14 at 21:45 +0000, Burton, Ross wrote:
>> On Fri, 30 Nov 2018 at 02:18, Chen Qi <Qi.Chen@windriver.com> wrote:
>>> We default hostname to ${MACHINE}, but it's not in /etc/hosts,
>>> resulting in commands like `hostname -f' failing due to lack
>>> of entry.
>>>
>>> So add entry to /etc/hosts according to /etc/hostname. We do
>>> this via pkg_postinst because hostname is set in base-files
>>> recipe.
>> RP and myself are still arguing over this so I thought I'd make my
>> argument on the list for debate.
>>
>> Updating /etc/hosts is being done with a postinst in netbase simply
>> because /etc/hostname is contained in the base-files recipe. I
>> advocate just moving the creation of /etc/hosts to base-files along
>> with /etc/hostname, then base-files can write both files at the same
>> time.  There's already a dependency on base-files from netbase so
>> there will be no change in the rootfs, a file will just move between
>> packages.
> Coming back to this after the holidays, I agree with Ross, we should
> move /etc/hostname to base-files and keep this simple. I'd like to get
> this fixed, could you update the patch please?
>
> Cheers,
>
> Richard
>
>
Yes. I'll send out a new patch.

Best Regards,

Chen Qi


