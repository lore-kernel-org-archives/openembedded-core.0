Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77030756C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 08:28:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8E8SYJt011713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Sep 2015 01:28:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 14 Sep 2015 01:28:34 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 14 Sep 2015 16:22:46 +0800
Message-ID: <76d99379a666c39cbceaf807758544aacb90b9d3.1442218854.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1442218854.git.kai.kang@windriver.com>
References: <cover.1442218854.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] qemu: remove redundant lines in smc91c111_fix.patch
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
X-List-Received-Date: Mon, 14 Sep 2015 08:28:36 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove redundant lines in smc91c111_fix.patch which caused command patch
of lower version fails to work.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch b/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch
index e69af94..e37e777 100644
--- a/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch
+++ b/meta/recipes-devtools/qemu/qemu/smc91c111_fix.patch
@@ -63,7 +63,7 @@ Index: qemu-2.4.0/hw/net/smc91c111.c
          return 0;
      return 1;
  }
-@@ -671,9 +671,11 @@ static ssize_t smc91c111_receive(NetClie
+@@ -671,6 +671,8 @@ static ssize_t smc91c111_receive(NetClie
      /* TODO: Flag overrun and receive errors.  */
      if (packetsize > 2048)
          return -1;
@@ -72,6 +72,3 @@ Index: qemu-2.4.0/hw/net/smc91c111.c
      packetnum = smc91c111_allocate_packet(s);
      if (packetnum == 0x80)
          return -1;
-     s->rx_fifo[s->rx_fifo_len++] = packetnum;
- 
-     p = &s->data[packetnum][0];
-- 
1.9.1


