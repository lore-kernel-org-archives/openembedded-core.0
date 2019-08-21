Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA8187E447
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 20:01:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7LK1SHs014048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 13:01:28 -0700 (PDT)
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 21 Aug 2019 13:01:28 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Aug 2019 16:01:06 -0400
Message-ID: <1566417666-22515-2-git-send-email-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566417666-22515-1-git-send-email-Trevor.Gamblin@windriver.com>
References: <1566417666-22515-1-git-send-email-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] quilt: added less to RDEPENDS list
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
X-List-Received-Date: Wed, 21 Aug 2019 20:01:27 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

The quilt "series" option relies on "less -R", but
BusyBox's implementation of less does not provide -R. It
could be determined how to enable it in busybox's recipe,
but given the use case it likely isn't needed.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index dcba62c..433e9b4 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -78,7 +78,7 @@ FILES_guards = "${bindir}/guards"
 FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
 FILES_guards-doc = "${mandir}/man1/guards.1"
 
-RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux"
+RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux less"
 RDEPENDS_${PN}_class-native = "diffstat-native patch-native bzip2-native"
 
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
-- 
2.7.4


