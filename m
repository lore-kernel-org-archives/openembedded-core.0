Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5102660745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 02:57:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3I2vBHm029149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Apr 2016 19:57:11 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Apr 2016 19:57:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Apr 2016 19:57:08 -0700
Message-ID: <1dc231d4e16a29c432524c1dcbce24be1e5e61cc.1460947932.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460947932.git.liezhi.yang@windriver.com>
References: <cover.1460947932.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta.bbclass: set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Mon, 18 Apr 2016 02:57:11 -0000
Content-Type: text/plain

The recipe which inherits meta.bbclass doesn't require any default deps.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/meta.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meta.bbclass b/meta/classes/meta.bbclass
index 5e68902..aefcdb6 100644
--- a/meta/classes/meta.bbclass
+++ b/meta/classes/meta.bbclass
@@ -2,3 +2,5 @@
 PACKAGES = ""
 
 do_build[recrdeptask] = "do_build"
+
+INHIBIT_DEFAULT_DEPS = "1"
-- 
2.8.0


