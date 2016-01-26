Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEB073216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 12:48:27 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id u188so104779734wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 04:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=F6ETBhbviTt88z/qAl/JT5ZuPGVkYaak1w4Hdc3Oaa8=;
	b=YF+5EDUuGvy2v4SONhbkrg1xGmLEiQdI1xkBqUEec+4EOALMFBZNynRhYlUCCNV1sk
	fzMutqVuupDsuKzQzBbC5NS8feuobBm/Bp5K5q/Svr1ClOm9wmrTlpxHVvk99e6D6EPc
	IRsg5lowI6k0klzzmgY7b9K72KFI28sV193VUj2nvuP+R3Ih6LGXYEKGwIzTshRFWZTp
	7dbTn1EPUkT/y65F7bT0vJXFw/iHGjURsEcoIiET9QJ2DDxOj+VYio3MV6diaVWqQ+64
	4Mo1rmlPyqxUJSrIEensLBAzFdmM/iaqLQcVqbGbCJSt+hJwiwlACJE5FMXXP3VGWq3H
	nhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=F6ETBhbviTt88z/qAl/JT5ZuPGVkYaak1w4Hdc3Oaa8=;
	b=W/AXp9PftgGML/jO5wahY6Ex1dqnzmYQWUbxoaIQ5a6TlHKEfkdMMEeEcC3bKrJPuV
	f9cLw5TemHXZTn8iFO6dmIZZTfb/NpaE0m/4JfPX5VJJykr0uJ9iIWNBYnLnzK6mrotS
	Q23Rzo8EEMpdlEnkLczkVMQM7zpaYZiev/phaxaXx/9n/yX3rEcNxihPXXPvLg5UZtGr
	6Aoxc495YupM1W7otBdTSq4TRoGOLYNr+K+vADh9kCMIpKsKLTLkWv+KY9SspryI8xae
	b5N4xNiEkF5n59vemtxzXBxKjIZma8cF2aKE8mgQ4FZuOnDAQfg6XbI/IdlngEBUYZFT
	vU/Q==
X-Gm-Message-State: AG10YOQRGgdjAIUNSJrJIgj1bAZwY0sGrNxJ7Qhdfk5uFIlV/cNmoPY5jyneSUN6pVOFK1e9
X-Received: by 10.194.22.101 with SMTP id c5mr26528295wjf.151.1453812508033;
	Tue, 26 Jan 2016 04:48:28 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i63sm2741068wmf.24.2016.01.26.04.48.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 04:48:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 12:48:25 +0000
Message-Id: <1453812505-14138-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] meta: fix capitalisation in Upstream-Status
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
X-List-Received-Date: Tue, 26 Jan 2016 12:48:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch     | 2 +-
 .../glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch | 2 +-
 meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch   | 2 +-
 meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch               | 2 +-
 meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch b/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
index 12d3c9b..32bdaf0 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
@@ -1,6 +1,6 @@
 define macro _PATH_DHCPD_CONF and _PATH_DHCLIENT_CONF
 
-Upstream-Status: inappropriate <oe specific>
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index d71e576..df3c1ef 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -10,7 +10,7 @@ ${S}/.pc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch/ports/sysdeps/
 aarch64/libm-test-ulps), run libm-err-tab.pl with specific dirs
 in ${S}.
 
-Upstream-Status: inappropriate [OE specific]
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
index be27341..5b5de07 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
@@ -1,4 +1,4 @@
-Upstream-Status: inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Fixes tcl target recipe build on old distros which have glibc older than 2.14
 
diff --git a/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch b/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
index 20fc5e5..3eaf6a7 100644
--- a/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
+++ b/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
@@ -8,7 +8,7 @@ The commit replaces an earlier fix that detected and adjusted a
 patch is that the oprofile tools are adjusted to the current run-time
 path to ~root, not the build time path.
 
-Upstream-Status: inappropriate [OE specific]
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 
diff --git a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch b/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
index 9569645..16499f5 100644
--- a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
+++ b/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
@@ -8,7 +8,7 @@ Remove the 'tools' dir creation, it always existed.
 And it caused gen_test_char unexpected rebuilt at
 do_install time.
 
-Upstream-Status: inappropriate [oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
-- 
2.6.4


