Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA92C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 15:02:03 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.19162.1708268514908211833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 07:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/vvfvy2;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60821136c5aso2336627b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 07:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708268514; x=1708873314; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=obd3rpLfHn6zwp4DdrKNFtGq4UNYs0sRnOV3djtdnLo=;
        b=D/vvfvy2ORFW7H2xEDYs46VCNQ+bVhjTPUHi9pRIfmOMDaftV4WEib4qz0AM/OZbAs
         /6RVTbJeJw67idleBykRZuf52gx0wrGyiVu28NsK6S1BGufkJ7SThipAsqrhzEKJFhfv
         yuuatNAeoudOzQWVnNTD6Dny1vVho1OHAxppS69hYgHMbvwmPGEuudsAgu5VtO8GKUXm
         VyWoqNof0Wx53hKNp4OIYJ8xiQNlfhNyeCizzz3OdjvH6yz9UDkMZ7KeZVltJDxd1mN6
         tXx2BxPtJ+n6A2p5OetCD6fn5Gm1jzi9mDMvwYG/lv+w/uOu+m94F1ose/tQnQQ7rJAT
         DCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708268514; x=1708873314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obd3rpLfHn6zwp4DdrKNFtGq4UNYs0sRnOV3djtdnLo=;
        b=Yv8aCDG4dLo4rM4pmMWAgzVeFR5u+/uq8Njf9ngl4rZYjQImdfmduwhmgJ/RuQcAh7
         jSDDFyb2dofapbLRcvdxeLihizKxMxGRae4ggAVdPPFnK07i0ZnUbHsX80ekQU+fHRU9
         Dmb/+3dGc75fAKsJK1Lsbw9P+43/pLazj9S2nDirePgrZCtIaIyqgW2NS38g/K/AuNBb
         LkgcLdEjSnt672zcp3g8KtneIV4J5C5hqEYwyr6bZDjbHgQrRaopPEkbSo6RWoVM22Fm
         6zeCBHuhoCMrWqUOwk61qPqazkqTbZQ69vuDgBPrB+zmlVNJdWCq28Q2bmN9bDhnsMiA
         dO1A==
X-Gm-Message-State: AOJu0YzycvoOMN7gMgXEL4Cvn/a/nwBBPjvFscxtoJn74f83KIfsUfFq
	a+1KjUwBVOJNrtpdC0nwpnqtqHMT1HXj3S/P5CtzPC9pTb61ov6njOyJZWSmrAEBIbrcxcUyYtL
	8sbLPzamIABG1Nj91amejupX5MP4=
X-Google-Smtp-Source: AGHT+IFyHZ39Bc2XNqe7DOo6fatl9ASeBYbE3aSyzfitu8Y98hbwE+jKHygGDkcDQx+B1cH9gQSwn8iNJBgjKfX9qiQ=
X-Received: by 2002:a81:b71b:0:b0:604:3ee2:f258 with SMTP id
 v27-20020a81b71b000000b006043ee2f258mr9171780ywh.45.1708268513941; Sun, 18
 Feb 2024 07:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20240218123250.1516996-1-simone.p.weiss@posteo.com>
In-Reply-To: <20240218123250.1516996-1-simone.p.weiss@posteo.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 18 Feb 2024 07:01:42 -0800
Message-ID: <CANx9H-AfpAq7A6-kWjYhQEcByop69ziqgRiTw99nGhsvgEmkrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: upgrade 9.0.2130 -> 9.0.2142
To: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f45f610611a9413c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 15:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195831

--000000000000f45f610611a9413c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 4:33=E2=80=AFAM Simone Wei=C3=9F <simone.p.weiss@po=
steo.com>
wrote:

> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>
> Changes:
> https://github.com/vim/vim/compare/v9.0.2130...v9.0.2142
>
> This fixes CVE-2024-22667
>
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
>  meta/recipes-support/vim/vim.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> index 6b440d8947..84af72472a 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://
> github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps \
>             file://no-path-adjust.patch \
>             "
>
> -PV .=3D ".2130"
> +PV .=3D ".2142"
>  SRCREV =3D "075ad7047457debfeef13442c01e74088b461092"
>
You need to actually change the SRCREV to point to .2142

https://github.com/vim/vim/commits/v9.0.2142

b39b240c386a5a29241415541f1c99e2e6b8ce47


And then ask yourself if we should take an even more recent version:

https://github.com/vim/vim/commits/v9.1.0114


>  # Do not consider .z in x.y.z, as that is updated with every commit
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195828):
> https://lists.openembedded.org/g/openembedded-core/message/195828
> Mute This Topic: https://lists.openembedded.org/mt/104426571/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f45f610611a9413c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Feb 18, 2024 at 4:33=E2=80=AFAM Simone Wei=C3=9F &l=
t;<a href=3D"mailto:simone.p.weiss@posteo.com">simone.p.weiss@posteo.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)">From: Simone Wei=C3=9F &lt;<a href=
=3D"mailto:simone.p.weiss@posteo.com" target=3D"_blank">simone.p.weiss@post=
eo.com</a>&gt;<br>
<br>
Changes:<br>
<a href=3D"https://github.com/vim/vim/compare/v9.0.2130...v9.0.2142" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/vim/vim/compare/v9.0.2130=
...v9.0.2142</a><br>
<br>
This fixes CVE-2024-22667<br>
<br>
Signed-off-by: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo=
.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/vim/vim.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index 6b440d8947..84af72472a 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -19,7 +19,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/=
vim.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-path-adjust.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-PV .=3D &quot;.2130&quot;<br>
+PV .=3D &quot;.2142&quot;<br>
=C2=A0SRCREV =3D &quot;075ad7047457debfeef13442c01e74088b461092&quot;<br>
</blockquote><div dir=3D"auto">You need to actually change the SRCREV to po=
int to .2142</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a hre=
f=3D"https://github.com/vim/vim/commits/v9.0.2142">https://github.com/vim/v=
im/commits/v9.0.2142</a></div><br></div><div dir=3D"auto"><div><div>b39b240=
c386a5a29241415541f1c99e2e6b8ce47</div><br></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">And then ask yourself if we should take an even m=
ore recent version:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
><a href=3D"https://github.com/vim/vim/commits/v9.1.0114">https://github.co=
m/vim/vim/commits/v9.1.0114</a></div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
=C2=A0# Do not consider .z in x.y.z, as that is updated with every commit<b=
r>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195828): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195828" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195828</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104426571/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104426571/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f45f610611a9413c--

