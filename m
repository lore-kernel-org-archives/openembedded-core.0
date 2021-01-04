Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.13814.1609769278970077718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 06:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=od28f5tC;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id b24so26115821otj.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 06:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1tBLSDz72bFcoGRiSFWqjoeGRLzNsJ5JQjTGzSX3KIc=;
        b=od28f5tCXvg0vyaP2NCty6DEKKjPhPVHBTAyVE3qDAU8O25FNt/NPRY82HyDzbQ2Bs
         o7UhfFmanIB2jn2OZZkwbEwQAntEHq1z0X++OgqVs6YIhIAXszdCrYYoXjDPcOO+LoVX
         fZ39jBYZpBtOZkZUKDbHEEfokkbCmTTAWH35OKlnjj4eMIRUZSO9RmmdbtV9YJ46jWsM
         jHkh+Xi4elrK5Pk3ea7e7KRyLsd80iinbdHM+WrbK2pCfHFt2QuXuV79E7c3kLA1uY83
         kOt8K9OspuGsHYaK6kruyPnz2oZhbOPlsqvV0BQHKOjd2LcZWcznn1eyZ1ku6em7MUwZ
         LOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1tBLSDz72bFcoGRiSFWqjoeGRLzNsJ5JQjTGzSX3KIc=;
        b=GaTjv/hx6TJoUNb9C0sDVDg0ldJzggil42j2b6yLIacdHMwVpymlMLu9NCpNiNOqyE
         EQDOpRNmEQKpxlzRCmLzfaOj+ulBlW7cEBGuNFffsOZ9rQm+VKyTzM3ISa/zXGfE6YDy
         Boq/+gi/+0OXuwY7jlknLtjn9FOckJg8YdGrcrYeSzsMCxc8/cHnyUk/IVUFLOJGPunU
         Lfw+W4lAZwtrZu+xt+Sa0xBy35wzZZ6OhIPzwy7VodOr8kZn5+PE7KaS1j1okEAlfzza
         PYPOk9TDiF8PXInkdgesQnKh7iI32+I5kQ1iGqZ9hWm77jvtuFXWgkQsTHUFPqTk8bLw
         AvkA==
X-Gm-Message-State: AOAM532lEpCk2QFcgdEx3d5NzZ9kp/dqgsu0gTx/cI5WJ79dIw8rfeoe
	dh5nnudvWeLLb/0UemFkJeE=
X-Google-Smtp-Source: ABdhPJz85MgeFOKT61oVccLGw/J0XMXSVbgHeoTf00kmLVslSqZ7dv6bnedYhq7ZeN9hyL20Erka9g==
X-Received: by 2002:a9d:1b29:: with SMTP id l38mr50724141otl.159.1609769278323;
        Mon, 04 Jan 2021 06:07:58 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id 63sm13455865otx.2.2021.01.04.06.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 06:07:57 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: support for building nativesdk of mingw
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Changqing Li <changqing.li@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEW.hacker@gmail.com>
References: <20210104081324.32745-1-changqing.li@windriver.com>
 <121a341052f289cb7d3233dcdcb1e62fc0473284.camel@linuxfoundation.org>
