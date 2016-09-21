Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 57A5560234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:14:38 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id z190so38540422qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MLATL/jKkHfsHJxzeu+Ha3ecHQ9+skcWm5OItmF4TSw=;
	b=zm+al/PCT6DJN7vR7cPa0pPZe8L8oISU8a2my9ljbNDAJgC0kW1pihuOJ8sVJ8zUpD
	JFSx/srVEEGSxmV2Jlh3mkgSE8srZtTaQQBWFA4EJ8KEQDTcAFtdtpbkKriWOKdyU0yt
	R13jLxi+vyW2QG+sjof+V/fGGNdDM/DmyEvywhfiVAhjmoWScHK88w6YCK5pCp16K0wh
	V2YXGxF0HJbx++HYl4nBAWA2lcKCqujEgngs1sfgmk3teGlzgdoPSaeujqxxFPEH/35R
	OwCNGCSne011/ZmxHckKnHg1jyG8iDlXqvQqLDd4yGHsP0RaNmCWs1XP2YdLWbnnvGYz
	CcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MLATL/jKkHfsHJxzeu+Ha3ecHQ9+skcWm5OItmF4TSw=;
	b=Rqm0hUVk1+2on2foDGbGVrrcWQuKvWZ1+YE9/Kef4OpICSu3rO/CFvSpw0m0qT61Up
	ZT8tBwFeFariaSRTrjSJb5QpzmPClnWz1yGra6vtf+W95WNslBcQ8qBajCr6Pe2yctOR
	bD9AwYqF4t7ObLrA9S7shsFXgi308JZOhwnaIOcj0UyyFsVvS6KtW1twdZ/zTUjcVmu3
	VSH0qOpXFs14BIpZOamklHS1NPYJUjm/QdWwOp8KgM7EvWsoL3NAlFxW/GXVPxTHZfrf
	8ZCm7VEz/lo0uhPXl5sWnfySqKOLseIRFXiLGQQ+Ctlkh5vtdhAC35Xx0vkOAHXCgPaT
	8/Hw==
X-Gm-Message-State: AE9vXwMwGCYlbNbnHsnuu8RRgtfN0n6BZpjO4ZfrqphYUmagie8ncQLmLG6etZkTOgigWGwT7RedJt1tzSOuDQ==
X-Received: by 10.55.159.88 with SMTP id i85mr42702303qke.12.1474445680251;
	Wed, 21 Sep 2016 01:14:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Wed, 21 Sep 2016 01:14:19 -0700 (PDT)
In-Reply-To: <1473934030.3329.337.camel@pbcl.net>
References: <1473922370-4325-1-git-send-email-sujith.h@gmail.com>
	<1473934030.3329.337.camel@pbcl.net>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 21 Sep 2016 13:44:19 +0530
Message-ID: <CADyYWLm2xZrc4PGUo4fpFjf+Lb7Wuz457DWzdnTRRFn9HwNDjw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: add textrel to INSANE_SKIP to skip the warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2016 08:14:40 -0000
Content-Type: multipart/alternative; boundary=001a114d345a031a00053d0023de

--001a114d345a031a00053d0023de
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 3:37 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Thu, 2016-09-15 at 12:22 +0530, Sujith H wrote:
> > From: Fahad Usman <fahad_usman@mentor.com>
> >
> > This change help fix the warning message:
> >
> > x264/r2491+gitAUTOINC+c8a773ebfc-r0/packages-
> > split/x264/usr/lib/libx264.so.144' has relocations in .text [textrel]
> >
> > Adding textrel to INSANE_SKIP resolves this issue.
>
> This is a poor commit message.  Adding textrel to INSANE_SKIP prevents
> the check from being done, so it is fairly self-evident that it will
> suppress the corresponding warning message.  Please add an explanation
> of why this is an appropriate thing to do, i.e. why the textrels are
> present and why you can't get rid of them by other means.
>
> In particular please clarify whether you want to do this because the
> textrels are absolutely unavoidable for some reason on your
> architecture, or just because you think this is a good trade-off for
> performance.  If the latter then I think the change probably belongs in
> a distro or BSP layer not in oe-core.
>

