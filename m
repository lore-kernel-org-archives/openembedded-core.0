Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 064D67017D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l68so494895wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KJHDdL/QT7CfZOCvdaravKNKBW2+qGXVOw1tCHWgkZ4=;
	b=JnM0gSRCDqtQaTsiWuDP7C2eueIq/btQbPGIuX8DqkjEt21lI6obmAo37ypn0u58Ff
	L2GjirAHz3aZU+7e8l8jnwJYGHTOS2qq0pa53Qa9KwtGPMoAz7S1pobZ7JJ7nbwqaGii
	bM+P/zcWyjJyfYb4/HUNQmdjSyKl9JztPLuApjggOV0SYJMTsU5w3FpMrEpMzajKAjIr
	PelrkYiP4nChHFrb2PgvYgYBBfLqCBqxXKl5u35dauMVgcG+JJYFQ36xweCGo2GAsyFR
	+j78S2egyYmK3xCX/CHQocEExYSGNeucApPJ371u9rLFxgGlMII7XEkVyUVOs4rHA2Vc
	wYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KJHDdL/QT7CfZOCvdaravKNKBW2+qGXVOw1tCHWgkZ4=;
	b=DzFkcajZgMYRIlc6bCkkBDuJkInH4paS/mxGbLg5cqFObjsKQiD38jS3A7t6Rte20g
	nmt4NlK/oNSw7NOex5HL6DIUt9lujT2hWxRzpx3sUej3ragwHUGcn3c5jwXoGm9MnW2x
	zxBM8Le5YXiSP/GaV/kzBPcioV9qGmkn+4sGbMCTiLO6+lY4sJVhScDTnpCPOi5nvaLZ
	JtoXJBeUmO7i2CtwpO4PJuoxkhsXgxihplm4PuZLpC4lvcYwo7+C7efsaFIxKknvRnSg
	30vg0X6XxhlZegtp7BKY9Vh2JfKMWoJbG5Ft7/YCaigxSwkoxFJhGWdcv+o12aB0MFrG
	Z6/g==
X-Gm-Message-State: AD7BkJKbnFBxPs5M1CfDKKMTKxTDp+apiTJJAnth3eHyFBUpU42mPUm2GAIGMDYMsnhLhA==
X-Received: by 10.195.13.76 with SMTP id ew12mr12584102wjd.68.1458235188656;
	Thu, 17 Mar 2016 10:19:48 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:47 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:28 -0700
Message-Id: <1458235169-9267-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/8] gobject-introspection.bbclass: make additional DEPENDS conditional
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
X-List-Received-Date: Thu, 17 Mar 2016 17:19:48 -0000

Make gobject introspection specific dependencies conditional on
gobject introspection being enabled.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/gobject-introspection.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index d8b8b3e..eb0e7ad 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -9,7 +9,7 @@ UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspe
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS_append = " gobject-introspection gobject-introspection-native qemu-native"
+DEPENDS_append = " ${@bb.utils.contains('COMBINED_FEATURES', 'gobject-introspection-data', 'gobject-introspection gobject-introspection-native qemu-native', '', d)}"
 
 # This is necessary for python scripts to succeed - distutils fails if these
 # are not set
-- 
1.9.1


