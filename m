Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65341C35278
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.13949.1646329343852142007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=oFZxTBRh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101017f50e02ae5-759c6cb1-2bdb-4108-9184-c85a82436e23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329343;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=dnNQn1aJInQ7aUDfQvLIWUyNZzhgFoh7JiSkatJBpd8=;
	b=oFZxTBRhzuQz5b5JxSomAUH22PCxZF0zf/9datAybUvvbYJx9BFllEaSyPlOCZ3o
	si2xVUK5crrvI71XhkStMBBCZKGZ+PCFzHw+6ei5uzobPo3OETe5J9xzLAQI1YfKb7K
	Xq+gj57RvqspZ42/0Z7uPlolWe7jDRdzcHWdKWrU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329343;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=dnNQn1aJInQ7aUDfQvLIWUyNZzhgFoh7JiSkatJBpd8=;
	b=VRVD3xOMdUHJqsMmgVI0ZqLHdSNxOTLoz7F2DKOcZduZHx/dXAohO4fEp1Ntqbx/
	qJUZ8GtL0AinsgetWAmTg6gSSd2zUbS54ZlSiUW43I6p9T4rbOztpwionWK6JGXtcgE
	5vtKgdjTdvC2biav6VePt+KkW4f9qLmu3CogjDzY=
Content-Type: multipart/mixed; boundary="===============3864215514758659397=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 8.9p1 FAILED
Message-ID: 
 <0101017f50e02ae5-759c6cb1-2bdb-4108-9184-c85a82436e23-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:22 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162672

--===============3864215514758659397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *8.9p1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-openssh-upgrade-8.8p1-8.9p1.patch
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
--===============3864215514758659397==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-8.8p1-8.9p1.patch"

From 2dd04ecb5bb331d91d5e5a71bf138145366a3163 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 12:11:47 +0000
Subject: [PATCH] openssh: upgrade 8.8p1 -> 8.9p1