As per the reference from
http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#qa-issu=
e-textrel
I added CFLAGS_append =3D " -fPIC " in the recipe and tried to build x264.
Below is the result.


Loading cache: 100%
|##########################################################################=
###########################################################################=
#####|
Time: 0:00:00
Loaded 1313 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
###########################################################################=
###|
Time: 0:00:02
Parsing of 877 .bb files complete (865 cached, 12 parsed). 1325 targets, 69
skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.31.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "universal"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "cyclone5"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.1+snapshot-20160921"
TUNE_FEATURES     =3D "arm armv7a vfp  neon"
TARGET_FPU        =3D "softfp"
meta
meta-poky
meta-yocto-bsp    =3D "toaster-next:75927f8f6809b9b4696fc438b240bc7a3db561e=
2"
meta-altera       =3D "master:1bfc1ac36f28352a79a7ba98dc9d74608d76f1e6"

Initialising tasks: 100%
|##########################################################################=
###########################################################################=
|
Time: 0:00:01
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: x264-r2491+gitAUTOINC+c8a773ebfc-r0 do_package_qa: QA Issue: ELF
binary
'/home/sujith/poky-push/build-qemuarm/tmp/work/armv7a-neon-poky-linux-gnuea=
bi/x264/r2491+gitAUTOINC+c8a773ebfc-r0/packages-split/x264/usr/lib/libx264.=
so.144'
has relocations in .text [textrel]
NOTE: Tasks Summary: Attempted 407 tasks of which 394 didn't need to be
rerun and all succeeded.

Summary: There was 1 WARNING message shown.

I have tried to debug the compile log where I found, there are .S files in
the source. Here is the small snippet of the compile log

arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a -mfpu=3Dneon  -mfloat-abi=3Dso=
ftfp
--sysroot=3D/home/sujith/poky-push/build-qemuarm/tmp/sysroots/cyclone5
-Wno-maybe-uninitialized -Wshadow -O3 -ffast-math  -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=3D/home/sujith/poky-push/build-qemuarm/tmp/work/armv7a-n=
eon-poky-linux-gnueabi/x264/r2491+gitAUTOINC+c8a773ebfc-r0=3D/usr/src/debug=
/x264/r2491+gitAUTOINC+c8a773ebfc-r0
-fdebug-prefix-map=3D/home/sujith/poky-push/build-qemuarm/tmp/sysroots/x86_=
64-linux=3D
-fdebug-prefix-map=3D/home/sujith/poky-push/build-qemuarm/tmp/sysroots/cycl=
one5=3D
-fPIC  -Wall -I. -I.
--sysroot=3D/home/sujith/poky-push/build-qemuarm/tmp/sysroots/cyclone5
-std=3Dgnu99 -fPIC -fomit-frame-pointer -fno-tree-vectorize   -c -o
encoder/slicetype-cl.o encoder/slicetype-cl.c
arm-poky-linux-gnueabi-gcc -I. -I. -c -DSTACK_ALIGNMENT=3D16 -DPIC
-DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/arm/cpu-a.o common/arm/cpu-a=
.S
arm-poky-linux-gnueabi-gcc -I. -I. -c -DSTACK_ALIGNMENT=3D16 -DPIC
-DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/arm/pixel-a.o
common/arm/pixel-a.S
arm-poky-linux-gnueabi-gcc -I. -I. -c -DSTACK_ALIGNMENT=3D16 -DPIC
-DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/arm/mc-a.o common/arm/mc-a.S
arm-poky-linux-gnueabi-gcc -I. -I. -c -DSTACK_ALIGNMENT=3D16 -DPIC
-DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/arm/dct-a.o common/arm/dct-a=
.S
arm-poky-linux-gnueabi-gcc -I. -I. -c -DSTACK_ALIGNMENT=3D16 -DPIC
-DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/arm/quant-a.o
common/arm/quant-a.S
arm-poky-linux-gnueabi-gcc -I. -I. -c -DSTACK_ALIGNMENT=3D16 -DPIC
-DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/arm/deblock-a.o
common/arm/deblock-a.S
arm-poky-linux-gnueabi-gcc -I. -I. -c -DSTACK_ALIGNMENT=3D16 -DPIC
-DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/arm/predict-a.o
common/arm/predict-a.S
rm -f libx264.a
arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a -mfpu=3Dneon  -mfloat-abi=3Dso=
ftfp
--sysroot=3D/home/sujith/poky-push/build-qemuarm/tmp/sysroots/cyclone5 -o
libx264.so.144  common/mc.o common/predict.o common/pixel.o
common/macroblock.o common/frame.o common/dct.o common/cpu.o common/cabac.o
common/common.o common/osdep.o common/rectangle.o common/set.o
common/quant.o common/deblock.o common/vlc.o common/mvpred.o
common/bitstream.o encoder/analyse.o encoder/me.o encoder/ratecontrol.o
encoder/set.o encoder/macroblock.o encoder/cabac.o encoder/cavlc.o
encoder/encoder.o encoder/lookahead.o common/threadpool.o common/arm/mc-c.o
common/arm/predict-c.o common/opencl.o encoder/slicetype-cl.o
common/arm/cpu-a.o common/arm/pixel-a.o common/arm/mc-a.o
common/arm/dct-a.o common/arm/quant-a.o common/arm/deblock-a.o
common/arm/predict-a.o   -shared -Wl,-soname,libx264.so.144  -Wl,-Bsymbolic
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
--sysroot=3D/home/sujith/poky-push/build-qemuarm/tmp/sysroots/cyclone5 -lm
-lpthread -ldl

 Hence I tried to edit the config.mak to get the .S files compile with
