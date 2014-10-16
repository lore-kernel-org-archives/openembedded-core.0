Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 520DA60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 20:47:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9GKlD1q023257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 13:47:13 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 13:47:12 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 13:47:12 -0700
Message-ID: <1413492432-4344-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] cross-localedef-native: provide SRCREV_FORMAT
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
X-List-Received-Date: Thu, 16 Oct 2014 20:47:15 -0000
Content-Type: text/plain

Add SRCREV_FORMAT to provide a composite version number
for get_srcrev() in fetch2 code.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../glibc/cross-localedef-native_2.20.bb           |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
index ccf56a9..8aaa225 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
@@ -36,6 +36,10 @@ EGLIBCPATCHES = "\
 SRCREV_glibc = "b8079dd0d360648e4e8de48656c5c38972621072"
 SRCREV_localedef = "c833367348d39dad7ba018990bfdaffaec8e9ed3"
 
+# Makes for a rather long rev (22 characters), but...
+#
+SRCREV_FORMAT = "glibc__localedef"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-glibc=${S}"
-- 
1.7.3.4


