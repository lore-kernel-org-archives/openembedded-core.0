Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD81C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 09:16:40 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web09.58724.1638177399206021518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 01:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MFVz3XHW;
 spf=pass (domain: gmail.com, ip: 209.85.221.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id h1so3351060vkh.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 01:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MYj8dA9rzdjFGcdcC7WJ1OHlPU7N24YYI5xwrZI+Wfc=;
        b=MFVz3XHWwbBZ/k3rsj7AEiIw6N6qGBmw/qQpTjU00tcOy08JTfnKHcsgM4DwFJfHaZ
         +zsOU1OJVzTpMWkCEfNzJXMpj5+B1EwOlfbbXhSxJTFIUL3lzKjspqo60R1j5q1WLzl8
         SrT8MXGKYEeOHJA2v9f8gtKozgL1JSFBXYa2DG9XOiwhQjUha1aDCtimtObjHnBhhdqt
         ktwQ9hcyK63JrUKxo3GCM3FW9hF6mowPU7ycD73ump4DCTbV2LnQwsr7v2oRaV527/IJ
         CDcBXJfmbga0Qb1PSiZtXZ1TxaG0UiPnzvlQf3aL6O7pYeq0ds5eH0sNI1a0gWZvhc4L
         bTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYj8dA9rzdjFGcdcC7WJ1OHlPU7N24YYI5xwrZI+Wfc=;
        b=HPh6wD4i067NtlVzXwd2hsaJtWxNO4eC1K9xybkaCIHy6Sjd3O+PFVBh88/4z6Nk71
         1nzLacOFcegbeAlxNtNU6zGAi1rwV2vSw5839kB16dAkghiS00NZAoMnKgwHJGAXY+5s
         9VzQvp3q4zoqz6QyS2EnacMz0ARMy4kO16R+UryyRVxMwYHdl8Ul80wzjm7ds3AuPhet
         MbjLlpHnB9pSkt4u/bD7vpQnQvdT0zvgUKB+ucekaF2BAJ/7T4oDQV3lQJkGPN5/9fG6
         +VjQPcecbRtnMBdNS9r0mg1dlU1u8q8vllZv40mTCJQE/E5E1Bc9jg1x3IGSSFzvRFM0
         uDdg==
X-Gm-Message-State: AOAM530z4ktefRjI+2Ym3B7xBs1Sn+bnnKng40ClfyAgl3+AO7/8z4VC
	K6cQTUUdG27UqLwtSHS8+QJ68DbmgvL5YL2VC2w=
X-Google-Smtp-Source: 
 ABdhPJyYqhwDDS4Mbb1EkcijNHbW5omvluU0SghmUd/J+LHCdkN0nBgZquD5RNCBFsMzCzcIouBCa9L2CirWo1Vl+90=
X-Received: by 2002:a05:6122:14b4:: with SMTP id
 c20mr34212104vkq.30.1638177398326;
 Mon, 29 Nov 2021 01:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Nov 2021 10:16:27 +0100
Message-ID: 
 <CANNYZj-nqD8u3b8_jpE9FhvGvzcpc2aJQqbo2WAhM4XejgXRGw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/9] Improve native/cross reproducibility
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e8074c05d1e9e5d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 09:16:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158933

--000000000000e8074c05d1e9e5d3
Content-Type: text/plain; charset="UTF-8"

Thanks Jacob. When looking at this patchset I kept asking myself, why is
this or that change necessary for -native but not for -target. I think it
would help if you include that information in the commits, particularly, in
1/9 as it is the most invasive change of all. Maybe we can then figure out
a better way.

Alex