-fPIC. Basically updated the ASFLAGS. But that didn't helped me either.
Also tried to add, TARGET_CC_ARCH +=3D " -fPIC ". May be I am wrong with
TARGET_CC_ARCH one.

I have verified with the command eu-findtextrel shown below in the devshell=
:

[root@sujith git]# eu-findtextrel libx264.so.144
either the file containing the function 'x264_pixel_ssim_end4_neon' or the
file containing the function '$a' is not compiled with -fpic/-fPIC
either the file containing the function '$d' or the file containing the
function '$a' is not compiled with -fpic/-fPIC
either the file containing the function 'memcpy_aligned_8_8_neon' or the
file containing the function '$a' is not compiled with -fpic/-fPIC
either the file containing the function 'x264_zigzag_scan_4x4_frame_neon'
or the file containing the function '$a' is not compiled with -fpic/-fPIC
either the file containing the function 'x264_coeff_last64_neon' or the
file containing the function '$a' is not compiled with -fpic/-fPIC
either the file containing the function '$d' or the file containing the
function '$a' is not compiled with -fpic/-fPIC
either the file containing the function '$d' or the file containing the
function '$d' is not compiled with -fpic/-fPIC
either the file containing the function '$d' or the file containing the
function '$d' is not compiled with -fpic/-fPIC
either the file containing the function '$d' or the file containing the
function '$d' is not compiled with -fpic/-fPIC
either the file containing the function '$d' or the file containing the
function '$d' is not compiled with -fpic/-fPIC
[root@sujith git]#

The above mentioned functions are part of .S files. I am not sure how to
proceed with this. May be a helping hand would be appreciated to move
further.

Yes, of course I can update the commit message.

Fahad, any idea to share?


Thanks,
Sujith H



>
> p.
>
>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--001a114d345a031a00053d0023de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 15, 2016 at 3:37 PM, Phil Blundell <span dir=3D"ltr">&lt;<a=
 target=3D"_blank" href=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt;</span> w=
