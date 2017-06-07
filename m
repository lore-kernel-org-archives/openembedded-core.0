Return-Path: <dev@codyps.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 28444780D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 15:40:01 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id w1so1893531qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=0OGPJHvyFZZyY6hCuwlM6Bi89k3+kZAZS58l7Tp4ssk=;
	b=YYsfIHUvZTN4p4JL9BZrQNB0OzycHnp3q0cxsfAyBULafuUxqjiMhCjPch6nx6hPFU
	zyQmo1qSYVLQNgwpTehmTjprElJ2ZwVEXtfNf/7Jf8G4eO+hu4VYM71HSk82pMV1Xrf6
	jW1ttEd3N3y3tY+BTILjXp77KNF7nzbvljv58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0OGPJHvyFZZyY6hCuwlM6Bi89k3+kZAZS58l7Tp4ssk=;
	b=sj2jtlAmxtJ2C3tFJcmsryUIwD8zkD0wiMxTXNZm7IXrnQBBF7/Sh+13wL9RE4r3Ao
	EphI3AfYqP1cpCtuOkK6f5Gw8URocAIig2LsqlAjBv169x/3h3yrsVnzpU8SqvIGer0K
	jI3vo18zPO4Y4C802X64RLG+j1QXibV4NsQt+TBZIFx5tsVqCSS/tLArSWzveSEjCUCc
	wyz7zNdKj/WqLK/6wsDXyXJfSj7IrUJboBrzgCWfzJBQEJ8cjJa1pytBd+Mw8qBBfh4u
	xN4HJwDjenmjYqpY3GuLoTSQO/g7bMcG0E0bAIhBYZR9jqkgGnWRacs+B/PsKDpXcQdX
	joYQ==
X-Gm-Message-State: AODbwcC5WLbpPdth/5br7z6X2cftTZ2AdryxDLFy5HUP5sOc7usXiY7c
	eixmKv/arbWLtrgapAA=
X-Received: by 10.237.46.166 with SMTP id k35mr5011840qtd.115.1496850002663;
	Wed, 07 Jun 2017 08:40:02 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52])
	by smtp.gmail.com with ESMTPSA id l70sm1265479qki.6.2017.06.07.08.40.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Jun 2017 08:40:02 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 11:39:59 -0400
Message-Id: <20170607153959.3899-1-dev@codyps.com>
X-Mailer: git-send-email 2.13.0
Cc: Marek Vasut <marex@denx.de>
Subject: [morty][PATCH] automake: Backport perl 5.22 fix
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
X-List-Received-Date: Wed, 07 Jun 2017 15:40:02 -0000

From: Marek Vasut <marex@denx.de>

Backport 13f00eb4493c "automake: port to Perl 5.22 and later"
from automake upstream to fix build with perl 5.22 .

(From OE-Core rev: 7fa044e799db651d45e4732e2527acfc2bc7cd47)

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 ...0001-automake-port-to-Perl-5.22-and-later.patch | 32 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch

diff --git a/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch b/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
new file mode 100644
index 0000000000..0e6895fb4b
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
index a3c72fd334..61ae3ba3e3 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -21,7 +21,9 @@ RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
 SRC_URI += " file://python-libdir.patch \
             file://buildtest.patch \
             file://performance.patch \
-            file://new_rt_path_for_test-driver.patch"
+            file://new_rt_path_for_test-driver.patch \
+            file://0001-automake-port-to-Perl-5.22-and-later.patch \
+            "
 
 SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
 SRC_URI[sha256sum] = "7946e945a96e28152ba5a6beb0625ca715c6e32ac55f2e353ef54def0c8ed924"
-- 
2.13.0


