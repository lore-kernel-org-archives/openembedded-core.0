Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD277DFE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 11:22:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45CF1t5fQ4z3w
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 13:22:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558956146;
	bh=AZiSW2NYAGT7NxESW0SlnqtofTlez9ckJgmENtnLoGY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=OMHcLdnQheLP4fYwJ+s8o4rTWoBU56aju8nBrF3B+1W4SuUBohEw71RufaQhzM6HB
	ApKi4Q5n1LcWRqyZKVVAxEkBIdGixlENvqm/VS5mTVhx2Y/0AuHcSTTqYNEat9h3rb
	zfSQcMv5fbvV0U8GJ6Xu39lZiyBAq+Lb+Nkgw5UhVB4ov1ftozIXIRE8uCIOW51Bzn
	tSH5mQXmutqPqeEH4/bY0ZNJysqKnVTzFFVYMOKlju2drHNhwFBqpnWd2nJwUqkL61
	E8mz64eEbVUEA90apJ5TvLSPUBQkxHhpRDof0xEFOESAGzHv6BngU232SVEhlwnZXT
	U8yxdBefJBi2Ug1oy0PaK/PGM0fr+TxzSwzK4n/jAMsjXfGhoOvBIyPdgLIB9SSFt9
	e4H/QTpemK0cPRR4der8mGZUXKy43yJlGZ0qlxRSLJM/cFROc7B7+vWRZM4A3fswjl
	YKFnrlAc8i2Zh+gk01slIH6A4lhZQkIiT2iwgYFT1nbjwG0o91ODrAUgXipTL4nUSG
	fx8dHldqwmPgVPM9ZDI9sbh1aNhPWytF/iYL6C8hmSRKwaxtEFJ+VnmuVYOrX5jTlf
	wm1ZkofAG2POuHCGQpanLUVidchF+OIf6TQOPkin3/z/jm3RhVfLUzRElQ/f0LXT3q
	PU9H/g+YdATPhRHf0rczIfdM=
Date: Mon, 27 May 2019 14:22:05 +0300
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190527112205.GA17077@localhost>
References: <20190520163052.2556-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190520163052.2556-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [PATCH] libpam: Upgrade 1.3.0 -> 1.3.1
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
X-List-Received-Date: Mon, 27 May 2019 11:22:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

ping

Thanks
Adrian

