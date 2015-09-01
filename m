Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E357977015
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:34:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t81LYWwn008275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Sep 2015 14:34:32 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 1 Sep 2015 14:34:31 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Sep 2015 14:34:30 -0700
Message-ID: <1441143270-27322-3-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1441143270-27322-1-git-send-email-jslater@windriver.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ifupdown: create alternative links
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
X-List-Received-Date: Tue, 01 Sep 2015 21:34:32 -0000
Content-Type: text/plain

Inherit update-alternatives so links are created.  ifup
and ifdown are higher priority than the versions provided
by busybox.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb b/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb
index e29cc49..24eb87b 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb
@@ -18,7 +18,7 @@ EXTRA_OEMAKE = ""
 S = "${WORKDIR}/ifupdown-${PV}ubuntu5"
 
 
-inherit update-rc.d
+inherit update-rc.d update-alternatives
 
 do_compile () {
 	chmod a+rx *.pl *.sh
-- 
1.7.9.5


