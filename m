Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C32E760810
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 01:41:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5J1fPT1003361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2013 18:41:25 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 18 Jun 2013 18:41:24 -0700
Message-ID: <51C10C2A.2000702@windriver.com>
Date: Wed, 19 Jun 2013 09:40:58 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Kai Kang <kai.kang@windriver.com>
References: <cover.1371559431.git.kai.kang@windriver.com>
	<bd81e3359c8816e0b47f138e4a9eee518bc3e51d.1371559431.git.kai.kang@windriver.com>
In-Reply-To: <bd81e3359c8816e0b47f138e4a9eee518bc3e51d.1371559431.git.kai.kang@windriver.com>
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] strace: update to 4.8
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
X-List-Received-Date: Wed, 19 Jun 2013 01:41:28 -0000
Content-Type: multipart/alternative;
	boundary="------------080601010206050708070908"

--------------080601010206050708070908
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2013?06?18? 21:05, Kai Kang wrote:
> Update strace to 4.8.
>
> * Update License file.
> * Remove the backport patches which are already in version 4.8.
> * Add file git-version-gen from git repo. Without this file configure
>    fails.
> * Add libaio and acl to PACKAGECONFIG for target package. Make libaio as a
>    dependency by default which could be covered easily.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   ...ilding-when-glibc-has-a-stub-process_vm_r.patch |   54 -
>   .../strace-4.7/0014-x32-update-syscall-table.patch |   91 -
>   ...-x32-update-g-s-etsockopt-syscall-numbers.patch |   43 -
>   .../0024-x32-add-64bit-annotation-too.patch        |  231 --
>   .../0025-Add-e-trace-memory-option.patch           | 2898 --------------------
>   ...ew-errno-values-for-EPROBE_DEFER-and-EOPE.patch |   36 -
>   .../0027-Add-AArch64-support-to-strace.patch       |  542 ----
>   .../0028-Enhance-quotactl-decoding.patch           |  391 ---
>   ...029-Filter-out-redundant-32-ioctl-entries.patch |  145 -
>   ...neric-ioctl-definitions-to-linux-ioctlent.patch |  571 ----
>   ...-for-tracing-32-bit-ARM-EABI-binaries-on-.patch |  963 -------
>   .../0032-Fix-kernel-release-string-parsing.patch   |   38 -
>   .../strace/strace-4.8/git-version-gen              |  225 ++
>   meta/recipes-devtools/strace/strace_4.7.bb         |   34 -
>   meta/recipes-devtools/strace/strace_4.8.bb         |   32 +
>   15 files changed, 257 insertions(+), 6037 deletions(-)
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0014-x32-update-syscall-table.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0018-x32-update-g-s-etsockopt-syscall-numbers.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0024-x32-add-64bit-annotation-too.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0025-Add-e-trace-memory-option.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0026-linux-add-new-errno-values-for-EPROBE_DEFER-and-EOPE.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0027-Add-AArch64-support-to-strace.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0028-Enhance-quotactl-decoding.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0029-Filter-out-redundant-32-ioctl-entries.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0030-Move-asm-generic-ioctl-definitions-to-linux-ioctlent.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0031-Add-support-for-tracing-32-bit-ARM-EABI-binaries-on-.patch
>   delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0032-Fix-kernel-release-string-parsing.patch
>   create mode 100755 meta/recipes-devtools/strace/strace-4.8/git-version-gen
>   delete mode 100644 meta/recipes-devtools/strace/strace_4.7.bb
>   create mode 100644 meta/recipes-devtools/strace/strace_4.8.bb
>
> diff --git a/meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch b/meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
> deleted file mode 100644
> index 2fd80ec..0000000
> --- a/meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -Upstream-Status: Backport
> -
> -From 24ee60b836ad33bb4ac694ca99d6c94a8cc5ff92 Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Fri, 4 May 2012 19:37:29 -0400
> -Subject: [PATCH 03/31] util: fix building when glibc has a stub
> - process_vm_readv
> -
> -If you have a newer glibc which provides process_vm_readv, but it is built
> -against older kernel headers which lack __NR_process_vm_readv, the library
> -will contain a stub implementation that just returns ENOSYS.  Autoconf
> -checks for this case explicitly and will declare it as unavailable.  So we
> -end up in a case where the headers provide the prototype, but autoconf has
> -not defined HAVE_PROCESS_VM_READV, so we hit the same build failure again:
> -
> -util.c:738:16: error: static declaration of 'process_vm_readv' follows non-static declaration
> -/usr/include/bits/uio.h:58:16: note: previous declaration of 'process_vm_readv' was here
> -
> -So rename our local function to something unique, and add a define so the
> -callers all hit the right place.
> -
> -* util.c (strace_process_vm_readv): Rename from process_vm_readv.
> -(process_vm_readv): Define to strace_process_vm_readv.
> -
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - util.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
>

