Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9818DC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:07:06 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.11903.1751026020421771842
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=L75ifGNe;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=2668831fb=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751026023; x=1782562023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c8IzYQhCVVMX7UvORlJ+q/LcjxoPvfmRifbvTO9cvac=;
  b=L75ifGNe/EHPu0Qf55+6OOFNl/0GDbnmiPSsPLwKo3hoVp0L8PJQRCHg
   WdvJzIuKUWyzqsiz/X1e9peYMPGNnxDXwG2ZMgG3mBmE/Xwy7kv1tYDf4
   pQ2xEgaSvmRyWblb16jzHQZOahl8fbePR8KsEmSQkb0Nnbix/40oVkFFa
   4=;
X-CSE-ConnectionGUID: tBeRikbWR7++zmRy27mOeQ==
X-CSE-MsgGUID: K7PFDhknQm+a42oD8mWWmQ==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 27 Jun 2025 14:07:02 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw1.muc with ESMTP/TLS;
 27 Jun 2025 14:07:03 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 27 Jun 2025 14:07:03 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.211) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 27 Jun 2025 14:07:02 +0200
X-CSE-ConnectionGUID: fkWeT0OWTpOkxpRT/fvzoA==
X-CSE-MsgGUID: HsBdxZ7ITZ2D1OwkYWXtZQ==
X-CSE-ConnectionGUID: jgXdDoGmTLu0oOhdrr28Uw==
X-CSE-MsgGUID: hn04zABxRN+CFLp4SKY/XQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH 2/4] cmake: Update license checksums
Date: Fri, 27 Jun 2025 14:06:31 +0200
Message-ID: <20250627120633.4084140-3-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627120633.4084140-1-Moritz.Haase@bmw.de>
References: <20250627120633.4084140-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15e.europe.bmw.corp (2a03:1e80:a15:58f::1:61) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219396

The main license file has been renamed from Copyright.txt to LICENSE.rst in [0].
References to the file have been updated, causing changes to the licensing
header in 'cmake.h' (see [1]).

Additionally, the '1996 - 2024' copyright statement in (cm)curl's COPYING was
updated to '1996 - 2025' in [2].

[0]: https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b6598c76ea5d51510013565e
[1]: https://gitlab.kitware.com/cmake/cmake/-/commit/de273b2e115974a012a6204ffee046dc9ce77586
[2]: https://gitlab.kitware.com/cmake/cmake/-/commit/48b13baebc7f99442c3b872f202efd2fb92d6d7f

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta/recipes-devtools/cmake/cmake-native_4.0.3.bb | 2 +-
 meta/recipes-devtools/cmake/cmake.inc             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb b/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
index 6b392f1370..7b90bff52f 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmexpat/COPYING;md5=7b3b078238d0901d3b339289117cb7fb \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
-    file://Utilities/cmcurl/COPYING;md5=eed2e5088e1ac619c9a1c747da291d75 \
+    file://Utilities/cmcurl/COPYING;md5=72f4e9890e99e68d77b7e40703d789b8 \
 "
 
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 312c2b04f7..a15dfd3bb4 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=718f05155941b33862726348d3cd46ce \
-                    file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0cafc0f3b6b28f3d5ecb5d1a68c36471 \
+                    file://Source/cmake.h;beginline=1;endline=2;md5=4ba59ac0e953e1a713eea8c55b1d531b \
                     "
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"

