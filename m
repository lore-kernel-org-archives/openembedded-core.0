Return-Path: <danismostlikely@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B42BC74D42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 16:16:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p9so42490857wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=3KF7wRWq+n6qXfYH99bFUL/6KqGqlIc9tu3wj/sixC0=;
	b=sHqJXA28ikuOSEOwfDCdePm9uTVdEUWs5DQygkW15mZhG9p16sriUDwUfNSB1dSpmA
	5mWjS7Dj6cVFjcJJ4joW2gAjOEZQMQw5cMkK//aRN9v5TdKGfVrkPWXiunUSYg13gQYT
	0oJgewp0aCnlbqpFd3vQdL/DF67A1LsCP5ClowY5ku7i0QawlUMnDhGsgoVPCzJgPTeH
	i6xMNgDZNFUFvEiogEcsTvePzzXtDm7ESgmaAIYAcVwSFZwlPooMyRj75emctAmqj0Ex
	FNyU+2hfDN4edKb6H4sN8ed7BebuQ/UJzb+J+u1E3acjsNmX0ZrbJUgL9h1Z4yGwoVC0
	00wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3KF7wRWq+n6qXfYH99bFUL/6KqGqlIc9tu3wj/sixC0=;
	b=oexsH0pTaurl1+L5i5QVvC6VXAtP3fGJ5gRXkXniN+skQrvpF8azjHGFS1A1YuYzpr
	ADA+ZLW3ltBTqT3sPfMhfBxotawj6uoyV8rvoBUBu65ZRGrxVtgxCRQFkfOMSrWLeIXS
	minx5Jj12B0HgKJtIGyuE5vHD5EJRp4t59lE8pfMpUcMT7ByXVp3TC/hbFIKAuf5yX4B
	Bnpu6d58zRcXfcHzHgTTDCXL7yycfb+AcZdr37hWsUIW/8D6h3/gOiNS9mSSyx83gifu
	fA4ehavuTe2FPrMnLg726RS2jLnNwgDHUONgYu7FZPU7RxO5RRYv9piWSOnD1oOGDOka
	YjeA==
X-Gm-Message-State: AElRT7Eq3oSXq+IglxUMwy8FjmdpbsNdKTBj0Fx432fON3yaEGNeFQcb
	YCD4B18gvUzyzhGJddAwhJ+8hOqM
X-Google-Smtp-Source: AIpwx4+wAvd36xKRYU+s0oLXWkDsxcY0519f6Hucg6bE3vg1yH3hJS8TnWh2DTGvJ+3gp7wDaaY+dg==
X-Received: by 10.28.10.83 with SMTP id 80mr8861115wmk.70.1522858594840;
	Wed, 04 Apr 2018 09:16:34 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	s65sm4581956wms.26.2018.04.04.09.16.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Apr 2018 09:16:33 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 10:16:30 -0600
Message-Id: <20180404161630.22122-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] packagegroup-core-sdk: update sanitizer lists
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
X-List-Received-Date: Wed, 04 Apr 2018 16:16:35 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

aarch64 has been supported since GCC 5.1, sparc has been supported
since 4.9, and S390 since 7.1.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index a137e7748fd..45e8c135850 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -27,12 +27,9 @@ RDEPENDS_packagegroup-core-sdk = "\
     tcl"
 
 SANITIZERS = "libasan-dev libubsan-dev"
-SANITIZERS_aarch64 = ""
 SANITIZERS_microblaze = ""
 SANITIZERS_mipsarch = ""
 SANITIZERS_nios2 = ""
-SANITIZERS_powerpc64 = ""
-SANITIZERS_sparc = ""
 SANITIZERS_riscv64 = ""
 SANITIZERS_libc-musl = ""
 
-- 
2.17.0


