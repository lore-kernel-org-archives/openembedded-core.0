Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3923C6C154
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:24:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0U5O9uA022422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Jan 2019 21:24:10 -0800 (PST)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 29 Jan 2019 21:24:09 -0800
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190129225502.5698-1-alistair.francis@wdc.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <68446af8-8d58-7f1a-fadb-e7879091a1fa@windriver.com>
Date: Wed, 30 Jan 2019 00:24:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129225502.5698-1-alistair.francis@wdc.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] libgpg-error: Bump to version 1.35
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
X-List-Received-Date: Wed, 30 Jan 2019 05:24:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 1/29/19 5:55 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   .../{libgpg-error_1.33.bb => libgpg-error_1.35.bb}          | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/libgpg-error/{libgpg-error_1.33.bb => libgpg-error_1.35.bb} (92%)
>
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
> similarity index 92%
> rename from meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> rename to meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
> index 325529d149..9a822add32 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
> @@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
>   LICENSE = "GPLv2+ & LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                       file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> -                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=524d4e810c4dcdc38e4fa28e70a13bf8 \
> +                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=cd91e3ad1265a0c268efad541a39345e \


Please explain why the license checksum change in the commit log to save 
others from having to check.

../Randy

>                       file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7"
>   
>   
> @@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
>              file://pkgconfig.patch \
>   	  "
>   
> -SRC_URI[md5sum] = "680495572d5d4c700ea73a2f793ce531"
> -SRC_URI[sha256sum] = "5d38826656e746c936e7742d9cde072b50baa3c4c49daa168a56813612bf03ff"
> +SRC_URI[md5sum] = "2808a9e044f883f7554c5ba6a380b711"
> +SRC_URI[sha256sum] = "cbd5ee62a8a8c88d48c158fff4fc9ead4132aacd1b4a56eb791f9f997d07e067"
>   
>   BINCONFIG = "${bindir}/gpg-error-config"
>   


-- 
# Randy MacLeod
# Wind River Linux


