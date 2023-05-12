Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DCAC77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 11:50:42 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.22855.1683892236505665076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 04:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qI+wiA23;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f13ef4ad91so11472187e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 04:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683892235; x=1686484235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QsDYzyKDeE+UTTid9Kc58/0CQdNdqs4u3ey9y5gL7TE=;
        b=qI+wiA235qdQnyV+mfZ5MFEuKMXvhkmjaahWMVMYOO/4nKEk9GnMUfe+TWnMSccc4O
         tYIsm+We6hWjpHXNHTayaoXdL/HEXALdRj0VOa3l3c3yACeUgHGX/NH12Rr96w624KEE
         nrJM1s9Wo9iDgKhmYlw2xzffr9V4HDv3EN41Ehzqx2ylFNQI4LZ0VIOOCbLtpejgOPfg
         YfCFCjfyvtfavgsBEDpH7si3q1+kIcwUIzO67yl6CxwWylH/56w1+yjNH3Q+jBGNIi7G
         mqBeK5lPa52w9wv5jHwZuyye+VrcUKUHiWUyaM6viMzzWy/DYBfeUM0nqcMSNqfXd1mi
         40NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683892235; x=1686484235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsDYzyKDeE+UTTid9Kc58/0CQdNdqs4u3ey9y5gL7TE=;
        b=NB3IOXpdr4sUEa3EZMJD6r3XuDgt5Vp56YK2ozgyg8B+/+h+e+SlLDbWGQllhgMr2c
         8dommQZcxQPWH/ilsSCxLq3EN6n/sodKScv1fSz4vhlwSKfQEVTHnaLegB3xhU/RPuwx
         tXLTT9zD4EHuTOrAW/tbNvfubypHs0LD3J9tXrj9Irs3hLzFOwaYFMQa5BYos+f21sbI
         MNBxFGRAXyzXoA1Q8T7izeVQ5wB7avAXhUsmxYK/702nk9y7PqavcI1DoqCKvmYIukdZ
         l8n8WRsFAggOG6xUuMRkCbGl2ewU6tBusGptSmSQch738qOy7SP4J2wsxonsG8G8fevT
         c/Kg==
X-Gm-Message-State: AC+VfDzGac6TAHJIpYM7DIaBHGZK21Hk4nli/nYsaOHQk5tvYSvJTHIS
	mYMLkElgcFIG8TKIlT7EGvc+iV9ze/Iew9CZQ8Y=
X-Google-Smtp-Source: ACHHUZ64YG0zQ5coYfWjVeObVf9HZrm6LrfZ1UVXhpL/fBSnDeJnIzHqK+aHjwngtSYLO2WkmrxGEldkoMQC6Ey4sNU=
X-Received: by 2002:ac2:5212:0:b0:4e9:5f8e:315a with SMTP id
 a18-20020ac25212000000b004e95f8e315amr2707376lfl.65.1683892234332; Fri, 12
 May 2023 04:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230512100845.1243349-1-m.otto@phytec.de> <20230512100845.1243349-2-m.otto@phytec.de>
In-Reply-To: <20230512100845.1243349-2-m.otto@phytec.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 May 2023 13:50:23 +0200
Message-ID: <CANNYZj_SwhhW5j5kipYdSqJSJw7xDQnRQwoZSYzE=MNu9DhsLw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone 1/2] openssl: update from 3.0.8 to 3.1.0
To: Maik Otto <m.otto@phytec.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 11:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181180

Yocto stable branch policy does not allow major component updates
which introduce new features, it must be bugfixes only. Openssl 3.0.x
is an LTS release and will be getting updates for a few more years.
https://www.openssl.org/source/

Alex

On Fri, 12 May 2023 at 12:09, Maik Otto <m.otto@phytec.de> wrote:
>
> From: Randy MacLeod <randy.macleod@windriver.com>
>
> >From the NEWS.md file:
>
>   ### Major changes between OpenSSL 3.0 and OpenSSL 3.1.0 [14 Mar 2023]
>
>   * SSL 3, TLS 1.0, TLS 1.1, and DTLS 1.0 only work at security level 0.
>   * Performance enhancements and new platform support including new
>     assembler code algorithm implementations.
>   * Deprecated LHASH statistics functions.
>   * FIPS 140-3 compliance changes.
>
> Drop the upstreamed afalg.patch:
>    c425e365f4 Configure: don't try to be clever when configuring afalgeng
>
> Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../openssl/openssl/afalg.patch               | 31 -------------------
>  .../{openssl_3.0.8.bb => openssl_3.1.0.bb}    |  3 +-
>  2 files changed, 1 insertion(+), 33 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/afalg.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.8.bb => openssl_3.1.0.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta/recipes-connectivity/openssl/openssl/afalg.patch
> deleted file mode 100644
> index cf77e873a2..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/afalg.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Don't refuse to build afalgeng if cross-compiling or the host kernel is too old.
> -
> -Upstream-Status: Submitted [hhttps://github.com/openssl/openssl/pull/7688]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -Index: openssl-3.0.4/Configure
> -===================================================================
> ---- openssl-3.0.4.orig/Configure
> -+++ openssl-3.0.4/Configure
> -@@ -1681,20 +1681,7 @@ $config{CFLAGS} = [ map { $_ eq '--ossl-
> - unless ($disabled{afalgeng}) {
> -     $config{afalgeng}="";
> -     if (grep { $_ eq 'afalgeng' } @{$target{enable}}) {
> --        my $minver = 4*10000 + 1*100 + 0;
> --        if ($config{CROSS_COMPILE} eq "") {
> --            my $verstr = `uname -r`;
> --            my ($ma, $mi1, $mi2) = split("\\.", $verstr);
> --            ($mi2) = $mi2 =~ /(\d+)/;
> --            my $ver = $ma*10000 + $mi1*100 + $mi2;
> --            if ($ver < $minver) {
> --                disable('too-old-kernel', 'afalgeng');
> --            } else {
> --                push @{$config{engdirs}}, "afalg";
> --            }
> --        } else {
> --            disable('cross-compiling', 'afalgeng');
> --        }
> -+        push @{$config{engdirs}}, "afalg";
> -     } else {
> -         disable('not-linux', 'afalgeng');
> -     }
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.1.0.bb
> index 82f3e18dd7..b7251cb68e 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
>  SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
> -           file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
>             file://CVE-2023-0464.patch \
>             file://CVE-2023-0465.patch \
> @@ -21,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] = "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
> +SRC_URI[sha256sum] = "aaa925ad9828745c4cad9d9efeb273deca820f2cdcf2c3ac7d7c1212b7c497b4"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181175): https://lists.openembedded.org/g/openembedded-core/message/181175
> Mute This Topic: https://lists.openembedded.org/mt/98846329/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

