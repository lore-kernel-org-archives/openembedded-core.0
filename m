Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FACECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 02:08:13 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.1811.1666922864035595456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 19:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IOwTYvCI;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id ud5so9788447ejc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 19:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LP7uTEkyUPEvrCd8KHDGjJMFcMLKhmqLxBx6C2h8L8o=;
        b=IOwTYvCI//8oit9jR3KTRevl9UtRQSZIaJCyG0pEfUmskPWRqaExlmid0Y9gHFuCIM
         XJVwlOMIPFnCUnq4yycoT9gITFFWiA0l1imyjnlx84fi5vkuhwB50BJmfUQinuVmu3DP
         neSOhUXEVLcqXpZAatCbkXUxvmqCsmavaX5UTKufKIH6SNTFb7LAaiylvTtZTGJX4LbX
         LNVjFTFFcS/1d7HlddfYZz2lfikfuBZR06dUAE1o223mNX0hDapA86p9VMacl5lcxPX9
         6MHepxW7JgaQRiZiiWwc4bvmSsXjzdcJTUL3QnP66eHrz2RrBGp27IheG34CnsmrmC49
         2oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LP7uTEkyUPEvrCd8KHDGjJMFcMLKhmqLxBx6C2h8L8o=;
        b=vZHYBUMkreV9bakFZbDtyN+Ho/arx1zDN7uhXoWZtoWX3DZPHyZHUb3N7ZUv7p0EUW
         9rduEbIxcx5hGGODWrv7hMU5SODVHuE4VHFbkB/eAySzWvx2lmqxGYPlcNOvSaLjKVqG
         apamJ7ZoeCPfz9rQSMip5tTvzYC2AaU2BLmTpQXhsXMqu+RdN1Kgg4SuoJEKd/MFPonw
         USmClllrpAxKHEK7wYZwjEhi+bclMU5e2ni0xjwM2jBvJzxsKelweReV4NdH8JG5qnzL
         dk0x0WV94QdMKezPHi36/rZM4OaDkxqmanSyicjnx5htWYN07sxYnfQIKlGe56v1JiXx
         sKyw==
X-Gm-Message-State: ACrzQf0kq0QmIo1aGR19+GkY/8ZFNZbg89AiDRMdoXXaPjGNT2EDn54Y
	NxZbwr4h/yx8Uc/B0zJwDqFVIzhypmNu/eckQ04=
X-Google-Smtp-Source: AMsMyM7FZlq3o7Lj0oBnMKFIlxtuwVCcyo1kfoHC1DDE01AQfXU45nof1NZD7wu1gGCsZ8zcqIOq3GOvhCuTR0foc80=
X-Received: by 2002:a17:907:7704:b0:780:da38:4480 with SMTP id
 kw4-20020a170907770400b00780da384480mr45030303ejc.64.1666922862301; Thu, 27
 Oct 2022 19:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666825041.git.steve@sakoman.com>
In-Reply-To: <cover.1666825041.git.steve@sakoman.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 27 Oct 2022 19:07:31 -0700
Message-ID: <CANx9H-BiAWBRLfFPgjQwF9cR1GHcOwP-eq82p_gQCmrn=zs8KA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 0/8] Patch review
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001357c105ec0eb958"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 02:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172233

--0000000000001357c105ec0eb958
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 7:36 PM Steve Sakoman <steve@sakoman.com> wrote:

> Please review this set of patches for kirkstone and have comments back by
> end of day Friday.
>
> This should be the final set of patches for the 4.0.5 release.


I am intentionally holding off on a Python 3.10.8 upgrade just to let this
release get out in a stable manner.


