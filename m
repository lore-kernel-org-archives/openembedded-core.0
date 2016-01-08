Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id E780A73E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:38 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id r67so1591872qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FdWm+XsFs8uG5ZHZoCPMwcXuVG4owjuumid0/rpjnOo=;
	b=ltsoz7ILKPLknBr9QwoaxE1yCJTtzT5QSOjBAxffhGhKW4jy9MJ8wwi+tw1gZGrQyc
	AcIkpz+sjO0VlHmdmvaLQ6c4F592QEg+0hzM/RG+BmOEk0LJwoT3Vfppi7K0J/pEGFym
	O6+n94n6LdG9PKBlxsDYyaQL4VzlSFVwwLumiWYyTFb7JER16gC+WsARS0c66Pl+6nQX
	b7R5k1ICNVrv5xBIbglAEZlNWRH7VEAVVZGacud5osIS45bMULs/LnGq1Cd6JFbbhPw2
	oSWdcNDpgFq2dhZAJ7lIK0r2tCKQ+LG57OzeQvYQxoVXHpgmoPnxlk/wa58V7AyEwGre
	Tj0Q==
X-Received: by 10.55.200.214 with SMTP id t83mr25863078qkl.13.1452248378988;
	Fri, 08 Jan 2016 02:19:38 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:45 +0000
Message-Id: <d4543ba21815e053308c39daf001599216dec5a9.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 17/53] packagegroup-self-hosted.bb: Move glibc-gconv-ibm850 to glibc only case
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:39 -0000

This package is not provided by non-glibc libcs therefore add it only
when libc is glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index d38be26..bb8371e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -67,7 +67,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     cpp \
     cpp-symlinks \
     distcc \
-    glibc-gconv-ibm850 \
     file \
     findutils \
     g++ \
@@ -93,6 +92,7 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     "
 # glibc-utils: for rpcgen
 RDEPENDS_packagegroup-self-hosted-sdk_append_libc-glibc = "\
+    glibc-gconv-ibm850 \
     glibc-utils \
     "
 RDEPENDS_packagegroup-self-hosted-debug = " \
-- 
2.7.0


