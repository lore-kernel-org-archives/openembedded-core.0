Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D14BC7EE29
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 17:39:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.21512.1685900367382774661
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 10:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WRAp7eaz;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so40950705e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 10:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685900366; x=1688492366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wIlNpl39K4I5ZoAcLuLWAZG0//YczZTHT1tZhB+ZTFQ=;
        b=WRAp7eaz3RMizk7b0aHw86yxZBZFcAKNDu9sLLGXTBpohKUaYI25YtDQXKO9Exhjiu
         vPhkzKLzOlIqSFoo1cv7AD/72Qt6a7Y3iTcSY2snavuzktXNxpRM4iETrWmOxVkauxif
         DRP6PwYxvHOPSg8Se4rtDQE9RsP0oWuV8rwo5LjtaR9oMBji6c3XDMpVeBMBloHRwSiF
         5f2U3PCHZL6dRSl6R7WXJij0r9OxgCBrLpI8xMeTZv5IOyLyMIB3JcKNOaTnXTI5eDTH
         zF5RRse36FuK8SgY6tTsA8Ma2firtUaGa7S2eQ0Ndn33jRqFuhPVtctX8LLkh+Kk8Nrm
         dDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685900366; x=1688492366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIlNpl39K4I5ZoAcLuLWAZG0//YczZTHT1tZhB+ZTFQ=;
        b=YIqEeF0uLQQLrgDbqbbGHOKNzVomXJIGketgfNSHt/gRNAV+J9QyflCXPKtgVl9EQc
         4ABMuuBGELcNUWq+HAGK2uCSSiF5KARqdEtL5ekZsDKpztozc4Bb+bI70vgzWH2GnkEm
         5XZ3u75SrVodo8R0Ql/Etjw1I4QpdBAzoZXIHmY5Kz9P/VFd5YSj/v/AjwEnTxJwH7kP
         ux/NS68qHb1Uf7UDU6+Rvog/vG4EUx7ZagnU7NOeSgLgklnM9ZbzTX0di9ONGU1+NtNM
         RI3b5Cn/KllkCEvUcZkDuQmbPgWtLVhWohM3M5ptDDP/nQHpM1pkVh8EVeLgZbE4ChoU
         mnFQ==
X-Gm-Message-State: AC+VfDw9eE0BSXSV4VkE3XCPbXd/G6oiKILOK2JI8S+X6q+/16asnpTw
	mGUJTHat5Bm+i2GLuYLf2xYE5RyHpZ32mling7M=
X-Google-Smtp-Source: ACHHUZ4MAHT7iwQUfWNJQvhF3N1AVAcsFNtiXzm46/kpCfsAdr1C4DaxOJb/Es8Vh64XWg4SNdXblWzKXrhvFa2Xxq8=
X-Received: by 2002:a1c:4b04:0:b0:3f6:906:1195 with SMTP id
 y4-20020a1c4b04000000b003f609061195mr6044552wma.35.1685900365344; Sun, 04 Jun
 2023 10:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685672395.git.steve@sakoman.com> <0470293e16f424ba4ee6505f3ef68e5ee13df483.1685672395.git.steve@sakoman.com>
In-Reply-To: <0470293e16f424ba4ee6505f3ef68e5ee13df483.1685672395.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Jun 2023 19:39:14 +0200
Message-ID: <CA+chaQdwObovTdLKQDoK5iKs4JDZXMNbmKc8X-EJFLaNJdX+Ww@mail.gmail.com>
Subject: Re: [OE-core][mickledore 13/13] uninative: Upgrade to 4.0 to include
 latest gcc 13.1.1
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000067345205fd514496"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 17:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182365

--00000000000067345205fd514496
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

it looks like this change is causing mkfs.ext4 to segfault on some builders=
.

I'm seeing it on ubuntu-18.04 (I know it's unsupported now). It might be
related to older docker or libseccomp2 there, because there is similar
issue with gdk-pixbuf-native which fails when buildtools-extended is used
together with this and might be related to
https://github.com/moby/moby/issues/43595 because when I try very similar
18.04 ubuntu image on my gentoo host I cannot reproduce neither the
gdk-pixbuf-native failure nor the mkfs.ext4 segfaults.

