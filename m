Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE1EC54F52
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32609.1771565686307896284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U0on8L2+;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1615; q=dns/txt;
  s=iport01; t=1771565687; x=1772775287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ewu+66LAyh3eltVHFk05F4gvz8aL/n9UMTo4fDJLPdA=;
  b=U0on8L2+vzvJt9oDCptafyqfjQmDVQTReeyre1BGJ3+PvynM5rohA617
   80cj6PnhFtGbWh5bK2BpVETzXu70uyJle5wb9moJcpZPDwzRQnUynE6pl
   s4XEGOhT2plpMVduCdd3dDSi6TzKKFQDzNipCTAXdfQhd1UF5tp4ghEMa
   BBsCC4Rpshz2GVjY3tceq73dNcavQkxdo4D6oRpRfsIhLYxHAfRzOAdVE
   2OzEoagB1LbSUcEnQMfMYsKT2TBM4TZNQFvvpwGeCcNsNVpixkAeJH2dH
   RGPf2MSvRJAFNYJoUqNQWhIlB84NkZxjfvfAFpXofmgmtpEgYBVDfvOTG
   w==;
X-CSE-ConnectionGUID: hGc+Y7nTRKS8ykJWnLZZPw==
X-CSE-MsgGUID: n9GlYn9YTASyhUoxbW34Jg==
X-IPAS-Result: =?us-ascii?q?A0BCBAC68Zdp/47/Ja1aglmCSA9xX0JJA5ZLnhqBfw8BA?=
 =?us-ascii?q?QEPNxoEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWwIBAzIBRhAgJgsrKxmDAgGCcwIBpn4aN4IsgQHgIgELF?=
 =?us-ascii?q?AGBOIU8iBlrCYR6JxsbgXKEfYUQhXcEgiKBDpNPSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4ELGwcFgkKFEQ+JBXhugSCBGwMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?i8/gjRZIhOBTJRBki0SoQ4KKIN0jB6VOhozhASmZy6HZZBzglihJF2EaIFoP?=
 =?us-ascii?q?EaBE3AVgyIJSRkPjl+CHbwdIjUTKQIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:bjsI3qh89AEAGctp88SI32CIX161NxEKZh0ujC45NGQN5FlHY01je
 htvWG+BbP+IMDejc9Bybtvi9k8P68CDnNMxTwJs+S81FHljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsfjb8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUY1e00MD5Iy
 cY7E2AcbTK8gcaE8oqkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglH/fiFAoU69rqss6G+Vxwt0uFToGISLKobRGJUIwC50o
 ErArkv9MxdLBeC28iuFz3W8jNCUwQH0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:vrAF9asD3GanFkhIjxGuxqxs7skDcdV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmSTSa3BkXCF+xFK+qjgzJyV
X-Talos-CUID: 9a23:2Be3GW5thVJBpbFhOdss9GEfWfF6dEHn70yAMkyaNmBNeo+tVgrF
X-Talos-MUID: 9a23:mzVICwXhqtVfv8Xq/Dm9qzVTMpZZ342VGUAwloUMhJLYFyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="668235856"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 8F06318000225;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id CC1A1CC8CF4; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 25/34] cve-update-db-native: Handle BB_NO_NETWORK and missing db
Date: Thu, 19 Feb 2026 21:34:34 -0800
Message-Id: <20260220053443.3006180-25-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231482

From: Peter Marko <peter.marko@siemens.com>

OE-Core rev: 337c0806d2784d74bee8d6420fb8b4d48795d5fa

This commit was not applied on nvd1/fkie fetcher.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 749c8e266ded2fa81e0e0ebbfa8f1ba164a062f2)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 1a38d6be3f..2677f71792 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -54,6 +54,8 @@ python do_fetch() {
         update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
         if update_interval < 0:
             bb.note("CVE database update skipped")
+            if not os.path.exists(db_file):
+                bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
         if time.time() - os.path.getmtime(db_file) < update_interval:
             bb.debug(2, "Recently updated, skipping")
@@ -62,6 +64,9 @@ python do_fetch() {
     except OSError:
         pass
 
+    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
+        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe uses CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch or update")
+
     bb.utils.mkdirhier(db_dir)
     bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
     if os.path.exists(db_file):

