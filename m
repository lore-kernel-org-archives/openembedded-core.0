Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07DDE6A9E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 06:11:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7D6Bxpi024698
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 23:12:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 12 Aug 2013 23:11:59 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2013 14:11:51 +0800
Message-ID: <e158704609a78fbeba71221838b39f42980c6d51.1376363071.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376363071.git.Qi.Chen@windriver.com>
References: <cover.1376363071.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 3/3] device_table-minimal.txt: use user/group names instead of uid/gid
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
X-List-Received-Date: Tue, 13 Aug 2013 06:11:59 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Instead of hard coding the uid/gid, we prefer the way of using user/group
names.

Note the way of using uid/gid is still supported.

[YOCTO #1159]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/files/device_table-minimal.txt |   42 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
index 02ed534..6ac741a 100644
--- a/meta/files/device_table-minimal.txt
+++ b/meta/files/device_table-minimal.txt
@@ -8,24 +8,24 @@
 #    b	Block special device file
 #    p	Fifo (named pipe)
 
-/dev		d	755	0	0	-	-	-	-	-
-/dev/initctl	p	600	0	0	-	-	-	-	-
-/dev/apm_bios	c	660	0	46	10	134	-	-	-
-/dev/fb0	c	600	0	0	29	0	-	-	-
-/dev/hda	b	660	0	6	3	0	-	-	-
-/dev/hda	b	660	0	6	3	1	1	1	19
-/dev/kmem	c	640	0	15	1	2	-	-	-
-/dev/kmsg	c	600	0	0	1	11	-	-	-
-/dev/mem	c	640	0	15	1	1	-	-	-
-/dev/null	c	666	0	0	1	3	-	-	-
-/dev/ram	b	640	0	0	1	0	0	1	4
-/dev/tty	c	662	0	5	5	0	-	-	-
-/dev/tty	c	666	0	5	4	0	0	1	9
-/dev/ttyS	c	640	0	5	4	64	0	1	1
-/dev/ttySA	c	640	0	5	204	5	0	1	1
-/dev/zero	c	644	0	0	1	5	-	-	-
-/dev/mtd	c	660	0	6	90	0	0	2	8
-/dev/mtdblock	b	640	0	0	31	0	0	1	8
-/dev/console	c	662	0	5	5	1	-	-	-
-/dev/random	c	644	0	0	1	8	-	-	-
-/dev/urandom	c	644	0	0	1	9	-	-	-
+/dev		d	755	root	root	-	-	-	-	-
+/dev/initctl	p	600	root	root	-	-	-	-	-
+/dev/apm_bios	c	660	root	plugdev	10	134	-	-	-
+/dev/fb0	c	600	root	root	29	0	-	-	-
+/dev/hda	b	660	root	root	3	0	-	-	-
+/dev/hda	b	660	root	root	3	1	1	1	19
+/dev/kmem	c	640	root	kmem	1	2	-	-	-
+/dev/kmsg	c	600	root	root	1	11	-	-	-
+/dev/mem	c	640	root	kmem	1	1	-	-	-
+/dev/null	c	666	root	root	1	3	-	-	-
+/dev/ram	b	640	root	root	1	0	0	1	4
+/dev/tty	c	662	root	tty	5	0	-	-	-
+/dev/tty	c	666	root	tty	4	0	0	1	9
+/dev/ttyS	c	640	root	tty	4	64	0	1	1
+/dev/ttySA	c	640	root	tty	204	5	0	1	1
+/dev/zero	c	644	root	root	1	5	-	-	-
+/dev/mtd	c	660	root	disk	90	0	0	2	8
+/dev/mtdblock	b	640	root	root	31	0	0	1	8
+/dev/console	c	662	root	tty	5	1	-	-	-
+/dev/random	c	644	root	root	1	8	-	-	-
+/dev/urandom	c	644	root	root	1	9	-	-	-
-- 
1.7.9.5


