Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (unknown [209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7CB6FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:58:28 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id rr13so12512202pbb.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kL6kk5z9Itdh4tlWPrRz+1xgPDUQnOricNBnoC8ZKL8=;
	b=RHTEUjDJ2x7oYA+CIjBwpu7EddMoY0UKzH0R8mKd9Kc6USolyMs0DO3Djk9rBszTXY
	VC49r5vgY93QOYHjVWecunMoFXGYwSTGVWeUUs6ttZI1QQPZe+5fAispb2hIpRrtA5QB
	4cSLelKO5ftoxOsOg5/O5ItsN4VWyfmJCDiEa3Z/f66A695kBOxQk4GgMs9F4ao0bahE
	FpzV3R4ZmmmgLHZJeNMSCC/UPU8uMXeNoU5gRTDROOi1Znx5SGvEMkfszUHfyrZf2VvB
	emU0kYW3tX6cUk534d+Lp75obDHVRIILmnx0Y6t1oaMOgHkQEl5B6FfvQSTLYIRr/NIM
	Lf9g==
X-Received: by 10.66.66.66 with SMTP id d2mr6342936pat.36.1401346709557;
	Wed, 28 May 2014 23:58:29 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	sh5sm31748177pbc.21.2014.05.28.23.58.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:58:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:01:04 -0700
Message-Id: <560ff2db1c4b8f7b805d870fea51f4a6397ea10a.1401346650.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
References: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
In-Reply-To: <cover.1401346650.git.raj.khem@gmail.com>
References: <cover.1401346650.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] image.bbclass: Remove dependency on ldconfig-native for musl
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
X-List-Received-Date: Thu, 29 May 2014 06:58:28 -0000

it does not grok glibc ldconfig format

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ceee848..a03b880 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -70,6 +70,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
 LDCONFIGDEPEND_libc-uclibc = ""
+LDCONFIGDEPEND_libc-musl = ""
 
 do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
-- 
1.9.3


