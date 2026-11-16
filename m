Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21598.1794806387749759563
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 21:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y6NnVm5K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aKxP9ZbU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1e2cc0fe0-8ea8dbc8-ba08-41d0-ae1f-57ae181b80be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794806386;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uuq5UFLJ3NSE6rZBihLHv2q67MgkFPLMUj4MwjRv00E=;
	b=Y6NnVm5Ks7Rt92jjx8byf5k9lkCNTYD/v8NfhfEd40LXgXTmgdW817wTRfn0Wr/a
	MIRcjYzsznuITo2TM9bQoZHKscuT2uKaFiMQJFYTP3vkdz9F7gMXoBRnaFEaKwpLUUA
	wF/clycHiymyDv9iXVsf1zLwfXQPiPKvwdscc9O8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794806386;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uuq5UFLJ3NSE6rZBihLHv2q67MgkFPLMUj4MwjRv00E=;
	b=aKxP9ZbUEkaKzyD74bqevpjO3VY7JASo8B9iGqbp9cctGvZLUrbynnxp7eZsnKcD
	i/kn7sXBTi+sgxON12UBet+Gt6536kRpXW7Wer2BRFsfEe0ejgJ8RWjHq8+L8j1GCXc
	QfD1cO1WbOcG37CPMHmjSVhZSE43IYHD0jxqqOpw=
Content-Type: multipart/mixed; boundary="===============6702676697227710732=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome,python3-pycryptodomex: upgrading to
 4.5.0,3.24.2 FAILED
Message-ID: <010101a1e2cc0fe0-8ea8dbc8-ba08-41d0-ae1f-57ae181b80be-000000@us-west-2.amazonses.com>
Date: Mon, 16 Nov 2026 05:19:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 05:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250310

--===============6702676697227710732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodome,python3-pycryptodomex* to *4.5.0,3.24.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch
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

-- >8 --
From 9e4eccdba916f546ab55278b5c56e9ba8d80d1b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 16 Nov 2026 05:07:25 +0000
Subject: [PATCH] python3-pycryptodome,python3-pycryptodomex: upgrade 3.24.1 ->
 4.5.0,3.24.1 -> 3.24.2

4.5.0 (15 November 2026)

New features
------------

Breaking changes
----------------

Resolved issues
---------------

4.4.0 (7 November 2026)

New features
------------

Resolved issues
---------------

4.3.0 (2 November 2026)

New features
------------

Other changes
-------------

Resolved issues
---------------

4.2.0 (24 October 2026)

New features
------------

4.1.0 (19 October 2026)

New features
------------

Resolved issues
---------------

4.0.1 (17 October 2026)

New features
------------

4.0.0 (14 October 2026)

Breaking changes
----------------

Deprecations
------------

Resolved issues
---------------

New features
------------

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------
---
 .../python/python3-pycryptodome_3.24.1.bb     |  6 ---
 .../python/python3-pycryptodome_4.5.0.bb      | 47 +++++++++++++++++++
 ...4.1.bb => python3-pycryptodomex_3.24.2.bb} |  2 +-
 3 files changed, 48 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.24.1.bb => python3-pycryptodomex_3.24.2.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
deleted file mode 100644
index 0aa53559d6..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-pycryptodome.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "3f9e74444c0ecbec7af232a95d282c74b114d53212ce075ed17b7fd7dca32bb3"
-
-CVE_PRODUCT = "pycryptodome:pycryptodome"
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb
new file mode 100644
index 0000000000..3f8c669c30
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb
@@ -0,0 +1,47 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.rst
+# +++ LICENSE.rst
+# @@ -3,6 +3,10 @@
+#  
+#  In either case, there are minimal if no restrictions on the redistribution,
+#  modification and usage of the software.
+# +
+# +Files that do not include the license text refer to it with an SPDX tag:
+# +``SPDX-License-Identifier: BSD-2-Clause`` for the BSD license below
+# +(``SPDX-FileCopyrightText`` gives the copyright notice).
+#  
+#  Public domain
+#  =============
+# @@ -59,3 +63,16 @@
+#  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+#  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +
+# +Third-party code
+# +================
+# +
+# +The directory ``src/mldsa-native`` contains code from mldsa-native
+# +(https://github.com/pq-code-package/mldsa-native), available under
+# +the Apache-2.0 license OR the ISC license OR the MIT license.
+# +See ``src/mldsa-native/LICENSE`` for the full text of the licenses.
+# +
+# +The directory ``src/mlkem-native`` contains code from mlkem-native
+# +(https://github.com/pq-code-package/mlkem-native), available under
+# +the Apache-2.0 license OR the ISC license OR the MIT license.
+# +See ``src/mlkem-native/LICENSE`` for the full text of the licenses.
+# 
+#
+
+require python-pycryptodome.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "51e97a8d1cf101974bc40c20b3191cb1903891e5c172346943d5d4f3bc4f9d83"
+
+CVE_PRODUCT = "pycryptodome:pycryptodome"
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb
index b24e047a19..29e3d600a5 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8ed53e4f6e1d356"
+SRC_URI[sha256sum] = "e4dbc29e2575365d15e272f769329106277649aea081e2119cf43d66950f8f8f"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome pycryptodome:pycryptodomex"
 
