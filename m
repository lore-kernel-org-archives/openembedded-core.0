Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 039A865CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:33:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5X7ig016304
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:33:07 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 22:33:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 22:33:04 -0700
Message-ID: <024b8d3e93ad601f3cb09f3afa3267e19844801d.1426743145.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426743145.git.liezhi.yang@windriver.com>
References: <cover.1426743145.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] tzdata: fix HOMEPAGE
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
X-List-Received-Date: Thu, 19 Mar 2015 05:33:06 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/tzdata/tzdata.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzdata/tzdata.inc b/meta/recipes-extended/tzdata/tzdata.inc
index f13a4fe..37ae926 100644
--- a/meta/recipes-extended/tzdata/tzdata.inc
+++ b/meta/recipes-extended/tzdata/tzdata.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Timezone data"
-HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
+HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1"
-- 
1.7.9.5


