Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA61C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 18:47:11 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.19644.1677178025959531626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 10:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n6RY/LRh;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id v1-20020a9d6041000000b0068d4a8a8d2dso2596498otj.12
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 10:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RP7aQ/mDtx68lmXqFmvCAriC0i1lfI3ZK9yP65KhELQ=;
        b=n6RY/LRh113QRb3xObpl7J8Wu6Jx6LsuCnMqQrN39e4/3f0ZZbnrk2npmfB9YmaA+e
         YPRg2k5q3nCJMUlF0683cb5f4lrAxr/Od2nS6qC4hIbxu9kT+pSVEPVs4ukJWGJCpsjN
         qcqrxBY92LuYE0WG0Hb2pHf4MGCR6to1oiYVCJ76d6/UznBndt/5WDy3Gmv8FOP2VsYK
         UOghcY9pCmOSnnP9IeBid+bC2UbX4NdK8W3zOjRcRySfnsWbWcTQgr89Zgo8WGtBwQRc
         E3yv0fWfL6HFS5QHjM/WMt+EsPkip4Z1gRpU+mhYNRQ0jjMdQHJhv312mN49KwuxXz0T
         bMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RP7aQ/mDtx68lmXqFmvCAriC0i1lfI3ZK9yP65KhELQ=;
        b=uZbitotFSFFP5fgN6bPw4Hw0xpWzvl8MV3MS0tozFa2ZS8KAhwmOya9YYL0lNY09tD
         l2ny9jwtybY8Xv8aWcF6mzDHoJoce1i1jFPYsNE7ESXU1n65Dz3qzPsF3VWlXzCb2PNL
         W4C4Izm0ozKY5K5rUOgZTSgzCag3KGnzSqOtzChszvdVSlP9Po+aS+CAFf7p+oz0VsgR
         hXcsOteQB84PbIJdmQkT4Wmos5/2EfpF3IzLWkHiJEuIqA4hCasqdakUgRwJNxIdDW1P
         kctbBeh+jQELru9ZelfBT4n3u7wlb06VyXoBOfmMf0BB5hFT1CLPWIy6uDPtbdioHtTT
         UJgw==
X-Gm-Message-State: AO0yUKXeDq0M0ziciEs/HfE689BwpNfILaqkDE2FH/tI0PiFTJjJMsHg
	I5kBwykRPXAAJTbIygaDJTT6RGft8ScIUQ4qCv0=
X-Google-Smtp-Source: AK7set+kcf7q+/E9YI07UqnKRs6sX9N2ySYQ+ahPeYbG5QZlE2FeWNCUZhWmICRzMSWr4ue43+yBWnR4BPmXohP+fnU=
X-Received: by 2002:a05:6830:4189:b0:693:d263:565a with SMTP id
 r9-20020a056830418900b00693d263565amr525864otu.3.1677178025097; Thu, 23 Feb
 2023 10:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20230223175634.1073050-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230223175634.1073050-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Feb 2023 10:46:54 -0800
Message-ID: <CAMKF1srm6HnaGTbkDNQCwnUhNZcKiWtBO35g2bDg-1P+u9Hrqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Fix nativesdk ld.so search
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000069411a05f562702a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 18:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177620

--00000000000069411a05f562702a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch it seems ok to me
At least it=E2=80=99s not poking at build machine for ld.so.conf anymore

On Thu, Feb 23, 2023 at 9:56 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Currently binutils in buildtools is searching for /etc/etc/ld.so.conf
> which makes no sense. ld_sysconfdir already contains /etc so we need to
> drop the /etc from the fixed string.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...3-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> index 8e5e2be81dd..54967b9362f 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> @@ -65,7 +65,7 @@ index eff6693e052..95787012b89 100644
>         info.path =3D NULL;
>         info.len =3D info.alloc =3D 0;
>  -      tmppath =3D concat (ld_sysroot, prefix, "/etc/ld.so.conf",
> -+      tmppath =3D concat (ld_sysconfdir, "/etc/ld.so.conf",
> ++      tmppath =3D concat (ld_sysconfdir, "/ld.so.conf",
>                         (const char *) NULL);
>         if (!ldelf_parse_ld_so_conf (&info, tmppath))
>         {
> --
> 2.37.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177618):
> https://lists.openembedded.org/g/openembedded-core/message/177618
> Mute This Topic: https://lists.openembedded.org/mt/97188650/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000069411a05f562702a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the patch it seems ok to me</div><div dir=3D"a=
uto">At least it=E2=80=99s not poking at build machine for ld.so.conf anymo=
re=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Feb 23, 2023 at 9:56 AM Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Currently binutil=
s in buildtools is searching for /etc/etc/ld.so.conf<br>
which makes no sense. ld_sysconfdir already contains /etc so we need to<br>
drop the /etc from the fixed string.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0...3-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch | 2 +=
-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesd=
k-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/=
binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch<br=
>
index 8e5e2be81dd..54967b9362f 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Searc=
h-for-alternative-ld.so.conf.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Searc=
h-for-alternative-ld.so.conf.patch<br>
@@ -65,7 +65,7 @@ index eff6693e052..95787012b89 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info.path =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info.len =3D info.alloc =3D 0;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 tmppath =3D concat (ld_sysroot, prefix, &quot;/=
etc/ld.so.conf&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 tmppath =3D concat (ld_sysconfdir, &quot;/etc/ld.so.=
conf&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 tmppath =3D concat (ld_sysconfdir, &quot;/ld.so.conf=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (const char *) NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ldelf_parse_ld_so_conf (&amp;info, tmppath=
))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-- <br>
2.37.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177618): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177618" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177618</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97188650/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97188650/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000069411a05f562702a--