>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4380
>
> The following changes since commit
> 4781fee6aea9512b7cb390b76e6f9f0a86a5bd11:
>
>   lttng-modules: Fix crash on powerpc64 (2022-10-17 04:30:43 -1000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/kirkstone-nut
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut
>
> Bruce Ashfield (2):
>   linux-yocto/5.10: update to v5.10.147
>   linux-yocto/5.10: update to v5.10.149
>
> Steve Sakoman (1):
>   Revert "lttng-tools: Upgrade 2.13.4 -> 2.13.8"
>
> Tim Orling (1):
>   git: upgrade 2.35.4 -> 2.35.5
>
> Vyacheslav Yurkov (2):
>   files: overlayfs-etc: refactor preinit template
>   classes: files: Extend overlayfs-etc class
>
> Yash Shinde (2):
>   binutils: stable 2.38 branch updates
>   glibc: stable 2.35 branch updates.
>
>  meta/classes/overlayfs-etc.bbclass            |  5 +++-
>  meta/files/overlayfs-etc-preinit.sh.in        | 23 ++++++++++++++----
>  meta/recipes-core/glibc/glibc-version.inc     |  2 +-
>  .../binutils/binutils-2.38.inc                |  2 +-
>  .../git/{git_2.35.4.bb => git_2.35.5.bb}      |  2 +-
>  .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
>  .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
>  ...-tools_2.13.8.bb => lttng-tools_2.13.4.bb} |  2 +-
>  9 files changed, 45 insertions(+), 29 deletions(-)
>  rename meta/recipes-devtools/git/{git_2.35.4.bb => git_2.35.5.bb} (98%)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.8.bb =>
> lttng-tools_2.13.4.bb} (98%)
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172179):
> https://lists.openembedded.org/g/openembedded-core/message/172179
> Mute This Topic: https://lists.openembedded.org/mt/94596838/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001357c105ec0eb958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 26, 2022 at 7:36 PM Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">Please review this set of patches for kirkstone and have comm=
ents back by<br>
end of day Friday.<br>
<br>
This should be the final set of patches for the 4.0.5 release.</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">I am intentionally holding of=
f on a Python 3.10.8 upgrade just to let this release get out in a stable m=
anner.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Passed a-full on autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/4380" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/4380</a><br>
<br>
The following changes since commit 4781fee6aea9512b7cb390b76e6f9f0a86a5bd11=
:<br>
<br>
=C2=A0 lttng-modules: Fix crash on powerpc64 (2022-10-17 04:30:43 -1000)<br=
>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/kirkstone-nut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/kirkstone-nut" rel=3D"noreferrer" target=3D"_blank">http://cg=
it.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-nut=
</a><br>
<br>
Bruce Ashfield (2):<br>
=C2=A0 linux-yocto/5.10: update to v5.10.147<br>
=C2=A0 linux-yocto/5.10: update to v5.10.149<br>
<br>
Steve Sakoman (1):<br>
=C2=A0 Revert &quot;lttng-tools: Upgrade 2.13.4 -&gt; 2.13.8&quot;<br>
<br>
Tim Orling (1):<br>
=C2=A0 git: upgrade 2.35.4 -&gt; 2.35.5<br>
<br>
Vyacheslav Yurkov (2):<br>
=C2=A0 files: overlayfs-etc: refactor preinit template<br>
=C2=A0 classes: files: Extend overlayfs-etc class<br>
<br>
Yash Shinde (2):<br>
=C2=A0 binutils: stable 2.38 branch updates<br>
=C2=A0 glibc: stable 2.35 branch updates.<br>
<br>
=C2=A0meta/classes/overlayfs-etc.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 +++-<br>
=C2=A0meta/files/<a href=3D"http://overlayfs-etc-preinit.sh.in" rel=3D"nore=
ferrer" target=3D"_blank">overlayfs-etc-preinit.sh.in</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 23 ++++++++++++++----<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0.../binutils/binutils-2.38.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../git/{<a href=3D"http://git_2.35.4.bb" rel=3D"noreferrer" target=
=3D"_blank">git_2.35.4.bb</a> =3D&gt; <a href=3D"http://git_2.35.5.bb" rel=
=3D"noreferrer" target=3D"_blank">git_2.35.5.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.10.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-rt_5.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.10.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-yocto-tiny_5.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++----<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.10.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.10.bb</a> | 24 +++++++++---=
-------<br>
=C2=A0...-<a href=3D"http://tools_2.13.8.bb" rel=3D"noreferrer" target=3D"_=
blank">tools_2.13.8.bb</a> =3D&gt; <a href=3D"http://lttng-tools_2.13.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">lttng-tools_2.13.4.bb</a>} |=C2=A0 2 =
+-<br>
=C2=A09 files changed, 45 insertions(+), 29 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/git/{<a href=3D"http://git_2.35.4.bb" re=
l=3D"noreferrer" target=3D"_blank">git_2.35.4.bb</a> =3D&gt; <a href=3D"htt=
p://git_2.35.5.bb" rel=3D"noreferrer" target=3D"_blank">git_2.35.5.bb</a>} =
(98%)<br>
=C2=A0rename meta/recipes-kernel/lttng/{<a href=3D"http://lttng-tools_2.13.=
8.bb" rel=3D"noreferrer" target=3D"_blank">lttng-tools_2.13.8.bb</a> =3D&gt=
; <a href=3D"http://lttng-tools_2.13.4.bb" rel=3D"noreferrer" target=3D"_bl=
ank">lttng-tools_2.13.4.bb</a>} (98%)<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172179): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172179" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172179</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94596838/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94596838/924729</a><br>
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

--0000000000001357c105ec0eb958--

