Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD3E07125C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 06:35:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s896ZdfE021190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 23:35:40 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 23:35:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 14:35:52 +0800
Message-ID: <2f2f7278925f48a03507499180f2a85500b4b6c6.1410244514.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410244514.git.Qi.Chen@windriver.com>
References: <cover.1410244514.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] busybox: install ping6 into bindir by default
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
X-List-Received-Date: Tue, 09 Sep 2014 06:35:38 -0000
Content-Type: text/plain

[CQID: WIND00444742]

Install `ping6' provided by busybox into /usr/bin to sync with the
iputils package.

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20131113

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 .../busybox-install-ping6-to-usr-bin.patch         | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch
new file mode 100644
index 0000000..b99f47f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch
@@ -0,0 +1,25 @@
+Subject: [PATCH] busybox: install ping6 to /usr/bin by default
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ networking/ping.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/networking/ping.c b/networking/ping.c
+index 5e4771f..471c347 100644
+--- a/networking/ping.c
++++ b/networking/ping.c
+@@ -70,7 +70,7 @@
+ 
+ /* Needs socket(AF_INET, SOCK_RAW, IPPROTO_ICMP), therefore BB_SUID_MAYBE: */
+ //applet:IF_PING(APPLET(ping, BB_DIR_BIN, BB_SUID_MAYBE))
+-//applet:IF_PING6(APPLET(ping6, BB_DIR_BIN, BB_SUID_MAYBE))
++//applet:IF_PING6(APPLET(ping6, BB_DIR_USR_BIN, BB_SUID_MAYBE))
+ 
+ //kbuild:lib-$(CONFIG_PING)  += ping.o
+ //kbuild:lib-$(CONFIG_PING6) += ping.o
+-- 
+1.7.9.5
+
-- 
1.9.1


