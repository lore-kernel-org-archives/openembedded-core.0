Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbxqA-00066C-So
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 20:51:20 +0200
Received: by mail-pa0-f42.google.com with SMTP id bj3so4844525pad.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 11:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:message-id:references:to:x-mailer;
	bh=MSHRUb/VoONABQtn1KWIRdtfa8YNj19roUtFylhHTck=;
	b=Dg1DmALlav1BX2J2LqekIl4p2aFyDFscNHUGIwicZpz7dN8Vm+12kOh8H+hD//CJhY
	PehEqLBJS+u5Zu+T4FA1jEZEVvHc8rhlRO4NhDXQtGVRjh4j+Qen6uBvzNQScfEeUwcD
	gCTv44fKD/JjpCWF4QwrznPw2+FQX6RsT7ss0Yikb7gUZ/kChWZLWmwdmC9zdpZqmyEu
	TD1Q0/7pdgDWejUQZyqspjiUANx3oB/w9/IHQpqSLCstU3B92+EWnFPzdJRM4g0dVbFp
	s8Oo6WBygo0B+4LT9v9AVMiqHG59ElQegIivIuIjvFrlUfSgUttbRSGhxOXt+vwT9+ep
	Ermg==
X-Received: by 10.66.248.7 with SMTP id yi7mr31135650pac.41.1368469987809;
	Mon, 13 May 2013 11:33:07 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id l4sm14974619pbo.6.2013.05.13.11.33.05
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 11:33:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
Date: Mon, 13 May 2013 11:33:06 -0700
Message-Id: <203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1503)
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
X-List-Received-Date: Mon, 13 May 2013 18:51:22 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6573BA84-DB66-4E98-81BD-067D41001DDB"

--Apple-Mail=_6573BA84-DB66-4E98-81BD-067D41001DDB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On May 13, 2013, at 9:45 AM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Mon, May 13, 2013 at 1:41 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > This patchset adds a new qemu based machine target for mips64 =
Big-endian
> > linux-yocto recipe is modified to have it in tree to support =
qemumips64
> > machine
>=20
> My machine seems to build fine, but I can't seem to fully boot the =
resulting image properly.

try  runqemu qemumips64 bootparams=3D"root=3D/dev/sda"

does that boot ?

>=20
> Build Configuration:
> BB_VERSION        =3D "1.19.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "openSUSE-project-12.3"
> TARGET_SYS        =3D "mips64-poky-linux"
> MACHINE           =3D "qemumips64"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.3+snapshot-20130513"
> TUNE_FEATURES     =3D "n64 bigendian fpu-hard"
> TARGET_FPU        =3D ""
> meta             =20
> meta-yocto       =20
> meta-yocto-bsp    =3D =
"master:f7afeeb75993b159bb8959e0309bc5eb3978a8fb"
> meta              =3D =
"kraj/qemumips64:b0592ab08273e17cb1511384ad189281f88c8b03"
>=20
>=20
>=20
> layers:
> # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> # changes incompatibly
> LCONF_VERSION =3D "6"
>=20
> BBPATH =3D "${TOPDIR}"
> BBFILES ?=3D ""
>=20
> BBLAYERS ?=3D " \
>   /home/trevor/devel/yocto/git/meta-poky/meta \
>   /home/trevor/devel/yocto/git/meta-poky/meta-yocto \
>   /home/trevor/devel/yocto/git/meta-poky/meta-yocto-bsp \
>   /home/trevor/devel/yocto/git/openembedded-core/meta \
>   "
> BBLAYERS_NON_REMOVABLE ?=3D " \
>   /home/trevor/devel/yocto/git/meta-poky/meta \
>   /home/trevor/devel/yocto/git/meta-poky/meta-yocto \
>=20
>=20
>=20
> config:
> BB_NUMBER_THREADS =3D "4"
> PARALLEL_MAKE =3D "-j 4"
> MACHINE =3D "qemumips64"
> DL_DIR =3D "/home/trevor/devel/Downloads"
> SSTATE_DIR =3D "/home/trevor/devel/yocto/sstate-cache"
> TMPDIR =3D "${TOPDIR}/tmp"
> DISTRO ?=3D "poky"
> PACKAGE_CLASSES ?=3D "package_rpm"
> #SDKMACHINE ?=3D "i686"
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
> #IMAGETEST =3D "qemu"
> #TEST_SCEN =3D "sanity bat sanity:boot toolchain"
> #TEST_SERIALIZE =3D "1"
> #OE_TERMINAL =3D "auto"
> PATCHRESOLVE =3D "noop"
> BB_DISKMON_DIRS =3D "\
>     STOPTASKS,${TMPDIR},1G,100K \
>     STOPTASKS,${DL_DIR},1G,100K \
>     STOPTASKS,${SSTATE_DIR},1G,100K \
>     ABORT,${TMPDIR},100M,1K \
>     ABORT,${DL_DIR},100M,1K \
>     ABORT,${SSTATE_DIR},100M,1K"
> CONF_VERSION =3D "1"
>=20
>=20
>=20
> When I run:
>=20
>     $ runqemu qemumips64
>=20
> the virtual machine doens't appear to throw any errors (perhaps "hda: =
unknown partition table"?),
> however the boot simply stops without ever getting to a cmdline (see =
attached image).
> <qemumips64.png>


