Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web12.13625.1599658023335788736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 06:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4BmjVD5mCTz1rvBb;
	Wed,  9 Sep 2020 15:27:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4BmjVD5TPMz1qyY3;
	Wed,  9 Sep 2020 15:27:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id iFVA55bFGra1; Wed,  9 Sep 2020 15:26:59 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Wed,  9 Sep 2020 15:26:58 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 9E2754540547;
	Wed,  9 Sep 2020 15:26:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjJaU_NnT2Si; Wed,  9 Sep 2020 15:26:55 +0200 (CEST)
Received: from [192.168.178.64] (paperino.fritz.box [192.168.178.64])
	by babic.homelinux.org (Postfix) with ESMTP id 9690645404D8;
	Wed,  9 Sep 2020 15:26:55 +0200 (CEST)
Subject: Re: [OE-core][dunfell 17/25] libubootenv: uprev to v0.3
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1598810890.git.steve@sakoman.com>
 <0fa520f479d83cb35a5c9c1d0b468ab5e1928c98.1598810890.git.steve@sakoman.com>
From: "Stefano Babic" <sbabic@denx.de>
Autocrypt: addr=sbabic@denx.de; prefer-encrypt=mutual; keydata=
 mQGiBEfdB5IRBADkpYcnh2BoAkGD5p186ysEkWlcp5DU07m7BKzvkEMRhFjeFUOU0klKNmh0
 ZM6rKpYpAYPYBm9YahMyqvj9DmLrZ4yfJ5MssvW9SRETmHpva+h1rN+DzmEcwrqZmLG1JWGy
 LA5ruJaFSzxJHBoROoog1NDMbNDB8A9F7VKrePfkVwCgmODpW/uh2IuMYLVidzDeuvo7alED
 /iV8rwU7C+eBcKy2htuDsEmsqlkBxIDM7IO6h5XxdyqbZOYizuBP3Ksb6xK54weEaB5aQs7S
 8N9Soi0p1Xh0LMWj6PBCzTC4LF+OCGEMBPc6bBHNzivChgztJlUMioCDSVpOXB/QpBaK302G
 yP5WdmcB1Jn6neq/YRlxHN38MV2yA/46jnzeUotL9LliVZKA/ql4GmyWg2Ae1BUiCqEJQNwl
 knGJOmIS4uABLArB5HjsfDU5hA9FORaNGCIiZlezBkZ3JXA2uQMQhfgqBXrZt4j1fcw9I7E+
 7IZ2kSCeTPZFLd5FiGQPDOm3Z9eHrpK6pmBGMeBG0pDgUEbN9awyLNBLj7QeU3RlZmFubyBC
 YWJpYyA8c2JhYmljQGRlbnguZGU+iGMEExECACMCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIX
 gAUCT9deSgIZAQAKCRD09WXkmmjvppF1AKCRl8d49K4yxWzdBVRTTWG55cyo/gCfRD1RAttl
 R1ofs2wGLHNtXousyL25Ag0ER90HmBAIAIFfX4bKnOmCyB3nPh+jbXZuBSMZTuyDEnguRxl5
 N8Q0ayofQwucCBjXYv65sQ9Rq6FNhEnWqUZBu8A5CwvSakOFOGNC5ta/8VxVRLh0Z0ZTgEep
 SKiPonJyacCbmgWDECdVrKowV7QB9be3Wu67uAZ74rPw2Kd7f0FKnL3djvVRMaBWFIpyQ6SE
 bGOCJjhRQ5L1pIM1Soko+reU7eO+1g6IBw6YkFJisdQE6fzTwaSqUKPPsQLz/W03invQltOb
 Eg7ZwtFs0DFonr1DMm57ksiEhW6SN1wylRO/JzRYG1Qe7u1EVln6iV3ilBvbbfkyRssk4/0e
 kicpSnQknA72YOMAAwYH+QGpAiQ4hAMHrp1bUrtyGXYdeQpYufIZAM4etOnBy/G+e1nfu6y+
 jH4SN9sVK7bwBBAbhEJqkqR5LVsFIRapThJQOWB11rQxLpwkBU9wao/pRM+o95ujGo32WUzf
 wWrzWrkTDy7vMCZuUOLVi4n1GZlUAwpG4rzb6UxPC6GWymkVWGgXp1NC58og5i3Y+rKT7+Xi
 XT2BtvC6PDepoH4JhD+9OkHQO6UfTxPSmtgNbTgtl6L6tj+bm5dOHgkPJFMkEiG8qhUZYQzb
 bYz37orRbA72M2bxK76e9QKn0mVu+d/YCd8wRcvvJbGsozpzcxPvD5Wy5RNJCES8McPtAseU
 tMeISQQYEQIACQUCR90HmAIbDAAKCRD09WXkmmjvpv+3AJ9RakBsH1j0X/Kxp6t2lf0VUfS2
 qACfZ+J6ktk8PKNuyHf0J/I0mbCrhV4=
