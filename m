Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0D26D89F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 13:52:21 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d49so1963409eek.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GAb+qZDdWRJIn6YWar3+yoOSKXmOlxJCrHfOh9uTcIY=;
	b=Kq38kuBHM5irvR8UzVvlMgEirMjGCzvwvPj52DNVUsh6uQFau5sqryhNDWPyzOsA6d
	gInv6xB+eZUDDwIe57lz6nnDSmSP7DWNpIomBhvaPDrYVmhfTZDJWcVYDXPQS6LlAp/g
	EtxY7mCyNeGoDvsfqtkaPwDs+tHyJdlgzwdkCpQC0R8DO3yIoaV2NDQ5y0z/xBvyEf3Y
	cw+F7SyAU+jLzWNM87n56tufQBiiZlfNK6x+w2KlZg+1IJMdxsJf4zMtJ2dMPC8UyS3l
	A7+c49m8rWFhZkaGAuahn5motU/fEjYaJnTVSvt12DsU+a1RZ8i7b9v6eaOx/ctORWIt
	JBYg==
X-Received: by 10.14.101.4 with SMTP id a4mr13249460eeg.28.1384696342851;
	Sun, 17 Nov 2013 05:52:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a6sm27463351eei.10.2013.11.17.05.52.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2013 05:52:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2013 14:52:13 +0100
Message-Id: <1384696338-5390-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/7] packagegroup-core-boot: Drop build-time dependency on virtual/kernel
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
X-List-Received-Date: Sun, 17 Nov 2013 13:52:22 -0000

* because kernel isn't needed to build packagegroup and building
  it doesn't influence if it's included in image or not.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 486385a..5455899 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -5,7 +5,6 @@
 SUMMARY = "Minimal boot requirements"
 DESCRIPTION = "The minimal set of packages required to boot the system"
 LICENSE = "MIT"
-DEPENDS = "virtual/kernel"
 PR = "r11"
 
 inherit packagegroup
-- 
1.8.4.3