On Sun, 28 Nov 2021 at 10:46, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> This patch series is not intended for merge. I only send it out to
> highlight where the problems are and to get some discussion going on
> how/if we want to improve the sitation.
>
> This is a patch series that tries to improve the reproducibility of the
> native/cross binaries when building in different directories. This has
> been tested on a Fedora 35 system which uses gcc 11.2.1 at the time of
> writing.
>
> The RUNTIME hack is questionable, maybe there is a better way to enforce
> a fixed RUNTIME entry size during linking. It probably breaks for
> recipes that do additional rpath manipulations at link-time.
>
> If in the end we do come up with a solution, then it should be tested on
> the autobuilders, since otherwise this is going to degrade overtime. It
> would then be important that the build paths are of significantly different
> lengths. TMPDIR=/tmp/sysrootA/ and TMPDIR=/tmp/sysrootB/ will *not*
> uncover all
> rpath problems.
>
> The end result of this patch series is that I can build python3-native
> in two different build paths, and the resuling sysroot-components/x86_64/
> directories are identical, except for the 'fixmepath.cmd' files, which
> are not included in the hash equiv calculations. Even so, there remains a
> lot of
> other native builds that are going to need to be fixed in similar ways
> as the ones in this patch series.
>
> For my images to build I had to avoid the rpath-hack for icedtea7-native
> and openjdk-8-native.
>
> /Jacob
>
> Jacob Kroon (9):
>   bitbake.conf: Pad rpath and remove build ID in native binaries
>   libtool: Improve native reproducibility
>   openssl: Improve native reproducibility
>   perl/perlcross: Improve native reproducability
>   pkgconfig: Improve native reproducibility
>   ncurses: Improve native reproducibility
>   util-linux: Improve native reproducibility
>   python3: Improve native reproducibility
>   bitbake.conf: Avoid rpath hack for Java recipes
>
>  meta/classes/chrpath.bbclass                  |  3 +
>  meta/conf/bitbake.conf                        |  8 +-
>  ...sysroot-and-debug-prefix-map-from-co.patch | 78 -------------------
>  .../openssl/openssl/strip-buildinfo.patch     | 13 ++++
>  .../openssl/openssl_3.0.0.bb                  | 10 +--
>  meta/recipes-core/ncurses/ncurses.inc         |  4 +
>  .../util-linux/util-linux_2.37.2.bb           |  2 +-
>  .../libtool/libtool-native_2.4.6.bb           |  1 +
>  ...ism.patch => perl-cross-determinism.patch} |  0
>  .../perl-cross/perlcross_1.3.6.bb             |  4 +-
>  meta/recipes-devtools/perl/perl_5.34.0.bb     |  5 ++
>  .../pkgconfig/pkgconfig_git.bb                |  1 +
>  .../python/python3/determinism.patch          | 15 ++++
>  .../recipes-devtools/python/python3_3.10.0.bb |  8 ++
>  14 files changed, 65 insertions(+), 87 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch
>  rename meta/recipes-devtools/perl-cross/files/{determinism.patch =>
> perl-cross-determinism.patch} (100%)
>  create mode 100644 meta/recipes-devtools/python/python3/determinism.patch
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158867):
> https://lists.openembedded.org/g/openembedded-core/message/158867
> Mute This Topic: https://lists.openembedded.org/mt/87352786/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e8074c05d1e9e5d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Jacob. When looking at this patchset I kept as=
king myself, why is this or that change necessary for -native but not for -=
target. I think it would help if you include that information in the commit=
s, particularly, in 1/9 as it is the most invasive change of all. Maybe we =
can then figure out a better way.<br></div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, 28 Nov 2021 at 10:46, Jacob Kroon &lt;<a href=3D"mailto:jacob.kro=
on@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">This patch series is not intended for me=
rge. I only send it out to<br>
highlight where the problems are and to get some discussion going on<br>
how/if we want to improve the sitation.<br>
<br>
This is a patch series that tries to improve the reproducibility of the<br>
native/cross binaries when building in different directories. This has<br>
been tested on a Fedora 35 system which uses gcc 11.2.1 at the time of<br>
writing.<br>
<br>
The RUNTIME hack is questionable, maybe there is a better way to enforce<br=
>
a fixed RUNTIME entry size during linking. It probably breaks for<br>
recipes that do additional rpath manipulations at link-time.<br>
<br>
If in the end we do come up with a solution, then it should be tested on<br=
>
the autobuilders, since otherwise this is going to degrade overtime. It<br>
would then be important that the build paths are of significantly different=
<br>
lengths. TMPDIR=3D/tmp/sysrootA/ and TMPDIR=3D/tmp/sysrootB/ will *not* unc=
over all<br>
rpath problems.<br>
<br>
The end result of this patch series is that I can build python3-native<br>
in two different build paths, and the resuling sysroot-components/x86_64/<b=
r>
directories are identical, except for the &#39;fixmepath.cmd&#39; files, wh=
ich<br>
are not included in the hash equiv calculations. Even so, there remains a l=
ot of<br>
other native builds that are going to need to be fixed in similar ways<br>
as the ones in this patch series.<br>
<br>
For my images to build I had to avoid the rpath-hack for icedtea7-native<br=
>
and openjdk-8-native.<br>
<br>
/Jacob<br>
<br>
Jacob Kroon (9):<br>
=C2=A0 bitbake.conf: Pad rpath and remove build ID in native binaries<br>
=C2=A0 libtool: Improve native reproducibility<br>
=C2=A0 openssl: Improve native reproducibility<br>
=C2=A0 perl/perlcross: Improve native reproducability<br>
=C2=A0 pkgconfig: Improve native reproducibility<br>
=C2=A0 ncurses: Improve native reproducibility<br>
=C2=A0 util-linux: Improve native reproducibility<br>
=C2=A0 python3: Improve native reproducibility<br>
=C2=A0 bitbake.conf: Avoid rpath hack for Java recipes<br>
<br>
=C2=A0meta/classes/chrpath.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +-<br>
=C2=A0...sysroot-and-debug-prefix-map-from-co.patch | 78 ------------------=
-<br>
=C2=A0.../openssl/openssl/strip-buildinfo.patch=C2=A0 =C2=A0 =C2=A0| 13 +++=
+<br>
=C2=A0.../openssl/<a href=3D"http://openssl_3.0.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">openssl_3.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +--<br>
=C2=A0meta/recipes-core/ncurses/ncurses.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 +<br>
=C2=A0.../util-linux/<a href=3D"http://util-linux_2.37.2.bb" rel=3D"norefer=
rer" target=3D"_blank">util-linux_2.37.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../libtool/<a href=3D"http://libtool-native_2.4.6.bb" rel=3D"norefer=
rer" target=3D"_blank">libtool-native_2.4.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0...ism.patch =3D&gt; perl-cross-determinism.patch} |=C2=A0 0<br>
=C2=A0.../perl-cross/<a href=3D"http://perlcross_1.3.6.bb" rel=3D"noreferre=
r" target=3D"_blank">perlcross_1.3.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.34.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
5 ++<br>
=C2=A0.../pkgconfig/<a href=3D"http://pkgconfig_git.bb" rel=3D"noreferrer" =
target=3D"_blank">pkgconfig_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../python/python3/determinism.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 15 ++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3_3.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.10.0.bb</a> |=C2=A0 8 ++<br>
=C2=A014 files changed, 65 insertions(+), 87 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-bui=
ldinfo-strip-sysroot-and-debug-prefix-map-from-co.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/strip-bu=
ildinfo.patch<br>
=C2=A0rename meta/recipes-devtools/perl-cross/files/{determinism.patch =3D&=
gt; perl-cross-determinism.patch} (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/determinism.p=
atch<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158867): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158867" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158867</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87352786/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87352786/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e8074c05d1e9e5d3--

