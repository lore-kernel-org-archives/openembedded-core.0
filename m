Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49A4C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 06:15:02 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23738.1788156894346874585
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 23:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YdjRcNHf;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5399; q=dns/txt;
  s=iport01; t=1788156899; x=1789366499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iy4imFrde3jc7hkr2qbyOE7HP5LIe5fmc4K+pjhf+Rk=;
  b=YdjRcNHfCZyu8BCLOdx0zQHAcI5/r7iBtNONrcsTvtDG2DsQ8s/rIOeK
   qjehJ/IAzu1KwQrkzqbrWWS+S3x2SWvwozBsnM13lgX50HhLrdUSOGaZD
   UwYPyvmssWvL4MLwDAqlbv4M+93JDZPnSY+5Drc4JCtC8MEbPC4GZblkL
   YZwHz4zaeLKmsW5GNyCOC7pZHqDZ4sv9zk+U9rZg70kVYBVln6Rwn358T
   oixqzSZSsHPDFIwguXOFMokP2rqOe+R14PF6eGYVWdzjxTeX6AI7sPmlS
   RaCEtNMYc5r2rze4To+tmFN4E1i4TJNWr3aRkwxsSzHrdrL+M6WPoisK4
   Q==;
X-CSE-ConnectionGUID: CY1gRkP3TbWh1k6+uyfOWQ==
X-CSE-MsgGUID: msqogOqZSPWQpSKRClVqMQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgDSGpVq/4sQJK1aHgEBCxIMggULgld0X0JJA4RUk?=
 =?us-ascii?q?XMDnhuBGwMGA1cPAQEBD0QNBAEBhQUCjXMCJjQJDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMjDwFGEBwDAQIDAiYCAisjCBAJg?=
 =?us-ascii?q?wIBgnQCARHCHnqBMoEBg2IBgRrbMAEFBhQBBYEFLoU/gx8BhQJdGAGEfCcbG?=
 =?us-ascii?q?4FygRWDaYEFgVwChTuCagSCDRWBDIFagmuDRotuSIECHANZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPhc1WBsGBYEdgSiEDyMZNnqBCV6BKylgARIXgQmCCAKCW?=
 =?us-ascii?q?oIFAgFJQw4HR1MJBAsYDUgRLDcVGQQ9AW4HjnofgUcsVwGBDgEpAQEggXMBJ?=
 =?us-ascii?q?6VnoQ8KKIN2jCKVOhozqmwLmH2OCpZQhGmBaDw5gSBwFYMiUxkPjioOC4Ngz?=
 =?us-ascii?q?DkkNQIEBTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:wtDdFKD+dVal6xVW/37iw5YqxClBgxIJ4kV8jS/XYbTApG53gzBRm
 zcdXmqGaKvZZmP8eNEjaN/n/R5Xv5aBx983OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/+g2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE6MQ3A3s1BdYk8Nl3WGIQt
 uEJJhcyV0XW7w626OrTpuhEj8AnKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxAMmsHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCDllAsi+SybIW9ltqiQN5MmUm/v
 1D9x1vAGio5Dveb9yOgyyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNuhoaHt4VGOog5UTVkOzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:dLmtuK6WXNmxZTp0VwPXwBbXdLJyesId70hD6qm+c3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfCFHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce36m+okcfng9OXL/f6
 DsnfZ6mw==
X-Talos-CUID: 9a23:RQRhtGOFDZprQ+5Dcxg++3QXIpsZeELdlXSOYFKpB0FWcejA
X-Talos-MUID: 9a23:Kp77HQbWDV7tGOBTsiT1gz5FLfVT25uXEHsuq74ChdChDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="824534747"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 06:14:58 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 85AEB180000B0;
	Mon, 31 Aug 2026 06:14:58 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 23371CE1C04; Sun, 30 Aug 2026 23:14:58 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/2] go: Fix CVE-2026-39823