--Apple-Mail=_6573BA84-DB66-4E98-81BD-067D41001DDB
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv="Content-Type" content="text/html charset=iso-8859-1"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><br><div><div>On May 13, 2013, at 9:45 AM, Trevor Woerner &lt;<a href="mailto:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><blockquote type="cite"><div dir="ltr">On Mon, May 13, 2013 at 1:41 AM, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt; This patchset adds a new qemu based machine target for mips64 Big-endian<br>&gt; linux-yocto recipe is modified to have it in tree to support qemumips64<br>
&gt; machine<br><br>My machine seems to build fine, but I can't seem to fully boot the resulting image properly.<br></div></blockquote><div><br></div><div>try&nbsp;&nbsp;runqemu qemumips64&nbsp;bootparams="root=/dev/sda"</div><div><br></div><div>does that boot ?</div><br><blockquote type="cite"><div dir="ltr"><br>Build Configuration:<br>BB_VERSION &nbsp; &nbsp; &nbsp; &nbsp;= "1.19.0"<br>BUILD_SYS &nbsp; &nbsp; &nbsp; &nbsp; = "x86_64-linux"<br>
NATIVELSBSTRING &nbsp; = "openSUSE-project-12.3"<br>TARGET_SYS &nbsp; &nbsp; &nbsp; &nbsp;= "mips64-poky-linux"<br>MACHINE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = "qemumips64"<br>DISTRO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;= "poky"<br>DISTRO_VERSION &nbsp; &nbsp;= "1.3+snapshot-20130513"<br>
TUNE_FEATURES &nbsp; &nbsp; = "n64 bigendian fpu-hard"<br>TARGET_FPU &nbsp; &nbsp; &nbsp; &nbsp;= ""<br>meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>meta-yocto &nbsp; &nbsp; &nbsp; &nbsp;<br>meta-yocto-bsp &nbsp; &nbsp;= "master:f7afeeb75993b159bb8959e0309bc5eb3978a8fb"<br>
meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;= "kraj/qemumips64:b0592ab08273e17cb1511384ad189281f88c8b03"<br><br><br><br>layers:<br># LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf<br># changes incompatibly<br>LCONF_VERSION = "6"<br>
<br>BBPATH = "${TOPDIR}"<br>BBFILES ?= ""<br><br>BBLAYERS ?= " \<br>&nbsp; /home/trevor/devel/yocto/git/meta-poky/meta \<br>&nbsp; /home/trevor/devel/yocto/git/meta-poky/meta-yocto \<br>&nbsp; /home/trevor/devel/yocto/git/meta-poky/meta-yocto-bsp \<br>
&nbsp; /home/trevor/devel/yocto/git/openembedded-core/meta \<br>&nbsp; "<br>BBLAYERS_NON_REMOVABLE ?= " \<br>&nbsp; /home/trevor/devel/yocto/git/meta-poky/meta \<br>&nbsp; /home/trevor/devel/yocto/git/meta-poky/meta-yocto \<div><br>
</div><div><br></div><div><br></div><div style="">config:</div><div style=""><div>BB_NUMBER_THREADS = "4"</div><div>PARALLEL_MAKE = "-j 4"</div><div>MACHINE = "qemumips64"</div><div>DL_DIR = "/home/trevor/devel/Downloads"</div>
<div>SSTATE_DIR = "/home/trevor/devel/yocto/sstate-cache"</div><div>TMPDIR = "${TOPDIR}/tmp"</div><div>DISTRO ?= "poky"</div><div>PACKAGE_CLASSES ?= "package_rpm"</div><div>#SDKMACHINE ?= "i686"</div>
<div>EXTRA_IMAGE_FEATURES = "debug-tweaks"</div><div>USER_CLASSES ?= "buildstats image-mklibs image-prelink"</div><div>#IMAGETEST = "qemu"</div><div>#TEST_SCEN = "sanity bat sanity:boot toolchain"</div>
<div>#TEST_SERIALIZE = "1"</div><div>#OE_TERMINAL = "auto"</div><div>PATCHRESOLVE = "noop"</div><div>BB_DISKMON_DIRS = "\</div><div>&nbsp; &nbsp; STOPTASKS,${TMPDIR},1G,100K \</div><div>&nbsp; &nbsp; STOPTASKS,${DL_DIR},1G,100K \</div>
<div>&nbsp; &nbsp; STOPTASKS,${SSTATE_DIR},1G,100K \</div><div>&nbsp; &nbsp; ABORT,${TMPDIR},100M,1K \</div><div>&nbsp; &nbsp; ABORT,${DL_DIR},100M,1K \</div><div>&nbsp; &nbsp; ABORT,${SSTATE_DIR},100M,1K"</div><div>CONF_VERSION = "1"</div><div><br>
</div><div><br></div><div><br></div><div style="">When I run:</div><div style=""><br></div><div style="">&nbsp; &nbsp; $ runqemu qemumips64</div><div style=""><br></div><div style="">the virtual machine doens't appear to throw any errors (perhaps "hda: unknown partition table"?),</div>
<div style="">however the boot simply stops without ever getting to a cmdline (see attached image).</div></div></div>
<span>&lt;qemumips64.png&gt;</span></blockquote></div><br></body></html>

--Apple-Mail=_6573BA84-DB66-4E98-81BD-067D41001DDB--
