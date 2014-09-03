Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id AA1CC70F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:28:19 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fb1so17875793pad.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eIyDYBdfWrjQTs5KRdjYenBv/pNXe9q1iUrBTjJ0t0A=;
	b=tRb/6Q9sPOBrb5S1fOw5Mu+WiHVDLAo0c68BirQM+s5uTYiRckCVUbz187O+3qHlCj
	9BENY1tsYi8sxKTKNeaCuA+On5MFrbPRsz4nYUaMIdlkPRZt2iV1k9RejPPkaQxk16vT
	lGugy4QE2+VQMRWho9hM7Mv4fLScVwLVP6wKJ8AW7gV0pXTreR0qF5EDoN8Tz+WzgUZm
	q6zPWS/tJ64vTMo6o4Gg8T603SIiNuudy9EFB7dWiDz0cI3S60T20M+kUAZJ1m12Z7OA
	5wQUPU2weNzl/GszjksDhbht+T8csJHGxTtS7F2v8xwwk/0Rf3TEMx4InVh9BVIPVN2A
	CEOg==
X-Received: by 10.66.236.38 with SMTP id ur6mr60599113pac.49.1409765296961;
	Wed, 03 Sep 2014 10:28:16 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id zm5sm7367263pbb.76.2014.09.03.10.28.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 10:28:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Sep 2014 10:27:45 -0700
Message-Id: <d05708b323abbe3acdaf8c03379464e64b64b2e9.1409764769.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/8] blktrace: obey LDFLAGS for btrecord
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
X-List-Received-Date: Wed, 03 Sep 2014 17:28:20 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/blktrace/blktrace/ldflags.patch | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
index b9c7c20..3564e51 100644
--- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
+++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
@@ -59,8 +59,12 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  INCS	= -I. -I.. -I../btt
  OCFLAGS	= -UCOUNT_IOS -UDEBUG -DNDEBUG
  XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-@@ -35,7 +36,7 @@ btrecord: btrecord.o
- 	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
+@@ -32,10 +33,10 @@ clean: docsclean
+ 	$(CC) $(CFLAGS) -c -o $*.o $<
+ 
+ btrecord: btrecord.o
+-	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
++	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
  
  btreplay: btreplay.o
 -	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
-- 
1.8.3.4


