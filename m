Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 632F4714F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:26 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id e4so315702wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4U9fgyug7gDHvpQC13TpciRGR/aj0WDN5LUfG6fKplo=;
	b=qLi2+f47Lh7JpEvOZu2fFKGzr94H10DwbE/I4cRKIwd6jaIWLZeYP1IsetqHjJWyw0
	psnqHeYJgDQev78Nk6C0P88fCeY29TQ/GAKG6VfhPETJ3oveHHhR9HDOH25qpWSztGil
	X6dIhKlOOxL/LEHzKTmfh++pB2KiA4juwbwuPB2pS2j+P/xfASCe8ZK+dyeVjFn8DCCD
	oPlQCQGdwlm5GT86y0RCAp21qZZdmvyhY3iDdVThtn4Mc8pw+gWxdGTVCQOsDi5iOlES
	kX6o6qorxIt/uvAb2fVT4FKt3SNLXZDLpM/C2CoIcoBJ+ppEaX7u6El+4baPzxzyvO3U
	l6Rw==
X-Received: by 10.180.72.170 with SMTP id e10mr1770549wiv.75.1410916648022;
	Tue, 16 Sep 2014 18:17:28 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:27 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:17:00 -0700
Message-Id: <1410916622-26204-7-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 6/8] blktrace: obey LDFLAGS for btrecord
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:27 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/blktrace/blktrace/ldflags.patch | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
index b9c7c20..037d161 100644
--- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
+++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
@@ -59,8 +59,12 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  INCS	= -I. -I.. -I../btt
  OCFLAGS	= -UCOUNT_IOS -UDEBUG -DNDEBUG
  XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-@@ -35,7 +36,7 @@ btrecord: btrecord.o
- 	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
+@@ -32,10 +33,10 @@ clean: docsclean
+	$(CC) $(CFLAGS) -c -o $*.o $<
+
+ btrecord: btrecord.o
+-	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
++	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
  
  btreplay: btreplay.o
 -	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
-- 
1.8.3.4


