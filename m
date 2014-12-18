Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7175E726F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 01:18:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBI1I22q024502
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 17 Dec 2014 17:18:02 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 17 Dec 2014 17:18:01 -0800
Message-ID: <54922B48.6000309@windriver.com>
Date: Thu, 18 Dec 2014 09:18:00 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<835687296e529e505a948421804d16259eb51d2b.1415350038.git.kai.kang@windriver.com>
	<D9FD4A25-6B2D-4868-B536-9593EFF79254@dominion.thruhere.net>
	<54914322.6000309@windriver.com>
	<CAJTo0La+gHrdTtS9qG6iMnaHwHrEDcN2DY6uq+EH3tWUbdHfVw@mail.gmail.com>
In-Reply-To: <CAJTo0La+gHrdTtS9qG6iMnaHwHrEDcN2DY6uq+EH3tWUbdHfVw@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH 09/24] libpng: add neon option for aarch64
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
X-List-Received-Date: Thu, 18 Dec 2014 01:18:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年12月17日 19:04, Burton, Ross wrote:
> I find Koen's patch for libpng neater so could you merge that into your
> qemuarm64 branch?  The autobuilder has been doing some builds so this
> should be the last stage before it's all merged.

OK. I'll do it.

--Kai

>
> Ross
>
> On 17 December 2014 at 08:47, Kang Kai <Kai.Kang@windriver.com> wrote:
>>   On 2014年12月17日 03:30, Koen Kooi wrote:
>>
>>   Op 7 nov. 2014, om 09:51 heeft Kai Kang <kai.kang@windriver.com> <kai.kang@windriver.com> het volgende geschreven:
>>
>> Add neon option for aarch64 just as for arm. It fails with:
>>
>> | ./.libs/libpng16.so: undefined reference to `png_init_filter_functions_neon'
>> | collect2: error: ld returned 1 exit status
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com> <kai.kang@windriver.com>
>> ---
>> meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
>> index 0c6fd1f..3d32bfe 100644
>> --- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
>> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
>> @@ -20,6 +20,7 @@ inherit autotools binconfig-disabled pkgconfig
>>
>> # Work around missing symbols
>> EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
>> +EXTRA_OECONF_append_aarch64 = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
>>
>>   You're introducing the same bug in a different way: overeager use of qualifiers. Just drop the _arm bit and it works.
>>
>>
>>
>> OK. I'll remove the _arm to fix this issue.
>>
>> Thanks.
>>
>> --
>> Regards,
>> Neil | Kai Kang
>>
>>


-- 
Regards,
Neil | Kai Kang


