Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3B073243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:52:46 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so21494823wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VWSyUePTGxavVkcYx19jPYeeWPur2sNQuhz880191dc=;
	b=tbZ73elIrB4zn0eCHe8tiGOXMtt3tOFEIH2atHKFN9quClq4/4yIrS/HUavxKGluWR
	JKtx1P5Ny0D+kFt2csjMSh+ZhizU8JX/HBANInpWTm8+u1WIybmf2/GVPwjj/q31OAfb
	1H3YsXv7qskfm8uxmmex+QR14oN0ayn5YQQF0E06Ey0Itx9rSrESXvsIBhSEjWgisJtl
	0sHPsrLAy2I1PCIURpwv6nY/bDvYDscMzGaYwPXT58hQAdm3hvJxfxU35+T/gUOetIk1
	Kwo9J35s/C3kx97xHYLe5wjy7jp4VBKwMgMZXWbUeyFXZDiy2f1yijzkb75GNyBGDgcF
	F/+g==
X-Received: by 10.194.87.69 with SMTP id v5mr67316738wjz.140.1441885966750;
	Thu, 10 Sep 2015 04:52:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	sd14sm15281144wjb.36.2015.09.10.04.52.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 04:52:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 13:53:29 +0200
Message-Id: <1441886010-18631-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1441886010-18631-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441886010-18631-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [dizzy][PATCH 2/3] rootfs.py: show intercept script output in log.do_rootfs
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
X-List-Received-Date: Thu, 10 Sep 2015 11:52:47 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* without this the output wasn't shown anywhere even when the bb.warn
  says:
  "See log for details!"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index bbc37d3..db8d8f1 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -183,7 +183,7 @@ class Rootfs(object):
             bb.note("> Executing %s intercept ..." % script)
 
             try:
-                subprocess.check_output(script_full)
+                subprocess.check_call(script_full)
             except subprocess.CalledProcessError as e:
                 bb.warn("The postinstall intercept hook '%s' failed (exit code: %d)! See log for details!" %
                         (script, e.returncode))
-- 
2.5.1


