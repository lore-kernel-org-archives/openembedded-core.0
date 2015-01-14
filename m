Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C44772451
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lgfO003244
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:42 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:22 -0800
Message-ID: <0691e94424d3b85108e4fd3ddb196eec00052afd.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/27] pinentry: separate B and S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:47 -0000
Content-Type: text/plain

It works well now, and bump the PR to avoid:
configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/pinentry/pinentry_0.9.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/pinentry/pinentry_0.9.0.bb b/meta/recipes-support/pinentry/pinentry_0.9.0.bb
index 68d2478..10b329b 100644
--- a/meta/recipes-support/pinentry/pinentry_0.9.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_0.9.0.bb
@@ -8,7 +8,9 @@ HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 
-inherit autotools-brokensep
+PR = "r1"
+
+inherit autotools
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
-- 
1.7.9.5


