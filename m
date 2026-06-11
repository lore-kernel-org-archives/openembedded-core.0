Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCE9CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:54:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41031.1781168036114316866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gRsc/P5c;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b915ded5so68062495e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781168034; x=1781772834; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUmoOREao5i2Q5ElEeGeJLFcHLJE3iYrYFN737aELTU=;
        b=gRsc/P5coEsa6erZLJxWQiDIAgsmvDvwOxOLbBX34p9SCEr3IpjXEY4yyg2YKehk70
         KMukhOyE+jga1S2OqYE3yVTL3XBWoBB/HHUvMDsBObWPVmh2XFMwBkFo806YospxWgd3
         fVhMOxcHbHa8SVKYEvMzgHcIOnvrsT/n6Su9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168034; x=1781772834;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUmoOREao5i2Q5ElEeGeJLFcHLJE3iYrYFN737aELTU=;
        b=qpNl2QdehHuhB+aGYSu9W82124g0WnLQ3zQdA0pU5FdeFAKrrhW/YMvvLfOtwRy+yE
         KlT56z3mVvn8jKo1dM3d0dpayD/2q5hpwg6GQNKxhVZx5mmwwJGH4S+iRFxG81V3gTx+
         uEtm7W50AKmVb0O/AkovXqLdz5VfdqtVeRb9DANjM1h1A/ggq7siq5L6zJpmg7+iv/DW
         yCWDG+BYGISslVZSk89PPdcAJQ9Rb0gSaWPkSfhnlcRF6rfGRDRK/z4TByCrxP+G+GPK
         44WooUFzV/7f8wvK8wminCLeoGdjSO5Tg2kxReofHZ/pfEI7s/3uaLfsMx9nJPPwllfp
         Rc4A==
X-Forwarded-Encrypted: i=1; AFNElJ+p73Pfj7rHuRHfrZatPaq03xSgYrq78qgRGaHbEfwIwki87H3bpZVEFJhxivtnCBcrD4gF0GO+KCmgE2X2mhScxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6hdI3ilzzlmqVguQxBjdXd/b0FkYq+rEi0cp65cMb2dduYBRO
	uQ5cWMCkYGKwrKMIhNMBdXVL/HDGhFdEsGvq5rq+pCRthPaJoVoVFic/EF8lony2DA==
X-Gm-Gg: Acq92OE2Vm2LnPgIHjFviL9SIu8aRE5g++3IOpGbr54bM3DJ1ZjAnMCrxJm1PkBGfH+
	rYOWhFL3gVGoJanVzyyX4kxlXUpE+vKUbiq1pBNLhYSVg4h8f4e6QFWttxUwm8SmWULAMDJq9gV
	7OeAPSLaOwde5C2H7jknPKwxdBer9pP6dBPPNeZQd9RB5F10EBdtK0mXufDCDAq7t+LvgCcf24d
	Ow57HZFAeckq2D6908o/Rj/7aH9e7pQFCgKclV5jEAszHTCfYBEIYEs5L+LywyeEXL0IzcAYGao
	dz5962ZMin3eqDT2lWvvRDxvP08+kcxqBhopHgLJMEoKLc00FEfUiCrl66/X6A2PWOVPaEp42p+
	BZZg3R0tFwOR0JlTvOMI7uR84LnHUDXUA6IcSShr0dSJ6/1SULXK2PRicBgLbazuGdhuE5SWm6Q
	gz1wmdZXBFUw8eOC24o5rUC8ismOZbciVHcovF3mMCz9GYocXYlZmwMTag5cT13VTDVIBnns9Td
	qFNxpY1+yA6YWRU93Ox
X-Received: by 2002:a05:600c:c043:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-490e5611c18mr14602975e9.13.1781168034338;
        Thu, 11 Jun 2026 01:53:54 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2cf5537sm57578495e9.9.2026.06.11.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:53:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 10:53:53 +0200
