Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 574ED60B9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:41:33 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id ca18so2039332wib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 03:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RwW5HYfzG2fAj64WgzpP0SbefexPS2y1JE82lycX1iU=;
	b=ez+N0bMQYG7a6Q+Csdi6vHBAYddA38I70XeXC8lVRS9S6uOGWQBE3/PaTmzzZIgqVH
	pr3VEMm62cgiOsG+df5vqWt2I4qxX3Ry4Q2SZy8zPVhyBwGJ03jyvmxot1/X6bbfVI9r
	4B50ZlJazI9cAaeFObeti0rhkr9o/0VgCkrZjxerQ6DDV1KQUE4GnUygX/0I2d1TwhEV
	wSS75yXIZr299vO9UeOUWQ851j7nhnNZl7EycoNiI+pkYmH0srq9ZuEe/7BtsuMd3A30
	U8TjX9qs0OfmtXGnjFvwfUH7L5gbBsJRhPG/R31u6r1WiV79zPaYgTwgMYHW0756iryZ
	CJvg==
X-Gm-Message-State: ALoCoQl0Oe++GbRpT1SQhAVGLprmWjHRKaQug5Ax2iuh3bIYlpPdtXk1Ly3mTK3frgGpbd+zn/DW
X-Received: by 10.180.187.41 with SMTP id fp9mr5402192wic.33.1385034092545;
	Thu, 21 Nov 2013 03:41:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id s20sm4661902wib.1.2013.11.21.03.41.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 03:41:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2013 11:41:28 +0000
Message-Id: <1385034089-9468-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] initscripts: remove erroneous call to /etc/default/rcS
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
X-List-Received-Date: Thu, 21 Nov 2013 11:41:34 -0000

This doesn't exist when using systemd as it's part of the sysvinit package, and
this script doesn't need it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index 4fffe4e..fe6c196 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -7,8 +7,6 @@
 # Default-Stop:
 ### END INIT INFO
 
-. /etc/default/rcS
-
 #
 #	Run in a subshell because of I/O redirection.
 #
-- 
1.7.10.4


