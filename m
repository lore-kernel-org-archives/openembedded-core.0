Return-Path: <scott.branden@broadcom.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5515660F02
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 00:01:19 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so4229790wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 16:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Tespscwymm5OpAaOL5XC2CU2Iuw1/If3E8DiiTeyHRQ=;
	b=STh0ss20KV4IoOM7593X09EvEDxKRl3VIDhIj9bwgv1VZogwGwpHy81Y/eTQfDicKb
	HNE5AzDMhS6xYEzIEIIAaDlvxrtzLwK1FWXN7UxwA1gpVmLHGBUudAn2SujQT37flfiv
	OjZeEgd1+EjWUBSmlrqP0cRdL4Gek1Q/gZnZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tespscwymm5OpAaOL5XC2CU2Iuw1/If3E8DiiTeyHRQ=;
	b=FPg8/ZztdJDQNRr54YIEWy/CNsv6cgIZhlT2/IDrcgkz2121mDo01pmt0P+3BRE6Sk
	DJ2XWJQBPaJ32LT0LnWLzB/fxQrCZOp4PyYOyRCF+2HubLADkyimU8JAgfECV+LkB8JZ
	oMc1HugafhBbkbFEe9nDFEGeW31F0gPGn2z/Qy9aLiZkLj2iVr1L2Lei2XdA3aYhlYoP
	bnWdlW8nY2ebvKQdfhTk160hmQowFytAUX1c4Au5hqKMUxyeBBHhhWYCAor2z05lSpdo
	p4Cz5QVkDzwjOyePRwSJRScsiZWQKIP4GQxsIeRwYFtoxdKPiY+gsexqVaRMhOYBPy99
	Q9Kw==
X-Gm-Message-State: APjAAAXE4PxP1Ki3NzNTOe+7sZ33njnyPhOlOTCPYLYeCGKvNoIkRlFO
	6ewf4cSohucLCcPGVSaoizy//YKu1UYg3cUc/nYkxwEy/Gpq6PbRb3q7kVqXVAlgGRjN3BvLQbS
	Gp6/+/17PCdk0gqMR0qeb3KRpfGaFaey963SfKcxGDQ41649quMUyqYVhDCea3i2rJQ2aZQuuvr
	qqMAK4JF/YnXsOdppWLDcdJLZ5
X-Google-Smtp-Source: APXvYqw7DcQa9ERhb2skWphfEkX6QuN4gvUCMP4nMNyO3Vx50KMexlCY+Ff6GRrHbBeiw8Nd75y7UQ==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr753234wme.82.1581120079343;
	Fri, 07 Feb 2020 16:01:19 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id i2sm5307230wmb.28.2020.02.07.16.01.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 16:01:18 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 16:01:09 -0800
Message-Id: <20200208000110.29065-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2 1/2] x265: add x265 recipe
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
X-List-Received-Date: Sat, 08 Feb 2020 00:01:19 -0000

Add x265 recipe from latest revision of stable branch.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-multimedia/x265/x265_git.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-multimedia/x265/x265_git.bb

diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
new file mode 100644
index 0000000000..796fbbc13a
--- /dev/null
+++ b/meta/recipes-multimedia/x265/x265_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "H.265/HEVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
+HOMEPAGE = "http://www.videolan.org/developers/x265.html"
+
+LICENSE = "GPLv2"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
+
+DEPENDS = "gnutls zlib libpcre"
+
+SRC_URI = "git://github.com/videolan/x265;branch=stable \
+          "
+
+SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
+
+S = "${WORKDIR}/git/source"
+
+inherit lib_package pkgconfig cmake
+
+AS[unexport] = "1"
-- 
2.17.1


