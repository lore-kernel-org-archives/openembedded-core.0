Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 10F207D3C9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 14:38:19 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z9so4515139pgu.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 07:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=iGeUgXChpEbIJgb/xhYTWCY1mfq58FPA3e0isHJdXlo=;
	b=udbWWiyoXs/+r2pmve7vjQJcEJcyJR/Nv6weRlg2jn8fM5IBGK/nrJ9lMCY6p+G5Np
	u4V+RfAdk+7dA4MXPu3+KnL11gcFabTjWUtFAIhQ02cA9ESl2z33PKkYbU5VyElLtLMG
	JHsfAAIiOVh7V8zZITJIX2kj2mqib3oR6zBGFtVcIR8+bfgs4+pbxw/4NuGApFbYrg1N
	kCXC++7OYwCsITII3NA5J2JOCanFi+/6Lg7EI2dUlwCTpvs29Xyt+g31BNxwIV7iz0O/
	nPidjtDIwpIcOZ53B5iQszF9/LtNOWe4lzFEpFiQPI3lscOMTSzMPcnGVk9tkhn9iVhs
	zzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=iGeUgXChpEbIJgb/xhYTWCY1mfq58FPA3e0isHJdXlo=;
	b=eLiS8oUpHqN2xTfdzVTWmaqbWja+lN68hbLagA00AP5FzJFz/urXRqTE4gB+H6DlSR
	BPIjls/uuWsCPYixO/t8ZoTjxV8//l8SLASE9BVS/zrZf6+UOTAoQbeyoOSoCyx/JlHd
	ioWOpiyde7TDALiTUT+FyEZtqYHaR8VQOOXeVJ3dkagmCFF5G8L86CM70WZjaDCVlJu9
	fC5E8SXd/CxkpaDDB7HnoUEL8HERKA8/AgFPF+dubYiVq14LHvnQ7HSUISqglHH39wI6
	1SqsvtIG5YPcwssRyaW6fWJGlgM45A5jyELXVZpvCfYVq+1z++RKNydJThu3/N6gecNP
	0WYQ==
X-Gm-Message-State: APjAAAVxb/B4kcQpDrbXL0zieAzxgdnH+TRlugAY6lRUlFduLKHSBn2l
	CLVAmdv4VLlQydGSuc2cgtvLCLMN/xw=
X-Google-Smtp-Source: APXvYqxutLpUnRz3MhEThIXQuDeWGZJX87OKa5MQBAGMghx1GtB6Ex+Vw58rptqTOEEjwWxonNf3iw==
X-Received: by 2002:a63:f44:: with SMTP id 4mr26238528pgp.324.1554734300534;
	Mon, 08 Apr 2019 07:38:20 -0700 (PDT)
Received: from [10.240.241.171] ([116.212.180.67])
	by smtp.gmail.com with ESMTPSA id
	d8sm27384316pgv.34.2019.04.08.07.38.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 07:38:19 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190408120856.18831-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <73e3496c-7f9a-28fd-e1f2-426a847fcfe5@gmail.com>
Date: Mon, 8 Apr 2019 20:08:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408120856.18831-1-bunk@stusta.de>
Subject: Re: [PATCH] gnutls: upgrade 3.6.5 -> 3.6.7
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
X-List-Received-Date: Mon, 08 Apr 2019 14:38:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/8/19 5:38 PM, Adrian Bunk wrote:
> This is a new upstream release from the same stable branch
> bringing new features and bugfixes (including CVE fixes).
>
> COPYING changed http -> https.
>
> configure no longer has a --without-libunistring-prefix option.

Here is the same comment post earlier:

this was regressing when attempted to be removed last time see
https://git.openembedded.org/openembedded-core/commit/?id=d8d32b5a58eea161711e3539c4530682de551ede

Does it work when libunstring is installed on build host now ?

>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb}            | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb} (88%)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.5.bb b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
> similarity index 88%
> rename from meta/recipes-support/gnutls/gnutls_3.6.5.bb
> rename to meta/recipes-support/gnutls/gnutls_3.6.7.bb
> index dfc35079da..e05dc2b57d 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.5.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
> @@ -9,7 +9,7 @@ LICENSE_${PN}-bin = "GPLv3+"
>  LICENSE_${PN}-openssl = "GPLv3+"
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
> -                    file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://doc/COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
>                      file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
>  
>  DEPENDS = "nettle gmp virtual/libiconv libunistring"
> @@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>             file://arm_eabi.patch \
>  "
>  
> -SRC_URI[md5sum] = "3474849e1bbd4d16403b82ab2579000b"
> -SRC_URI[sha256sum] = "073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35"
> +SRC_URI[md5sum] = "c4ac669c500df939d4fbfea722367929"
> +SRC_URI[sha256sum] = "5b3409ad5aaf239808730d1ee12fdcd148c0be00262c7edf157af655a8a188e2"
>  
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
>  
> @@ -44,7 +44,6 @@ EXTRA_OECONF = " \
>      --enable-local-libopts \
>      --enable-openssl-compatibility \
>      --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> -    --without-libunistring-prefix \
>  "
>  
>  LDFLAGS_append_libc-musl = " -largp"


