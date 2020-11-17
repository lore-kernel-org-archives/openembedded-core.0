Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.10363.1605630336169513472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 08:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VuIO60Uv;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id m16so8209766edr.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 08:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mvSoyu9uWocg5SAVGYWcLtalhdhAtKT5G/9huExicus=;
        b=VuIO60Uv/xWaBgFXaSAhea7MONioiJPpGd8lp/MMGdb+/BdVREnIZ9E7w+gLHelkp0
         C//ysVS7epPcCC+lc+aaOPpsxbFHgte3iXlV1Cmp3Tnzaj7fHzgm3brCPhfCDNXn2W9p
         LOokEDFm9tpAXC8LPiI4qXtRPqiBmHT8RCpUEbUqiau3Lz2NjqfyG6Sn9hiV9FVY1Y1k
         5HNT0CvvjhqUxoSrixg66HpgMHXuyz5RcKBofLYklqQZPqJxn8QqoKP7zxfQ4ELP88ma
         qakEISpdLe7YbZyIxPCBGlK0bU0PHIpi+Cp1GMnEVVKrlPqK9WU1ZFtx1OUmJSm/fHX2
         R8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mvSoyu9uWocg5SAVGYWcLtalhdhAtKT5G/9huExicus=;
        b=MV1roQPJDo/RU8Rzhyw/RKJV4Q2m5RSSGyrd+XT/vyhPdQAITS28JgdjQ9530eSQZi
         UlqwxFqdP/6nFlJAGUtnItXQXNlv6Mb3dCGdH1JAiMQuAOOrEwWlYliUPA0ujVm7wNFo
         s4QbZdEfB5Fdmwi2zCdUncb+X8YAHZW3dCXHUauc+efKGEzLhUmBxlXabUrA8Ppj9Zul
         JrkuCw7TW3hYAom3BZUkDwsPXbB9DQiBW6gpkTKUrP2GVzd+D9gACYnpnBU/U3D8JBzJ
         AW1cTAVnAE6KytMZUlvDh8nroBWDYX/Qfz39BL+Gam2Y1f4BwUWOp+Wez6tQQ/B/Fcn9
         clGg==
X-Gm-Message-State: AOAM530Y+6eX88gq+PtIdbaqLF+zLXhwr/TiTP+Mm+YxHyvLIAPrki86
	rBeq1PZE3Orpu4xgQDuK/K64KkYiAJ3LpoEAp4k=
X-Google-Smtp-Source: ABdhPJzx4vCVY5P7T6jJJpn2HLRDO3ZSs342TR0n+g97gUx5pHReh129Ra+xuCj73uryaJQ2YuK1H53A5IQZR1mcgmw=
X-Received: by 2002:a50:f147:: with SMTP id z7mr1405693edl.76.1605630334622;
 Tue, 17 Nov 2020 08:25:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605626675.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2020 17:25:22 +0100
Message-ID: <CA+chaQfx=0OJfW=f_DsUG58GC8RYvXhSYb80-3MFouSeh_3DRw@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 00/19] gatesgarth review request
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bc5dba05b44ff108"

--000000000000bc5dba05b44ff108
Content-Type: text/plain; charset="UTF-8"

Hi,

Do you still plan to upgrade bluez5 in gatesgarth to 5.55 like dunfell was
recently updated?

You mentioned it in:
https://lists.openembedded.org/g/openembedded-core/message/144467
but I don't see it in this PR.

On Tue, Nov 17, 2020 at 4:36 PM Anuj Mittal <anuj.mittal@intel.com> wrote:

> Next set of changes for gatesgarth. Please review.
>
> Passed a-full on autobuilder except for one failure. Ping test failed
> while executing do_testimage for sato image.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1602
>
> I think this failure is not related to the changes here as the test passed
> in other configurations. Probably similar to:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14029
>
> Thanks,
>
> Anuj
>
> The following changes since commit
> a1db1e71129c3e67ddd9dbef21e1c5eb31552e00:
>
>   grub: clean up CVE patches (2020-11-12 11:54:28 +0800)
>
> are available in the Git repository at:
>
>   git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth
>
> Alexander Kanavin (2):
>   clutter-gst-3.0: do not call out to host gstreamer plugin scanner
>   conf-notes.txt: mention more important images than just sato
>
> Bruce Ashfield (1):
>   kernel: provide module.lds for out of tree builds in v5.10+
>
> Denys Zagorui (1):
>   binutils: reproducibility: reuse debug-prefix-map for stabs
>
> Diego Santa Cruz (1):
>   freetype: fix CVE-2020-15999, backport from 2.10.4
>
> Gratian Crisan (1):
>   kernel-module-split.bbclass: identify kernel modconf files as
>     configuration files
>
> Jose Quaresma (1):
>   gstreamer1.0: warn the user when something is wrong with GstBufferPool
>
> Khem Raj (2):
>   lrzsz: Use Cross AR during compile
>   gawk: Avoid using host ar during cross compile
>
> Konrad Weihmann (3):
>   oeqa/core/context: expose results as variable
>   oeqa/core/context: initialize _run_end_time
>   testimage: print results for interrupted runs
>
> Mark Jonas (1):
>   libbsd: Remove BSD-4-Clause from main package
>
> Matt Madison (1):
>   layer.conf: fix syntax error in PATH setting
>
> Nathan Rossi (1):
>   diffstat: add nativesdk to BBCLASSEXTEND
>
> Richard Purdie (3):
>   ptest-runner: Fix license as it contains 'or later' clause
>   libdnf: Fix license as it contains 'or later' clause
>   alsa-utils: Fix license to GPLv2 only
>
> Steve Sakoman (1):
>   openssh: whitelist CVE-2014-9278
>
>  meta/classes/kernel-module-split.bbclass      |  1 +
>  meta/classes/kernel.bbclass                   |  1 +
>  meta/classes/testimage.bbclass                | 19 ++++---
>  meta/conf/conf-notes.txt                      |  2 +
>  meta/conf/layer.conf                          |  2 +-
>  meta/lib/oeqa/core/context.py                 |  4 ++
>  ...mpilation-using-autoconf-detected-AR.patch | 36 +++++++++++++
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
>  .../openssh/openssh_8.3p1.bb                  |  4 ++
>  .../binutils/binutils-2.35.inc                |  1 +
>  ...oducibility-for-stabs-debugging-data.patch | 35 +++++++++++++
>  .../diffstat/diffstat_1.63.bb                 |  2 +
>  meta/recipes-devtools/libdnf/libdnf_0.48.0.bb |  2 +-
>  .../0001-Use-cross-AR-during-compile.patch    | 35 +++++++++++++
>  meta/recipes-extended/gawk/gawk_5.1.0.bb      |  1 +
>  .../clutter/clutter-gst-3.0.inc               |  2 +
>  ...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++++
>  .../freetype/freetype_2.10.2.bb               |  1 +
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  6 +++
>  meta/recipes-multimedia/alsa/alsa-utils.inc   |  3 +-
>  ...size-in-reset-when-maxsize-is-larger.patch | 49 ++++++++++++++++++
>  .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
>  meta/recipes-support/libbsd/libbsd_0.10.0.bb  |  3 +-
>  .../ptest-runner/ptest-runner_2.4.0.bb        |  2 +-
>  24 files changed, 251 insertions(+), 13 deletions(-)
>  create mode 100644
> meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
>  create mode 100644
> meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
>  create mode 100644
> meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch
>
> --
> 2.28.0
>
>
> 
>
>

