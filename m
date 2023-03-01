Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24254C88C8D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.24049.1677681915776912476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ErfBU3iI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101869da27515-b4d712da-feb8-4949-9622-59cfa0d71537-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rweKSOYYVkd9A4zyK0DDx5Z+tyFQh5b38claQuCg/t8=;
	b=ErfBU3iIajpTeXFhP1LMSOlv70rINfI8alTDGlPi6DFhfc+SdKlc+RBq/Cgdexq/
	Q4N8ZlDsrSPAMbASI6iKFbibkZmHsOOLAJA0ipwCnfAbhyeYvlvofNvWzffVAXNs+Ib
	t1VC391zqRBBHZcqdcv3ZJNZTZsz2Di6rlNoA3xY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rweKSOYYVkd9A4zyK0DDx5Z+tyFQh5b38claQuCg/t8=;
	b=SZ9YVPq6xikQInWJoNzUT6jT60N+FZqzhXgeqsmQVARA57m3DdWfa/MjxOPA4EZQ
	3W7xvK//+q6AUrKa5tyN1g4lN3vIerRkFHq6OhR4elygaaCxTF75ZtzBGPozt7xrzNT
	i/1N+cqR2osVKyBuwuL9LDypEgZ3PRDbU/g6OPtY=
Content-Type: multipart/mixed; boundary="===============4206932133618719893=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.3.4 FAILED
Message-ID: <010101869da27515-b4d712da-feb8-4949-9622-59cfa0d71537-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177930

--===============4206932133618719893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.3.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.3.3-2.3.4.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4206932133618719893==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.3.3-2.3.4.patch"

RnJvbSBhYjMwZDkxNTg3NzU1YmM3YzNiNWExZDNiNjcyOTQ0OGIxNWNhZjY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxNDoxMzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuMy4zIC0+IDIuMy40CgotLS0KIC4uLi9lbmNoYW50L3tlbmNoYW50
Ml8yLjMuMy5iYiA9PiBlbmNoYW50Ml8yLjMuNC5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuMy4zLmJiID0+IGVuY2hhbnQyXzIuMy40
LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5j
aGFudDJfMi4zLjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIu
My40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi4zLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2VuY2hhbnQvZW5jaGFudDJfMi4zLjQuYmIKaW5kZXggYzg5MmY1NzBjNC4uZmUyOGQzMjNj
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjMu
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuMy40LmJi
CkBAIC0xMiw3ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAiCiBpbmhlcml0IGF1dG90b29s
cyBwa2djb25maWcgZ2l0aHViLXJlbGVhc2VzCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9V
Ukl9L2Rvd25sb2FkL3Yke1BWfS9lbmNoYW50LSR7UFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIzZGExMjEwM2YxMWNmNDljM2NmMmZkMmNlMzAxNzU3NWM1MzIxYTQ4OWU1YjliZmE4
MWRkOTFlYzQxM2YzODkxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFmN2UyNjc0NGRiMWM5YTBm
ZWE2MWQyMTY5ZjRlNWMxY2U0MzVjZjhjMjczMWMzN2UzZTQwNTQxMTllOTk0YTAiCiAKIEdJVEhV
Ql9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vQWJpV29yZC9lbmNoYW50L3JlbGVhc2Vz
IgogCi0tIAoyLjM5LjIKCg==

