Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F43E65DD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:11:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6BqtR026368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:11:53 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:11:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:11:49 -0700
Message-ID: <516674acc60c39bb9b7e020f8d7e1c7cbb88c36c.1408342098.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408342098.git.liezhi.yang@windriver.com>
References: <cover.1408342098.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] lttng-ust: add python-core to RDEPENDS_lttng-ust-bin
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
X-List-Received-Date: Mon, 18 Aug 2014 06:11:55 -0000
Content-Type: text/plain

There is only one script lttng-gen-tp which is a python in
lttng-ust-bin, and it is a python script.

And the lttng-ust doesn't have to rdepend on python.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
index 1468fc1..71ea5bc 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
 inherit autotools lib_package
 
 DEPENDS = "liburcu util-linux"
+RDEPENDS_${PN}-bin = "python-core"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "lttng2-ust"
-- 
1.7.9.5


