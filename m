Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1CF6C182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 09:01:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBR90n3U005831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 01:00:59 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 27 Dec 2018 01:00:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2018 00:59:43 -0800
Message-ID: <4fe4710d8d64267c7d620a24ffbe8f4ea7990649.1545901142.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545901142.git.liezhi.yang@windriver.com>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] oeqa/utils/qemurunner: Print output when failed to login
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
X-List-Received-Date: Thu, 27 Dec 2018 09:01:08 -0000
Content-Type: text/plain

This is useful for debugging.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 3a9ba02..cce95e1 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -354,6 +354,7 @@ class QemuRunner:
             else:
                 self.logger.debug("Couldn't login into serial console"
                             " as root using blank password")
+                self.logger.debug("The output:\n%s" % output)
         except:
             self.logger.debug("Serial console failed while trying to login")
         return True
-- 
2.10.2