--===============4206932133618719893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1697 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2ff050bc3622bb86eb4814977ce62a8fc2272253"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ff050bc3622bb86eb4814977ce62a8fc2272253"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 57 Mirrors 0 Missed 7 Current 196 (89% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 252 of 260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 855 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.3.4-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_unpack)
NOTE: recipe enchant2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe enchant2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 988 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 989 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_patch)
NOTE: recipe enchant2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.3.4-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1005 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1006 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_populate_lic)
NOTE: recipe enchant2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.4-r0: task do_populate_lic: Started
NOTE: recipe enchant2-2.3.4-r0: task do_populate_lic: Succeeded
NOTE: recipe enchant2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1007 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_configure)
NOTE: recipe enchant2-2.3.4-r0: task do_configure: Started
NOTE: recipe enchant2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1008 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_compile)
NOTE: recipe enchant2-2.3.4-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56 pkgdatadir=/usr/share/enchant-2
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build'
| Making all in lib
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build/lib'
| { echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
|   echo '#if HAVE_WINSOCK2_H'; \
|   echo '# include <winsock2.h> /* avoid mingw pollution on DATADIR */'; \
|   echo '#endif'; \
|   echo '#define PREFIX "/usr"'; \
|   echo '#define EXEC_PREFIX "/usr"'; \
|   echo '#define BINDIR "/usr/bin"'; \
|   echo '#define SBINDIR "/usr/sbin"'; \
|   echo '#define LIBEXECDIR "/usr/libexec"'; \
|   echo '#define DATAROOTDIR "/usr/share"'; \
|   echo '#define DATADIR "/usr/share"'; \
|   echo '#define SYSCONFDIR "/etc"'; \
|   echo '#define SHAREDSTATEDIR "/com"'; \
|   echo '#define LOCALSTATEDIR "/var"'; \
|   echo '#define RUNSTATEDIR "/var/run"'; \
|   echo '#define INCLUDEDIR "/usr/include"'; \
|   echo '#define OLDINCLUDEDIR "/usr/include"'; \
|   echo '#define DOCDIR "/usr/share/doc/enchant"'; \
|   echo '#define INFODIR "/usr/share/info"'; \
|   echo '#define HTMLDIR "/usr/share/doc/enchant"'; \
|   echo '#define DVIDIR "/usr/share/doc/enchant"'; \
|   echo '#define PDFDIR "/usr/share/doc/enchant"'; \
|   echo '#define PSDIR "/usr/share/doc/enchant"'; \
|   echo '#define LIBDIR "/usr/lib"'; \
|   echo '#define LISPDIR "/usr/share/emacs/site-lisp"'; \
|   echo '#define LOCALEDIR "/usr/share/locale"'; \
|   echo '#define MANDIR "/usr/share/man"'; \
|   echo '#define MANEXT ""'; \
|   echo '#define PKGDATADIR "/usr/share/enchant-2"'; \
|   echo '#define PKGINCLUDEDIR "/usr/include/enchant"'; \
|   echo '#define PKGLIBDIR "/usr/lib/enchant"'; \
|   echo '#define PKGLIBEXECDIR "/usr/libexec/enchant"'; \
| } | sed '/""/d' > configmake.h-t
| sed -e 1h -e '1s,.*,/* DO NOT EDIT! GENERATED AUTOMATICALLY! */,' -e 1G \
|       -e 's|@''GUARD_PREFIX''@|GL|g' \
|       -e 's|@''INCLUDE_NEXT''@|include_next|g' \
|       -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
|       -e 's|@''PRAGMA_COLUMNS''@||g' \
|       -e 's|@''NEXT_LIMITS_H''@|<limits.h>|g' \
|       ../../enchant-2.3.4/lib/limits.in.h > limits.h-t
| sed -e 1h -e '1s,.*,/* DO NOT EDIT! GENERATED AUTOMATICALLY! */,' -e 1G \
|       -e 's|@''GUARD_PREFIX''@|GL|g' \
|       -e 's|@''INCLUDE_NEXT''@|include_next|g' \
|       -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
|       -e 's|@''PRAGMA_COLUMNS''@||g' \
|       -e 's|@''NEXT_STDLIB_H''@|<stdlib.h>|g' \
|       -e 's/@''GNULIB__EXIT''@/0/g' \
|       -e 's/@''GNULIB_ALIGNED_ALLOC''@/0/g' \
|       -e 's/@''GNULIB_ATOLL''@/0/g' \
|       -e 's/@''GNULIB_CALLOC_GNU''@/0/g' \
|       -e 's/@''GNULIB_CALLOC_POSIX''@/0/g' \
|       -e 's/@''GNULIB_CANONICALIZE_FILE_NAME''@/0/g' \
|       -e 's/@''GNULIB_FREE_POSIX''@/0/g' \
|       -e 's/@''GNULIB_GETLOADAVG''@/0/g' \
|       -e 's/@''GNULIB_GETSUBOPT''@/0/g' \
|       -e 's/@''GNULIB_GRANTPT''@/0/g' \
|       -e 's/@''GNULIB_MALLOC_GNU''@/0/g' \
|       -e 's/@''GNULIB_MALLOC_POSIX''@/0/g' \
|       -e 's/@''GNULIB_MBTOWC''@/0/g' \
|       -e 's/@''GNULIB_MKDTEMP''@/0/g' \
|       -e 's/@''GNULIB_MKOSTEMP''@/0/g' \
|       -e 's/@''GNULIB_MKOSTEMPS''@/0/g' \
|       -e 's/@''GNULIB_MKSTEMP''@/0/g' \
|       -e 's/@''GNULIB_MKSTEMPS''@/0/g' \
|       -e 's/@''GNULIB_POSIX_MEMALIGN''@/0/g' \
|       -e 's/@''GNULIB_POSIX_OPENPT''@/0/g' \
|       -e 's/@''GNULIB_PTSNAME''@/0/g' \
|       -e 's/@''GNULIB_PTSNAME_R''@/0/g' \
|       -e 's/@''GNULIB_PUTENV''@/0/g' \
|       -e 's/@''GNULIB_QSORT_R''@/0/g' \
|       -e 's/@''GNULIB_RANDOM''@/0/g' \
|       -e 's/@''GNULIB_RANDOM_R''@/0/g' \
|       -e 's/@''GNULIB_REALLOC_GNU''@/0/g' \
|       -e 's/@''GNULIB_REALLOC_POSIX''@/0/g' \
|       -e 's/@''GNULIB_REALLOCARRAY''@/0/g' \
|       -e 's/@''GNULIB_REALPATH''@/0/g' \
|       -e 's/@''GNULIB_RPMATCH''@/0/g' \
|       -e 's/@''GNULIB_SECURE_GETENV''@/0/g' \
|       -e 's/@''GNULIB_SETENV''@/0/g' \
|       -e 's/@''GNULIB_STRTOD''@/0/g' \
|       -e 's/@''GNULIB_STRTOL''@/0/g' \
|       -e 's/@''GNULIB_STRTOLD''@/0/g' \
|       -e 's/@''GNULIB_STRTOLL''@/0/g' \
|       -e 's/@''GNULIB_STRTOUL''@/0/g' \
|       -e 's/@''GNULIB_STRTOULL''@/0/g' \
|       -e 's/@''GNULIB_SYSTEM_POSIX''@/0/g' \
|       -e 's/@''GNULIB_UNLOCKPT''@/0/g' \
|       -e 's/@''GNULIB_UNSETENV''@/0/g' \
|       -e 's/@''GNULIB_WCTOMB''@/0/g' \
|       -e 's/@''GNULIB_MDA_ECVT''@/1/g' \
|       -e 's/@''GNULIB_MDA_FCVT''@/1/g' \
|       -e 's/@''GNULIB_MDA_GCVT''@/1/g' \
|       -e 's/@''GNULIB_MDA_MKTEMP''@/1/g' \
|       -e 's/@''GNULIB_MDA_PUTENV''@/1/g' \
|       < ../../enchant-2.3.4/lib/stdlib.in.h | \
|   sed -e 's|@''HAVE__EXIT''@|1|g' \
|       -e 's|@''HAVE_ALIGNED_ALLOC''@|1|g' \
|       -e 's|@''HAVE_ATOLL''@|1|g' \
|       -e 's|@''HAVE_CANONICALIZE_FILE_NAME''@|1|g' \
|       -e 's|@''HAVE_DECL_ECVT''@|1|g' \
|       -e 's|@''HAVE_DECL_FCVT''@|1|g' \
|       -e 's|@''HAVE_DECL_GCVT''@|1|g' \
|       -e 's|@''HAVE_DECL_GETLOADAVG''@|1|g' \
|       -e 's|@''HAVE_GETSUBOPT''@|1|g' \
|       -e 's|@''HAVE_GRANTPT''@|1|g' \
|       -e 's|@''HAVE_INITSTATE''@|1|g' \
|       -e 's|@''HAVE_DECL_INITSTATE''@|1|g' \
|       -e 's|@''HAVE_MBTOWC''@|1|g' \
|       -e 's|@''HAVE_MKDTEMP''@|1|g' \
|       -e 's|@''HAVE_MKOSTEMP''@|1|g' \
|       -e 's|@''HAVE_MKOSTEMPS''@|1|g' \
|       -e 's|@''HAVE_MKSTEMP''@|1|g' \
|       -e 's|@''HAVE_MKSTEMPS''@|1|g' \
|       -e 's|@''HAVE_POSIX_MEMALIGN''@|1|g' \
|       -e 's|@''HAVE_POSIX_OPENPT''@|1|g' \
|       -e 's|@''HAVE_PTSNAME''@|1|g' \
|       -e 's|@''HAVE_PTSNAME_R''@|1|g' \
|       -e 's|@''HAVE_QSORT_R''@|1|g' \
|       -e 's|@''HAVE_RANDOM''@|1|g' \
|       -e 's|@''HAVE_RANDOM_H''@|1|g' \
|       -e 's|@''HAVE_RANDOM_R''@|1|g' \
|       -e 's|@''HAVE_REALLOCARRAY''@|1|g' \
|       -e 's|@''HAVE_REALPATH''@|1|g' \
|       -e 's|@''HAVE_RPMATCH''@|1|g' \
|       -e 's|@''HAVE_SECURE_GETENV''@|1|g' \
|       -e 's|@''HAVE_DECL_SETENV''@|1|g' \
|       -e 's|@''HAVE_SETSTATE''@|1|g' \
|       -e 's|@''HAVE_DECL_SETSTATE''@|1|g' \
|       -e 's|@''HAVE_STRTOD''@|1|g' \
|       -e 's|@''HAVE_STRTOL''@|1|g' \
|       -e 's|@''HAVE_STRTOLD''@|1|g' \
|       -e 's|@''HAVE_STRTOLL''@|1|g' \
|       -e 's|@''HAVE_STRTOUL''@|1|g' \
|       -e 's|@''HAVE_STRTOULL''@|1|g' \
|       -e 's|@''HAVE_STRUCT_RANDOM_DATA''@|1|g' \
|       -e 's|@''HAVE_SYS_LOADAVG_H''@|0|g' \
|       -e 's|@''HAVE_UNLOCKPT''@|1|g' \
|       -e 's|@''HAVE_DECL_UNSETENV''@|1|g' \
|       -e 's|@''REPLACE_ALIGNED_ALLOC''@|0|g' \
|       -e 's|@''REPLACE_CALLOC_FOR_CALLOC_GNU''@|0|g' \
|       -e 's|@''REPLACE_CALLOC_FOR_CALLOC_POSIX''@|0|g' \
|       -e 's|@''REPLACE_CANONICALIZE_FILE_NAME''@|0|g' \
|       -e 's|@''REPLACE_FREE''@|0|g' \
|       -e 's|@''REPLACE_INITSTATE''@|0|g' \
|       -e 's|@''REPLACE_MALLOC_FOR_MALLOC_GNU''@|0|g' \
|       -e 's|@''REPLACE_MALLOC_FOR_MALLOC_POSIX''@|0|g' \
|       -e 's|@''REPLACE_MBTOWC''@|0|g' \
|       -e 's|@''REPLACE_MKSTEMP''@|0|g' \
|       -e 's|@''REPLACE_POSIX_MEMALIGN''@|0|g' \
|       -e 's|@''REPLACE_PTSNAME''@|0|g' \
|       -e 's|@''REPLACE_PTSNAME_R''@|0|g' \
|       -e 's|@''REPLACE_PUTENV''@|0|g' \
|       -e 's|@''REPLACE_QSORT_R''@|0|g' \
|       -e 's|@''REPLACE_RANDOM''@|0|g' \
|       -e 's|@''REPLACE_RANDOM_R''@|0|g' \
|       -e 's|@''REPLACE_REALLOC_FOR_REALLOC_GNU''@|0|g' \
|       -e 's|@''REPLACE_REALLOC_FOR_REALLOC_POSIX''@|0|g' \
|       -e 's|@''REPLACE_REALLOCARRAY''@|0|g' \
|       -e 's|@''REPLACE_REALPATH''@|0|g' \
|       -e 's|@''REPLACE_SETENV''@|0|g' \
|       -e 's|@''REPLACE_SETSTATE''@|0|g' \
|       -e 's|@''REPLACE_STRTOD''@|0|g' \
|       -e 's|@''REPLACE_STRTOL''@|0|g' \
|       -e 's|@''REPLACE_STRTOLD''@|0|g' \
|       -e 's|@''REPLACE_STRTOLL''@|0|g' \
|       -e 's|@''REPLACE_STRTOUL''@|0|g' \
|       -e 's|@''REPLACE_STRTOULL''@|0|g' \
|       -e 's|@''REPLACE_UNSETENV''@|0|g' \
|       -e 's|@''REPLACE_WCTOMB''@|0|g' \
|       -e '/definitions of _GL_FUNCDECL_RPL/r ../../enchant-2.3.4/lib/c++defs.h' \
|       -e '/definition of _Noreturn/r ../../enchant-2.3.4/lib/_Noreturn.h' \
|       -e '/definition of _GL_ARG_NONNULL/r ../../enchant-2.3.4/lib/arg-nonnull.h' \
|       -e '/definition of _GL_WARN_ON_USE/r ../../enchant-2.3.4/lib/warn-on-use.h' \
|       > stdlib.h-t
| sed -e 1h -e '1s,.*,/* DO NOT EDIT! GENERATED AUTOMATICALLY! */,' -e 1G \
|       -e 's|@''GUARD_PREFIX''@|GL|g' \
|       -e 's|@''INCLUDE_NEXT''@|include_next|g' \
|       -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
|       -e 's|@''PRAGMA_COLUMNS''@||g' \
|       -e 's|@''NEXT_STRING_H''@|<string.h>|g' \
|       -e 's/@''GNULIB_EXPLICIT_BZERO''@/0/g' \
|       -e 's/@''GNULIB_FFSL''@/0/g' \
|       -e 's/@''GNULIB_FFSLL''@/0/g' \
|       -e 's/@''GNULIB_MBSLEN''@/0/g' \
|       -e 's/@''GNULIB_MBSNLEN''@/0/g' \
|       -e 's/@''GNULIB_MBSCHR''@/0/g' \
|       -e 's/@''GNULIB_MBSRCHR''@/0/g' \
|       -e 's/@''GNULIB_MBSSTR''@/0/g' \
|       -e 's/@''GNULIB_MBSCASECMP''@/0/g' \
|       -e 's/@''GNULIB_MBSNCASECMP''@/0/g' \
|       -e 's/@''GNULIB_MBSPCASECMP''@/0/g' \
|       -e 's/@''GNULIB_MBSCASESTR''@/0/g' \
|       -e 's/@''GNULIB_MBSCSPN''@/0/g' \
|       -e 's/@''GNULIB_MBSPBRK''@/0/g' \
|       -e 's/@''GNULIB_MBSSPN''@/0/g' \
|       -e 's/@''GNULIB_MBSSEP''@/0/g' \
|       -e 's/@''GNULIB_MBSTOK_R''@/0/g' \
|       -e 's/@''GNULIB_MEMCHR''@/0/g' \
|       -e 's/@''GNULIB_MEMMEM''@/0/g' \
|       -e 's/@''GNULIB_MEMPCPY''@/0/g' \
|       -e 's/@''GNULIB_MEMRCHR''@/0/g' \
|       -e 's/@''GNULIB_RAWMEMCHR''@/1/g' \
|       -e 's/@''GNULIB_STPCPY''@/0/g' \
|       -e 's/@''GNULIB_STPNCPY''@/0/g' \
|       -e 's/@''GNULIB_STRCHRNUL''@/1/g' \
|       -e 's/@''GNULIB_STRDUP''@/0/g' \
|       -e 's/@''GNULIB_STRNCAT''@/0/g' \
|       -e 's/@''GNULIB_STRNDUP''@/0/g' \
|       -e 's/@''GNULIB_STRNLEN''@/0/g' \
|       -e 's/@''GNULIB_STRPBRK''@/0/g' \
|       -e 's/@''GNULIB_STRSEP''@/0/g' \
|       -e 's/@''GNULIB_STRSTR''@/0/g' \
|       -e 's/@''GNULIB_STRCASESTR''@/0/g' \
|       -e 's/@''GNULIB_STRTOK_R''@/0/g' \
|       -e 's/@''GNULIB_STRERROR''@/0/g' \
|       -e 's/@''GNULIB_STRERROR_R''@/0/g' \
|       -e 's/@''GNULIB_STRERRORNAME_NP''@/0/g' \
|       -e 's/@''GNULIB_SIGABBREV_NP''@/0/g' \
|       -e 's/@''GNULIB_SIGDESCR_NP''@/0/g' \
|       -e 's/@''GNULIB_STRSIGNAL''@/0/g' \
|       -e 's/@''GNULIB_STRVERSCMP''@/0/g' \
|       -e 's/@''GNULIB_MDA_MEMCCPY''@/1/g' \
|       -e 's/@''GNULIB_MDA_STRDUP''@/1/g' \
|       -e 's/@''GNULIB_FREE_POSIX''@/0/g' \
|       < ../../enchant-2.3.4/lib/string.in.h | \
|   sed -e 's|@''HAVE_EXPLICIT_BZERO''@|1|g' \
|       -e 's|@''HAVE_FFSL''@|1|g' \
|       -e 's|@''HAVE_FFSLL''@|1|g' \
|       -e 's|@''HAVE_MBSLEN''@|0|g' \
|       -e 's|@''HAVE_DECL_MEMMEM''@|1|g' \
|       -e 's|@''HAVE_MEMPCPY''@|1|g' \
|       -e 's|@''HAVE_DECL_MEMRCHR''@|1|g' \
|       -e 's|@''HAVE_RAWMEMCHR''@|1|g' \
|       -e 's|@''HAVE_STPCPY''@|1|g' \
|       -e 's|@''HAVE_STPNCPY''@|1|g' \
|       -e 's|@''HAVE_STRCHRNUL''@|1|g' \
|       -e 's|@''HAVE_DECL_STRDUP''@|1|g' \
|       -e 's|@''HAVE_DECL_STRNDUP''@|1|g' \
|       -e 's|@''HAVE_DECL_STRNLEN''@|1|g' \
|       -e 's|@''HAVE_STRPBRK''@|1|g' \
|       -e 's|@''HAVE_STRSEP''@|1|g' \
|       -e 's|@''HAVE_STRCASESTR''@|1|g' \
|       -e 's|@''HAVE_DECL_STRTOK_R''@|1|g' \
|       -e 's|@''HAVE_DECL_STRERROR_R''@|1|g' \
|       -e 's|@''HAVE_STRERRORNAME_NP''@|1|g' \
|       -e 's|@''HAVE_SIGABBREV_NP''@|1|g' \
|       -e 's|@''HAVE_SIGDESCR_NP''@|1|g' \
|       -e 's|@''HAVE_DECL_STRSIGNAL''@|1|g' \
|       -e 's|@''HAVE_STRVERSCMP''@|1|g' \
|       -e 's|@''REPLACE_FFSLL''@|0|g' \
|       -e 's|@''REPLACE_MEMCHR''@|0|g' \
|       -e 's|@''REPLACE_MEMMEM''@|0|g' \
|       -e 's|@''REPLACE_FREE''@|0|g' \
|       -e 's|@''REPLACE_STPNCPY''@|0|g' \
|       -e 's|@''REPLACE_STRCHRNUL''@|0|g' \
|       -e 's|@''REPLACE_STRDUP''@|0|g' \
|       -e 's|@''REPLACE_STRNCAT''@|0|g' \
|       -e 's|@''REPLACE_STRNDUP''@|0|g' \
|       -e 's|@''REPLACE_STRNLEN''@|0|g' \
|       -e 's|@''REPLACE_STRSTR''@|0|g' \
|       -e 's|@''REPLACE_STRCASESTR''@|0|g' \
|       -e 's|@''REPLACE_STRTOK_R''@|0|g' \
|       -e 's|@''REPLACE_STRERROR''@|0|g' \
|       -e 's|@''REPLACE_STRERROR_R''@|0|g' \
|       -e 's|@''REPLACE_STRERRORNAME_NP''@|0|g' \
|       -e 's|@''REPLACE_STRSIGNAL''@|0|g' \
|       -e 's|@''UNDEFINE_STRTOK_R''@|0|g' \
|       -e '/definitions of _GL_FUNCDECL_RPL/r ../../enchant-2.3.4/lib/c++defs.h' \
|       -e '/definition of _GL_ARG_NONNULL/r ../../enchant-2.3.4/lib/arg-nonnull.h' \
|       -e '/definition of _GL_WARN_ON_USE/r ../../enchant-2.3.4/lib/warn-on-use.h' \
|       > string.h-t
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p 'sys'
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p 'sys'
| sed -e 1h -e '1s,.*,/* DO NOT EDIT! GENERATED AUTOMATICALLY! */,' -e 1G \
|       -e 's|@''GUARD_PREFIX''@|GL|g' \
|       -e 's|@''HAVE_UNISTD_H''@|1|g' \
|       -e 's|@''INCLUDE_NEXT''@|include_next|g' \
|       -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
|       -e 's|@''PRAGMA_COLUMNS''@||g' \
|       -e 's|@''NEXT_UNISTD_H''@|<unistd.h>|g' \
|       -e 's|@''WINDOWS_64_BIT_OFF_T''@|0|g' \
|       -e 's/@''GNULIB_ACCESS''@/0/g' \
|       -e 's/@''GNULIB_CHDIR''@/0/g' \
|       -e 's/@''GNULIB_CHOWN''@/0/g' \
|       -e 's/@''GNULIB_CLOSE''@/0/g' \
|       -e 's/@''GNULIB_COPY_FILE_RANGE''@/0/g' \
|       -e 's/@''GNULIB_DUP''@/0/g' \
|       -e 's/@''GNULIB_DUP2''@/0/g' \
|       -e 's/@''GNULIB_DUP3''@/0/g' \
|       -e 's/@''GNULIB_ENVIRON''@/0/g' \
|       -e 's/@''GNULIB_EUIDACCESS''@/0/g' \
|       -e 's/@''GNULIB_EXECL''@/0/g' \
|       -e 's/@''GNULIB_EXECLE''@/0/g' \
|       -e 's/@''GNULIB_EXECLP''@/0/g' \
|       -e 's/@''GNULIB_EXECV''@/0/g' \
|       -e 's/@''GNULIB_EXECVE''@/0/g' \
|       -e 's/@''GNULIB_EXECVP''@/0/g' \
|       -e 's/@''GNULIB_EXECVPE''@/0/g' \
|       -e 's/@''GNULIB_FACCESSAT''@/0/g' \
|       -e 's/@''GNULIB_FCHDIR''@/0/g' \
|       -e 's/@''GNULIB_FCHOWNAT''@/0/g' \
|       -e 's/@''GNULIB_FDATASYNC''@/0/g' \
|       -e 's/@''GNULIB_FSYNC''@/0/g' \
|       -e 's/@''GNULIB_FTRUNCATE''@/0/g' \
|       -e 's/@''GNULIB_GETCWD''@/0/g' \
|       -e 's/@''GNULIB_GETDOMAINNAME''@/0/g' \
|       -e 's/@''GNULIB_GETDTABLESIZE''@/0/g' \
|       -e 's/@''GNULIB_GETENTROPY''@/0/g' \
|       -e 's/@''GNULIB_GETGROUPS''@/0/g' \
|       -e 's/@''GNULIB_GETHOSTNAME''@/0/g' \
|       -e 's/@''GNULIB_GETLOGIN''@/0/g' \
|       -e 's/@''GNULIB_GETLOGIN_R''@/0/g' \
|       -e 's/@''GNULIB_GETOPT_POSIX''@/0/g' \
|       -e 's/@''GNULIB_GETPAGESIZE''@/0/g' \
|       -e 's/@''GNULIB_GETPASS''@/0/g' \
|       -e 's/@''GNULIB_GETPASS_GNU''@/0/g' \
|       -e 's/@''GNULIB_GETUSERSHELL''@/0/g' \
|       -e 's/@''GNULIB_GROUP_MEMBER''@/0/g' \
|       -e 's/@''GNULIB_ISATTY''@/0/g' \
|       -e 's/@''GNULIB_LCHOWN''@/0/g' \
|       -e 's/@''GNULIB_LINK''@/0/g' \
|       -e 's/@''GNULIB_LINKAT''@/0/g' \
|       -e 's/@''GNULIB_LSEEK''@/0/g' \
|       -e 's/@''GNULIB_PIPE''@/0/g' \
|       -e 's/@''GNULIB_PIPE2''@/0/g' \
|       -e 's/@''GNULIB_PREAD''@/0/g' \
|       -e 's/@''GNULIB_PWRITE''@/0/g' \
|       -e 's/@''GNULIB_READ''@/0/g' \
|       -e 's/@''GNULIB_READLINK''@/0/g' \
|       -e 's/@''GNULIB_READLINKAT''@/0/g' \
|       -e 's/@''GNULIB_RMDIR''@/0/g' \
|       -e 's/@''GNULIB_SETHOSTNAME''@/0/g' \
|       -e 's/@''GNULIB_SLEEP''@/0/g' \
|       -e 's/@''GNULIB_SYMLINK''@/0/g' \
|       -e 's/@''GNULIB_SYMLINKAT''@/0/g' \
|       -e 's/@''GNULIB_TRUNCATE''@/0/g' \
|       -e 's/@''GNULIB_TTYNAME_R''@/0/g' \
|       -e 's/@''GNULIB_UNISTD_H_GETOPT''@/00/g' \
|       -e 's/@''GNULIB_UNISTD_H_NONBLOCKING''@/0/g' \
|       -e 's/@''GNULIB_UNISTD_H_SIGPIPE''@/0/g' \
|       -e 's/@''GNULIB_UNLINK''@/0/g' \
|       -e 's/@''GNULIB_UNLINKAT''@/0/g' \
|       -e 's/@''GNULIB_USLEEP''@/0/g' \
|       -e 's/@''GNULIB_WRITE''@/0/g' \
|       -e 's/@''GNULIB_MDA_ACCESS''@/1/g' \
|       -e 's/@''GNULIB_MDA_CHDIR''@/1/g' \
|       -e 's/@''GNULIB_MDA_CLOSE''@/1/g' \
|       -e 's/@''GNULIB_MDA_DUP''@/1/g' \
|       -e 's/@''GNULIB_MDA_DUP2''@/1/g' \
|       -e 's/@''GNULIB_MDA_EXECL''@/1/g' \
|       -e 's/@''GNULIB_MDA_EXECLE''@/1/g' \
|       -e 's/@''GNULIB_MDA_EXECLP''@/1/g' \
|       -e 's/@''GNULIB_MDA_EXECV''@/1/g' \
|       -e 's/@''GNULIB_MDA_EXECVE''@/1/g' \
|       -e 's/@''GNULIB_MDA_EXECVP''@/1/g' \
|       -e 's/@''GNULIB_MDA_EXECVPE''@/1/g' \
|       -e 's/@''GNULIB_MDA_GETCWD''@/1/g' \
|       -e 's/@''GNULIB_MDA_GETPID''@/1/g' \
|       -e 's/@''GNULIB_MDA_ISATTY''@/1/g' \
|       -e 's/@''GNULIB_MDA_LSEEK''@/1/g' \
|       -e 's/@''GNULIB_MDA_READ''@/1/g' \
|       -e 's/@''GNULIB_MDA_RMDIR''@/1/g' \
|       -e 's/@''GNULIB_MDA_SWAB''@/1/g' \
|       -e 's/@''GNULIB_MDA_UNLINK''@/1/g' \
|       -e 's/@''GNULIB_MDA_WRITE''@/1/g' \
|       < ../../enchant-2.3.4/lib/unistd.in.h | \
|   sed -e 's|@''HAVE_CHOWN''@|1|g' \
|       -e 's|@''HAVE_COPY_FILE_RANGE''@|1|g' \
|       -e 's|@''HAVE_DUP3''@|1|g' \
|       -e 's|@''HAVE_EUIDACCESS''@|1|g' \
|       -e 's|@''HAVE_EXECVPE''@|1|g' \
|       -e 's|@''HAVE_FACCESSAT''@|1|g' \
|       -e 's|@''HAVE_FCHDIR''@|1|g' \
|       -e 's|@''HAVE_FCHOWNAT''@|1|g' \
|       -e 's|@''HAVE_FDATASYNC''@|1|g' \
|       -e 's|@''HAVE_FSYNC''@|1|g' \
|       -e 's|@''HAVE_FTRUNCATE''@|1|g' \
|       -e 's|@''HAVE_GETDTABLESIZE''@|1|g' \
|       -e 's|@''HAVE_GETENTROPY''@|1|g' \
|       -e 's|@''HAVE_GETGROUPS''@|1|g' \
|       -e 's|@''HAVE_GETHOSTNAME''@|1|g' \
|       -e 's|@''HAVE_GETPAGESIZE''@|1|g' \
|       -e 's|@''HAVE_GETPASS''@|1|g' \
|       -e 's|@''HAVE_GROUP_MEMBER''@|1|g' \
|       -e 's|@''HAVE_LCHOWN''@|1|g' \
|       -e 's|@''HAVE_LINK''@|1|g' \
|       -e 's|@''HAVE_LINKAT''@|1|g' \
|       -e 's|@''HAVE_PIPE''@|1|g' \
|       -e 's|@''HAVE_PIPE2''@|1|g' \
|       -e 's|@''HAVE_PREAD''@|1|g' \
|       -e 's|@''HAVE_PWRITE''@|1|g' \
|       -e 's|@''HAVE_READLINK''@|1|g' \
|       -e 's|@''HAVE_READLINKAT''@|1|g' \
|       -e 's|@''HAVE_SETHOSTNAME''@|1|g' \
|       -e 's|@''HAVE_SLEEP''@|1|g' \
|       -e 's|@''HAVE_SYMLINK''@|1|g' \
|       -e 's|@''HAVE_SYMLINKAT''@|1|g' \
|       -e 's|@''HAVE_UNLINKAT''@|1|g' \
|       -e 's|@''HAVE_USLEEP''@|1|g' \
|       -e 's|@''HAVE_DECL_ENVIRON''@|1|g' \
|       -e 's|@''HAVE_DECL_EXECVPE''@|1|g' \
|       -e 's|@''HAVE_DECL_FCHDIR''@|1|g' \
|       -e 's|@''HAVE_DECL_FDATASYNC''@|1|g' \
|       -e 's|@''HAVE_DECL_GETDOMAINNAME''@|1|g' \
|       -e 's|@''HAVE_DECL_GETLOGIN''@|1|g' \
|       -e 's|@''HAVE_DECL_GETLOGIN_R''@|1|g' \
|       -e 's|@''HAVE_DECL_GETPAGESIZE''@|1|g' \
|       -e 's|@''HAVE_DECL_GETUSERSHELL''@|1|g' \
|       -e 's|@''HAVE_DECL_SETHOSTNAME''@|1|g' \
|       -e 's|@''HAVE_DECL_TRUNCATE''@|1|g' \
|       -e 's|@''HAVE_DECL_TTYNAME_R''@|1|g' \
|       -e 's|@''HAVE_OS_H''@|0|g' \
|       -e 's|@''HAVE_SYS_PARAM_H''@|0|g' \
|   | \
|   sed -e 's|@''REPLACE_ACCESS''@|0|g' \
|       -e 's|@''REPLACE_CHOWN''@|0|g' \
|       -e 's|@''REPLACE_CLOSE''@|0|g' \
|       -e 's|@''REPLACE_COPY_FILE_RANGE''@|0|g' \
|       -e 's|@''REPLACE_DUP''@|0|g' \
|       -e 's|@''REPLACE_DUP2''@|0|g' \
|       -e 's|@''REPLACE_EXECL''@|0|g' \
|       -e 's|@''REPLACE_EXECLE''@|0|g' \
|       -e 's|@''REPLACE_EXECLP''@|0|g' \
|       -e 's|@''REPLACE_EXECV''@|0|g' \
|       -e 's|@''REPLACE_EXECVE''@|0|g' \
|       -e 's|@''REPLACE_EXECVP''@|0|g' \
|       -e 's|@''REPLACE_EXECVPE''@|0|g' \
|       -e 's|@''REPLACE_FACCESSAT''@|0|g' \
|       -e 's|@''REPLACE_FCHOWNAT''@|0|g' \
|       -e 's|@''REPLACE_FTRUNCATE''@|0|g' \
|       -e 's|@''REPLACE_GETCWD''@|0|g' \
|       -e 's|@''REPLACE_GETDOMAINNAME''@|0|g' \
|       -e 's|@''REPLACE_GETDTABLESIZE''@|0|g' \
|       -e 's|@''REPLACE_GETLOGIN_R''@|0|g' \
|       -e 's|@''REPLACE_GETGROUPS''@|0|g' \
|       -e 's|@''REPLACE_GETPAGESIZE''@|0|g' \
|       -e 's|@''REPLACE_GETPASS''@|0|g' \
|       -e 's|@''REPLACE_GETPASS_FOR_GETPASS_GNU''@|0|g' \
|       -e 's|@''REPLACE_ISATTY''@|0|g' \
|       -e 's|@''REPLACE_LCHOWN''@|0|g' \
|       -e 's|@''REPLACE_LINK''@|0|g' \
|       -e 's|@''REPLACE_LINKAT''@|0|g' \
|       -e 's|@''REPLACE_LSEEK''@|0|g' \
|       -e 's|@''REPLACE_PREAD''@|0|g' \
|       -e 's|@''REPLACE_PWRITE''@|0|g' \
|       -e 's|@''REPLACE_READ''@|0|g' \
|       -e 's|@''REPLACE_READLINK''@|0|g' \
|       -e 's|@''REPLACE_READLINKAT''@|0|g' \
|       -e 's|@''REPLACE_RMDIR''@|0|g' \
|       -e 's|@''REPLACE_SLEEP''@|0|g' \
|       -e 's|@''REPLACE_SYMLINK''@|0|g' \
|       -e 's|@''REPLACE_SYMLINKAT''@|0|g' \
|       -e 's|@''REPLACE_TRUNCATE''@|0|g' \
|       -e 's|@''REPLACE_TTYNAME_R''@|0|g' \
|       -e 's|@''REPLACE_UNLINK''@|0|g' \
|       -e 's|@''REPLACE_UNLINKAT''@|0|g' \
|       -e 's|@''REPLACE_USLEEP''@|0|g' \
|       -e 's|@''REPLACE_WRITE''@|0|g' \
|       -e 's|@''UNISTD_H_HAVE_SYS_RANDOM_H''@|0|g' \
|       -e 's|@''UNISTD_H_HAVE_WINSOCK2_H''@|0|g' \
|       -e 's|@''UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|0|g' \
|       -e '/definitions of _GL_FUNCDECL_RPL/r ../../enchant-2.3.4/lib/c++defs.h' \
|       -e '/definition of _GL_ARG_NONNULL/r ../../enchant-2.3.4/lib/arg-nonnull.h' \
|       -e '/definition of _GL_WARN_ON_USE/r ../../enchant-2.3.4/lib/warn-on-use.h' \
|       > unistd.h-t
| mv configmake.h-t configmake.h
| mv limits.h-t limits.h
| sed -e 1h -e '1s,.*,/* DO NOT EDIT! GENERATED AUTOMATICALLY! */,' -e 1G \
|       -e 's|@''GUARD_PREFIX''@|GL|g' \
|       -e 's/@''HAVE_SYS_FILE_H''@/1/g' \
|       -e 's|@''INCLUDE_NEXT''@|include_next|g' \
|       -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
|       -e 's|@''PRAGMA_COLUMNS''@||g' \
|       -e 's|@''NEXT_SYS_FILE_H''@|<sys/file.h>|g' \
|       -e 's/@''HAVE_FLOCK''@/1/g' \
|       -e 's/@''GNULIB_FLOCK''@/1/g' \
|       -e '/definition of _GL_WARN_ON_USE/r ../../enchant-2.3.4/lib/warn-on-use.h' \
|       ../../enchant-2.3.4/lib/sys_file.in.h > sys/file.h-t
| sed -e 1h -e '1s,.*,/* DO NOT EDIT! GENERATED AUTOMATICALLY! */,' -e 1G \
|       -e 's|@''GUARD_PREFIX''@|GL|g' \
|       -e 's|@''INCLUDE_NEXT''@|include_next|g' \
|       -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
|       -e 's|@''PRAGMA_COLUMNS''@||g' \
|       -e 's|@''NEXT_SYS_TYPES_H''@|<sys/types.h>|g' \
|       -e 's|@''WINDOWS_64_BIT_OFF_T''@|0|g' \
|       -e 's|@''WINDOWS_STAT_INODES''@|0|g' \
|       ../../enchant-2.3.4/lib/sys_types.in.h > sys/types.h-t
| mv sys/file.h-t sys/file.h
| mv sys/types.h-t sys/types.h
| mv string.h-t string.h
| mv stdlib.h-t stdlib.h
| mv unistd.h-t unistd.h
| make  all-am
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build/lib'
| /bin/bash ../libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I../../enchant-2.3.4/lib -I..  -DIN_LIBRARY -DENABLE_COSTLY_RELOCATABLE  -DINSTALLDIR=\"/usr/lib\"   -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot-native=  -c -o libgnu_la-unistd.lo `test -f 'unistd.c' || echo '../../enchant-2.3.4/lib/'`unistd.c
| libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I../../enchant-2.3.4/lib -I.. -DIN_LIBRARY -DENABLE_COSTLY_RELOCATABLE -DINSTALLDIR=\"/usr/lib\" -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot-native= -c ../../enchant-2.3.4/lib/unistd.c  -fPIC -DPIC -o .libs/libgnu_la-unistd.o
| /bin/bash ../libtool  --tag=CC   --mode=link i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot  -Wno-cast-qual -Wno-conversion -Wno-float-equal -Wno-sign-compare -Wno-undef -Wno-unused-function -Wno-unused-parameter -Wno-float-conversion -Wimplicit-fallthrough -Wno-pedantic -Wno-sign-conversion -Wno-type-limits -Wno-unsuffixed-float-constants -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot-native=   -no-undefined -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -o libgnu.la       libgnu_la-unistd.lo  -laspell
| libtool: link: i686-poky-linux-gcc-ar cr .libs/libgnu.a .libs/libgnu_la-unistd.o
| libtool: link: i686-poky-linux-gcc-ranlib .libs/libgnu.a
| libtool: link: ( cd ".libs" && rm -f "libgnu.la" && ln -s "../libgnu.la" "libgnu.la" )
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build/lib'
| Making all in src
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build/src'
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../enchant-2.3.4/src -I..  -I../../enchant-2.3.4 -isystem ../lib -isystem ../../enchant-2.3.4/lib -pthread -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -fanalyzer -fno-common -Wall -Warith-conversion -Wbad-function-cast -Wcast-align=strict -Wdate-time -Wdisabled-optimization -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat-signedness -Winit-self -Winline -Winvalid-pch -Wlogical-op -Wmissing-declarations -Wmissing-
 include-dirs -Wmissing-prototypes -Wnested-externs -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Woverlength-strings -Wpacked -Wpointer-arith -Wshadow -Wstack-protector -Wstrict-prototypes -Wsuggest-attribute=cold -Wsuggest-attribute=const -Wsuggest-attribute=format -Wsuggest-attribute=malloc -Wsuggest-attribute=noreturn -Wsuggest-attribute=pure -Wsuggest-final-methods -Wsuggest-final-types -Wsync-nand -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunsafe-loop-optimizations -Wunused-macros -Wvariadic-macros -Wvector-operation-performance -Wvla -Wwrite-strings -Warray-bounds=2 -Wattribute-alias=2 -Wbidi-chars=any,ucn -Wformat-overflow=2 -Wformat=2 -Wformat-truncation=2 -Wshift-overflow=2 -Wuse-after-free=3 -Wunused-const-variable=2 -Wvla-larger-than=4031 -Wno-analyzer-malloc-leak -Wstrict-overflow=1 -Wno-error=format-security   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/e
 nchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot-native=  -c -o enchant.o ../../enchant-2.3.4/src/ench
 ant.c