...
snip
...

> diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
> deleted file mode 100644
> index e360e63..0000000
> --- a/meta/recipes-devtools/strace/strace_4.7.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -DESCRIPTION = "strace is a system call tracing tool."
> -HOMEPAGE = "http://strace.sourceforge.net"
> -SECTION = "console/utils"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"
> -PR = "r4"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
> -           file://0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch \
> -           file://0014-x32-update-syscall-table.patch \
> -           file://0018-x32-update-g-s-etsockopt-syscall-numbers.patch \
> -           file://0024-x32-add-64bit-annotation-too.patch \
> -           file://0025-Add-e-trace-memory-option.patch \
> -           file://0026-linux-add-new-errno-values-for-EPROBE_DEFER-and-EOPE.patch \
> -           file://0027-Add-AArch64-support-to-strace.patch \
> -           file://0028-Enhance-quotactl-decoding.patch \
> -           file://0029-Filter-out-redundant-32-ioctl-entries.patch \
> -           file://0030-Move-asm-generic-ioctl-definitions-to-linux-ioctlent.patch \
> -           file://0031-Add-support-for-tracing-32-bit-ARM-EABI-binaries-on-.patch \
> -           file://0032-Fix-kernel-release-string-parsing.patch \
> -          "
> -
> -SRC_URI[md5sum] = "6054c3880a00c6703f83b57f15e04642"
> -SRC_URI[sha256sum] = "c49cd98873c119c5f201356200a9b9687da1ceea83a05047e2ae0a7ac1e41195"
> -inherit autotools
> -
> -export INCLUDES = "-I. -I./linux"
> -
> -do_install_append() {
> -	# We don't ship strace-graph here because it needs perl
> -	rm ${D}${bindir}/strace-graph
> -}
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
> new file mode 100644
> index 0000000..92a7d14
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace_4.8.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "strace is a system call tracing tool."
> +HOMEPAGE = "http://strace.sourceforge.net"
> +SECTION = "console/utils"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
> +PR = "r0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
> +           file://git-version-gen"
> +
> +SRC_URI[md5sum] = "c575ef43829586801f514fd91bfe7575"
> +SRC_URI[sha256sum] = "f492291f07a7c805c07a8395cce1ea054a6401ad414f4cc12185672215e1d7f8"
> +inherit autotools
> +
> +PACKAGECONFIG_class-target ?= "libaio \
> +        ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"

Would this be better?

PACKAGECONFIG_class-target ?= "libaio"
PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"


If so, I would update and send a new version.

Thanks,
Kai
> +
> +PACKAGECONFIG[libaio] = ",,libaio,"
> +PACKAGECONFIG[acl] = ",,acl,"
> +
> +export INCLUDES = "-I. -I./linux"
> +
> +do_configure_prepend() {
> +	cp ${WORKDIR}/git-version-gen ${S}
> +}
> +
> +do_install_append() {
> +	# We don't ship strace-graph here because it needs perl
> +	rm ${D}${bindir}/strace-graph
> +}
> +
> +BBCLASSEXTEND = "native"


-- 
Regards,
Neil | Kai Kang


--------------080601010206050708070908
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2013&#24180;06&#26376;18&#26085; 21:05, Kai Kang wrote:<br>
    </div>
    <blockquote
cite="mid:bd81e3359c8816e0b47f138e4a9eee518bc3e51d.1371559431.git.kai.kang@windriver.com"
      type="cite">
      <pre wrap="">Update strace to 4.8.

