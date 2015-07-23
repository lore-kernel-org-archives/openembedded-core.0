Return-Path: <sadlife1990@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7278B734B8;
	Thu, 23 Jul 2015 11:01:41 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so18668008wib.1;
	Thu, 23 Jul 2015 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+choI/9Q35p6ZDuD+SuYS0fqAxJDnrZFL0ePOEd1598=;
	b=mcClVc+C9aNfyoKhDavhG9xGZh3va15ji6IlBfurfddTj2q8hB5MJQaC9Bx/AmD6Al
	5+VH50QlGGjwLnkJGMnUUe9+a8GwVztcufTg+/EWgA54p9eV7aBNIWMt1tQt3T87Pdv6
	6rzfOfkBYRqQOhy+NaslJcr6Cf6n97p+5habXQiF9NIZXGQ+bywHr9YhUxGh6hdPH1Uv
	LK3zpJSCY9c/mAjiHpbmYaM02ROKlsESP0/AITMdRRbztG0ekiKyPP4aCVeiicdCrvpK
	QBDoK34l6MsDCxLu20DcAEtu/FI/2pQeabE/yywAgkBBOwb0q2goGMsU7Cg4q+EyCwQy
	vWcA==
MIME-Version: 1.0
X-Received: by 10.194.60.226 with SMTP id k2mr14090855wjr.10.1437649300652;
	Thu, 23 Jul 2015 04:01:40 -0700 (PDT)
Received: by 10.194.120.132 with HTTP; Thu, 23 Jul 2015 04:01:40 -0700 (PDT)
Date: Thu, 23 Jul 2015 14:01:40 +0300
Message-ID: <CAAHuHfxtDAi4xF8tJqiiswWGMEC-=jsryjbvuKu1Fg311J+Jyw@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Subject: qt5 webkit Nothing RPROVIDES 'liborc-0.4'
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
X-List-Received-Date: Thu, 23 Jul 2015 11:01:47 -0000
Content-Type: multipart/alternative; boundary=047d7bacbed6e088f7051b88cf0f

--047d7bacbed6e088f7051b88cf0f
Content-Type: text/plain; charset=UTF-8

Hello,

I'm trying to build qt5 webkit. I seen this error message

Build Configuration:
BB_VERSION        = "1.24.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "phyboard-wega-am335x-2"
DISTRO            = "poky"
DISTRO_VERSION    = "1.7"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "(nobranch):9aff3a4ec058a1a1149d026ebedcc6251089fffb"
meta-phytec       = "(nobranch):ccf1c78f312f84933b90926e9bf4f72de59e8e94"
meta-phyam335x    = "(nobranch):a6c488b268d0c2e506f293221703dafcc05b9610"
meta-oe
meta-networking
meta-python
meta-multimedia   = "(nobranch):9efaed99125b1c4324663d9a1b2d3319c74e7278"
meta-qt5          = "master:6d9e2a6dfc21f7d9a3a11b4bcb426b5dfe6feaeb"
meta-ruby         = "(nobranch):9efaed99125b1c4324663d9a1b2d3319c74e7278"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 3367 tasks of which 3367 didn't need to be
rerun and all succeeded.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'liborc-0.4' (but
/home/xy/yocto/build/recipes/images/
core-image-base-edited-20150723-135844.bb RDEPENDS on or otherwise requires
it)

--047d7bacbed6e088f7051b88cf0f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br><br></div>I&#39;m trying to build qt5 webki=
t. I seen this error message<br><br>Build Configuration:<br>BB_VERSION=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.24.0&quot;<br>BUILD_SYS=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-linux&quo=
t;<br>NATIVELSBSTRING=C2=A0=C2=A0 =3D &quot;Ubuntu-14.04&quot;<br>TARGET_SY=
S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm-poky-linux-gnueab=
i&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;phyboard-wega-am335x-2&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DISTR=
O_VERSION=C2=A0=C2=A0=C2=A0 =3D &quot;1.7&quot;<br>TUNE_FEATURES=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;arm armv7a vfp thumb neon callconvention-hard cor=
texa8&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &qu=
ot;vfp-neon&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-yocto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;(nobranch):9aff3a4ec058a1a1149d026ebedcc6251089fffb&=
quot;<br>meta-phytec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;(nobranc=
h):ccf1c78f312f84933b90926e9bf4f72de59e8e94&quot;<br>meta-phyam335x=C2=A0=
=C2=A0=C2=A0 =3D &quot;(nobranch):a6c488b268d0c2e506f293221703dafcc05b9610&=
quot;<br>meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <br>meta-networking=C2=A0=C2=A0 <br>meta-python=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 <br>meta-multimedia=C2=A0=C2=A0 =3D &quot;(nobranch):9efaed991=
25b1c4324663d9a1b2d3319c74e7278&quot;<br>meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:6d9e2a6dfc21f7d9a3a11b4bcb4=
26b5dfe6feaeb&quot;<br>meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;(nobranch):9efaed99125b1c4324663d9a1b2d3319c74e7278&quot;<=
br><br>NOTE: Preparing runqueue<br>NOTE: Executing SetScene Tasks<br>NOTE: =
Executing RunQueue Tasks<br>NOTE: Tasks Summary: Attempted 3367 tasks of wh=
ich 3367 didn&#39;t need to be rerun and all succeeded.<br>NOTE: Resolving =
any missing task queue dependencies<br>ERROR: Nothing RPROVIDES &#39;liborc=
-0.4&#39; (but /home/xy/yocto/build/recipes/images/<a href=3D"http://core-i=
mage-base-edited-20150723-135844.bb">core-image-base-edited-20150723-135844=
.bb</a> RDEPENDS on or otherwise requires it)<br></div>

--047d7bacbed6e088f7051b88cf0f--
