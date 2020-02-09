Return-Path: <scott.branden@broadcom.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0879960CC9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 19:33:34 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so1510622wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 11:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=t4/oraNAOn3tGz9yRjE4QXrYw5MI4sJUNjAb0ziAZTQ=;
	b=gH+J1RUlowH896j92SZjJIu40rE9OaNDv19ttNpmOesQ+WP8h10O2qMrvVyQ8gvxH5
	aUNLcroDu4793Xaejw03Lhd9l3x5R28siYY8KxtZeG2xlC00PZRTF+gmryhsEJNgTAAI
	sNUOEeh0wJsMD+VnmVgHJd8M0X0Yae1FDal/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t4/oraNAOn3tGz9yRjE4QXrYw5MI4sJUNjAb0ziAZTQ=;
	b=BQaimpGNCgFY9XCLCXot7XgGNQGFHKxeuIWlzwd0Pt/vv7yBrHy3tAFezEC6YvC4/3
	D9ADJ83DeVe+A4QLPrO6jUBv9bwff/a2H+YEFdJuXQqq1jMwryjJP01BZtjz5hca60Wp
	5LTbmfTjfPJHLjz+nTjSLXd+oywvOj/hiDQ1wTY4FCJQ7aufh8oaCXYvVodqnF2EanQA
	RNdWrLddLNjHemSMTcZZP/75yitdB21FUtNBSd3YJVaB/JCCtz56a3WoPEnGcnLJh4ek
	mh6HK7/N+QAz6ygeyGYNYBWI0k9oiaSzYeyoHJMK74/if4BNMv2+SdhMDzYybwAORT2k
	oQPQ==
X-Gm-Message-State: APjAAAWSrevyAF20o7VzhqYGT4SPZqFdAljmL0m9GqfHm6r6JD62oc7L
	1aEOCjP4IowrKCcp4rpCmIQ+GCLHF9BNT1LxJ8GZSPsDEJLSzkSJfdszYS3tzpYFRTimkmwegWp
	ady0bckfti5s4m2ePdxFrUlZu0iB+lXNyzHS3Na8H9qr3OJunbxnnSonxN0i0HkwUbUToH3PruY
	POOVhvYRfaExpsW1UjunoOVPe/G0c=
X-Google-Smtp-Source: APXvYqwq251awWMyQJvZVi7qFATvIE1NvCDVT4PdgFqkJ4OxrJ0Yp+RVeobmow1ijZycqy4bC4+Kqg==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr11511471wmk.68.1581276815275; 
	Sun, 09 Feb 2020 11:33:35 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	u14sm13123021wrm.51.2020.02.09.11.33.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 11:33:34 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Feb 2020 11:33:18 -0800
Message-Id: <20200209193319.4378-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3 1/2] x265: add x265 recipe
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
X-List-Received-Date: Sun, 09 Feb 2020 19:33:35 -0000

Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-multimedia/x265/x265_3.2.1.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-multimedia/x265/x265_3.2.1.bb

diff --git a/meta/recipes-multimedia/x265/x265_3.2.1.bb b/meta/recipes-multimedia/x265/x265_3.2.1.bb
new file mode 100644
index 0000000000..3a41475be7
--- /dev/null
+++ b/meta/recipes-multimedia/x265/x265_3.2.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "H.265/HEVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
+HOMEPAGE = "http://www.videolan.org/developers/x265.html"
+
+LICENSE = "GPLv2"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
+
+DEPENDS = "nasm-native gnutls zlib libpcre"
+
+SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
+
+S = "${WORKDIR}/x265_${PV}/source"
+
+SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
+SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
+
+inherit lib_package pkgconfig cmake
+
+AS[unexport] = "1"
-- 
2.17.1


