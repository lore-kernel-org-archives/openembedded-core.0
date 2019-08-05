Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37B367F2AD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 14:23:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x75EN6M2021813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Aug 2019 07:23:06 -0700 (PDT)
Received: from [192.168.10.15] (147.11.117.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 5 Aug 2019 07:23:05 -0700
To: Khem Raj <raj.khem@gmail.com>, Seebs <seebs@seebs.net>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell> <20190802124246.27d4beca@seebsdell>
	<CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>
	<20190803092307.486e930d@seebsdell>
	<CAMKF1so6TnxR13TvFHxRpcEuA-xAd2gSk8bnS7hBXfDW=d7+YQ@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <95e79f14-c9bb-9e75-88f7-f452eccf95b7@windriver.com>
Date: Mon, 5 Aug 2019 09:23:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1so6TnxR13TvFHxRpcEuA-xAd2gSk8bnS7hBXfDW=d7+YQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Mon, 05 Aug 2019 14:23:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

If we understood more about the nature of the race condition a test case could probably be constructed. For now, it is worth a try to see if it is any better.  I am certain the timing will change ever so slightly, so we could hit the glibc-locale issue more or less...

All of the regression tests completed over the weekend and the new code which found the problem in the first place is also working well. I'll send a new patch out to move pseudo forward.

Cheers,
Jason.


On 8/3/19 9:57 AM, Khem Raj wrote:
> I see the locale issue atleast 5-7 times a week on world builds so I
> will be able to see if that frequency stays same after this fix.
>
> On Sat, Aug 3, 2019 at 7:23 AM Seebs <seebs@seebs.net> wrote:
>> On Sat, 3 Aug 2019 05:33:46 -0700
>> Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> Will this fix the file ownership issue that we see with Glibc-locale
>>> packages from time to time?
>> I have no idea. Since I haven't got a reliable reproducer for it, I
>> can't test it in a sane way.
>>
>> -s



