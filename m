Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3198.1794617301024939423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 16:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=HqZG/VgL;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so9854715e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794617299; x=1795222099; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BC+utuImJfk4BuxriuW+VNedT+OpBRa4ZsTf5p2RC8k=;
        b=HqZG/VgLm61L+r1h0MmWJeHH4j2crCfgySK4EEH7HupN9vs3pPtUxSUd0WA9Jxx6W8
         mVc5WgDBecgNKoPCiyr5dwZJaSMVTJI8N7Ob5q/sOl4LATrJSxJyLkaenULnTe69lLqI
         4VBqf0PKsNn9TM73rJkKCxy1nqot634XDXzdA6vE9sppoSOm1n8NwARziwASOii4cA/Z
         NsVD1JwBSjxiikdNKfj5np3nz0yB7ocMiN7RIMAPrU7xmXvteP0ZSHvC7UgcYhPsAg0O
         KG32EfbkOAToxUuS4Le7gtT4afMgGqaw8etjeTkHpaIq8qoLD05lF61ylhIW8Xxo0P+M
         lydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617299; x=1795222099;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BC+utuImJfk4BuxriuW+VNedT+OpBRa4ZsTf5p2RC8k=;
        b=YIKHEvHiA5QR6Ze0gMTcyeLjh9J6p+KUcSaRB19Qs9n60XRXhok+SoB1dNLDdWomWF
         6NfPEKcGwdz3TFfEeHreWrniDZm9J3ygVdFSyKbVNnyq7tWbDRIGBdd/wNAE12dRLwGr
         HGbvKL1FSj0hStOuPBRU7zo/KCRXmcy6NcH1lKYarjbu0+P8XVqUt9EzoLkgfeXZa1p5
         hMSvO+0brfIRgfS8+d7SpbarNz3v9OOb0yY2jAPBrrZlfNV7kAF3F/Qx1O8PN8Lj6skZ
         9CJbh3fn2qlMOmhDJ3vUbrLPZZSinSRc6+DhpfFHjbwdjhFTywVTg1QyxfA8QxfqcpTm
         KCKg==
X-Forwarded-Encrypted: i=1; AL+hErH58QdT9Tjp2tVy5fYfKKHQiM3bTqgZzPKWfi2vAE5+RUJhjaHPyP9N1JIYznMt4cY1iKoefLZZsIehb6zOgeORhg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8207E2wQRyhaeltnYliX2rJ9EC5RhRsJkq4inIUKV7YrmylvCp
	dDlORgcF37evnAl/Xxw1Y8/Wb8am5yZBR/j+9pFtLeW7HnMxvhrJXybrX6k7THay5so=
X-Gm-Gg: AYBFou3zWAKPk6wizfev7BLbjQxzoN1mCfvQzbXbGqSjXFvDiaTWuibB0PRly5QWov8
	rw2jNUtNKDHbqJUiMlyPpN6p5Aw3j4dlczP0y1qsvvsdiRa+64n6XH0Y8xT6cfztauyJMwoTwQd
	odVG8pHgXwagRIIpmaOOV59pxNLW55jfYg4emTvzfppa666ApfYdCCj+Ky+6hglvRhb6Oxgewk8
	5dtyI79JWpHdpCasfSfRUxuQXnPK6sG3v8AHwDBWWoFy+45cZhyH6TVhEEFRmdQlrK25RqN7igQ
	dGaOVWGzkIK3qIGmCI6MYPWGxSEQrFJuPnanIn/eqiyjLAKEu1G2eqY7I4NPJZE7vKPsJNyrETa
	KK6H9poc85e8TMXUuKZCgfaLeZwve5iKz/Qzb2NUIi/rKmCpSK9IpxkTmx5f7D8i8QPQWHVsamK
	fOjsFvP1Xx4qj8/HkJ++lYrHJv5/8FUN6YImjMPfuGgWWwO2FOHtQhT1YXdCPyVpSrCyhrKPPnE
	U6hqsQCmJFBLPqWAm7PCRZBn1zOLn4GM4lHDIu5y6x0iOnjX8DkhdTdUEzTGPGD71GaHuXygilL
	YCyBWZILTl6hZ0V5apWnj1mtOxSoagJP/YohvF/wAtv7Q+mJqvJnmzpLy+zYI0f5Zp+u4Dc4fPX
	twGjsKHC1rvMa33awpQ==
