Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (unknown [209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD746FC31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 05:20:20 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id bj1so12273866pad.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 22:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=v1Xa9Sd3zAZPZ7EJXZTW7voLsazBvNGuqVmnRAmpxB4=;
	b=teKH9N7HYtzaGsgncskUOSVsXuFJ8mEw4k7i4Xl4CWJWELZCpTNRXcOLA+0PRPpbZb
	sApStmdEnRcQIzKQX7NZ2pCOBMo68Q8qVmnO8UsZpb3uwcU4N4N/r0356qt6o1Xjzjh2
	RvI+Xp7MIhLqgG4WQVXNK5uY1x9ShtzPfqZJ5Qf6UgGacEfW/BXlgNfc+y9GydPANWVr
	Oy4Poro3CsJf+mMG8Gb08Q/frC8gdlwfBsRS4fpJEYvmvORI/pIcSio7mWYVBRDWHx4g
	ygfdvsDF/k/t4inRJyb8Yqmhngr4onG31UhQYnTzBDDaOZrnJKTZev4UfM00fUSHCxcm
	nQYg==
X-Received: by 10.68.163.100 with SMTP id yh4mr5666741pbb.122.1401340821716;
	Wed, 28 May 2014 22:20:21 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	jd5sm31260756pbb.18.2014.05.28.22.20.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 22:20:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 22:22:54 -0700
Message-Id: <1401340974-23302-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [daisy][PATCH] x264: Update SRCREV to match commit in upstream git repo
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
X-List-Received-Date: Thu, 29 May 2014 05:20:22 -0000

It seems that 585324fee380109acd9986388f857f413a60b896 is no
longer there in git and it has been rewritten to
ffc3ad4945da69f3caa2b40e4eed715a9a8d9526

Change-Id: I9ffe8bd9bcef0d2dc5e6f6d3a6e4317bada8f4be
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index d192c30..0e856b3 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.videolan.org/x264.git \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            "
 
-SRCREV = "585324fee380109acd9986388f857f413a60b896"
+SRCREV = "ffc3ad4945da69f3caa2b40e4eed715a9a8d9526"
 
 PV = "r2265+git${SRCPV}"
 
-- 
1.9.3


