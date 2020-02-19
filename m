Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id AF58061576
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:44:48 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id x2so10216926ila.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4sC1kAhxqcmMqpzW3F69fmT64InjMdWZLdXTwVuRw1o=;
	b=HaVjINE31+e8v8F4QrmEqIhna7DApD2pVtcIAs9REet3JIFlVNfrtOGpuTgYlLMolH
	bQ9aKi9ZeeB+oD8cRrXTn92b0wfeSoDKFJpke1Of8EmSgJ3xF845Uis1RIuyzqP14IIk
	9oyUknPVLehCOGv1vf6P9kGZpLyROZIYjGgYgNx8iLnPmXLUrzRJoxFG+QELDHufX/iU
	8PxHlxk4SPCfiI0Qrz1b7Y5z/OlNN89rSPUuL5Eagv6EDHXuA5urMTeycdOESNnEmKzt
	0LcJ7u7Uk11Ic6PlEbUrn9Pla/PJzy7Ox1WWftjkb/HjJy739JY0fG1FCsz+leAxskB3
	kJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4sC1kAhxqcmMqpzW3F69fmT64InjMdWZLdXTwVuRw1o=;
	b=o/wVDS2na/1Xw/d6IAkleS80m6Go+qeuMNp1gU5PeEb59CBAm4Q3fib9HkuWHtAQuB
	W1J6xufju4DgVEQe3VhTV3i0vs27zdl8JFVsZLq0zhO0KOHIr3S1spc/TjEtia90FGyN
	bPCu5BxnAcdY1EGnQfSE/aE3fNPmwMDdtpV61KEcPTE5hdYNa/dEg/2UkZxQbI+vw9CD
	1r413gjNAUNQCHxZNnf2Wks94dUw7LuulUCFTEmIxmStnEgm+QP4t1fohpe2mBvciQCs
	v0SGAnG7Jt9KG8zzfljNnkd6JQ+/3tm4sbrnTS0Zh2cdIN0kpkBOCuljBihsC0Uux4k3
	e64w==
X-Gm-Message-State: APjAAAWSV6iSSjXL2iWg2gAlwYoKnVMsW7TKUXGzGq0j2oM1Qt1wqs5o
	YtgLODuYRaHtZ7O2+K7R0XTJhs/E
X-Google-Smtp-Source: APXvYqzelSe+YnBN7KSh0YkCfnvY5OBaamb0U4Due0g9WY10CRgarkPXgn2j2BHDXlkHnrSqTfc4sg==
X-Received: by 2002:a92:1d5a:: with SMTP id d87mr21006594ild.27.1582073089498; 
	Tue, 18 Feb 2020 16:44:49 -0800 (PST)
Received: from farscape.garmin.com ([2605:a601:ac18:c700:d658:3b67:74f4:8891])
	by smtp.gmail.com with ESMTPSA id
	e13sm125163iol.16.2020.02.18.16.44.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 16:44:48 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 18:44:44 -0600
Message-Id: <20200219004444.21297-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219004444.21297-1-JPEWhacker@gmail.com>
References: <20200219004444.21297-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa: reproducible: Include jquery in results
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
X-List-Received-Date: Wed, 19 Feb 2020 00:44:48 -0000
Content-Transfer-Encoding: 8bit

Includes jquery in the output directory to make the diffoscope output
easier to navigate

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index d3fd8c392b8..5d3959be77b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -174,9 +174,10 @@ class ReproducibleTests(OESelftestTestCase):
 
         # Build native utilities
         self.write_config('')
-        bitbake("diffoscope-native diffutils-native -c addto_recipe_sysroot")
+        bitbake("diffoscope-native diffutils-native jquery-native -c addto_recipe_sysroot")
         diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
         diffoscope_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffoscope-native")
+        jquery_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "jquery-native")
 
         if self.save_results:
             os.makedirs(self.save_results, exist_ok=True)
@@ -225,8 +226,14 @@ class ReproducibleTests(OESelftestTestCase):
                 os.rmdir(save_dir)
             else:
                 self.logger.info('Running diffoscope')
-                runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', '--html-dir', 'diff-html', 'reproducibleA', 'reproducibleB'],
-                        native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=os.path.join(save_dir, 'packages'))
+                package_dir = os.path.join(save_dir, 'packages')
+                package_html_dir = os.path.join(package_dir, 'diff-html')
+
+                # Copy jquery to improve the diffoscope output usability
+                self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
+
+                runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', '--html-dir', package_html_dir, 'reproducibleA', 'reproducibleB'],
+                        native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:
             self.fail('\n'.join(fails))
-- 
2.24.1


