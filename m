Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id CBF3765D4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:33:34 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id x3so9070258qcv.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=SV7WytUeMqdGLtQvrcq8CG42X8r4nRNphm6QBSuxP+M=;
	b=ulpv2MdwHfVdm6KpSe/pa9U7+kD2UL00uQOTovXZQqQP9CmVcVhfBHYC8uwrsY4ziE
	SGo8j/MLrWsSjS0S2r9xynTuApUSYzyJfOhzyaLzVTT95EUrKjbJhe9T/S1cIp2+MYyo
	NWMno9mR40rMCmq70Qfj/sIpqcjSoDD+6WoeHsZDqKYhCle2f9A8gkY6W0kknYgz16yr
	ETmHc8aE48/d3NfrY+lNfuPxZA+LyVV75ZeaafxVhVH04UdY4AyHpovHn+AyifcsOvrU
	uwYUTt1fz+N/xNeRx9H9jP3refdVrPEmYCMDsa2QW3nrZgdTfdI8GnBf/aFNxiLHq+vu
	XCQQ==
X-Received: by 10.224.45.65 with SMTP id d1mr60047777qaf.43.1415788415511;
	Wed, 12 Nov 2014 02:33:35 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id
	g68sm13089736qgd.11.2014.11.12.02.33.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 02:33:34 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id D9E711C86BEB4; Wed, 12 Nov 2014 08:33:30 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 08:33:23 -0200
Message-Id: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] bb.codeparser.py: Remove reference for oe.utils.contains
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
X-List-Received-Date: Wed, 12 Nov 2014 10:33:40 -0000

The oe.utils.contains function has been removed from OE-Core metadata
as the references for it has been replaced to use the
bb.utils.contains.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 bitbake/lib/bb/codeparser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/codeparser.py b/bitbake/lib/bb/codeparser.py
index 8b8f91a..21a36f6 100644
--- a/bitbake/lib/bb/codeparser.py
+++ b/bitbake/lib/bb/codeparser.py
@@ -178,7 +178,7 @@ class BufferedLogger(Logger):
 
 class PythonParser():
     getvars = (".getVar", ".appendVar", ".prependVar")
-    containsfuncs = ("bb.utils.contains", "base_contains", "oe.utils.contains", "bb.utils.contains_any")
+    containsfuncs = ("bb.utils.contains", "base_contains", "bb.utils.contains_any")
     execfuncs = ("bb.build.exec_func", "bb.build.exec_task")
 
     def warn(self, func, arg):
-- 
2.1.1


