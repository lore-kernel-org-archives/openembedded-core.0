Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3C31F78388
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 03:52:44 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id t86so1570091pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 20:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=kFOY3rC8p331SSzVVrm+JKsGM6CfjiZtAdzpZbhBdZI=;
	b=o296Xe2mRFZ4ToKvAFmvFFfRm+FTDmvWWsD4NVyuYzkWxOjnuJHdLd3jH7B7rNtatx
	0VCSm93LdVrH1NbVKd8LxfFhlIVOEli1yldpP3J3LVwZl7bsfkfmhknW0D6yjRbB87CP
	CJ5H9uGuPHX/tBcxb5YqGS6RCM9eDBecbDZNxqyvvpvbRxP8oX7bwD0MYtRRwqp+lbWj
	Tu/8kH90yuR6TnQ0y9GCB4Z1F1ijaPXZD+XCGYK780MfpeB4lUQuMedpMUzpACt5yfIj
	Hr3qTaewHWxbywFXj0xNCd5Vo1aumHeA1TreJrZQPUaTNNsLvSTHN0AyC9NAfYcOnlYB
	qSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kFOY3rC8p331SSzVVrm+JKsGM6CfjiZtAdzpZbhBdZI=;
	b=jDO1Zbx/7FutFMlnDqZEW5GpIUToa59vPnX+47tLgFQxWUu4pSimZuAdp39Jqs/wOi
	+kAcu4OpYTg9HbTz014bxTOhq/PJFbZd5ntcn4OUKmM9ev5FsQ3p4k/QzY/KqcHXOFgF
	CwuyZBcQ0ehE/qj+v5kA3dxI4ImIQ+/qZqr1nLS9Jmc5guZp+naxERb+lxFZiosyFxLi
	c7dMlkhVTgtwxXvAHWBT/AP8N0sJEIR7x6AQZXjFy3mTJT0AMXOlV0PK20zfB1E9zmEo
	U3LbvUCCTLIDv94Td+mvIHTs1DsdqGtAaSRmm0BCTYUEmshpS7KYqE3Oz3lRs2qb/oPL
	sXIQ==
X-Gm-Message-State: AIVw111q78NPl3RZj7TrIQWaHeKVXT3/e1IKaoFlwQyEfbQcyep0KTWF
	qDMwLv5NQilDAXMvzFk=
X-Received: by 10.98.159.130 with SMTP id v2mr11547403pfk.20.1501386765862;
	Sat, 29 Jul 2017 20:52:45 -0700 (PDT)
Received: from Khems-MacBook-Pro.local ([2601:646:8882:b8c:10c6:217:786b:96d8])
	by smtp.gmail.com with ESMTPSA id
	n69sm34601382pfk.105.2017.07.29.20.52.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 20:52:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1501317178.git.raj.khem@gmail.com>
	<655b584f33664f8188d3425e28e7657749e5850e.1501317178.git.raj.khem@gmail.com>
	<CAJTo0La7eo62-OXosVJJX3sp2CktzmV5VQ60q499RL1aKCRLTA@mail.gmail.com>
	<CAJTo0LZECrZ7Myz1zFr=DiRf_bCTEMf_JZpUqa1vvQV24uEkTw@mail.gmail.com>
Organization: HIMVIS LLC
Message-ID: <8264e09e-7c9a-1df7-7e5f-458f253af813@gmail.com>
Date: Sat, 29 Jul 2017 20:52:37 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:55.0)
	Gecko/20100101 Thunderbird/55.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZECrZ7Myz1zFr=DiRf_bCTEMf_JZpUqa1vvQV24uEkTw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] llvm: Add recipe for 5.0
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
X-List-Received-Date: Sun, 30 Jul 2017 03:52:45 -0000
X-Groupsio-MsgNum: 100873
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="bs3vMNfa0THgWvf77kRw3W9GaeUd2nKFe"

--bs3vMNfa0THgWvf77kRw3W9GaeUd2nKFe
Content-Type: multipart/mixed; boundary="8VHCleG9O2vgDGd0IeWlcwLmppTwIOVNR";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <8264e09e-7c9a-1df7-7e5f-458f253af813@gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] llvm: Add recipe for 5.0
References: <cover.1501317178.git.raj.khem@gmail.com>
 <655b584f33664f8188d3425e28e7657749e5850e.1501317178.git.raj.khem@gmail.com>
 <CAJTo0La7eo62-OXosVJJX3sp2CktzmV5VQ60q499RL1aKCRLTA@mail.gmail.com>
 <CAJTo0LZECrZ7Myz1zFr=DiRf_bCTEMf_JZpUqa1vvQV24uEkTw@mail.gmail.com>
