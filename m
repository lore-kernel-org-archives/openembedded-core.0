Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id C5F237730E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:00:55 +0000 (UTC)
Received: by lfdo63 with SMTP id o63so51863620lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 05:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aC4FGpQXQv87yk58ItBbsp38cXZ6rzjwVLBqcmX7BvI=;
	b=MUc4I6fp1GZJnQu4bCIMLZsMGLW35IchVBJiCmvs+dF/X5mkV6HkteFuMMQpM3KXj0
	GzxxgLUApXzp+RbEnZW9MODN6hPYBwPuovPkfME9oRJzrm3tGquIADdnVIHzIHq5+oVq
	DajPAhcof4keAZTmnficF1FaqOna1P4ZBTdbAVbOIkD/lcSHpROI2UXtzM0Wza1g31RY
	5snLdzs4isbfKQxzZrNlBXRPHyAOqAr16hpyMIzFn98mliURge0C5s6U1ZnVcm+Rm5++
	Uzm+WpEZ4b6gFMlIiweq1TwJZ1cdfhr8qV0QRDOD02qBsWauOWhGVT7HZubPyeBPuUVI
	qB4g==
X-Received: by 10.25.19.100 with SMTP id j97mr10489060lfi.114.1447419655369;
	Fri, 13 Nov 2015 05:00:55 -0800 (PST)
Received: from localhost.localdomain (m83-185-243-97.cust.tele2.se.
	[83.185.243.97]) by smtp.gmail.com with ESMTPSA id
	u12sm3073205lbk.45.2015.11.13.05.00.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 05:00:54 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 14:00:17 +0100
Message-Id: <1447419617-15158-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] sstate: Add ca-certificates-native to postinst recipes list
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
X-List-Received-Date: Fri, 13 Nov 2015 13:01:01 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d09e27a..1e05a23 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -830,7 +830,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x
 
     def isPostInstDep(x):
-        if x in ["qemu-native", "gdk-pixbuf-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native", "gtk-icon-utils-native"]:
+        if x in ["qemu-native", "gdk-pixbuf-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native", "gtk-icon-utils-native", "ca-certificates-native"]:
             return True
         return False
 
-- 
1.9.1


