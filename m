Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5506013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 23:25:48 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id pv5so27340624pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 15:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=EwRGK9iEL6Vp1bzSuS147DOiTJPm0vvkTk2gapfnuVU=;
	b=v211WNMpWf8CKBU+yE9p2mG99VD16+5PAUab4xz8zEclBiNqQBlt9G9CXMihDw22AB
	BYwYgwlWoyXwNZjS1ve/m92Hj0O7pqGDZBNlqBSihPHh6TsS5p7WI9vFmGLR1x93j7NT
	IbUjNI/+KI8gqS+voeamZrcojIcVBTf9+V1/tuLmAPcVDYktZWWK8y1u9Z5OPFF7XhSo
	jYHLxEdo4nPVgxgDbUr7eozRi0gTYLPZWAMn6zlNFMjM5TfesjwXRIXSRGidBA7OzBXt
	d/pzTfcoOyHOQMeklEC+NvvbYIB8cNRzZXN0WytPQjTFPiqJbzq+YSulKDDcvaSusR16
	y32g==
X-Received: by 10.66.144.5 with SMTP id si5mr23910414pab.51.1452641148924;
	Tue, 12 Jan 2016 15:25:48 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	s84sm32754733pfa.74.2016.01.12.15.25.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jan 2016 15:25:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:25:43 -0800
Message-Id: <cover.1452640824.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 00/13] Jethro, Fido openssl and libxml security fixes vi git
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
X-List-Received-Date: Tue, 12 Jan 2016 23:25:48 -0000

changes in contrib branch for alt integration.

The following changes since commit 0073b234d793099a371b2e529f740987decce756:

  yocto-bsp: Typo on the file extension (2016-01-07 12:13:55 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_sec_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_sec_fixes

Armin Kuster (13):
  openssl: fix for CVE-2015-3193
  openssl: fix for CVE-2015-3194
  openssl: fix for CVE-2015-3195
  libxml2: security fix CVE-2015-7941
  libxml2: security fix CVE-2015-8317
  libxml2: security fix CVE-2015-7942
  libxml2: security fix CVE-2015-8035
  libxml2: security fix CVE-2015-7498
  libxml2: security fix CVE-2015-7497
  libxml2: security fix CVE-2015-7499
  libxml2: security fix CVE-2015-7500
  libxml2: security fix CVE-2015-8242
  libxml2: security fix CVE-2015-5312

 .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |  66 ++++++++++
 ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101 +++++++++++++++
 .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |  45 +++++++
 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  66 ++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   4 +
 meta/recipes-core/libxml/libxml2.inc               |  14 +++
 ...-2015-5312-Another-entity-expansion-issue.patch |  39 ++++++
 ...97-Avoid-an-heap-buffer-overflow-in-xmlDi.patch |  40 ++++++
 ...00-Fix-memory-access-error-due-to-incorre.patch | 131 +++++++++++++++++++
 ...2015-8035-Fix-XZ-compression-support-loop.patch |  38 ++++++
 ...42-Buffer-overead-with-HTML-parser-in-pus.patch |  49 ++++++++
 ...n-name-parsing-at-the-end-of-current-inpu.patch | 138 +++++++++++++++++++++
 ...ssing-entities-after-encoding-conversion-.patch |  89 +++++++++++++
 ...99-1-Add-xmlHaltParser-to-stop-the-parser.patch |  88 +++++++++++++
 ...VE-2015-7499-2-Detect-incoherency-on-GROW.patch |  43 +++++++
 ...top-parsing-on-entities-boundaries-errors.patch |  39 ++++++
 ...leanup-conditional-section-error-handling.patch |  56 +++++++++
 ...ror-in-previous-Conditional-section-patch.patch |  35 ++++++
 ...iation-of-overflow-in-Conditional-section.patch |  39 ++++++
 ...ng-early-on-if-encoding-conversion-failed.patch |  42 +++++++
 20 files changed, 1162 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-5312-Another-entity-expansion-issue.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-Detect-incoherency-on-GROW.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch

-- 
2.3.5