-- 
2.47.1


--===============6702676697227710732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-pycryptodomex-changelog.txt"

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------

--===============6702676697227710732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-f32bced7b431f39a956c3e0d42e3c756ab784c49"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f32bced7b431f39a956c3e0d42e3c756ab784c49"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 398 Local 375 Mirrors 0 Missed 23 Current 350 (94% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 353 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 580 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 675 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 413 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_recipe_qa)
NOTE: Running task 489 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_create_recipe_spdx)
NOTE: Running task 490 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 691 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 492 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_fetch: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_fetch: Succeeded
NOTE: Running task 493 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_unpack)
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 494 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_unpack: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 498 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_unpack)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-installer-native-1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_recipe_qa_setscene)
NOTE: recipe m4-native-1.4.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-native-1.4.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnu-config-native-20260629+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 748 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: recipe quilt-native-0.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quilt-native-0.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 748 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_recipe_qa_setscene)
NOTE: recipe quilt-native-0.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe quilt-native-0.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1622 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_patch)
NOTE: Running task 1623 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_patch)
NOTE: Running task 1679 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1680 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_patch: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1892 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1893 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_populate_lic)
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_configure)
NOTE: Running task 1895 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_configure)
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_configure: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_configure: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_compile)
NOTE: Running task 1897 of 1919 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodomex_3.24.2.bb:do_compile)
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_compile: Started
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_populate_lic: Failed
NOTE: recipe python3-pycryptodomex-3.24.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pycryptodome-4.5.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1897 tasks of which 1880 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261116050642.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261116050642.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.5.0/temp/log.do_populate_lic.4073344
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pycryptodome-4.5.0-r0 do_populate_lic: QA Issue: python3-pycryptodome: The LIC_FILES_CHKSUM does not match for file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93
python3-pycryptodome: The new md5 checksum is a514b4a7ad24677ae50f3becb03404e3
python3-pycryptodome: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
The source code in PyCryptodome is partially in the public domain
and partially released under the BSD 2-Clause license.

In either case, there are minimal if no restrictions on the redistribution,
modification and usage of the software.

Files that do not include the license text refer to it with an SPDX tag:
``SPDX-License-Identifier: BSD-2-Clause`` for the BSD license below
(``SPDX-FileCopyrightText`` gives the copyright notice).

...

