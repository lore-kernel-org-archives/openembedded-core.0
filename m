Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id E539F784E3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 11:54:28 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id v127so108270284itd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rSSl0PSK82RiKxQH451biDsdUPMg/tL8ekgrsIIL05k=;
	b=iJBsRGCatN6D2jhM9AlPI5ycJ1iSn/OxbWtN/zoNFPso4Ov35C4UwKQEu841pa93Bb
	af3CJwidQ+r9VCdaswir4Wa4fJZ4yBi6P8pCOAIxXB4ec6E34A76b+q53g9LC+Eqjnk/
	lulF7kVCmV8422qZC8Dtib0H8fBT0w8VbodA2bzTz1CERjN13RoBR9MYoyf3RAbz6U8w
	ZJ5/HRJaAqvSgPKBkntw5koXdBnh51OAPqXiyUX+CtnuiO8fYQU5XhGj58BnDuaO3ot5
	WU256EcoiNDdqzw4hV0Xh1yO1iQfZAja+OyTKjLgkzS0EllpyG9qoSCIBxg1IJd2IlaJ
	DEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rSSl0PSK82RiKxQH451biDsdUPMg/tL8ekgrsIIL05k=;
	b=Q+CDu2IWojLItxuLbj/G+vYLwTnYZAWQBgP9ii6CIKWpPa7mX1+OBc/Pd0m34hnmjb
	JSpIjAAPy0C5CPdZt7Buc5JppNrn0wPQocPqHNRaeT891cn3l6RlFiLeo6NefUKahczH
	hYPEHqrAwA6AnBRfbh3098DiklFmPMq5AIyrc0uZb6rdrtAQcPxCqQCJEmEqDWbZnR3t
	aDwPxMgUyMzv8CIwFW79qZiKAconh/5zMqMXV4lBpu0YrVsJTtGUaEtOvJHYFEuOIoOt
	XmKcNnCx5gxISBNeJO4NNYVJT1TosAuaZv5TC/fOxYofjxUxHhQMmFvRMrdzOFQkh4+d
	y/qQ==
X-Gm-Message-State: AIVw112z1v1v01vmKnuc6k50JazULYkxq+kFC245YBwxBjOB0KIrKelp
	oMiYxdjsuAuFoipcv9Cpa4LstPr7lUrb
X-Received: by 10.36.26.13 with SMTP id 13mr11907821iti.87.1501329269543; Sat,
	29 Jul 2017 04:54:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Sat, 29 Jul 2017 04:54:08 -0700 (PDT)
In-Reply-To: <CAJTo0La7eo62-OXosVJJX3sp2CktzmV5VQ60q499RL1aKCRLTA@mail.gmail.com>
References: <cover.1501317178.git.raj.khem@gmail.com>
	<655b584f33664f8188d3425e28e7657749e5850e.1501317178.git.raj.khem@gmail.com>
	<CAJTo0La7eo62-OXosVJJX3sp2CktzmV5VQ60q499RL1aKCRLTA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Jul 2017 12:54:08 +0100
Message-ID: <CAJTo0LZECrZ7Myz1zFr=DiRf_bCTEMf_JZpUqa1vvQV24uEkTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 29 Jul 2017 11:54:29 -0000
Content-Type: multipart/alternative; boundary="001a11441b5ccd68b80555737554"

--001a11441b5ccd68b80555737554
Content-Type: text/plain; charset="UTF-8"

Replicated without uninative, so it's not that.

Ross

On 29 July 2017 at 12:39, Burton, Ross <ross.burton@intel.com> wrote:

> Fails like this for me:
>
> | FAILED: tools/llvm-cvtres/Opts.inc.tmp
> | cd /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/build
> && /data/poky-tmp/master/build/work/corei7-64-poky-linux/
> llvm/5.0-r0/build/NATIVE/bin/llvm-tblgen -gen-opt-parser-defs -I
> /data/poky-tmp/master/build/work/corei7-64-poky-linux/
> llvm/5.0-r0/git/tools/llvm-cvtres -I /data/poky-tmp/master/build/
> work/corei7-64-poky-linux/llvm/5.0-r0/git/include
> /data/poky-tmp/master/build/work/corei7-64-poky-linux/
> llvm/5.0-r0/git/tools/llvm-cvtres/Opts.td -o
> tools/llvm-cvtres/Opts.inc.tmp -d tools/llvm-cvtres/Opts.inc.d
> | /bin/sh: 1: /data/poky-tmp/master/build/work/corei7-64-poky-linux/
> llvm/5.0-r0/build/NATIVE/bin/llvm-tblgen: not found
>
> It is there though:
>
> $ ls -l /data/poky-tmp/master/build/work/corei7-64-poky-linux/
> llvm/5.0-r0/build/NATIVE/bin/llvm-tblgen
> -rwxr-xr-x 1 ross ross 49807224 Jul 29 12:25 /data/poky-tmp/master/build/
> work/corei7-64-poky-linux/llvm/5.0-r0/build/NATIVE/bin/llvm-tblgen
>
> $ /data/poky-tmp/master/build/work/corei7-64-poky-linux/
> llvm/5.0-r0/build/NATIVE/bin/llvm-tblgen
> -bash: /data/poky-tmp/master/build/work/corei7-64-poky-linux/
> llvm/5.0-r0/build/NATIVE/bin/llvm-tblgen: No such file or directory
>
> Might be related to having uninative enabled?
>
> Ross
>
>
> On 29 July 2017 at 09:35, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Based on recipe from meta-oe and clang recipe from meta-clang
>> Needed by mesa
>>
>> Fixes
>> [YOCTO #11529]
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...LibraryInfo-Undefine-libc-functions-if-th.patch |  93 ++++++++++++
>>  .../0002-llvm-allow-env-override-of-exe-path.patch |  39 +++++
>>  meta/recipes-devtools/llvm/llvm_git.bb             | 166
>> +++++++++++++++++++++
>>  3 files changed, 298 insertions(+)
>>  create mode 100644 meta/recipes-devtools/llvm/llv
>> m/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
>>  create mode 100644 meta/recipes-devtools/llvm/llv
>> m/0002-llvm-allow-env-override-of-exe-path.patch
>>  create mode 100644 meta/recipes-devtools/llvm/llvm_git.bb
>>
>> diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInf
>> o-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/llvm/l
>> lvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
>> new file mode 100644
>> index 0000000000..e251799259
>> --- /dev/null
>> +++ b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInf
>> o-Undefine-libc-functions-if-th.patch
>> @@ -0,0 +1,93 @@
>> +From 28293e48cf1a52004c6a78de448718441f9e05f9 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 21 May 2016 00:33:20 +0000
>> +Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions if
>> they
>> + are macros
>> +
>> +musl defines some functions as macros and not inline functions
>> +if this is the case then make sure to undefine them
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>> +
>> + include/llvm/Analysis/TargetLibraryInfo.def | 21 +++++++++++++++++++++
>> + 1 file changed, 21 insertions(+)
>> +
>> +diff --git a/include/llvm/Analysis/TargetLibraryInfo.def
>> b/include/llvm/Analysis/TargetLibraryInfo.def
>> +index 9cbe917c146..aff8419cf54 100644
>> +--- a/include/llvm/Analysis/TargetLibraryInfo.def
>> ++++ b/include/llvm/Analysis/TargetLibraryInfo.def
>> +@@ -656,6 +656,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
>> + TLI_DEFINE_ENUM_INTERNAL(fopen)
>> + TLI_DEFINE_STRING_INTERNAL("fopen")
>> + /// FILE *fopen64(const char *filename, const char *opentype)
>> ++#ifdef fopen64
>> ++#undef fopen64
>> ++#endif
>> + TLI_DEFINE_ENUM_INTERNAL(fopen64)
>> + TLI_DEFINE_STRING_INTERNAL("fopen64")
>> + /// int fprintf(FILE *stream, const char *format, ...);
>> +@@ -691,6 +694,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
>> + /// int fseeko(FILE *stream, off_t offset, int whence);
>> + TLI_DEFINE_ENUM_INTERNAL(fseeko)
>> + TLI_DEFINE_STRING_INTERNAL("fseeko")
>> ++#ifdef fseeko64
>> ++#undef fseeko64
>> ++#endif
>> + /// int fseeko64(FILE *stream, off64_t offset, int whence)
>> + TLI_DEFINE_ENUM_INTERNAL(fseeko64)
>> + TLI_DEFINE_STRING_INTERNAL("fseeko64")
>> +@@ -701,6 +707,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
>> + TLI_DEFINE_ENUM_INTERNAL(fstat)
>> + TLI_DEFINE_STRING_INTERNAL("fstat")
>> + /// int fstat64(int filedes, struct stat64 *buf)
>> ++#ifdef fstat64
>> ++#undef fstat64
>> ++#endif
>> + TLI_DEFINE_ENUM_INTERNAL(fstat64)
>> + TLI_DEFINE_STRING_INTERNAL("fstat64")
>> + /// int fstatvfs(int fildes, struct statvfs *buf);
>> +@@ -716,6 +725,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
>> + TLI_DEFINE_ENUM_INTERNAL(ftello)
>> + TLI_DEFINE_STRING_INTERNAL("ftello")
>> + /// off64_t ftello64(FILE *stream)
>> ++#ifdef ftello64
>> ++#undef ftello64
>> ++#endif
>> + TLI_DEFINE_ENUM_INTERNAL(ftello64)
>> + TLI_DEFINE_STRING_INTERNAL("ftello64")
>> + /// int ftrylockfile(FILE *file);
>> +@@ -836,6 +848,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
>> + TLI_DEFINE_ENUM_INTERNAL(lstat)
>> + TLI_DEFINE_STRING_INTERNAL("lstat")
>> + /// int lstat64(const char *path, struct stat64 *buf);
>> ++#ifdef lstat64
>> ++#undef lstat64
>> ++#endif
>> + TLI_DEFINE_ENUM_INTERNAL(lstat64)
>> + TLI_DEFINE_STRING_INTERNAL("lstat64")
>> + /// void *malloc(size_t size);
>> +@@ -1055,6 +1070,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
>> + TLI_DEFINE_ENUM_INTERNAL(stat)
>> + TLI_DEFINE_STRING_INTERNAL("stat")
>> + /// int stat64(const char *path, struct stat64 *buf);
>> ++#ifdef stat64
>> ++#undef stat64
>> ++#endif
>> + TLI_DEFINE_ENUM_INTERNAL(stat64)
>> + TLI_DEFINE_STRING_INTERNAL("stat64")
>> + /// int statvfs(const char *path, struct statvfs *buf);
>> +@@ -1184,6 +1202,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
>> + TLI_DEFINE_ENUM_INTERNAL(tmpfile)
>> + TLI_DEFINE_STRING_INTERNAL("tmpfile")
>> + /// FILE *tmpfile64(void)
>> ++#ifdef tmpfile64
>> ++#undef tmpfile64
>> ++#endif
>> + TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
>> + TLI_DEFINE_STRING_INTERNAL("tmpfile64")
>> + /// int toascii(int c);
>> +--
>> +2.13.1
>> +
>> diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
>> b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-overri
>> de-of-exe-path.patch
>> new file mode 100644
>> index 0000000000..832bd729ef
>> --- /dev/null
>> +++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-overri
>> de-of-exe-path.patch
>> @@ -0,0 +1,39 @@
>> +From d776487bac17650704614248d19d1e6b35775001 Mon Sep 17 00:00:00 2001
>> +From: Martin Kelly <mkelly@xevo.com>
>> +Date: Fri, 19 May 2017 00:22:57 -0700
>> +Subject: [PATCH 2/2] llvm: allow env override of exe path
>> +
>> +When using a native llvm-config from inside a sysroot, we need
>> llvm-config to
>> +return the libraries, include directories, etc. from inside the sysroot
>> rather
>> +than from the native sysroot. Thus provide an env override for calling
>> +llvm-config from a target sysroot.
>> +
>> +Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>> +
>> + tools/llvm-config/llvm-config.cpp | 7 +++++++
>> + 1 file changed, 7 insertions(+)
>> +
>> +diff --git a/tools/llvm-config/llvm-config.cpp
>> b/tools/llvm-config/llvm-config.cpp
>> +index 08b096afb05..d8d7742744e 100644
>> +--- a/tools/llvm-config/llvm-config.cpp
>> ++++ b/tools/llvm-config/llvm-config.cpp
>> +@@ -225,6 +225,13 @@ Typical components:\n\
>> +
>> + /// \brief Compute the path to the main executable.
>> + std::string GetExecutablePath(const char *Argv0) {
>> ++  // Hack for Yocto: we need to override the root path when we are using
>> ++  // llvm-config from within a target sysroot.
>> ++  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
>> ++  if (Sysroot != nullptr) {
>> ++    return Sysroot;
>> ++  }
>> ++
>> +   // This just needs to be some symbol in the binary; C++ doesn't
>> +   // allow taking the address of ::main however.
>> +   void *P = (void *)(intptr_t)GetExecutablePath;
>> +--
>> +2.13.1
>> +
>> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
>> b/meta/recipes-devtools/llvm/llvm_git.bb
>> new file mode 100644
>> index 0000000000..7b51d2153f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
>> @@ -0,0 +1,166 @@
>> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +DESCRIPTION = "The LLVM Compiler Infrastructure"
>> +HOMEPAGE = "http://llvm.org"
>> +LICENSE = "NCSA"
>> +SECTION = "devel"
>> +
>> +LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=e825e0
>> 17edc35cfd58e26116e5251771"
>> +
>> +DEPENDS = "libffi libxml2-native zlib ninja-native"
>> +
>> +RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
>> +
>> +inherit perlnative pythonnative cmake pkgconfig
>> +
>> +PROVIDES += "llvm${PV}"
>> +
>> +LLVM_RELEASE = "${PV}"
>> +LLVM_DIR = "llvm${LLVM_RELEASE}"
>> +
>> +SRCREV = "9a5c333388cbb54a0ce3a67c4f539f5e590a089b"
>> +PV = "5.0"
>> +PATCH_VERSION = "0"
>> +SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=release_50;pro
>> tocol=http \
>> +           file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
>> \
>> +           file://0002-llvm-allow-env-override-of-exe-path.patch \
>> +          "
>> +S = "${WORKDIR}/git"
>> +
>> +LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
>> +def get_llvm_arch(bb, d, arch_var):
>> +    import re
>> +    a = d.getVar(arch_var, True)
>> +    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
>> +    elif re.match('arm$', a):                          return 'ARM'
>> +    elif re.match('armeb$', a):                        return 'ARM'
>> +    elif re.match('aarch64$', a):                      return 'AArch64'
>> +    elif re.match('aarch64_be$', a):                   return 'AArch64'
>> +    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
>> +    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
>> +    else:
>> +        bb.error("cannot map '%s' to a supported llvm architecture" % a)
>> +    return ""
>> +
>> +def get_llvm_target_arch(bb, d):
>> +    return get_llvm_arch(bb, d, 'TARGET_ARCH')
>> +#
>> +# Default to build all OE-Core supported target arches (user
>> overridable).
>> +#
>> +LLVM_TARGETS ?= "${@get_llvm_target_arch(bb, d)}"
>> +LLVM_TARGETS_prepend_x86 = "AMDGPU;"
>> +LLVM_TARGETS_prepend_x86-64 = "AMDGPU;"
>> +
>> +EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
>> +                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
>> +                  -DLLVM_ENABLE_PIC=ON \
>> +                  -DLLVM_BINDINGS_LIST='' \
>> +                  -DLLVM_LINK_LLVM_DYLIB=ON \
>> +                  -DLLVM_ENABLE_FFI=ON \
>> +                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir
>> libffi) \
>> +                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
>> +                  -DLLVM_TARGETS_TO_BUILD="${LLVM_TARGETS}" \
>> +                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
>> +                  -G Ninja \
>> +                 "
>> +EXTRA_OECMAKE_remove_class-native = "-DCMAKE_CROSSCOMPILING:BOOL=ON"
>> +
>> +do_configure_prepend() {
>> +# Fix paths in llvm-config
>> +       sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::
>> parent_path(sys::path::parent_path(CurrentPath))).str()|g"
>> ${S}/tools/llvm-config/llvm-config.cpp
>> +       sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g"
>> ${S}/tools/llvm-config/llvm-config.cpp
>> +       sed -ri "s#lib/${LLVM_DIR}#${baselib}/${LLVM_DIR}#g"
>> ${S}/tools/llvm-config/llvm-config.cpp
>> +}
>> +
>> +do_compile() {
>> +       NINJA_STATUS="[%p] " ninja -v ${PARALLEL_MAKE}
>> +}
>> +
>> +do_install() {
>> +       NINJA_STATUS="[%p] " DESTDIR=${LLVM_INSTALL_DIR} ninja -v install
>> +       install -D -m 0755 ${B}/NATIVE/bin/llvm-config
>> ${D}${libdir}/${LLVM_DIR}/llvm-config-host
>> +
>> +       install -d ${D}${bindir}/${LLVM_DIR}
>> +       cp -r ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
>> +
>> +       install -d ${D}${includedir}/${LLVM_DIR}
>> +       cp -r ${LLVM_INSTALL_DIR}${includedir}/*
>> ${D}${includedir}/${LLVM_DIR}/
>> +
>> +       install -d ${D}${libdir}/${LLVM_DIR}
>> +
>> +       # The LLVM sources have "/lib" embedded and so we cannot
>> completely rely on the ${libdir} variable
>> +       if [ -d ${LLVM_INSTALL_DIR}${libdir}/ ]; then
>> +               cp -r ${LLVM_INSTALL_DIR}${libdir}/*
>> ${D}${libdir}/${LLVM_DIR}/
>> +       elif [ -d ${LLVM_INSTALL_DIR}${prefix}/lib ]; then
>> +               cp -r ${LLVM_INSTALL_DIR}${prefix}/lib/*
>> ${D}${libdir}/${LLVM_DIR}/
>> +       elif [ -d ${LLVM_INSTALL_DIR}${prefix}/lib64 ]; then
>> +               cp -r ${LLVM_INSTALL_DIR}${prefix}/lib64/*
>> ${D}${libdir}/${LLVM_DIR}/
>> +       fi
>> +
>> +       # Remove unnecessary cmake files
>> +       rm -rf ${D}${libdir}/${LLVM_DIR}/cmake
>> +
>> +       ln -s ${LLVM_DIR}/libLLVM-${PV}${SOLIBSDEV}
>> ${D}${libdir}/libLLVM-${PV}${SOLIBSDEV}
>> +
>> +       # We'll have to delete the libLLVM.so due to multiple reasons...
>> +       rm -rf ${D}${libdir}/${LLVM_DIR}/libLLVM.so
>> +       rm -rf ${D}${libdir}/${LLVM_DIR}/libLTO.so
>> +}
>> +
>> +PACKAGES += "${PN}-bugpointpasses ${PN}-llvmhello"
>> +ALLOW_EMPTY_${PN} = "1"
>> +ALLOW_EMPTY_${PN}-staticdev = "1"
>> +FILES_${PN} = ""
>> +FILES_${PN}-staticdev = ""
>> +FILES_${PN}-dbg = " \
>> +    ${bindir}/${LLVM_DIR}/.debug \
>> +    ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
>> +    ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
>> +    ${libdir}/${LLVM_DIR}/.debug/libLTO.so* \
>> +    ${libdir}/${LLVM_DIR}/.debug/llvm-config-host \
>> +    /usr/src/debug \
>> +"
>> +
>> +FILES_${PN}-dev = " \
>> +    ${bindir}/${LLVM_DIR} \
>> +    ${includedir}/${LLVM_DIR} \
>> +    ${libdir}/${LLVM_DIR}/llvm-config-host \
>> +"
>> +
>> +RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello"
>> +
>> +FILES_${PN}-bugpointpasses = "\
>> +    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
>> +"
>> +FILES_${PN} += "\
>> +    ${libdir}/${LLVM_DIR}/libLTO.so.* \
>> +"
>> +
>> +FILES_${PN}-llvmhello = "\
>> +    ${libdir}/${LLVM_DIR}/LLVMHello.so \
>> +"
>> +
>> +PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
>> +NOAUTOPACKAGEDEBUG = "1"
>> +
>> +INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE}.${PATCH_VERSION}
>> += "dev-so"
>> +INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} +=
>> "dev-so"
>> +INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm += "dev-so"
>> +
>> +python llvm_populate_packages() {
>> +    libdir = bb.data.expand('${libdir}', d)
>> +    libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
>> +    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug',
>> '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package
>> for %s', allow_dirs=True)
>> +    split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$',
>> 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True,
>> allow_links=True, recursive=True)
>> +    split_staticdev_packages = do_split_packages(d, libllvm_libdir,
>> '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev
>> package for %s', allow_dirs=True)
>> +    if split_packages:
>> +        pn = d.getVar('PN', True)
>> +        d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
>> +        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+'
>> '.join(split_dbg_packages))
>> +        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+'
>> '.join(split_staticdev_packages))
>> +}
>> +
>> +PACKAGESPLITFUNCS_prepend = "llvm_populate_packages "
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.13.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a11441b5ccd68b80555737554
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Replicated without uninative, so it&#39;s not that.<div><b=
r></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 29 July 2017 at 12:39, Burton, Ross <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
">Fails like this for me:<div><br></div><div><div>| FAILED: tools/llvm-cvtr=
es/Opts.inc.tmp</div><div>| cd /data/poky-tmp/master/build/<wbr>work/corei7=
-64-poky-linux/<wbr>llvm/5.0-r0/build &amp;&amp; /data/poky-tmp/master/buil=
d/<wbr>work/corei7-64-poky-linux/<wbr>llvm/5.0-r0/build/NATIVE/bin/<wbr>llv=
m-tblgen -gen-opt-parser-defs -I /data/poky-tmp/master/build/<wbr>work/core=
i7-64-poky-linux/<wbr>llvm/5.0-r0/git/tools/llvm-<wbr>cvtres -I /data/poky-=
tmp/master/build/<wbr>work/corei7-64-poky-linux/<wbr>llvm/5.0-r0/git/includ=
e /data/poky-tmp/master/build/<wbr>work/corei7-64-poky-linux/<wbr>llvm/5.0-=
r0/git/tools/llvm-<wbr>cvtres/Opts.td -o tools/llvm-cvtres/Opts.inc.tmp -d =
tools/llvm-cvtres/Opts.inc.d</div><div>| /bin/sh: 1: /data/poky-tmp/master/=
build/<wbr>work/corei7-64-poky-linux/<wbr>llvm/5.0-r0/build/NATIVE/bin/<wbr=
>llvm-tblgen: not found</div></div><div><br></div><div>It is there though:<=
/div><div><br></div><div><div>$ ls -l /data/poky-tmp/master/build/<wbr>work=
/corei7-64-poky-linux/<wbr>llvm/5.0-r0/build/NATIVE/bin/<wbr>llvm-tblgen</d=
iv><div>-rwxr-xr-x 1 ross ross 49807224 Jul 29 12:25 /data/poky-tmp/master/=
build/<wbr>work/corei7-64-poky-linux/<wbr>llvm/5.0-r0/build/NATIVE/bin/<wbr=
>llvm-tblgen</div></div><div><br></div><div><div>$ /data/poky-tmp/master/bu=
ild/<wbr>work/corei7-64-poky-linux/<wbr>llvm/5.0-r0/build/NATIVE/bin/<wbr>l=
lvm-tblgen</div><div>-bash: /data/poky-tmp/master/build/<wbr>work/corei7-64=
-poky-linux/<wbr>llvm/5.0-r0/build/NATIVE/bin/<wbr>llvm-tblgen: No such fil=
e or directory</div></div><div><br></div><div>Might be related to having un=
inative enabled?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><=
br></div><div>Ross</div><div><br></div></font></span></div><div class=3D"HO=
EnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On 29 July 2017 at 09:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Based on recipe from meta-oe a=
nd clang recipe from meta-clang<br>
Needed by mesa<br>
<br>
Fixes<br>
[YOCTO #11529]<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
<span>=C2=A0...LibraryInfo-Undefine-libc-<wbr>functions-if-th.patch |=C2=A0=
 93 ++++++++++++<br>
=C2=A0.../0002-llvm-allow-env-overr<wbr>ide-of-exe-path.patch |=C2=A0 39 ++=
+++<br>
=C2=A0meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">ll<wbr>vm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 166 +++++++++++++++++++++<br>
</span>=C2=A03 files changed, 298 insertions(+)<br>
<span>=C2=A0create mode 100644 meta/recipes-devtools/llvm/llv<wbr>m/0001-ll=
vm-TargetLibraryInfo-<wbr>Undefine-libc-functions-if-th.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/llvm/llv<wbr>m/0002-llvm-all=
ow-env-override<wbr>-of-exe-path.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/llvm/<a href=3D"http://llvm_=
git.bb" rel=3D"noreferrer" target=3D"_blank">llv<wbr>m_git.bb</a><br>
<br>
</span>diff --git a/meta/recipes-devtools/llvm/l<wbr>lvm/0001-llvm-TargetLi=
braryInf<wbr>o-Undefine-libc-functions-if-<wbr>th.patch b/meta/recipes-devt=
ools/llvm/l<wbr>lvm/0001-llvm-TargetLibraryInf<wbr>o-Undefine-libc-function=
s-if-<wbr>th.patch<br>
new file mode 100644<br>
index 0000000000..e251799259<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/llvm/l<wbr>lvm/0001-llvm-TargetLibraryInf<wbr>o=
-Undefine-libc-functions-if-<wbr>th.patch<br>
@@ -0,0 +1,93 @@<br>
+From 28293e48cf1a52004c6a78de448718<wbr>441f9e05f9 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Sat, 21 May 2016 00:33:20 +0000<br>
+Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions if t=
hey<br>
+ are macros<br>
+<br>
+musl defines some functions as macros and not inline functions<br>
+if this is the case then make sure to undefine them<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+Upstream-Status: Pending<br>
+<br>
+ include/llvm/Analysis/TargetLi<wbr>braryInfo.def | 21 +++++++++++++++++++=
++<br>
+ 1 file changed, 21 insertions(+)<br>
+<br>
+diff --git a/include/llvm/Analysis/Target<wbr>LibraryInfo.def b/include/ll=
vm/Analysis/Target<wbr>LibraryInfo.def<br>
+index 9cbe917c146..aff8419cf54 100644<br>
+--- a/include/llvm/Analysis/Target<wbr>LibraryInfo.def<br>
++++ b/include/llvm/Analysis/Target<wbr>LibraryInfo.def<br>
+@@ -656,6 +656,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;fm<wbr>odl&quot;)<br>
+ TLI_DEFINE_ENUM_INTERNAL(fopen<wbr>)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;fo<wbr>pen&quot;)<br>
+ /// FILE *fopen64(const char *filename, const char *opentype)<br>
++#ifdef fopen64<br>
++#undef fopen64<br>
++#endif<br>
+ TLI_DEFINE_ENUM_INTERNAL(fopen<wbr>64)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;fo<wbr>pen64&quot;)<br>
+ /// int fprintf(FILE *stream, const char *format, ...);<br>
+@@ -691,6 +694,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;fs<wbr>eek&quot;)<br>
+ /// int fseeko(FILE *stream, off_t offset, int whence);<br>
+ TLI_DEFINE_ENUM_INTERNAL(fseek<wbr>o)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;fs<wbr>eeko&quot;)<br>
++#ifdef fseeko64<br>
++#undef fseeko64<br>
++#endif<br>
+ /// int fseeko64(FILE *stream, off64_t offset, int whence)<br>
+ TLI_DEFINE_ENUM_INTERNAL(fseek<wbr>o64)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;fs<wbr>eeko64&quot;)<br>
+@@ -701,6 +707,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;fs<wbr>etpos&quot;)<b=
r>
+ TLI_DEFINE_ENUM_INTERNAL(fstat<wbr>)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;fs<wbr>tat&quot;)<br>
+ /// int fstat64(int filedes, struct stat64 *buf)<br>
++#ifdef fstat64<br>
++#undef fstat64<br>
++#endif<br>
+ TLI_DEFINE_ENUM_INTERNAL(fstat<wbr>64)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;fs<wbr>tat64&quot;)<br>
+ /// int fstatvfs(int fildes, struct statvfs *buf);<br>
+@@ -716,6 +725,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;ft<wbr>ell&quot;)<br>
+ TLI_DEFINE_ENUM_INTERNAL(ftell<wbr>o)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;ft<wbr>ello&quot;)<br>
+ /// off64_t ftello64(FILE *stream)<br>
++#ifdef ftello64<br>
++#undef ftello64<br>
++#endif<br>
+ TLI_DEFINE_ENUM_INTERNAL(ftell<wbr>o64)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;ft<wbr>ello64&quot;)<br>
+ /// int ftrylockfile(FILE *file);<br>
+@@ -836,6 +848,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;lo<wbr>gl&quot;)<br>
+ TLI_DEFINE_ENUM_INTERNAL(lstat<wbr>)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;ls<wbr>tat&quot;)<br>
+ /// int lstat64(const char *path, struct stat64 *buf);<br>
++#ifdef lstat64<br>
++#undef lstat64<br>
++#endif<br>
+ TLI_DEFINE_ENUM_INTERNAL(lstat<wbr>64)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;ls<wbr>tat64&quot;)<br>
+ /// void *malloc(size_t size);<br>
+@@ -1055,6 +1070,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;ss<wbr>canf&quot;)<=
br>
+ TLI_DEFINE_ENUM_INTERNAL(stat)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;st<wbr>at&quot;)<br>
+ /// int stat64(const char *path, struct stat64 *buf);<br>
++#ifdef stat64<br>
++#undef stat64<br>
++#endif<br>
+ TLI_DEFINE_ENUM_INTERNAL(stat6<wbr>4)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;st<wbr>at64&quot;)<br>
+ /// int statvfs(const char *path, struct statvfs *buf);<br>
+@@ -1184,6 +1202,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;ti<wbr>mes&quot;)<b=
r>
+ TLI_DEFINE_ENUM_INTERNAL(tmpfi<wbr>le)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;tm<wbr>pfile&quot;)<br>
+ /// FILE *tmpfile64(void)<br>
++#ifdef tmpfile64<br>
++#undef tmpfile64<br>
++#endif<br>
+ TLI_DEFINE_ENUM_INTERNAL(tmpfi<wbr>le64)<br>
+ TLI_DEFINE_STRING_INTERNAL(&quot;tm<wbr>pfile64&quot;)<br>
+ /// int toascii(int c);<br>
+--<br>
+2.13.1<br>
+<br>
diff --git a/meta/recipes-devtools/llvm/l<wbr>lvm/0002-llvm-allow-env-overr=
i<wbr>de-of-exe-path.patch b/meta/recipes-devtools/llvm/l<wbr>lvm/0002-llvm=
-allow-env-overri<wbr>de-of-exe-path.patch<br>
new file mode 100644<br>
index 0000000000..832bd729ef<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/llvm/l<wbr>lvm/0002-llvm-allow-env-overri<wbr>d=
e-of-exe-path.patch<br>
@@ -0,0 +1,39 @@<br>
+From d776487bac17650704614248d19d1e<wbr>6b35775001 Mon Sep 17 00:00:00 200=
1<br>
+From: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" target=3D"_blank=
">mkelly@xevo.com</a>&gt;<br>
+Date: Fri, 19 May 2017 00:22:57 -0700<br>
+Subject: [PATCH 2/2] llvm: allow env override of exe path<br>
+<br>
+When using a native llvm-config from inside a sysroot, we need llvm-config=
 to<br>
+return the libraries, include directories, etc. from inside the sysroot ra=
ther<br>
+than from the native sysroot. Thus provide an env override for calling<br>
+llvm-config from a target sysroot.<br>
+<br>
+Signed-off-by: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" target=
=3D"_blank">mkelly@xevo.com</a>&gt;<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+Upstream-Status: Pending<br>
+<br>
+ tools/llvm-config/llvm-config.<wbr>cpp | 7 +++++++<br>
+ 1 file changed, 7 insertions(+)<br>
+<br>
+diff --git a/tools/llvm-config/llvm-confi<wbr>g.cpp b/tools/llvm-config/ll=
vm-confi<wbr>g.cpp<br>
+index 08b096afb05..d8d7742744e 100644<br>
+--- a/tools/llvm-config/llvm-confi<wbr>g.cpp<br>
++++ b/tools/llvm-config/llvm-confi<wbr>g.cpp<br>
+@@ -225,6 +225,13 @@ Typical components:\n\<br>
+<br>
+ /// \brief Compute the path to the main executable.<br>
+ std::string GetExecutablePath(const char *Argv0) {<br>
++=C2=A0 // Hack for Yocto: we need to override the root path when we are u=
sing<br>
++=C2=A0 // llvm-config from within a target sysroot.<br>
++=C2=A0 const char *Sysroot =3D std::getenv(&quot;YOCTO_ALTERNATE_E<wbr>XE=
_PATH&quot;);<br>
++=C2=A0 if (Sysroot !=3D nullptr) {<br>
++=C2=A0 =C2=A0 return Sysroot;<br>
++=C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0// This just needs to be some symbol in the binary; C++ doesn=
&#39;t<br>
+=C2=A0 =C2=A0// allow taking the address of ::main however.<br>
+=C2=A0 =C2=A0void *P =3D (void *)(intptr_t)GetExecutablePath;<br>
+--<br>
+2.13.1<br>
+<br>
diff --git a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">l<wbr>lvm_git.bb</a> b/meta/recipes-devto=
ols/llvm/<a href=3D"http://llvm_git.bb" rel=3D"noreferrer" target=3D"_blank=
">l<wbr>lvm_git.bb</a><br>
new file mode 100644<br>
index 0000000000..7b51d2153f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">l<wbr>lvm_git.bb</a><br>
@@ -0,0 +1,166 @@<br>
+# Copyright (C) 2017 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+DESCRIPTION =3D &quot;The LLVM Compiler Infrastructure&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://llvm.org" rel=3D"noreferrer" target=
=3D"_blank">http://llvm.org</a>&quot;<br>
+LICENSE =3D &quot;NCSA&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.TXT;md5=3De825e0<wbr>17edc35cfd5=
8e26116e5251771&quot;<br>
+<br>
+DEPENDS =3D &quot;libffi libxml2-native zlib ninja-native&quot;<br>
+<br>
+RDEPENDS_${PN}_append_class-t<wbr>arget =3D &quot; ncurses-terminfo&quot;<=
br>
+<br>
+inherit perlnative pythonnative cmake pkgconfig<br>
+<br>
+PROVIDES +=3D &quot;llvm${PV}&quot;<br>
+<br>
+LLVM_RELEASE =3D &quot;${PV}&quot;<br>
+LLVM_DIR =3D &quot;llvm${LLVM_RELEASE}&quot;<br>
+<br>
+SRCREV =3D &quot;9a5c333388cbb54a0ce3a67c4f539<wbr>f5e590a089b&quot;<br>
+PV =3D &quot;5.0&quot;<br>
+PATCH_VERSION =3D &quot;0&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/llvm-mirror/llvm.git;=
branch=3Drelease_50;protocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/llvm-mirror/<wbr>llvm.git;branch=3Drelease_50;pro<wbr>tocol=3Dhtt=
p</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-llvm-TargetLibrar<wbr=
>yInfo-Undefine-libc-functions-<wbr>if-th.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-llvm-allow-env-ov<wbr=
>erride-of-exe-path.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+LLVM_INSTALL_DIR =3D &quot;${WORKDIR}/llvm-install&quot;<br>
+def get_llvm_arch(bb, d, arch_var):<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 a =3D d.getVar(arch_var, True)<br>
+=C2=A0 =C2=A0 if=C2=A0 =C2=A0re.match(&#39;(i.86|athlon|x86.<wbr>64)$&#39;=
, a):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;X86&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;arm$&#39;, a):=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39=
;ARM&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;armeb$&#39;, a):=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;ARM=
&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;aarch64$&#39;, a):=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;AArch64=
&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;aarch64_be$&#39;, a):=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;AArch64&#39;<b=
r>
+=C2=A0 =C2=A0 elif re.match(&#39;mips(isa|)(32|64|)(r<wbr>6|)(el|)$&#39;, =
a): return &#39;Mips&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;p(pc|owerpc)(|64)&#39;, a):=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;PowerPC&#39;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;cannot map &#39;%s&#39; to a su=
pported llvm architecture&quot; % a)<br>
+=C2=A0 =C2=A0 return &quot;&quot;<br>
+<br>
+def get_llvm_target_arch(bb, d):<br>
+=C2=A0 =C2=A0 return get_llvm_arch(bb, d, &#39;TARGET_ARCH&#39;)<br>
+#<br>
+# Default to build all OE-Core supported target arches (user overridable).=
<br>
+#<br>
+LLVM_TARGETS ?=3D &quot;${@get_llvm_target_arch(bb, d)}&quot;<br>
+LLVM_TARGETS_prepend_x86 =3D &quot;AMDGPU;&quot;<br>
+LLVM_TARGETS_prepend_x86-64 =3D &quot;AMDGPU;&quot;<br>
+<br>
+EXTRA_OECMAKE +=3D &quot;-DLLVM_ENABLE_ASSERTIONS=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_ENAB=
LE_EXPENSIVE_CHECKS<wbr>=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_ENAB=
LE_PIC=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_BIND=
INGS_LIST=3D&#39;&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_LINK=
_LLVM_DYLIB=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_ENAB=
LE_FFI=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFFI_INCLU=
DE_DIR=3D$(pkg-config --variable=3Dincludedir libffi) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_OPTI=
MIZED_TABLEGEN=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_TARG=
ETS_TO_BUILD=3D&quot;${LLV<wbr>M_TARGETS}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_CRO=
SSCOMPILING:BOOL=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -G Ninja \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+EXTRA_OECMAKE_remove_class-na<wbr>tive =3D &quot;-DCMAKE_CROSSCOMPILING:BO=
OL=3DO<wbr>N&quot;<br>
+<br>
+do_configure_prepend() {<br>
+# Fix paths in llvm-config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s|sys::path::parent_path(Curr<wbr>=
entPath))\.str()|sys::path::<wbr>parent_path(sys::path::parent_<wbr>path(Cu=
rrentPath))).str()|g&quot; ${S}/tools/llvm-config/llvm-co<wbr>nfig.cpp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -ri &quot;s#/(bin|include|lib)(/?\&quot;)#/=
\<wbr>1/${LLVM_DIR}\2#g&quot; ${S}/tools/llvm-config/llvm-co<wbr>nfig.cpp<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -ri &quot;s#lib/${LLVM_DIR}#${baselib}/<wbr=
>${LLVM_DIR}#g&quot; ${S}/tools/llvm-config/llvm-co<wbr>nfig.cpp<br>
+}<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NINJA_STATUS=3D&quot;[%p] &quot; ninja -v ${PAR=
ALLEL_MAKE}<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NINJA_STATUS=3D&quot;[%p] &quot; DESTDIR=3D${LL=
VM_INSTALL_DIR} ninja -v install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0755 ${B}/NATIVE/bin/llvm-config =
${D}${libdir}/${LLVM_DIR}/llvm<wbr>-config-host<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}/${LLVM_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bind=
ir}/${LLVM_DIR}/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${includedir}/${LLVM_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${LLVM_INSTALL_DIR}${includedi<wbr>r}/* $=
{D}${includedir}/${LLVM_DIR}/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/${LLVM_DIR}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# The LLVM sources have &quot;/lib&quot; embedd=
ed and so we cannot completely rely on the ${libdir} variable<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${LLVM_INSTALL_DIR}${libdir}/ ]; then<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${LLVM_INSTAL=
L_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -d ${LLVM_INSTALL_DIR}${prefix}/l<wbr>ib=
 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${LLVM_INSTAL=
L_DIR}${prefix}/l<wbr>ib/* ${D}${libdir}/${LLVM_DIR}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -d ${LLVM_INSTALL_DIR}${prefix}/l<wbr>ib=
64 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${LLVM_INSTAL=
L_DIR}${prefix}/l<wbr>ib64/* ${D}${libdir}/${LLVM_DIR}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove unnecessary cmake files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/${LLVM_DIR}/cmak<wbr>e<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${LLVM_DIR}/libLLVM-${PV}${SOL<wbr>IBSDEV=
} ${D}${libdir}/libLLVM-${PV}${S<wbr>OLIBSDEV}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# We&#39;ll have to delete the libLLVM.so due t=
o multiple reasons...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/${LLVM_DIR}/libL<wbr>LVM.s=
o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/${LLVM_DIR}/libL<wbr>TO.so=
<br>
+}<br>
+<br>
+PACKAGES +=3D &quot;${PN}-bugpointpasses ${PN}-llvmhello&quot;<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${PN}-staticdev =3D &quot;1&quot;<br>
+FILES_${PN} =3D &quot;&quot;<br>
+FILES_${PN}-staticdev =3D &quot;&quot;<br>
+FILES_${PN}-dbg =3D &quot; \<br>
+=C2=A0 =C2=A0 ${bindir}/${LLVM_DIR}/.debug \<br>
+=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/.debug/B<wbr>ugpointPasses.so \<br>
+=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/.debug/L<wbr>LVMHello.so \<br>
+=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/.debug/l<wbr>ibLTO.so* \<br>
+=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/.debug/l<wbr>lvm-config-host \<br>
+=C2=A0 =C2=A0 /usr/src/debug \<br>
+&quot;<br>
+<br>
+FILES_${PN}-dev =3D &quot; \<br>
+=C2=A0 =C2=A0 ${bindir}/${LLVM_DIR} \<br>
+=C2=A0 =C2=A0 ${includedir}/${LLVM_DIR} \<br>
+=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/llvm-con<wbr>fig-host \<br>
+&quot;<br>
+<br>
+RRECOMMENDS_${PN}-dev +=3D &quot;${PN}-bugpointpasses ${PN}-llvmhello&quot=
;<br>
+<br>
+FILES_${PN}-bugpointpasses =3D &quot;\<br>
+=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/Bugpoint<wbr>Passes.so \<br>
+&quot;<br>
+FILES_${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/libLTO.s<wbr>o.* \<br>
+&quot;<br>
+<br>
+FILES_${PN}-llvmhello =3D &quot;\<br>
+=C2=A0 =C2=A0 ${libdir}/${LLVM_DIR}/LLVMHell<wbr>o.so \<br>
+&quot;<br>
+<br>
+PACKAGES_DYNAMIC =3D &quot;^libllvm${LLVM_RELEASE}-.*$&quot;<br>
+NOAUTOPACKAGEDEBUG =3D &quot;1&quot;<br>
+<br>
+INSANE_SKIP_${MLPREFIX}libllv<wbr>m${LLVM_RELEASE}-llvm-${LLVM_<wbr>RELEAS=
E}.${PATCH_VERSION} +=3D &quot;dev-so&quot;<br>
+INSANE_SKIP_${MLPREFIX}libllv<wbr>m${LLVM_RELEASE}-llvm-${LLVM_<wbr>RELEAS=
E} +=3D &quot;dev-so&quot;<br>
+INSANE_SKIP_${MLPREFIX}libllv<wbr>m${LLVM_RELEASE}-llvm +=3D &quot;dev-so&=
quot;<br>
+<br>
+python llvm_populate_packages() {<br>
+=C2=A0 =C2=A0 libdir =3D bb.data.expand(&#39;${libdir}&#39;, d)<br>
+=C2=A0 =C2=A0 libllvm_libdir =3D bb.data.expand(&#39;${libdir}/${LL<wbr>VM=
_DIR}&#39;, d)<br>
+=C2=A0 =C2=A0 split_dbg_packages =3D do_split_packages(d, libllvm_libdir+&=
#39;/.debug&#39;, &#39;^lib(.*)\.so$&#39;, &#39;libllvm${LLVM_RELEASE}-%s-d=
bg<wbr>&#39;, &#39;Split debug package for %s&#39;, allow_dirs=3DTrue)<br>
+=C2=A0 =C2=A0 split_packages =3D do_split_packages(d, libdir, &#39;^lib(.*=
)\.so$&#39;, &#39;libllvm${LLVM_RELEASE}-%s&#39;, &#39;Split package for %s=
&#39;, allow_dirs=3DTrue, allow_links=3DTrue, recursive=3DTrue)<br>
+=C2=A0 =C2=A0 split_staticdev_packages =3D do_split_packages(d, libllvm_li=
bdir, &#39;^lib(.*)\.a$&#39;, &#39;libllvm${LLVM_RELEASE}-%s-sta<wbr>ticdev=
&#39;, &#39;Split staticdev package for %s&#39;, allow_dirs=3DTrue)<br>
+=C2=A0 =C2=A0 if split_packages:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;, True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; + pn, &#39; &#=
39;+&#39; &#39;.join(split_packages))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; + pn + &#39;-d=
bg&#39;, &#39; &#39;+&#39; &#39;.join(split_dbg_packages))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; + pn + &#39;-s=
taticdev&#39;, &#39; &#39;+&#39; &#39;.join(split_staticdev_package<wbr>s))=
<br>
+}<br>
+<br>
+PACKAGESPLITFUNCS_prepend =3D &quot;llvm_populate_packages &quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<div class=3D"m_-8482046299906792338HOEnZb"><div class=3D"m_-84820462999067=
92338h5">--<br>
2.13.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a11441b5ccd68b80555737554--