Message-ID: <3a071f02-6a1c-fead-0eac-b6076639dba2@denx.de>
Date: Wed, 9 Sep 2020 15:26:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0fa520f479d83cb35a5c9c1d0b468ab5e1928c98.1598810890.git.steve@sakoman.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Hi Ming,

On 30.08.20 20:16, Steve Sakoman wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> Update libubootenv to the latest 0.3 release, which comprises the
> following commits:
> 

Thanks for this, but I released a 0.3.1 afterwards to include somefixes:

- Fix file reading/writing when the environment is in EEPROM
- Fix regression in UBI volume support

Please update to this version, thanks !

Best regards,
Stefano Babic

> ```
> 1efed83 Increase max length for device name
> 6f4fc1c uboot_env: Use canonicalized pathname when reading device
> 23b3086 Fix bug introduced by commit 52a70114
> ed1a53e Dont store to device if no value changes
> 4a0a466 Merge pull request #7 from TomzBench/cmake-fix
> 6117831 Added Coverity badge
> 49372a1 Fix coverity #293496
> 69a6819 Fix coverity #293503 and #293507
> 258bf52 Fix coverity #293501
> aa52e61 Fix coverity #293505
> 52a7011 Fix coverity #293504 and #293506
> e822218 Fix coverity #293495 and #293497
> 23b305f Fix coverity #293499
> 25ef1f6 Add coverity setup for Travis
> 41b5188 fixed install for static target, fixed BUILD_DOC acknowledgement
> 86bd30a Restore ability to feed script file via stdin, using `-s -`.
> c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP
> f4b9cde Allow negative offsets
> 45bf92a Detect sector size if not found in config
> 9f59db6 uboot_env: remove unused variables
> 65d243e README: libubootenv is now in oe-core
> ba952d0 BUG: variable lists not released in close()
> 690f868 Variables are not removed when loading from file
> 9e3586a Make sure there's no file descriptor leakage in case of error
> 03647c4 Check config file defines a non-zero Sector size
> 3b2d4f1 Check environment size from fw_env.config
> 879c073 Do not hardcode path for install
> d9c639b libubootenv: add pkg-config support
> cc628ee libuboot: wrap libuboot in extern "C" for C++
> ```
> 
> Also add u-boot-default-env to RRECOMMENDS since
> /etc/u-boot-initial-env is being referred in libubootenv source, and
> turns libubootenv's PACKAGE_ARCH to be MACHINE_ARCH since
> u-boot-default-env is a machine-arch package.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 02d55cd35aac15095fc44f0cf8f9e7a71638f485)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb}      | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (82%)
> 
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> similarity index 82%
> rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> rename to meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> index ea29b668e8..47e64f9114 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> @@ -10,9 +10,8 @@ LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
>  SECTION = "libs"
>  
> -PV = "0.2+git${SRCPV}"
>  SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> -SRCREV = "f4b9cde3815abe84a98079cedd515283ea08c16b"
> +SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -24,4 +23,8 @@ DEPENDS = "zlib"
>  PROVIDES += "u-boot-fw-utils"
>  RPROVIDES_${PN}-bin += "u-boot-fw-utils"
>  
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
> +
>  BBCLASSEXTEND = "native"
> 
> 
> 
> 


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================