rote:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><span class=3D"g=
mail-">On Thu, 2016-09-15 at 12:22 +0530, Sujith H wrote:<br>
&gt; From: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor.com">fahad_=
usman@mentor.com</a>&gt;<br>
&gt;<br>
&gt; This change help fix the warning message:<br>
&gt;<br>
&gt; x264/r2491+gitAUTOINC+<wbr>c8a773ebfc-r0/packages-<br>
&gt; split/x264/usr/lib/libx264.so.<wbr>144&#39; has relocations in .text [=
textrel]<br>
&gt;<br>
&gt; Adding textrel to INSANE_SKIP resolves this issue.<br>
<br>
</span>This is a poor commit message.=C2=A0 Adding textrel to INSANE_SKIP p=
revents<br>
the check from being done, so it is fairly self-evident that it will<br>
suppress the corresponding warning message.=C2=A0 Please add an explanation=
<br>
of why this is an appropriate thing to do, i.e. why the textrels are<br>
present and why you can&#39;t get rid of them by other means.<br>
<br>
In particular please clarify whether you want to do this because the<br>
textrels are absolutely unavoidable for some reason on your<br>
architecture, or just because you think this is a good trade-off for<br>
performance.=C2=A0 If the latter then I think the change probably belongs i=
n<br>
a distro or BSP layer not in oe-core.<br></blockquote><div><br></div><div>A=
s per the reference from <a href=3D"http://www.yoctoproject.org/docs/curren=
t/ref-manual/ref-manual.html#qa-issue-textrel">http://www.yoctoproject.org/=
docs/current/ref-manual/ref-manual.html#qa-issue-textrel</a> I added CFLAGS=
_append =3D &quot; -fPIC &quot; in the recipe and tried to build x264. Belo=
w is the result.<br><br><br>Loading cache: 100% |##########################=
###########################################################################=
#####################################################| Time: 0:00:00<br>Loa=
ded 1313 entries from dependency cache.<br>Parsing recipes: 100% |#########=
###########################################################################=
####################################################################| Time:=
 0:00:02<br>Parsing of 877 .bb files complete (865 cached, 12 parsed). 1325=
 targets, 69 skipped, 0 masked, 0 errors.<br>NOTE: Resolving any missing ta=
sk queue dependencies<br><br>Build Configuration:<br>BB_VERSION=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.31.1&quot;<br>BUILD_SYS=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NAT=
IVELSBSTRING=C2=A0=C2=A0 =3D &quot;universal&quot;<br>TARGET_SYS=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm-poky-linux-gnueabi&quot;<br=
>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &q=
uot;cyclone5&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=
=A0 =3D &quot;2.1+snapshot-20160921&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;arm armv7a vfp=C2=A0 neon&quot;<br>TARGET_FPU=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;softfp&quot;<br>meta=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>m=
eta-poky=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-yocto-bsp=
=C2=A0=C2=A0=C2=A0 =3D &quot;toaster-next:75927f8f6809b9b4696fc438b240bc7a3=
db561e2&quot;<br>meta-altera=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;=
master:1bfc1ac36f28352a79a7ba98dc9d74608d76f1e6&quot;<br><br>Initialising t=
asks: 100% |###############################################################=
###########################################################################=
###########| Time: 0:00:01<br>NOTE: Executing SetScene Tasks<br>NOTE: Execu=
ting RunQueue Tasks<br>WARNING: x264-r2491+gitAUTOINC+c8a773ebfc-r0 do_pack=
age_qa: QA Issue: ELF binary &#39;/home/sujith/poky-push/build-qemuarm/tmp/=
work/armv7a-neon-poky-linux-gnueabi/x264/r2491+gitAUTOINC+c8a773ebfc-r0/pac=
kages-split/x264/usr/lib/libx264.so.144&#39; has relocations in .text [text=
rel]<br>NOTE: Tasks Summary: Attempted 407 tasks of which 394 didn&#39;t ne=
ed to be rerun and all succeeded.<br><br>Summary: There was 1 WARNING messa=
ge shown.<br><br></div><div>I have tried to debug the compile log where I f=
ound, there are .S files in the source. Here is the small snippet of the co=
mpile log<br><br>arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv7-a -mfpu=3D=
neon=C2=A0 -mfloat-abi=3Dsoftfp --sysroot=3D/home/sujith/poky-push/build-qe=
muarm/tmp/sysroots/cyclone5 -Wno-maybe-uninitialized -Wshadow -O3 -ffast-ma=
th=C2=A0 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/=
home/sujith/poky-push/build-qemuarm/tmp/work/armv7a-neon-poky-linux-gnueabi=
/x264/r2491+gitAUTOINC+c8a773ebfc-r0=3D/usr/src/debug/x264/r2491+gitAUTOINC=
+c8a773ebfc-r0 -fdebug-prefix-map=3D/home/sujith/poky-push/build-qemuarm/tm=
p/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/sujith/poky-push/buil=
d-qemuarm/tmp/sysroots/cyclone5=3D=C2=A0 -fPIC=C2=A0 -Wall -I. -I. --sysroo=
t=3D/home/sujith/poky-push/build-qemuarm/tmp/sysroots/cyclone5 -std=3Dgnu99=
 -fPIC -fomit-frame-pointer -fno-tree-vectorize=C2=A0=C2=A0 -c -o encoder/s=