I'm trying to get access to some of the affected boxes to find out which
version docker/libseccomp2 is used there and to double check that this is
root cause for these failures (now I can only confirm that it started in
Nanbield when this uninative upgrade was merged and now I've reproduced the
same with kirkstone-nut with the same uninative upgrade.

It might be useful to delay backporting this for a bit longer (and I'll
soon confirm if 3.10 was already affected or not).

Regards,

On Fri, Jun 2, 2023 at 4:22=E2=80=AFAM Steve Sakoman <steve@sakoman.com> wr=
ote:

> From: Michael Halstead <mhalstead@linuxfoundation.org>
>
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a7)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/distro/include/yocto-uninative.inc
> b/meta/conf/distro/include/yocto-uninative.inc
> index f3c05b7e20..ad4816a1f3 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -7,9 +7,9 @@
>  #
>
>  UNINATIVE_MAXGLIBCVERSION =3D "2.37"
> -UNINATIVE_VERSION =3D "3.10"
> +UNINATIVE_VERSION =3D "4.0"
>
>  UNINATIVE_URL ?=3D "
> http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}=
/
> "
> -UNINATIVE_CHECKSUM[aarch64] ?=3D
> "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
> -UNINATIVE_CHECKSUM[i686] ?=3D
> "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
> -UNINATIVE_CHECKSUM[x86_64] ?=3D
> "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
> +UNINATIVE_CHECKSUM[aarch64] ?=3D
> "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
> +UNINATIVE_CHECKSUM[i686] ?=3D
> "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
> +UNINATIVE_CHECKSUM[x86_64] ?=3D
> "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182136):
> https://lists.openembedded.org/g/openembedded-core/message/182136
> Mute This Topic: https://lists.openembedded.org/mt/99279066/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000067345205fd514496
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>it looks like this change is causin=
g mkfs.ext4 to segfault on some builders.</div><div><br></div><div>I&#39;m =
seeing it on ubuntu-18.04 (I know it&#39;s unsupported now). It might be re=
lated to older docker or libseccomp2 there, because there is similar issue =
with gdk-pixbuf-native which fails when buildtools-extended is used togethe=
r with this and might be related to=C2=A0<a href=3D"https://github.com/moby=
/moby/issues/43595">https://github.com/moby/moby/issues/43595</a> because w=
hen I try very similar 18.04 ubuntu image on my gentoo host I cannot reprod=
uce neither the gdk-pixbuf-native failure nor the mkfs.ext4 segfaults.</div=
><div><br></div><div>I&#39;m trying to get access to some of the affected b=
oxes to find out which version docker/libseccomp2 is used there and to doub=
le check that this is root cause for these failures (now I can only confirm=
 that it started in Nanbield when this uninative upgrade was merged and now=
 I&#39;ve reproduced the same with kirkstone-nut with the same uninative up=
grade.</div><div><br></div><div>It might be useful to delay backporting thi=
s for a bit longer (and I&#39;ll soon confirm if 3.10 was already affected =
or not).</div><div><br></div><div>Regards,</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 2, 2023 at 4:22=
=E2=80=AFAM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sa=
koman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxfoun=
dation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<br>
<br>
Signed-off-by: Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxfounda=
tion.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a7)<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/yocto-uninative.inc | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distr=
o/include/yocto-uninative.inc<br>
index f3c05b7e20..ad4816a1f3 100644<br>
--- a/meta/conf/distro/include/yocto-uninative.inc<br>
+++ b/meta/conf/distro/include/yocto-uninative.inc<br>
@@ -7,9 +7,9 @@<br>
=C2=A0#<br>
<br>
=C2=A0UNINATIVE_MAXGLIBCVERSION =3D &quot;2.37&quot;<br>
-UNINATIVE_VERSION =3D &quot;3.10&quot;<br>
+UNINATIVE_VERSION =3D &quot;4.0&quot;<br>
<br>
=C2=A0UNINATIVE_URL ?=3D &quot;<a href=3D"http://downloads.yoctoproject.org=
/releases/uninative/$%7BUNINATIVE_VERSION%7D/" rel=3D"noreferrer" target=3D=
"_blank">http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_V=
ERSION}/</a>&quot;<br>
-UNINATIVE_CHECKSUM[aarch64] ?=3D &quot;b11f7dff0ff5e3c971f22e89a105efb0f8d=
2006fd71d1ea3e5da771e416b0e01&quot;<br>
-UNINATIVE_CHECKSUM[i686] ?=3D &quot;ad7daa7fca7693ca07eea5279f830333530171=
d357759b380954a25254edd8dd&quot;<br>
-UNINATIVE_CHECKSUM[x86_64] ?=3D &quot;ce8ff7e3247da312fbf84008f415bc1b4d11=
3ac9fe4ec91581e4a20cd8b475d3&quot;<br>
+UNINATIVE_CHECKSUM[aarch64] ?=3D &quot;7baa8418a302df52e00916193b0a04f3183=
56d9d2670c9a2bce3e966efefd738&quot;<br>
+UNINATIVE_CHECKSUM[i686] ?=3D &quot;83114d36883d43a521e280742b9849bf85d039=
b2f83d8e21d480659babe75ee8&quot;<br>
+UNINATIVE_CHECKSUM[x86_64] ?=3D &quot;fd75b2a1a67a10f6b7d65afb7d0f3e71a63b=
0038e428f34dfe420bb37716558a&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182136): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182136" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182136</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99279066/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99279066/3617156</a><br>
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

--00000000000067345205fd514496--

