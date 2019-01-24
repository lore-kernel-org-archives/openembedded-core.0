Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9B2E79D6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:42:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O6ggJU026256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:42:42 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:42:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 15:01:06 +0800
Message-ID: <0a0070e6ff9710936215a9c52ed68b755cf65249.1548313250.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1548313250.git.liezhi.yang@windriver.com>
References: <cover.1548313250.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagegroup.bbclass: Set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Thu, 24 Jan 2019 06:42:40 -0000
Content-Type: text/plain

It doesn't need them since no compile happens.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/packagegroup.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index d540d42..94a59e0 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -48,6 +48,8 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
 
+INHIBIT_DEFAULT_DEPS = "1"
+
 python () {
     if bb.data.inherits_class('nativesdk', d):
         return
-- 
2.7.4


