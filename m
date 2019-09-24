Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 525707E836
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:22 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id u20so281103plq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3uKAr1L1Xp1oeI2Oy17Tx8SLqaRoCYAuyxzRNzT+IPM=;
	b=e6TXUEiIIAefUuXPwYEskvD1xWRHBYA6DK7RsiZLWqtTKghsXtX/nFUwxRsP+22oP6
	p+nfsASsdX55FHYr5aTzzRfxq1vnUeGHYo21AkSR2MnBSI+eHmVd6mWkHMNao7oVU3qJ
	NtGS3yeLh1dTQ1DHNqTdDNDgplkMqTalH3VpOxpk374vE8cD4N1g6lK7VKV23atfg9WL
	C8i3JvaK816xP/ywnB1PKRAx5ImSMlDAbt61wh6/VBI4NGdZI1e+x5UO4wkHQafXzyKE
	dJhrSTQkrRcSvSIQ7wgElbFTRYuFygWHOYxBcqZxyvKNgTMDeFgIGkZ6JtjHY6O59REY
	PSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3uKAr1L1Xp1oeI2Oy17Tx8SLqaRoCYAuyxzRNzT+IPM=;
	b=JqVB/OwnA0mEkHhJ5vM2lKcyFtsgJEkCdmjARIor6jwZsJ3z9/tVpEK7U8bLn7NgoT
	Ytwfemi/eGMo7vgafDRywGM84EtlqFU1Y6ml8gzWNCLvktVoeChPNvL1OcNvrAuOP1Ne
	mCMg7TnIE1M7hxuKqtcc+VbUs8gAyKD2LChyLY0jMl6ipwnbYJ8IAbUBVX8HmKbj+BY8
	IRmiHv/erMWXonrjEfDgCEtnvvwF1mL1bJK6hrxXC6i6b6U4gGZmk/dticzCp2uqEsX3
	xRCC7lEHFGfjjNd2eYIyzjm5tt0hxZnMKf1Gcj9wOLHiznKigHe85O3+2884AKsHp95h
	kQQA==
X-Gm-Message-State: APjAAAWG+8idABI0okxXEN5XH8F0JH/bRCwVhbrjsBLjIyoKQYnEeUSB
	B3WTnXZh78YoOgQRbpFSZxYb07Ai6Lo=
X-Google-Smtp-Source: APXvYqxDZ1/Gb0X42sJEwWR+E7CS2cZOKqJkmUTa8HA8BdQMtDgbwg++bFqrGVV9lboaKA9aSiRH4g==
X-Received: by 2002:a17:902:9a8d:: with SMTP id
	w13mr454692plp.157.1569293423279; 
	Mon, 23 Sep 2019 19:50:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:30 -0700
Message-Id: <137503f0b17a2149faca5981afe456a1b87dd15a.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 50/50] multilib.bbclass: Reduce ALTERNATIVE_PRIORITY for extended recipes
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:22 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal
update-alternatives: libtool has multiple providers with the same priority,
please check
/path/to/rootfs/usr/lib/opkg/alternatives/libtool for details

Both libtool and lib32-libtool have the same priority (as they're the same
recipe), so update-alternatives won't deterministically pick a provider. This
means you could end up with an image using a 32-bit pkgconfig and 64-bit
libtool, for example.

Make extended recipes reduce priority by 1 (or 2, 3 ... when there are multiple
variants in MULTILIB_VARIANTS) to fix the problem.

[YOCTO #13418]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/multilib.bbclass | 47 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 2b761f3..9b27b53 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -123,8 +123,55 @@ python __anonymous () {
     clsextend.map_variable("USERADD_PACKAGES")
     clsextend.map_variable("SYSTEMD_PACKAGES")
     clsextend.map_variable("UPDATERCPN")
+
+    reset_alternative_priority(d)
 }
 
+def reset_alternative_priority(d):
+    if not bb.data.inherits_class('update-alternatives', d):
+        return
+
+    # There might be multiple multilibs at the same time, e.g., lib32 and
+    # lib64, each of them should have a different priority.
+    multilib_variants = d.getVar('MULTILIB_VARIANTS')
+    bbextendvariant = d.getVar('BBEXTENDVARIANT')
+    reset_gap = multilib_variants.split().index(bbextendvariant) + 1
+
+    # ALTERNATIVE_PRIORITY = priority
+    alt_priority_recipe = d.getVar('ALTERNATIVE_PRIORITY')
+    # Reset ALTERNATIVE_PRIORITY when found
+    if alt_priority_recipe:
+        reset_priority = int(alt_priority_recipe) - reset_gap
+        bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY to %s' % (d.getVar('PN'), reset_priority))
+        d.setVar('ALTERNATIVE_PRIORITY', reset_priority)
+
+    handled_pkgs = []
+    for pkg in (d.getVar('PACKAGES') or "").split():
+        # ALTERNATIVE_PRIORITY_pkg = priority
+        alt_priority_pkg = d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg)
+        # Reset ALTERNATIVE_PRIORITY_pkg when found
+        if alt_priority_pkg:
+            reset_priority = int(alt_priority_pkg) - reset_gap
+            if not pkg in handled_pkgs:
+                handled_pkgs.append(pkg)
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY_%s to %s' % (pkg, pkg, reset_priority))
+                d.setVar('ALTERNATIVE_PRIORITY_%s' % pkg, reset_priority)
+
+        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
+            # ALTERNATIVE_PRIORITY_pkg[tool]  = priority
+            alt_priority_pkg_name = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg, alt_name)
+            # ALTERNATIVE_PRIORITY[tool] = priority
+            alt_priority_name = d.getVarFlag('ALTERNATIVE_PRIORITY', alt_name)
+
+            if alt_priority_pkg_name:
+                reset_priority = int(alt_priority_pkg_name) - reset_gap
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY_%s[%s] to %s' % (pkg, pkg, alt_name, reset_priority))
+                d.setVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg, alt_name, reset_priority)
+            elif alt_priority_name:
+                reset_priority = int(alt_priority_name) - reset_gap
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY[%s] to %s' % (pkg, alt_name, reset_priority))
+                d.setVarFlag('ALTERNATIVE_PRIORITY', alt_name, reset_priority)
+
 PACKAGEFUNCS_append = " do_package_qa_multilib"
 
 python do_package_qa_multilib() {
-- 
2.7.4


