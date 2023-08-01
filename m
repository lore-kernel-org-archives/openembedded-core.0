Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BADC0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 20:48:39 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.1428.1690922914992718364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 13:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Bdq2ebiC;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a5abb5e2aeso4775846b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 13:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690922914; x=1691527714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GCrMFDdfPeGINWKmQH7wTIDe1noFbAnEygd+wmjLrT0=;
        b=Bdq2ebiCnXsxJNcIl/2l48xFZDwN3M522CgCGFw3uoOslI86LDNPqMm/Z+wquJIcHr
         boBE63SNR6y9Sq7KC75Ls+zw8KX/2vC9h18CyNb135ixhCIDTTCSiSpkY2JaMogfF2X4
         akDn3QTMrvrjGtZx7V+XjChA1F6jDpiG/vr4U54Cu9Ft6bggC3eeFoH27GgtNEMofDTz
         cmUdjV4+vkgLiJwdlRVRfPwoPlFBvUhM1VYqlZYwC+UvGEIjmon1BjrcEqFGTaCG5rGW
         QUudqY95Vq69XMiRDSHeW1gqaO1bvIVMQeMHdwgAibNIvx3it8rWb9GG80eWVXwI2GRb
         eBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690922914; x=1691527714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCrMFDdfPeGINWKmQH7wTIDe1noFbAnEygd+wmjLrT0=;
        b=FNgJ7kZBwWLmuN6wK2pHRY1IKwqunXGifZ9NbkTQyqWW7sFWnCDWscvSRZxXY2ElIA
         bI8zwmnNnSIPLiRb+VBUAoIuIx7fl0lNdxVxrkEvzi3ay/L5Ww3AU2LmkEZN1ibe4zxJ
         tHxd6SHslztYlMq9pmg/dYjyRINoaLBT3lGwHqNlr3sa0bCWvAzpq/m/UBvVdzlEwJlk
         wGIyzHRTNi0sc2wfCQi4LUFFnCQWpKAVAortBn2SALVdw149q4xnk6HF3HlIUGqdMYG7
         TRXNoo2ck/laSgMq4VCVHyZtkHueFA5rrFz1rhoLqwCCWa0sab2W1GjmE5/FYAu3/2M7
         kGiQ==
X-Gm-Message-State: ABy/qLZ0ecKPZ9KJogdgHBXwUWdNMW40YZeezw6RBripPNd5D+VdN3AE
	3FA3gM509tZuc4cPkHHYs3ovl+eUQko8b4ayp3s=
X-Google-Smtp-Source: APBJJlGmVwFV7utGs2d0MHnCykeWfo1tSwc6uzgZcPYG3GquT7Jjl8lHKeidHfL/jVkIDWKGOpzNlEMyOx6dI6y6Fco=
X-Received: by 2002:a05:6808:2197:b0:3a4:357a:ebf4 with SMTP id
 be23-20020a056808219700b003a4357aebf4mr19797015oib.0.1690922913929; Tue, 01
 Aug 2023 13:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <01010189b1ee533c-9d06d28e-1ac4-48ec-9c61-acc24630bbad-000000@us-west-2.amazonses.com>
 <CANNYZj8AmqfvSzO=buyS9j6kAo2L4d_Q+FfsQHmwYvidnt++bQ@mail.gmail.com>
In-Reply-To: <CANNYZj8AmqfvSzO=buyS9j6kAo2L4d_Q+FfsQHmwYvidnt++bQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Aug 2023 13:48:22 -0700
Message-ID: <CANx9H-D=YBxeCLuF-2ssxzGsKTrSGTyG2gak=PKban9jgrJWmg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2023-08-01
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Auto Upgrade Helper <auh@yoctoproject.org>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a09e6c0601e2ab99"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 20:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185362

--000000000000a09e6c0601e2ab99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 9:36=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> A lot of the failures seem to be about
>
> File
> "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/up=
grade.py",
> line 473, in _extract_licenses
>     with open(os.path.join(srcpath, path), 'rb') as f:
>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> FileNotFoundError: [Errno 2] No such file or directory:
>
> '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/cur=
l/COPYING'
>
> As the projects didn't do anything to license files, something has
> clearly regressed here, I'll take a look and probably start a re-run.
>
>
I did the meta-perl/meta-python run on Sunday 30th and noticed the same
much higher preponderance of devtool errors.
I did a run of the recipes in oe-core that I maintain on 25th July and it
had less devtool errors (3 of my recipes passed,
only python3-sphinx failed and that was not devtool related). So that 5 day
window is where something regressed.

