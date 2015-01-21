Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE4671144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 18:52:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0LIqC41016314
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 10:52:12 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 10:52:11 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2015 13:52:16 -0500
Message-ID: <1421866336-17183-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Subject: [PATCH] procps: disable fancy new top output mode
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
X-List-Received-Date: Wed, 21 Jan 2015 18:52:14 -0000
Content-Type: text/plain

General consensus is that the new output format, with the all red
colour and one line per core is too fugly to be left as the default.

Use the configure option to switch it back to the sane default that
we've all become used to seeing for decades.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-extended/procps/procps_3.3.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.10.bb b/meta/recipes-extended/procps/procps_3.3.10.bb
index d8b04dc204a0..621b6dd5786c 100644
--- a/meta/recipes-extended/procps/procps_3.3.10.bb
+++ b/meta/recipes-extended/procps/procps_3.3.10.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "a02e6f98974dfceab79884df902ca3df30b0e9bad6d76aee0fb5dce17f
 
 S = "${WORKDIR}/procps-ng-${PV}"
 
-EXTRA_OECONF = "--enable-skill"
+EXTRA_OECONF = "--enable-skill --disable-modern-top"
 
 CPPFLAGS += "-I${S}"
 
-- 
2.2.1


