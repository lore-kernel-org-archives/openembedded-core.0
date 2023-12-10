Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA09C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 13:19:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.54656.1702214391314479441
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 05:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hg0T6WbG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so13683625e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 05:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702214390; x=1702819190; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXHn1TIRSx3hxLoLdxWgEfKqbyo/cH2Qop4r3fonnBk=;
        b=Hg0T6WbGtXR6kJKCYtbA2LIDQq1AifAT2oA3bMAqky0YabsF/3xnZbgkybS/Qo3D1g
         5E2NIn6DOn+VAZ8IctqxvxxbTay/e2Lpi1GMOfQqeNrvMYNs/rVz8d9XmQKeEXkLwN6N
         HesdV5hq8rElKbYmvuOJGR17Iluzva7Lqdoxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702214390; x=1702819190;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xXHn1TIRSx3hxLoLdxWgEfKqbyo/cH2Qop4r3fonnBk=;
        b=ZS33XINzuW3jRACW5zP4AQ/BZrVG9VQiz9NzczPKsxhZq/ZTSAojfwD6NKwu7Umtf8
         n+gsCpz/V4D8+779aYaw5r80INztnkAF2FTfPuuJaIgvBKoiww9LLx+4ujr/dvSQmpzS
         Q1YDlal2iGW0AP1XOAdgWxcGzonXdCV52RNcPhlIFqNzO+Vv0CGzpEj1F2hrK+LssCkn
         8vtsRZ/kjwT93ecjgiRjAzEl1nHQZOsDXaRMAZMW2U43S3uPiwp4n7pyFGUE/gBXvVBp
         WZV3CBjEAmLB3IOQrDX3raINhKKqBv6G8NE0BRRqvAw4XTMDzH2PUrOsAFjzQkfwdaAb
         weBQ==
X-Gm-Message-State: AOJu0YxB+HgMvM3gigdhH+FcsEaouXwk7LU4Zr3YAUwN8LxE+UWer8L6
	L2fOtMky5rjhgPUuo1xS1481xQ==
X-Google-Smtp-Source: AGHT+IFjZxWviH8W3KXdA5qa6rLDVX2Kz4zadUtcZRRFEyTkp1DxD1aFueqPpBt25dp3WR1woM44sQ==
X-Received: by 2002:a05:600c:3791:b0:40c:3107:7741 with SMTP id o17-20020a05600c379100b0040c31077741mr1497131wmr.148.1702214389594;
        Sun, 10 Dec 2023 05:19:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:659f:462d:68c0:d464? ([2001:8b0:aba:5f3c:659f:462d:68c0:d464])
        by smtp.gmail.com with ESMTPSA id a11-20020a05600c348b00b0040b400711f5sm12001215wmq.7.2023.12.10.05.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:19:49 -0800 (PST)
Message-ID: <3d6053b7d1ab449db8882ee92496f32f52706d8b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: drop syncfs probe patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Date: Sun, 10 Dec 2023 13:19:48 +0000
In-Reply-To: <20231209232710.1006536-1-alexandre.belloni@bootlin.com>
References: <20231209232710.1006536-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 13:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192113

On Sun, 2023-12-10 at 00:27 +0100, Alexandre Belloni via
lists.openembedded.org wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>=20
> The patch is now upstream and SRCREV has already been bumped
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../pseudo/files/syncfs-probe.patch           | 44 -------------------
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 -
>  2 files changed, 45 deletions(-)
>  delete mode 100644 meta/recipes-devtools/pseudo/files/syncfs-probe.patch
>=20
> diff --git a/meta/recipes-devtools/pseudo/files/syncfs-probe.patch b/meta=
/recipes-devtools/pseudo/files/syncfs-probe.patch
> deleted file mode 100644
> index 23f01673e3c2..000000000000
> --- a/meta/recipes-devtools/pseudo/files/syncfs-probe.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From e38b1fec2eb4a5dcefafdab7f1a240966f3632f1 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Eil=3DC3=3DADs=3D20=3D27pidge=3D27=3D20N=3DC3=3DAD=3D2=
0Fhlannag=3DC3=3DA1in?=3D
> - <pidge@baylibre.com>
> -Date: Wed, 6 Dec 2023 13:00:29 +0000
> -Subject: [PATCH] subports: Add _GNU_SOURCE
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -[YOCTO #15074]
> -
> -The syncfs probe in ports/unix/subports was failing if the compiler does=
 not=20
> -support implicit function declarations. syncfs is protected and requires=
=20
> -_GNU_SOURCE, so the answer here is to pull it in.
> -
> -Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylib=
re.com>
> -
> ----
> -Upstream-Status: Pending
> -
> - ports/unix/subports | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/ports/unix/subports b/ports/unix/subports
> -index e41b036..bd5a2f6 100755
> ---- a/ports/unix/subports
> -+++ b/ports/unix/subports
> -@@ -1,11 +1,13 @@
> - #!/bin/sh
> - cat > dummy.c <<EOF
> -+#define _GNU_SOURCE
> - #include <unistd.h>
> - int main(void) {
> - 	syncfs(0);
> - 	return 0;
> - }
> - EOF
> -+
> - if ${CC} -o dummy dummy.c > /dev/null 2>&1; then
> - 	echo "unix/syncfs"
> - fi
> ---=20
> -2.34.1
> -
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index 31b2d5fad20d..699cab11c668 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -2,7 +2,6 @@ require pseudo.inc
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;protocol=
=3Dhttps \
>             file://0001-configure-Prune-PIE-flags.patch \
> -           file://syncfs-probe.patch \
>             file://glibc238.patch \
>             file://fallback-passwd \
>             file://fallback-group \

I think this issue is only in your branch?

Cheers,

Richard


