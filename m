Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3642.1795171988309358483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=B0NgiCtQ;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10908; q=dns/txt;
  s=iport01; t=1795171988; x=1796381588;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eomzNlggOOr7/64GDUgyS8rTU2vMX5ih4+SAu9sLOEM=;
  b=B0NgiCtQv0ruUd+w6ZbQp+djaJg2h/c5OUya/bd0cxDiiV1YppPvCfnG
   /NBAsv5nVD26p8EnQXAZ7drK3btTcOSSnSNKGL2Lo5VCiBf2Mcxr1qE9U
   UdiDJALln5qn4iyJ6haZXzcMT3qmDMMACi+cG+Hy1Ou54yZluL2XIzQ7e
   JdFqhob9fLU7tpYrGrwitpENaBdwp3s3exN18V83Lcy1EFC1aA+DmNGSm
   jaRQlYrD/+yIPEYt8fLEvRgcNABCCHzYdUTZq2L++iQMEnrNbvHO81wBh
   z8Fv0oykKn+B3qDhLfu9gCa5PnCGCB6XKAMYv8FOohTOgN0IBWyDOqmox
   w==;
X-CSE-ConnectionGUID: XBHVhx86TiG+PrGu/EZqfw==
X-CSE-MsgGUID: lDOspcN0StypQYBfUdcHKw==
X-IPAS-Result: =?us-ascii?q?A0BIAgDrJQBr/89K/pBaglmCV3VhQkmEV49TgiGLaZJDg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBkygCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBKQQLARgBWQMBAgMCJgIiCyMYCRqCaAGCOgM3AgERuHZ6f?=
 =?us-ascii?q?zOBAYMpATEDEg9/2EwNgloBCxQBgQouhUKDACABhQNdGAGEfScbG4FygRWDa?=
 =?us-ascii?q?oIfQgGBKIQVgmoEgiKBDIFUHgVfjBUCgU+IJkiBAhwDWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJ?=
 =?us-ascii?q?j4bCoEMJx8eGw4CHxAGDRgNSBEsNxUZBD0BbgeTUxmDGAGBDgErIlkWSVIFS?=
 =?us-ascii?q?ZMsAZF6oCBxCiiDeYwkjz6FfBozhASmbpkIglmPO5JHhGqBaDyBWXAVO4IzA?=
 =?us-ascii?q?QEBMQlKGQ+XN8lIIzUCOwIHAgcBDAEDC5FogX4BAQ?=
IronPort-Data: A9a23:NTo4+qyMWHiB6NarLNJ6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUEy
 WFJXzzVa6qMZjfzc9x3aty3oR4B6sDdyIdiSVBrpVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDpNsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHEcHbMY6rYpPWBht
 sQCBy1KQyKaif3jldpXSsE07igiBMDmJsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkyfC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+Oa3aYuFKo3bLSlTtkK0g
 Xne9EKhOQ0LLOWu4zS4/nmMpfCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:QeWIQKw5IEYbrL8tZPT3KrPwGr1zdoMgy1knxilNoHtuA6mlfq
 GV7ZYmPHDP5gr5NEtMpTniAtjifZqjz/9ICOAqVN/INjUO01HGEGgN1+ffKkXbexHWx6p6yb
 pqdbR4BZnbCFh3itu/3SyDeuxQpOVuNMuT9IHjJ7AHd3AMV51d
X-Talos-CUID: 9a23:fNjramEs/ohURLOYqmJX3m4qGtB1LEHc4zToOWClTktbUbOKHAo=
X-Talos-MUID: 9a23:/9pH1ATIZegOnrB7RXToqBZ5LMxOu5+yGVg0oL8IhsWPFQ9vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="62198899"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:53:04 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id C24371800071C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:53:03 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 72299CC1600; Fri, 20 Nov 2026 02:53:02 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] ruby: Upgrade 3.3.10 -> 3.3.14
Date: Fri, 20 Nov 2026 02:52:46 -0800
Message-Id: <20261120105246.3492084-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250762
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Per Ruby's maintenance policy [1], upgrade to the latest release in the
3.3 series, 3.3.14. It includes fixes for multiple security issues [2],
including the regexp compilation issues associated with CVE-2026-97229
[3].

