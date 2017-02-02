Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 671B471DDA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 20:22:32 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 204so2696701pge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 12:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c9sr86TGmq5kex8GVQXL82xYBLEBODMNGi9YShdOP70=;
	b=m+j/iUIKCUwQEvZ93F41zKva5n7QdRnKdLR9yQ/1Rw1yRZlsz5CIGWJ3Ek39TTc6re
	UEIZ6M9Hpr0bMEgcqgwr0wTCG+sVGi9Uvg+Km/dbPR4ldzFKrVTKfMJcEn9N8PgvU0NQ
	gvncBEHgu0JhDj3fPitOF5CRjwQ2VDEJcNVBT0dys8UR8RE6UsBbPh+ZqGt9v2OVCwQ9
	Ebw9fS98waYMbdg7zV/xHR5aMBpcC0ei24hoIMiVPJUVqUNUfFHeSzX3DROWMSzl+o5Z
	PTDpMrX16k7Bx7JSaD5mPGtVTKNzRJWRBCNvJgSRM1iiITnZMJGpPm8ACF5D5ETNcYDP
	cizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c9sr86TGmq5kex8GVQXL82xYBLEBODMNGi9YShdOP70=;
	b=bdjsTjLvgd/aA2ol4XqQhh3IyN0DBRskGM31nMsrJLc98+9v+fAFPAGG2LLG8k41qF
	fhALwrxL3hYE3LrR3nIXs6HGvwQXrXWxCxxUVfPkewZ59GP8HjLN1MjDxVXO7NFp7MtK
	AuBtoLgkY6wTWbEXDNlTfZIjbtAn4h9xZF0CKrg6/32P+YhAZo2ybS2DlYhbD+mCVKn1
	O30pmNBMbHznc+q608bmyBVAUg0kK7wZ8mCkj/HiJI+wOWm663BJVX9UdjRmb6+VvnS6
	KVuh65VfpxcuIHXDal3GRCHZhgmJThghVOQd5FfnpsBJv32zVrMwA/jt62febkTIFYzT
	tRZg==
X-Gm-Message-State: AIkVDXIQGOKyRZY9csXqusRfxrwgI1hUqLbxTDJl1YEjmZFhq2tRuDVRUP5FXCCwxzN5fg==
X-Received: by 10.84.196.164 with SMTP id l33mr15430683pld.158.1486066952748; 
	Thu, 02 Feb 2017 12:22:32 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	66sm61180122pgg.47.2017.02.02.12.22.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 12:22:31 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 12:22:26 -0800
Message-Id: <1486066946-10670-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] pkgconfig: fix typo introduced during recent conversion to PACKAGECONFIG
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
X-List-Received-Date: Thu, 02 Feb 2017 20:22:32 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 5f2a5b6..422c5f3 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -24,7 +24,8 @@ inherit autotools
 
 PACKAGECONFIG ??= "glib"
 PACKAGECONFIG_class-native = ""
-PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
 PACKAGECONFIG[glib] = "--without-internal-glib,--with-internal-glib,glib-2.0 pkgconfig-native"
 
 acpaths = "-I ."
-- 
1.9.1


