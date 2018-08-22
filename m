Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6717943A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:43 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id b15-v6so3682768oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OQak+YnoC1ilmJVlNxZXcCnege0sk2FcscFSPTyd3cA=;
	b=SXJQQFrV07tx0ttHgJgM4GcCKO0c5cIU5/cxdKFmE0HuQERCkywkP0UYdbbr/EBIMu
	VX/FOuBJnKTspfJjeANr5mFmA0ivsI71BMb0OikfgMmPiTe7qmB1wfZsFaiaM0RuJYQD
	B9mgYMIyAlysqLhBDEOuGwpJ6iNztsypCwJCTkbNAf9bgNr6zvi6hswtxU5ORIywmF2h
	gntoLclwnABtL/k8ZkZdVnqsg2u9BdiVmZHqVmDcoHNgqHoe3rU0MNUSqbMj+FP2aoIE
	vwq/Q7OIKw40LM0Fzj27oUDzqkViaIgROWV6qkBaAqaG/7XXY54VcAbS/JrExnY4ZOM2
	umcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OQak+YnoC1ilmJVlNxZXcCnege0sk2FcscFSPTyd3cA=;
	b=uVCywmqqPIgMMopbS/C3DLWZSxGzpJScUPqdKRfGs6OU+42MCX650q0z/Hqd5VM8QV
	O+ikj0PiBYEl1QFuAvXnC8Fss+dzQXf6mfyUe85JM6npzs0M9dULRdgFMZUKRMWRg7f2
	FwWLvgxc8GRj1YRD2AWG2Ns2OVtR58Vd4h4tcsvozQoAGrusGSas4DTghccyXKmmPn1H
	53VqR5dFbj6nMGu9qTpGY57S3OlLck3LiaJccz6yk7NI0hVT9/k2JwKZyZ01Z/f0mho/
	CBY6Xg7Uezf/9pNK+WX9Qit6ltLxCnUyQBEND9L2vNBuXpeElrR3U216NbT6NZgQPoci
	vFfQ==
X-Gm-Message-State: APzg51CHfbL7yM0Fj3x0RbuyYBbcHmIEQlwWsk/KPyD2q1gMl9iTa7Db
	WYKjK8w/lQn3EB0baYEubn9iyR1U72I=
X-Google-Smtp-Source: ANB0VdaHVQ6vA6wY52WZEzmloqmzU229MP8FqJErqzc7SadsUblzTRdx6Iss8+MONLv4NHKX1u7HOw==
X-Received: by 2002:aca:d48c:: with SMTP id
	l134-v6mr4337904oig.15.1534950584146; 
	Wed, 22 Aug 2018 08:09:44 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:43 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:37 +0530
Message-Id: <1534950532-23850-19-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 19/34] openssh: CVE-2017-15906
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:43 -0000

disallow creation (of empty files) in read-only mode; reported by
Michal Zalewski, feedback & ok deraadt@

Affects openssh < 7.6

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../openssh/openssh/CVE-2017-15906.patch           | 38 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2017-15906.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2017-15906.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2017-15906.patch
new file mode 100644
index 0000000..3ad683d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2017-15906.patch
@@ -0,0 +1,38 @@
+From a6981567e8e215acc1ef690c8dbb30f2d9b00a19 Mon Sep 17 00:00:00 2001
+From: djm <djm@openbsd.org>
+Date: Tue, 4 Apr 2017 00:24:56 +0000
+Subject: [PATCH] disallow creation (of empty files) in read-only mode;
+ reported by Michal Zalewski, feedback & ok deraadt@
+
+CVE: CVE-2017-15906
+Upstream-Status: Backport [https://github.com/openbsd/src/commit/a6981567e8e215acc1ef690c8dbb30f2d9b00a19]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ usr.bin/ssh/sftp-server.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/usr.bin/ssh/sftp-server.c b/usr.bin/ssh/sftp-server.c
+index 2510d234a3a..42249ebd60d 100644
+--- a/usr.bin/ssh/sftp-server.c
++++ b/usr.bin/ssh/sftp-server.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: sftp-server.c,v 1.110 2016/09/12 01:22:38 deraadt Exp $ */
++/* $OpenBSD: sftp-server.c,v 1.111 2017/04/04 00:24:56 djm Exp $ */
+ /*
+  * Copyright (c) 2000-2004 Markus Friedl.  All rights reserved.
+  *
+@@ -683,8 +683,8 @@ process_open(u_int32_t id)
+ 	logit("open \"%s\" flags %s mode 0%o",
+ 	    name, string_from_portable(pflags), mode);
+ 	if (readonly &&
+-	    ((flags & O_ACCMODE) == O_WRONLY ||
+-	    (flags & O_ACCMODE) == O_RDWR)) {
++	    ((flags & O_ACCMODE) != O_RDONLY ||
++	    (flags & (O_CREAT|O_TRUNC)) != 0)) {
+ 		verbose("Refusing open request in read-only mode");
+ 		status = SSH2_FX_PERMISSION_DENIED;
+ 	} else {
+-- 
+2.13.3
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 86ca6ff..395c21b 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://0001-openssh-Fix-syntax-error-on-x32.patch \
            file://sshd_check_keys \
+           file://CVE-2017-15906.patch;striplevel=3 \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.7.4