---
 .../{openssh_8.8p1.bb => openssh_8.9p1.bb}    | 65 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.8p1.bb => openssh_8.9p1.bb} (72%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
similarity index 72%
rename from meta/recipes-connectivity/openssh/openssh_8.8p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 953c29dbf2..3892f1e60b 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -1,3 +1,64 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE
+# +++ LICENCE
+# @@ -210,22 +210,14 @@
+#  
+#  8) Portable OpenSSH contains the following additional licenses:
+#  
+# -    a) md5crypt.c, md5crypt.h
+# -
+# -	 * "THE BEER-WARE LICENSE" (Revision 42):
+# -	 * <phk@login.dknet.dk> wrote this file.  As long as you retain this
+# -	 * notice you can do whatever you want with this stuff. If we meet
+# -	 * some day, and you think this stuff is worth it, you can buy me a
+# -	 * beer in return.   Poul-Henning Kamp
+# -
+# -    b) snprintf replacement
+# +    a) snprintf replacement
+#  
+#  	* Copyright Patrick Powell 1995
+#  	* This code is based on code written by Patrick Powell
+#  	* (papowell@astart.com) It may be used for any purpose as long as this
+#  	* notice remains intact on all source code distributions
+#  
+# -    c) Compatibility code (openbsd-compat)
+# +    b) Compatibility code (openbsd-compat)
+#  
+#         Apart from the previously mentioned licenses, various pieces of code
+#         in the openbsd-compat/ subdirectory are licensed as follows:
+# @@ -314,8 +306,8 @@
+#  	* authorization.                                                           *
+#  	****************************************************************************/
+#  
+# -       The Blowfish cipher implementation is licensed by Niels Provis under
+# -       a 4-clause BSD license:
+# +       The Blowfish cipher implementation is licensed by Niels Provos under
+# +       a 3-clause BSD license:
+#  
+#           * Blowfish - a fast block cipher designed by Bruce Schneier
+#           *
+# @@ -330,10 +322,7 @@
+#           * 2. Redistributions in binary form must reproduce the above copyright
+#           *    notice, this list of conditions and the following disclaimer in the
+#           *    documentation and/or other materials provided with the distribution.
+# -         * 3. All advertising materials mentioning features or use of this software
+# -         *    must display the following acknowledgement:
+# -         *      This product includes software developed by Niels Provos.
+# -         * 4. The name of the author may not be used to endorse or promote products
+# +         * 3. The name of the author may not be used to endorse or promote products
+#           *    derived from this software without specific prior written permission.
+#           *
+#           * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+# 
+#
+
 SUMMARY = "A suite of security-related network utilities based on \
 the SSH protocol including the ssh client and sshd server"
 DESCRIPTION = "Secure rlogin/rsh/rcp/telnet replacement (OpenSSH) \
@@ -6,7 +67,7 @@ and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
 LICENSE = "BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & ISC & MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=d9d2753bdef9f19466dc7bc959114b11"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=8baf365614c9bdd63705f298c9afbfb9"
 
 DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -25,7 +86,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "4590890ea9bb9ace4f71ae331785a3a5823232435161960ed5fc86588f331fe9"
+SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE += "CVE-2007-2768"
-- 
2.27.0


--===============3864215514758659397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-bd0d9729be0ba57ad2a60a458f2ca4c64635907d"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bd0d9729be0ba57ad2a60a458f2ca4c64635907d"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 92 Local 0 Mirrors 0 Missed 92 Current 255 (0% match, 73% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 547 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 731 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 742 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_fetch)
NOTE: Running task 749 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: Running task 774 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_fetch)
NOTE: Running task 776 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 787 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_fetch)
NOTE: Running task 788 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 789 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_fetch)
NOTE: Running task 790 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 797 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: Running task 798 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_fetch)
NOTE: Running task 849 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
NOTE: Running task 850 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 867 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 879 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 881 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_fetch)
NOTE: Running task 882 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_fetch)
NOTE: Running task 907 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 911 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: Running task 912 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_fetch)
NOTE: Running task 913 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_fetch)
NOTE: Running task 959 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_fetch)
NOTE: Running task 985 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_deploy_source_date_epoch)
NOTE: Running task 986 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe perl-5.34.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.63-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: Running task 1005 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: Running task 1006 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 1007 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe perl-5.34.0-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_fetch: Started
NOTE: Running task 1008 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 1009 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_unpack)
NOTE: Running task 1010 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1011 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Succeeded
NOTE: recipe openssh-8.9p1-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: Running task 1012 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_unpack)
NOTE: Running task 1013 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: Running task 1014 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_unpack)
NOTE: Running task 1015 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe sudo-1.9.9-r0: task do_fetch: Started
NOTE: recipe rng-tools-6.15-r0: task do_fetch: Started
NOTE: recipe psmisc-23.4-r0: task do_fetch: Started
NOTE: Running task 1016 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 1017 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1018 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1019 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_unpack)
NOTE: recipe openssh-8.9p1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe libjitterentropy-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: Running task 1020 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_unpack)
NOTE: recipe glibc-locale-2.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sudo-1.9.9-r0: task do_fetch: Succeeded
NOTE: Running task 1021 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_unpack)
NOTE: Running task 1022 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_unpack)
NOTE: Running task 1023 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1024 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: Running task 1025 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: recipe rng-tools-6.15-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: Running task 1026 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1027 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1028 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_unpack)
NOTE: Running task 1029 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_unpack)
NOTE: Running task 1030 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1031 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1032 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 1033 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: Running task 1034 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.63-r0: task do_unpack: Started
NOTE: Running task 1035 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1036 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: Running task 1037 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1038 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_unpack)
NOTE: Running task 1039 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_unpack)
NOTE: Running task 1040 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.34.0-r0: task do_unpack: Started
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.63-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1041 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1042 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1043 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.11.1-r0: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_unpack: Started
NOTE: Running task 1044 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_unpack: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Succeeded
NOTE: recipe openssh-8.9p1-r0: task do_unpack: Started
NOTE: Running task 1046 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: Running task 1047 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_patch)
NOTE: recipe glibc-locale-2.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: Running task 1048 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.63-r0: task do_unpack: Succeeded
NOTE: recipe sudo-1.9.9-r0: task do_unpack: Started
NOTE: recipe rng-tools-6.15-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1049 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: Running task 1050 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe sudo-1.9.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Started
NOTE: recipe psmisc-23.4-r0: task do_unpack: Started
NOTE: recipe glibc-locale-2.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: Running noexec task 1051 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_configure)
NOTE: Running noexec task 1052 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_unpack: Succeeded
NOTE: Running task 1053 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_install)
NOTE: recipe libcap-2.63-r0: task do_patch: Started
NOTE: Running task 1054 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_patch)
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.8-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe libjitterentropy-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1055 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_patch)
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1057 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_patch)
NOTE: Running task 1058 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: Running task 1059 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: Running task 1060 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: recipe libjitterentropy-3.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe sudo-1.9.9-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rng-tools-6.15-r0: task do_unpack: Succeeded
NOTE: recipe openssh-8.9p1-r0: task do_unpack: Succeeded
NOTE: Running task 1061 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: Running task 1062 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1063 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1064 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_patch)
NOTE: Running task 1065 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.63-r0: task do_patch: Succeeded
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sudo-1.9.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1066 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1067 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1068 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_patch)
NOTE: Running task 1070 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1071 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_patch)
NOTE: Running task 1072 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: Running task 1073 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: Running task 1074 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_patch)
NOTE: Running task 1075 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_patch)
NOTE: Running task 1076 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_patch: Started
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: recipe glibc-locale-2.35-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe shadow-4.11.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.1.16-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe openssh-8.9p1-r0: task do_patch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.8-r0: task do_patch: Succeeded
NOTE: recipe libjitterentropy-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: Running task 1077 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1078 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sudo-1.9.9-r0: task do_patch: Started
NOTE: Running task 1079 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.4-r0: task do_patch: Started
NOTE: recipe rng-tools-6.15-r0: task do_patch: Started
NOTE: recipe coreutils-9.0-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rng-tools-6.15-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1081 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1082 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1083 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1084 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1085 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure)
NOTE: recipe libcap-2.63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rng-tools-6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1086 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1087 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_configure)
NOTE: recipe sysfsutils-2.1.0-r5: task do_patch: Succeeded
NOTE: recipe sudo-1.9.9-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running task 1088 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe openssh-8.9p1-r0: task do_patch: Succeeded
NOTE: Running task 1089 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1090 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1091 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_populate_lic)
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1092 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe base-passwd-3.5.29-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libcap-2.63-r0: task do_configure: Started
NOTE: Running task 1093 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_configure)
NOTE: recipe shadow-4.11.1-r0: task do_patch: Succeeded
NOTE: recipe libjitterentropy-3.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_configure: Started
NOTE: Running task 1094 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1095 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running noexec task 1096 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_configure)
NOTE: Running task 1097 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: recipe rng-tools-6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1098 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_configure: Succeeded
NOTE: recipe openssh-8.9p1-r0: task do_populate_lic: Started
NOTE: Running task 1099 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure)
NOTE: recipe openssh-8.9p1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe sed-4.8-r0: task do_configure: Started
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1100 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_compile)
NOTE: recipe libjitterentropy-3.3.1-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1101 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1102 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: Running task 1103 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_configure)
NOTE: Running task 1104 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_patch: Succeeded
NOTE: recipe openssh-8.9p1-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-2.63-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_populate_lic unihash changed to 75c62ae0b1633ca30a7f62e4e50f33aa918a269238ef2a2bdb69fd776058bf47
NOTE: Running task 1105 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1106 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: Running task 1107 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_configure)
NOTE: recipe psmisc-23.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1108 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe openssh-8.9p1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sudo-1.9.9-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_compile: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1109 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1110 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe bash-5.1.16-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libjitterentropy-3.3.1-r0: task do_install: Started
NOTE: recipe coreutils-9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1112 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 1113 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1114 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1115 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe make-4.3-r0: task do_configure: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_install: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_patch: Succeeded
NOTE: Running task 1116 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1117 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: Running task 1118 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1119 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_configure)
NOTE: recipe libjitterentropy-3.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_package: Started
NOTE: recipe perl-5.34.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 1120 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe bash-5.1.16-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe perl-5.34.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1121 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure)
NOTE: recipe perl-5.34.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcap-2.63-r0: task do_compile: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_configure: Succeeded
NOTE: Running task 1122 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_install)
NOTE: Running task 1123 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_compile)
NOTE: recipe base-passwd-3.5.29-r0: task do_compile: Started
NOTE: recipe libcap-2.63-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1124 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_package: Succeeded
NOTE: Running task 1125 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb:do_packagedata)
NOTE: recipe base-passwd-3.5.29-r0: task do_compile: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Running task 1126 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_install)
NOTE: recipe libjitterentropy-3.3.1-r0: task do_packagedata: Started
NOTE: Running task 1127 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Started
NOTE: recipe libjitterentropy-3.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_install: Succeeded
NOTE: Running task 1128 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.63-r0: task do_install: Succeeded
NOTE: Running task 1129 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot)
NOTE: Running task 1130 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_package)
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.63-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1131 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1132 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1133 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1134 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1135 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1136 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Succeeded
NOTE: Running task 1137 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Started
NOTE: recipe libcap-2.63-r0: task do_package: Succeeded
NOTE: Running task 1138 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata)
NOTE: recipe libcap-2.63-r0: task do_packagedata: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_install: Succeeded
NOTE: Running task 1139 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package)
NOTE: recipe glibc-locale-2.35-r0: task do_package: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_configure: Succeeded
NOTE: Running task 1140 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_compile)
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Started
NOTE: recipe psmisc-23.4-r0: task do_configure: Succeeded
NOTE: Running task 1141 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_compile)
NOTE: recipe psmisc-23.4-r0: task do_compile: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_compile: Succeeded
NOTE: Running task 1142 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure_ptest_base)
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe psmisc-23.4-r0: task do_compile: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1144 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_install)
NOTE: Running task 1145 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_compile: Started
NOTE: recipe psmisc-23.4-r0: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_install: Succeeded
NOTE: Running task 1146 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_package)
NOTE: Running task 1147 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_populate_sysroot)
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1148 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile_ptest_base)
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1149 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_install: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 1150 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe psmisc-23.4-r0: task do_install: Succeeded
NOTE: Running task 1151 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package)
NOTE: recipe rng-tools-6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_package: Started
NOTE: recipe rng-tools-6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1152 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_configure)
NOTE: recipe rng-tools-6.15-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 1153 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install_ptest_base)
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1154 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot)
NOTE: Running task 1155 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1156 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1157 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package: Succeeded
NOTE: Running task 1158 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1159 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Started
NOTE: recipe shadow-4.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1160 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_configure)
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: recipe shadow-4.11.1-r0: task do_configure: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata: Succeeded
NOTE: recipe make-4.3-r0: task do_configure: Succeeded
NOTE: Running task 1161 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_compile)
NOTE: recipe make-4.3-r0: task do_compile: Started
NOTE: recipe psmisc-23.4-r0: task do_package: Succeeded
NOTE: Running task 1162 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_compile: Succeeded
NOTE: Running task 1163 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: recipe make-4.3-r0: task do_install: Started
NOTE: Running task 1164 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 1165 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Succeeded
NOTE: recipe make-4.3-r0: task do_install: Succeeded
NOTE: Running task 1166 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe rng-tools-6.15-r0: task do_configure: Succeeded
NOTE: Running task 1167 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_compile)
NOTE: recipe rng-tools-6.15-r0: task do_compile: Started
NOTE: recipe rng-tools-6.15-r0: task do_compile: Succeeded
NOTE: Running task 1168 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_install)
NOTE: recipe rng-tools-6.15-r0: task do_install: Started
NOTE: recipe rng-tools-6.15-r0: task do_install: Succeeded
NOTE: Running task 1169 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_package)
NOTE: recipe rng-tools-6.15-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata)
NOTE: recipe make-4.3-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.15-r0: task do_package: Succeeded
NOTE: Running task 1172 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_packagedata)
NOTE: recipe rng-tools-6.15-r0: task do_packagedata: Started
NOTE: recipe rng-tools-6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1173 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools/rng-tools_6.15.bb:do_package_write_rpm)
NOTE: recipe rng-tools-6.15-r0: task do_package_write_rpm: Started
NOTE: recipe rng-tools-6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1175 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_configure: Succeeded
NOTE: Running task 1176 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_configure_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.1.16-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1177 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_compile)
NOTE: recipe bash-5.1.16-r0: task do_compile: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1178 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1179 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile)
NOTE: recipe gawk-5.1.1-r0: task do_compile: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sudo-1.9.9-r0: task do_configure: Succeeded
NOTE: Running task 1180 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_compile)
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1181 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe sudo-1.9.9-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1182 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: recipe sed-4.8-r0: task do_configure: Succeeded
NOTE: Running task 1183 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_configure_ptest_base)
NOTE: recipe sed-4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1184 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_compile)
NOTE: recipe sed-4.8-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 1185 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1186 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot)
NOTE: Running task 1187 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_compile: Succeeded
NOTE: Running task 1188 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_compile_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_compile_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1189 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe sed-4.8-r0: task do_compile: Succeeded
NOTE: Running task 1190 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_compile_ptest_base)
NOTE: recipe sed-4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1191 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_install)
NOTE: recipe sed-4.8-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 1192 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1193 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1194 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_install: Started
NOTE: recipe sed-4.8-r0: task do_install: Succeeded
NOTE: Running task 1195 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_install_ptest_base)
NOTE: recipe sed-4.8-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1196 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe bash-5.1.16-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: Running task 1197 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_install)
NOTE: recipe bash-5.1.16-r0: task do_install: Started
NOTE: recipe shadow-4.11.1-r0: task do_configure: Succeeded
NOTE: Running task 1198 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_compile)
NOTE: recipe shadow-4.11.1-r0: task do_compile: Started
NOTE: recipe gawk-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 1199 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1200 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe sudo-1.9.9-r0: task do_compile: Succeeded
NOTE: Running task 1201 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_install)
NOTE: recipe sudo-1.9.9-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1202 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1203 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1204 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.1.16-r0: task do_install: Succeeded
NOTE: Running task 1205 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_install_ptest_base: Started
NOTE: recipe shadow-4.11.1-r0: task do_compile: Succeeded
NOTE: Running task 1206 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_install)
NOTE: recipe coreutils-9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1207 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_configure)
NOTE: recipe shadow-4.11.1-r0: task do_install: Started
NOTE: recipe coreutils-9.0-r0: task do_configure: Started
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Running task 1208 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1209 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_install: Succeeded
NOTE: Running task 1210 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot)
NOTE: Running task 1211 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_package)
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.11.1-r0: task do_package: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1212 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: recipe openssh-8.9p1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1213 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe openssh-8.9p1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1214 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe openssh-8.9p1-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1215 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package)
NOTE: recipe bash-5.1.16-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1216 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1217 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe shadow-4.11.1-r0: task do_package: Succeeded
NOTE: recipe sudo-1.9.9-r0: task do_install: Succeeded
NOTE: Running task 1218 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata)
NOTE: Running task 1219 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_package)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata: Started
NOTE: recipe sudo-1.9.9-r0: task do_package: Started
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 1220 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package: Succeeded
NOTE: Running task 1221 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata)
NOTE: recipe bash-5.1.16-r0: task do_packagedata: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1222 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1223 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe sudo-1.9.9-r0: task do_package: Succeeded
NOTE: Running task 1224 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_packagedata)
NOTE: recipe sudo-1.9.9-r0: task do_packagedata: Started
NOTE: recipe sudo-1.9.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1225 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sudo/sudo_1.9.9.bb:do_package_write_rpm)
NOTE: recipe sudo-1.9.9-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 1226 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1227 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 1228 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe sudo-1.9.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_configure: Succeeded
NOTE: Running task 1229 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.34.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.34.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1230 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_compile)
NOTE: recipe perl-5.34.0-r0: task do_compile: Started
NOTE: recipe openssh-8.9p1-r0: task do_configure: Succeeded
NOTE: Running task 1231 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_configure_ptest_base)
NOTE: recipe openssh-8.9p1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssh-8.9p1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1232 of 1268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_compile)
NOTE: recipe openssh-8.9p1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| conffile=`echo sshd_config.out | sed 's/.out$//'`; \
| sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ./${conffile} > sshd_config.out
| conffile=`echo ssh_config.out | sed 's/.out$//'`; \
| sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ./${conffile} > ssh_config.out
| conffile=`echo moduli.out | sed 's/.out$//'`; \
| sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ./${conffile} > moduli.out
| if test "cat" = "cat"; then \
| 	manpage=./`echo moduli.5.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo moduli.5.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > moduli.5.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > moduli.5.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo scp.1.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo scp.1.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > scp.1.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > scp.1.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh-add.1.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh-add.1.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh-add.1.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh-add.1.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh-agent.1.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh-agent.1.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh-agent.1.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh-agent.1.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh-keygen.1.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh-keygen.1.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh-keygen.1.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh-keygen.1.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh-keyscan.1.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh-keyscan.1.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh-keyscan.1.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh-keyscan.1.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh.1.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh.1.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh.1.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh.1.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo sshd.8.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo sshd.8.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > sshd.8.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > sshd.8.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo sftp-server.8.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo sftp-server.8.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > sftp-server.8.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > sftp-server.8.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo sftp.1.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo sftp.1.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > sftp.1.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > sftp.1.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh-keysign.8.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh-keysign.8.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh-keysign.8.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh-keysign.8.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh-pkcs11-helper.8.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh-pkcs11-helper.8.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh-pkcs11-helper.8.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh-pkcs11-helper.8.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh-sk-helper.8.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh-sk-helper.8.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh-sk-helper.8.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh-sk-helper.8.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo sshd_config.5.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo sshd_config.5.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > sshd_config.5.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > sshd_config.5.out; \
| fi
| if test "cat" = "cat"; then \
| 	manpage=./`echo ssh_config.5.out | sed 's/\.[1-9]\.out$/\.0/'`; \
| else \
| 	manpage=./`echo ssh_config.5.out | sed 's/\.out$//'`; \
| fi; \
| if test "cat" = "man"; then \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  | \
| 	    gawk -f ./mdoc2man.awk > ssh_config.5.out; \
| else \
| 	sed -e 's|/etc/ssh/ssh_config|/etc/ssh/ssh_config|g' -e 's|/etc/ssh/ssh_known_hosts|/etc/ssh/ssh_known_hosts|g' -e 's|/etc/ssh/sshd_config|/etc/ssh/sshd_config|g' -e 's|/usr/libexec|/usr/libexec|g' -e 's|/etc/shosts.equiv|/etc/ssh/shosts.equiv|g' -e 's|/etc/ssh/ssh_host_key|/etc/ssh/ssh_host_key|g' -e 's|/etc/ssh/ssh_host_ecdsa_key|/etc/ssh/ssh_host_ecdsa_key|g' -e 's|/etc/ssh/ssh_host_dsa_key|/etc/ssh/ssh_host_dsa_key|g' -e 's|/etc/ssh/ssh_host_rsa_key|/etc/ssh/ssh_host_rsa_key|g' -e 's|/etc/ssh/ssh_host_ed25519_key|/etc/ssh/ssh_host_ed25519_key|g' -e 's|/var/run/sshd.pid|/var/run/sshd.pid|g' -e 's|/etc/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/moduli|/etc/ssh/moduli|g' -e 's|/etc/ssh/sshrc|/etc/ssh/sshrc|g' -e 's|/usr/X11R6/bin/xauth|/usr/bin/xauth|g' -e 's|/var/empty|/var/run/sshd|g' -e 's|/usr/bin:/bin:/usr/sbin:/sbin|/usr/bin:/bin:/usr/sbin:/sbin|g' ${manpage} | /bin/sh ./fixalgorithms sed  > ssh_config.5.out; \
| fi
| (cd openbsd-compat && make)
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset -fPIE   -I. -I.  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DSSHDIR=\"/etc/ssh\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/libexec/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/libexec/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/libexec/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/libexec/ssh-pkcs11-helper\" -D_PATH_SSH_SK_HELPER=\"/usr/libexec/ssh-sk-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/run/sshd\" -DHAVE_CONFIG_H -c ssh_api.c -o ssh_api.o
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset -fPIE   -I. -I.  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DSSHDIR=\"/etc/ssh\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/libexec/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/libexec/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/libexec/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/libexec/ssh-pkcs11-helper\" -D_PATH_SSH_SK_HELPER=\"/usr/libexec/ssh-sk-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/run/sshd\" -DHAVE_CONFIG_H -c ssherr.c -o ssherr.o
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat'
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c arc4random.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-asprintf.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset -fPIE   -I. -I.  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DSSHDIR=\"/etc/ssh\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/libexec/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/libexec/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/libexec/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/libexec/ssh-pkcs11-helper\" -D_PATH_SSH_SK_HELPER=\"/usr/libexec/ssh-sk-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/run/sshd\" -DHAVE_CONFIG_H -c sshbuf.c -o sshbuf.o
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-closefrom.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-cygwin_util.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset -fPIE   -I. -I.  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DSSHDIR=\"/etc/ssh\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/libexec/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/libexec/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/libexec/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/libexec/ssh-pkcs11-helper\" -D_PATH_SSH_SK_HELPER=\"/usr/libexec/ssh-sk-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/run/sshd\" -DHAVE_CONFIG_H -c sshkey.c -o sshkey.o
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-err.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-flock.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset -fPIE   -I. -I.  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DSSHDIR=\"/etc/ssh\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/libexec/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/libexec/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/libexec/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/libexec/ssh-pkcs11-helper\" -D_PATH_SSH_SK_HELPER=\"/usr/libexec/ssh-sk-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/run/sshd\" -DHAVE_CONFIG_H -c sshbuf-getput-basic.c -o sshbuf-getput-basic.o
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-getline.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-getpagesize.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset -fPIE   -I. -I.  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DSSHDIR=\"/etc/ssh\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/libexec/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/libexec/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/libexec/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/libexec/ssh-pkcs11-helper\" -D_PATH_SSH_SK_HELPER=\"/usr/libexec/ssh-sk-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/run/sshd\" -DHAVE_CONFIG_H -c sshbuf-misc.c -o sshbuf-misc.o
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-getpeereid.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-malloc.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-misc.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset -fPIE   -I. -I.  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DSSHDIR=\"/etc/ssh\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/libexec/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/libexec/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/libexec/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/libexec/ssh-pkcs11-helper\" -D_PATH_SSH_SK_HELPER=\"/usr/libexec/ssh-sk-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/run/sshd\" -DHAVE_CONFIG_H -c sshbuf-getput-crypto.c -o sshbuf-getput-crypto.o
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-nextstep.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-openpty.c
| ssherr.c: In function 'ssh_err':
| ssherr.c:151:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|   151 | }
|       | ^
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-poll.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-pselect.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset -fPIE   -I. -I.  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DSSHDIR=\"/etc/ssh\" -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\" -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/libexec/ssh-askpass\" -D_PATH_SFTP_SERVER=\"/usr/libexec/sftp-server\" -D_PATH_SSH_KEY_SIGN=\"/usr/libexec/ssh-keysign\" -D_PATH_SSH_PKCS11_HELPER=\"/usr/libexec/ssh-pkcs11-helper\" -D_PATH_SSH_SK_HELPER=\"/usr/libexec/ssh-sk-helper\" -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/run/sshd\" -DHAVE_CONFIG_H -c krl.c -o krl.o
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-setres_id.c
| make: *** [Makefile:200: ssherr.o] Error 1
| make: *** Waiting for unfinished jobs....
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-signal.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-snprintf.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-statvfs.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c bsd-waitpid.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c fake-rfc2553.c
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c getrrsetbyname-ldns.c
| bsd-getpeereid.c: In function 'getpeereid':
| bsd-getpeereid.c:39:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|    39 | }
|       | ^
| arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0=/usr/src/debug/openssh/8.9p1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortex
 a15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot-native=  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./..  -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -DHAVE_CONFIG_H -c kludge-fd_set.c
| make[1]: *** [Makefile:104: bsd-getpeereid.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| bsd-misc.c: In function 'ssh_get_progname':
| bsd-misc.c:65:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|    65 | }
|       | ^
| make[1]: *** [Makefile:104: bsd-misc.o] Error 1
| sshbuf.c: In function 'sshbuf_maybe_pack':
| sshbuf.c:66:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|    66 | }
|       | ^
| bsd-closefrom.c: In function 'closefrom':
| bsd-closefrom.c:151:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|   151 | }
|       | ^
| make[1]: *** [Makefile:104: bsd-closefrom.o] Error 1
| sshbuf-getput-crypto.c: In function 'sshbuf_get_eckey':
| sshbuf-getput-crypto.c:97:9: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|    97 |         EC_POINT *pt = EC_POINT_new(EC_KEY_get0_group(v));
|       |         ^~~~~~~~
| In file included from sshbuf-getput-crypto.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshbuf-getput-crypto.c:110:9: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   110 |         if ((r = get_ec(d, len, pt, EC_KEY_get0_group(v))) != 0) {
|       |         ^~
| In file included from sshbuf-getput-crypto.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshbuf-getput-crypto.c:114:9: warning: 'EC_KEY_set_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   114 |         if (EC_KEY_set_public_key(v, pt) != 1) {
|       |         ^~
| In file included from sshbuf-getput-crypto.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1068:27: note: declared here
|  1068 | OSSL_DEPRECATEDIN_3_0 int EC_KEY_set_public_key(EC_KEY *key, const EC_POINT *pub);
|       |                           ^~~~~~~~~~~~~~~~~~~~~
| sshbuf-getput-crypto.c: In function 'sshbuf_put_eckey':
| sshbuf-getput-crypto.c:176:9: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   176 |         return sshbuf_put_ec(buf, EC_KEY_get0_public_key(v),
|       |         ^~~~~~
| In file included from sshbuf-getput-crypto.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshbuf-getput-crypto.c:177:13: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   177 |             EC_KEY_get0_group(v));
|       |             ^~~~~~~~~~~~~~~~~
| In file included from sshbuf-getput-crypto.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| kludge-fd_set.c: In function 'kludge_FD_SET':
| kludge-fd_set.c:21:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|    21 | }
|       | ^
| sshbuf-getput-basic.c: In function 'check_woffset.constprop':
| sshbuf-getput-basic.c:451:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|   451 | }
|       | ^
| make[1]: *** [Makefile:104: kludge-fd_set.o] Error 1
| ssh_api.c: In function '_ssh_host_public_key':
| ssh_api.c:479:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|   479 | }
|       | ^
| sshbuf-getput-crypto.c: In function 'sshbuf_get_bignum2':
| sshbuf-getput-crypto.c:56:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|    56 | }
|       | ^
| make: *** [Makefile:200: sshbuf-getput-crypto.o] Error 1
| In file included from arc4random.c:52:
| chacha_private.h: In function 'chacha_encrypt_bytes.constprop':
| chacha_private.h:222:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|   222 | }
|       | ^
| sshkey.c: In function 'sshkey_size':
| sshkey.c:359:17: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   359 |                 RSA_get0_key(k->rsa, &rsa_n, NULL, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| sshkey.c:365:17: warning: 'DSA_get0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   365 |                 DSA_get0_pqg(k->dsa, &dsa_p, NULL, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_pqg(const DSA *d, const BIGNUM **p,
|       |                            ^~~~~~~~~~~~
| sshkey.c: In function 'sshkey_new':
| sshkey.c:597:17: warning: 'RSA_new' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   597 |                 if ((rsa = RSA_new()) == NULL) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 RSA *RSA_new(void);
|       |                            ^~~~~~~
| sshkey.c:605:17: warning: 'DSA_new' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   605 |                 if ((dsa = DSA_new()) == NULL) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:125:28: note: declared here
|   125 | OSSL_DEPRECATEDIN_3_0 DSA *DSA_new(void);
|       |                            ^~~~~~~
| sshkey.c: In function 'sshkey_free':
| sshkey.c:652:17: warning: 'RSA_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   652 |                 RSA_free(k->rsa);
|       |                 ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:293:28: note: declared here
|   293 | OSSL_DEPRECATEDIN_3_0 void RSA_free(RSA *r);
|       |                            ^~~~~~~~
| sshkey.c:657:17: warning: 'DSA_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   657 |                 DSA_free(k->dsa);
|       |                 ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:127:28: note: declared here
|   127 | OSSL_DEPRECATEDIN_3_0 void DSA_free(DSA *r);
|       |                            ^~~~~~~~
| sshkey.c:669:17: warning: 'EC_KEY_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   669 |                 EC_KEY_free(k->ecdsa);
|       |                 ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1001:28: note: declared here
|  1001 | OSSL_DEPRECATEDIN_3_0 void EC_KEY_free(EC_KEY *key);
|       |                            ^~~~~~~~~~~
| sshkey.c: In function 'sshkey_equal_public':
| sshkey.c:752:17: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   752 |                 RSA_get0_key(a->rsa, &rsa_n_a, &rsa_e_a, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| sshkey.c:753:17: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   753 |                 RSA_get0_key(b->rsa, &rsa_n_b, &rsa_e_b, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| sshkey.c:760:17: warning: 'DSA_get0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   760 |                 DSA_get0_pqg(a->dsa, &dsa_p_a, &dsa_q_a, &dsa_g_a);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_pqg(const DSA *d, const BIGNUM **p,
|       |                            ^~~~~~~~~~~~
| sshkey.c:761:17: warning: 'DSA_get0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   761 |                 DSA_get0_pqg(b->dsa, &dsa_p_b, &dsa_q_b, &dsa_g_b);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_pqg(const DSA *d, const BIGNUM **p,
|       |                            ^~~~~~~~~~~~
| sshkey.c:762:17: warning: 'DSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   762 |                 DSA_get0_key(a->dsa, &dsa_pub_key_a, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:204:28: note: declared here
|   204 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
|       |                            ^~~~~~~~~~~~
| sshkey.c:763:17: warning: 'DSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   763 |                 DSA_get0_key(b->dsa, &dsa_pub_key_b, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:204:28: note: declared here
|   204 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
|       |                            ^~~~~~~~~~~~
| sshkey.c:779:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   779 |                     EC_KEY_get0_public_key(a->ecdsa) == NULL ||
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:780:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   780 |                     EC_KEY_get0_public_key(b->ecdsa) == NULL)
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:782:17: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   782 |                 if (EC_GROUP_cmp(EC_KEY_get0_group(a->ecdsa),
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:783:21: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   783 |                     EC_KEY_get0_group(b->ecdsa), NULL) != 0 ||
|       |                     ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:784:21: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   784 |                     EC_POINT_cmp(EC_KEY_get0_group(a->ecdsa),
|       |                     ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:785:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   785 |                     EC_KEY_get0_public_key(a->ecdsa),
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:786:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   786 |                     EC_KEY_get0_public_key(b->ecdsa), NULL) != 0)
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c: In function 'to_blob_buf':
| sshkey.c:870:17: warning: 'DSA_get0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   870 |                 DSA_get0_pqg(key->dsa, &dsa_p, &dsa_q, &dsa_g);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_pqg(const DSA *d, const BIGNUM **p,
|       |                            ^~~~~~~~~~~~
| sshkey.c:871:17: warning: 'DSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   871 |                 DSA_get0_key(key->dsa, &dsa_pub_key, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:204:28: note: declared here
|   204 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
|       |                            ^~~~~~~~~~~~
| sshkey.c:899:17: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   899 |                 RSA_get0_key(key->rsa, &rsa_n, &rsa_e, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| make: *** [Makefile:200: sshbuf.o] Error 1
| sshkey.c: In function 'sshkey_read':
| sshkey.c:1438:17: warning: 'RSA_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1438 |                 RSA_free(ret->rsa);
|       |                 ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:293:28: note: declared here
|   293 | OSSL_DEPRECATEDIN_3_0 void RSA_free(RSA *r);
|       |                            ^~~~~~~~
| sshkey.c:1446:17: warning: 'DSA_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1446 |                 DSA_free(ret->dsa);
|       |                 ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:127:28: note: declared here
|   127 | OSSL_DEPRECATEDIN_3_0 void DSA_free(DSA *r);
|       |                            ^~~~~~~~
| sshkey.c:1455:17: warning: 'EC_KEY_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1455 |                 EC_KEY_free(ret->ecdsa);
|       |                 ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1001:28: note: declared here
|  1001 | OSSL_DEPRECATEDIN_3_0 void EC_KEY_free(EC_KEY *key);
|       |                            ^~~~~~~~~~~
| sshkey.c:1465:17: warning: 'EC_KEY_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1465 |                 EC_KEY_free(ret->ecdsa);
|       |                 ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1001:28: note: declared here
|  1001 | OSSL_DEPRECATEDIN_3_0 void EC_KEY_free(EC_KEY *key);
|       |                            ^~~~~~~~~~~
| sshkey.c: In function 'rsa_generate_private_key':
| sshkey.c:1621:9: warning: 'RSA_new' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1621 |         if ((private = RSA_new()) == NULL || (f4 = BN_new()) == NULL) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 RSA *RSA_new(void);
|       |                            ^~~~~~~
| sshkey.c:1626:13: warning: 'RSA_generate_key_ex' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1626 |             !RSA_generate_key_ex(private, bits, f4, NULL)) {
|       |             ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:260:27: note: declared here
|   260 | OSSL_DEPRECATEDIN_3_0 int RSA_generate_key_ex(RSA *rsa, int bits, BIGNUM *e,
|       |                           ^~~~~~~~~~~~~~~~~~~
| sshkey.c:1634:9: warning: 'RSA_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1634 |         RSA_free(private);
|       |         ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:293:28: note: declared here
|   293 | OSSL_DEPRECATEDIN_3_0 void RSA_free(RSA *r);
|       |                            ^~~~~~~~
| sshkey.c: In function 'dsa_generate_private_key':
| sshkey.c:1649:9: warning: 'DSA_new' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1649 |         if ((private = DSA_new()) == NULL) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:125:28: note: declared here
|   125 | OSSL_DEPRECATEDIN_3_0 DSA *DSA_new(void);
|       |                            ^~~~~~~
| sshkey.c:1654:9: warning: 'DSA_generate_parameters_ex' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1654 |         if (!DSA_generate_parameters_ex(private, bits, NULL, 0, NULL,
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:167:27: note: declared here
|   167 | OSSL_DEPRECATEDIN_3_0 int DSA_generate_parameters_ex(DSA *dsa, int bits,
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:1655:13: warning: 'DSA_generate_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1655 |             NULL, NULL) || !DSA_generate_key(private)) {
|       |             ^~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:174:27: note: declared here
|   174 | OSSL_DEPRECATEDIN_3_0 int DSA_generate_key(DSA *a);
|       |                           ^~~~~~~~~~~~~~~~
| sshkey.c:1663:9: warning: 'DSA_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1663 |         DSA_free(private);
|       |         ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:127:28: note: declared here
|   127 | OSSL_DEPRECATEDIN_3_0 void DSA_free(DSA *r);
|       |                            ^~~~~~~~
| sshkey.c: In function 'sshkey_ecdsa_key_to_nid':
| sshkey.c:1682:9: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1682 |         const EC_GROUP *g = EC_KEY_get0_group(k);
|       |         ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:1704:17: warning: 'EC_KEY_set_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1704 |                 if (EC_KEY_set_group(k, eg) != 1) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1040:27: note: declared here
|  1040 | OSSL_DEPRECATEDIN_3_0 int EC_KEY_set_group(EC_KEY *key, const EC_GROUP *group);
|       |                           ^~~~~~~~~~~~~~~~
| sshkey.c: In function 'ecdsa_generate_private_key':
| sshkey.c:1723:9: warning: 'EC_KEY_new_by_curve_name' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1723 |         if ((private = EC_KEY_new_by_curve_name(*nid)) == NULL) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:996:31: note: declared here
|   996 | OSSL_DEPRECATEDIN_3_0 EC_KEY *EC_KEY_new_by_curve_name(int nid);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:1727:9: warning: 'EC_KEY_generate_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1727 |         if (EC_KEY_generate_key(private) != 1) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1099:27: note: declared here
|  1099 | OSSL_DEPRECATEDIN_3_0 int EC_KEY_generate_key(EC_KEY *key);
|       |                           ^~~~~~~~~~~~~~~~~~~
| sshkey.c:1731:9: warning: 'EC_KEY_set_asn1_flag' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1731 |         EC_KEY_set_asn1_flag(private, OPENSSL_EC_NAMED_CURVE);
|       |         ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1085:28: note: declared here
|  1085 | OSSL_DEPRECATEDIN_3_0 void EC_KEY_set_asn1_flag(EC_KEY *eckey, int asn1_flag);
|       |                            ^~~~~~~~~~~~~~~~~~~~
| sshkey.c:1736:9: warning: 'EC_KEY_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1736 |         EC_KEY_free(private);
|       |         ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1001:28: note: declared here
|  1001 | OSSL_DEPRECATEDIN_3_0 void EC_KEY_free(EC_KEY *key);
|       |                            ^~~~~~~~~~~
| make: *** [Makefile:200: ssh_api.o] Error 1
| sshkey.c: In function 'sshkey_from_private':
| sshkey.c:1885:17: warning: 'DSA_get0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1885 |                 DSA_get0_pqg(k->dsa, &dsa_p, &dsa_q, &dsa_g);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_pqg(const DSA *d, const BIGNUM **p,
|       |                            ^~~~~~~~~~~~
| sshkey.c:1886:17: warning: 'DSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1886 |                 DSA_get0_key(k->dsa, &dsa_pub_key, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:204:28: note: declared here
|   204 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
|       |                            ^~~~~~~~~~~~
| sshkey.c:1894:17: warning: 'DSA_set0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1894 |                 if (!DSA_set0_pqg(n->dsa, dsa_p_dup, dsa_q_dup, dsa_g_dup)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:203:27: note: declared here
|   203 | OSSL_DEPRECATEDIN_3_0 int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g);
|       |                           ^~~~~~~~~~~~
| sshkey.c:1899:17: warning: 'DSA_set0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1899 |                 if (!DSA_set0_key(n->dsa, dsa_pub_key_dup, NULL)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:206:27: note: declared here
|   206 | OSSL_DEPRECATEDIN_3_0 int DSA_set0_key(DSA *d, BIGNUM *pub_key,
|       |                           ^~~~~~~~~~~~
| sshkey.c:1912:17: warning: 'EC_KEY_new_by_curve_name' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1912 |                 n->ecdsa = EC_KEY_new_by_curve_name(k->ecdsa_nid);
|       |                 ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:996:31: note: declared here
|   996 | OSSL_DEPRECATEDIN_3_0 EC_KEY *EC_KEY_new_by_curve_name(int nid);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:1917:17: warning: 'EC_KEY_set_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1917 |                 if (EC_KEY_set_public_key(n->ecdsa,
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1068:27: note: declared here
|  1068 | OSSL_DEPRECATEDIN_3_0 int EC_KEY_set_public_key(EC_KEY *key, const EC_POINT *pub);
|       |                           ^~~~~~~~~~~~~~~~~~~~~
| sshkey.c:1918:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1918 |                     EC_KEY_get0_public_key(k->ecdsa)) != 1) {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:1931:17: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1931 |                 RSA_get0_key(k->rsa, &rsa_n, &rsa_e, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| sshkey.c:1937:17: warning: 'RSA_set0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1937 |                 if (!RSA_set0_key(n->rsa, rsa_n_dup, rsa_e_dup, NULL)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:207:27: note: declared here
|   207 | OSSL_DEPRECATEDIN_3_0 int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);
|       |                           ^~~~~~~~~~~~
| sshkey.c: In function 'check_rsa_length':
| sshkey.c:2357:9: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2357 |         RSA_get0_key(rsa, &rsa_n, NULL, NULL);
|       |         ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| make: *** [Makefile:200: sshbuf-getput-basic.o] Error 1
| sshkey.c: In function 'sshkey_from_blob_internal':
| sshkey.c:2420:17: warning: 'RSA_set0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2420 |                 if (!RSA_set0_key(key->rsa, rsa_n, rsa_e, NULL)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:207:27: note: declared here
|   207 | OSSL_DEPRECATEDIN_3_0 int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);
|       |                           ^~~~~~~~~~~~
| sshkey.c:2450:17: warning: 'DSA_set0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2450 |                 if (!DSA_set0_pqg(key->dsa, dsa_p, dsa_q, dsa_g)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:203:27: note: declared here
|   203 | OSSL_DEPRECATEDIN_3_0 int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g);
|       |                           ^~~~~~~~~~~~
| sshkey.c:2455:17: warning: 'DSA_set0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2455 |                 if (!DSA_set0_key(key->dsa, dsa_pub_key, NULL)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:206:27: note: declared here
|   206 | OSSL_DEPRECATEDIN_3_0 int DSA_set0_key(DSA *d, BIGNUM *pub_key,
|       |                           ^~~~~~~~~~~~
| sshkey.c:2488:17: warning: 'EC_KEY_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2488 |                 EC_KEY_free(key->ecdsa);
|       |                 ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1001:28: note: declared here
|  1001 | OSSL_DEPRECATEDIN_3_0 void EC_KEY_free(EC_KEY *key);
|       |                            ^~~~~~~~~~~
| sshkey.c:2489:17: warning: 'EC_KEY_new_by_curve_name' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2489 |                 if ((key->ecdsa = EC_KEY_new_by_curve_name(key->ecdsa_nid))
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:996:31: note: declared here
|   996 | OSSL_DEPRECATEDIN_3_0 EC_KEY *EC_KEY_new_by_curve_name(int nid);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:2494:17: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2494 |                 if ((q = EC_POINT_new(EC_KEY_get0_group(key->ecdsa))) == NULL) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:2498:17: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2498 |                 if (sshbuf_get_ec(b, q, EC_KEY_get0_group(key->ecdsa)) != 0) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:2502:17: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2502 |                 if (sshkey_ec_validate_public(EC_KEY_get0_group(key->ecdsa),
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat'
| sshkey.c:2507:17: warning: 'EC_KEY_set_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2507 |                 if (EC_KEY_set_public_key(key->ecdsa, q) != 1) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1068:27: note: declared here
|  1068 | OSSL_DEPRECATEDIN_3_0 int EC_KEY_set_public_key(EC_KEY *key, const EC_POINT *pub);
|       |                           ^~~~~~~~~~~~~~~~~~~~~
| make[1]: *** [Makefile:104: arc4random.o] Error 1
| make: *** [Makefile:204: openbsd-compat/libopenbsd-compat.a] Error 2
| sshkey.c: In function 'sshkey_certify_custom':
| sshkey.c:2975:17: warning: 'DSA_get0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2975 |                 DSA_get0_pqg(k->dsa, &dsa_p, &dsa_q, &dsa_g);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_pqg(const DSA *d, const BIGNUM **p,
|       |                            ^~~~~~~~~~~~
| sshkey.c:2976:17: warning: 'DSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2976 |                 DSA_get0_key(k->dsa, &dsa_pub_key, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:204:28: note: declared here
|   204 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
|       |                            ^~~~~~~~~~~~
| sshkey.c:2989:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2989 |                     EC_KEY_get0_public_key(k->ecdsa),
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:2990:21: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2990 |                     EC_KEY_get0_group(k->ecdsa))) != 0)
|       |                     ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshbuf-misc.c: In function 'sshbuf_dump_data':
| sshbuf-misc.c:64:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|    64 | }
|       | ^
| sshkey.c:3000:17: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3000 |                 RSA_get0_key(k->rsa, &rsa_n, &rsa_e, NULL);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| sshkey.c: In function 'sshkey_private_serialize_opt':
| sshkey.c:3250:17: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3250 |                 RSA_get0_key(key->rsa, &rsa_n, &rsa_e, &rsa_d);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| sshkey.c:3251:17: warning: 'RSA_get0_factors' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3251 |                 RSA_get0_factors(key->rsa, &rsa_p, &rsa_q);
|       |                 ^~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:220:28: note: declared here
|   220 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_factors(const RSA *r,
|       |                            ^~~~~~~~~~~~~~~~
| sshkey.c:3252:17: warning: 'RSA_get0_crt_params' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3252 |                 RSA_get0_crt_params(key->rsa, NULL, NULL, &rsa_iqmp);
|       |                 ^~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:225:28: note: declared here
|   225 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_crt_params(const RSA *r,
|       |                            ^~~~~~~~~~~~~~~~~~~
| sshkey.c:3266:17: warning: 'RSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3266 |                 RSA_get0_key(key->rsa, NULL, NULL, &rsa_d);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:217:28: note: declared here
|   217 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_key(const RSA *r,
|       |                            ^~~~~~~~~~~~
| sshkey.c:3267:17: warning: 'RSA_get0_factors' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3267 |                 RSA_get0_factors(key->rsa, &rsa_p, &rsa_q);
|       |                 ^~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:220:28: note: declared here
|   220 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_factors(const RSA *r,
|       |                            ^~~~~~~~~~~~~~~~
| sshkey.c:3268:17: warning: 'RSA_get0_crt_params' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3268 |                 RSA_get0_crt_params(key->rsa, NULL, NULL, &rsa_iqmp);
|       |                 ^~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:225:28: note: declared here
|   225 | OSSL_DEPRECATEDIN_3_0 void RSA_get0_crt_params(const RSA *r,
|       |                            ^~~~~~~~~~~~~~~~~~~
| sshkey.c:3277:17: warning: 'DSA_get0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3277 |                 DSA_get0_pqg(key->dsa, &dsa_p, &dsa_q, &dsa_g);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:201:28: note: declared here
|   201 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_pqg(const DSA *d, const BIGNUM **p,
|       |                            ^~~~~~~~~~~~
| sshkey.c:3278:17: warning: 'DSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3278 |                 DSA_get0_key(key->dsa, &dsa_pub_key, &dsa_priv_key);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:204:28: note: declared here
|   204 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
|       |                            ^~~~~~~~~~~~
| sshkey.c:3291:17: warning: 'DSA_get0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3291 |                 DSA_get0_key(key->dsa, NULL, &dsa_priv_key);
|       |                 ^~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:204:28: note: declared here
|   204 | OSSL_DEPRECATEDIN_3_0 void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
|       |                            ^~~~~~~~~~~~
| sshkey.c:3302:21: warning: 'EC_KEY_get0_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3302 |                     EC_KEY_get0_private_key(key->ecdsa))) != 0)
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1046:37: note: declared here
|  1046 | OSSL_DEPRECATEDIN_3_0 const BIGNUM *EC_KEY_get0_private_key(const EC_KEY *key);
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3312:21: warning: 'EC_KEY_get0_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3312 |                     EC_KEY_get0_private_key(key->ecdsa))) != 0)
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1046:37: note: declared here
|  1046 | OSSL_DEPRECATEDIN_3_0 const BIGNUM *EC_KEY_get0_private_key(const EC_KEY *key);
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c: In function 'sshkey_private_deserialize':
| sshkey.c:3501:17: warning: 'DSA_set0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3501 |                 if (!DSA_set0_pqg(k->dsa, dsa_p, dsa_q, dsa_g)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:203:27: note: declared here
|   203 | OSSL_DEPRECATEDIN_3_0 int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g);
|       |                           ^~~~~~~~~~~~
| sshkey.c:3506:17: warning: 'DSA_set0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3506 |                 if (!DSA_set0_key(k->dsa, dsa_pub_key, NULL)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:206:27: note: declared here
|   206 | OSSL_DEPRECATEDIN_3_0 int DSA_set0_key(DSA *d, BIGNUM *pub_key,
|       |                           ^~~~~~~~~~~~
| sshkey.c:3515:17: warning: 'DSA_set0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3515 |                 if (!DSA_set0_key(k->dsa, NULL, dsa_priv_key)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/dsa.h:206:27: note: declared here
|   206 | OSSL_DEPRECATEDIN_3_0 int DSA_set0_key(DSA *d, BIGNUM *pub_key,
|       |                           ^~~~~~~~~~~~
| sshkey.c:3533:17: warning: 'EC_KEY_new_by_curve_name' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3533 |                 k->ecdsa = EC_KEY_new_by_curve_name(k->ecdsa_nid);
|       |                 ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:996:31: note: declared here
|   996 | OSSL_DEPRECATEDIN_3_0 EC_KEY *EC_KEY_new_by_curve_name(int nid);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3544:17: warning: 'EC_KEY_set_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3544 |                 if (EC_KEY_set_private_key(k->ecdsa, exponent) != 1) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1054:27: note: declared here
|  1054 | OSSL_DEPRECATEDIN_3_0 int EC_KEY_set_private_key(EC_KEY *key, const BIGNUM *prv);
|       |                           ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3548:17: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3548 |                 if ((r = sshkey_ec_validate_public(EC_KEY_get0_group(k->ecdsa),
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:3549:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3549 |                     EC_KEY_get0_public_key(k->ecdsa))) != 0 ||
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3569:17: warning: 'EC_KEY_new_by_curve_name' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3569 |                 k->ecdsa = EC_KEY_new_by_curve_name(k->ecdsa_nid);
|       |                 ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:996:31: note: declared here
|   996 | OSSL_DEPRECATEDIN_3_0 EC_KEY *EC_KEY_new_by_curve_name(int nid);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3581:17: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3581 |                 if ((r = sshkey_ec_validate_public(EC_KEY_get0_group(k->ecdsa),
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:3582:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3582 |                     EC_KEY_get0_public_key(k->ecdsa))) != 0)
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3597:17: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3597 |                 if ((r = sshkey_ec_validate_public(EC_KEY_get0_group(k->ecdsa),
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:3598:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3598 |                     EC_KEY_get0_public_key(k->ecdsa))) != 0)
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3606:17: warning: 'RSA_set0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3606 |                 if (!RSA_set0_key(k->rsa, rsa_n, rsa_e, NULL)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:207:27: note: declared here
|   207 | OSSL_DEPRECATEDIN_3_0 int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);
|       |                           ^~~~~~~~~~~~
| sshkey.c:3618:17: warning: 'RSA_set0_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3618 |                 if (!RSA_set0_key(k->rsa, NULL, NULL, rsa_d)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:207:27: note: declared here
|   207 | OSSL_DEPRECATEDIN_3_0 int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);
|       |                           ^~~~~~~~~~~~
| sshkey.c:3623:17: warning: 'RSA_set0_factors' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3623 |                 if (!RSA_set0_factors(k->rsa, rsa_p, rsa_q)) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:208:27: note: declared here
|   208 | OSSL_DEPRECATEDIN_3_0 int RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q);
|       |                           ^~~~~~~~~~~~~~~~
| sshkey.c:3701:17: warning: 'RSA_blinding_on' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3701 |                 if (RSA_blinding_on(k->rsa, NULL) != 1) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:371:27: note: declared here
|   371 | OSSL_DEPRECATEDIN_3_0 int RSA_blinding_on(RSA *rsa, BN_CTX *ctx);
|       |                           ^~~~~~~~~~~~~~~
| sshkey.c: In function 'sshkey_ec_validate_public':
| sshkey.c:3769:9: warning: 'EC_METHOD_get_field_type' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3769 |         if (EC_METHOD_get_field_type(EC_GROUP_method_of(group)) !=
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:186:27: note: declared here
|   186 | OSSL_DEPRECATEDIN_3_0 int EC_METHOD_get_field_type(const EC_METHOD *meth);
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3769:9: warning: 'EC_GROUP_method_of' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3769 |         if (EC_METHOD_get_field_type(EC_GROUP_method_of(group)) !=
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:180:40: note: declared here
|   180 | OSSL_DEPRECATEDIN_3_0 const EC_METHOD *EC_GROUP_method_of(const EC_GROUP *group);
|       |                                        ^~~~~~~~~~~~~~~~~~
| sshkey.c:3787:13: warning: 'EC_POINT_get_affine_coordinates_GFp' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3787 |             EC_POINT_get_affine_coordinates_GFp(group, public,
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:657:27: note: declared here
|   657 | OSSL_DEPRECATEDIN_3_0 int EC_POINT_get_affine_coordinates_GFp
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c: In function 'sshkey_ec_validate_private':
| sshkey.c:3837:9: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3837 |         if (EC_GROUP_get_order(EC_KEY_get0_group(key), order, NULL) != 1) {
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:3841:9: warning: 'EC_KEY_get0_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3841 |         if (BN_num_bits(EC_KEY_get0_private_key(key)) <=
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1046:37: note: declared here
|  1046 | OSSL_DEPRECATEDIN_3_0 const BIGNUM *EC_KEY_get0_private_key(const EC_KEY *key);
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3850:9: warning: 'EC_KEY_get0_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3850 |         if (BN_cmp(EC_KEY_get0_private_key(key), tmp) >= 0)
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1046:37: note: declared here
|  1046 | OSSL_DEPRECATEDIN_3_0 const BIGNUM *EC_KEY_get0_private_key(const EC_KEY *key);
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c: In function 'sshkey_dump_ec_point':
| sshkey.c:3872:9: warning: 'EC_METHOD_get_field_type' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3872 |         if (EC_METHOD_get_field_type(EC_GROUP_method_of(group)) !=
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:186:27: note: declared here
|   186 | OSSL_DEPRECATEDIN_3_0 int EC_METHOD_get_field_type(const EC_METHOD *meth);
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~
| make: *** [Makefile:200: sshbuf-misc.o] Error 1
| sshkey.c:3872:9: warning: 'EC_GROUP_method_of' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3872 |         if (EC_METHOD_get_field_type(EC_GROUP_method_of(group)) !=
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:180:40: note: declared here
|   180 | OSSL_DEPRECATEDIN_3_0 const EC_METHOD *EC_GROUP_method_of(const EC_GROUP *group);
|       |                                        ^~~~~~~~~~~~~~~~~~
| sshkey.c:3877:9: warning: 'EC_POINT_get_affine_coordinates_GFp' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3877 |         if (EC_POINT_get_affine_coordinates_GFp(group, point,
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:657:27: note: declared here
|   657 | OSSL_DEPRECATEDIN_3_0 int EC_POINT_get_affine_coordinates_GFp
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c: In function 'sshkey_dump_ec_key':
| sshkey.c:3898:9: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3898 |         sshkey_dump_ec_point(EC_KEY_get0_group(key),
|       |         ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:3899:13: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3899 |             EC_KEY_get0_public_key(key));
|       |             ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3901:9: warning: 'EC_KEY_get0_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3901 |         if ((exponent = EC_KEY_get0_private_key(key)) == NULL)
|       |         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1046:37: note: declared here
|  1046 | OSSL_DEPRECATEDIN_3_0 const BIGNUM *EC_KEY_get0_private_key(const EC_KEY *key);
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:3904:17: warning: 'EC_KEY_get0_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  3904 |                 BN_print_fp(stderr, EC_KEY_get0_private_key(key));
|       |                 ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1046:37: note: declared here
|  1046 | OSSL_DEPRECATEDIN_3_0 const BIGNUM *EC_KEY_get0_private_key(const EC_KEY *key);
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~
| sshkey.c: In function 'sshkey_private_to_blob_pem_pkcs8':
| sshkey.c:4429:25: warning: 'PEM_write_bio_DSAPrivateKey' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4429 |                         success = PEM_write_bio_DSAPrivateKey(bio, key->dsa,
|       |                         ^~~~~~~
| In file included from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:453:1: note: declared here
|   453 | DECLARE_PEM_rw_cb_attr(OSSL_DEPRECATEDIN_3_0, DSAPrivateKey, DSA)
|       | ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:4432:25: warning: 'EVP_PKEY_set1_DSA' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4432 |                         success = EVP_PKEY_set1_DSA(pkey, key->dsa);
|       |                         ^~~~~~~
| In file included from sshkey.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/evp.h:1353:5: note: declared here
|  1353 | int EVP_PKEY_set1_DSA(EVP_PKEY *pkey, struct dsa_st *key);
|       |     ^~~~~~~~~~~~~~~~~
| sshkey.c:4438:25: warning: 'PEM_write_bio_ECPrivateKey' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4438 |                         success = PEM_write_bio_ECPrivateKey(bio, key->ecdsa,
|       |                         ^~~~~~~
| In file included from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:462:1: note: declared here
|   462 | DECLARE_PEM_rw_cb_attr(OSSL_DEPRECATEDIN_3_0, ECPrivateKey, EC_KEY)
|       | ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:4441:25: warning: 'EVP_PKEY_set1_EC_KEY' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4441 |                         success = EVP_PKEY_set1_EC_KEY(pkey, key->ecdsa);
|       |                         ^~~~~~~
| In file included from sshkey.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/evp.h:1370:5: note: declared here
|  1370 | int EVP_PKEY_set1_EC_KEY(EVP_PKEY *pkey, struct ec_key_st *key);
|       |     ^~~~~~~~~~~~~~~~~~~~
| sshkey.c:4447:25: warning: 'PEM_write_bio_RSAPrivateKey' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4447 |                         success = PEM_write_bio_RSAPrivateKey(bio, key->rsa,
|       |                         ^~~~~~~
| In file included from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:447:1: note: declared here
|   447 | DECLARE_PEM_rw_cb_attr(OSSL_DEPRECATEDIN_3_0, RSAPrivateKey, RSA)
|       | ^~~~~~~~~~~~~~~~~~~~~~
| sshkey.c:4450:25: warning: 'EVP_PKEY_set1_RSA' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4450 |                         success = EVP_PKEY_set1_RSA(pkey, key->rsa);
|       |                         ^~~~~~~
| In file included from sshkey.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/evp.h:1344:5: note: declared here
|  1344 | int EVP_PKEY_set1_RSA(EVP_PKEY *pkey, struct rsa_st *key);
|       |     ^~~~~~~~~~~~~~~~~
| sshkey.c: In function 'sshkey_parse_private_pem_fileblob':
| sshkey.c:4646:17: warning: 'EVP_PKEY_get1_RSA' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4646 |                 prv->rsa = EVP_PKEY_get1_RSA(pk);
|       |                 ^~~
| In file included from sshkey.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/evp.h:1348:16: note: declared here
|  1348 | struct rsa_st *EVP_PKEY_get1_RSA(EVP_PKEY *pkey);
|       |                ^~~~~~~~~~~~~~~~~
| sshkey.c:4651:17: warning: 'RSA_blinding_on' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4651 |                 if (RSA_blinding_on(prv->rsa, NULL) != 1) {
|       |                 ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:36,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/rsa.h:371:27: note: declared here
|   371 | OSSL_DEPRECATEDIN_3_0 int RSA_blinding_on(RSA *rsa, BN_CTX *ctx);
|       |                           ^~~~~~~~~~~~~~~
| sshkey.c:4663:17: warning: 'EVP_PKEY_get1_DSA' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4663 |                 prv->dsa = EVP_PKEY_get1_DSA(pk);
|       |                 ^~~
| In file included from sshkey.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/evp.h:1357:16: note: declared here
|  1357 | struct dsa_st *EVP_PKEY_get1_DSA(EVP_PKEY *pkey);
|       |                ^~~~~~~~~~~~~~~~~
| sshkey.c:4675:17: warning: 'EVP_PKEY_get1_EC_KEY' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4675 |                 prv->ecdsa = EVP_PKEY_get1_EC_KEY(pk);
|       |                 ^~~
| In file included from sshkey.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/evp.h:1374:19: note: declared here
|  1374 | struct ec_key_st *EVP_PKEY_get1_EC_KEY(EVP_PKEY *pkey);
|       |                   ^~~~~~~~~~~~~~~~~~~~
| sshkey.c:4680:21: warning: 'EC_KEY_get0_group' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4680 |                     sshkey_ec_validate_public(EC_KEY_get0_group(prv->ecdsa),
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1032:39: note: declared here
|  1032 | OSSL_DEPRECATEDIN_3_0 const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~
| sshkey.c:4681:21: warning: 'EC_KEY_get0_public_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  4681 |                     EC_KEY_get0_public_key(prv->ecdsa)) != 0 ||
|       |                     ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/x509.h:33,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/pem.h:23,
|                  from sshkey.c:36:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/recipe-sysroot/usr/include/openssl/ec.h:1060:39: note: declared here
|  1060 | OSSL_DEPRECATEDIN_3_0 const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~
| krl.c: In function 'revoked_certs_for_ca_key':
| krl.c:247:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|   247 | }
|       | ^
| sshkey.c: In function 'translate_libcrypto_error':
| sshkey.c:4565:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
|  4565 | }
|       | ^
| make: *** [Makefile:200: krl.o] Error 1
| make: *** [Makefile:200: sshkey.o] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/run.do_compile.3385263:186 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/run.do_compile.3385263, line 186
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/run.do_compile.3385263, line 170
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/run.do_compile.3385263, line 165
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/run.do_compile.3385263, line 160
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/run.do_compile.3385263, line 155
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/run.do_compile.3385263, line 199
NOTE: recipe openssh-8.9p1-r0: task do_compile: Failed
NOTE: recipe coreutils-9.0-r0: task do_configure: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_compile: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1232 tasks of which 979 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: openssh-8.9p1-r0 do_compile: oe_runmake failed
ERROR: openssh-8.9p1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/run.do_compile.3385263', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssh/8.9p1-r0/temp/log.do_compile.3385263
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssh/openssh_8.9p1.bb:do_compile) failed with exit code '1'

--===============3864215514758659397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/openssh: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh: SRC_URI changed from "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.8p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch" to "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.9p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch"
packages/core2-32-poky-linux/openssh/openssh-dbg: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 11237584 to 11543756 (+3%)
packages/core2-32-poky-linux/openssh/openssh-dbg: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-dev: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-dev: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-doc: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-doc: PKGSIZE changed from 316157 to 320148 (+1%)
packages/core2-32-poky-linux/openssh/openssh-doc: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-keygen: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 579064 to 636408 (+10%)
packages/core2-32-poky-linux/openssh/openssh-keygen: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-locale: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-locale: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-misc: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2741608 to 3065192 (+12%)
packages/core2-32-poky-linux/openssh/openssh-misc: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-ptest: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 1211303 to 1328920 (+10%)
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/agent-restrict.sh /usr/lib/openssh/ptest/regress/hostbased.sh /usr/lib/openssh/ptest/regress/unittests/misc/test_hpdelim.c /usr/lib/openssh/ptest/regress/knownhosts.sh"
packages/core2-32-poky-linux/openssh/openssh-scp: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-scp: PKGSIZE changed from 235124 to 267892 (+14%)
packages/core2-32-poky-linux/openssh/openssh-scp: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGSIZE changed from 165352 to 194024 (+17%)
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sftp: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGSIZE changed from 235088 to 271952 (+16%)
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-src: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-src: PKGSIZE changed from 3195098 to 3253823 (+2%)
packages/core2-32-poky-linux/openssh/openssh-src: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-src: FILELIST: directory renamed /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1 -> /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1, directory renamed /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/regress -> /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/regress, removed "/usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/port-linux.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/fmt_scaled.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/bcrypt_pbkdf.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/port-net.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/libressl-api-compat.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/getrrsetbyname.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/blowfish.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/vis.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/bsd-getpeereid.c /usr/src/de
 bug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/getopt_long.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/strtonum.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/readpassphrase.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/base64.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/recallocarray.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/openssl-compat.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/strmode.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/kludge-fd_set.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/blf.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/openbsd-compat.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/vis.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/glob.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/chacha_private.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbs
 d-compat/bsd-misc.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/arc4random.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/xcrypt.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/getrrsetbyname.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/charclass.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/strlcat.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/glob.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/bsd-misc.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/timingsafe_bcmp.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/pwcache.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/openssl-compat.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/strlcpy.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/freezero.c /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/setproctitle.c /usr/src/debug/openssh/8
 .8p1-r0/openssh-8.8p1/openbsd-compat/port-net.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/port-linux.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/readpassphrase.h /usr/src/debug/openssh/8.8p1-r0/openssh-8.8p1/openbsd-compat/getopt.h", added "/usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/port-net.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/glob.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/blf.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/setproctitle.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/chacha_private.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/timingsafe_bcmp.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/bsd-closefrom.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/getrrsetbyname.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/xcrypt.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd
 -compat/recallocarray.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/openbsd-compat.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/getopt_long.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/freezero.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/port-net.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/vis.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/readpassphrase.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/strlcpy.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/openssl-compat.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/readpassphrase.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/port-linux.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/strlcat.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/fmt_scaled.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/getopt.h /usr/src/debug/
 openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/strtonum.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/strmode.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/libressl-api-compat.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/pwcache.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/bsd-misc.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/port-linux.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/vis.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/blowfish.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/bcrypt_pbkdf.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/arc4random.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/glob.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/bsd-getpeereid.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/base64.c /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/get
 rrsetbyname.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/charclass.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/bsd-misc.h /usr/src/debug/openssh/8.9p1-r0/openssh-8.9p1/openbsd-compat/openssl-compat.c"
packages/core2-32-poky-linux/openssh/openssh-ssh: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-ssh: PKGSIZE changed from 994560 to 1088768 (+9%)
packages/core2-32-poky-linux/openssh/openssh-ssh: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sshd: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 1673234 to 1711253 (+2%)
packages/core2-32-poky-linux/openssh/openssh-sshd: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh-staticdev: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh-staticdev: PKGV changed from 8.8p1 [default] to 8.9p1 [default]
packages/core2-32-poky-linux/openssh/openssh: PV changed from "8.8p1" to "8.9p1"
packages/core2-32-poky-linux/openssh/openssh: PKGV changed from 8.8p1 [default] to 8.9p1 [default]

--===============3864215514758659397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2741608 to 3065192 (+12%)
packages/core2-32-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/hostbased.sh /usr/lib/openssh/ptest/regress/agent-restrict.sh /usr/lib/openssh/ptest/regress/unittests/misc/test_hpdelim.c /usr/lib/openssh/ptest/regress/knownhosts.sh"
packages/core2-32-poky-linux/openssh/openssh-scp: PKGSIZE changed from 235124 to 267892 (+14%)
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGSIZE changed from 165352 to 194024 (+17%)
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGSIZE changed from 235088 to 271952 (+16%)

--===============3864215514758659397==--