| /bin/bash ../libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../enchant-2.3.4/src -I..  -I../../enchant-2.3.4 -isystem ../lib -isystem ../../enchant-2.3.4/lib -pthread -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -fanalyzer -fno-common -Wall -Warith-conversion -Wbad-function-cast -Wcast-align=strict -Wdate-time -Wdisabled-optimization -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat-signedness -Winit-self -Winline -Winvalid-pc
 h -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Woverlength-strings -Wpacked -Wpointer-arith -Wshadow -Wstack-protector -Wstrict-prototypes -Wsuggest-attribute=cold -Wsuggest-attribute=const -Wsuggest-attribute=format -Wsuggest-attribute=malloc -Wsuggest-attribute=noreturn -Wsuggest-attribute=pure -Wsuggest-final-methods -Wsuggest-final-types -Wsync-nand -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunsafe-loop-optimizations -Wunused-macros -Wvariadic-macros -Wvector-operation-performance -Wvla -Wwrite-strings -Warray-bounds=2 -Wattribute-alias=2 -Wbidi-chars=any,ucn -Wformat-overflow=2 -Wformat=2 -Wformat-truncation=2 -Wshift-overflow=2 -Wuse-after-free=3 -Wunused-const-variable=2 -Wvla-larger-than=4031 -Wno-analyzer-malloc-leak -Wstrict-overflow=1 -Wno-error=format-security -D_ENCHANT_BUILD=1 -DENCHANT_VERSION_STRING=\"2.3.4\" -DENCHANT_MAJOR_VERSION=\"2\"   -O2 -pipe -g
  -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot-native=  -c -o libenchant_2_la-lib.lo `test -f 'lib.c' || echo '../../enchant-2.3.4/src/'`lib.c
