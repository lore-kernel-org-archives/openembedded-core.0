Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC07377E92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 22:30:25 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id 30so7642953iog.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 14:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t9puBb+Unc5O8NjBS7uHj3KEuRcjHqRa/gzL3f4ZZVk=;
	b=Yn5lcb8+JkKidxyWNHhVh2I5cPIVSO8+8SV7bPyxA8FHufs+NmfuTUlxEAhXtqcmxz
	1757sFy272PgyJLFSAYl4Pg31Tw4PytU7TcV28KU9ZNZyMRd+/uQPnVyyQVSQozyRTns
	ihub9lHVsYjepDa3x4wXUd/l1Q0n405eZJmoP3eZpitFG8GPYDbV1w+tDy1zTXD72Fxx
	yisuyvGjaYw3mvKYXgHd9g6U2+uvvOdr20fgq7nMVMq8lCNVbvoFyEEiXUKNAmYX4WMe
	rhR2SBvNv3Q6l330MYsI4FiLqG6laWRQTpelVmG3RH5DRu7WLvG84tZYT6DnJ/TMghtj
	+P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t9puBb+Unc5O8NjBS7uHj3KEuRcjHqRa/gzL3f4ZZVk=;
	b=OI0JMxP0cLk1pTeXsW8DbYM/t2w6kKtuSziEdqXsEDc52809gNj0qSN8KePNZ6T7wl
	1ExRyWM28ls8xh5BMYohnkBYUj1qJOZnuLkGwpZtHUwlESLFeiv73DAo8BVqYhNS+EZU
	0Jffn3elPcYrOu4Jjd4rC/FeOSzdF5mRFRf1DiKY5P7OUsiAA1YXkfuaQjEnSpsGfXV9
	hd1cZuVG5oQkxIb8px2PlLKOcaaEIUYUOcNKUce886klWN9xgOSXOK7U4fjDgr5nCyfY
	qvwSUURLeBdWssalYX1gBFzZ/5/7d4+IbuM2ADyd31zsVBJy0AeZXvskAIh2H+mpY/PE
	otrQ==
X-Gm-Message-State: APf1xPDk7CJFlJhAu0jv8fRgKAcH+AjhoGx1cwUrewSfZYBbilQldr3i
	wUXHVs3xMaHFYmj9e21dOv59KmTj
X-Google-Smtp-Source: AH8x226YiBBdW8pZQX6c32b+fuQ7ThSgQ9PzY6VZYGTqhmt6FYZwmhQIfLxKLbENALkaWUbIr4lITw==
X-Received: by 10.107.148.82 with SMTP id w79mr21485377iod.207.1519079426708; 
	Mon, 19 Feb 2018 14:30:26 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	87sm4464230ioq.36.2018.02.19.14.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Feb 2018 14:30:26 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 16:30:21 -0600
Message-Id: <20180219223022.17833-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180219223022.17833-1-JPEWhacker@gmail.com>
References: <20180219223022.17833-1-JPEWhacker@gmail.com>
Subject: [PATCH 2/3] icecc.bbclass: Add environment version
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
X-List-Received-Date: Mon, 19 Feb 2018 22:30:26 -0000

Adds a version to the environment which can be used to invalidate any
previous environments on the remote compile nodes

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 2bf6cdb003d..bfab61dfa36 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -34,6 +34,15 @@ BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
+# This version can be incremented when changes are made to the environment that
+# invalidate the version on the compile nodes. Changing it will cause a new
+# environment to be created.
+#
+# A useful thing to do for testing Icecream changes locally is to add a
+# subversion in local.conf:
+#  ICECC_ENV_VERSION_append = "-my-ver-1"
+ICECC_ENV_VERSION = "1"
+
 # Default to disabling the caret workaround, If set to "1" in local.conf, icecc
 # will locally recompile any files that have warnings, which can adversely
 # affect performance.
@@ -203,7 +212,11 @@ def icecc_version(bb, d):
 
     import socket
     ice_dir = icecc_dir(bb, d)
-    tar_file = os.path.join(ice_dir, archive_name + "-@VERSION@-" + socket.gethostname() + '.tar.gz')
+    tar_file = os.path.join(ice_dir, "{archive}-{version}-@VERSION@-{hostname}.tar.gz".format(
+        archive=archive_name,
+        version=d.getVar('ICECC_ENV_VERSION', True),
+        hostname=socket.gethostname()
+        ))
 
     return tar_file
 
-- 
2.14.3


