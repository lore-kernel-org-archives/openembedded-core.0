Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981DAC3DA49
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 15:35:47 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.36924.1722180938669049526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 08:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OpFQnoit;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd530a4eso4216866e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722180937; x=1722785737; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JJTZN65la+aBIWfLAnB6cBGqA3TVKmkyiG7UAYbVye4=;
        b=OpFQnoitwuiV9HbUCNe9Vj/ee5Vn1FHpFCErf3lwtsNJBPynGOS0AHgqhzSIuJf1VN
         VuoclswRv8Fs1EAk3LZUuTOtPHGWRGFJFAnXhgte4Sz48T58AM7CWYpcxG1Sk4RwwSkq
         /VPENCdpnzKfm/HWgvpixgaemV8bATV5xigCkhCC168GbMRBtlF715Y6Gk/VqZ73m0ww
         3kdYbPeOl0bDqRjgYN5AFslrKao6qi9+bcmZmINW++HNCTxDpZiHMIi/vWtmahXDOQlj
         y/zqb4qW9bOL1DwZzzopPqr0uKe1Q076CufoASm6/i160gXcv/oaaZ2q1dhkI3QfRS79
         Uhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722180937; x=1722785737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJTZN65la+aBIWfLAnB6cBGqA3TVKmkyiG7UAYbVye4=;
        b=hsrnNq4pb6BME5S9ENRjCovOJndpE71IdVc6/sw7hyoOSXKQr1IShdi7HRQPKmq+KG
         mxNQt1a2D3pPtub+1xaG3/BwG4sinmHO3E7fhqpmKp6eYvqgXDwCm/dbCk08cWLYhY8H
         7doAelLhTjfudmn8ZIbOSNBBvWqJzAh1mm13PWPPm729Z6DeItcc+EJ6VJqQH1Cgdscd
         DZCiYNOQaeUoGMktSyYX3NlcCdajmvjrJh+ut4zkZqDbERuX39aDoIgjb8S+Astd9t5Y
         i8DsvdCVBizx9U4b9sgfZnidOUww6F/7Z034qB5rmblIKcegiMsyFLlm/uqe/f4lwy6e
         fzkQ==
X-Gm-Message-State: AOJu0Yyq2QyXQsZQAbplmaNRmrtk5uvNRqrju86ePtJ77T6A0RigRNEe
	bnBzx1I2LZo/D/jxXkluhz36AzcEtXPLwAPpBxOckrtnpw3Z+2ZKrwcLUjIVdqNBhRfD38up2vZ
	LhGGi1uwyWJHQz+i/eGuOuj7eD0Q=
X-Google-Smtp-Source: AGHT+IEip9gCTJdXq7ZCNcZKH+H0MEBskM0BCpQ1aFl3fg4/x43NI4fEi74jIcbghfuZkemE85PVH69USkVaIB968l0=
X-Received: by 2002:ac2:5045:0:b0:52c:d9a3:58af with SMTP id
 2adb3069b0e04-5309b2d7ef1mr3236452e87.49.1722180936396; Sun, 28 Jul 2024
 08:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240724145319.1619444-1-troth@openavr.org>
In-Reply-To: <20240724145319.1619444-1-troth@openavr.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Jul 2024 17:35:28 +0200
Message-ID: <CANNYZj_bSfAorp5e9pWKODBe7xB0bc0vhVMhcHpAu5=rPubQPQ@mail.gmail.com>
Subject: Re: [PATCH] ca-certificates: update 20211016 -> 20240203
To: "Theodore A. Roth" <troth@openavr.org>
Cc: openembedded-core@lists.openembedded.org, 
	"Theodore A . Roth" <theodore_roth@trimble.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 15:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202570

This unfortunately made oe-core master before I had the chance to ask:
how was the SRCREV determined? There is no '2024023' tag in the repo,
so where did the tag and the hash come from?

I'd appreciate if you send a followup patch including the relevant
links as a comment just above SRCREV line for future
reference/updates.

Alex