Ruby 3.3.14 begins the upstream legacy maintenance phase, which includes
selected bug fixes in addition to security fixes [2]. The update remains
within the 3.3 stable series.

[1] https://www.ruby-lang.org/en/downloads/branches/
[2] https://www.ruby-lang.org/en/news/2026/11/18/ruby-3-3-14-released/
[3] https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-cves/

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 ...-fix-cross-compilation-of-external-gems.patch | 11 ++++-------
 ...Define-REG_S1-and-REG_S2-for-musl-riscv.patch |  7 ++-----
 ...3-rdoc-build-reproducible-documentation.patch | 16 +++++++++-------
 ...ort-list-of-object-files-in-generated-M.patch |  7 +++++--
 ...c-reproducible-change-fixing-784225-too.patch |  7 ++-----
 .../ruby/0006-Make-gemspecs-reproducible.patch   |  5 +----
 ...est_rm_r_no_permissions-test-under-root.patch |  5 +----
 .../ruby/{ruby_3.3.10.bb => ruby_3.3.14.bb}      |  2 +-
 8 files changed, 25 insertions(+), 35 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.10.bb => ruby_3.3.14.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 2e3156880e..366e508484 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,7 +1,7 @@
-From a6e12b25a54d112c899b70c89c0bec9c5e5ebf3c Mon Sep 17 00:00:00 2001
+From cdd2867757f14690309567fa5bb5ae223ee004a5 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
-Subject: [PATCH 1/3] extmk: fix cross-compilation of external gems
+Subject: [PATCH] extmk: fix cross-compilation of external gems
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,10 +16,10 @@ Signed-off-by: André Draszik <andre.draszik@jci.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ext/extmk.rb b/ext/extmk.rb
-index 1389dc4117..e4d923d7a7 100755
+index 1f8e59f..631459d 100755
 --- a/ext/extmk.rb
 +++ b/ext/extmk.rb
-@@ -413,8 +413,8 @@ def $mflags.defined?(var)
+@@ -428,8 +428,8 @@ else
  end
  $ruby = [$ruby]
  $ruby << "-I'$(topdir)'"
@@ -29,6 +29,3 @@ index 1389dc4117..e4d923d7a7 100755
    $ruby << "-I'$(extout)/$(arch)'" << "-I'$(extout)/common'" if $extout
    ENV["RUBYLIB"] = "-"
  end
--- 
-2.23.0.rc1
-
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index f7b7adb3fd..e512b57c20 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From dfb22e4d6662bf72879eda806eaa78c7b52b519e Mon Sep 17 00:00:00 2001
+From fa1eac6cf67c9d594884940d2f46d3042f489883 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index a98f5aa..957b785 100644
+index 2771264..7995e12 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -39,6 +39,11 @@
@@ -29,6 +29,3 @@ index a98f5aa..957b785 100644
  #define VM_CFP_CNT(ec, cfp) \
    ((rb_control_frame_t *)((ec)->vm_stack + (ec)->vm_stack_size) - \
     (rb_control_frame_t *)(cfp))
--- 
-2.35.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index f92f0e1ba6..731aace31e 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,6 +1,7 @@
+From 9a945f194e50cbd93ea7b08bd85560a748a4a293 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
-Subject: rdoc: build reproducible documentation
+Subject: [PATCH] rdoc: build reproducible documentation
 
 - provide a fixed timestamp to the gzip compression
 
@@ -10,23 +11,24 @@ Signed-off-by: Antonio Terceiro <terceiro@debian.org>
 Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
 ---
  lib/rdoc/generator/json_index.rb | 4 ++--
