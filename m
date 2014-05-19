Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 359FC66127
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 08:02:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4J82wgv005697
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 01:02:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 01:02:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 16:03:28 +0800
Message-ID: <3ca9244054e803966bbe4cccf29a1636b675a20d.1400486523.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1400486523.git.Qi.Chen@windriver.com>
References: <cover.1400486523.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu-internal: add "console=ttyS0" to ramfs image kernel parameters
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
X-List-Received-Date: Mon, 19 May 2014 08:02:58 -0000
Content-Type: text/plain

We need this kernel command parameter so that when we start a ramfs
image, we can actually get some output. Although we can make this
happen by specifying the 'bootparams' for the 'runqemu' command, it's
better to make this the default behaviour.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-internal |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d317dfd..38745dd 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -550,7 +550,7 @@ fi
 
 if [ "x$RAMFS" = "xtrue" ]; then
     QEMUOPTIONS="-initrd $ROOTFS -nographic"
-    KERNCMDLINE="root=/dev/ram0 debugshell"
+    KERNCMDLINE="root=/dev/ram0 console=ttyS0 debugshell"
 fi
 
 if [ "x$ISOFS" = "xtrue" ]; then
-- 
1.7.9.5


