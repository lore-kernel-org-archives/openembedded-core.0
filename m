Return-Path: <ptsneves@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 84C2D789D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 15:03:06 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id k7-v6so12394577wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 08:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aTAOXJHSu0+ENAIdGB5eSCMMlhdAP+nawuMDGshlprQ=;
	b=D2brWBwS95dpGBQbRq2BPZ2efdBfD5jsYqB9ScC4R1REHvRsjGn863Uuyf1lXdm3cF
	8jUr3JI41yVEXOhLrLNOAjqtjTSFzEHdVSBaOKlptGYPuWWv4W7ZomXBZwNTrcGs5as/
	q0ywXLS6fZK2Gs3eXHKN5C1TvL6NTw8WQETe6mw2ivhFN03OwF5BbhK5+A7F9xK3GqDr
	8hSxOyVlChlM6PKYYiLLHbIllQmY0C15SuBPtWYq7e8WqRkcKvcEohfTVbDrQCr7YwBk
	KaynGvyS8mWhelBKKsV1wmLNoivpizQ5TomKFdSG5vOGsazyoO1E51bJXDH9B496whO+
	aAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aTAOXJHSu0+ENAIdGB5eSCMMlhdAP+nawuMDGshlprQ=;
	b=aV4DmGFpL8YJWblSYmHAvOTzLmGITu+eJWE1c86GHzIohNySvv+NIRCPYXvj5/Hi5p
	CcU2ve/azFgV3kPWyle8ahUpGDkYRd0TA2WlhIK+vh4E97gIXFlLRRJPVDBFycgANv8m
	3fxjovJboYhNhD4BUYxF6H/dJL/5emWNFc+2/ax1v3QwLNwfe/xHafaOMU5Chl9PGBd8
	TZS4F8r/4RM23jk9+3e5vKY9Y6WzdeYhC3jWuCAd5lTJoiEePqPpu+961eJwBPDI2WPa
	EWRbS1bfoP0az+yp/B7wKBAK4HCyD02S9WXR8VIxYvysOJU7bKXpYT2WHTzaD4Ou4sv/
	yuTQ==
X-Gm-Message-State: APt69E1QhGuCK8MKpCp8nwIaBJ/F5D4ATkiZE60zTckWE1cBIE82dosr
	QvNp3I0o47ClbAHSwhld4HAc9z4LYA==
X-Google-Smtp-Source: AAOMgpcBIhecTfF4VyB/7mFDiMsu3zgonyvbQzsQiUmBoV0DGG9oSQJK6+XqHaxSMFsq738hjvT7jg==
X-Received: by 2002:adf:b60d:: with SMTP id
	f13-v6mr19057499wre.186.1530543787129; 
	Mon, 02 Jul 2018 08:03:07 -0700 (PDT)
Received: from pneves.emea.nsn-net.net (59.38.103.87.rev.vodafone.pt.
	[87.103.38.59]) by smtp.gmail.com with ESMTPSA id
	k12-v6sm19282478wrr.40.2018.07.02.08.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 08:03:06 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 17:03:03 +0200
Message-Id: <20180702150303.12778-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] gtest, gmock: Created a git version of gtest.
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
X-List-Received-Date: Mon, 02 Jul 2018 15:03:06 -0000

There are no new tag releases of the googletest
repositories for 2 years, while development
continued.
Created a new recipe for non tagged release
hash. This new recipe does not require the
package config patch as it is supported by
upstream.

Refactored common recipe data in an include
file.
---
 meta-oe/recipes-test/gtest/gtest.inc      | 19 +++++++++++++++++++
 meta-oe/recipes-test/gtest/gtest_1.8.0.bb | 20 +-------------------
 meta-oe/recipes-test/gtest/gtest_git.bb   |  6 ++++++
 3 files changed, 26 insertions(+), 19 deletions(-)
 create mode 100644 meta-oe/recipes-test/gtest/gtest.inc
 create mode 100644 meta-oe/recipes-test/gtest/gtest_git.bb

diff --git a/meta-oe/recipes-test/gtest/gtest.inc b/meta-oe/recipes-test/gtest/gtest.inc
new file mode 100644
index 000000000..7a834ef25
--- /dev/null
+++ b/meta-oe/recipes-test/gtest/gtest.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "Google's framework for writing C++ tests"
+HOMEPAGE = "https://github.com/google/googletest"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
+                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
+
+PROVIDES += "gmock"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dbg = "1"
+
+RDEPENDS_${PN}-dev += "${PN}-staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
index 48cf4e04b..b264862f1 100644
--- a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
+++ b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
@@ -1,24 +1,6 @@
-DESCRIPTION = "Google's framework for writing C++ tests"
-HOMEPAGE = "https://github.com/google/googletest"
-SECTION = "libs"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
-                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
-
-PROVIDES += "gmock"
-
-S = "${WORKDIR}/git"
+require gtest.inc
 SRCREV = "ec44c6c1675c25b9827aacd08c02433cccde7780"
 SRC_URI = "\
     git://github.com/google/googletest.git;protocol=https; \
     file://Add-pkg-config-support.patch \
 "
-
-inherit cmake
-
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-dbg = "1"
-
-RDEPENDS_${PN}-dev += "${PN}-staticdev"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-test/gtest/gtest_git.bb b/meta-oe/recipes-test/gtest/gtest_git.bb
new file mode 100644
index 000000000..2f091b2c7
--- /dev/null
+++ b/meta-oe/recipes-test/gtest/gtest_git.bb
@@ -0,0 +1,6 @@
+require gtest.inc
+SRCREV = "ba96d0b1161f540656efdaed035b3c062b60e006"
+SRC_URI = "\
+    git://github.com/google/googletest.git;protocol=https; \
+"
+
-- 
2.14.1


