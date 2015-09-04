Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id C273B77040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 18:55:53 +0000 (UTC)
Received: by wibz8 with SMTP id z8so26531012wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1aA0hzgh2ilg7RkRYvPI+H904nH91TI/0jcJ4bfDtUE=;
	b=Im/nZKMwfmFlLpHhySFZCdVXpY8H3mB0/OcdMDUOOBb0CjrlcDhGo2lFHMV36ODWiK
	s7tgwAdlyqE8cZ0PwfTf3Rtcsro/JvxnmfZX46ZsKQu2YAfemCHKYf/WoBrVwxzUJ2DN
	Vzl5g+mU4pQYhZPTgYI3IXSFZucoTOUDA3u5Lc2M2vsNdQpd30fg1GT8gpkri9CH4Rl+
	SpPRZixIAGTgJ93vov0jp+yWJ/TkJwfRZU2trVGkycJqgBPHPwaMDDCDqRmPnzFx5fiQ
	zvrP/u+CC4bGT/frdUmLlNynIXyhYdvbQ4/CuqWyjdNdFcVz+RaLn5bChVlv11mU9E5F
	KwuA==
X-Received: by 10.180.103.2 with SMTP id fs2mr9651148wib.4.1441392953901;
	Fri, 04 Sep 2015 11:55:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 4sm5591146wjt.46.2015.09.04.11.55.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 11:55:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 20:56:24 +0200
Message-Id: <1441392984-24965-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] rootfs.py: show intercept script output in log.do_rootfs
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
X-List-Received-Date: Fri, 04 Sep 2015 18:55:55 -0000

* without this the output wasn't shown anywhere even when the bb.warn
  says:
  "See log for details!"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 76950ec..2372226 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -279,7 +279,7 @@ class Rootfs(object):
             bb.note("> Executing %s intercept ..." % script)
 
             try:
-                subprocess.check_output(script_full)
+                subprocess.check_call(script_full)
             except subprocess.CalledProcessError as e:
                 bb.warn("The postinstall intercept hook '%s' failed (exit code: %d)! See log for details!" %
                         (script, e.returncode))
-- 
2.5.0