licetype-cl.o encoder/slicetype-cl.c<br>arm-poky-linux-gnueabi-gcc -I. -I. =
-c -DSTACK_ALIGNMENT=3D16 -DPIC -DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o com=
mon/arm/cpu-a.o common/arm/cpu-a.S<br>arm-poky-linux-gnueabi-gcc -I. -I. -c=
 -DSTACK_ALIGNMENT=3D16 -DPIC -DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o commo=
n/arm/pixel-a.o common/arm/pixel-a.S<br>arm-poky-linux-gnueabi-gcc -I. -I. =
-c -DSTACK_ALIGNMENT=3D16 -DPIC -DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o com=
mon/arm/mc-a.o common/arm/mc-a.S<br>arm-poky-linux-gnueabi-gcc -I. -I. -c -=
DSTACK_ALIGNMENT=3D16 -DPIC -DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/=
arm/dct-a.o common/arm/dct-a.S<br>arm-poky-linux-gnueabi-gcc -I. -I. -c -DS=
TACK_ALIGNMENT=3D16 -DPIC -DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/ar=
m/quant-a.o common/arm/quant-a.S<br>arm-poky-linux-gnueabi-gcc -I. -I. -c -=
DSTACK_ALIGNMENT=3D16 -DPIC -DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o common/=
arm/deblock-a.o common/arm/deblock-a.S<br>arm-poky-linux-gnueabi-gcc -I. -I=
. -c -DSTACK_ALIGNMENT=3D16 -DPIC -DHIGH_BIT_DEPTH=3D0 -DBIT_DEPTH=3D8 -o c=
ommon/arm/predict-a.o common/arm/predict-a.S<br>rm -f libx264.a<br>arm-poky=
-linux-gnueabi-gcc=C2=A0 -march=3Darmv7-a -mfpu=3Dneon=C2=A0 -mfloat-abi=3D=
softfp --sysroot=3D/home/sujith/poky-push/build-qemuarm/tmp/sysroots/cyclon=
e5 -o libx264.so.144=C2=A0 common/mc.o common/predict.o common/pixel.o comm=
on/macroblock.o common/frame.o common/dct.o common/cpu.o common/cabac.o com=
mon/common.o common/osdep.o common/rectangle.o common/set.o common/quant.o =
common/deblock.o common/vlc.o common/mvpred.o common/bitstream.o encoder/an=
alyse.o encoder/me.o encoder/ratecontrol.o encoder/set.o encoder/macroblock=
.o encoder/cabac.o encoder/cavlc.o encoder/encoder.o encoder/lookahead.o co=
mmon/threadpool.o common/arm/mc-c.o common/arm/predict-c.o common/opencl.o =
encoder/slicetype-cl.o common/arm/cpu-a.o common/arm/pixel-a.o common/arm/m=
c-a.o common/arm/dct-a.o common/arm/quant-a.o common/arm/deblock-a.o common=
/arm/predict-a.o=C2=A0=C2=A0 -shared -Wl,-soname,libx264.so.144=C2=A0 -Wl,-=
Bsymbolic -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed --sysroot=3D/home/=
sujith/poky-push/build-qemuarm/tmp/sysroots/cyclone5 -lm -lpthread -ldl<br>=
<br>=C2=A0Hence I tried to edit the config.mak to get the .S files compile =
with -fPIC. Basically updated the ASFLAGS. But that didn&#39;t helped me ei=
ther. Also tried to add, TARGET_CC_ARCH +=3D &quot; -fPIC &quot;. May be I =
am wrong with TARGET_CC_ARCH one. <br><br></div><div>I have verified with t=
he command eu-findtextrel shown below in the devshell:<br><br>[root@sujith =
git]# eu-findtextrel libx264.so.144<br>either the file containing the funct=
ion &#39;x264_pixel_ssim_end4_neon&#39; or the file containing the function=
 &#39;$a&#39; is not compiled with -fpic/-fPIC<br>either the file containin=
