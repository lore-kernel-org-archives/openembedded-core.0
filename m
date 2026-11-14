Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11236.1794664948494477149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 06:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Iro7PF1X;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so26889355e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 06:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794664946; x=1795269746; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Al1TCSL+gz7dgvoEj6wzusz53MKmH8t70pdSgS+X/wc=;
        b=Iro7PF1XTO04wPNp2HoWQWWSNhz75oTPQJFC/yzVCC/ZG2iX/q/ZW4qm62ktHoTNHO
         hTTycwafLm0Ar1KU/xALi1n2ZlR7ablxmzFI5rohlIME6Y8VVWe1rZIQxISBeP2UQMgr
         Cu+X6VkLp7S4687Wx6vPdwxu0Jgxokzok1IDMcGo5R1VC95+EiX2BFGAGvhkg/5Q340g
         5qFH4vv+aTKLtO9H9fySJxWGPpVO4OmNoMtbI8cSegBi7PBuSr9l/pgtq6Inn8tx8JRk
         Z9O7Y/EANT8+sm+/bXwMp5uCc3Swif7mtNR45MQDoNoSgluZi2DinuNRVjOzGZZOnZKa
         AT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664946; x=1795269746;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Al1TCSL+gz7dgvoEj6wzusz53MKmH8t70pdSgS+X/wc=;
        b=jTggODVnYbRgdua7fOiCCKJ7EoAuJr/2bMVw9w22Z3DvcYPvFUzjjwZ/1yJNRrwh5g
         6LycHSt5ADBYnEKV/54bjnjatfRmZBL4d3jm1YI4bCUntNLnh8WSR+HxFxgU9CvPY6i1
         JSyx50vPcJyMJ3Ki+D/xVtaa7r3vtocdMTfpYcuQPpVQuBycHGUnSywDI3DV1ssSmrIB
         T4yIWmiO5F/7PmdmNEXuwseaHQFQ1+v7XGGdlgvbhmnd9t+58VhQl+6gs63x9IsxWs3H
         0vIaLnkcYFP6EQWtYNhpQdOmaPwzOikNYKZrWIPJNnK/61QBynKnSUcS6bRJFw1iIe6j
         GEHw==
X-Forwarded-Encrypted: i=1; AL+hErEDfA6SI44q3p3HAhd8LydyFLSQ4dOkdmZQ8tO/uivMxObxk/C82mywJxZLL4NlYmWkZytxL5ww1FaHX1L+rJLBiA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+/9JP/wN6oFHP2j6LhZTwm2slPsQO4OdYumv9Hl1Yd/gw8xG8b
	MECFq018mzt5nRR7Nxy+EBX4HwAmzdDpLxKPnIsjHEIK8tsIkXMe+Az989twHW7wBQc=
X-Gm-Gg: AYBFou17qDhU27S8SawtARCevR1kWMe5v7wdECB/2aEnZGhx05hHYIRkYzEd/NXBhoB
	59AD4eTYnCscv49GYJVVO9DAcIKXKgGx5IInrLt+7AtOE0PqKBqwZrRTJvaAixWkPOeZzNFHXCl
	3sQ5J1PR0XaUu5WAh8LKMmF/n/RUfxPbK4U7USyfjjUmk15aQq+gX4ZWQIScHx5tpUeZsSccJcK
	VAb/XS7y1ZB3D72wZyRWse66i7OQrTCVjG1XpJ/0sUVMHdrf7H06+qbF+SH/CUCI9pDoLD47XHJ
	wyI7r2f7PgB5B+2mI0ce7mWUQjRQGQj8w0Nb/j45CW8Ak/FVf+YWuCLYJhYWZJWouagQA8WTCve
	yRV/fmhXR9DyL+77CjzHk6GfI5THHa73IMiJ/Hja/+tRPF1fPFv4WlG1NyjQuCcqwqwAWicfzk7
	Napigt/YbpkGDUuKhBE3FSs3I/5mXtG4hWvEXKkXMK60AqGveodpxsh8p4t0NzYljkx0CxO5K+f
	PonfcQ0F7bDmnHAFwQViya/QrSsyrC1L9cTGuw50wjzRTjtveGko5gesQHl5lGMhZC7LcS0uj73
	I8mcTsmiOVUyz/WSe3/xUUYv+FuWKI0MJ2/Vsv2lT3CjKhqjYwddUhGbv3cTt7oAaqaXRFcBBW0
	6HGhIky16lguKzbXl
