Return-Path: <3yXhwXgMKAHYqUeaiiafY.Wig@flex--wak.bounces.google.com>
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
	[209.85.216.73])
	by mail.openembedded.org (Postfix) with ESMTP id DC60360C3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 07:14:16 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id v8so9943303pju.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 00:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=bzuv8OY4mwOVfw4omrAybDp0yz1CjELi9MCdk80vFVg=;
	b=ofTMeVPvU6gkuHoXGbZlhP+2/40ITgTQOyihmLxN2Z63JEeJ3aOCT3A70VEBSFsZcN
	F5hbSCZmag+P79v+SDKkLB5S9FPvN/0U165FtbTpcvcPIxBwm/D6oIjlZ5HQeb9EnT8T
	mgBvGW3qXPbQ0syPpZHF+hP/Xa+V7XKfmTnTXMOKFeJYx9ylcgpZHP4eiQ9bvkRLB9Fq
	kiwKrCG8rxhk8WJ0epL5BwEicUKbLcvOB9g0b1RBF+K8eNZbSM4YTKUtgA/SkHLFDL1N
	DRMxocadjgYTYbMFrJndis95ekFAXsEQMxMtyGGkGP2QLjjpNYQ2X9m+etfK1wzVzXpA
	jEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=bzuv8OY4mwOVfw4omrAybDp0yz1CjELi9MCdk80vFVg=;
	b=s3UhfHiSSFTMPrdhFwdTjs/rB9H5V+ME5mDzmqwRd+KpijJSywrvxqIFpgHBKcPU6T
	4uDVWP4OwODgRQh4f4nYLE+Toh4GD4viy2aAJMOEiblfH8BecFFe7pRTiH59opESWTp5
	blEbzaTl/LYWic7pdyD3TE2l+TdmximO+dqX7/JnOefBBHWO9Woj+his2/4S1iC4XRlM
	O1vUhFjO7Fz+7mAOwGlX3oMfoEqgku4Ut56Z7sBLd+a16HnCaAKyTI+z9pVSYpbCjG3i
	i1x8pOgaBBURIMrJuYgtcPkQiljydrDXpryEKtTpskQ0axVk1YutncRIhGdu8bD5Dumo
	SwDA==
X-Gm-Message-State: ANhLgQ3PQ8EYP44L2WYG1Fg0OEVsmkCkLDDuThuhiamY1MsmbtdvycTq
	3asvNZ63C8EHGGUIrs8hyf+Eg1m33tOzKOn9OV4/l18ZGyUMIDHu6UDeBeX5lfcV5t3da39AQuP
	8XYSrMR+69Xc3CFrHWHMVnC9xoiD6TAAh3HRjw7E5MTq+RGHCIKbZ4D90dBE9RZ/+1E9Fq4nEFd
	zuYg==
X-Google-Smtp-Source: ADFU+vuiueV7yQiHDm0DVDLvNDSHVZVtWO+X9ZnkAxn7BGeFfHlyhNvGhRJyyKQPE+Kpz+DoIVpGkuk=
X-Received: by 2002:a17:90a:357:: with SMTP id
	23mr3888198pjf.192.1584429257703; 
	Tue, 17 Mar 2020 00:14:17 -0700 (PDT)
Date: Tue, 17 Mar 2020 00:14:10 -0700
Message-Id: <20200317071410.136012-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade 0.53.1 -> 0.53.2
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
X-List-Received-Date: Tue, 17 Mar 2020 07:14:17 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta/recipes-devtools/meson/meson.inc                         | 4 ++--
 .../meson/{meson_0.53.1.bb => meson_0.53.2.bb}                | 0
 .../{nativesdk-meson_0.53.1.bb => nativesdk-meson_0.53.2.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.53.1.bb => meson_0.53.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.53.1.bb => nativesdk-meson_0.53.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index d391c9cf29..50fb41ac98 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            "
-SRC_URI[sha256sum] = "ec1ba33eea701baca2c1607dac458152dc8323364a51fdef6babda2623413b04"
-SRC_URI[md5sum] = "9bf73f7b5a2426a7c8674a809bb8cae2"
+SRC_URI[sha256sum] = "3e8f830f33184397c2eb0b651ec502adb63decb28978bdc84b3558d71284c21f"
+SRC_URI[md5sum] = "80303535995fcae72bdb887df102b421"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson_0.53.1.bb b/meta/recipes-devtools/meson/meson_0.53.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.53.1.bb
rename to meta/recipes-devtools/meson/meson_0.53.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.53.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.53.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
-- 
2.25.0


