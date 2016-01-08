Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9366873289
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:20:01 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id 6so270218039qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kVdjeDweEZYylummDV5yASn6+05siiSqJMKX3ppQPNc=;
	b=iQ0yHRvrqk5lJlqnOygEbltUJ0rxLeBDYg3iuwRLDWn8WaSZYtW+G9lW06YFq9LVSP
	VF7/eQtxjFtyZlt2KLqI/e+8rNoKGrg+TFQsERNZv7lnMaaSaYY+EABOjTDeliKdSYA2
	X9+mhC6/ktbcaAIZGYOv2GjeaS1NJz9fh5qLgV1q3+hD3iWuDmo88bCirLg87rkAgwmB
	bOFdC8wQCqSTOPT6rnt85O5siQhyfOn+KV+SHkn1TQA7J98f7A3HBd2fhhYKDyOFntR2
	CPwrYDMmJbuu5BCvVH7l2gUfuP+B+GLJNQOZfQq8juwOsPBdLkWOHKkx7UhHrbdUowRt
	jQkA==
X-Received: by 10.140.201.20 with SMTP id w20mr87296284qha.10.1452248402018;
	Fri, 08 Jan 2016 02:20:02 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.20.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:20:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:19 +0000
Message-Id: <4f3c369514223305ae263c23e9731ce78ad1a2ae.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 51/53] nfs-utils: Disable tcp-wrappers for musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:20:02 -0000

Doesnt build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
index 2e0c8b1..ea00656 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
@@ -64,6 +64,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                "
 
 PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 
-- 
2.7.0


