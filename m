Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FE8C3525B
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.13892.1646329344108010509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=xR6Wwwoj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017f50e02ce3-a1441d94-9e88-412e-b8c7-e878ccf45cbd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sRC/wQkUpAES4KiK8cPb+9ixn9tTr2MYLoe24krLVz8=;
	b=xR6Wwwoj/HivmB+i/tzypl1NhqmkzA6FIxCBThVopY42s+pHG+N/V8hzE6FPMFvL
	NtmWu95iJqu8TOxYEqR4cKUw4/6WoEd4q6BQFL6RU91Gml5Oh8JsrzDUr0/Kc4BZY3D
	7Ka68vy3Dr9tmMPZmDPH4hT4i3ZAxi26LQZG3vxs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sRC/wQkUpAES4KiK8cPb+9ixn9tTr2MYLoe24krLVz8=;
	b=iOPlotWiP7erT3DFHSvIbn9M99AQ6hrXI9yYF4H8I0uM8IHlovWlkKY3NpzZIrmz
	GBlAtsNilrY9kQp0d4vly/csWKK5U3lIMlOYDQLeRzLpAnXz54ak6c7t1KwP7RkY+4N
	M65brFV9ir6twasl4oeC2B9vcpUJ0V8QHDScQTig=
Content-Type: multipart/mixed; boundary="===============5362221748235591688=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
 =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apt: upgrading to 2.4.0 SUCCEEDED
Message-ID: 
 <0101017f50e02ce3-a1441d94-9e88-412e-b8c7-e878ccf45cbd-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:23 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162674

--===============5362221748235591688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apt* to *2.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apt-upgrade-2.2.4-2.4.0.patch
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
--===============5362221748235591688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/apt/apt-bash-completion: PKGSIZE changed from 7108 to 7513 (+6%)
packages/core2-32-poky-linux/apt/apt-bash-completion: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt/apt-bash-completion: PV changed from "2.2.4" to "2.4.0"
packages/core2-32-poky-linux/apt/apt-dbg: PKGSIZE changed from 53878028 to 55966752 (+4%)
packages/core2-32-poky-linux/apt/apt-dbg: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt/apt-dbg: PV changed from "2.2.4" to "2.4.0"
packages/core2-32-poky-linux/apt/apt-dev: PKGSIZE changed from 446186 to 448023 (+0%)
packages/core2-32-poky-linux/apt/apt-dev: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt/apt-dev: PV changed from "2.2.4" to "2.4.0"
packages/core2-32-poky-linux/apt/apt-doc: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt/apt-doc: PV changed from "2.2.4" to "2.4.0"
packages/core2-32-poky-linux/apt/apt-locale: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt/apt-locale: PV changed from "2.2.4" to "2.4.0"
packages/core2-32-poky-linux/apt/apt-src: PKGSIZE changed from 2863393 to 2888910 (+1%)
packages/core2-32-poky-linux/apt/apt-src: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt/apt-src: PV changed from "2.2.4" to "2.4.0"
packages/core2-32-poky-linux/apt/apt-staticdev: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt/apt-staticdev: PV changed from "2.2.4" to "2.4.0"
packages/core2-32-poky-linux/apt/apt: PKGSIZE changed from 4027916 to 4085041 (+1%)
packages/core2-32-poky-linux/apt/apt: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt/apt: PV changed from "2.2.4" to "2.4.0"
packages/core2-32-poky-linux/apt: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/a/apt/apt_2.2.4.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-Fix-musl-build.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-srvrec-Keep-support-for-older-resolver.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch file://0001-aptwebserver.cc-Include-array.patch" to "http://ftp.debian.org/debian/pool/main/a/apt/apt_2.4.0.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-Fix-musl-build.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch file://0001-aptwebserver.cc-Include-array.patch file://0001-Do-not-init-tables-from-dpkg-configuration.patch file://0001-Revert-
 always-run-dpkg-configure-a-at-the-end-of-our.patch"
packages/core2-32-poky-linux/apt: PKGV changed from 2.2.4 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/apt: PV changed from "2.2.4" to "2.4.0"

--===============5362221748235591688==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-apt-upgrade-2.2.4-2.4.0.patch"

From b6ffe940a07433234fc3fcc555f55e104fa2798d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 13:29:39 +0000
Subject: [PATCH] apt: upgrade 2.2.4 -> 2.4.0

