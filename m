Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 813706AC15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:46 +0000 (UTC)
Received: by ieqy10 with SMTP id y10so121907376ieq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zRI7ZxnGACgQ/dsUROJYrw+zXiq7/vM1+YPGwit+JeE=;
	b=iVSuoUxwgPqJfYSZfqHH533oyHxh9raVk3r1tLdTu+ZlAehbe6NhCBL+iBJztMrb6J
	CpLGLOGpYvRC4sWvSdF52cjptu1ibTyhhzO1nkSxf7gx3F2hFwem3Fbzj5/58Cbjr6yX
	3xWWlLsNJCRU1VaPLLzGGrHJbU1i+iMpDnkryGvJCnrrFo1EGbCoMpDVJcTFYAov2GrK
	fYxus/8tnj62cmCIAWADKkPmD9WlbXbEXD+77fagpBxM8hud0uZsabO9t+85TxFvgd5t
	S4/LnnIDcp8fD63HQAThfATUQzYAB3FTEwWYfeb1WnHZ68MlIf7fZoPjiChita1Fw2sx
	vaQQ==
X-Received: by 10.50.30.105 with SMTP id r9mr73054919igh.11.1436215846912;
	Mon, 06 Jul 2015 13:50:46 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:01 -0700
Message-Id: <1436215810-23722-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 04/13] glibc: fix typo in add_resource_h_to_wait_h.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:46 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch b/meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch
index 4559de7..70f57c4 100644
--- a/meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch
+++ b/meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch
@@ -2,7 +2,7 @@ The older versions of perf still require sys/resource.h to be
 present in this header, the newer version of perf in 3.2 and
 beyond directly include sys/resource.h
 
-Upstream-Status: Inapproriate [older kernel/perf specific]
+Upstream-Status: Inappropriate [older kernel/perf specific]
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-- 
1.9.1