| /bin/bash ../libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../enchant-2.3.4/src -I..  -I../../enchant-2.3.4 -isystem ../lib -isystem ../../enchant-2.3.4/lib -pthread -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -fanalyzer -fno-common -Wall -Warith-conversion -Wbad-function-cast -Wcast-align=strict -Wdate-time -Wdisabled-optimization -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat-signedness -Winit-self -Winline -Winvalid-pc
 h -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Woverlength-strings -Wpacked -Wpointer-arith -Wshadow -Wstack-protector -Wstrict-prototypes -Wsuggest-attribute=cold -Wsuggest-attribute=const -Wsuggest-attribute=format -Wsuggest-attribute=malloc -Wsuggest-attribute=noreturn -Wsuggest-attribute=pure -Wsuggest-final-methods -Wsuggest-final-types -Wsync-nand -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunsafe-loop-optimizations -Wunused-macros -Wvariadic-macros -Wvector-operation-performance -Wvla -Wwrite-strings -Warray-bounds=2 -Wattribute-alias=2 -Wbidi-chars=any,ucn -Wformat-overflow=2 -Wformat=2 -Wformat-truncation=2 -Wshift-overflow=2 -Wuse-after-free=3 -Wunused-const-variable=2 -Wvla-larger-than=4031 -Wno-analyzer-malloc-leak -Wstrict-overflow=1 -Wno-error=format-security -D_ENCHANT_BUILD=1 -DENCHANT_VERSION_STRING=\"2.3.4\" -DENCHANT_MAJOR_VERSION=\"2\"   -O2 -pipe -g
  -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot-native=  -c -o libenchant_2_la-pwl.lo `test -f 'pwl.c' || echo '../../enchant-2.3.4/src/'`pwl.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../enchant-2.3.4/src -I..  -I../../enchant-2.3.4 -isystem ../lib -isystem ../../enchant-2.3.4/lib -pthread -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -fanalyzer -fno-common -Wall -Warith-conversion -Wbad-function-cast -Wcast-align=strict -Wdate-time -Wdisabled-optimization -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat-signedness -Winit-self -Winline -Winvalid-pch -Wlogical-op -Wmissing-declarations -Wmissing-
 include-dirs -Wmissing-prototypes -Wnested-externs -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Woverlength-strings -Wpacked -Wpointer-arith -Wshadow -Wstack-protector -Wstrict-prototypes -Wsuggest-attribute=cold -Wsuggest-attribute=const -Wsuggest-attribute=format -Wsuggest-attribute=malloc -Wsuggest-attribute=noreturn -Wsuggest-attribute=pure -Wsuggest-final-methods -Wsuggest-final-types -Wsync-nand -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunsafe-loop-optimizations -Wunused-macros -Wvariadic-macros -Wvector-operation-performance -Wvla -Wwrite-strings -Warray-bounds=2 -Wattribute-alias=2 -Wbidi-chars=any,ucn -Wformat-overflow=2 -Wformat=2 -Wformat-truncation=2 -Wshift-overflow=2 -Wuse-after-free=3 -Wunused-const-variable=2 -Wvla-larger-than=4031 -Wno-analyzer-malloc-leak -Wstrict-overflow=1 -Wno-error=format-security   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/e
 nchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot-native=  -c -o enchant-lsmod.o ../../enchant-2.3.4/sr
 c/enchant-lsmod.c