---
 ...-init-tables-from-dpkg-configuration.patch |  2 +-
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  8 ++--
 ...vrec-Keep-support-for-older-resolver.patch | 44 -------------------
 .../apt/{apt_2.2.4.bb => apt_2.4.0.bb}        |  5 ++-
 4 files changed, 8 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch
 rename meta/recipes-devtools/apt/{apt_2.2.4.bb => apt_2.4.0.bb} (94%)

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 72713c3b1a..59b9cd190f 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From c7a79e753e50f1a5f248ba5812c61616f2f524f0 Mon Sep 17 00:00:00 2001
+From 11ba49594ae9d11f0070198c146b5e437fa83022 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 1517b47858..593ed7d096 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 393ac20efc66bfc000a2457e093e369b934c5a50 Mon Sep 17 00:00:00 2001
+From 47c2b42af60ceefd8ed52b32a3a365facf0e05b8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 46a6dee..8617a9e 100644
+index 93effa9..4375781 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1211,12 +1211,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+@@ -1199,12 +1199,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
  	 }
        }
     }
@@ -36,7 +36,7 @@ index 46a6dee..8617a9e 100644
  }
                                                                          /*}}}*/
  void pkgDPkgPM::StartPtyMagic()						/*{{{*/
-@@ -1710,7 +1704,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
+@@ -1741,7 +1735,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
  
        // support subpressing of triggers processing for special
        // cases like d-i that runs the triggers handling manually
diff --git a/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch b/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch
deleted file mode 100644
index 94d67a87ac..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f98c12b9f04ef3a9daec822c210044095b41a0ac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 20 Mar 2021 12:33:34 -0700
-Subject: [PATCH] srvrec: Keep support for older resolver
-
-Some C libraries e.g. musl do not implement the new res_n* APIs
-therefore keep the old implementation as fallback and check __RES
-version macro to determine the API level
-
-Upstream-Status: Submitted [https://github.com/Debian/apt/pull/129]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Julian Andres Klode <julian.klode@canonical.com>
----
- apt-pkg/contrib/srvrec.cc | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/apt-pkg/contrib/srvrec.cc b/apt-pkg/contrib/srvrec.cc
-index 4ca208273..3eb5f1d4c 100644
---- a/apt-pkg/contrib/srvrec.cc
-+++ b/apt-pkg/contrib/srvrec.cc
-@@ -62,6 +62,7 @@ bool GetSrvRecords(std::string name, std::vector<SrvRec> &Result)
-    unsigned char answer[PACKETSZ];
-    int answer_len, compressed_name_len;
-    int answer_count;
-+#if __RES >= 19991006
-    struct __res_state res;
- 
-    if (res_ninit(&res) != 0)
-@@ -71,6 +72,12 @@ bool GetSrvRecords(std::string name, std::vector<SrvRec> &Result)
-    std::shared_ptr<void> guard(&res, res_nclose);
- 
-    answer_len = res_nquery(&res, name.c_str(), C_IN, T_SRV, answer, sizeof(answer));
-+#else
-+   if (res_init() != 0)
-+      return _error->Errno("res_init", "Failed to init resolver");
-+
-+   answer_len = res_query(name.c_str(), C_IN, T_SRV, answer, sizeof(answer));
-+#endif //__RES >= 19991006
-    if (answer_len == -1)
-       return false;
-    if (answer_len < (int)sizeof(HEADER))
--- 
-2.31.0
-
diff --git a/meta/recipes-devtools/apt/apt_2.2.4.bb b/meta/recipes-devtools/apt/apt_2.4.0.bb
similarity index 94%
rename from meta/recipes-devtools/apt/apt_2.2.4.bb
rename to meta/recipes-devtools/apt/apt_2.4.0.bb
index aef309840b..329a761443 100644
--- a/meta/recipes-devtools/apt/apt_2.2.4.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.0.bb
@@ -10,10 +10,11 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Disable-documentation-directory-altogether.patch \
            file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
-           file://0001-srvrec-Keep-support-for-older-resolver.patch \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
+           file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
+           file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -26,7 +27,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "6eecd04a4979bd2040b22a14571c15d342c4e1802b2023acb5aa19649b1f64ea"
+SRC_URI[sha256sum] = "728c69df369cbc4a55f91fc2817fe9832c1a2f39de4142e7ef222c5158f234af"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.27.0


--===============5362221748235591688==--