--000000000000bc5dba05b44ff108
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Do you still plan =
to upgrade bluez5 in gatesgarth to 5.55 like dunfell was recently updated?<=
/div><div><br></div><div>You mentioned it in:</div><div><a href=3D"https://=
lists.openembedded.org/g/openembedded-core/message/144467">https://lists.op=
enembedded.org/g/openembedded-core/message/144467</a><br></div><div>but I d=
on&#39;t see it in this PR.</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 4:36 PM Anuj Mitta=
l &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Next se=
t of changes for gatesgarth. Please review.<br>
<br>
Passed a-full on autobuilder except for one failure. Ping test failed<br>
while executing do_testimage for sato image. <br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/buil=
ds/1602" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/83/builds/1602</a><br>
<br>
I think this failure is not related to the changes here as the test passed=
<br>
in other configurations. Probably similar to:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14029" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_b=
ug.cgi?id=3D14029</a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
The following changes since commit a1db1e71129c3e67ddd9dbef21e1c5eb31552e0=
0:<br>
<br>
=C2=A0 grub: clean up CVE patches (2020-11-12 11:54:28 +0800)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://push.openembedded.org/openembedded-core-con=
trib" rel=3D"noreferrer" target=3D"_blank">push.openembedded.org/openembedd=
ed-core-contrib</a> anujm/gatesgarth<br>
<br>
Alexander Kanavin (2):<br>
=C2=A0 clutter-gst-3.0: do not call out to host gstreamer plugin scanner<b=
r>
=C2=A0 conf-notes.txt: mention more important images than just sato<br>
<br>
Bruce Ashfield (1):<br>
=C2=A0 kernel: provide module.lds for out of tree builds in v5.10+<br>
<br>
Denys Zagorui (1):<br>
=C2=A0 binutils: reproducibility: reuse debug-prefix-map for stabs<br>
<br>
Diego Santa Cruz (1):<br>
=C2=A0 freetype: fix CVE-2020-15999, backport from 2.10.4<br>
<br>
Gratian Crisan (1):<br>
=C2=A0 kernel-module-split.bbclass: identify kernel modconf files as<br>
=C2=A0 =C2=A0 configuration files<br>
<br>
Jose Quaresma (1):<br>
=C2=A0 gstreamer1.0: warn the user when something is wrong with GstBufferP=
ool<br>
<br>
Khem Raj (2):<br>
=C2=A0 lrzsz: Use Cross AR during compile<br>
=C2=A0 gawk: Avoid using host ar during cross compile<br>
<br>
Konrad Weihmann (3):<br>
=C2=A0 oeqa/core/context: expose results as variable<br>
=C2=A0 oeqa/core/context: initialize _run_end_time<br>
=C2=A0 testimage: print results for interrupted runs<br>
<br>
Mark Jonas (1):<br>
=C2=A0 libbsd: Remove BSD-4-Clause from main package<br>
<br>
Matt Madison (1):<br>
=C2=A0 layer.conf: fix syntax error in PATH setting<br>
<br>
Nathan Rossi (1):<br>
=C2=A0 diffstat: add nativesdk to BBCLASSEXTEND<br>
<br>
Richard Purdie (3):<br>
=C2=A0 ptest-runner: Fix license as it contains &#39;or later&#39; clause<=
br>
=C2=A0 libdnf: Fix license as it contains &#39;or later&#39; clause<br>
=C2=A0 alsa-utils: Fix license to GPLv2 only<br>
<br>
Steve Sakoman (1):<br>
=C2=A0 openssh: whitelist CVE-2014-9278<br>
<br>
=C2=A0meta/classes/kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 1 +<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0meta/classes/testimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 | 19 ++++---<br>
=C2=A0meta/conf/conf-notes.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0meta/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/lib/oeqa/core/context.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
=C2=A0...mpilation-using-autoconf-detected-AR.patch | 36 +++++++++++++<br>
=C2=A0meta/recipes-bsp/lrzsz/<a href=3D"http://lrzsz_0.12.20.bb" rel=3D"no=
referrer" target=3D"_blank">lrzsz_0.12.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
=C2=A0.../openssh/<a href=3D"http://openssh_8.3p1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">openssh_8.3p1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
=C2=A0.../binutils/binutils-2.35.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...oducibility-for-stabs-debugging-data.patch | 35 +++++++++++++<br>
=C2=A0.../diffstat/<a href=3D"http://diffstat_1.63.bb" rel=3D"noreferrer" =
target=3D"_blank">diffstat_1.63.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.48.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">libdnf_0.48.0.bb</a> |=C2=A0 2 +-<br>
=C2=A0.../0001-Use-cross-AR-during-compile.patch=C2=A0 =C2=A0 | 35 +++++++=
++++++<br>
=C2=A0meta/recipes-extended/gawk/<a href=3D"http://gawk_5.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gawk_5.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0.../clutter/clutter-gst-3.0.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++=
++<br>
=C2=A0.../freetype/<a href=3D"http://freetype_2.10.2.bb" rel=3D"noreferrer=
" target=3D"_blank">freetype_2.10.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D=
"noreferrer" target=3D"_blank">kernel-devsrc.bb</a>=C2=A0 =C2=A0 |=C2=A0 6 =
+++<br>
=C2=A0meta/recipes-multimedia/alsa/alsa-utils.inc=C2=A0 =C2=A0|=C2=A0 3 +-=
<br>
=C2=A0...size-in-reset-when-maxsize-is-larger.patch | 49 +++++++++++++++++=
+<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0_1.16.3.bb" rel=3D"noref=
errer" target=3D"_blank">gstreamer1.0_1.16.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0meta/recipes-support/libbsd/<a href=3D"http://libbsd_0.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libbsd_0.10.0.bb</a>=C2=A0 |=C2=A0 3 +-<=
br>
=C2=A0.../ptest-runner/<a href=3D"http://ptest-runner_2.4.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">ptest-runner_2.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A024 files changed, 251 insertions(+), 13 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cro=
ss-compilation-using-autoconf-detected-AR.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0017-gas-=
improve-reproducibility-for-stabs-debugging-data.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/gawk/gawk/0001-Use-cross-AR=
-during-compile.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/freetype/freetype/0001-sfnt=
-Fix-heap-buffer-overflow-59308.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
05-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch<br>
<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000bc5dba05b44ff108--