The directory ``src/mldsa-native`` contains code from mldsa-native
(https://github.com/pq-code-package/mldsa-native), available under
the Apache-2.0 license OR the ISC license OR the MIT license.
See ``src/mldsa-native/LICENSE`` for the full text of the licenses.

The directory ``src/mlkem-native`` contains code from mlkem-native
(https://github.com/pq-code-package/mlkem-native), available under
the Apache-2.0 license OR the ISC license OR the MIT license.
See ``src/mlkem-native/LICENSE`` for the full text of the licenses.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
python3-pycryptodome: Check if the license information has changed in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.5.0/sources/pycryptodome-4.5.0/LICENSE.rst to verify that the LICENSE value "BSD-2-Clause AND Unlicense" remains valid [license-checksum]
ERROR: python3-pycryptodome-4.5.0-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-pycryptodome/4.5.0/temp/log.do_populate_lic.4073344
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycryptodome_4.5.0.bb:do_populate_lic) failed with exit code '1'

--===============6702676697227710732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycryptodome-changelog.txt"

4.5.0 (15 November 2026)

New features
------------

Breaking changes
----------------

Resolved issues
---------------

4.4.0 (7 November 2026)

New features
------------

Resolved issues
---------------

4.3.0 (2 November 2026)

New features
------------

Other changes
-------------

Resolved issues
---------------

4.2.0 (24 October 2026)

New features
------------

4.1.0 (19 October 2026)

New features
------------

Resolved issues
---------------

4.0.1 (17 October 2026)

New features
------------

4.0.0 (14 October 2026)

Breaking changes
----------------

Deprecations
------------

Resolved issues
---------------

New features
------------

3.24.2 (5 November 2026)
This release is only for ``pycryptodomex``.

Resolved issues
---------------

Other changes
-------------

--===============6702676697227710732==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch"

RnJvbSA5ZTRlY2NkYmE5MTZmNTQ2YWI1NTI3OGI1YzU2ZTliYThkODBkMWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTYgTm92IDIwMjYgMDU6MDc6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZSxweXRob24zLXB5Y3J5cHRvZG9tZXg6IHVwZ3JhZGUgMy4yNC4x
IC0+CiA0LjUuMCwzLjI0LjEgLT4gMy4yNC4yCgo0LjUuMCAoMTUgTm92ZW1iZXIgMjAyNikKCk5l
dyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KCkJyZWFraW5nIGNoYW5nZXMKLS0tLS0tLS0tLS0tLS0t
LQoKUmVzb2x2ZWQgaXNzdWVzCi0tLS0tLS0tLS0tLS0tLQoKNC40LjAgKDcgTm92ZW1iZXIgMjAy
NikKCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0tLS0tLS0t
LS0tLS0KCjQuMy4wICgyIE5vdmVtYmVyIDIwMjYpCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0t
CgpPdGhlciBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0tLS0tLS0t
LS0tLS0KCjQuMi4wICgyNCBPY3RvYmVyIDIwMjYpCgpOZXcgZmVhdHVyZXMKLS0tLS0tLS0tLS0t
Cgo0LjEuMCAoMTkgT2N0b2JlciAyMDI2KQoKTmV3IGZlYXR1cmVzCi0tLS0tLS0tLS0tLQoKUmVz
b2x2ZWQgaXNzdWVzCi0tLS0tLS0tLS0tLS0tLQoKNC4wLjEgKDE3IE9jdG9iZXIgMjAyNikKCk5l
dyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KCjQuMC4wICgxNCBPY3RvYmVyIDIwMjYpCgpCcmVha2lu
ZyBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0tLS0KCkRlcHJlY2F0aW9ucwotLS0tLS0tLS0tLS0KClJl
c29sdmVkIGlzc3VlcwotLS0tLS0tLS0tLS0tLS0KCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0K
CjMuMjQuMiAoNSBOb3ZlbWJlciAyMDI2KQpUaGlzIHJlbGVhc2UgaXMgb25seSBmb3IgYGBweWNy
eXB0b2RvbWV4YGAuCgpSZXNvbHZlZCBpc3N1ZXMKLS0tLS0tLS0tLS0tLS0tCgpPdGhlciBjaGFu
Z2VzCi0tLS0tLS0tLS0tLS0KCjMuMjQuMiAoNSBOb3ZlbWJlciAyMDI2KQpUaGlzIHJlbGVhc2Ug
aXMgb25seSBmb3IgYGBweWNyeXB0b2RvbWV4YGAuCgpSZXNvbHZlZCBpc3N1ZXMKLS0tLS0tLS0t
LS0tLS0tCgpPdGhlciBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0KLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtcHljcnlwdG9kb21lXzMuMjQuMS5iYiAgICAgfCAgNiAtLS0KIC4uLi9weXRob24vcHl0aG9u
My1weWNyeXB0b2RvbWVfNC41LjAuYmIgICAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKysKIC4u
LjQuMS5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yNC4yLmJifSB8ICAyICstCiAzIGZp
bGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9t
ZV8zLjI0LjEuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzQuNS4wLmJiCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMS5iYiA9PiBweXRob24z
LXB5Y3J5cHRvZG9tZXhfMy4yNC4yLmJifSAoNzYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjI0LjEuYmIKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDBhYTUzNTU5ZDYuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjI0LjEu
YmIKKysrIC9kZXYvbnVsbApAQCAtMSw2ICswLDAgQEAKLXJlcXVpcmUgcHl0aG9uLXB5Y3J5cHRv
ZG9tZS5pbmMKLWluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQotCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiM2Y5ZTc0NDQ0YzBlY2JlYzdhZjIzMmE5NWQyODJjNzRiMTE0ZDUzMjEy
Y2UwNzVlZDE3YjdmZDdkY2EzMmJiMyIKLQotQ1ZFX1BST0RVQ1QgPSAicHljcnlwdG9kb21lOnB5
Y3J5cHRvZG9tZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWNyeXB0b2RvbWVfNC41LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHljcnlwdG9kb21lXzQuNS4wLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjNmOGM2NjljMzAKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzQuNS4wLmJiCkBAIC0wLDAgKzEs
NDcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLnJzdAorIyArKysgTElDRU5TRS5y
c3QKKyMgQEAgLTMsNiArMywxMCBAQAorIyAgCisjICBJbiBlaXRoZXIgY2FzZSwgdGhlcmUgYXJl
IG1pbmltYWwgaWYgbm8gcmVzdHJpY3Rpb25zIG9uIHRoZSByZWRpc3RyaWJ1dGlvbiwKKyMgIG1v
ZGlmaWNhdGlvbiBhbmQgdXNhZ2Ugb2YgdGhlIHNvZnR3YXJlLgorIyArCisjICtGaWxlcyB0aGF0
IGRvIG5vdCBpbmNsdWRlIHRoZSBsaWNlbnNlIHRleHQgcmVmZXIgdG8gaXQgd2l0aCBhbiBTUERY
IHRhZzoKKyMgK2BgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZWBgIGZvciB0
aGUgQlNEIGxpY2Vuc2UgYmVsb3cKKyMgKyhgYFNQRFgtRmlsZUNvcHlyaWdodFRleHRgYCBnaXZl
cyB0aGUgY29weXJpZ2h0IG5vdGljZSkuCisjICAKKyMgIFB1YmxpYyBkb21haW4KKyMgID09PT09
PT09PT09PT0KKyMgQEAgLTU5LDMgKzYzLDE2IEBACisjICBDQVVTRUQgQU5EIE9OIEFOWSBUSEVP
UlkgT0YgTElBQklMSVRZLCBXSEVUSEVSIElOIENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLAor
IyAgT1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElO
IEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UKKyMgIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURW
SVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjICsKKyMgK1RoaXJkLXBh
cnR5IGNvZGUKKyMgKz09PT09PT09PT09PT09PT0KKyMgKworIyArVGhlIGRpcmVjdG9yeSBgYHNy
Yy9tbGRzYS1uYXRpdmVgYCBjb250YWlucyBjb2RlIGZyb20gbWxkc2EtbmF0aXZlCisjICsoaHR0
cHM6Ly9naXRodWIuY29tL3BxLWNvZGUtcGFja2FnZS9tbGRzYS1uYXRpdmUpLCBhdmFpbGFibGUg
dW5kZXIKKyMgK3RoZSBBcGFjaGUtMi4wIGxpY2Vuc2UgT1IgdGhlIElTQyBsaWNlbnNlIE9SIHRo
ZSBNSVQgbGljZW5zZS4KKyMgK1NlZSBgYHNyYy9tbGRzYS1uYXRpdmUvTElDRU5TRWBgIGZvciB0
aGUgZnVsbCB0ZXh0IG9mIHRoZSBsaWNlbnNlcy4KKyMgKworIyArVGhlIGRpcmVjdG9yeSBgYHNy
Yy9tbGtlbS1uYXRpdmVgYCBjb250YWlucyBjb2RlIGZyb20gbWxrZW0tbmF0aXZlCisjICsoaHR0
cHM6Ly9naXRodWIuY29tL3BxLWNvZGUtcGFja2FnZS9tbGtlbS1uYXRpdmUpLCBhdmFpbGFibGUg
dW5kZXIKKyMgK3RoZSBBcGFjaGUtMi4wIGxpY2Vuc2UgT1IgdGhlIElTQyBsaWNlbnNlIE9SIHRo
ZSBNSVQgbGljZW5zZS4KKyMgK1NlZSBgYHNyYy9tbGtlbS1uYXRpdmUvTElDRU5TRWBgIGZvciB0
aGUgZnVsbCB0ZXh0IG9mIHRoZSBsaWNlbnNlcy4KKyMgCisjCisKK3JlcXVpcmUgcHl0aG9uLXB5
Y3J5cHRvZG9tZS5pbmMKK2luaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQorCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNTFlOTdhOGQxY2YxMDE5NzRiYzQwYzIwYjMxOTFjYjE5MDM4
OTFlNWMxNzIzNDY5NDNkNWQ0ZjNiYzRmOWQ4MyIKKworQ1ZFX1BST0RVQ1QgPSAicHljcnlwdG9k
b21lOnB5Y3J5cHRvZG9tZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDc2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlj
cnlwdG9kb21leF8zLjI0LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMi5iYgppbmRleCBiMjRlMDQ3YTE5Li4yOWUz
ZDYwMGE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljcnlwdG9kb21leF8zLjI0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yNC4yLmJiCkBAIC0xLDcgKzEsNyBAQAogcmVxdWly
ZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5oZXJpdCBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwOTA4MTY2NmZmYzU5OTk3NmMwYjhiMjlj
YWYyY2Y4MjIxMmMwZjA1YmVkMjMzYzhmOGVkNTNlNGY2ZTFkMzU2IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImU0ZGJjMjllMjU3NTM2NWQxNWUyNzJmNzY5MzI5MTA2Mjc3NjQ5YWVhMDgxZTIxMTlj
ZjQzZDY2OTUwZjhmOGYiCiAKIENWRV9QUk9EVUNUID0gInB5Y3J5cHRvZG9tZTpweWNyeXB0b2Rv
bWUgcHljcnlwdG9kb21lOnB5Y3J5cHRvZG9tZXgiCiAKLS0gCjIuNDcuMQoK

--===============6702676697227710732==--