Message-Id: <DJ63DEDEBWNO.CYD3H5RSNOQW@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
Subject: Re: [OE-core][scarthgap][PATCH] libgcrypt: Fix CVE-2026-41989
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260520090433.3071067-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260520090433.3071067-1-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238433

Hello Hugo

This patch is included in version 1.12.2 of libgcrypt
However, as far as I can tell, wrynose uses version 1.12.1 and no
upgrade to 1.12.2 was submitted

as such, this patch can not be accepted as-is in scarthgap, please
submit this patch (or a version bump) to wrynose first, then ping here
for inclusion

thanks a lot
Jeremy

On Wed May 20, 2026 at 11:04 AM CEST, Hugo Simeliere via lists.openembedded=
.org wrote:
> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witeki=
o.com>
>
> Pick patch from [1] as 1.10.x upstream backport of [2] mentioned in Debia=
n report in [3].
>
> [1] https://dev.gnupg.org/rC6da0152595aabb569c88c6571d2fdf68e112ee45
> [2] https://dev.gnupg.org/rC2d3d732c9bf87cc10729f69678dd9e6862f99fa3
> [3] https://security-tracker.debian.org/tracker/CVE-2026-41989
>
> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource=
@witekio.com>
> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
> ---
>  .../libgcrypt/files/CVE-2026-41989.patch      | 45 +++++++++++++++++++
>  .../libgcrypt/libgcrypt_1.10.3.bb             |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.p=
atch
>
> diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch b/=
meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
> new file mode 100644
> index 0000000000..d9bc2d1844
> --- /dev/null
> +++ b/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
> @@ -0,0 +1,45 @@
> +From b5ee371e621435c18a9a70e4982741ab65a019e1 Mon Sep 17 00:00:00 2001
> +From: NIIBE Yutaka <gniibe@fsij.org>
> +Date: Fri, 10 Apr 2026 16:58:57 +0900
> +Subject: [PATCH] cipher:ecc: Fix decoding a point on Montgomery curve.
> +
> +* cipher/ecc-misc.c (_gcry_ecc_mont_decodepoint): Fix the padding
> +mistake and add updating RAWMPILEN.
> +
> +--
> +
> +Reported by Calif.io in collaboration with Claude and Anthropic
> +Research.
> +
> +CVE: CVE-2026-41989
> +Upstream-Status: Backport [https://dev.gnupg.org/rC6da0152595aabb569c88c=
6571d2fdf68e112ee45]
> +
> +GnuPG-bug-id: 8211
> +Fixes-commit: bbe15758c893dbf546416c1a6bccdad1ab000ad7
> +Suggested-by: Bronson Yen <bronson@calif.io>
> +Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
> +(cherry picked from commit 6da0152595aabb569c88c6571d2fdf68e112ee45)
> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
> +---
> + cipher/ecc-misc.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/cipher/ecc-misc.c b/cipher/ecc-misc.c
> +index 6796ba2c..fd429a08 100644
> +--- a/cipher/ecc-misc.c
> ++++ b/cipher/ecc-misc.c
> +@@ -438,7 +438,10 @@ _gcry_ecc_mont_decodepoint (gcry_mpi_t pk, mpi_ec_t=
 ec, mpi_point_t result)
> +         *--p =3D *buf++;
> +=20
> +       if (rawmpilen < nbytes)
> +-        memset (rawmpi + nbytes - rawmpilen, 0, nbytes - rawmpilen);
> ++        {
> ++          memset (rawmpi + rawmpilen, 0, nbytes - rawmpilen);
> ++          rawmpilen =3D nbytes;
> ++        }
> +     }
> +   else
> +     {
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.3.bb
> index 3d49d586bb..44e4a39392 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.=
tar.bz2 \
>             file://no-bench-slope.patch \
>             file://run-ptest \
>             file://0001-Fix-building-error-with-O2-in-sysroot-path.patch =
\
> +           file://CVE-2026-41989.patch \
>             "
>  SRC_URI[sha256sum] =3D "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60a=
f2a9eadc2a3272aa"
> =20


