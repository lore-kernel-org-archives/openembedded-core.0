Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id CECB577108
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:07 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so15285069pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=t6qoB19WetI2+6yozwSmO+Xorx5DhEVAnavw3TryRLA=;
	b=pB4K3KD6NmS1jyJGFPatuBZISJ7cM1fXVkWNx0Xx4Ner6mCTIYm5m/oe7XETrNwfyq
	oeXPK6qSKLJkIKI2Atmav6yXRSiO2ldoH7uCEsOLmbruMWSyUY1x8AyXjvu6Ha+bgneZ
	XEHW/aOuya7ir1IWOVwHD0JlpBFNvteJMDFUlu3FwI6ArmFnhJwHJ5bqJKGsEtsec8fj
	u1cy13ANJC1Gx1oZnkgpoJyp2vPFmGQBJL0jQUwWN2ktiDep+IB4LqGUTif/Ouj00M2H
	szLLz+PEsqleJEN7si6HCHs1Zvfofyas6zLToDVUYxY6mz7cY/eCBAe/BszCy6teERPL
	d32Q==
X-Received: by 10.68.164.98 with SMTP id yp2mr14796602pbb.125.1444982408341;
	Fri, 16 Oct 2015 01:00:08 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 00:59:58 -0700
Message-Id: <fba7de7b217620da72b8d4747afb6445edd70319.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
References: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 4/9] coreutils-6.9: Add missing dependency on virtual/libiconv
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:07 -0000

Surfaces on uclibc where libiconv is not coming from libc but from
separate package.

Change-Id: I8eef52a69d2b6830deff94531631ca098bce2a89
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 4ff1d50..8d5b96d 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -9,6 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
 PR = "r5"
+DEPENDS = "virtual/libiconv"
 
 inherit autotools gettext texinfo
 
-- 
2.6.1