| rm -f enchant-2.1 enchant-2.1.tmp
| cp /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build/src/enchant-lsmod.1 enchant-lsmod-2.1
| groff -mandoc -Thtml enchant.5 > enchant.html
| sed -e 's|DATADIR|/usr/share|g' /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build/src/enchant.1 >enchant-2.1.tmp
| /bin/bash: groff: command not found
| make[2]: *** [Makefile:1477: enchant.html] Error 127
| make[2]: *** Waiting for unfinished jobs....
| mv enchant-2.1.tmp enchant-2.1
| libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../enchant-2.3.4/src -I.. -I../../enchant-2.3.4 -isystem ../lib -isystem ../../enchant-2.3.4/lib -pthread -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -fanalyzer -fno-common -Wall -Warith-conversion -Wbad-function-cast -Wcast-align=strict -Wdate-time -Wdisabled-optimization -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat-signedness -Winit-self -Winline -Winvalid-pch -Wlogical-op -Wmissing-declara
 tions -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Woverlength-strings -Wpacked -Wpointer-arith -Wshadow -Wstack-protector -Wstrict-prototypes -Wsuggest-attribute=cold -Wsuggest-attribute=const -Wsuggest-attribute=format -Wsuggest-attribute=malloc -Wsuggest-attribute=noreturn -Wsuggest-attribute=pure -Wsuggest-final-methods -Wsuggest-final-types -Wsync-nand -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunsafe-loop-optimizations -Wunused-macros -Wvariadic-macros -Wvector-operation-performance -Wvla -Wwrite-strings -Warray-bounds=2 -Wattribute-alias=2 -Wbidi-chars=any,ucn -Wformat-overflow=2 -Wformat=2 -Wformat-truncation=2 -Wshift-overflow=2 -Wuse-after-free=3 -Wunused-const-variable=2 -Wvla-larger-than=4031 -Wno-analyzer-malloc-leak -Wstrict-overflow=1 -Wno-error=format-security -D_ENCHANT_BUILD=1 -DENCHANT_VERSION_STRING=\"2.3.4\" -DENCHANT_MAJOR_VERSION=\"2\" -O2 -pipe -g -feliminate-unused-debug-types -f
 macro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-
 linux/enchant2/2.3.4-r0/recipe-sysroot-native= -c ../../enchant-2.3.4/src/lib.c  -fPIC -DPIC -o .libs/libenchant_2_la-lib.o
| libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../enchant-2.3.4/src -I.. -I../../enchant-2.3.4 -isystem ../lib -isystem ../../enchant-2.3.4/lib -pthread -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -fanalyzer -fno-common -Wall -Warith-conversion -Wbad-function-cast -Wcast-align=strict -Wdate-time -Wdisabled-optimization -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat-signedness -Winit-self -Winline -Winvalid-pch -Wlogical-op -Wmissing-declara
 tions -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Woverlength-strings -Wpacked -Wpointer-arith -Wshadow -Wstack-protector -Wstrict-prototypes -Wsuggest-attribute=cold -Wsuggest-attribute=const -Wsuggest-attribute=format -Wsuggest-attribute=malloc -Wsuggest-attribute=noreturn -Wsuggest-attribute=pure -Wsuggest-final-methods -Wsuggest-final-types -Wsync-nand -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunsafe-loop-optimizations -Wunused-macros -Wvariadic-macros -Wvector-operation-performance -Wvla -Wwrite-strings -Warray-bounds=2 -Wattribute-alias=2 -Wbidi-chars=any,ucn -Wformat-overflow=2 -Wformat=2 -Wformat-truncation=2 -Wshift-overflow=2 -Wuse-after-free=3 -Wunused-const-variable=2 -Wvla-larger-than=4031 -Wno-analyzer-malloc-leak -Wstrict-overflow=1 -Wno-error=format-security -D_ENCHANT_BUILD=1 -DENCHANT_VERSION_STRING=\"2.3.4\" -DENCHANT_MAJOR_VERSION=\"2\" -O2 -pipe -g -feliminate-unused-debug-types -f
 macro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/enchant-2.3.4=/usr/src/debug/enchant2/2.3.4-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build=/usr/src/debug/enchant2/2.3.4-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-
 linux/enchant2/2.3.4-r0/recipe-sysroot-native= -c ../../enchant-2.3.4/src/pwl.c  -fPIC -DPIC -o .libs/libenchant_2_la-pwl.o