g the function &#39;$d&#39; or the file containing the function &#39;$a&#39=
; is not compiled with -fpic/-fPIC<br>either the file containing the functi=
on &#39;memcpy_aligned_8_8_neon&#39; or the file containing the function &#=
39;$a&#39; is not compiled with -fpic/-fPIC<br>either the file containing t=
he function &#39;x264_zigzag_scan_4x4_frame_neon&#39; or the file containin=
g the function &#39;$a&#39; is not compiled with -fpic/-fPIC<br>either the =
file containing the function &#39;x264_coeff_last64_neon&#39; or the file c=
ontaining the function &#39;$a&#39; is not compiled with -fpic/-fPIC<br>eit=
her the file containing the function &#39;$d&#39; or the file containing th=
e function &#39;$a&#39; is not compiled with -fpic/-fPIC<br>either the file=
 containing the function &#39;$d&#39; or the file containing the function &=
#39;$d&#39; is not compiled with -fpic/-fPIC<br>either the file containing =
the function &#39;$d&#39; or the file containing the function &#39;$d&#39; =
is not compiled with -fpic/-fPIC<br>either the file containing the function=
 &#39;$d&#39; or the file containing the function &#39;$d&#39; is not compi=
led with -fpic/-fPIC<br>either the file containing the function &#39;$d&#39=
; or the file containing the function &#39;$d&#39; is not compiled with -fp=
ic/-fPIC<br>[root@sujith git]#<br><br></div><div>The above mentioned functi=
ons are part of .S files. I am not sure how to proceed with this. May be a =
helping hand would be appreciated to move further.<br><br></div><div>Yes, o=
f course I can update the commit message. <br></div><div><br></div><div>Fah=
ad, any idea to share?<br><br><br></div><div>Thanks,<br></div><div>Sujith H=
<br></div><div><br></div><div>=C2=A0<br></div><blockquote style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" c=
lass=3D"gmail_quote">
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
p.<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=E0=B4=B8=
=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=
=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&g=
t;Contributor to KDE project<br></div><div>&lt;Project&gt;Contributor to Yo=
cto project<br></div><div><a target=3D"_blank" href=3D"http://fci.wikia.com=
/wiki/Anti-DRM-Campaign">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br=
>&lt;Blog&gt; <a target=3D"_blank" href=3D"http://sujithh.info">http://suji=
thh.info</a><br></div><div>C-x C-c<br></div></div></div></div></div>
</div></div>

--001a114d345a031a00053d0023de--
