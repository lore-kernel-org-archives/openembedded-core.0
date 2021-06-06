Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.25798.1623000257717139341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0EAB938C1276
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 4.5.0 SUCCEEDED
Message-ID: <MADEUP.16860E22AEA05BB1.22991@lists.openembedded.org>
X-Groupsio-MsgNum: 152711
Content-Type: multipart/mixed; boundary="===============2100403757044625441=="

--===============2100403757044625441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *4.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-4.3.0-4.5.0.patch
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

--===============2100403757044625441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.9/site-packages/importlib_metadata-4.3.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/importlib_metadata-4.5.0-py3.9.egg-info

--===============2100403757044625441==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-4.3.0-4.5.0.patch"

From f02e5e7fea61e5070b3058bf1d65ecff02bdbc6f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 09:08:09 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 4.3.0 -> 4.5.0

---
 ...ib-metadata_4.3.0.bb => python3-importlib-metadata_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.3.0.bb => python3-importlib-metadata_4.5.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
index f4ac3c44ec..7c156787a0 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "c4646abbce80191bb548636f846e353ff1edc46a06bc536ea0a60d53211dc690"
+SRC_URI[sha256sum] = "b142cc1dd1342f31ff04bb7d022492b09920cb64fed867cd3ea6f80fe3ebd139"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.17.1


--===============2100403757044625441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 4.3.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-4.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-4.5.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "4.3.0" to "4.5.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 4.3.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "4.3.0" to "4.5.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 4.3.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "4.3.0" to "4.5.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 4.3.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "4.3.0" to "4.5.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 4.3.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "4.3.0" to "4.5.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 4.3.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "4.3.0" to "4.5.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 4.3.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "4.3.0" to "4.5.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 90843 to 96456 (+6%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 4.3.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "4.3.0" to "4.5.0"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.9/site-packages/importlib_metadata-4.3.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/importlib_metadata-4.5.0-py3.9.egg-info

--===============2100403757044625441==--