| ../../enchant-2.3.4/src/lib.c: In function 'enchant_relocate':
| ../../enchant-2.3.4/src/lib.c:97:1: warning: function might be candidate for attribute 'malloc' [-Wsuggest-attribute=malloc]
|    97 | enchant_relocate (const char *path)
|       | ^~~~~~~~~~~~~~~~
| ../../enchant-2.3.4/src/lib.c: In function 'enchant_get_user_config_dir':
| ../../enchant-2.3.4/src/lib.c:116:1: warning: function might be candidate for attribute 'malloc' [-Wsuggest-attribute=malloc]
|   116 | enchant_get_user_config_dir (void)
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../enchant-2.3.4/src/lib.c: In function 'enchant_get_user_language':
| ../../enchant-2.3.4/src/lib.c:1420:1: warning: function might be candidate for attribute 'malloc' [-Wsuggest-attribute=malloc]
|  1420 | enchant_get_user_language(void)
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~
| ../../enchant-2.3.4/src/lib.c: In function 'enchant_iso_639_from_tag':
| ../../enchant-2.3.4/src/lib.c:207:25: warning: use of possibly-NULL 'new_tag' where non-null expected [CWE-690] [-Wanalyzer-possible-null-argument]
|   207 |         char * needle = strchr (new_tag, '_');
|       |                         ^~~~~~~~~~~~~~~~~~~~~
|   'enchant_iso_639_from_tag': events 1-2
|     |
|     |  206 |         char * new_tag = strdup (dict_tag);
|     |      |                          ^~~~~~~~~~~~~~~~~
|     |      |                          |
|     |      |                          (1) this call could return NULL
|     |  207 |         char * needle = strchr (new_tag, '_');
|     |      |                         ~~~~~~~~~~~~~~~~~~~~~
|     |      |                         |
|     |      |                         (2) argument 1 ('new_tag') from (1) could be NULL where non-null expected
|     |
| In file included from ../lib/string.h:41,
|                  from ../../enchant-2.3.4/src/lib.c:35:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/recipe-sysroot/usr/include/string.h:246:14: note: argument 1 of 'strchr' must be non-null
|   246 | extern char *strchr (const char *__s, int __c)
|       |              ^~~~~~
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build/src'
| make[1]: *** [Makefile:978: all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/build'
| make: *** [Makefile:889: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/run.do_compile.3802337:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/run.do_compile.3802337, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/run.do_compile.3802337, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/run.do_compile.3802337, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/run.do_compile.3802337, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/run.do_compile.3802337, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/run.do_compile.3802337, line 195
NOTE: recipe enchant2-2.3.4-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1008 tasks of which 1000 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: enchant2-2.3.4-r0 do_compile: oe_runmake failed
ERROR: enchant2-2.3.4-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/run.do_compile.3802337', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/enchant2/2.3.4-r0/temp/log.do_compile.3802337
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.4.bb:do_compile) failed with exit code '1'

--===============4206932133618719893==--

