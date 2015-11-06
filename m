Return-Path: <ruslan.bilovol@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id DDC2B75D22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 14:09:09 +0000 (UTC)
Received: by wimw2 with SMTP id w2so31052865wim.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 06:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=77sQEN++Nk0lm5RAKfhrehCiEkmbjf2uujcxhgHC9zQ=;
	b=dyibRlKGZmuHhhJTA7buPcw6aH5yjfiFHeI7hH2/3lAO2dlA6FdEDmley9BmOGv+Lk
	+0Dwk+/TuLNlqu0I4txF8+q+Kh/j+m15crRvsLpP1iCm/XPR30b88rJ2pKLOerj5v/06
	pPa/aQ5kqqZVDH4nhDIPXgxaepqyNnTD2jMwVVRczfIT76+nO0+w7x06KFGpNHO5eN/O
	1R1X8St5OA1HIClSgLxHJG461kQ8ACO8E9lraUxNEPhY/ZS7s5fm6/9prwU3PQphwaVN
	35zdZj2uIxEj533wuCUqtqI6uuQEIljzSkOWEuXodWXrKvnQDWVFdtIRrjvBkIK5NxUu
	GOIw==
X-Received: by 10.194.172.162 with SMTP id bd2mr13414833wjc.140.1446818948925; 
	Fri, 06 Nov 2015 06:09:08 -0800 (PST)
Received: from localhost ([173.38.220.53])
	by smtp.gmail.com with ESMTPSA id p75sm916106wmd.22.2015.11.06.06.09.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 06 Nov 2015 06:09:08 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 16:09:06 +0200
Message-Id: <1446818946-10342-1-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] scripts: runqemu: remove QEMUARCH from help message
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
X-List-Received-Date: Fri, 06 Nov 2015 14:09:10 -0000

The QEMUARCH env variable is not used since commit
"d469c92 classes/imagetest-qemu: remove old image
testing class". Remove it from help message so
it will not confuse other people

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 scripts/runqemu | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e01d276..da90ee0 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -22,7 +22,6 @@ usage() {
     echo ""
     echo "Usage: you can run this script with any valid combination"
     echo "of the following environment variables (in any order):"
-    echo "  QEMUARCH - the qemu machine architecture to use"
     echo "  KERNEL - the kernel image file to use"
     echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
     echo "  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)"
-- 
1.9.1


