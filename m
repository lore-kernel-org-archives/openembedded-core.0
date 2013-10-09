Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 813C16CBAB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 09:57:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r999vCkw020069
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Oct 2013 02:57:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 9 Oct 2013 02:57:12 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Oct 2013 17:57:35 +0800
Message-ID: <9ef35bf09179b8935ed7b64e386c23a30b885e14.1381312594.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381312594.git.Qi.Chen@windriver.com>
References: <cover.1381312594.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] device_table-minimal.txt: change group of /dev/hda back to disk
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
X-List-Received-Date: Wed, 09 Oct 2013 09:57:10 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The group for /dev/hda should be disk instead of root.
The group ID for /dev/hda was 6, but it was modified to be root by
accident in the following commit.

	 commit c5ef0294a9b8d178896a47c9f5d6e3dd6797e343
	     device_table-minimal.txt: use user/group names instead of uid/gid

This patch changes it back.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/files/device_table-minimal.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
index 6ac741a..56c74bb 100644
--- a/meta/files/device_table-minimal.txt
+++ b/meta/files/device_table-minimal.txt
@@ -12,8 +12,8 @@
 /dev/initctl	p	600	root	root	-	-	-	-	-
 /dev/apm_bios	c	660	root	plugdev	10	134	-	-	-
 /dev/fb0	c	600	root	root	29	0	-	-	-
-/dev/hda	b	660	root	root	3	0	-	-	-
-/dev/hda	b	660	root	root	3	1	1	1	19
+/dev/hda	b	660	root	disk	3	0	-	-	-
+/dev/hda	b	660	root	disk	3	1	1	1	19
 /dev/kmem	c	640	root	kmem	1	2	-	-	-
 /dev/kmsg	c	600	root	root	1	11	-	-	-
 /dev/mem	c	640	root	kmem	1	1	-	-	-
-- 
1.7.9.5


