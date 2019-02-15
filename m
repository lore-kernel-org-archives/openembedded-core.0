Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9F442605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 10:02:35 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v16so9641075wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aum0q10kA8gMT2jXeJ2dh3cVJFPTSTbfNt/2u/nDn5Y=;
	b=WsoE96QELWI5XorSgebPhjQvG0xaBEEvAoE+UQIPz2Ru5OxfG0Kh30Nf192/9lTu1+
	a07o4NSrC5AR3W9MK48gDaT3XstDk9TOBsa6oIsQmliP9Ady4ls0AYOra95psRVjcVXQ
	5/Lx5fhB5J8+qP2kw0tdgvr7LFl/OwP2TcYIzzLmzyNeNhXC9xx0UjojBBSe+MsZphh2
	mx8iW6KEiPuvryLOsV9SbkjZd99e7JeLcTeRCZD7A0j2cjt9mGUKlT6f7r2KQPbPlESD
	fjlBxIXTlPYjz/dUHOR9mqaT/BpwoNfHiMpKbJMl+T5FxNgkwzDl5JVBIzBmNEIwfC/o
	pGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aum0q10kA8gMT2jXeJ2dh3cVJFPTSTbfNt/2u/nDn5Y=;
	b=KM0gAdiRtc+ru+vw77fM10oHjNcdjeuaCL7QWgpxMoyUyBY79y/VAolKhh0Ywp/Y10
	vbuxUTY/U+d+YR87nMrwZIqXzYJ48N7TOQPjJ9qMQLj8SvhnwESTLFQKl/v6Ux0vvEUF
	Q62UVmDIIEfh01kHx3a8xMSDu3srGcHrgQ4HBrnKMcmgWO4JZzX9sPyLGJNeNqKFkbq+
	SEd+Ho5/AAJLyIMl+SllH9TSG84BiwgPizeSntHZmpo4Q1K9QsPtmstn/66QjoLiN8GK
	A81EzSsrfCZIgDDnEpEgkfPY+XhIVz7CPGp4EyiOZawlua9C2kSuyqTOJKx0g7tUeUVz
	kcfQ==
X-Gm-Message-State: AHQUAuaHBNYlFlDjf+2/c4jBHiKZd38HEJhOJfCD/4BGWw+Ba9OZ8bBe
	YSE5jypUVLGXNObuMpkBcmNNNkgCHHYAfA==
X-Google-Smtp-Source: AHgI3IakAALVRgOdV8ZqsGn0Zd6QHh8p40dEHKq2G7MkEDxKHIXAunfeZSHdvghsi63VL481VhrORQ==
X-Received: by 2002:adf:b6a1:: with SMTP id j33mr6060780wre.55.1550224955881; 
	Fri, 15 Feb 2019 02:02:35 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	s127sm3200794wmf.39.2019.02.15.02.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Feb 2019 02:02:35 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 10:02:13 +0000
Message-Id: <1550224933-20658-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Fri, 15 Feb 2019 10:02:35 -0000

bmap-tools 3.5 was released August 2018 but has no release tarball, so
switch to using the git fetcher. Also pull in the fix for StopIteration
being transformed into RuntimeError for Python 3.7.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Drop append of "+git${SRCPV}" to PV

 .../bmap-tools/{bmap-tools_3.4.bb => bmap-tools_3.5.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/bmap-tools/{bmap-tools_3.4.bb => bmap-tools_3.5.bb} (74%)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
similarity index 74%
rename from meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
rename to meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 2aae9a3fe0d8..4609a7071c5a 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -9,12 +9,12 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/v${PV}/${BP}.tgz"
+SRC_URI = "git://github.com/intel/${BPN}"
 
-SRC_URI[md5sum] = "883420183611aa137cbaf68a91ef0d7e"
-SRC_URI[sha256sum] = "0064891270c180c190f41925b0f6fb9cecac3056f1168d2592dbe90e5f226c0a"
+SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
+S = "${WORKDIR}/git"
 
-UPSTREAM_CHECK_URI = "https://github.com/intel/${BPN}/releases"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl"
 
-- 
2.7.4