On Mon, May 20, 2019 at 07:30:52PM +0300, Adrian Bunk wrote:
> Remove patch applied upstream.
> Upstream tarball location changed.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  ...libpam-xtests-remove-bash-dependency.patch | 226 ------------------
>  .../pam/{libpam_1.3.0.bb => libpam_1.3.1.bb}  |   9 +-
>  2 files changed, 3 insertions(+), 232 deletions(-)
>  delete mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch
>  rename meta/recipes-extended/pam/{libpam_1.3.0.bb => libpam_1.3.1.bb} (95%)
> 
> diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch b/meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch
> deleted file mode 100644
> index 680029ae0d..0000000000
> --- a/meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch
> +++ /dev/null
> @@ -1,226 +0,0 @@
> -From 555407ff6e2f742df64ae93859f14a0fc1397829 Mon Sep 17 00:00:00 2001
> -From: Wenzong Fan <wenzong.fan@windriver.com>
> -Date: Fri, 12 Sep 2014 05:35:05 -0400
> -Subject: [PATCH] libpam/xtests: remove bash dependency
> -
> -There's not bash specific syntax in the xtest scripts:
> -
> -  # after below patches applied:
> -  $ cd Linux-PAM-1.1.6/xtests
> -  $ checkbashisms *.sh
> -  No output
> -
> -Just remove the runtime dependency to bash.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ----
> - xtests/run-xtests.sh             |    2 +-
> - xtests/tst-pam_access1.sh        |    2 +-
> - xtests/tst-pam_access2.sh        |    2 +-
> - xtests/tst-pam_access3.sh        |    2 +-
> - xtests/tst-pam_access4.sh        |    2 +-
> - xtests/tst-pam_assemble_line1.sh |    2 +-
> - xtests/tst-pam_group1.sh         |    2 +-
> - xtests/tst-pam_limits1.sh        |    2 +-
> - xtests/tst-pam_pwhistory1.sh     |    2 +-
> - xtests/tst-pam_substack1.sh      |    2 +-
> - xtests/tst-pam_substack2.sh      |    2 +-
> - xtests/tst-pam_substack3.sh      |    2 +-
> - xtests/tst-pam_substack4.sh      |    2 +-
> - xtests/tst-pam_substack5.sh      |    2 +-
> - xtests/tst-pam_succeed_if1.sh    |    2 +-
> - xtests/tst-pam_unix1.sh          |    2 +-
> - xtests/tst-pam_unix2.sh          |    2 +-
> - xtests/tst-pam_unix3.sh          |    2 +-
> - xtests/tst-pam_unix4.sh          |    2 +-
> - 19 files changed, 19 insertions(+), 19 deletions(-)
> -
> -diff --git a/xtests/run-xtests.sh b/xtests/run-xtests.sh
> -index 3a89057..1cf8684 100755
> ---- a/xtests/run-xtests.sh
> -+++ b/xtests/run-xtests.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - SRCDIR=$1
> - shift 1
> -diff --git a/xtests/tst-pam_access1.sh b/xtests/tst-pam_access1.sh
> -index 180d256..70521d2 100755
> ---- a/xtests/tst-pam_access1.sh
> -+++ b/xtests/tst-pam_access1.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/groupadd tstpamaccess
> - /usr/sbin/useradd -G tstpamaccess -p '!!' tstpamaccess1
> -diff --git a/xtests/tst-pam_access2.sh b/xtests/tst-pam_access2.sh
> -index 0a30275..7e3e60f 100755
> ---- a/xtests/tst-pam_access2.sh
> -+++ b/xtests/tst-pam_access2.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/groupadd tstpamaccess
> - /usr/sbin/useradd -p '!!' tstpamaccess2
> -diff --git a/xtests/tst-pam_access3.sh b/xtests/tst-pam_access3.sh
> -index 348e0c3..3630e2e 100755
> ---- a/xtests/tst-pam_access3.sh
> -+++ b/xtests/tst-pam_access3.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/useradd -p '!!' tstpamaccess3
> - ./tst-pam_access3
> -diff --git a/xtests/tst-pam_access4.sh b/xtests/tst-pam_access4.sh
> -index 61e7b44..4538df4 100755
> ---- a/xtests/tst-pam_access4.sh
> -+++ b/xtests/tst-pam_access4.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/useradd -p '!!' tstpamaccess4
> - ./tst-pam_access4
> -diff --git a/xtests/tst-pam_assemble_line1.sh b/xtests/tst-pam_assemble_line1.sh
> -index 248d47e..dc2a675 100755
> ---- a/xtests/tst-pam_assemble_line1.sh
> -+++ b/xtests/tst-pam_assemble_line1.sh
> -@@ -1,3 +1,3 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - exec ./tst-pam_authfail tst-pam_assemble_line1
> -diff --git a/xtests/tst-pam_group1.sh b/xtests/tst-pam_group1.sh
> -index b76377f..44faca9 100755
> ---- a/xtests/tst-pam_group1.sh
> -+++ b/xtests/tst-pam_group1.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/groupadd tstpamgrpg
> - /usr/sbin/useradd -p '!!' tstpamgrp
> -diff --git a/xtests/tst-pam_limits1.sh b/xtests/tst-pam_limits1.sh
> -index 4faa822..32c021d 100755
> ---- a/xtests/tst-pam_limits1.sh
> -+++ b/xtests/tst-pam_limits1.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/useradd -p '!!' tstpamlimits
> - ./tst-pam_limits1
> -diff --git a/xtests/tst-pam_pwhistory1.sh b/xtests/tst-pam_pwhistory1.sh
> -index ddb3b8b..0f212e2 100644
> ---- a/xtests/tst-pam_pwhistory1.sh
> -+++ b/xtests/tst-pam_pwhistory1.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/useradd tstpampwhistory
> - ./tst-pam_pwhistory1
> -diff --git a/xtests/tst-pam_substack1.sh b/xtests/tst-pam_substack1.sh
> -index 5260175..f1b72a7 100755
> ---- a/xtests/tst-pam_substack1.sh
> -+++ b/xtests/tst-pam_substack1.sh
> -@@ -1,3 +1,3 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - exec ./tst-pam_authfail tst-pam_substack1
> -diff --git a/xtests/tst-pam_substack2.sh b/xtests/tst-pam_substack2.sh
> -index c02f597..3804fa7 100755
> ---- a/xtests/tst-pam_substack2.sh
> -+++ b/xtests/tst-pam_substack2.sh
> -@@ -1,3 +1,3 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - exec ./tst-pam_authsucceed tst-pam_substack2
> -diff --git a/xtests/tst-pam_substack3.sh b/xtests/tst-pam_substack3.sh
> -index 0e572aa..aa48e8e 100755
> ---- a/xtests/tst-pam_substack3.sh
> -+++ b/xtests/tst-pam_substack3.sh
> -@@ -1,3 +1,3 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - exec ./tst-pam_authsucceed tst-pam_substack3
> -diff --git a/xtests/tst-pam_substack4.sh b/xtests/tst-pam_substack4.sh
> -index a3ef08a..958a07a 100755
> ---- a/xtests/tst-pam_substack4.sh
> -+++ b/xtests/tst-pam_substack4.sh
> -@@ -1,3 +1,3 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - exec ./tst-pam_authsucceed tst-pam_substack4
> -diff --git a/xtests/tst-pam_substack5.sh b/xtests/tst-pam_substack5.sh
> -index e2714fd..7e0da74 100755
> ---- a/xtests/tst-pam_substack5.sh
> -+++ b/xtests/tst-pam_substack5.sh
> -@@ -1,3 +1,3 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - exec ./tst-pam_authfail tst-pam_substack5
> -diff --git a/xtests/tst-pam_succeed_if1.sh b/xtests/tst-pam_succeed_if1.sh
> -index a643b2e..58e57b4 100755
> ---- a/xtests/tst-pam_succeed_if1.sh
> -+++ b/xtests/tst-pam_succeed_if1.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/useradd -p '!!' tstpamtest
> - /usr/sbin/useradd -p '!!' pamtest
> -diff --git a/xtests/tst-pam_unix1.sh b/xtests/tst-pam_unix1.sh
> -index f75bd84..72deac0 100755
> ---- a/xtests/tst-pam_unix1.sh
> -+++ b/xtests/tst-pam_unix1.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - /usr/sbin/useradd -p '!!' tstpamunix
> - ./tst-pam_unix1
> -diff --git a/xtests/tst-pam_unix2.sh b/xtests/tst-pam_unix2.sh
> -index 7093155..c04d6e6 100755
> ---- a/xtests/tst-pam_unix2.sh
> -+++ b/xtests/tst-pam_unix2.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - # pamunix0 = 0aXKZztA.d1KY
> - /usr/sbin/useradd -p 0aXKZztA.d1KY  tstpamunix
> -diff --git a/xtests/tst-pam_unix3.sh b/xtests/tst-pam_unix3.sh
> -index ef4a07c..b52db2b 100755
> ---- a/xtests/tst-pam_unix3.sh
> -+++ b/xtests/tst-pam_unix3.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - # pamunix01 = 0aXKZztA.d1KYIuFXArmd2jU
> - /usr/sbin/useradd -p 0aXKZztA.d1KYIuFXArmd2jU tstpamunix
> -diff --git a/xtests/tst-pam_unix4.sh b/xtests/tst-pam_unix4.sh
> -index 787c2f9..e7976fd 100755
> ---- a/xtests/tst-pam_unix4.sh
> -+++ b/xtests/tst-pam_unix4.sh
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - 
> - # pamunix01 = 0aXKZztA.d1KYIuFXArmd2jU
> - /usr/sbin/useradd -p 0aXKZztA.d1KYIuFXArmd2jU tstpamunix
> --- 
> -1.7.9.5
> -
> diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
> similarity index 95%
> rename from meta/recipes-extended/pam/libpam_1.3.0.bb
> rename to meta/recipes-extended/pam/libpam_1.3.1.bb
> index c124e3bb02..63ba0c16aa 100644
> --- a/meta/recipes-extended/pam/libpam_1.3.0.bb
> +++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
>                      file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
>                      "
>  
> -SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
> +SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux-PAM-${PV}.tar.xz \
>             file://99_pam \
>             file://pam.d/common-account \
>             file://pam.d/common-auth \
> @@ -23,12 +23,11 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
>             file://fixsepbuild.patch \
>             file://pam-security-abstract-securetty-handling.patch \
>             file://pam-unix-nullok-secure.patch \
> -           file://libpam-xtests-remove-bash-dependency.patch \
>             file://crypt_configure.patch \
>            "
>  
> -SRC_URI[md5sum] = "da4b2289b7cfb19583d54e9eaaef1c3a"
> -SRC_URI[sha256sum] = "241aed1ef522f66ed672719ecf2205ec513fd0075ed80cda8e086a5b1a01d1bb"
> +SRC_URI[md5sum] = "558ff53b0fc0563ca97f79e911822165"
> +SRC_URI[sha256sum] = "eff47a4ecd833fbf18de9686632a70ee8d0794b79aecb217ebd0ce11db4cd0db"
>  
>  SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcitonality.patch \
>                               file://include_paths_header.patch \
> @@ -45,8 +44,6 @@ EXTRA_OECONF = "--with-db-uniquename=_pam \
>  
>  CFLAGS_append = " -fPIC "
>  
> -PR = "r5"
> -
>  S = "${WORKDIR}/Linux-PAM-${PV}"
>  
>  inherit autotools gettext pkgconfig
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