- lib/rdoc/rdoc.rb                 | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/json_index.rb
+index c454910..24feab0 100644
 --- a/lib/rdoc/generator/json_index.rb
 +++ b/lib/rdoc/generator/json_index.rb
-@@ -178,7 +178,7 @@
+@@ -178,7 +178,7 @@ class RDoc::Generator::JsonIndex
      debug_msg "Writing gzipped search index to %s" % outfile
-
+ 
      Zlib::GzipWriter.open(outfile) do |gz|
 -      gz.mtime = File.mtime(search_index_file)
 +      gz.mtime = -1
        gz.orig_name = search_index_file.basename.to_s
        gz.write search_index
        gz.close
-@@ -196,7 +196,7 @@
+@@ -196,7 +196,7 @@ class RDoc::Generator::JsonIndex
          debug_msg "Writing gzipped file to %s" % outfile
-
+ 
          Zlib::GzipWriter.open(outfile) do |gz|
 -          gz.mtime = File.mtime(dest)
 +          gz.mtime = -1
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index e0aca0dcfc..031f89bf17 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,6 +1,7 @@
+From 732263f3623216fbb79560baaf5bc3014e9f7f18 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
-Subject: lib/mkmf.rb: sort list of object files in generated Makefile
+Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
 
 Without sorting the list explicitly, its order is indeterministic,
 because readdir() is also not deterministic.
@@ -15,9 +16,11 @@ Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
  lib/mkmf.rb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/lib/mkmf.rb b/lib/mkmf.rb
+index 51585b1..e6ba142 100644
 --- a/lib/mkmf.rb
 +++ b/lib/mkmf.rb
-@@ -2315,7 +2315,7 @@
+@@ -2368,7 +2368,7 @@ LOCAL_LIBS = #{$LOCAL_LIBS}
  LIBS = #{$LIBRUBYARG} #{$libs} #{$LIBS}
  ORIG_SRCS = #{orig_srcs.collect(&File.method(:basename)).join(' ')}
  SRCS = $(ORIG_SRCS) #{(srcs - orig_srcs).collect(&File.method(:basename)).join(' ')}
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 0902a201ec..5e8f9f583c 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 6e1dc610724a7aa8368cbcddf4bbe21cccc0f731 Mon Sep 17 00:00:00 2001
+From 96b6b0a02214b129c349fdb00b755b24131bc181 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,7 +12,7 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index d6eac7f..4b2e95e 100644
+index e438669..3ce9af8 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
 @@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
@@ -26,6 +26,3 @@ index d6eac7f..4b2e95e 100644
                Time.utc(date.year, date.month, date.day)
              else
                TODAY
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index d32e209129..949f7c144d 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 3f60710bc29c1b08e128314d40101e87b7d2c9a1 Mon Sep 17 00:00:00 2001
+From 11d6a3b19cd729900f93a8f04a01ab3d569d5572 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -75,6 +75,3 @@ index 93a281c..cc5c155 100644
    s.version = RDoc::VERSION
  
    s.authors = [
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index dc06891bbc..92af032d18 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From cc5e563f0fa5212e4a624b954fbc97cc6d8900d4 Mon Sep 17 00:00:00 2001
+From 42ef19cec8a34847538bfc62d37e842837025337 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 25 Aug 2025 16:31:18 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
@@ -25,6 +25,3 @@ index 481f913..a2ed414 100644
  
      mkdir 'tmpdatadir'
      touch 'tmpdatadir/tmpdata'
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.10.bb b/meta/recipes-devtools/ruby/ruby_3.3.14.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.10.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.14.bb
index 936bc73e32..791b8072ff 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.10.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.14.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "b555baa467a306cfc8e6c6ed24d0d27b27e9a1bed1d91d95509859eac6b0e928"
+SRC_URI[sha256sum] = "d0438ee291b0cacaf97c7a71df4c939d7f3265c8c2d1b8ffe27311f71fc680b0"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.35.6

