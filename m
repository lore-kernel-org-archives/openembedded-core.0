Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5C39671503
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:58:58 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id r5so1015954qcx.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 01:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XNVgujT56c4VADxr7zSVN9ZFSytyo52iBeNccbaH0aQ=;
	b=vNV0apanp/wzBM+WflWIIMBak1wlwwnMp7sUetQLlzzklJkxyFKMm1vchchBO5EGU2
	PNT+6A7jER5+9/pebMObl2NCfgLm5ZRZI2DtoEJ7CYmIU9Hn4nmummGjkkXzBTr8QjZp
	E0idj7PkKloUv2uao5v0t8jNLH7ha6408xZ5AbioRes2Vn3ytDroBrlgxopWzszasZMX
	jQ1yiZ5frNgAgaADRH7oG3FgfmSkxcADAwbFEnfCsP+1xUZH4c4k2jbRT3bRemCDrdWa
	gWZopWio9esLWM58S1hhjmljyJrkYeCk9VEWUEGIAuRmwJsUf0d85VXqi1hjH0lG3xki
	pFFA==
X-Received: by 10.224.53.132 with SMTP id m4mr9966659qag.85.1415959138691;
	Fri, 14 Nov 2014 01:58:58 -0800 (PST)
Received: from localhost.localdomain ([189.61.222.176])
	by mx.google.com with ESMTPSA id 6sm2224822qal.20.2014.11.14.01.58.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Nov 2014 01:58:58 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Nov 2014 07:58:33 -0200
Message-Id: <1415959113-8920-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qtsystems: Change branch from stable to 5.3
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
X-List-Received-Date: Fri, 14 Nov 2014 09:59:07 -0000

Stable branch was removed on mainline and now 5.3
is used.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
---
 recipes-qt/qt5/qtsystems_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 45f6b0e..ac2fc86 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "stable"
+QT_MODULE_BRANCH = "5.3"
 
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
-- 
1.9.1


