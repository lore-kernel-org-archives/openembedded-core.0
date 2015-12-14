Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 22EA97318D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:23:20 +0000 (UTC)
Received: by qkht125 with SMTP id t125so121066574qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 22:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rQLnZG+3qXVHm7H3c2mprJ7UqfcjUw7Hc6qAF0ru8HE=;
	b=rxYiPX/uwYV5ZA7GPlvugULxScvIwGFjyQrwczCMyNOKSR5fweYSpGlPxPAwPkwyiG
	FWGGefWPnlviWzqDExg51rRdxWMl5Wf53PdUXglZau/ugMIPrZPLDgZHnRAaidKYXuCE
	Ls3gOVv3jSIA2uK3OqgEwUw79vHMKiKOPkWW2WvxdwZ2796BPrThUy7vQgy49DRUpuZx
	/JhgjNo2rc6Ham/6tQ7HJ6+Tm+BuerXZu0f7Hq5IiEa7HMKs/7xZNv0tBw7guaT7986O
	9xPKJAB2BJHqDXt0VU8ctyXdWesvMs37ioUay2u6dm/kMoll/6gonWiQb3l+hZbLbkya
	PE3g==
X-Received: by 10.55.209.214 with SMTP id o83mr41781830qkl.60.1450074201345;
	Sun, 13 Dec 2015 22:23:21 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	s105sm13252860qge.40.2015.12.13.22.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Dec 2015 22:23:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 06:23:10 +0000
Message-Id: <2096b5f38e1ff74c44a5ae504d7f7b6cae3fc508.1450073907.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
References: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450073907.git.raj.khem@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] packagegroup-core-sdk: Disable sanitizers for uclibc
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
X-List-Received-Date: Mon, 14 Dec 2015 06:23:23 -0000

They dont build for non-glibc C libraries yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 3badd0e..46cb6ee 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -35,6 +35,7 @@ SANITIZERS_mips64n32 = ""
 SANITIZERS_powerpc64 = ""
 SANITIZERS_sparc = ""
 SANITIZERS_libc-musl = ""
+SANITIZERS_libc-uclibc = ""
 
 RRECOMMENDS_packagegroup-core-sdk = "\
     libgomp \
-- 
2.6.4