Date: Sun, 30 Aug 2026 23:14:47 -0700
Message-Id: <20260831061447.180612-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831061447.180612-1-hthakar@cisco.com>
References: <20260831061447.180612-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 06:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244731

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/golang/go/commit/f0384f7c664892ed3ee8c0fec68638d9b3b01811
[2] https://pkg.go.dev/vuln/GO-2026-4982

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-39823.patch                | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39823.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ee2f5ca277..a2c0efa378 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -63,6 +63,7 @@ SRC_URI += "\
     file://CVE-2026-32288.patch \
     file://CVE-2026-27145.patch \
     file://CVE-2026-33814.patch \
+    file://CVE-2026-39823.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39823.patch b/meta/recipes-devtools/go/go/CVE-2026-39823.patch
new file mode 100644
index 0000000000..00e25bb35c
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39823.patch
@@ -0,0 +1,100 @@
+From 4915efb53a017a136a233a7676e80858d5b6e560 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Wed, 22 Apr 2026 18:41:25 -0400
+Subject: [PATCH] [release-branch.go1.25] html/template: fix escaping of URLs
+ in meta content attributes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The WHATWG "shared declarative refresh steps" algorithm (§4.2.5.3)
+skips ASCII whitespace between "url" and "=" when parsing the URL
+portion of a meta content attribute.
+
+Thank you to Samy Ghannad for reporting this issue.
+
+Updates #78913
+Fixes #79031
+Fixes CVE-2026-39823
+
+Change-Id: I7fc3bb9394b95e07b9b10fbc95725a3de6791774
+Reviewed-on: https://go-review.googlesource.com/c/go/+/769920
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+TryBot-Bypass: Roland Shoemaker <roland@golang.org>
+(cherry picked from commit f2ec1254ff32fa39f3ce4faf72bbe44eeeeebad9)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/772101
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-39823
+Upstream-Status: Backport [https://github.com/golang/go/commit/f0384f7c664892ed3ee8c0fec68638d9b3b01811]
+
+(cherry picked from commit f0384f7c664892ed3ee8c0fec68638d9b3b01811)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/html/template/escape_test.go | 20 ++++++++++++++++++++
+ src/html/template/transition.go  | 12 +++++++-----
+ 2 files changed, 27 insertions(+), 5 deletions(-)
+
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index ce064407384..c9e566a9076 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -759,6 +759,26 @@ func TestEscape(t *testing.T) {
+ 			`<meta http-equiv="refresh" content="{{"asd: 123"}}">`,
+ 			`<meta http-equiv="refresh" content="asd: 123">`,
+ 		},
++		{
++			"meta content url with whitespace before equals",
++			`<meta http-equiv="refresh" content="0;url ={{"javascript:alert(1)"}}">`,
++			`<meta http-equiv="refresh" content="0;url =#ZgotmplZ">`,
++		},
++		{
++			"meta content url with tab before equals",
++			"<meta http-equiv=\"refresh\" content=\"0;url\t={{\"javascript:alert(1)\"}}\">",
++			"<meta http-equiv=\"refresh\" content=\"0;url\t=#ZgotmplZ\">",
++		},
++		{
++			"meta content url with space after equals",
++			`<meta http-equiv="refresh" content="0;url= {{"javascript:alert(1)"}}">`,
++			`<meta http-equiv="refresh" content="0;url= #ZgotmplZ">`,
++		},
++		{
++			"meta content url with whitespace both sides of equals",
++			"<meta http-equiv=\"refresh\" content=\"0;url \t= {{\"javascript:alert(1)\"}}\">",
++			"<meta http-equiv=\"refresh\" content=\"0;url \t= #ZgotmplZ\">",
++		},
+ 	}
+ 
+ 	for _, test := range tests {
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index 5aa3c35440b..ac05d56b418 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -626,10 +626,12 @@ func tError(c context, s []byte) (context, int) {
+ 
+ // tMetaContent is the context transition function for the meta content attribute state.
+ func tMetaContent(c context, s []byte) (context, int) {
+-	for i := 0; i < len(s); i++ {
+-		if i+3 <= len(s)-1 && bytes.Equal(bytes.ToLower(s[i:i+4]), []byte("url=")) {
+-			c.state = stateMetaContentURL
+-			return c, i + 4
++	for i := range len(s) {
++		if i+3 <= len(s)-1 && bytes.EqualFold(s[i:i+3], []byte("url")) {
++			if j := eatWhiteSpace(s, i+3); j < len(s) && s[j] == '=' {
++				c.state = stateMetaContentURL
++				return c, j + 1
++			}
+ 		}
+ 	}
+ 	return c, len(s)
+@@ -637,7 +639,7 @@ func tMetaContent(c context, s []byte) (context, int) {
+ 
+ // tMetaContentURL is the context transition function for the "url=" part of a meta content attribute state.
+ func tMetaContentURL(c context, s []byte) (context, int) {
+-	for i := 0; i < len(s); i++ {
++	for i := range len(s) {
+ 		if s[i] == ';' {
+ 			c.state = stateMetaContent
+ 			return c, i + 1
+-- 
+2.35.6
-- 
2.35.6


