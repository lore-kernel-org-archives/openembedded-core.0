Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8161771A18
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 08:20:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o126so6228994pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 00:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QQVKBMttNYi94+vzBb5R8/gPEjfD4w7lIsGwN6Oxmsw=;
	b=PhZiuhhe8IYi9q2KFdh9IYFeRa0yv5JwLJ5QxbGPOukPsPqEgI9Mg38e51Ztpa+ICq
	C6RYszKFTGiZ7Kd2JowzBOYnIcSDmQsSBi11HvKdHNphrRGWpM86kvx74If2MrluflFU
	4ckN8JVdEMTMOh83ampd7BKFp6GG2JKGYb3+4mp4kXAfNd9Mp+0uO2+bNO0mM2AjWMRt
	Vdg0G11zckFD3iv7ppC4kd9fePMk6lMCuuHuWAdcGPdrQlrNmA60Oprys2BrXjpmkDT+
	vUo3oux0M+4wJehVR+ek7+i6SKZA8HuON8p6PQZAgxEeM1LtUSSTZwLqHSRm3dC0w9be
	M8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QQVKBMttNYi94+vzBb5R8/gPEjfD4w7lIsGwN6Oxmsw=;
	b=AoKmgjURHID8n5vPSu1RX6WXYtINKrPztzgf4YDjUr/fc+Dg7yZDvMun2jjpSubt+c
	ePOlhcuFCDcZ3S6Tn30Lki50Sgx8sQ6b0Xahp14Fy8CRDqAW+NbP9MxtwN4PiOmvcrMg
	QmGe9FdFuBLEycemURLCyRYzlnt1croENr3xV6LE4h9RUfODgJUqQRtf1iNyTQy6wNkx
	s5m/dWWVd7+mefbcwIuli39NR1hjq4MrPu5aLNypZPClvUAKMJGeeoQ/FfBQ9tTGcbwj
	Y4pEHfVfzVKdLbG9nBQ91u96EJKQPvkCCCHNqy1HOQT8VgJMK0jbfEQLEb2aAwYkMbBq
	WY1A==
X-Gm-Message-State: AMke39kEq1jQcKb7HEjUQIHusgZI/TO8NVc6z40zOVbdTMj5M5TJ5FSqk89HsivGbKYQMQ==
X-Received: by 10.99.135.73 with SMTP id i70mr25519550pge.157.1488874818736;
	Tue, 07 Mar 2017 00:20:18 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a8sm44104243pfa.30.2017.03.07.00.20.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 00:20:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 00:20:08 -0800
Message-Id: <a5120a7bcd94d5c96f8ec3761070a1ec72eb2997.1488874598.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1488874598.git.raj.khem@gmail.com>
References: <cover.1488874598.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] musl: Update to tip
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
X-List-Received-Date: Tue, 07 Mar 2017 08:20:17 -0000

Bring in some needed chnages for arm

Bobby Bingham (1):
      s390x: implement dlsym

Rich Felker (2):
      fix build regression in arm atomics asm with new binutils
      allow page size to vary on arm

Szabolcs Nagy (1):
      fix lsearch and lfind to pass key as first arg to the compar callback

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 5e293cfc13..7156669064 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "d6601f0af0452b218d247cb47513fc9cd6bbf2e2"
+SRCREV = "827c4e6fbe46142049ef3d8bcb8f35951712797d"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.12.0


