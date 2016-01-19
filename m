Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB56606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 01:40:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0J1eXsh001161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 18 Jan 2016 17:40:34 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jan 2016 17:40:33 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1452848807.git.liezhi.yang@windriver.com>
	<85829b7950f74cb41f39b5f1fbd8541bcb7b6d1e.1452848807.git.liezhi.yang@windriver.com>
	<20160118165317.GC2614@jama>
	<1453139551.27999.75.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569D940F.5000900@windriver.com>
Date: Tue, 19 Jan 2016 09:40:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1453139551.27999.75.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gstreamer1.0-plugins-good.inc: add gudev back to PACKAGECONFIG
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
X-List-Received-Date: Tue, 19 Jan 2016 01:40:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/19/2016 01:52 AM, Richard Purdie wrote:
> On Mon, 2016-01-18 at 17:53 +0100, Martin Jansa wrote:
>> On Fri, Jan 15, 2016 at 01:07:20AM -0800, Robert Yang wrote:
>>> The 66e32244aed8d33f1b49fbe78179f2442545c730 wrongly removed gudev
>>> from
>>> PACKAGECONFIG, now add it back.
>>
>> It was removed intentionally, because for systemd images there isn't
>> libgudev provider in oe-core, only in meta-oe.
>>
>> RP's fix:
>> http://git.openembedded.org/openembedded-core/commit/?h=jethro&id=bc4
>> 58ae9586b45b11b6908eadb31e94d892e698f
>>
>> breaks the dependencies again, because when systemd is used there
>> won't
>> be libgudev needed by gstreamer1.0-plugins-good
>>
>> Please revert both "fixes"

Sorry, I wrongly thought it was a mistake, but was intention.

// Robert

>
> The "backported" patch should have made mention of the changes compared
> to the version in master since otherwise, "intentionally" looked like a
> mistake :/.
>
> What is the impact to gstreamer of removing libgudev?
>
> Cheers,
>
> Richard
>

