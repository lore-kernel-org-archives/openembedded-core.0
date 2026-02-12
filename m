Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DB0EDF037
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 05:01:52 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38744.1770872505576773904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Zc2oXaUW;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3910; q=dns/txt;
  s=iport01; t=1770872505; x=1772082105;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cLYuLLMrfS1GonCSg682H3MP7lGc5PlYatwRsSudkHQ=;
  b=Zc2oXaUWMieqXhvglUgl0JOaqoda/NEBX4AZI/lqEu+BcvmkRcwr/Zth
   dC/lrErJeT+Yl06eLwT/Vd2VCOXfC6ZnjzPqNdOboqrWhFf7SxT/gFVRj
   37wByHbzu5TPyJJSvBTYq43tMj4PQi5uTaQRAnzfBNNcJwuBxeoHKWjDz
   7bptucJOJ2G+70alorq6KEJqRRGb4Si7feoq7Z+7viC694enTaQW5q35c
   C99OKS4krpLOYbd8urcX/uDaDF1YuRwwa+T0GK9LIb5VzLLlTqyI/Hnx/
   0fBb+fpt7y3YvN7EvAyYcFVblieTzlq13HbKaISGt+URjoe1mxReSI1zA
   g==;
X-CSE-ConnectionGUID: cnDBecMJSu6gzdcnZHZKeg==
X-CSE-MsgGUID: g2NAPs/UTGeB4V7jIeFthg==
X-IPAS-Result: =?us-ascii?q?A0DcBgAcXY1p/4v/Ja1aHQEBPAEFBQECAQkBgWUCgkYPc?=
 =?us-ascii?q?V9CSZQqgiGeHYF/DwEBAQ8UAicUBAEBkiYCJjQJDgECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBOAFyAwECWiMhgwIBgnMCARGoT?=
 =?us-ascii?q?4IsgQGCZnwBBQJDT9smAQUGFAGBOAGFOogYWxgBhHgnGxuBcoR9gQWBXAEBi?=
 =?us-ascii?q?CQEgiKBDoFkNpFUSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFi?=
 =?us-ascii?q?BUPiQ94cIEgcgMLGA1IESw3FBsEPm4HjktBgTd7AXQaASsXCXsoUAEYJCeSW?=
 =?us-ascii?q?pAugiGhDgoog3SMHpU6GjOqawuYe44JllCEaIFoPDmBDgsHcBWDIlIZD444g?=
 =?us-ascii?q?2mBf4JZvQoiNTwCBwsBAQMJkWwtgU4BAQ?=
IronPort-Data: A9a23:4xFFvKok4SDQz99HoWfZhyx1dkleBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmCMvmIMDTzf492YYS+9hgGvZOAydM1TAFlrigxRHkV9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgbNNwJcaDpOtfrZ8Uk35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0u1xLUtD/
 tk6Ey1TYQKPjOSE4ICYR+Y506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TUGp0NwBvI/
 zmuE2LRDUs8HeSEjge53X+G2tGQnwL2dp4SG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:pq4ncKhI+MhJs9mAidmg4sAlf3BQXs8ji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoI0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3d8+mUzJ846U
 +mGJIObeHNMQ==
X-Talos-CUID: 9a23:KiUrJW9sRiuM8b4izDiVv0USNuooeVj/92qOLF20AmBbaI+2RFDFrQ==
X-Talos-MUID: 9a23:eDKzbQoEnX9JduxcNvAezz44Eu5Q+OOTNG8Au8k45MulOAJsOzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="670065813"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 05:01:44 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 5D5E41800037E
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 05:01:44 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 092A9CC12B5; Wed, 11 Feb 2026 21:01:44 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core] [scarthgap] [PATCH 4/5] go 1.22.12: Fix CVE-2025-61731
Date: Wed, 11 Feb 2026 21:01:25 -0800
Message-ID: <20260212050140.4087428-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 05:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231008

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61731
Type: Security Fix
CVE: CVE-2025-61731
Score: 7.8
Patch: https://github.com/golang/go/commit/00b7309387a1

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 04e380c821..82019f25dd 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -34,6 +34,7 @@ SRC_URI += "\
     file://CVE-2025-61730.patch \
     file://CVE-2025-61726.patch \
     file://CVE-2025-61728.patch \
+    file://CVE-2025-61731.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61731.patch b/meta/recipes-devtools/go/go/CVE-2025-61731.patch
new file mode 100644
index 0000000000..a4589daade
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61731.patch
@@ -0,0 +1,70 @@
+From ab266ccbc19789c52dcb1dc6e8e71d2f4fd545ff Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Thu, 4 Dec 2025 12:30:39 -0500
+Subject: [PATCH] [release-branch.go1.24] cmd/go/internal/work: sanitize flags
+ before invoking 'pkg-config'
+
+The addition of CgoPkgConfig allowed execution with flags not
+matching the safelist. In order to prevent potential arbitrary
+code execution at build time, ensure that flags are validated
+prior to invoking the 'pkg-config' binary.
+
+Thank you to RyotaK (https://ryotak.net) of GMO Flatt Security Inc.
+for reporting this issue.
+
+Fixes CVE-2025-61731
+Fixes #77100
+
+CVE: CVE-2025-61731
+Upstream-Status: Backport [https://github.com/golang/go/commit/00b7309387a1]
+
+Change-Id: Ic51b41f1f7e697ab98c9c32c6fae35f217f7f364
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3240
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3344
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/736701
+Auto-Submit: Michael Pratt <mpratt@google.com>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+(cherry picked from commit 00b7309387a171bcba37382e7ed96b473df04917)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/cmd/go/internal/work/exec.go     | 8 ++++++++
+ src/cmd/go/internal/work/security.go | 1 +
+ 2 files changed, 9 insertions(+)
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index c8f297cbe9..815942a703 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -1684,6 +1684,14 @@ func (b *Builder) getPkgConfigFlags(a *Action) (cflags, ldflags []string, err er
+				return nil, nil, fmt.Errorf("invalid pkg-config package name: %s", pkg)
+			}
+		}
++
++		// Running 'pkg-config' can cause execution of
++		// arbitrary code using flags that are not in
++		// the safelist.
++		if err := checkCompilerFlags("CFLAGS", "pkg-config --cflags", pcflags); err != nil {
++			return nil, nil, err
++		}
++
+		var out []byte
+		out, err = sh.runOut(p.Dir, nil, b.PkgconfigCmd(), "--cflags", pcflags, "--", pkgs)
+		if err != nil {
+diff --git a/src/cmd/go/internal/work/security.go b/src/cmd/go/internal/work/security.go
+index 568eecd325..79724ed04a 100644
+--- a/src/cmd/go/internal/work/security.go
++++ b/src/cmd/go/internal/work/security.go
+@@ -122,6 +122,7 @@ var validCompilerFlags = []*lazyregexp.Regexp{
+	re(`-pedantic(-errors)?`),
+	re(`-pipe`),
+	re(`-pthread`),
++	re(`--static`),
+	re(`-?-std=([^@\-].*)`),
+	re(`-?-stdlib=([^@\-].*)`),
+	re(`--sysroot=([^@\-].*)`),
+--
+2.35.6
-- 
2.35.6


