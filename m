Received: from mail-wg0-f50.google.com ([74.125.82.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Ubw9d-00041K-SL
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 19:03:19 +0200
Received: by mail-wg0-f50.google.com with SMTP id m15so6659236wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=U5mSXu0KoemZ66WWexmSeNPHpeHg7eWxRwmlPwyul+Q=;
	b=LHgjuyjmqcWEyP2VHc/X9QPU9qJZivfTP0wva7l3v1Dfv1g3NrnGvQbqSjLH6UZnbG
	yVlgBcqSCfvFF4ORifBSvd+YyK1RPZIpwGgI1G7dpm5yn1DdQArNFPn0Gjj627B9UUen
	4QurZFDnilVFJlLlrDLVQNuTVdMVEWSloFFDOKkOFTRAecx6uvTv6y6WFd4S/mPxjsoE
	en1e5kLte5DEpnh7MYtD23nWXZW72RuhHxiZgq9RX5eC4OOZ06AzYI/ms/ulv/sITrTg
	HGOchnKRMh/yiDko9sUgJTJ5RhRwb9WYqPSafAHM7dh9g6vbi0Q5/zT+wFsioak48EaM
	tn7Q==
MIME-Version: 1.0
X-Received: by 10.180.39.137 with SMTP id p9mr10113868wik.27.1368463507848;
	Mon, 13 May 2013 09:45:07 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 09:45:07 -0700 (PDT)
In-Reply-To: <cover.1368423406.git.raj.khem@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
Date: Mon, 13 May 2013 12:45:07 -0400
Message-ID: <CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 17:03:24 -0000
X-Groupsio-MsgNum: 39146
Content-Type: multipart/mixed; boundary=001a11c3657246014b04dc9c3de6

--001a11c3657246014b04dc9c3de6
Content-Type: multipart/alternative; boundary=001a11c3657246014804dc9c3de4

--001a11c3657246014804dc9c3de4
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 1:41 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This patchset adds a new qemu based machine target for mips64 Big-endian
> linux-yocto recipe is modified to have it in tree to support qemumips64
> machine

My machine seems to build fine, but I can't seem to fully boot the
resulting image properly.

Build Configuration:
BB_VERSION        = "1.19.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "openSUSE-project-12.3"
TARGET_SYS        = "mips64-poky-linux"
MACHINE           = "qemumips64"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20130513"
TUNE_FEATURES     = "n64 bigendian fpu-hard"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp    = "master:f7afeeb75993b159bb8959e0309bc5eb3978a8fb"
meta              =
"kraj/qemumips64:b0592ab08273e17cb1511384ad189281f88c8b03"



layers:
# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "6"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /home/trevor/devel/yocto/git/meta-poky/meta \
  /home/trevor/devel/yocto/git/meta-poky/meta-yocto \
  /home/trevor/devel/yocto/git/meta-poky/meta-yocto-bsp \
  /home/trevor/devel/yocto/git/openembedded-core/meta \
  "
BBLAYERS_NON_REMOVABLE ?= " \
  /home/trevor/devel/yocto/git/meta-poky/meta \
  /home/trevor/devel/yocto/git/meta-poky/meta-yocto \



config:
BB_NUMBER_THREADS = "4"
PARALLEL_MAKE = "-j 4"
MACHINE = "qemumips64"
DL_DIR = "/home/trevor/devel/Downloads"
SSTATE_DIR = "/home/trevor/devel/yocto/sstate-cache"
TMPDIR = "${TOPDIR}/tmp"
DISTRO ?= "poky"
PACKAGE_CLASSES ?= "package_rpm"
#SDKMACHINE ?= "i686"
EXTRA_IMAGE_FEATURES = "debug-tweaks"
USER_CLASSES ?= "buildstats image-mklibs image-prelink"
#IMAGETEST = "qemu"
#TEST_SCEN = "sanity bat sanity:boot toolchain"
#TEST_SERIALIZE = "1"
#OE_TERMINAL = "auto"
PATCHRESOLVE = "noop"
BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K"
CONF_VERSION = "1"



When I run:

    $ runqemu qemumips64

the virtual machine doens't appear to throw any errors (perhaps "hda:
unknown partition table"?),
however the boot simply stops without ever getting to a cmdline (see
attached image).

--001a11c3657246014804dc9c3de4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, May 13, 2013 at 1:41 AM, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt; This pa=
tchset adds a new qemu based machine target for mips64 Big-endian<br>&gt; l=
inux-yocto recipe is modified to have it in tree to support qemumips64<br>
&gt; machine<br><br>My machine seems to build fine, but I can&#39;t seem to=
 fully boot the resulting image properly.<br><br>Build Configuration:<br>BB=
_VERSION =A0 =A0 =A0 =A0=3D &quot;1.19.0&quot;<br>BUILD_SYS =A0 =A0 =A0 =A0=
 =3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING =A0 =3D &quot;openSUSE-project-12.3&quot;<br>TARGET_SYS =A0=
 =A0 =A0 =A0=3D &quot;mips64-poky-linux&quot;<br>MACHINE =A0 =A0 =A0 =A0 =
=A0 =3D &quot;qemumips64&quot;<br>DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;p=
oky&quot;<br>DISTRO_VERSION =A0 =A0=3D &quot;1.3+snapshot-20130513&quot;<br=
>
TUNE_FEATURES =A0 =A0 =3D &quot;n64 bigendian fpu-hard&quot;<br>TARGET_FPU =
=A0 =A0 =A0 =A0=3D &quot;&quot;<br>meta =A0 =A0 =A0 =A0 =A0 =A0 =A0<br>meta=
-yocto =A0 =A0 =A0 =A0<br>meta-yocto-bsp =A0 =A0=3D &quot;master:f7afeeb759=
93b159bb8959e0309bc5eb3978a8fb&quot;<br>
meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;kraj/qemumips64:b0592ab08273e17cb=
1511384ad189281f88c8b03&quot;<br><br><br><br>layers:<br># LAYER_CONF_VERSIO=
N is increased each time build/conf/bblayers.conf<br># changes incompatibly=
<br>LCONF_VERSION =3D &quot;6&quot;<br>
<br>BBPATH =3D &quot;${TOPDIR}&quot;<br>BBFILES ?=3D &quot;&quot;<br><br>BB=
LAYERS ?=3D &quot; \<br>=A0 /home/trevor/devel/yocto/git/meta-poky/meta \<b=
r>=A0 /home/trevor/devel/yocto/git/meta-poky/meta-yocto \<br>=A0 /home/trev=
or/devel/yocto/git/meta-poky/meta-yocto-bsp \<br>
=A0 /home/trevor/devel/yocto/git/openembedded-core/meta \<br>=A0 &quot;<br>=
BBLAYERS_NON_REMOVABLE ?=3D &quot; \<br>=A0 /home/trevor/devel/yocto/git/me=
ta-poky/meta \<br>=A0 /home/trevor/devel/yocto/git/meta-poky/meta-yocto \<d=
iv><br>
</div><div><br></div><div><br></div><div style>config:</div><div style><div=
>BB_NUMBER_THREADS =3D &quot;4&quot;</div><div>PARALLEL_MAKE =3D &quot;-j 4=
&quot;</div><div>MACHINE =3D &quot;qemumips64&quot;</div><div>DL_DIR =3D &q=
uot;/home/trevor/devel/Downloads&quot;</div>
<div>SSTATE_DIR =3D &quot;/home/trevor/devel/yocto/sstate-cache&quot;</div>=
<div>TMPDIR =3D &quot;${TOPDIR}/tmp&quot;</div><div>DISTRO ?=3D &quot;poky&=
quot;</div><div>PACKAGE_CLASSES ?=3D &quot;package_rpm&quot;</div><div>#SDK=
MACHINE ?=3D &quot;i686&quot;</div>
<div>EXTRA_IMAGE_FEATURES =3D &quot;debug-tweaks&quot;</div><div>USER_CLASS=
ES ?=3D &quot;buildstats image-mklibs image-prelink&quot;</div><div>#IMAGET=
EST =3D &quot;qemu&quot;</div><div>#TEST_SCEN =3D &quot;sanity bat sanity:b=
oot toolchain&quot;</div>
<div>#TEST_SERIALIZE =3D &quot;1&quot;</div><div>#OE_TERMINAL =3D &quot;aut=
o&quot;</div><div>PATCHRESOLVE =3D &quot;noop&quot;</div><div>BB_DISKMON_DI=
RS =3D &quot;\</div><div>=A0 =A0 STOPTASKS,${TMPDIR},1G,100K \</div><div>=
=A0 =A0 STOPTASKS,${DL_DIR},1G,100K \</div>
<div>=A0 =A0 STOPTASKS,${SSTATE_DIR},1G,100K \</div><div>=A0 =A0 ABORT,${TM=
PDIR},100M,1K \</div><div>=A0 =A0 ABORT,${DL_DIR},100M,1K \</div><div>=A0 =
=A0 ABORT,${SSTATE_DIR},100M,1K&quot;</div><div>CONF_VERSION =3D &quot;1&qu=
ot;</div><div><br>
</div><div><br></div><div><br></div><div style>When I run:</div><div style>=
<br></div><div style>=A0 =A0 $ runqemu qemumips64</div><div style><br></div=
><div style>the virtual machine doens&#39;t appear to throw any errors (per=
haps &quot;hda: unknown partition table&quot;?),</div>
<div style>however the boot simply stops without ever getting to a cmdline =
(see attached image).</div></div></div>

--001a11c3657246014804dc9c3de4--

--001a11c3657246014b04dc9c3de6
Content-Type: image/png; name="qemumips64.png"
Content-Disposition: attachment; filename="qemumips64.png"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hgnvs6vn0

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
AABJRU5ErkJggg==

--001a11c3657246014b04dc9c3de6--
