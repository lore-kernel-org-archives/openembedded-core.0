Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id D970F605B3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:32 +0000 (UTC)
Received: by pfbg73 with SMTP id g73so44089412pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=89/fuGNBLc9QJEg20dBKaT1SvSIeqWRAkLctvX8c5oE=;
	b=LElVJsKT/ZLkh+SK9GnoiwVC9FpkiMYcxWut9X2B5HR/G1fpxrA4SdixaA07MIL2AC
	uriNovnfxEq85xds0tXKSmFOGw9sgVI7Oe6sUICURY2h8CB2pky/cTh383hPhFD015fR
	Tf8OoVmhk9CNAF0rqwIdWZ5WYM6AxwI8yfHMD29pc/QJYBeUXp9O4H7HDABjNQMuZvaV
	v0tzlDL2Y2PqPrRExuD12k182IfXBOZC6Zkt+vIoM6Z91CATaj0GaWxJwXDMHm6nz7UZ
	HNNPPj8Q7oGhZozf28Y7dzxj4tKXrH+SIr8+G/wzrC+Zh80BIgwFiuDBbFngdgWv8QYQ
	1yKQ==
X-Received: by 10.98.87.83 with SMTP id l80mr31426487pfb.126.1449344133382;
	Sat, 05 Dec 2015 11:35:33 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:14 -0800
Message-Id: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH][jethro][fido][ 00/15] Libxml2: multiple security fixes
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:34 -0000

Each CVE is an independant patch so they can be easily merged to other distros
and/or stable branches.

I have included two previous CVE's sent for jethro which can be ignored.
I put the CVE's in order as there where fixed upstream.

Armin Kuster (15):
  libxml2: security fix CVE-2015-7941-1
  libxml2: security fix CVE-2015-7941-2
  libxml2: security fix CVE-2015-8317
  libxml2: security fix CVE-2015-7942
  libxml2: security fix CVE-2015-7942-2
  libxml2: security fix CVE-2015-8317
  libxml2: security fix CVE-2015-7498
  libxml2: security fix CVE-2015-7497
  libxml2: security fix CVE-2015-7499-1
  libxml2: security fix CVE-2015-7499-2
  libxml2: depend fix security issue CVE-2015-7500
  libxml2: security fix CVE-2015-7500
  libxml2: security fix CVE-2015-8242
  libxml2: security fix CVE-2015-5312
  libxml2: multiple security fixes.

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
 15 files changed, 880 insertions(+)
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