In-Reply-To: <CAJTo0LZECrZ7Myz1zFr=DiRf_bCTEMf_JZpUqa1vvQV24uEkTw@mail.gmail.com>

--8VHCleG9O2vgDGd0IeWlcwLmppTwIOVNR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Ross

I have refreshed the pull branch which should hopefully address mesa
configure issue you are seeing along with llvm fix

On 7/29/17 4:54 AM, Burton, Ross wrote:
> Replicated without uninative, so it's not that.
>=20
> Ross
>=20
> On 29 July 2017 at 12:39, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>=20
>     Fails like this for me:
>=20
>     | FAILED: tools/llvm-cvtres/Opts.inc.tmp
>     | cd
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/b=
uild
>     &&
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/b=
uild/NATIVE/bin/llvm-tblgen
>     -gen-opt-parser-defs -I
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/g=
it/tools/llvm-cvtres
>     -I
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/g=
it/include
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/g=
it/tools/llvm-cvtres/Opts.td
>     -o tools/llvm-cvtres/Opts.inc.tmp -d tools/llvm-cvtres/Opts.inc.d
>     | /bin/sh: 1:
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/b=
uild/NATIVE/bin/llvm-tblgen:
>     not found
>=20
>     It is there though:
>=20
>     $ ls -l
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/b=
uild/NATIVE/bin/llvm-tblgen
>     -rwxr-xr-x 1 ross ross 49807224 Jul 29 12:25
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/b=
uild/NATIVE/bin/llvm-tblgen
>=20
>     $
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/b=
uild/NATIVE/bin/llvm-tblgen
>     -bash:
>     /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/b=
uild/NATIVE/bin/llvm-tblgen:
>     No such file or directory
>=20
>     Might be related to having uninative enabled?
>=20
>     Ross
>=20
>=20
>     On 29 July 2017 at 09:35, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>=20
>         Based on recipe from meta-oe and clang recipe from meta-clang
>         Needed by mesa
>=20
>         Fixes
>         [YOCTO #11529]
>=20
>         Signed-off-by: Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>>
>         ---
>         =C2=A0...LibraryInfo-Undefine-libc-functions-if-th.patch |=C2=A0=
 93
>         ++++++++++++
>         =C2=A0.../0002-llvm-allow-env-override-of-exe-path.patch |=C2=A0=
 39 +++++
>         =C2=A0meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.b=
b>=C2=A0 =C2=A0
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 166 +++++++++++++++++++++
>         =C2=A03 files changed, 298 insertions(+)
>         =C2=A0create mode 100644
>         meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Und=
efine-libc-functions-if-th.patch
>         =C2=A0create mode 100644
>         meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of=
-exe-path.patch
>         =C2=A0create mode 100644 meta/recipes-devtools/llvm/llvm_git.bb=

>         <http://llvm_git.bb>
>=20
>         diff --git
>         a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-U=
ndefine-libc-functions-if-th.patch
>         b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-U=
ndefine-libc-functions-if-th.patch
>         new file mode 100644
>         index 0000000000..e251799259
>         --- /dev/null
>         +++
>         b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-U=
ndefine-libc-functions-if-th.patch
>         @@ -0,0 +1,93 @@
>         +From 28293e48cf1a52004c6a78de448718441f9e05f9 Mon Sep 17
>         00:00:00 2001
>         +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>=
>
>         +Date: Sat, 21 May 2016 00:33:20 +0000
>         +Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc
>         functions if they
>         + are macros
>         +
>         +musl defines some functions as macros and not inline functions=

>         +if this is the case then make sure to undefine them
>         +
>         +Signed-off-by: Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>>
>         +---
>         +Upstream-Status: Pending
>         +
>         + include/llvm/Analysis/TargetLibraryInfo.def | 21
>         +++++++++++++++++++++
>         + 1 file changed, 21 insertions(+)
>         +
>         +diff --git a/include/llvm/Analysis/TargetLibraryInfo.def
>         b/include/llvm/Analysis/TargetLibraryInfo.def
>         +index 9cbe917c146..aff8419cf54 100644
>         +--- a/include/llvm/Analysis/TargetLibraryInfo.def
>         ++++ b/include/llvm/Analysis/TargetLibraryInfo.def
>         +@@ -656,6 +656,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
>         + TLI_DEFINE_ENUM_INTERNAL(fopen)
>         + TLI_DEFINE_STRING_INTERNAL("fopen")
>         + /// FILE *fopen64(const char *filename, const char *opentype)=

>         ++#ifdef fopen64
>         ++#undef fopen64
>         ++#endif
>         + TLI_DEFINE_ENUM_INTERNAL(fopen64)
>         + TLI_DEFINE_STRING_INTERNAL("fopen64")
>         + /// int fprintf(FILE *stream, const char *format, ...);
>         +@@ -691,6 +694,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
>         + /// int fseeko(FILE *stream, off_t offset, int whence);
>         + TLI_DEFINE_ENUM_INTERNAL(fseeko)
>         + TLI_DEFINE_STRING_INTERNAL("fseeko")
>         ++#ifdef fseeko64
>         ++#undef fseeko64
>         ++#endif
>         + /// int fseeko64(FILE *stream, off64_t offset, int whence)
>         + TLI_DEFINE_ENUM_INTERNAL(fseeko64)
>         + TLI_DEFINE_STRING_INTERNAL("fseeko64")
>         +@@ -701,6 +707,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
>         + TLI_DEFINE_ENUM_INTERNAL(fstat)
>         + TLI_DEFINE_STRING_INTERNAL("fstat")
>         + /// int fstat64(int filedes, struct stat64 *buf)
>         ++#ifdef fstat64
>         ++#undef fstat64
>         ++#endif
>         + TLI_DEFINE_ENUM_INTERNAL(fstat64)
>         + TLI_DEFINE_STRING_INTERNAL("fstat64")
>         + /// int fstatvfs(int fildes, struct statvfs *buf);
>         +@@ -716,6 +725,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
>         + TLI_DEFINE_ENUM_INTERNAL(ftello)
>         + TLI_DEFINE_STRING_INTERNAL("ftello")
>         + /// off64_t ftello64(FILE *stream)
>         ++#ifdef ftello64
>         ++#undef ftello64
>         ++#endif
>         + TLI_DEFINE_ENUM_INTERNAL(ftello64)
>         + TLI_DEFINE_STRING_INTERNAL("ftello64")
>         + /// int ftrylockfile(FILE *file);
>         +@@ -836,6 +848,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
>         + TLI_DEFINE_ENUM_INTERNAL(lstat)
>         + TLI_DEFINE_STRING_INTERNAL("lstat")
>         + /// int lstat64(const char *path, struct stat64 *buf);
>         ++#ifdef lstat64
>         ++#undef lstat64
>         ++#endif
>         + TLI_DEFINE_ENUM_INTERNAL(lstat64)
>         + TLI_DEFINE_STRING_INTERNAL("lstat64")
>         + /// void *malloc(size_t size);
>         +@@ -1055,6 +1070,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
>         + TLI_DEFINE_ENUM_INTERNAL(stat)
>         + TLI_DEFINE_STRING_INTERNAL("stat")
>         + /// int stat64(const char *path, struct stat64 *buf);
>         ++#ifdef stat64
>         ++#undef stat64
>         ++#endif
>         + TLI_DEFINE_ENUM_INTERNAL(stat64)
>         + TLI_DEFINE_STRING_INTERNAL("stat64")
>         + /// int statvfs(const char *path, struct statvfs *buf);
>         +@@ -1184,6 +1202,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
>         + TLI_DEFINE_ENUM_INTERNAL(tmpfile)
>         + TLI_DEFINE_STRING_INTERNAL("tmpfile")
>         + /// FILE *tmpfile64(void)
>         ++#ifdef tmpfile64
>         ++#undef tmpfile64
>         ++#endif
>         + TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
>         + TLI_DEFINE_STRING_INTERNAL("tmpfile64")
>         + /// int toascii(int c);
>         +--
>         +2.13.1
>         +
>         diff --git
>         a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-=
of-exe-path.patch
>         b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-=
of-exe-path.patch
>         new file mode 100644
>         index 0000000000..832bd729ef
>         --- /dev/null
>         +++
>         b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-=
of-exe-path.patch
>         @@ -0,0 +1,39 @@
>         +From d776487bac17650704614248d19d1e6b35775001 Mon Sep 17
>         00:00:00 2001
>         +From: Martin Kelly <mkelly@xevo.com <mailto:mkelly@xevo.com>>
>         +Date: Fri, 19 May 2017 00:22:57 -0700
>         +Subject: [PATCH 2/2] llvm: allow env override of exe path
>         +
>         +When using a native llvm-config from inside a sysroot, we need=

>         llvm-config to
>         +return the libraries, include directories, etc. from inside th=
e
>         sysroot rather
>         +than from the native sysroot. Thus provide an env override for=

>         calling
>         +llvm-config from a target sysroot.
>         +
>         +Signed-off-by: Martin Kelly <mkelly@xevo.com
>         <mailto:mkelly@xevo.com>>
>         +Signed-off-by: Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>>
>         +---
>         +Upstream-Status: Pending
>         +
>         + tools/llvm-config/llvm-config.cpp | 7 +++++++
>         + 1 file changed, 7 insertions(+)
>         +
>         +diff --git a/tools/llvm-config/llvm-config.cpp
>         b/tools/llvm-config/llvm-config.cpp
>         +index 08b096afb05..d8d7742744e 100644
>         +--- a/tools/llvm-config/llvm-config.cpp
>         ++++ b/tools/llvm-config/llvm-config.cpp
>         +@@ -225,6 +225,13 @@ Typical components:\n\
>         +
>         + /// \brief Compute the path to the main executable.
>         + std::string GetExecutablePath(const char *Argv0) {
>         ++=C2=A0 // Hack for Yocto: we need to override the root path w=
hen we
>         are using
>         ++=C2=A0 // llvm-config from within a target sysroot.
>         ++=C2=A0 const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_E=
XE_PATH");
>         ++=C2=A0 if (Sysroot !=3D nullptr) {
>         ++=C2=A0 =C2=A0 return Sysroot;
>         ++=C2=A0 }
>         ++
>         +=C2=A0 =C2=A0// This just needs to be some symbol in the binar=
y; C++ doesn't
>         +=C2=A0 =C2=A0// allow taking the address of ::main however.
>         +=C2=A0 =C2=A0void *P =3D (void *)(intptr_t)GetExecutablePath;
>         +--
>         +2.13.1
>         +
>         diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
>         <http://llvm_git.bb> b/meta/recipes-devtools/llvm/llvm_git.bb
>         <http://llvm_git.bb>
>         new file mode 100644
>         index 0000000000..7b51d2153f
>         --- /dev/null
>         +++ b/meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.b=
b>
>         @@ -0,0 +1,166 @@
>         +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>>
>         +# Released under the MIT license (see COPYING.MIT for the term=
s)
>         +
>         +DESCRIPTION =3D "The LLVM Compiler Infrastructure"
>         +HOMEPAGE =3D "http://llvm.org"
>         +LICENSE =3D "NCSA"
>         +SECTION =3D "devel"
>         +
>         +LIC_FILES_CHKSUM =3D
>         "file://LICENSE.TXT;md5=3De825e017edc35cfd58e26116e5251771"
>         +
>         +DEPENDS =3D "libffi libxml2-native zlib ninja-native"
>         +
>         +RDEPENDS_${PN}_append_class-target =3D " ncurses-terminfo"
>         +
>         +inherit perlnative pythonnative cmake pkgconfig
>         +
>         +PROVIDES +=3D "llvm${PV}"
>         +
>         +LLVM_RELEASE =3D "${PV}"
>         +LLVM_DIR =3D "llvm${LLVM_RELEASE}"
>         +
>         +SRCREV =3D "9a5c333388cbb54a0ce3a67c4f539f5e590a089b"
>         +PV =3D "5.0"
>         +PATCH_VERSION =3D "0"
>         +SRC_URI =3D
>         "git://github.com/llvm-mirror/llvm.git;branch=3Drelease_50;prot=
ocol=3Dhttp
>         <http://github.com/llvm-mirror/llvm.git;branch=3Drelease_50;pro=
tocol=3Dhttp>
>         \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>         =C2=A0file://0001-llvm-TargetLibraryInfo-Undefine-libc-function=
s-if-th.patch
>         \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-llvm-allo=
w-env-override-of-exe-path.patch \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>         +S =3D "${WORKDIR}/git"
>         +
>         +LLVM_INSTALL_DIR =3D "${WORKDIR}/llvm-install"
>         +def get_llvm_arch(bb, d, arch_var):
>         +=C2=A0 =C2=A0 import re
>         +=C2=A0 =C2=A0 a =3D d.getVar(arch_var, True)
>         +=C2=A0 =C2=A0 if=C2=A0 =C2=A0re.match('(i.86|athlon|x86.64)$',=
 a):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 'X86'
>         +=C2=A0 =C2=A0 elif re.match('arm$', a):=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 'ARM'
>         +=C2=A0 =C2=A0 elif re.match('armeb$', a):=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 'AR=
M'
>         +=C2=A0 =C2=A0 elif re.match('aarch64$', a):=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>         'AArch64'
>         +=C2=A0 =C2=A0 elif re.match('aarch64_be$', a):=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return
>         'AArch64'
>         +=C2=A0 =C2=A0 elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a=
): return
>         'Mips'
>         +=C2=A0 =C2=A0 elif re.match('p(pc|owerpc)(|64)', a):=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return
>         'PowerPC'
>         +=C2=A0 =C2=A0 else:
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error("cannot map '%s' to a sup=
ported llvm
>         architecture" % a)
>         +=C2=A0 =C2=A0 return ""
>         +
>         +def get_llvm_target_arch(bb, d):
>         +=C2=A0 =C2=A0 return get_llvm_arch(bb, d, 'TARGET_ARCH')
>         +#
>         +# Default to build all OE-Core supported target arches (user
>         overridable).
>         +#
>         +LLVM_TARGETS ?=3D "${@get_llvm_target_arch(bb, d)}"
>         +LLVM_TARGETS_prepend_x86 =3D "AMDGPU;"
>         +LLVM_TARGETS_prepend_x86-64 =3D "AMDGPU;"
>         +
>         +EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DLLVM_ENABLE_EXPENSIVE_CHECKS=3DOFF \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DLLVM_ENABLE_PIC=3DON \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DLLVM_BINDINGS_LIST=3D'' \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DLLVM_LINK_LLVM_DYLIB=3DON \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DLLVM_ENABLE_FFI=3DON \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DFFI_INCLUDE_DIR=3D$(pkg-config
>         --variable=3Dincludedir libffi) \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DLLVM_OPTIMIZED_TABLEGEN=3DON \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DLLVM_TARGETS_TO_BUILD=3D"${LLVM_TARGETS}" \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DCMAKE_CROSSCOMPILING:BOOL=3DON \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -G Ninja \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
"
>         +EXTRA_OECMAKE_remove_class-native =3D
>         "-DCMAKE_CROSSCOMPILING:BOOL=3DON"
>         +
>         +do_configure_prepend() {
>         +# Fix paths in llvm-config
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i
>         "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::paren=
t_path(sys::path::parent_path(CurrentPath))).str()|g"
>         ${S}/tools/llvm-config/llvm-config.cpp
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -ri "s#/(bin|include|lib)(/?\")=
#/\1/${LLVM_DIR}\2#g"
>         ${S}/tools/llvm-config/llvm-config.cpp
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -ri "s#lib/${LLVM_DIR}#${baseli=
b}/${LLVM_DIR}#g"
>         ${S}/tools/llvm-config/llvm-config.cpp
>         +}
>         +
>         +do_compile() {
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0NINJA_STATUS=3D"[%p] " ninja -v ${P=
ARALLEL_MAKE}
>         +}
>         +
>         +do_install() {
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0NINJA_STATUS=3D"[%p] " DESTDIR=3D${=
LLVM_INSTALL_DIR} ninja
>         -v install
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0755 ${B}/NATIVE/bin/=
llvm-config
>         ${D}${libdir}/${LLVM_DIR}/llvm-config-host
>         +
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}/${LLVM_DIR=
}
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${LLVM_INSTALL_DIR}${bindir}/=
*
>         ${D}${bindir}/${LLVM_DIR}/
>         +
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${includedir}/${LLVM=
_DIR}
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${LLVM_INSTALL_DIR}${included=
ir}/*
>         ${D}${includedir}/${LLVM_DIR}/
>         +
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/${LLVM_DIR=
}
>         +
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0# The LLVM sources have "/lib" embe=
dded and so we cannot
>         completely rely on the ${libdir} variable
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${LLVM_INSTALL_DIR}${libdir=
}/ ]; then
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r $=
{LLVM_INSTALL_DIR}${libdir}/*
>         ${D}${libdir}/${LLVM_DIR}/
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -d ${LLVM_INSTALL_DIR}${pref=
ix}/lib ]; then
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r $=
{LLVM_INSTALL_DIR}${prefix}/lib/*
>         ${D}${libdir}/${LLVM_DIR}/
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -d ${LLVM_INSTALL_DIR}${pref=
ix}/lib64 ]; then
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r $=
{LLVM_INSTALL_DIR}${prefix}/lib64/*
>         ${D}${libdir}/${LLVM_DIR}/
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>         +
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove unnecessary cmake files
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/${LLVM_DIR}/cm=
ake
>         +
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${LLVM_DIR}/libLLVM-${PV}${SO=
LIBSDEV}
>         ${D}${libdir}/libLLVM-${PV}${SOLIBSDEV}
>         +
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0# We'll have to delete the libLLVM.=
so due to multiple
>         reasons...
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/${LLVM_DIR}/li=
bLLVM.so
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/${LLVM_DIR}/li=
bLTO.so
>         +}
>         +
>         +PACKAGES +=3D "${PN}-bugpointpasses ${PN}-llvmhello"
>         +ALLOW_EMPTY_${PN} =3D "1"
>         +ALLOW_EMPTY_${PN}-staticdev =3D "1"
>         +FILES_${PN} =3D ""
>         +FILES_${PN}-staticdev =3D ""
>         +FILES_${PN}-dbg =3D " \
>         +=C2=A0 =C2=A0 ${bindir}/${LLVM_DIR}/.debug \
>         +=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \=

>         +=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
>         +=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/.debug/libLTO.so* \
>         +=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/.debug/llvm-config-host \
>         +=C2=A0 =C2=A0 /usr/src/debug \
>         +"
>         +
>         +FILES_${PN}-dev =3D " \
>         +=C2=A0 =C2=A0 ${bindir}/${LLVM_DIR} \
>         +=C2=A0 =C2=A0 ${includedir}/${LLVM_DIR} \
>         +=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/llvm-config-host \
>         +"
>         +
>         +RRECOMMENDS_${PN}-dev +=3D "${PN}-bugpointpasses ${PN}-llvmhel=
lo"
>         +
>         +FILES_${PN}-bugpointpasses =3D "\
>         +=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/BugpointPasses.so \
>         +"
>         +FILES_${PN} +=3D "\
>         +=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/libLTO.so.* \
>         +"
>         +
>         +FILES_${PN}-llvmhello =3D "\
>         +=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/LLVMHello.so \
>         +"
>         +
>         +PACKAGES_DYNAMIC =3D "^libllvm${LLVM_RELEASE}-.*$"
>         +NOAUTOPACKAGEDEBUG =3D "1"
>         +
>         +INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELE=
ASE}.${PATCH_VERSION}
>         +=3D "dev-so"
>         +INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELE=
ASE}
>         +=3D "dev-so"
>         +INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm +=3D "dev-s=
o"
>         +
>         +python llvm_populate_packages() {
>         +=C2=A0 =C2=A0 libdir =3D bb.data.expand('${libdir}', d)
>         +=C2=A0 =C2=A0 libllvm_libdir =3D bb.data.expand('${libdir}/${L=
LVM_DIR}', d)
>         +=C2=A0 =C2=A0 split_dbg_packages =3D do_split_packages(d,
>         libllvm_libdir+'/.debug', '^lib(.*)\.so$',
>         'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s',
>         allow_dirs=3DTrue)
>         +=C2=A0 =C2=A0 split_packages =3D do_split_packages(d, libdir,
>         '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package fo=
r
>         %s', allow_dirs=3DTrue, allow_links=3DTrue, recursive=3DTrue)
>         +=C2=A0 =C2=A0 split_staticdev_packages =3D do_split_packages(d=
,
>         libllvm_libdir, '^lib(.*)\.a$',
>         'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package=

>         for %s', allow_dirs=3DTrue)
>         +=C2=A0 =C2=A0 if split_packages:
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D d.getVar('PN', True)
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar('RDEPENDS_' + pn, ' '+=
' '.join(split_packages))
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar('RDEPENDS_' + pn + '-d=
bg', ' '+'
>         '.join(split_dbg_packages))
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar('RDEPENDS_' + pn + '-s=
taticdev', ' '+'
>         '.join(split_staticdev_packages))
>         +}
>         +
>         +PACKAGESPLITFUNCS_prepend =3D "llvm_populate_packages "
>         +
>         +BBCLASSEXTEND =3D "native nativesdk"
>         --
>         2.13.3
>=20
>         --
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-co=
re>
>=20
>=20
>=20



--8VHCleG9O2vgDGd0IeWlcwLmppTwIOVNR--

--bs3vMNfa0THgWvf77kRw3W9GaeUd2nKFe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAll9WAoACgkQuwUzVZGdMxTM/QCfRTfxwrqN5oY/g1dyFsaRrS8Z
+KQAn1xLthLX1w0fX3/vvlAzARfc1VTm
=J8Tj
-----END PGP SIGNATURE-----

--bs3vMNfa0THgWvf77kRw3W9GaeUd2nKFe--
