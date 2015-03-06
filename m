Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3179273902
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:32:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t269WeNd000480
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2015 01:32:40 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 01:32:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 01:32:38 -0800
Message-ID: <1eade737f0d2e1279a75c27335e110140b28503f.1425634271.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425634271.git.liezhi.yang@windriver.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] apt: fix SRC_URI
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
X-List-Received-Date: Fri, 06 Mar 2015 09:32:39 -0000
Content-Type: text/plain

The old one is not available any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/apt/apt.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 378021a..12dfcaf 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
+SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/apt_0.9.9.4.tar.gz \
            file://no-ko-translation.patch \
            file://use-host.patch \
            file://makerace.patch \
-- 
1.7.9.5


