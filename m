Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADFF795AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 02:09:14 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id s17-v6so398805plp.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 19:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FIO0yvJH4Oc5HFuzesSKYk+UHtusB6ABDzVo1AX0DHE=;
	b=kjwNcGmV2bic6d1gaTqBvCiBWufX8axfbXmkQZCT6/qErbge4lcnUNBWqdofbFEW6+
	wTV1X1G+b/oNb6A1luzeOQsdKXgLZPKfRznP/sXmXw+mz522WewGoatXb+ldsOoqeSkG
	uYfjEBnXeo/kF41teDGK7WynhVS8jz+pgaRljepGu7wRYfl8hhISzTrh8nGp+LVmcJ74
	qkd8DZUo8/l/zXPVJM4kUgAXxnRacLccl6IuVfdYKkZizTBgQBUqgDEqYenFV/dUSTN/
	gw7Xg7ND/pYfQVR3RfkHgmQqryn5pK9adu9kyGEGSbbnfzYGBRb4lDRdnOzk8uMl/N66
	oaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FIO0yvJH4Oc5HFuzesSKYk+UHtusB6ABDzVo1AX0DHE=;
	b=qcTCSrLesM2XmlxKKvILUzjskn0rBhGF+yMFRBb1SohCy2UfkpiC9fVzDcDbOZd/E1
	rxZ+9DW1waoLuey8bJCbjdeLVZCChzvc56mO9OFnLZ3gXAXCgja5QjHnJIdy6J1F829l
	Zt6zKbocNiiZaW+TjgtLFKXarqgj2o41/ahrZiNqYNQmVXqIwfysghBl7mrYSVHuMnPl
	GivohEycms/z9jNL1OVf4e/s533PWHnmGrYkEOPe4lKmwP9CyMjoEIBzGDYe261Qz2YG
	LbOVkHbdMILH8WnqRVZMLUPGwcNT9cLbYAdHIyYRdV/RPzj5Kwk7jtJ/9MhtcOKpqeaT
	zIcA==
X-Gm-Message-State: AOUpUlH7ggAhsT2u8fgeqZdJbbtblz1xuyvCPOe9ATKHmYIzzQLpvBlc
	IXB7Bc+uKo4DcI5lDLijMP+ffFTM
X-Google-Smtp-Source: AA+uWPyarfn03FTtwj0C5X0blDK70SxHsk24+x4GCXp7LSuFm1l2o8W79ktIpYtwSpUj/7gY21RmAw==
X-Received: by 2002:a17:902:a983:: with SMTP id
	bh3-v6mr60830643plb.245.1535076555856; 
	Thu, 23 Aug 2018 19:09:15 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	u17-v6sm12791650pfa.176.2018.08.23.19.09.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 19:09:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 19:09:08 -0700
Message-Id: <1535076549-29504-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] cairo: merge cairo-fpu.inc into cairo.inc
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
X-List-Received-Date: Fri, 24 Aug 2018 02:09:15 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/cairo/cairo-fpu.inc | 6 ------
 meta/recipes-graphics/cairo/cairo.inc     | 9 ++++-----
 2 files changed, 4 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo-fpu.inc

diff --git a/meta/recipes-graphics/cairo/cairo-fpu.inc b/meta/recipes-graphics/cairo/cairo-fpu.inc
deleted file mode 100644
index fe7c533..0000000
--- a/meta/recipes-graphics/cairo/cairo-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_cairo_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU') in [ 'soft' ]:
-        return "--disable-some-floating-point"
-    return ""
-
diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 7347f22..b432da0 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -33,11 +33,10 @@ PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
 PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
 PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
 
-#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
-require cairo-fpu.inc
-EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} \
-                 --enable-tee \
-                "
+EXTRA_OECONF += " \
+    ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \
+    --enable-tee \
+"
 
 inherit autotools pkgconfig upstream-version-is-even gtk-doc
 
-- 
1.9.1


