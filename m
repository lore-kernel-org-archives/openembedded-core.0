Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE58C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 11:18:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.16764.1682680687481607345
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 04:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PuesBBFj;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-2fde2879eabso8892015f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 04:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682680686; x=1685272686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FSDPH8g0t0XPH3wam1HKt9MSjre4X2mQWqQCdhcZAKw=;
        b=PuesBBFj1ugzdS5sxPhhV5vAE28E7TgjJgmtNznUjD+bnOS33ZYUa1V+Fid42ooVhX
         2yXTUWeBPtOIenZ5VNv+Jb7ovHqcTzvHuZFuiAitf7vlolVYkcoOsMkNKiBoHOb8V5Yv
         xYmcLK8TCmHGKWFHq6975SqgFF+rWLbjwK4lZKrlMrBA+G75DFaBsWeSQai+5TpLmMjb
         A00R7sPq6IOLI1jLjqcOiPHb4V3/xLA0WggPAes7PC8uHDEtMNjbgMTN2Jt6cpYQ+p3j
         fWH7WTEAM+X1w/mJQfmu6e3JGKsPOQPWWhz2phAw1So3OEfU4fSpAC9WKjcpvujldpwa
         tUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682680686; x=1685272686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSDPH8g0t0XPH3wam1HKt9MSjre4X2mQWqQCdhcZAKw=;
        b=Cx7Cdp+IeFBj2vAJyvlBGvQ/4loy7Lhhs4J0geS95xy1cMAMa2HHoxiX7FWuQ7V78O
         9TPiYDCmAwyP88BWjCnM2w+kj4XQMKynltLFY6kWxYGD7AKSAS6zG4u6P58ehSAHEjP6
         xysjXvV6C38SshTjUQu5a5SOIVwPpUs8tgyvCKKsRTjynrDcUQHIPVfx6ScBv/g7hAcu
         0cfkbIsG1T+KG8FeNynqBNVwHHVRj1gCX2u2zdVxXVwL3R/hLLaI8dFSu/nG9eYzdm9t
         PB3AHKKZOJhOPbDZesmaDYSUGVnSCf3p5NiKw9M+cOGgga0h+45bilvyZW1pJuS/cdEF
         KmNg==
X-Gm-Message-State: AC+VfDyvA8c5Eg8kdfxnGHDYaduLBKJd9BuRzkagAeM2Bxu+OWUybptW
	r94jo6NmIjVHgWyyFdpaLQ8V2mVyGDBTpFLCu/o=
X-Google-Smtp-Source: ACHHUZ4/He4bcuV34a94Zq0CwHxh/X4NMAWWujmvbHhKsW0yWN3Q+cDPdUd2O1nxw23i5QWDTYzHOKUIVy3zXkbXp8I=
X-Received: by 2002:adf:f445:0:b0:2fb:c75f:8f22 with SMTP id
 f5-20020adff445000000b002fbc75f8f22mr3576251wrp.56.1682680685612; Fri, 28 Apr
 2023 04:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230428032030.2047920-1-raj.khem@gmail.com>
In-Reply-To: <20230428032030.2047920-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Apr 2023 13:17:54 +0200
Message-ID: <CA+chaQezVy_zhi-QDsz=PWdqBsSqt7YCO+5mcAHboNFuzc4j5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add -fcanon-prefix-map to DEBUG_PREFIX_MAP
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008952a705fa63a0fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 11:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180526

--0000000000008952a705fa63a0fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you already have a follow-up change for meta-clang which seems to be
broken by this change?

clang-16: error: unknown argument: '-fcanon-prefix-map'

On Fri, Apr 28, 2023 at 5:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> This should help canonicalize the relative paths and symlinks
> during cross compile, -fcanon-prefix-map is newly added in gcc-13+ [1]
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108464#c8
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/bitbake.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d94ffe1df9..453bef37a9 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -644,7 +644,8 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
>  # Optimization flags.
>  ##################################################################
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?=3D
> "-fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} =
\
> +DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
>   -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
>   -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
>   -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180504):
> https://lists.openembedded.org/g/openembedded-core/message/180504
> Mute This Topic: https://lists.openembedded.org/mt/98551742/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008952a705fa63a0fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Do you already have a follow-up change for meta-clang=
 which seems to be broken by this change?</div><div><br></div><div>clang-16=
: error: unknown argument: &#39;-fcanon-prefix-map&#39;<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Ap=
r 28, 2023 at 5:20=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">This should help canonicalize the relative paths an=
d symlinks<br>
during cross compile, -fcanon-prefix-map is newly added in gcc-13+ [1]<br>
<br>
[1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108464#c8" re=
l=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cg=
i?id=3D108464#c8</a><br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index d94ffe1df9..453bef37a9 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -644,7 +644,8 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PARALLEL_=
MAKEINST} &quot;<br>
=C2=A0# Optimization flags.<br>
=C2=A0##################################################################<br=
>
=C2=A0# Beware: applied last to first<br>
-DEBUG_PREFIX_MAP ?=3D &quot;-fmacro-prefix-map=3D${S}=3D/usr/src/debug/${P=
N}/${EXTENDPE}${PV}-${PR} \<br>
+DEBUG_PREFIX_MAP ?=3D &quot;-fcanon-prefix-map \<br>
+ -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \=
<br>
=C2=A0 -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
=C2=A0 -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
=C2=A0 -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180504): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180504" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180504</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98551742/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98551742/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008952a705fa63a0fa--

