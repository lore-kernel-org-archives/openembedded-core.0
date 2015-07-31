Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5B876504
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 01:11:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6V1Bptp014407
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 18:11:51 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 18:11:31 -0700
Message-ID: <55BACB55.3030000@windriver.com>
Date: Fri, 31 Jul 2015 09:11:49 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1438048807-23716-1-git-send-email-rongqing.li@windriver.com>	<CAJTo0LaXtgUCjzPS_6+5fEL6CDdLK1Cn_3wNvCM_EfWH_wDG2A@mail.gmail.com>	<55B9C3A7.6050402@windriver.com>
	<CAP9ODKoq190kimVAUJ6dPEJWQtwLfLFsYDVFRcnMUrsr1-SVeQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoq190kimVAUJ6dPEJWQtwLfLFsYDVFRcnMUrsr1-SVeQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-mkimage: fix a building failure on OpenSus
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
X-List-Received-Date: Fri, 31 Jul 2015 01:11:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月30日 19:37, Otavio Salvador wrote:
> Hello,
>
> On Thu, Jul 30, 2015 at 3:26 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
> ...
>> u-boot-mkimage just be upgraded, and has the similar your suggestive fix:
>>
>> commit cffcd2861310855130db52c93f7bf4d9b511741d
>> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Date:   Fri Apr 3 12:30:25 2015 +0900
>>
>>      kbuild: include config.mk when auto.conf is not older than .config
>>
>>      Since the Kconfig conversion, config.mk has been included only when
>>      include/config/auto.conf is newer than the .config file.
>>
>>      It causes build error if both files have the same time-stamps.
>>      It is actually possible because EXT* file systems have a 1s time-stamp
>>      resolution.
>>
>>      The config.mk should be included when include/config/auto.conf is
>>      *not older* than the .config file.
>>
>>      Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>      Reported-by: Tom Rini <trini@konsulko.com>
>>      Reported-by: York Sun <yorksun@freescale.com>
>>      Reported-by: Stephen Warren <swarren@nvidia.com>
>>      Reported-by: Matthew Gerlach <mgerlach@opensource.altera.com>
>>      Tested-by: Stephen Warren <swarren@nvidia.com>
>
> This is part of 2015.07 release so I am wondering what is the issue
> here? Is this patch for old release? Fido for instance?
>


"It causes build error if both files have the same time-stamps.
It is actually possible because EXT* file systems have a 1s time-stamp
resolution."


Ｉ see the build error on SUSE Linux Enterprise Desktop 11 SP2 with ext3
filesystem frequently.


-Roy



-- 
Best Reagrds,
Roy | RongQing Li