On Wed, 24 Jul 2024 at 16:53, Theodore A. Roth <troth@openavr.org> wrote:
>
> The 20240203 version is the same as used in Ubuntu >= 24.04 and Debian
> Trixie (testing).
>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> ---
>  ...mozilla-certdata2pem.py-print-a-warning-for-e.patch | 10 +++++-----
>  ...ca-certificates-don-t-use-Debianisms-in-run-p.patch |  6 +++---
>  ...ficates_20211016.bb => ca-certificates_20240203.bb} |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
>  rename meta/recipes-support/ca-certificates/{ca-certificates_20211016.bb => ca-certificates_20240203.bb} (98%)
>
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
> index 5c4a32f526..78898f5150 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
> +++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
> @@ -19,7 +19,7 @@ diff --git a/debian/changelog b/debian/changelog
>  index 531e4d0..4006509 100644
>  --- a/debian/changelog
>  +++ b/debian/changelog
> -@@ -37,7 +37,6 @@ ca-certificates (20211004) unstable; urgency=low
> +@@ -120,7 +120,6 @@ ca-certificates (20211004) unstable; urgency=low
>       - "Trustis FPS Root CA"
>       - "Staat der Nederlanden Root CA - G3"
>     * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
> @@ -37,9 +37,9 @@ index 4434b7a..5c6ba24 100644
>   Build-Depends: debhelper-compat (= 13), po-debconf
>  -Build-Depends-Indep: python3, openssl, python3-cryptography
>  +Build-Depends-Indep: python3, openssl
> - Standards-Version: 4.5.0.2
> + Standards-Version: 4.6.2
> + Rules-Requires-Root: no
>   Vcs-Git: https://salsa.debian.org/debian/ca-certificates.git
> - Vcs-Browser: https://salsa.debian.org/debian/ca-certificates
>  diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
>  index ede23d4..7d796f1 100644
>  --- a/mozilla/certdata2pem.py
> @@ -66,8 +66,8 @@ index ede23d4..7d796f1 100644
>           if not obj['CKA_LABEL'] in trust or not trust[obj['CKA_LABEL']]:
>               continue
>  -
> --        cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
> --        if cert.not_valid_after < datetime.datetime.now():
> +-        cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
> +-        if cert.not_valid_after < datetime.datetime.utcnow():
>  -            print('!'*74)
>  -            print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
>  -            print('!'*74)
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
> index 4a8ae5f4b5..1feefeb96a 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
> +++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
> @@ -21,14 +21,14 @@ Index: git/sbin/update-ca-certificates
>  ===================================================================
>  --- git.orig/sbin/update-ca-certificates
>  +++ git/sbin/update-ca-certificates
> -@@ -191,9 +191,7 @@ if [ -d "$HOOKSDIR" ]
> +@@ -202,9 +202,7 @@ if [ -d "$HOOKSDIR" ]
>   then
>
>     echo "Running hooks in $HOOKSDIR..."
>  -  VERBOSE_ARG=
>  -  [ "$verbose" = 0 ] || VERBOSE_ARG="--verbose"
> --  eval run-parts "$VERBOSE_ARG" --test -- "$HOOKSDIR" | while read hook
> -+  eval run-parts --test "$HOOKSDIR" | while read hook
> +-  eval run-parts "$VERBOSE_ARG" --test -- "$HOOKSDIR" | while read -r hook
> ++  eval run-parts --test "$HOOKSDIR" | while read -r hook
>     do
>       ( cat "$ADDED"
>         cat "$REMOVED" ) | "$hook" || echo "E: $hook exited with code $?."
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
> similarity index 98%
> rename from meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
> rename to meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
> index 99abe60613..b198ea77a9 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
> @@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
>  # Need rehash from openssl and run-parts from debianutils
>  PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
>
> -SRCREV = "07de54fdcc5806bde549e1edf60738c6bccf50e8"
> +SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
>
>  SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
>             file://0002-update-ca-certificates-use-SYSROOT.patch \
> --
> 2.34.1
>

