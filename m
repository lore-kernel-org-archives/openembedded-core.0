Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D609D72491
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 19:33:03 +0000 (UTC)
Received: by wggx12 with SMTP id x12so22357933wgg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 11:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7CKej1XUVnesImZuhSm0rh/NAIi0dO6QDcTDDTfV6wo=;
	b=dNoKsbCVn0zL/7v7GAjgotuYCScUT8FjPKQD4CRxW5rm/ofStaUM5WcNMK1/1ZRiFo
	joiClptppRCvJFasExE7IKeWLdKQHLV3zmXu+50IRObOH09E4ff3ghaqn6zgDrYisch+
	7O16C5rVd510/XVFlNoLYFDEgkClzdGgvYLNIrmh3QCwcb0fMw7iprWef6ZWe6JEMeuS
	DtnbnalUXRf1Ym74NActc4uiphuYcy6dMpTlVM0sTOxCOAYK/xn5eKRS3pmvsldVILw8
	EUcpKHqAV1YlgbY47nwwUpDSw8NVQNDBjknGVYDkm7RjkAxqutObA16THPLia0vnv/uq
	LSeA==
X-Received: by 10.194.2.43 with SMTP id 11mr31333600wjr.104.1425065584036;
	Fri, 27 Feb 2015 11:33:04 -0800 (PST)
Received: from s42.loc (91-119-229-249.dynamic.xdsl-line.inode.at.
	[91.119.229.249])
	by mx.google.com with ESMTPSA id p1sm4097783wib.23.2015.02.27.11.33.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 27 Feb 2015 11:33:02 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1YRQej-0003CB-FZ; Fri, 27 Feb 2015 20:33:01 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 20:32:58 +0100
Message-Id: <1425065579-12253-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] scripts/runqemu: clarify help text
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
X-List-Received-Date: Fri, 27 Feb 2015 19:33:04 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7ba92fb..1277e82 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -21,7 +21,7 @@ usage() {
     MYNAME=`basename $0`
     echo ""
     echo "Usage: you can run this script with any valid combination"
-    echo "of the following options (in any order):"
+    echo "of the following environment variables (in any order):"
     echo "  QEMUARCH - the qemu machine architecture to use"
     echo "  KERNEL - the kernel image file to use"
     echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
-- 
1.7.10.4


