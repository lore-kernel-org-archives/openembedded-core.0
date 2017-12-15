Return-Path: <00moses.alexander00@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8B08787F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 19:30:32 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g53so8960115wra.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 11:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yL6FDExIDrSJskpS5mjOscmqGGLr9jw+i7HoHgo8/Lg=;
	b=kqw6lQ2ugoQrHGzzu/lGtwHsppfV9SSOMH+R1rdK4Pxk1iHLz53Vpsw3kg6rIadvde
	85ztrLQFx1DJKzhtHNGKbVyNz84Nkjh+VuVWb0IssM19OWM9VGbyCYqlcx12w9RyaI9i
	eEfdNeiY9E/J8axzkcQ7zxJViF9gA1dfkNwIq/8vd80AI8enus15m8cXSDGWygF/6HhS
	HlgvLVYmM9feIsH9c797QK6pvEMRmSi2Mdxr4pMk+aKvJpdoXs2EpXRGMiB2Mu+owPOU
	9hY5qF3JoHLsu7yzodMHETt5C8gdatFJnfDN3yTSi/Oulb92+UGDpfiCGbsBCYtyeiIH
	Jqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yL6FDExIDrSJskpS5mjOscmqGGLr9jw+i7HoHgo8/Lg=;
	b=REnbZo3Nn7gFb0YEDU89oKDhwM/Bcuy1iTIYXqPaijD2HNEmmKgHY97TFqoDa282Jh
	SKbDFNqnuBse8DJ8jfJZJolcMGvi1TYb0UFB4MVrfoJ45dUketJHZwKeL3OTnyG7mS0O
	6JNMisNE6BFBjWPjjU+XpTmL6eFeLAeYcx5F3xZllrnbs5ScJqyHlZlXExe4H5a+VgEL
	s9sBF8F0wGvgEALYYE+X9Ca1EbZNBmEv2gM6iouY7nQqY7a7Q5LIFkTTU/1YG+VSnaKh
	UnfJoovYcJrvWpwBTfDMeF8bAyNaXF/VWTH1o5g9SmL0u9MW5AbCv5LTNXp9tP0W5IoV
	qhZQ==
X-Gm-Message-State: AKGB3mLK9+l8HPTu5xaRuKxU6kImmrOJIAZTSb149MPRcSHngSx/i4fE
	x5+SpJuUIFxbqt70tyba8iVefg==
X-Google-Smtp-Source: ACJfBov3/du6GPRoM2bet/mE4jPCHo8c46jsb4rMFiyNkEOaf16TSp0zcf2ou3BQ1yXwpGXxDVwxng==
X-Received: by 10.223.190.9 with SMTP id n9mr11079352wrh.46.1513366233201;
	Fri, 15 Dec 2017 11:30:33 -0800 (PST)
Received: from nodezero.t.hu (51B6B6DE.dsl.pool.telekom.hu. [81.182.182.222])
	by smtp.gmail.com with ESMTPSA id
	g78sm6592821wmc.30.2017.12.15.11.30.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Dec 2017 11:30:32 -0800 (PST)
From: Alexandru Moise <00moses.alexander00@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Dec 2017 20:30:26 +0100
Message-Id: <20171215193026.19273-1-00moses.alexander00@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] sysklogd: update Makefile for PPC e500v2
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
X-List-Received-Date: Fri, 15 Dec 2017 19:30:33 -0000

Previous patch doesn't apply cleanly anymore, just replace it with
ported patch.

Signed-off-by: Alexandru Moise <00moses.alexander00@gmail.com>
---
 .../sysklogd/files/no-vectorization.patch          | 32 ++++++++++++++--------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/files/no-vectorization.patch b/meta/recipes-extended/sysklogd/files/no-vectorization.patch
index c1cc042c9c..76f60e54b1 100644
--- a/meta/recipes-extended/sysklogd/files/no-vectorization.patch
+++ b/meta/recipes-extended/sysklogd/files/no-vectorization.patch
@@ -1,20 +1,30 @@
-Upstream-Status: Inappropriate
+From 9f17a051a77923fabfd831e946f5d919e452a86f Mon Sep 17 00:00:00 2001
+From: Alexandru Moise <00moses.alexander00@gmail.com>
+Date: Fri, 15 Dec 2017 20:19:38 +0100
+Subject: [PATCH] sysklogd: no vectorization
 
 The compiler should not be generating vectorized instructions on this target.
 This is a work around until I can determine why this is occuring on this
-particular recipe
+particular recipe.
 
-Index: sysklogd-1.5/Makefile
-===================================================================
---- sysklogd-1.5.orig/Makefile
-+++ sysklogd-1.5/Makefile
-@@ -20,7 +20,8 @@
- CC= gcc
+Signed-off-by: Alexandru Moise <00moses.alexander00@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index af699d2..cb3ff41 100644
+--- a/Makefile
++++ b/Makefile
+@@ -19,7 +19,7 @@
+ 
  #SKFLAGS= -g -DSYSV -Wall
  #LDFLAGS= -g
--SKFLAGS= $(RPM_OPT_FLAGS) -O3 -DSYSV -fomit-frame-pointer -Wall -fno-strength-reduce
-+SKFLAGS= $(RPM_OPT_FLAGS) -O3 -DSYSV -fomit-frame-pointer -Wall -fno-strength-reduce \
-+	-fno-tree-vectorize
+-SKFLAGS = $(CFLAGS) $(CPPFLAGS) -DSYSV -Wall -fno-strength-reduce
++SKFLAGS = $(CFLAGS) $(CPPFLAGS) -DSYSV -Wall -fno-strength-reduce -fno-tree-vectorize
  # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
  # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
  # $(shell getconf LFS_SKFLAGS)
+-- 
+2.15.1
+
-- 
2.15.1


