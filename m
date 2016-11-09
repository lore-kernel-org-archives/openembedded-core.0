Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id F0228719ED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 13:17:25 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n21so144111072qka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 05:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VxWW3xQl37gzE++JzYodAkEhXG7iyNLlNQNae74Y0FE=;
	b=tya4EKrXiYBXZ6svs7VoNwVWVRPTAcxn9W4EGhp4gOjQRJcuxNwGwoZ2ggPBA/QS+Y
	9dreHTQF2s+PojYjjDmSVBI/lQ3Bw8beIKcDdc56bX6AnltrPA9+ZD/sDRGhDoJTt17m
	y/2nTfRdR++QRabL+XjieWI8CYnrp9wqTKnS/w3FacLvVwpzPgm/WY01j/1nTwcIghL3
	/ASHwVOPowDSFpGJY/w//HnTxJfmDiF1gbtYiCClu0vhg2oPyiaCedi+K+Xmht5af5A+
	+oP59VoYEU36ydPL1wfBaFkg/gCv8frRIElDgEVUJmEneyqzvf+2ddrymoNdFB0jDPFu
	L1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VxWW3xQl37gzE++JzYodAkEhXG7iyNLlNQNae74Y0FE=;
	b=kDc2tdbdzbZje+8lnQjqxMyfe93Xn+7dWsDo002dSov10pWlga9vGgiC5L5FcE7trS
	m+smulcOsM+OzGBONGNGx3hp/8Xxd5tzzd2GF7MP7KDW6Sf4AG5hh7ZqkjxtfvE3B/yU
	Ez+Lb9ebFPTW/8xgMPdXq/kFS3b2q5VyoUUrvR+JSC69lW6lM1dSB1MPHNymt2YHrIcq
	o2kFWl/MNRzwjZld2/joYLYXvqUn7ec67FDKCbWTLsBhG1e13Kq5ByplXYmsxocHRGxO
	MZXMlBGGU3QzzLyWPBaIF6rpOzTjwV+zyD1M71RHHYliF1j/7t+rdY5nXrfrPb4+tJSI
	ykdw==
X-Gm-Message-State: ABUngvdwERusOuye2n2MOo84/Br7ZXslMLFR38b/WHcU8pP4aMKcqMERrbSLx1aMdJMMWYydW6jnaYVIrj9E/SB5
X-Received: by 10.55.106.134 with SMTP id f128mr16668862qkc.121.1478697447073; 
	Wed, 09 Nov 2016 05:17:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 9 Nov 2016 05:17:06 -0800 (PST)
In-Reply-To: <cover.1478619682.git.maciej.borzecki@rndity.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Nov 2016 13:17:06 +0000
Message-ID: <CAJTo0LaARkjM1C1D=k_NdoCRy5ivQdnbT+C_X-7WnnpnuQN0Ew@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] wic: bugfixes & --fixed-size support
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
X-List-Received-Date: Wed, 09 Nov 2016 13:17:26 -0000
Content-Type: multipart/alternative; boundary=001a114fddf610410f0540de148d

--001a114fddf610410f0540de148d
Content-Type: text/plain; charset=UTF-8

I pulled this series into a test run on the autobuilder and it is throwing
quite a lot of exceptions, such as:

Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/wic",
line 319, in <module>
    sys.exit(main(sys.argv[1:]))
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/wic",
line 314, in main
    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage,
subcommands)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/help.py",
line 95, in invoke_subcommand
    subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/wic",
line 247, in wic_create_subcommand
    options.compressor, options.bmap, options.debug)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/engine.py",
line 195, in wic_create
    crobj.main(cmdline)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/creator.py",
line 125, in main
    return self._subcmds[pname](options, *args[1:])
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/plugins/imager/direct_plugin.py",
line 93, in do_create
    creator.create()
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/imager/baseimager.py",
line 159, in create
    self._create()
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/imager/direct.py",
line 305, in _create
    system_id=part.system_id)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/utils/partitionedfs.py",
line 101, in add_partition
    size = size * 1024 // self.sector_size
TypeError: unsupported operand type(s) for //: 'str' and 'int'
WARNING:
TOPDIR/tmp/work/genericx86_64-poky-linux/core-image-lsb/1.0-r0/temp/run.do_image_wic.15783:1
exit 1 from 'BUILDDIR="TOPDIR" wic create "$wks" --vars
"TOPDIR/tmp/sysroots/genericx86-64/imgdata/" -e "core-image-lsb" -o "$out/"'

See
http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=a44a6a635c9ed02edb2a3dee0a13b0067becc425&type=commit
for more examples and context.

Ross

On 8 November 2016 at 15:56, Maciej Borzecki <maciej.borzecki@rndity.com>
wrote:

> The patch series is a follow-up after a previous attempt of adding
> --reserved-size option to wic[1].
>
> The series introduces a number of fixes in patches 1 - 4.
>
> The last patch in the series introduces --fixed-size option as discussed
> in [1].
> The patch also introduces minor refactoring to code responsible for
> computing
> partition size.
>
> Aside from new option, another user-visible change is how the size rootfs
> partitions with vfat is calculated. In previous code, vfat rootfs
> partition size
> did not account for --extra-space nor --overhead-factor. Now, all rootfs
> partitions (except for squashfs) are subject to the same rules of partition
> sizing.
>
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2016-October/127634.html
>
> Maciej Borzecki (5):
>   wic: make sure that partition size is always an integer in internal
>     processing
>   wic: use partition size when creating empty partition files
>   wic: check that filesystem is specified for a rootfs partition
>   wic: fix function comment typos
>   wic: add --fixed-size wks option
>
>  scripts/lib/wic/help.py                | 14 +++--
>  scripts/lib/wic/imager/direct.py       |  2 +-
>  scripts/lib/wic/ksparser.py            | 41 +++++++++++++--
>  scripts/lib/wic/partition.py           | 93 +++++++++++++++++++++---------
> ----
>  scripts/lib/wic/utils/partitionedfs.py |  6 +--
>  5 files changed, 109 insertions(+), 47 deletions(-)
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114fddf610410f0540de148d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I pulled this series into a test run on the autobuilder an=
d it is throwing quite a lot of exceptions, such as:<br><br>Traceback (most=
 recent call last):<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-x86-64-lsb/build/scripts/wic&quot;, line 319, in &lt;m=
