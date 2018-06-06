Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id D5E067718B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:31 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id q4-v6so2575487pgr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ur57LD8X8wyjNLKv5ad8Ykkb1F/Jw7IqtXdkqm+7Qe4=;
	b=rbBkIw5UATOZeyJ+sNkI8egcHNrhYOjlSb/3NVosfUi/Ps9G5jCYzAtExzQvY6cpKr
	jF+sm/Z/ThWgvweVdb6YKqYf1jZAOkdv9bvUIc865TymRLUJNLdk3aZz8uJyhVdJHZpv
	NbbXn/xKy4t2cdMaSNC9TR537yPKngYuD7YWQHOgrl66R6YzXpxFqfKmdKNPcFjv2DxC
	QTNg89o5/xguhBaAbytjECE3er/F+t1D0/qtWOBsHAnoCsgFhtpId1q9BaNe/SgZV0ys
	tvQAjlqTTtsU7LSU2Id0jjDCwjoZzJcqYz5vCDOp/7d2GFFS/8gPzlKUupBJrF9HmyJg
	y4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ur57LD8X8wyjNLKv5ad8Ykkb1F/Jw7IqtXdkqm+7Qe4=;
	b=Y5ZBvoBxjLQ75D9FAs3s+a+Rotp4t3XmCMs+DPK8wsUXs8YE2392qIy74RBa8eVfnx
	sTSYO7l3BDz+Pz6m5S60Cah2WQ/G64WD8MrsMbG7bgSCN+7t/cJB/ArUzwIN07cUtWXg
	LFu4YAZocQaXJ1bEJ3U7rQ7yETy0qrzPG3TH3qSaXycPdDbDPt9tf8CcSC3+e50fVWSx
	X9AY9rpqqu9dQ/vyZHq5ORIIuPH1kJZ6eqx+DtcMLk0Bpr1izumr+2/egQ3rYxufQzKe
	gxJ5OZkpAm6pZjIT12Nd6HFzBGwTZOCLCBEiDCaGCLNWWksORlD8jr/1kKSksXo+D4H4
	kB3Q==
X-Gm-Message-State: APt69E2AEQOAJsddd6j61PLqI0+lYmuBvBlsL3JJsUvysMETHu3RtFVa
	HqAJMZqlDCmnmI3KuVXxmtchXQ==
X-Google-Smtp-Source: ADUXVKKa5lTDx3l05sLcpu2YozQnMNQi8BYHRCqEdCC3jWvYkwMeyt7yh/FvqeriDn6Uf/KYPXm+LA==
X-Received: by 2002:a63:ab05:: with SMTP id
	p5-v6mr3879381pgf.280.1528321052566; 
	Wed, 06 Jun 2018 14:37:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:22 -0700
Message-Id: <45c29f472fdba27f2a05397c676c13200a396dae.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 06/12] gcc-8: Disable float128 for ppc/musl
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index aa3b53e64c..00fec0bb6e 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -46,7 +46,7 @@ def get_long_double_setting(bb, d):
     if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC') in [ 'glibc' ]:
         return "--with-long-double-128"
     else:
-        return "--without-long-double-128"
+        return "--without-long-double-128 libgcc_cv_powerpc_float128=no"
     return ""
 
 def get_gcc_multiarch_setting(bb, d):
-- 
2.17.1


