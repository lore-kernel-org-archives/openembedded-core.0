Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3603574242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:53:15 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so21511472wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 04:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ir62DLtd0G9ZKySA+kciK25Yso0x/+KZMzGwQfLWQGE=;
	b=feusZ+D7BM1hSbJZ3xxGFPG2bVRO7SvSZhkZr74xfFY+2JzMSVd7rL2Z2MWIsuFUtq
	UbWQHnZonqj9ytyG6j5BiSGo4NE2GDrEXB+smcEUr+kmyuP9RW8D4tuK3LBZQSWSyGJS
	EY5a0ruUpnp7vjjrIOXlAb9ILw8LhzdTRW/Yix77d3jPzRyMMqLSaDe6oMpmrFXnG2Qo
	rT7hjvfuKm4tXTZA8hn2srOgLQYMC2AzZk0pZVx22I9WKVQY/OzjMkLdod0A0T+2Dpsm
	uP2zJWi8ipudoROxCWf0yJ7If5oRxdBazMTA35nfo6H+qadDHn+7Rgr1Ge0gHPRXcPh+
	AJag==
X-Received: by 10.180.81.199 with SMTP id c7mr5517491wiy.87.1441885995175;
	Thu, 10 Sep 2015 04:53:15 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t7sm8935053wia.9.2015.09.10.04.53.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 04:53:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 13:54:10 +0200
Message-Id: <1441886051-18676-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1441886051-18676-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441886051-18676-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [fido][PATCH 2/3] rootfs.py: show intercept script output in log.do_rootfs
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
X-List-Received-Date: Thu, 10 Sep 2015 11:53:15 -0000

* without this the output wasn't shown anywhere even when the bb.warn
  says:
  "See log for details!"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d2de2c6..15ad642 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -229,7 +229,7 @@ class Rootfs(object):
             bb.note("> Executing %s intercept ..." % script)
 
             try:
-                subprocess.check_output(script_full)
+                subprocess.check_call(script_full)
             except subprocess.CalledProcessError as e:
                 bb.warn("The postinstall intercept hook '%s' failed (exit code: %d)! See log for details!" %
                         (script, e.returncode))
-- 
2.5.1


