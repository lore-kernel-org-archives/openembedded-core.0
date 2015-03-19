Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 58AF76AC3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:33:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5X6Pd025215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:33:06 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 22:33:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 22:33:03 -0700
Message-ID: <d0459a0e1fef149b00b9855510d030cbc0cd8f25.1426743145.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426743145.git.liezhi.yang@windriver.com>
References: <cover.1426743145.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] groff: fix HOMEPAGE
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
X-List-Received-Date: Thu, 19 Mar 2015 05:33:05 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index 63f0425..6e84587 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNU Troff software"
 DESCRIPTION = "The groff (GNU troff) software is a typesetting package which reads plain text mixed with \
 formatting commands and produces formatted output."
 SECTION = "base"
-HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
+HOMEPAGE = "http://www.gnu.org/software/groff/"
 LICENSE = "GPLv3"
 PR = "r1"
 
-- 
1.7.9.5


