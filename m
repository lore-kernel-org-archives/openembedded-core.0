Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD0279441
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:46 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id q204-v6so3124817oig.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OQak+YnoC1ilmJVlNxZXcCnege0sk2FcscFSPTyd3cA=;
	b=BwyNYdp9j6oVlBxRN3yD3gXQjtLpa8YhK7QWXoWD5dZLpepvS1Pkcq4uXmr56HApHY
	EWAzBVSxTfYLU7D/9x1yd6eXs/n5oHQ9kW8He5/4Q2Np3FWhNQWsB76RC6AybZfdZ0tE
	7mBWAG96it0eoLDVcGkRzjP4w9C1NgXEju7OSSLjRHpSTZBJphBnvpAgJDxAA3awcRhj
	pJy1Z4eyvkDLZIchATFuE0fjZd4aEMo7b+6sQjTtaAypqTrxxrSu/saEN3WoTbpIIhOZ
	Bt++HV3mjZnDmRfUMfGtjOzNeeU8t5JAXqxOaVBCKoi4Q5eJnScPpZLGu3jlYpNalcgk
	l0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OQak+YnoC1ilmJVlNxZXcCnege0sk2FcscFSPTyd3cA=;
	b=T80vyhXZs8MmRiNmv7zfcq2Th+eD/YvpZ2TDWNHShQorj/fsTGTwP05JpScufV63bg
	vG/Dzg014b11Qpd0AjEpWKZ4R/QNqwpDFmm9oYNy93pjF7h5ZLqhVAawcEGCyFKR/C0V
	+k/nis5DnVAGdyDT8jvvmkBo0f1unurqLTdIeiexsO86bx3qB5W9MsSoypHd2YSO71OA
	ha4L9VwH+48AbluPaNQKXoFH0RtsfAK+uIBB2RRXNJEo+0vh/wuhN0NxiEIX3tKKp0U6
	Sv3UYHjgyfO+3Rw+HuIJCd0MOiS9dKSW6R96EtdhXYfAkfxdgAsRiEyeTOt8uHzGnUof
	PDcg==
X-Gm-Message-State: APzg51BVZykA2y3WHDcPgZYH+BvdRFN/GCFLZpp1rDjdov2aWJ9Umue1
	ozoS1gCvQkp4I5mZSRp+dCEA8Yikdiw=
X-Google-Smtp-Source: ANB0Vdax2y9ndOWEX6ssbOeGr5bWl/jIkT42zxB42vp2zuOvm36Rr1kau+HxRYCbDI5uLsxmtbz4zQ==
X-Received: by 2002:aca:6541:: with SMTP id
	j1-v6mr3691154oiw.157.1534945007944; 
	Wed, 22 Aug 2018 06:36:47 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:47 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:25 +0530
Message-Id: <1534944940-21566-19-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 19/34] openssh: CVE-2017-15906
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:47 -0000

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


