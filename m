Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPCSh-00061b-1m
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 15:50:19 +0200
Received: by mail-wi0-f182.google.com with SMTP id hi18so2552011wib.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 06:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=RSzfsf2rrqWNGoroP1w+Kc9hIAv5nLP9W9DJ0TTgcyg=;
	b=IX/ezVfgXPfimBq+1D+/2SfbCUjiPaB/EslDIZxeR1ioR1rmgMAPAROjOx8GGz9OTg
	6OrsC+egVT64L95Q+lHtW6WRoj6DPRAt4MSdqzFLlu/HpKhywHFxpJS6+7gWfKJNUrjr
	zMFNdJHCuLtoucmLtpuqs9THzz7yaudB3IWLdspsuaKm1zxTOJ8Lf488ne6v13m5Osk6
	nDGGYkVJqRYR6R36m5OLQtoikKeV+8UshaqOHXoNSwz3xtianUJmvQHTKfAp4T6MeB1n
	fIqXwjy6kv/yTIWIO8Fe3dAR46PmY332qU/jV+vCTs/EoT6qIMJizlFbEEPZnlcddZ8j
	CGRg==
MIME-Version: 1.0
X-Received: by 10.194.58.202 with SMTP id t10mr31789746wjq.4.1365427980365;
	Mon, 08 Apr 2013 06:33:00 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Mon, 8 Apr 2013 06:33:00 -0700 (PDT)
In-Reply-To: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
References: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
Date: Mon, 8 Apr 2013 09:33:00 -0400
Message-ID: <CAHUNapSqp4+8sL6+e_NWUx7GqSZRX1iH_xQTQV19XLciG_C=9g@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Rogerio Nunes <ronunes@gmail.com>, Saul Wold <saul.wold@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] alsa-tools: fix build when x11 and gtk+ not available
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
X-List-Received-Date: Mon, 08 Apr 2013 13:50:21 -0000
Content-Type: multipart/alternative; boundary=047d7b86de88bc751104d9d979b7

--047d7b86de88bc751104d9d979b7
Content-Type: text/plain; charset=ISO-8859-1

With a rather recent HEAD

Build Configuration:
BB_VERSION        = "1.17.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "openSUSE-project-12.3"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "qemux86-64"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20130407"
TUNE_FEATURES     = "m64"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp    = "master:813127247a1100b1abe179dfba25795560eac864"

I am able to successfully perform a "bitbake world" on a number of
different targets:

- qemux86
- qemuarm
- qemumips
- qemux86-64

Unfortunately qemuppc fails when building alsa-tools. Is anyone else seeing
the same thing?

| make[1]: Entering directory
`/home/trevor/build/yocto/fullbuild/qemuppc/work/ppc603e-poky-linux/alsa-tools/1.0.26.1-r1/alsa-tools-1.0.26.1/hda-verb'
| make[1]: warning: jobserver unavailable: using -j1.  Add `+' to parent
make rule.
| powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e
--sysroot=/home/trevor/build/yocto/fullbuild/qemuppc/sysroots/qemuppc
-DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\"
-DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\"
-DPACKAGE=\"hda-verb\" -DVERSION=\"0.4\" -DSTDC_HEADERS=1 -I.     -O2 -Wall
-pipe -g -MT hda-verb.o -MD -MP -MF .deps/hda-verb.Tpo -c -o hda-verb.o
hda-verb.c
| hda-verb.c:17:20: fatal error: sys/io.h: No such file or directory
| compilation terminated.
| make[1]: *** [hda-verb.o] Error 1
| make[1]: Leaving directory
`/home/trevor/build/yocto/fullbuild/qemuppc/work/ppc603e-poky-linux/alsa-tools/1.0.26.1-r1/alsa-tools-1.0.26.1/hda-verb'
| make: *** [all] Error 1
| ERROR: oe_runmake failed

--047d7b86de88bc751104d9d979b7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">With a rather recent HEAD<br><br>Build Configuration:<br>B=
B_VERSION =A0 =A0 =A0 =A0=3D &quot;1.17.1&quot;<br>BUILD_SYS =A0 =A0 =A0 =
=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING =A0 =3D &quot;openSUSE-=
project-12.3&quot;<br>TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;x86_64-poky-linux=
&quot;<br>
MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;qemux86-64&quot;<br>DISTRO =A0 =A0 =
=A0 =A0 =A0 =A0=3D &quot;poky&quot;<br>DISTRO_VERSION =A0 =A0=3D &quot;1.3+=
snapshot-20130407&quot;<br>TUNE_FEATURES =A0 =A0 =3D &quot;m64&quot;<br>TAR=
GET_FPU =A0 =A0 =A0 =A0=3D &quot;&quot;<br>meta =A0 =A0 =A0 =A0 =A0 =A0<br>
meta-yocto =A0 =A0 =A0<br>meta-yocto-bsp =A0 =A0=3D &quot;master:813127247a=
1100b1abe179dfba25795560eac864&quot;<br><br>I am able to successfully perfo=
rm a &quot;bitbake world&quot; on a number of different targets:<br><br>- q=
emux86<br>
- qemuarm<br>- qemumips<br>- qemux86-64<br><br>Unfortunately qemuppc<span c=
lass=3D""></span><span class=3D""></span> fails when building alsa-tools. I=
s anyone else seeing the same thing?<br><br>| make[1]: Entering directory `=
/home/trevor/build/yocto/fullbuild/qemuppc/work/ppc603e-poky-linux/alsa-too=
ls/1.0.26.1-r1/alsa-tools-1.0.26.1/hda-verb&#39;<br>
| make[1]: warning: jobserver unavailable: using -j1.=A0 Add `+&#39; to par=
ent make rule.<br>| powerpc-poky-linux-gcc=A0 -m32 -mhard-float=A0 -mcpu=3D=
603e --sysroot=3D/home/trevor/build/yocto/fullbuild/qemuppc/sysroots/qemupp=
c -DPACKAGE_NAME=3D\&quot;\&quot; -DPACKAGE_TARNAME=3D\&quot;\&quot; -DPACK=
AGE_VERSION=3D\&quot;\&quot; -DPACKAGE_STRING=3D\&quot;\&quot; -DPACKAGE_BU=
GREPORT=3D\&quot;\&quot; -DPACKAGE_URL=3D\&quot;\&quot; -DPACKAGE=3D\&quot;=
hda-verb\&quot; -DVERSION=3D\&quot;0.4\&quot; -DSTDC_HEADERS=3D1 -I.=A0=A0=
=A0=A0 -O2 -Wall -pipe -g -MT hda-verb.o -MD -MP -MF .deps/hda-verb.Tpo -c =
-o hda-verb.o hda-verb.c<br>
| hda-verb.c:17:20: fatal error: sys/io.h: No such file or directory<br>| c=
ompilation terminated.<br>| make[1]: *** [hda-verb.o] Error 1<br>| make[1]:=
 Leaving directory `/home/trevor/build/yocto/fullbuild/qemuppc/work/ppc603e=
-poky-linux/alsa-tools/1.0.26.1-r1/alsa-tools-1.0.26.1/hda-verb&#39;<br>
| make: *** [all] Error 1<br>| ERROR: oe_runmake failed<br></div>

--047d7b86de88bc751104d9d979b7--