* Update License file.
* Remove the backport patches which are already in version 4.8.
* Add file git-version-gen from git repo. Without this file configure
  fails.
* Add libaio and acl to PACKAGECONFIG for target package. Make libaio as a
  dependency by default which could be covered easily.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 ...ilding-when-glibc-has-a-stub-process_vm_r.patch |   54 -
 .../strace-4.7/0014-x32-update-syscall-table.patch |   91 -
 ...-x32-update-g-s-etsockopt-syscall-numbers.patch |   43 -
 .../0024-x32-add-64bit-annotation-too.patch        |  231 --
 .../0025-Add-e-trace-memory-option.patch           | 2898 --------------------
 ...ew-errno-values-for-EPROBE_DEFER-and-EOPE.patch |   36 -
 .../0027-Add-AArch64-support-to-strace.patch       |  542 ----
 .../0028-Enhance-quotactl-decoding.patch           |  391 ---
 ...029-Filter-out-redundant-32-ioctl-entries.patch |  145 -
 ...neric-ioctl-definitions-to-linux-ioctlent.patch |  571 ----
 ...-for-tracing-32-bit-ARM-EABI-binaries-on-.patch |  963 -------
 .../0032-Fix-kernel-release-string-parsing.patch   |   38 -
 .../strace/strace-4.8/git-version-gen              |  225 ++
 meta/recipes-devtools/strace/strace_4.7.bb         |   34 -
 meta/recipes-devtools/strace/strace_4.8.bb         |   32 +
 15 files changed, 257 insertions(+), 6037 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0014-x32-update-syscall-table.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0018-x32-update-g-s-etsockopt-syscall-numbers.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0024-x32-add-64bit-annotation-too.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0025-Add-e-trace-memory-option.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0026-linux-add-new-errno-values-for-EPROBE_DEFER-and-EOPE.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0027-Add-AArch64-support-to-strace.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0028-Enhance-quotactl-decoding.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0029-Filter-out-redundant-32-ioctl-entries.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0030-Move-asm-generic-ioctl-definitions-to-linux-ioctlent.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0031-Add-support-for-tracing-32-bit-ARM-EABI-binaries-on-.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0032-Fix-kernel-release-string-parsing.patch
 create mode 100755 meta/recipes-devtools/strace/strace-4.8/git-version-gen
 delete mode 100644 meta/recipes-devtools/strace/strace_4.7.bb
 create mode 100644 meta/recipes-devtools/strace/strace_4.8.bb

diff --git a/meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch b/meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
deleted file mode 100644
index 2fd80ec..0000000
--- a/meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Backport
-
-From 24ee60b836ad33bb4ac694ca99d6c94a8cc5ff92 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <a class="moz-txt-link-rfc2396E" href="mailto:vapier@gentoo.org">&lt;vapier@gentoo.org&gt;</a>
-Date: Fri, 4 May 2012 19:37:29 -0400
-Subject: [PATCH 03/31] util: fix building when glibc has a stub
- process_vm_readv
-
-If you have a newer glibc which provides process_vm_readv, but it is built
-against older kernel headers which lack __NR_process_vm_readv, the library
-will contain a stub implementation that just returns ENOSYS.  Autoconf
-checks for this case explicitly and will declare it as unavailable.  So we
-end up in a case where the headers provide the prototype, but autoconf has
-not defined HAVE_PROCESS_VM_READV, so we hit the same build failure again:
-
-util.c:738:16: error: static declaration of 'process_vm_readv' follows non-static declaration
-/usr/include/bits/uio.h:58:16: note: previous declaration of 'process_vm_readv' was here
-
-So rename our local function to something unique, and add a define so the
-callers all hit the right place.
-
-* util.c (strace_process_vm_readv): Rename from process_vm_readv.
-(process_vm_readv): Define to strace_process_vm_readv.
-
-Signed-off-by: Mike Frysinger <a class="moz-txt-link-rfc2396E" href="mailto:vapier@gentoo.org">&lt;vapier@gentoo.org&gt;</a>
----
- util.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-

</pre>
    </blockquote>
    <br>
    ...<br>
    snip<br>
    ...<br>
    <br>
    <blockquote
cite="mid:bd81e3359c8816e0b47f138e4a9eee518bc3e51d.1371559431.git.kai.kang@windriver.com"
      type="cite">
      <pre wrap="">
diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
deleted file mode 100644
index e360e63..0000000
--- a/meta/recipes-devtools/strace/strace_4.7.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "strace is a system call tracing tool."
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://strace.sourceforge.net">"http://strace.sourceforge.net"</a>
-SECTION = "console/utils"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7">"file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"</a>
-PR = "r4"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
-           <a class="moz-txt-link-freetext" href="file://0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch">file://0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0014-x32-update-syscall-table.patch">file://0014-x32-update-syscall-table.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0018-x32-update-g-s-etsockopt-syscall-numbers.patch">file://0018-x32-update-g-s-etsockopt-syscall-numbers.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0024-x32-add-64bit-annotation-too.patch">file://0024-x32-add-64bit-annotation-too.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0025-Add-e-trace-memory-option.patch">file://0025-Add-e-trace-memory-option.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0026-linux-add-new-errno-values-for-EPROBE_DEFER-and-EOPE.patch">file://0026-linux-add-new-errno-values-for-EPROBE_DEFER-and-EOPE.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0027-Add-AArch64-support-to-strace.patch">file://0027-Add-AArch64-support-to-strace.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0028-Enhance-quotactl-decoding.patch">file://0028-Enhance-quotactl-decoding.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0029-Filter-out-redundant-32-ioctl-entries.patch">file://0029-Filter-out-redundant-32-ioctl-entries.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0030-Move-asm-generic-ioctl-definitions-to-linux-ioctlent.patch">file://0030-Move-asm-generic-ioctl-definitions-to-linux-ioctlent.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0031-Add-support-for-tracing-32-bit-ARM-EABI-binaries-on-.patch">file://0031-Add-support-for-tracing-32-bit-ARM-EABI-binaries-on-.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0032-Fix-kernel-release-string-parsing.patch">file://0032-Fix-kernel-release-string-parsing.patch</a> \
-          "
-
-SRC_URI[md5sum] = "6054c3880a00c6703f83b57f15e04642"
-SRC_URI[sha256sum] = "c49cd98873c119c5f201356200a9b9687da1ceea83a05047e2ae0a7ac1e41195"
-inherit autotools
-
-export INCLUDES = "-I. -I./linux"
-
-do_install_append() {
-	# We don't ship strace-graph here because it needs perl
-	rm ${D}${bindir}/strace-graph
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
new file mode 100644
index 0000000..92a7d14
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "strace is a system call tracing tool."
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://strace.sourceforge.net">"http://strace.sourceforge.net"</a>
+SECTION = "console/utils"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=124500c21e856f0912df29295ba104c7">"file://COPYING;md5=124500c21e856f0912df29295ba104c7"</a>
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
+           <a class="moz-txt-link-freetext" href="file://git-version-gen">file://git-version-gen</a>"
+
+SRC_URI[md5sum] = "c575ef43829586801f514fd91bfe7575"
+SRC_URI[sha256sum] = "f492291f07a7c805c07a8395cce1ea054a6401ad414f4cc12185672215e1d7f8"
+inherit autotools
+
+PACKAGECONFIG_class-target ?= "libaio \
+        ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"</pre>
    </blockquote>
    <br>
    <big>Would this be better?</big><br>
    <br>
    <pre wrap="">PACKAGECONFIG_class-target ?= "libaio"
PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"</pre>
    <br>
    If so, I would update and send a new version.<br>
    <br>
    Thanks,<br>
    Kai<br>
    <blockquote
cite="mid:bd81e3359c8816e0b47f138e4a9eee518bc3e51d.1371559431.git.kai.kang@windriver.com"
      type="cite">
      <pre wrap="">
+
+PACKAGECONFIG[libaio] = ",,libaio,"
+PACKAGECONFIG[acl] = ",,acl,"
+
+export INCLUDES = "-I. -I./linux"
+
+do_configure_prepend() {
+	cp ${WORKDIR}/git-version-gen ${S}
+}
+
+do_install_append() {
+	# We don't ship strace-graph here because it needs perl
+	rm ${D}${bindir}/strace-graph
+}
+
+BBCLASSEXTEND = "native"
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------080601010206050708070908--
