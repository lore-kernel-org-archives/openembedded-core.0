Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16BF76D817
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:19:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rADEJVxn007729
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:19:31 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 13 Nov 2013 06:19:30 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 08:19:01 -0600
Message-ID: <1384352346-12891-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1384305535.git.mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/6 v3] binutils: Ensure old -symlinks packages get removed
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
X-List-Received-Date: Wed, 13 Nov 2013 14:19:29 -0000
Content-Type: text/plain

When the -symlinks package was removed and an RPROVIDES was added, nothing
was put in to cause the removal of the older package in an upgrade.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 17c66bc..77b3718 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -21,6 +21,8 @@ FILES_${PN} = " \
 	${prefix}/${TARGET_SYS}/bin/*"
 
 RPROVIDES_${PN} += "${PN}-symlinks"
+RREPLACES_${PN} += "${PN}-symlinks"
+RCONFLICTS_${PN} += "${PN}-symlinks"
 
 FILES_${PN}-dev = " \
 	${includedir} \
-- 
1.8.3.4


