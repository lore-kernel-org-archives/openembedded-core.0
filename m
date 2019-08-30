Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-27.clustermail.de (good-out-27.clustermail.de
	[212.223.161.2])
	by mail.openembedded.org (Postfix) with ESMTP id C6D797F2F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:26:43 +0000 (UTC)
Received: from [10.0.0.10] (helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1i3bIs-00080n-O7
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Aug 2019 09:26:44 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1i3bIs-00052B-MW
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Aug 2019 09:26:38 +0200
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Fri, 30 Aug 2019 09:26:38 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2019 09:24:21 +0200
Message-ID: <20190830072421.4586-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190729123142.2332.94789@do>
References: <20190729123142.2332.94789@do>
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: [PATCH v2] image.bbclass: Fix debug output for rootfs size
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
X-List-Received-Date: Fri, 30 Aug 2019 07:26:44 -0000
Content-Type: text/plain

The debug output showed the wrong variable.

Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7fa4ff20bd..f4633da3d5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -526,7 +526,7 @@ def get_rootfs_size(d):
     base_size = size_kb * overhead_factor
     bb.debug(1, '%f = %d * %f' % (base_size, size_kb, overhead_factor))
     base_size2 = max(base_size, rootfs_req_size) + rootfs_extra_space
-    bb.debug(1, '%f = max(%f, %d)[%f] + %d' % (base_size2, base_size, rootfs_req_size, max(base_size, rootfs_req_size), overhead_factor))
+    bb.debug(1, '%f = max(%f, %d)[%f] + %d' % (base_size2, base_size, rootfs_req_size, max(base_size, rootfs_req_size), rootfs_extra_space))
 
     base_size = base_size2
     if base_size != int(base_size):
-- 
2.17.1


