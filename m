Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2F1C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 06:29:30 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web08.16156.1667456965451932646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 23:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JNt9TGrN;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id b9so1039019ljr.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 23:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MU429hsfigX4cA3oUvJYk5asuU77u5lsosH7Z9apalE=;
        b=JNt9TGrNJnFDhXzABjSqUEYEMZ4pIylINRC3HyhnUaoETLt5dJjdP6epg+b5YBSaW/
         9sJihsSJAdb+f1uKCVrrWnL5E7sDDvqlyPyft5unspTzCUTEK/EZfdl1E1Eo2iKFZ7U2
         69dd+79sbTjwEiuUuKzYgrkZgkfksTJ+9tI2n+BaM6b4s5H8+l5iWfICnLYt4WWxLX8G
         hVe14fu0daXeluTBcYyhDK82MSQ4TWYYs6SoGoSG+c4YIGi7MryG795yQYMxPRi4CGLy
         ndZWU9Lngc0uKME34c6Jlr9XZ7b/qXYFmwaty79kWktJVX9N6dUbs+QtAMaKL9CJjXoS
         KBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MU429hsfigX4cA3oUvJYk5asuU77u5lsosH7Z9apalE=;
        b=m6uu7N1je0wFHlzaFDj5AhzpwE2K/YDFUjuMeTB20yun5D0kpgNhGjUU6LZ+QxJKZn
         uQSHJ280Ljm0hBMXhODBtQFq6l5qBZR+44SGDTGGkRtQaJYj1hSZ9O7VkgzRlLc7mVki
         sgGpmsF+xVcXYlMGjYz/X2Y0kWlaPHcU8IyKN9VqMzeON+V6KfeYnKXiOxVrCD7pLDun
         6F1NCCLNBgKB1W8Z/MdqY1zqOATcOOm7CRFQxKfsRuDVMPDWZixDLxIA4jjJkL6WOVPt
         32y2BzZy8m25qpNnbUBrgSmla/XnfQlQm4Q379Pug0TgrsDvAMenLZGWg7rQ7b3eIjX/
         sBMQ==
X-Gm-Message-State: ACrzQf0TNgYDsmYQn4SXCAjVk8cVA8XzXK4kRuJ9msllCJteID5bp9kh
	CLPcWpPWyqUxqhVGZ3TswmvZejBu6jQFvQkm19o=
X-Google-Smtp-Source: AMsMyM48pyHPavwLGXD3clwBBniPL7vQwH+kLYJlrOeLjMYhOSkM/easPbdp7vR2zxcFP5zXrKd9OUHKhFfwLX5hvr0=
X-Received: by 2002:a2e:7a17:0:b0:277:139b:27db with SMTP id
 v23-20020a2e7a17000000b00277139b27dbmr10649718ljc.222.1667456963206; Wed, 02
 Nov 2022 23:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <1667453571-28233-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1667453571-28233-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Nov 2022 07:29:12 +0100
Message-ID: <CANNYZj9_6vh1A33fE+okST3wHB_q3A599VeFOE17k2zRJVG_5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcrypt-compat: upgrade 4.4.28 -> 4.4.30
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f862e205ec8b131a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 06:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172612

--000000000000f862e205ec8b131a
Content-Type: text/plain; charset="UTF-8"

Libxcrypt itself should be updated at the same time. You can squash the two
patches.

Alex