X-Received: by 2002:a05:600c:8b4c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb55ab56ffmr90423695e9.28.1794617299013;
        Fri, 13 Nov 2026 16:48:19 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00d795e58479169e39.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d795:e584:7916:9e39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e33ae5bsm169412045e9.3.2026.11.13.16.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 16:48:18 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 01:48:18 +0100
Message-Id: <DMUIQLAT1QR3.DDFST6CFRWYS@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] perl-cross: add patches for
 perl-5.42.3
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261105170249.55552-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261105170249.55552-1-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 00:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250191

On Thu Nov 5, 2026 at 6:02 PM CET, Jaipaul Cheernam via openembedded-core w=
rote:
> perl-cross 1.6.4 has no patchset for the 5.42.3 point release and aborts
> configure on unknown versions. Reuse the 5.42.0 patchset, as its
> cnf/diffs/README advises ("Copy the closest available version").
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  ...rl-cross-add-patches-for-perl-5.42.3.patch | 226 ++++++++++++++++++
>  .../perl-cross/perlcross_1.6.4.bb             |   1 +
>  2 files changed, 227 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cros=
s-add-patches-for-perl-5.42.3.patch
>
> diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-p=
atches-for-perl-5.42.3.patch b/meta/recipes-devtools/perl-cross/files/0001-=
perl-cross-add-patches-for-perl-5.42.3.patch
> new file mode 100644
> index 0000000000..a7fbd116f1
> --- /dev/null
> +++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-=
for-perl-5.42.3.patch
> @@ -0,0 +1,226 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +Date: Thu, 5 Nov 2026 14:00:00 +0000
> +Subject: [PATCH] perl-cross: add patches for perl-5.42.3
> +
> +Reuse the perl 5.42.0 patchset for the 5.42.3 point release.
> +
> +Upstream-Status: Inappropriate [oe-specific; perl-cross goes 5.42.0 -> 5=
.44.0]
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + cnf/diffs/perl5-5.42.3/constant.patch       |  1 +
> + cnf/diffs/perl5-5.42.3/dynaloader.patch     |  1 +
> + cnf/diffs/perl5-5.42.3/findext.patch        |  1 +
> + cnf/diffs/perl5-5.42.3/installscripts.patch |  1 +
> + cnf/diffs/perl5-5.42.3/liblist.patch        | 70 +++++++++++++++++++++
> + cnf/diffs/perl5-5.42.3/makemaker.patch      |  1 +
> + cnf/diffs/perl5-5.42.3/posix-makefile.patch |  1 +
> + cnf/diffs/perl5-5.42.3/test-checkcase.patch |  1 +
> + cnf/diffs/perl5-5.42.3/test-makemaker.patch |  1 +
> + cnf/diffs/perl5-5.42.3/xconfig.patch        | 48 ++++++++++++++
> + 10 files changed, 126 insertions(+)
> + create mode 120000 cnf/diffs/perl5-5.42.3/constant.patch
> + create mode 120000 cnf/diffs/perl5-5.42.3/dynaloader.patch
> + create mode 120000 cnf/diffs/perl5-5.42.3/findext.patch
> + create mode 120000 cnf/diffs/perl5-5.42.3/installscripts.patch
> + create mode 100644 cnf/diffs/perl5-5.42.3/liblist.patch
> + create mode 120000 cnf/diffs/perl5-5.42.3/makemaker.patch
> + create mode 120000 cnf/diffs/perl5-5.42.3/posix-makefile.patch
> + create mode 120000 cnf/diffs/perl5-5.42.3/test-checkcase.patch
> + create mode 120000 cnf/diffs/perl5-5.42.3/test-makemaker.patch
> + create mode 100644 cnf/diffs/perl5-5.42.3/xconfig.patch

Hello,

Shouldn't liblist.patch and xconfig.patch be symlinks to
cnf/diffs/perl5-5.42.0/... ?=20
I don't know perl-cross very well but it looks to me that the convention
of this directory is "in each version, symlink to an existing file if
present".

Also, it has the nice side effect of making extra clear that you don't
add original code.

If you agree, can you send a v2 with the change?

Thanks!
--=20
Yoann Congal
Smile ECS

