Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3131C78D3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:33:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c14-v6so5657660wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RGzWvASYBkmXh05SNxrI+OLMACCrC7cK7ozDvfO2T2M=;
	b=waeYqvWwi2ah2Jda8g+cOOSeczcXea41VVX2nubyVCyGyYOW5WchQH214A3Qm6CwkL
	+3LkfEJcVHaktuUl5dqYAZZ9NUEqf+k/wWvN4/vIRz4WcJgkqyo5J9t7CGXpUjcBmAX2
	dhWnAsskBKyuSq7xUDCW/tf1TzcvsuQT5gZL4sK3GPQgdN1ambSjyJ0Qi93l8UR9+C1f
	2xLy7G0LZ02GvicSlfvtGcI0WBxKH7/5ZEIoN5qwm5XFrJak0weTsW533slprbnrhxvZ
	Z1dVeZYkxBu+GXWAWWC0+Ts7CzIWDkGwowRHhPr+yL9vFqUDfhJBkljhKMAa/ZQPS+9R
	LQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RGzWvASYBkmXh05SNxrI+OLMACCrC7cK7ozDvfO2T2M=;
	b=Q/RS4uHsajZNU1s8fMHT+7onnYm9O8324KfPVAdxfAniuAMa20N5+VC2E4QPDh/zu5
	Xnmp+vfX1u3oH/lVCgean4zg8dIVFxSB3/e4GoaHSpMC00vj7sJilbT1MkoFwcNgfC7r
	dnfr7nQjhxezsBeR6xrQUO9DCWLofDRWW2sLSNyartsRMG6L553KT1aBns75CNtUqIOG
	DifiLp1/pJvxXADBJ9XSExUDF7fIwfRzDgTuqaLdtqiQ5r9Cfc3Z5oEHqSzRPj0UE5VN
	z0UZU9haaywn/DqEkjgxYa0OQymPv46s26814dSVajOpUoWyckTV0GKzoU5YTR91+gQC
	es3A==
X-Gm-Message-State: AOUpUlE2BTE97Kxt9EgirCZus5QoSJiXtqetU01J9IwzzbTbSnYKPwdG
	unpsuKss89T91MbzXVO+llKk/yfgpxk=
X-Google-Smtp-Source: AAOMgpf55FfH6uyseG4wR27AFr9rSotkjbZNXO+TpBm7DIrfJFDIAhSUpn6F+D0iaoPEhks3av0GzA==
X-Received: by 2002:a1c:7c0c:: with SMTP id
	x12-v6mr4689614wmc.58.1532705586608; 
	Fri, 27 Jul 2018 08:33:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.33.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:33:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:45 +0100
Message-Id: <20180727153248.22838-13-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 13/16] gccmakedep: remove
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
X-List-Received-Date: Fri, 27 Jul 2018 15:33:06 -0000

Nothing uses this in oe-core or meta-oe, so drop it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb

diff --git a/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb b/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb
deleted file mode 100644
index be3a667449d..00000000000
--- a/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Program to create dependencies in makefiles"
-
-DESCRIPTION = "The gccmakedep program calls 'gcc -M' to output makefile \
-rules describing the dependencies of each sourcefile, so that make knows \
-which object files must be recompiled when a dependency has changed."
-
-require xorg-util-common.inc
-LIC_FILES_CHKSUM = "file://Makefile.am;endline=20;md5=23c277396d690413245ebb89b18c5d4d"
-DESCRIPTION = "create dependencies in makefiles using 'gcc -M'"
-DEPENDS = "util-macros"
-RDEPENDS_${PN} = "gcc"
-
-PR = "r3"
-PE = "1"
-
-SRC_URI[md5sum] = "127ddb6131eb4a56fdf6644a63ade788"
-SRC_URI[sha256sum] = "f9e2e7a590e27f84b6708ab7a81e546399b949bf652fb9b95193e0e543e6a548"
-
-do_install_append() {
-	sed -i "s,--sysroot=${STAGING_DIR_TARGET},," ${D}${bindir}/gccmakedep
-}
-- 
2.11.0