On Thu 3. Nov 2022 at 6.33, wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> ==========
> * configure: Restore ucontext api functionality check.
>   In c3f01c72b303cbbb0cc8983120677edee2f3fa4b the use of the ucontext api
>   in the main program was removed, and with it the configure check for it.
>   However, the ucontext api is still used in the "explicit_bzero" test and
>   thus this test still needs to be in place.
>   See also: https://bugs.gentoo.org/838172
> * configure: Restore the functionality of the '--disable-symvers' switch.
>   Without this fix the build was simply broken, if symbol versioning was
>   disabled for any reason, e.g. whether the compiler nor the linker
>   supporting it, or if disabled on purpose by the user (issue #142).
> * Fix variable name in crypt(3) for a datamember of 'struct crypt_data'
>   (issue #153).
> * Add glibc-on-loongarch-lp64 (Loongson LA464 / LA664) entry to
>   libcrypt.minver.  This was added in GNU libc 2.36.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb}  | 0
>  meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.28.bb =>
> libxcrypt-compat_4.4.30.bb} (100%)
>
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.28.bb
> b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
> similarity index 100%
> rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.28.bb
> rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc
> b/meta/recipes-core/libxcrypt/libxcrypt.inc
> index 39ba2636ff..2bdedcba6d 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
>  inherit autotools pkgconfig
>
>  SRC_URI = "git://
> github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https
> <http://github.com/besser82/libxcrypt.git;branch=$%7BSRCBRANCH%7D;protocol=https>
> "
> -SRCREV = "50cf2b6dd4fdf04309445f2eec8de7051d953abf"
> +SRCREV = "fee2687bad66e351a3dcc963a34ae80125923ff8"
>  SRCBRANCH ?= "develop"
>
>  SRC_URI += "file://fix_cflags_handling.patch"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172607):
> https://lists.openembedded.org/g/openembedded-core/message/172607
> Mute This Topic: https://lists.openembedded.org/mt/94751232/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f862e205ec8b131a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Libxcrypt itself should be updated at the same time. You =
can squash the two patches.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu 3. Nov 2022 at 6.33, wangmy &lt;<a href=3D"mailto:wangm=
y@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blan=
k">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
* configure: Restore ucontext api functionality check.<br>
=C2=A0 In c3f01c72b303cbbb0cc8983120677edee2f3fa4b the use of the ucontext =
api<br>
=C2=A0 in the main program was removed, and with it the configure check for=
 it.<br>
=C2=A0 However, the ucontext api is still used in the &quot;explicit_bzero&=
quot; test and<br>
=C2=A0 thus this test still needs to be in place.<br>
=C2=A0 See also: <a href=3D"https://bugs.gentoo.org/838172" rel=3D"noreferr=
er" target=3D"_blank">https://bugs.gentoo.org/838172</a><br>
* configure: Restore the functionality of the &#39;--disable-symvers&#39; s=
witch.<br>
=C2=A0 Without this fix the build was simply broken, if symbol versioning w=
as<br>
=C2=A0 disabled for any reason, e.g. whether the compiler nor the linker<br=
>
=C2=A0 supporting it, or if disabled on purpose by the user (issue #142).<b=
r>
* Fix variable name in crypt(3) for a datamember of &#39;struct crypt_data&=
#39;<br>
=C2=A0 (issue #153).<br>
* Add glibc-on-loongarch-lp64 (Loongson LA464 / LA664) entry to<br>
=C2=A0 libcrypt.minver.=C2=A0 This was added in GNU libc 2.36.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://libxcrypt-compat_4.4.28.bb" rel=3D"noreferrer"=
 target=3D"_blank">libxcrypt-compat_4.4.28.bb</a> =3D&gt; <a href=3D"http:/=
/libxcrypt-compat_4.4.30.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt=
-compat_4.4.30.bb</a>}=C2=A0 | 0<br>
=C2=A0meta/recipes-core/libxcrypt/libxcrypt.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-core/libxcrypt/{<a href=3D"http://libxcrypt-compa=
t_4.4.28.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.28.b=
b</a> =3D&gt; <a href=3D"http://libxcrypt-compat_4.4.30.bb" rel=3D"noreferr=
er" target=3D"_blank">libxcrypt-compat_4.4.30.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt-compat=
_4.4.28.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.28.bb=
</a> b/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt-compat_4.4.3=
0.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.30.bb</a><b=
r>
similarity index 100%<br>
rename from meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt-compat_=
4.4.28.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.28.bb<=
/a><br>
rename to meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt-compat_4.=
4.30.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.30.bb</a=
><br>
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/=
libxcrypt/libxcrypt.inc<br>
index 39ba2636ff..2bdedcba6d 100644<br>
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSING;md5=3Dc0a30e2=
b1502c55a7f37e412cd6c6a4b \<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/besser82/libxcry=
pt.git;branch=3D$%7BSRCBRANCH%7D;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/besser82/libxcrypt.git;branch=3D${SRCBRANCH};protoc=
ol=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;50cf2b6dd4fdf04309445f2eec8de7051d953abf&quot;<br>
+SRCREV =3D &quot;fee2687bad66e351a3dcc963a34ae80125923ff8&quot;<br>
=C2=A0SRCBRANCH ?=3D &quot;develop&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://fix_cflags_handling.patch&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172607): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172607" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172607</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94751232/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94751232/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f862e205ec8b131a--

