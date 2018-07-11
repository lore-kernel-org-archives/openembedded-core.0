Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id C2BAE75169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 19:16:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41QphT0MHHz1qxRs;
	Wed, 11 Jul 2018 21:16:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41QphT01gyz1qsf4;
	Wed, 11 Jul 2018 21:16:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id CXl7yPZyTtzo; Wed, 11 Jul 2018 21:16:23 +0200 (CEST)
X-Auth-Info: kVzrohkssEObvcDmMtBLwsfZYXX9UN3lD85fp4h0dOQ=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 11 Jul 2018 21:16:23 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180711150308.30275-1-marex@denx.de>
	<CA+chaQeD8xFEZncStxX_jd4Zme6g8E-c9bnVE3DOPpDyEn1b3Q@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <c1ac8631-c593-fba5-6060-191a0bfc7b51@denx.de>
Date: Wed, 11 Jul 2018 20:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeD8xFEZncStxX_jd4Zme6g8E-c9bnVE3DOPpDyEn1b3Q@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Add missing dependency on swig
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
X-List-Received-Date: Wed, 11 Jul 2018 19:16:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07/11/2018 05:20 PM, Martin Jansa wrote:
> Doesn't it add dependency on python as well?

It does as python is needed too.

> It was failing before RSS when swig-native was autodetected in sysroot:

RSS ?

> https://www.mail-archive.com/yocto@yoctoproject.org/msg38214.html
> https://lists.yoctoproject.org/pipermail/yocto/2017-October/038347.html
> IIRC it fails to build only when the Python.h is also missing on host,
> which makes it even worse.

Can you check if it still fails with this patchset ? I believe this
problem you linked is fixed in upstream now, but let's see. I could
never replicate the problem myself.

> On Wed, Jul 11, 2018 at 5:10 PM Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     The U-Boot build, in particular the pylibfdt, depends on swig-native.
>     Add the missing dependency.
> 
>     Signed-off-by: Marek Vasut <marex@denx.de <mailto:marex@denx.de>>
>     Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com
>     <mailto:alexander.kanavin@linux.intel.com>>
>     Cc: Otavio Salvador <otavio@ossystems.com.br
>     <mailto:otavio@ossystems.com.br>>
>     Cc: Richard Purdie <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>
>     Cc: Ross Burton <ross.burton@intel.com <mailto:ross.burton@intel.com>>
>     ---
>      meta/recipes-bsp/u-boot/u-boot_2018.05.bb
>     <http://u-boot_2018.05.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
>     <http://u-boot_2018.05.bb>
>     b/meta/recipes-bsp/u-boot/u-boot_2018.05.bb <http://u-boot_2018.05.bb>
>     index 37c21dcaa3..3cdec00cbd 100644
>     --- a/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
>     <http://u-boot_2018.05.bb>
>     +++ b/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
>     <http://u-boot_2018.05.bb>
>     @@ -1,4 +1,4 @@
>      require u-boot-common_${PV}.inc
>      require u-boot.inc
> 
>     -DEPENDS += "bc-native dtc-native"
>     +DEPENDS += "bc-native dtc-native swig-native"
>     -- 
>     2.16.2
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


-- 
Best regards,
Marek Vasut

