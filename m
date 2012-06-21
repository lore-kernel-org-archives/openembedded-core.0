Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShaV2-0003oc-9q
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 08:04:12 +0200
Received: by werg55 with SMTP id g55so140734wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 22:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TNgJDc8ZIMZliO76qyRxM7/xMsezoDlDf6a0AOiUqCM=;
	b=qtnoJRRz63HcRihoYoGR/5MSZjV5Ff4z+Jfrl0qLCmny+hqDUabQstUNJ/yszdrZIl
	moo8bgEkizcniiBW62rX9gmj0lELSbeR/RxQU6jBrx9chlkNG+Z+UH8AVW+kBRefCRaj
	6A/WDnelo2tkdZhItGk1fL3OSZFWp2yRuapbXx7wiNyQ89k2UGw7mdjvpg1UKXHLm7Ar
	mdMY8M8Bv8cEVpxxN+zIAQTqA26plnvUNJl5/8GrVtN809gjDPuFVHDfXeb+cDfSTcx/
	Czh3C+b50avVJzhLQG2R7dK7eDI2jLBG9ak8Beg/vhg5eQh2eT/ScaGKqjekAe3RemdU
	BScQ==
Received: by 10.216.196.90 with SMTP id q68mr15433618wen.130.1340258007001;
	Wed, 20 Jun 2012 22:53:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm84553880wiz.9.2012.06.20.22.53.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 22:53:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2012 07:53:18 +0200
Message-Id: <1340257998-965-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <4FE28985.1000501@linux.intel.com>
References: <4FE28985.1000501@linux.intel.com>
Subject: [PATCHv2] opkg-utils: bump SRCREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 06:04:12 -0000

* there are 2 small fixes
  python-2.6 compatibility
  missing C option for opkg-build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 1996c75..b193ba4 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
+SRCREV = "423ecd36b4782327c16f516885d1248249c7724a"
 PV = "0.1.8+git${SRCPV}"
 PR = "r1"
 
-- 
1.7.8.6