X-Received: by 2002:a05:600d:11:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4bb55a507a1mr96903005e9.17.1794664946508;
        Sat, 14 Nov 2026 06:02:26 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm136180145e9.13.2026.11.14.06.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 06:02:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 15:02:25 +0100
Message-Id: <DMUZMMCVZLAH.ZKUKO9RWIJCM@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] glibc: fix CVE-2026-84243
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261112062448.3128219-1-hthakar@cisco.com>
In-Reply-To: <20261112062448.3128219-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 14:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250204

On Thu Nov 12, 2026 at 7:24 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Backport the upstream fix [1] for the LANGUAGE directory traversal
> reported in [2]. Reject locale entries containing path separators or
> equal to ".." for all programs, while retaining valid entries in
> colon-separated LANGUAGE lists.
>
> Keep the upstream regression test and adapt its Makefile integration
> to the 2.43 layout. Omit only the NEWS entry for the later release.
>
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D03067f3c5e39=
aec5ec250a44bc1b395a1afd45e8
> [2] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob_plain;f=3Dadvisori=
es/GLIBC-SA-2026-0025
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../glibc/glibc/CVE-2026-84243.patch          | 194 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
>  2 files changed, 195 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch b/meta/re=
cipes-core/glibc/glibc/CVE-2026-84243.patch
> new file mode 100644
> index 00000000000..d64c7fea1d7
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
> @@ -0,0 +1,194 @@
> +From 03067f3c5e39aec5ec250a44bc1b395a1afd45e8 Mon Sep 17 00:00:00 2001
> +From: Avinal Kumar <avinal.xlvii@gmail.com>
> +Date: Mon, 2 Nov 2026 17:18:03 -0300
> +Subject: [PATCH] intl: Restrict path traversal when using LANGUAGE env v=
ar [BZ
> + #17142, CVE-2026-84243]
> +
> +The fix for CVE-2014-0475 (Bug 17137) added valid_locale_name() in
> +locale/findlocale.c to reject locale names containing ".." path
> +components.  However, the LANGUAGE environment variable processing in
> +intl/dcigettext.c was not covered by that fix.  An attacker who can
> +set LANGUAGE (e.g. via SSH AcceptEnv) can force any gettext-using
> +program to load a crafted .mo file from an arbitrary filesystem
> +location via directory traversal.  A crafted .mo file can crash the
> +program through out-of-range offsets or through format-string
> +translations that consume more arguments than the caller passes,
> +causing undefined behaviour in *printf.  glibc cannot fully protect
> +against the latter at the gettext level.  The safety of .mo files
> +normally relies on them being produced by msgmerge and msgfmt -c and
> +installed in read-only locations; path traversal bypasses this trust
> +model.
> +
> +Remove the ENABLE_SECURE gate from the IS_PATH_WITH_DIR check so it
> +applies to all binaries, not just SUID/SGID ones, and extend it to
> +also reject the bare ".." entry which contains no directory separator
> +but still names the parent directory.
> +
> +Add tst-gettext-path-traversal to verify that locale names containing
> +path separators or equal to ".." are rejected by the LANGUAGE processing=
 loop.
> +
> +This fixes bug 17142 and CVE-2026-84243.
> +
> +CVE: CVE-2026-84243
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dgli=
bc.git;h=3D03067f3c5e39aec5ec250a44bc1b395a1afd45e8]
> +
> +Backport Changes:
> +- Omit the NEWS hunk for the later 2.45 release section, which is absent
> +  from the 2.43 branch.
> +- Adjust intl/Makefile context for the 2.43 layout, retaining the upstre=
am
> +  test registration, catalog and locale prerequisites, and OBJPFX flag.
> +
> +Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
> +Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Hello,

If I'm not mistaken upstream backported this patch to the 2.43 branch in
commit 45e49b1ea2e5 ("intl: Restrict path traversal when using LANGUAGE
env var [BZ #17142, CVE-2026-84243]").

I think we should update to the tip of the 2.43 branch instead.

Regards,
--=20
Yoann Congal
Smile ECS