odule&gt;<br>=C2=A0 =C2=A0 sys.exit(main(sys.argv[1:]))<br>=C2=A0 File &quo=
t;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/s=
cripts/wic&quot;, line 314, in main<br>=C2=A0 =C2=A0 return hlp.invoke_subc=
ommand(args, parser, hlp.wic_help_usage, subcommands)<br>=C2=A0 File &quot;=
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scr=
ipts/lib/wic/help.py&quot;, line 95, in invoke_subcommand<br>=C2=A0 =C2=A0 =
subcommands.get(args[0], subcommand_error)[0](args[1:], usage)<br>=C2=A0 Fi=
le &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/=
build/scripts/wic&quot;, line 247, in wic_create_subcommand<br>=C2=A0 =C2=
=A0 options.compressor, options.bmap, options.debug)<br>=C2=A0 File &quot;/=
home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scri=
pts/lib/wic/engine.py&quot;, line 195, in wic_create<br>=C2=A0 =C2=A0 crobj=
.main(cmdline)<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto=
-worker/nightly-x86-64-lsb/build/scripts/lib/wic/creator.py&quot;, line 125=
, in main<br>=C2=A0 =C2=A0 return self._subcmds[pname](options, *args[1:])<=
br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly=
-x86-64-lsb/build/scripts/lib/wic/plugins/imager/direct_plugin.py&quot;, li=
ne 93, in do_create<br>=C2=A0 =C2=A0 creator.create()<br>=C2=A0 File &quot;=
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scr=
ipts/lib/wic/imager/baseimager.py&quot;, line 159, in create<br>=C2=A0 =C2=
=A0 self._create()<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/y=
octo-worker/nightly-x86-64-lsb/build/scripts/lib/wic/imager/direct.py&quot;=
, line 305, in _create<br>=C2=A0 =C2=A0 system_id=3Dpart.system_id)<br>=C2=
=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-6=
4-lsb/build/scripts/lib/wic/utils/partitionedfs.py&quot;, line 101, in add_=
partition<br>=C2=A0 =C2=A0 size =3D size * 1024 // self.sector_size<br>Type=
Error: unsupported operand type(s) for //: &#39;str&#39; and &#39;int&#39;<=
br>WARNING: TOPDIR/tmp/work/genericx86_64-poky-linux/core-image-lsb/1.0-r0/=
temp/run.do_image_wic.15783:1 exit 1 from &#39;BUILDDIR=3D&quot;TOPDIR&quot=
; wic create &quot;$wks&quot; --vars &quot;TOPDIR/tmp/sysroots/genericx86-6=
4/imgdata/&quot; -e &quot;core-image-lsb&quot; -o &quot;$out/&quot;&#39;<br=
><div><br></div><div>See <a href=3D"http://errors.yoctoproject.org/Errors/L=
atest/Autobuilder/?filter=3Da44a6a635c9ed02edb2a3dee0a13b0067becc425&amp;ty=
pe=3Dcommit">http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filt=
er=3Da44a6a635c9ed02edb2a3dee0a13b0067becc425&amp;type=3Dcommit</a> for mor=
e examples and context.<br></div><div><br></div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8 November 2016 at 1=
5:56, Maciej Borzecki <span dir=3D"ltr">&lt;<a href=3D"mailto:maciej.borzec=
ki@rndity.com" target=3D"_blank">maciej.borzecki@rndity.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">The patch series is a follow-up af=
ter a previous attempt of adding<br>
--reserved-size option to wic[1].<br>
<br>
The series introduces a number of fixes in patches 1 - 4.<br>
<br>
The last patch in the series introduces --fixed-size option as discussed in=
 [1].<br>
The patch also introduces minor refactoring to code responsible for computi=
ng<br>
partition size.<br>
<br>
Aside from new option, another user-visible change is how the size rootfs<b=
r>
partitions with vfat is calculated. In previous code, vfat rootfs partition=
 size<br>
did not account for --extra-space nor --overhead-factor. Now, all rootfs<br=
>
partitions (except for squashfs) are subject to the same rules of partition=
<br>
sizing.<br>
<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2016-O=
ctober/127634.html" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/<wbr>pipermail/openembedded-core/<wbr>2016-October/127634.html<=
/a><br>
<br>
Maciej Borzecki (5):<br>
=C2=A0 wic: make sure that partition size is always an integer in internal<=
br>
=C2=A0 =C2=A0 processing<br>
=C2=A0 wic: use partition size when creating empty partition files<br>
=C2=A0 wic: check that filesystem is specified for a rootfs partition<br>
=C2=A0 wic: fix function comment typos<br>
=C2=A0 wic: add --fixed-size wks option<br>
<br>
=C2=A0scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 14 +++--<br>
=C2=A0scripts/lib/wic/imager/direct.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
=C2=A0scripts/lib/wic/ksparser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 41 +++++++++++++--<br>
=C2=A0scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 93 +++++++++++++++++++++---------<wbr>----<br>
=C2=A0scripts/lib/wic/utils/<wbr>partitionedfs.py |=C2=A0 6 +--<br>
=C2=A05 files changed, 109 insertions(+), 47 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.5.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114fddf610410f0540de148d--
