Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DD7C79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 19:00:49 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20559.1788980448159778338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 12:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YVOI8IWJ;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5912; q=dns/txt;
  s=iport01; t=1788980448; x=1790190048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H0cewbD4eOXlQXKYMHznJfG8ecklZfvU1GJtwX1QNSg=;
  b=YVOI8IWJHRl9B7/G4DFQgrgkfTGqmUFu5OgM6MHzxMPVbkACIAHd242N
   3QoYnwUOxJ9RQbzzejNx5tShpkFQxp5J4/1fge4sf4jS9DFeyi8hZ+kns
   Lj36y55O94EFwr+5eIrBw97LJuzt/uiDdzZtV0Hd4s+Y3HgaXv4eJ+NAJ
   HSJOUAaSIAAhCTPYcGI1m9N/qHDgpMO0fgRRtn29d0lOw57U0FXYyeqHy
   lylxVnC09rwNBXh4/If9S6zGtHHOdWTo1H8WbBIaLETl5yRjUndItAgl+
   DxXwaaDIaLccyZjRrF8yPrWxLeDpbAfzU8QiCg88qqq+PygVXneYmr+Eo
   Q==;
X-CSE-ConnectionGUID: h9veP66kRLSeXTTzltlQlA==
X-CSE-MsgGUID: 7nbJo3ISRGWIjrinzBwg2Q==
X-IPAS-Result: =?us-ascii?q?A0BFAgAgrKFq/5UQJK1aHgEBCxIMggULgld0YENJA5ZHi?=
 =?us-ascii?q?2eSN4F+DwEBAQ9EDQQBAYUFjgcCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgE1ATQSLAMBAk8LIyEbgmcBgjoDNwMRwTyCL?=
 =?us-ascii?q?IEBhH3YSw2CWQELFAEFgTOFP4J/hSNdGYR8JxsbgXKBFYNpgQUBgRlCAoglB?=
 =?us-ascii?q?IIigQyBWpJUSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ?=
 =?us-ascii?q?4M/Ixk2eoEJXoErKWABEheBB4IIAoJUggECAUlDDgdFUwknQQoSUykECxgNS?=
 =?us-ascii?q?BEsNxUZBD5uB48iH4JYFmUTAQckgRgtRiERpWWgHnEKKIN2jCKPPoV8GjOFW?=
 =?us-ascii?q?6USmQiLN4JThAmSR4RpgWg8gVlwFYMiCUoZD445g2vMOScyCwMvAQEHAgcOA?=
 =?us-ascii?q?wuBaJF+AQE?=
IronPort-Data: A9a23:5fzpEqgh6wf4RYWU/HpWVvDUX161NhEKZh0ujC45NGQN5FlHY01je
 htvX2CCP66CNGrwLoxxat/ioUlXu8KGmIRhSFM/rCw1FSJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMuvrS8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUYq/h6OT8Q9
 sY8Ez09UiyRg/6y+baSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWaGePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTaz/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFJ4fRFJ0FxhfwS
 mTuoGLzIBZBFeel5gWk8GitgP3lgiyhYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:y4HBkqCcYMKNXxrlHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:/oAAYGAxwmwyFH36Eyk26kMsRJ4mSFnmwUfsH128FWJQTJTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AjW7xxQ1nORMoIYt/V1dWQQcyPzUjvKKkKkdWsK4?=
 =?us-ascii?q?8lPalNzZxPSW3kzvte9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="853390809"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Sep 2026 19:00:47 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 125C81800014F;
	Wed,  9 Sep 2026 19:00:47 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id AE92BCC12A6; Wed,  9 Sep 2026 12:00:46 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] vim: Fix CVE-2026-52858 regression
Date: Wed,  9 Sep 2026 12:00:46 -0700
Message-Id: <20260909190046.5167-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 19:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245491

From: Devansh Patel <devanshp@cisco.com>

This patch fixes a regression introduced by the CVE-2026-52858 fix
already carried by OE-Core in commit [1]. The original security fix
added the g:pythoncomplete_allow_import opt-in, but the documented
behavior was broken because vim was not imported in the completion
class scope. This patch applies upstream Vim patch 9.2.0568 to restore
that behavior.

