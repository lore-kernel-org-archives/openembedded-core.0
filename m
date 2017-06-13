Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id DDC196FEFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 13:39:18 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id q97so144089745wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Mt2tDM8KGGMnjKxYbCIAON/MjxJrVoZ8PrzAgYlX7vg=;
	b=ThJUyVIh5R3J8j7FDK6ZlkAkMCvN5EcHPsM/IbPHHFeY66/P6wdtvjZXi+5luou82b
	hSmtOi61kLbxlKZnBc7PzMmUnd2Fvdld1bXSFd0d+755wIk8C4IsFDEOGCdSD5vadiTz
	pP7sh/nIZiefcVZirQVSeO/Cd71D4iDAX1vCsbz2Gr0S7S9m3gj3ThB39bJ+75/awP/F
	KeBR2H3i5vuXs9Ycwep31UXVND5LwcnYbSaohrQMsFDsrlSgtg5coi3FeBoD4F2UmKoZ
	E8mFHGjhwPzYY9UL5Vo+yjHOoNLX8H5gs3d2DR43CJgNxDKE+gRC4hx9Ueo54THToiNM
	4IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mt2tDM8KGGMnjKxYbCIAON/MjxJrVoZ8PrzAgYlX7vg=;
	b=aPtbCUAw0PUcnBYTdisd04C5QEFCdZulSx+Bx74V3karaeqn30PahQkK4f8PvzD/Rp
	MhVMcErm4MBqH4lWoH0uugNhKzlAYI/58Zg0ENkp1WIAW6teeaW5ufQYIaN2Po2Hy6vD
	QDdNPng+0wpEHEMmMrb9NYrO75TMi8+f1D6uSOBbN+K+4fLWTwV8uPEKeMxzni5sCiB7
	R8keAAP87qRx0X5IkA8VuKmKhNnu/gJAIJJPHQ1zoCGWUOXcZclCdQmdU7rbOddBbbLR
	Rdb160stUVyZpPEEaewPDgBUjG7cEBFjZ6B2NKWFS+RW1ZNbIAICV2ExFvM+x7AxlmR5
	B7Mg==
X-Gm-Message-State: AKS2vOx1pzsFnL10T4md7i64gIcL4zdSwcU86cqv3eJRcYp8i2UjvVio
	B5ZFwqc97iIPCCCKk48=
X-Received: by 10.223.161.89 with SMTP id r25mr3202926wrr.153.1497361159383;
	Tue, 13 Jun 2017 06:39:19 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m191sm15408643wmg.30.2017.06.13.06.39.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Jun 2017 06:39:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:39:14 +0100
Message-Id: <1497361154-13077-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH][pyro] automake: Backport perl 5.22 fix
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
X-List-Received-Date: Tue, 13 Jun 2017 13:39:19 -0000

From: Marek Vasut <marex@denx.de>

Backport 13f00eb4493c "automake: port to Perl 5.22 and later"
from automake upstream to fix build with perl 5.22 .

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...0001-automake-port-to-Perl-5.22-and-later.patch | 32 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch

diff --git a/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch b/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
new file mode 100644
index 0000000..0e6895f
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
@@ -0,0 +1,32 @@
+From 13f00eb4493c217269b76614759e452d8302955e Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 31 Mar 2016 16:35:29 -0700
+Subject: [PATCH] automake: port to Perl 5.22 and later
+
+Without this change, Perl 5.22 complains "Unescaped left brace in
+regex is deprecated" and this is planned to become a hard error in
+Perl 5.26.  See:
+http://search.cpan.org/dist/perl-5.22.0/pod/perldelta.pod#A_literal_%22{%22_should_now_be_escaped_in_a_pattern
+* bin/automake.in (substitute_ac_subst_variables): Escape left brace.
+
+Upstream-Status: Backport [13f00eb4493c217269b76614759e452d8302955e]
+---
+ bin/automake.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/automake.in b/bin/automake.in
+index a3a0aa318..2c8f31e14 100644
+--- a/bin/automake.in
++++ b/bin/automake.in
+@@ -3878,7 +3878,7 @@ sub substitute_ac_subst_variables_worker
+ sub substitute_ac_subst_variables
+ {
+   my ($text) = @_;
+-  $text =~ s/\${([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
++  $text =~ s/\$[{]([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
+   return $text;
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index a6904c8..902dd63 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://python-libdir.patch \
             file://performance.patch \
             file://new_rt_path_for_test-driver.patch \
             file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
+            file://0001-automake-port-to-Perl-5.22-and-later.patch \
             "
 
 SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
-- 
2.8.1


