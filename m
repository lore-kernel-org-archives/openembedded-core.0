Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4797771DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 10:20:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q62so21186796wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 03:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gwrvwxvmjxwz5+2VgEzIJQh3w9OW4xcGuvFq6Za2mbE=;
	b=Wo6v3Aaa3bSZbzgcTY/hCiy+DZi4WV3C5DVuMmjdlGfNTG7M3dG1GpiTq0Jv8O08cH
	lO+Cl36HzIm7Ja4f78anPGDIatDL4Xp2fGgj03vHEl+mXZ36PCIM7Oaawg9vAsbnFRJz
	MbE29N2loVyB1LfIsYJY9abXYojU+Atq1S9JuKHWU+v5EmpSQSJdR/YC2KT76wR/Lv/H
	max9y1hYCaHiYLbSNTckrGRD3zWb36KH/hskUw0F1BVEaiju/OEKLrzqPZv1ySuIKWLR
	lDw/9DewuZvBOgQDPWfK+U1dwD/SOeKIjBYAkbHKPg/wz0kwNXPadrXVd2X+NrvFk2eF
	8OFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gwrvwxvmjxwz5+2VgEzIJQh3w9OW4xcGuvFq6Za2mbE=;
	b=T56g25khpZ+tZw5uFGMB/0cBr3bAjDR8rl5zvFZnFnO3dkI2eBMqVeHg9pCzKcrN+5
	wG0a3+KK2/QScfEpRXwjZDrJu+MLFzM+bhIzsqkGYz1WIqILMiivHaiaXQGr/9JwD9pS
	QHcW2Qu3WHpzWTcYGJRUYp8BxADKxJ5YWHSFnMHJY1syPmDe49BaQ7MndvNnhbL6pBD4
	PyaMVBo+ZsYaArf7mPSc1Q6TNpQsQEznsgPeWuLp1dt3+kEWHHCtBMftRPodvu60jR7k
	gsISXtL5BRPO5KcSJCbs3mRnGJYEXkadYIfcsHm+BcBcjs5wA6GXNwBt5KqY9c/hgfz/
	ZZVQ==
X-Gm-Message-State: ALyK8tKTGGr+/unyNDuT0gihkiWAxspXDJMl82wpmy/6XGk+tZlc+V+axWN9+ZMhwfjD7g==
X-Received: by 10.194.186.200 with SMTP id fm8mr26122401wjc.174.1464603625805; 
	Mon, 30 May 2016 03:20:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dd7sm33715817wjb.22.2016.05.30.03.20.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 May 2016 03:20:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 12:20:28 +0200
Message-Id: <20160530102028.23012-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160527134620.GE2570@jama>
References: <20160527134620.GE2570@jama>
Subject: [PATCH] insane: return line-feeds to qa.log
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
X-List-Received-Date: Mon, 30 May 2016 10:20:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 116abc4..71999ad 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -178,7 +178,7 @@ def package_qa_write_error(type, error, d):
     if logfile:
         p = d.getVar('P', True)
         with open(logfile, "a+") as f:
-            f.write("%s: %s [%s]" % (p, error, type))
+            f.write("%s: %s [%s]\n" % (p, error, type))
 
 def package_qa_handle_error(error_class, error_msg, d):
     package_qa_write_error(error_class, error_msg, d)
-- 
2.8.3


