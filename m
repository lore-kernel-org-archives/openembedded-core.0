Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BADC04A6A
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 15:06:29 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.17479.1690988782520900319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 08:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AVl0eUWJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9aa1d3029so105668281fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690988780; x=1691593580;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ul/uu+WtZgFRihPHHqGAxU/2OL0zfHXwjYnIqk/2d7s=;
        b=AVl0eUWJGPPFhTORrWHqwLq7alGQ/KfMj/01FsOs481Hu5aYBTon6xHuDvAiklwPs6
         x/YNOwK5P8sJUDObm08VjIwMLWZF8lAHzbnTyVqaMVUhbxWEhocb5tleMa/ZHtBGwD+u
         ZSTTQIKz3dfaNhLmI5fZoRgnjNKjO5Q3Bl93XIvw81DzJY17IX1v9JiI8edGVpu4Bx2S
         EOkbEuhPrwW1pZ9gjPnMf0PG+viPG9Zt2NGbZFh77AeEoR/oWEzmokdvVY4IV5SzffUF
         birBm+tLi2N0AJpIR9OhG1qTVBfD4Wa42IDUXKLj8PEuJQWi0VuoBCNkVX+yKFPNL3En
         ObkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988780; x=1691593580;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul/uu+WtZgFRihPHHqGAxU/2OL0zfHXwjYnIqk/2d7s=;
        b=ZRJ6Ot3Zau5aPliZyx8PcWb0Qr6RzDw1H/qG+YyA8HlwAgWh4uouQ2J8uMrKSU1I2j
         JKLur4Cwfu4MGhXgGW5HdjpewYFOGnIoNTWJe9tmtg/h38B8jkD2nUbuWg++4I8l2qra
         B9FplfwdIwdW7vygfbq2p9PoK0rmXEcOlijprqwX96FK9qb/xAIRUEYGCKhpFbdtm83Q
         ySbHPh+MI2IKRtfEYVM2qFgbfBK+6VNALrrbIw2qDsU6Ie2Bqhnu1q6T4SQxwQac7e9W
         xIwJUw+bEhV9PZ5N1foZZzvUTjtNivPfe8DQj9vCKWcP9jPol3zZE/BVH6MP+mAVpqiQ
         id5w==
X-Gm-Message-State: ABy/qLa1FdDgZkY28DF7IJL8//gn+pxciWeXtqkJAE6qJ+iAb62qBB3i
	X2zd/71QYSoigR7LlENKmrHgU2PyZEOPeX5xWXVu+lfI
X-Google-Smtp-Source: APBJJlFE2xeItuFEm86antUmliPp+d3gGkIRPtWHa/AQ4fYXrlhaQWYv5ENh/jhZoB6/U9vsY0tMu1G+oLlGO91NDZI=
X-Received: by 2002:a2e:9dc4:0:b0:2b9:d266:85ac with SMTP id
 x4-20020a2e9dc4000000b002b9d26685acmr5209698ljj.48.1690988779939; Wed, 02 Aug
 2023 08:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690981978.git.frederic.martinsons@gmail.com>
In-Reply-To: <cover.1690981978.git.frederic.martinsons@gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 2 Aug 2023 17:06:08 +0200
Message-ID: <CA+cAkeraX7cGY76z_YQEodCKh00+cHgziXogv0Zd4VEo1yQG=g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Use frozen flag for cargo build
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008c2c490601f20152"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 15:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185411

--0000000000008c2c490601f20152
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 2 ao=C3=BBt 2023, 15:16, <frederic.martinsons@gmail.com> a =C3=A9cr=
it :

> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>
> This patch series force the usage of --frozen instead of --offline during
> cargo build.
> This has the advantage to be sure that Cargo.lock file will not be
> modified.
> Moreover, raise a clear error when Cargo.lock is not present.
> For this to work, we must modify ourself the Cargo.lock before building
> in case there are git repo that have been patched.
>
> The last commit was for removing rust-hello-world, patch to the
> documentation project will follow.
>
> The following changes since commit
> 692e414aed5313ff275b69e93179aa7c559700f3:
>
>   ffmpeg: Fix wrong code found with gas/2.41 (2023-08-01 09:49:14 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/fmartinsons/openembedded-core 15104-check-cargo-lock
>
> Frederic Martinsons (3):
>   cargo.bbclass: Use --frozen flag for cargo operations
>   cargo_common.bbclass: Handle Cargo.lock modifications for git
>     dependencies
>   drop rust-hello-world recipe
>
>  meta/classes-recipe/cargo.bbclass             |  7 +++-
>  meta/classes-recipe/cargo_common.bbclass      | 41 +++++++++++++++++++
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  meta/lib/oeqa/runtime/cases/rust.py           | 12 ------
>  .../packagegroup-core-tools-testapps.bb       |  3 --
>  .../rust-hello-world/0001-enable-LTO.patch    | 24 -----------
>  .../rust-example/rust-hello-world_git.bb      | 19 ---------
>  7 files changed, 47 insertions(+), 60 deletions(-)
>  delete mode 100644
> meta/recipes-extended/rust-example/rust-hello-world/0001-enable-LTO.patch
>  delete mode 100644 meta/recipes-extended/rust-example/
> rust-hello-world_git.bb
>
> --
> 2.34.1
>

Sorry, I missed the v2 part in header. These are the follow up after
remarks made yesterday (about removal of rust-hello-world and robustness
when modifying Cargo.lock file in place)

>

--0000000000008c2c490601f20152
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mer. 2 ao=C3=BBt 2023, 15:16,  &lt;<a href=3D"mailt=
o:frederic.martinsons@gmail.com">frederic.martinsons@gmail.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Frederic Ma=
rtinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt;<br>
<br>
This patch series force the usage of --frozen instead of --offline during c=
argo build.<br>
This has the advantage to be sure that Cargo.lock file will not be modified=
.<br>
Moreover, raise a clear error when Cargo.lock is not present.<br>
For this to work, we must modify ourself the Cargo.lock before building<br>
in case there are git repo that have been patched.<br>
<br>
The last commit was for removing rust-hello-world, patch to the<br>
documentation project will follow.<br>
<br>
The following changes since commit 692e414aed5313ff275b69e93179aa7c559700f3=
:<br>
<br>
=C2=A0 ffmpeg: Fix wrong code found with gas/2.41 (2023-08-01 09:49:14 +010=
0)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/fmartinsons/openembedded-core" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://gitlab.com/fmartinsons/ope=
nembedded-core</a> 15104-check-cargo-lock<br>
<br>
Frederic Martinsons (3):<br>
=C2=A0 cargo.bbclass: Use --frozen flag for cargo operations<br>
=C2=A0 cargo_common.bbclass: Handle Cargo.lock modifications for git<br>
=C2=A0 =C2=A0 dependencies<br>
=C2=A0 drop rust-hello-world recipe<br>
<br>
=C2=A0meta/classes-recipe/cargo.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 +++-<br>
=C2=A0meta/classes-recipe/cargo_common.bbclass=C2=A0 =C2=A0 =C2=A0 | 41 +++=
++++++++++++++++<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 -<br>
=C2=A0meta/lib/oeqa/runtime/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 12 ------<br>
=C2=A0.../<a href=3D"http://packagegroup-core-tools-testapps.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">packagegroup-core-tools-testapps.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 --<br>
=C2=A0.../rust-hello-world/0001-enable-LTO.patch=C2=A0 =C2=A0 | 24 --------=
---<br>
=C2=A0.../rust-example/<a href=3D"http://rust-hello-world_git.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">rust-hello-world_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 | 19 ---------<br>
=C2=A07 files changed, 47 insertions(+), 60 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/rust-example/rust-hello-worl=
d/0001-enable-LTO.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/rust-example/<a href=3D"http=
://rust-hello-world_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>rust-hello-world_git.bb</a><br>
<br>
-- <br>
2.34.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Sorry, I missed the v2 part in header. These are the follow up after =
remarks made yesterday (about removal of rust-hello-world and robustness wh=
en modifying Cargo.lock file in place)=C2=A0</div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div=
></div>

--0000000000008c2c490601f20152--