Message-ID: <4388e191-88a1-dd64-beb3-06b1abefd4e9@gmail.com>
Date: Mon, 4 Jan 2021 08:07:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <121a341052f289cb7d3233dcdcb1e62fc0473284.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 1/4/21 5:40 AM, Richard Purdie wrote:
> On Mon, 2021-01-04 at 16:13 +0800, Changqing Li wrote:
> * add support for mingw32
> * Engines are installed in a slightly different path, which is
>    urgly, patch it to make the path shorter
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   ...ile.tmpl-don-t-add-prefix-for-libdir.patch | 32 +++++++++++++++++++
>   .../openssl/openssl_1.1.1i.bb                 |  9 ++++--
>   2 files changed, 39 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssl/files/0001-unix-
> Makefile.tmpl-don-t-add-prefix-for-libdir.patch
>
> diff --git a/meta/recipes-connectivity/openssl/files/0001-unix-
> Makefile.tmpl-don-t-add-prefix-for-libdir.patch b/meta/recipes-
> connectivity/openssl/files/0001-unix-Makefile.tmpl-don-t-add-prefix-
> for-libdir.patch
> new file mode 100644
> index 0000000000..028431b1b2
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/files/0001-unix-Makefile.tmpl-
> don-t-add-prefix-for-libdir.patch
> @@ -0,0 +1,32 @@
> +From 8fe5c9421acfaff35b637e7ad55d1df598bb7081 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 22 Dec 2020 09:22:10 +0800
> +Subject: [PATCH] unix-Makefile.tmpl: don't add prefix for libdir
> +
> +we pass libdir to Configure, don't use prefix again to
> +avoid engineer dir set to:
> +/opt/poky/3.2+snapshot/sysroots/x86_64-w64-
> mingw32/usr/opt/poky/3.2+snapshot/sysroots/x86_64-w64-
> mingw32/usr/lib/engines-1_1
> +
> +Upstream-Status: Inappropriate[oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + Configurations/unix-Makefile.tmpl | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-
> Makefile.tmpl
> +index bbafb98..eecb63e 100644
> +--- a/Configurations/unix-Makefile.tmpl
> ++++ b/Configurations/unix-Makefile.tmpl
> +@@ -244,7 +244,7 @@ LIBDIR={- our $libdir = $config{libdir} || "lib";
> +           File::Spec::Win32->file_name_is_absolute($libdir) ? "" :
> $libdir -}
> + ENGINESDIR_dev={- use File::Spec::Win32;
> +                   our $enginesdir =
> +-                      File::Spec::Win32->catdir($prefix,$libdir,
> ++                      File::Spec::Win32->catdir($libdir,
> +                                                 "engines-
> $sover_dirname");
> +                   our ($enginesdir_dev, $enginesdir_dir,
> $enginesdir_file) =
> +                       File::Spec::Win32->splitpath($enginesdir, 1);
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> index c63ba3c8e7..9465166ab1 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> @@ -22,6 +22,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-
> ${PV}.tar.gz \
>   SRC_URI_append_class-nativesdk = " \
>              file://environment.d-openssl.sh \
>              "
> +SRC_URI_append_mingw32_class-nativesdk = " \
> +           file://0001-unix-Makefile.tmpl-don-t-add-prefix-for-
> libdir.patch \
> +           "
>   
>   SRC_URI[sha256sum] =
> "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
>   
> @@ -116,6 +119,9 @@ do_configure () {
>          mingw32-x86_64)
>                  target=mingw64
>                  ;;
> +       mingw32-i686)
> +               target=mingw
> +               ;;
>          esac
>   
>          useprefix=${prefix}
> @@ -198,8 +204,7 @@ FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf
> \
>                         ${libdir}/ssl-1.1/openssl.cnf* \
>                         "
>   FILES_${PN}-engines = "${libdir}/engines-1.1"
> -# ${prefix} comes from what we pass into --prefix at configure time
> (which is used for INSTALLTOP)
> -FILES_${PN}-engines_append_mingw32_class-nativesdk = "
> ${prefix}${libdir}/engines-1_1"
> +FILES_${PN}-engines_mingw32_class-nativesdk = "${libdir}/engines-1_1"
>   FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
>   FILES_${PN} =+ "${libdir}/ssl-1.1/*"
>   FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-
> setup.d/openssl.sh
>
> I'm not really sure we want this kind of patch in OE-Core, it might be
> more suited to meta-mingw. I suspect it will be a bit of a maintenance
> nightmare there too though. Adding Joshua to cc to see if he has any
> thoughts...

Can you provide some background on why openSSL is needed in the SDK? It 
would help with making a decision.


>
> Cheers,
>
> Richard
>
>