[1] https://github.com/openembedded/openembedded-core/commit/1c08fa48b6765ace24a261ecf43f871e850cee88
[2] https://github.com/vim/vim/commit/4b850457e12e1a678dd209f2868154f7553cbf8d
[3] https://github.com/vim/vim/commit/868ad62cb8bf8038322eab2badd31bd98b02b9df
[4] https://github.com/vim/vim/security/advisories/GHSA-52mc-rq6p-rc7c

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../vim/files/CVE-2026-52858-regression.patch | 94 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858-regression.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch b/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
new file mode 100644
index 0000000000..d3b11a6262
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
@@ -0,0 +1,94 @@
+From 8075209bb1e721ca89c2e7fd5d216d7fe2bd3ea6 Mon Sep 17 00:00:00 2001
+From: thinca <thinca@gmail.com>
+Date: Sun, 31 May 2026 12:33:07 +0000
+Subject: [PATCH] patch 9.2.0568: pythoncomplete: g:pythoncomplete_allow_import
+ had no effect
+
+Problem:  The security patch 9.2.0561 added a vim.eval() call inside
+          Completer.evalsource() to honor g:pythoncomplete_allow_import.
+          But the 'vim' module is only imported inside the outer
+          vimcomplete() / vimpy3complete() function, not at the script's
+          top level, so referring to it from a Completer method raises
+          NameError.  The surrounding bare 'except' silently swallows
+          the error and leaves allow_imports at 0, meaning the opt-in
+          never takes effect -- 'import os' (and any other
+          buffer-level import) is always skipped, no candidates are
+          produced for 'os.<...>' and
+          Test_popup_and_preview_autocommand() fails on the Windows
+          CI matrix (Linux skips the test because Python 2 is absent).
+Solution: Re-import 'vim' at the top of evalsource() in both
+          pythoncomplete.vim and python3complete.vim so the eval reads
+          the global, and set g:pythoncomplete_allow_import = 1 in the
+          test (it is the opt-in intended for callers that trust the
+          buffer contents) (thinca).
+
+closes: #20386
+
+CVE: CVE-2026-52858
+Upstream-Status: Backport [https://github.com/vim/vim/commit/868ad62cb8bf8038322eab2badd31bd98b02b9df]
+
+Backport Changes:
+- Omitted src/version.c because the Scarthgap recipe remains at Vim 9.1.1683;
+  the upstream version-table hunk targets Vim 9.2 and conflicted during
+  cherry-pick, while the runtime and test changes applied unchanged.
+
+Signed-off-by: thinca <thinca@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 868ad62cb8bf8038322eab2badd31bd98b02b9df)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/autoload/python3complete.vim | 3 +++
+ runtime/autoload/pythoncomplete.vim  | 3 +++
+ src/testdir/test_popup.vim           | 4 ++++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index a0314242b..bdabf62c8 100644
+--- a/runtime/autoload/python3complete.vim
++++ b/runtime/autoload/python3complete.vim
+@@ -158,6 +158,9 @@ class Completer(object):
+        self.parser = PyParser()
+ 
+     def evalsource(self,text,line=0):
++        # vim is imported locally in vimpy3complete(); re-import here so the
++        # vim.eval() below works (otherwise NameError, silently caught).
++        import vim
+         sc = self.parser.parse(text,line)
+         try: allow_imports = int(
+           vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
+diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pythoncomplete.vim
+index 39b1efd29..761488244 100644
+--- a/runtime/autoload/pythoncomplete.vim
++++ b/runtime/autoload/pythoncomplete.vim
+@@ -172,6 +172,9 @@ class Completer(object):
+        self.parser = PyParser()
+ 
+     def evalsource(self,text,line=0):
++        # vim is imported locally in vimcomplete(); re-import here so the
++        # vim.eval() below works (otherwise NameError, silently caught).
++        import vim
+         sc = self.parser.parse(text,line)
+         try: allow_imports = int(
+           vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
+diff --git a/src/testdir/test_popup.vim b/src/testdir/test_popup.vim
+index fac2a7592..55c2f232d 100644
+--- a/src/testdir/test_popup.vim
++++ b/src/testdir/test_popup.vim
+@@ -723,6 +723,9 @@ func Test_popup_and_preview_autocommand()
+     au!
+     au BufAdd * nested tab sball
+   augroup END
++  " Let pythoncomplete follow the buffer's 'import os' (off by default
++  " since v9.2.0561) so 'os.' can be completed.
++  let g:pythoncomplete_allow_import = 1
+   set omnifunc=pythoncomplete#Complete
+   call setline(1, 'import os')
+   " make the line long
+@@ -745,6 +748,7 @@ func Test_popup_and_preview_autocommand()
+   augroup END
+   augroup! MyBufAdd
+   bw!
++  unlet g:pythoncomplete_allow_import
+ endfunc
+ 
+ func s:run_popup_and_previewwindow_dump(lines, dumpfile)
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a4f8162d31..ced48eb0c1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-46483.patch \
            file://CVE-2026-28420.patch \
            file://CVE-2026-52858.patch \
+           file://CVE-2026-52858-regression.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-28422.patch \
-- 
2.35.6


