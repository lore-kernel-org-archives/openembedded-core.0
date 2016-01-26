Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA582731F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 09:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0Q9hkTI027268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Jan 2016 01:43:47 -0800 (PST)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 26 Jan 2016 01:43:46 -0800
Message-ID: <56A73FCF.90309@windriver.com>
Date: Tue, 26 Jan 2016 17:43:43 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1453427632.git.Qi.Chen@windriver.com>
	<2123a9457649d41670e9c35ad4b77a80064c95ed.1453427632.git.Qi.Chen@windriver.com>
	<CAMKF1sobhDsXQ1ag9ZfrdHQyka7Y88C-thvzvMADa_V5C=9rqg@mail.gmail.com>
	<CAJTo0LYPF=bkqU_OGwCU5NZOgDja70Xsr338xJo6rJCf6MNpxA@mail.gmail.com>
	<CAMKF1sqBv67DS+8=vSJJQfRXdWJLgHxS8ur8p7ET0qFa3nks=A@mail.gmail.com>
In-Reply-To: <CAMKF1sqBv67DS+8=vSJJQfRXdWJLgHxS8ur8p7ET0qFa3nks=A@mail.gmail.com>
X-Originating-IP: [128.224.162.246]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: work around the boot problem on qemuarm64
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
X-List-Received-Date: Tue, 26 Jan 2016 09:43:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2016 10:03 PM, Khem Raj wrote:
> On Sat, Jan 23, 2016 at 1:39 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 23 January 2016 at 04:52, Khem Raj <raj.khem@gmail.com> wrote:
>>> This is general aarch64 problem, so make this across all aarch64
>>> this is the original problem
>>>
>>> https://github.com/systemd/systemd/pull/1190#issuecomment-166294683
>>
>> And according to that link, is a binutils problem.  Can't we just fix that
>> instead?
>>
> We can. May be try out the binutils patches I posted and see if that fixes it
> https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.26
>
>
>> Ross
>

Hi Khem and Ross,

I've verified the patch above does fix the systemd qemuarm64 problem.
Thanks all :)

Best Regards,
Chen Qi