Alex
>
>
> On Tue, 1 Aug 2023 at 18:30, Auto Upgrade Helper <auh@yoctoproject.org>
> wrote:
> >
> > AUH finished upgrade batch the result patches/logs can be found at:
> > https://autobuilder.yocto.io/pub/auh/20230801050116, next are the
> statistics:
> >
> > Recipe upgrade statistics:
> >
> >     * Failed (devtool error): 76
> >         bind, 9.18.17, Unassigned <unassigned@yoctoproject.org>
> >         kea, 2.4.0, Unassigned <unassigned@yoctoproject.org>
> >         openssh, 9.3p2, Unassigned <unassigned@yoctoproject.org>
> >         gettext, 0.22, Robert Yang <liezhi.yang@windriver.com>
> >         glibc-tests, 2.38, Lukasz Majewski <lukma@denx.de>
> >         glibc, 2.38, Khem Raj <raj.khem@gmail.com>
> >         libcgroup, 3.1.0, Alexander Kanavin <alex.kanavin@gmail.com>
> >         systemd-boot, 254, Chen Qi <Qi.Chen@windriver.com>
> >         systemd, 254, Chen Qi <Qi.Chen@windriver.com>
> >         util-linux-libuuid, 2.39.1, Chen Qi <Qi.Chen@windriver.com>
> >         util-linux, 2.39.1, Chen Qi <Qi.Chen@windriver.com>
> >         binutils, 2.41, Khem Raj <raj.khem@gmail.com>
> >         cmake, 3.27.1, Unassigned <unassigned@yoctoproject.org>
> >         gnu-config, 20230216-new-commits-available, Robert Yang <
> liezhi.yang@windriver.com>
> >         meson, 1.2.0, Alexander Kanavin <alex.kanavin@gmail.com>
> >         perl, 5.38.0, Alexander Kanavin <alex.kanavin@gmail.com>
> >         python3-certifi, 2023.7.22, Tim Orling <tim.orling@konsulko.com=
>
> >         python3-cython, 3.0.0, Unassigned <unassigned@yoctoproject.org>
> >         python3-dbusmock, 0.29.1, Unassigned <
> unassigned@yoctoproject.org>
> >         python3-dtschema, 2023.7, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> >         python3-editables, 0.5, Ross Burton <ross.burton@arm.com>
> >         python3-jsonschema, 4.18.4, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> >         python3-libarchive-c, 5.0, Joshua Watt <JPEWhacker@gmail.com>
> >         python3-markdown, 3.4.4, Alexander Kanavin <
> alex.kanavin@gmail.com>
> >         python3-more-itertools, 10.0.0, Tim Orling <
> tim.orling@konsulko.com>
> >         python3-numpy, 1.25.2, Unassigned <unassigned@yoctoproject.org>
> >         python3-pathspec, 0.11.2, Ross Burton <ross.burton@arm.com>
> >         python3-pip, 23.2.1, Zang Ruochen <zangruochen@loongson.cn>
> >         python3-pyparsing, 3.1.1, Unassigned <
> unassigned@yoctoproject.org>
> >         python3-sphinx, 7.1.1, Tim Orling <tim.orling@konsulko.com>
> >         python3-wheel, 0.41.0, Tim Orling <tim.orling@konsulko.com>
> >         cargo, 1.71.0, Randy MacLeod <Randy.MacLeod@windriver.com>
> >         libstd-rs, 1.71.0, Randy MacLeod <Randy.MacLeod@windriver.com>
> >         rust-llvm, 1.71.0, Randy MacLeod <Randy.MacLeod@windriver.com>
> >         rust, 1.71.0, Randy MacLeod <Randy.MacLeod@windriver.com>
> >         vala, 0.56.9, Alexander Kanavin <alex.kanavin@gmail.com>
> >         ethtool, 6.4, Changhyeok Bae <changhyeok.bae@gmail.com>
> >         go-helloworld, 0.1-new-commits-available, Khem Raj <
> raj.khem@gmail.com>
> >         groff, 1.23.0, Hongxu Jia <hongxu.jia@windriver.com>
> >         libarchive, 3.7.1, Otavio Salvador <
> otavio.salvador@ossystems.com.br>
> >         sudo, 1.9.14p3, Chen Qi <Qi.Chen@windriver.com>
> >         tar, 1.35, Chen Qi <Qi.Chen@windriver.com>
> >         epiphany, 44.6, Alexander Kanavin <alex.kanavin@gmail.com>
> >         adwaita-icon-theme, 44.0, Ross Burton <ross.burton@arm.com>
> >         libgudev, 238, Ross Burton <ross.burton@arm.com>
> >         librsvg, 2.56.3, Anuj Mittal <anuj.mittal@intel.com>
> >         harfbuzz, 8.1.0, Anuj Mittal <anuj.mittal@intel.com>
> >         libsdl2, 2.28.1, Yi Zhao <yi.zhao@windriver.com>
> >         libglu, 9.0.3, Ross Burton <ross.burton@arm.com>
> >         mesa, 23.1.4, Otavio Salvador <otavio.salvador@ossystems.com.br=
>
> >         piglit, 1.0-new-commits-available, Ross Burton <
> ross.burton@arm.com>
> >         vulkan-loader, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
> >         vulkan-samples, git-new-commits-available, Ross Burton <
> ross.burton@arm.com>
> >         wayland-utils, 1.2.0, Denys Dmytriyenko <denis@denix.org>
> >         libpthread-stubs, 0.5, Alexander Kanavin <alex.kanavin@gmail.co=
m
> >
> >         lttng-modules, 2.13.10, Richard Purdie <
> richard.purdie@linuxfoundation.org>
> >         lttng-tools, 2.13.10, Richard Purdie <
> richard.purdie@linuxfoundation.org>
> >         gst-devtools, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
> >         gstreamer1.0-libav, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
> >         gstreamer1.0-omx, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
> >         gstreamer1.0-plugins-bad, 1.22.5, Anuj Mittal <
> anuj.mittal@intel.com>
> >         gstreamer1.0-plugins-base, 1.22.5, Anuj Mittal <
> anuj.mittal@intel.com>
> >         gstreamer1.0-plugins-good, 1.22.5, Anuj Mittal <
> anuj.mittal@intel.com>
> >         gstreamer1.0-plugins-ugly, 1.22.5, Anuj Mittal <
> anuj.mittal@intel.com>
> >         gstreamer1.0-python, 1.22.5, Anuj Mittal <anuj.mittal@intel.com=
>
> >         gstreamer1.0-rtsp-server, 1.22.5, Anuj Mittal <
> anuj.mittal@intel.com>
> >         gstreamer1.0-vaapi, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
> >         gstreamer1.0, 1.22.5, Anuj Mittal <anuj.mittal@intel.com>
> >         webkitgtk, 2.40.4, Alexander Kanavin <alex.kanavin@gmail.com>
> >         curl, 8.2.1, Robert Joslyn <robert.joslyn@redrectangle.org>
> >         diffoscope, 246, Joshua Watt <JPEWhacker@gmail.com>
> >         gmp, 6.3.0, Khem Raj <raj.khem@gmail.com>
> >         gnupg, 2.4.3, Hongxu Jia <hongxu.jia@windriver.com>
> >         gpgme, 1.21.0, Hongxu Jia <hongxu.jia@windriver.com>
> >         libgit2, 1.7.0, Unassigned <unassigned@yoctoproject.org>
> >         re2c, 3.1, Khem Raj <raj.khem@gmail.com>
> >     * Succeeded: 19
> >         dhcpcd, 10.0.2, Unassigned <unassigned@yoctoproject.org>
> >         seatd, 0.8.0, Alexander Kanavin <alex.kanavin@gmail.com>
> >         btrfs-tools, 6.3.3, Wang Mingyu <wangmy@fujitsu.com>
> >         createrepo-c, 1.0.0, Alexander Kanavin <alex.kanavin@gmail.com>
> >         dnf, 4.16.2, Alexander Kanavin <alex.kanavin@gmail.com>
> >         file, 5.45, Yi Zhao <yi.zhao@windriver.com>
> >         libdnf, 0.70.2, Alexander Kanavin <alex.kanavin@gmail.com>
> >         mmc-utils, 0.1-new-commits-available, Anuj Mittal <
> anuj.mittal@intel.com>
> >         python3-dtc, 1.7.0, Trevor Gamblin <tgamblin@baylibre.com>
> >         sysklogd, 2.5.1, Chen Qi <Qi.Chen@windriver.com>
> >         glslang, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.com>
> >         shaderc, 2023.5, Jose Quaresma <quaresma.jose@gmail.com>
> >         spirv-headers, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.co=
m
> >
> >         spirv-tools, 1.3.250.1, Jose Quaresma <quaresma.jose@gmail.com>
> >         vulkan-headers, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
> >         vulkan-tools, 1.3.250.1, Anuj Mittal <anuj.mittal@intel.com>
> >         vulkan-validation-layers, 1.3.250.1, Vincent Davis Jr
> <vince@underview.tech>
> >         puzzles, 0.0-new-commits-available, Anuj Mittal <
> anuj.mittal@intel.com>
> >         xxhash, 0.8.2, Alexander Kanavin <alex.kanavin@gmail.com>
> >     * Failed(other errors): 1
> >         glibc-testsuite, 2.38, Khem Raj <raj.khem@gmail.com>
> >     * Failed(do_compile): 1
> >         stress-ng, 0.16.02, Anuj Mittal <anuj.mittal@intel.com>
> >
> >     TOTAL: attempted=3D97 succeeded=3D19(19.59%) failed=3D78(80.41%)
> >
> > Recipe upgrade statistics per Maintainer:
> >
> >     Chen Qi <Qi.Chen: attempted=3D7 succeeded=3D1(14.29%) failed=3D6(85=
.71%)
> >     Richard Purdie <richard.purdie: attempted=3D2 succeeded=3D0(0.00%)
> failed=3D2(100.00%)
> >     Unassigned <unassigned: attempted=3D10 succeeded=3D1(10.00%)
> failed=3D9(90.00%)
> >     Randy MacLeod <Randy.MacLeod: attempted=3D4 succeeded=3D0(0.00%)
> failed=3D4(100.00%)
> >     Robert Joslyn <robert.joslyn: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
> >     Bruce Ashfield <bruce.ashfield: attempted=3D2 succeeded=3D0(0.00%)
> failed=3D2(100.00%)
> >     Changhyeok Bae <changhyeok.bae: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
> >     Wang Mingyu <wangmy: attempted=3D1 succeeded=3D1(100.00%) failed=3D=
0(0.00%)
> >     Joshua Watt <JPEWhacker: attempted=3D2 succeeded=3D0(0.00%)
> failed=3D2(100.00%)
> >     Robert Yang <liezhi.yang: attempted=3D2 succeeded=3D0(0.00%)
> failed=3D2(100.00%)
> >     Lukasz Majewski <lukma: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
> >     Yi Zhao <yi.zhao: attempted=3D2 succeeded=3D1(50.00%) failed=3D1(50=
.00%)
> >     Vincent Davis Jr <vince: attempted=3D1 succeeded=3D1(100.00%)
> failed=3D0(0.00%)
> >     Zang Ruochen <zangruochen: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
> >     Denys Dmytriyenko <denis: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
> >     Khem Raj <raj.khem: attempted=3D6 succeeded=3D0(0.00%) failed=3D6(1=
00.00%)
> >     Tim Orling <tim.orling: attempted=3D4 succeeded=3D0(0.00%)
> failed=3D4(100.00%)
> >     Anuj Mittal <anuj.mittal: attempted=3D19 succeeded=3D4(21.05%)
> failed=3D15(78.95%)
> >     Trevor Gamblin <tgamblin: attempted=3D1 succeeded=3D1(100.00%)
> failed=3D0(0.00%)
> >     Alexander Kanavin <alex.kanavin: attempted=3D13 succeeded=3D5(38.46=
%)
> failed=3D8(61.54%)
> >     Jose Quaresma <quaresma.jose: attempted=3D4 succeeded=3D4(100.00%)
> failed=3D0(0.00%)
> >     Hongxu Jia <hongxu.jia: attempted=3D3 succeeded=3D0(0.00%)
> failed=3D3(100.00%)
> >     Ross Burton <ross.burton: attempted=3D7 succeeded=3D0(0.00%)
> failed=3D7(100.00%)
> >     Otavio Salvador <otavio.salvador: attempted=3D2 succeeded=3D0(0.00%=
)
> failed=3D2(100.00%)
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185356):
> https://lists.openembedded.org/g/openembedded-core/message/185356
> Mute This Topic: https://lists.openembedded.org/mt/100487678/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a09e6c0601e2ab99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 1, 2023 at 9:36=E2=80=AFA=
M Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D=
"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">A lot of the failures seem to be about<br>
<br>
File &quot;/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/de=
vtool/upgrade.py&quot;,<br>
line 473, in _extract_licenses<br>
=C2=A0 =C2=A0 with open(os.path.join(srcpath, path), &#39;rb&#39;) as f:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<b=
r>
FileNotFoundError: [Errno 2] No such file or directory:<br>
&#39;/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/c=
url/COPYING&#39;<br>
<br>
As the projects didn&#39;t do anything to license files, something has<br>
clearly regressed here, I&#39;ll take a look and probably start a re-run.<b=
r>
<br></blockquote><div><br></div><div>I did the meta-perl/meta-python run on=
 Sunday 30th and noticed the same much higher preponderance of devtool erro=
rs.</div><div>I did a run of the recipes in oe-core that I maintain on 25th=
 July and it had less devtool errors (3 of my recipes passed,</div><div>onl=
y python3-sphinx failed and that was not devtool related). So that 5 day wi=
ndow is where something regressed.</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
Alex<br>
<br>
<br>
On Tue, 1 Aug 2023 at 18:30, Auto Upgrade Helper &lt;<a href=3D"mailto:auh@=
yoctoproject.org" target=3D"_blank">auh@yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; AUH finished upgrade batch the result patches/logs can be found at:<br=
>
&gt; <a href=3D"https://autobuilder.yocto.io/pub/auh/20230801050116" rel=3D=
"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/pub/auh/2023080=
1050116</a>, next are the statistics:<br>
&gt;<br>
&gt; Recipe upgrade statistics:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Failed (devtool error): 76<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bind, 9.18.17, Unassigned &lt;<a href=
=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctop=
roject.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kea, 2.4.0, Unassigned &lt;<a href=3D=
"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproj=
ect.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0openssh, 9.3p2, Unassigned &lt;<a hre=
f=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yocto=
project.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gettext, 0.22, Robert Yang &lt;<a hre=
f=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windri=
ver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-tests, 2.38, Lukasz Majewski &l=
t;<a href=3D"mailto:lukma@denx.de" target=3D"_blank">lukma@denx.de</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc, 2.38, Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libcgroup, 3.1.0, Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin=
@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd-boot, 254, Chen Qi &lt;<a hre=
f=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd, 254, Chen Qi &lt;<a href=3D"=
mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux-libuuid, 2.39.1, Chen Qi &=
lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windr=
iver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux, 2.39.1, Chen Qi &lt;<a hr=
ef=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binutils, 2.41, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmake, 3.27.1, Unassigned &lt;<a href=
=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctop=
roject.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnu-config, 20230216-new-commits-avai=
lable, Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=
=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson, 1.2.0, Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perl, 5.38.0, Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-certifi, 2023.7.22, Tim Orlin=
g &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orli=
ng@konsulko.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-cython, 3.0.0, Unassigned &lt=
;<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigne=
d@yoctoproject.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-dbusmock, 0.29.1, Unassigned =
&lt;<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassi=
gned@yoctoproject.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-dtschema, 2023.7, Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce=
.ashfield@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-editables, 0.5, Ross Burton &=
lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-jsonschema, 4.18.4, Bruce Ash=
field &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bru=
ce.ashfield@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-libarchive-c, 5.0, Joshua Wat=
t &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@=
gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-markdown, 3.4.4, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-more-itertools, 10.0.0, Tim O=
rling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.=
orling@konsulko.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-numpy, 1.25.2, Unassigned &lt=
;<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigne=
d@yoctoproject.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pathspec, 0.11.2, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@a=
rm.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pip, 23.2.1, Zang Ruochen &lt=
;<a href=3D"mailto:zangruochen@loongson.cn" target=3D"_blank">zangruochen@l=
oongson.cn</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pyparsing, 3.1.1, Unassigned =
&lt;<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassi=
gned@yoctoproject.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-sphinx, 7.1.1, Tim Orling &lt=
;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@ko=
nsulko.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-wheel, 0.41.0, Tim Orling &lt=
;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@ko=
nsulko.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cargo, 1.71.0, Randy MacLeod &lt;<a h=
ref=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@=
windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libstd-rs, 1.71.0, Randy MacLeod &lt;=
<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacL=
eod@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rust-llvm, 1.71.0, Randy MacLeod &lt;=
<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacL=
eod@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rust, 1.71.0, Randy MacLeod &lt;<a hr=
ef=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@w=
indriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vala, 0.56.9, Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethtool, 6.4, Changhyeok Bae &lt;<a h=
ref=3D"mailto:changhyeok.bae@gmail.com" target=3D"_blank">changhyeok.bae@gm=
ail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0go-helloworld, 0.1-new-commits-availa=
ble, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">r=
aj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groff, 1.23.0, Hongxu Jia &lt;<a href=
=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libarchive, 3.7.1, Otavio Salvador &l=
t;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">ota=
vio.salvador@ossystems.com.br</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sudo, 1.9.14p3, Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar, 1.35, Chen Qi &lt;<a href=3D"mai=
lto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0epiphany, 44.6, Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@g=
mail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adwaita-icon-theme, 44.0, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@a=
rm.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgudev, 238, Ross Burton &lt;<a hre=
f=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0librsvg, 2.56.3, Anuj Mittal &lt;<a h=
ref=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0harfbuzz, 8.1.0, Anuj Mittal &lt;<a h=
ref=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libsdl2, 2.28.1, Yi Zhao &lt;<a href=
=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libglu, 9.0.3, Ross Burton &lt;<a hre=
f=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mesa, 23.1.4, Otavio Salvador &lt;<a =
href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.s=
alvador@ossystems.com.br</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0piglit, 1.0-new-commits-available, Ro=
ss Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross=
.burton@arm.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vulkan-loader, 1.3.250.1, Anuj Mittal=
 &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal=
@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vulkan-samples, git-new-commits-avail=
able, Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bla=
nk">ross.burton@arm.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wayland-utils, 1.2.0, Denys Dmytriyen=
ko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libpthread-stubs, 0.5, Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lttng-modules, 2.13.10, Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blan=
k">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lttng-tools, 2.13.10, Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst-devtools, 1.22.5, Anuj Mittal &lt=
;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@int=
el.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-libav, 1.22.5, Anuj Mitt=
al &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mitt=
al@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-omx, 1.22.5, Anuj Mittal=
 &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal=
@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-plugins-bad, 1.22.5, Anu=
j Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anu=
j.mittal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-plugins-base, 1.22.5, An=
uj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">an=
uj.mittal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-plugins-good, 1.22.5, An=
uj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">an=
uj.mittal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-plugins-ugly, 1.22.5, An=
uj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">an=
uj.mittal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-python, 1.22.5, Anuj Mit=
tal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mit=
tal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-rtsp-server, 1.22.5, Anu=
j Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anu=
j.mittal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-vaapi, 1.22.5, Anuj Mitt=
al &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mitt=
al@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0, 1.22.5, Anuj Mittal &lt=
;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@int=
el.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0webkitgtk, 2.40.4, Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curl, 8.2.1, Robert Joslyn &lt;<a hre=
f=3D"mailto:robert.joslyn@redrectangle.org" target=3D"_blank">robert.joslyn=
@redrectangle.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diffoscope, 246, Joshua Watt &lt;<a h=
ref=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmp, 6.3.0, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnupg, 2.4.3, Hongxu Jia &lt;<a href=
=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpgme, 1.21.0, Hongxu Jia &lt;<a href=
=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgit2, 1.7.0, Unassigned &lt;<a hre=
f=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yocto=
project.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re2c, 3.1, Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Succeeded: 19<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dhcpcd, 10.0.2, Unassigned &lt;<a hre=
f=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yocto=
project.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seatd, 0.8.0, Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0btrfs-tools, 6.3.3, Wang Mingyu &lt;<=
a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0createrepo-c, 1.0.0, Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnf, 4.16.2, Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmai=
l.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file, 5.45, Yi Zhao &lt;<a href=3D"ma=
ilto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libdnf, 0.70.2, Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@g=
mail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmc-utils, 0.1-new-commits-available,=
 Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank"=
>anuj.mittal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-dtc, 1.7.0, Trevor Gamblin &l=
t;<a href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@bayli=
bre.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysklogd, 2.5.1, Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glslang, 1.3.250.1, Jose Quaresma &lt=
;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose=
@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shaderc, 2023.5, Jose Quaresma &lt;<a=
 href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gm=
ail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spirv-headers, 1.3.250.1, Jose Quares=
ma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresm=
a.jose@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spirv-tools, 1.3.250.1, Jose Quaresma=
 &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.=
jose@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vulkan-headers, 1.3.250.1, Anuj Mitta=
l &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mitta=
l@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vulkan-tools, 1.3.250.1, Anuj Mittal =
&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@=
intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vulkan-validation-layers, 1.3.250.1, =
Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0puzzles, 0.0-new-commits-available, A=
nuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">a=
nuj.mittal@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xxhash, 0.8.2, Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gm=
ail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Failed(other errors): 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-testsuite, 2.38, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Failed(do_compile): 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stress-ng, 0.16.02, Anuj Mittal &lt;<=
a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel=
.com</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0TOTAL: attempted=3D97 succeeded=3D19(19.59%) failed=
=3D78(80.41%)<br>
&gt;<br>
&gt; Recipe upgrade statistics per Maintainer:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Chen Qi &lt;Qi.Chen: attempted=3D7 succeeded=3D1(14=
.29%) failed=3D6(85.71%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Richard Purdie &lt;richard.purdie: attempted=3D2 su=
cceeded=3D0(0.00%) failed=3D2(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unassigned &lt;unassigned: attempted=3D10 succeeded=
=3D1(10.00%) failed=3D9(90.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Randy MacLeod &lt;Randy.MacLeod: attempted=3D4 succ=
eeded=3D0(0.00%) failed=3D4(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Robert Joslyn &lt;robert.joslyn: attempted=3D1 succ=
eeded=3D0(0.00%) failed=3D1(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Bruce Ashfield &lt;bruce.ashfield: attempted=3D2 su=
cceeded=3D0(0.00%) failed=3D2(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Changhyeok Bae &lt;changhyeok.bae: attempted=3D1 su=
cceeded=3D0(0.00%) failed=3D1(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Wang Mingyu &lt;wangmy: attempted=3D1 succeeded=3D1=
(100.00%) failed=3D0(0.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Joshua Watt &lt;JPEWhacker: attempted=3D2 succeeded=
=3D0(0.00%) failed=3D2(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Robert Yang &lt;liezhi.yang: attempted=3D2 succeede=
d=3D0(0.00%) failed=3D2(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Lukasz Majewski &lt;lukma: attempted=3D1 succeeded=
=3D0(0.00%) failed=3D1(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Yi Zhao &lt;yi.zhao: attempted=3D2 succeeded=3D1(50=
.00%) failed=3D1(50.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Vincent Davis Jr &lt;vince: attempted=3D1 succeeded=
=3D1(100.00%) failed=3D0(0.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Zang Ruochen &lt;zangruochen: attempted=3D1 succeed=
ed=3D0(0.00%) failed=3D1(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Denys Dmytriyenko &lt;denis: attempted=3D1 succeede=
d=3D0(0.00%) failed=3D1(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Khem Raj &lt;raj.khem: attempted=3D6 succeeded=3D0(=
0.00%) failed=3D6(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Tim Orling &lt;tim.orling: attempted=3D4 succeeded=
=3D0(0.00%) failed=3D4(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Anuj Mittal &lt;anuj.mittal: attempted=3D19 succeed=
ed=3D4(21.05%) failed=3D15(78.95%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Trevor Gamblin &lt;tgamblin: attempted=3D1 succeede=
d=3D1(100.00%) failed=3D0(0.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Alexander Kanavin &lt;alex.kanavin: attempted=3D13 =
succeeded=3D5(38.46%) failed=3D8(61.54%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Jose Quaresma &lt;quaresma.jose: attempted=3D4 succ=
eeded=3D4(100.00%) failed=3D0(0.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hongxu Jia &lt;hongxu.jia: attempted=3D3 succeeded=
=3D0(0.00%) failed=3D3(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Ross Burton &lt;ross.burton: attempted=3D7 succeede=
d=3D0(0.00%) failed=3D7(100.00%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Otavio Salvador &lt;otavio.salvador: attempted=3D2 =
succeeded=3D0(0.00%) failed=3D2(100.00%)<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185356): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185356" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185356</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100487678/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100487678/924729</a><br>
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

--000000000000a09e6c0601e2ab99--

