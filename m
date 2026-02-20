Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2996C55184
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32338.1771565685765362574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dfrxWFS+;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2630; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XWajsCpyuXj7kD5s6TS0c5hh2FGzUlkiK6tZ0gKkoQ8=;
  b=dfrxWFS+8Z1JzC33xJCo6JSfUE6Y0zsWzXboWFVIzh0dAf7t5sVVZg6O
   RrJka3VMROOkyEgcywqEfgtJNDJnpVCeTkBn+0E3wQwbQmB1nH1owVPNo
   SGsNBWGNm+im1cHXLE8IAL52UlV1t7bGWsuLGe93terVuiNIrGQUYJvZI
   nWzy9XzPw0Yp/5aqgwmTaPgonW0tnULbLYmaZnGHZ8ZSYW0jiCVZ4KJJJ
   prw3B/IMAA4WFP+0CkKxsCmD/6FrOrT4n3K7wNm1oLS8sCb77FD6RvI2d
   HnO75mnvxgd5yj3JKKrFGlrCj3hdJL60pBKc/4JEKrAyoH4QxLfZJz4ol
   Q==;
X-CSE-ConnectionGUID: wUkBIGPmT7Sa+lZ4O+uJoA==
X-CSE-MsgGUID: PvKmwjqmQ3K0fhElpbOrvg==
X-IPAS-Result: =?us-ascii?q?A0BDBAC68Zdp/4r/Ja1aglmCSA9xX0JJA5ZIA54agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjR8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhlsCAQMyAUYQICYLKysZgwIBgnMCAadPgiyBAeAiAQsUA?=
 =?us-ascii?q?YE4hTyIGWsJhHonGxuBcoR9hRCFdwSCIoEOgWKJUogbSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVMjwyHYEjPheBCxsHBYJChREPiQV4boEggRsDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB44vP4I0PT4UgQFKJaZboQ4KKIN0jB6VOhozhASmZyyYWoJYogGEaIFoP?=
 =?us-ascii?q?EaBE3AVgyIJSRkPjl+CHbwdIjUTKQIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:ZAHnBKh3+zAPE0mefR4KC4duX161NxEKZh0ujC45NGQN5FlHY01je
 htvCjrXaa3fMDDzctEkat7l9h4EvpTczYJlTlRvrylmQn9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsfjb8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUHx+VdIE528
 MBHEzlOaiLfoKGr4rWSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglH/fiFAoU69rqss6G+Vxwt0uFToGISKIIfVGZgLxy50o
 Er+4Uf8HRMDMeXE6mKL8l+onuXohz30Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:7MKjVqP4LJmSVMBcTsajsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 Rdm2wUMqyIMbC85vyKhjWFLw==
X-Talos-CUID: 9a23:+ykSPm/5HqMEZ0sTZTeVv1EpGeoEXUXY8CjrKgy8OzpOC6C3TnbFrQ==
X-Talos-MUID: 9a23:z6C3vAiKB9hge5nE2QRwwMMpDNlL5rusEUU0yrZetcmpMTR6HC2Dg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="672374561"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 99BD3180002BC;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id F234ECC8D0B; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 31/34] cve-update: log timestamps and add force update for future time
Date: Thu, 19 Feb 2026 21:34:40 -0800
Message-Id: <20260220053443.3006180-31-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231470

From: Peter Marko <peter.marko@siemens.com>

CVE update is currently not working properly on autobuilder.
This improves logging for problem analysis.

Future time is something which could be reason for current autobuilder
problems since the DB was not updated for more than 3 months by now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0098a05116624d019f8c5107940e910d867f3afc)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb   | 7 ++++++-
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 9d21d10157..962b600e3b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -57,7 +57,12 @@ python do_fetch() {
             if not os.path.exists(db_file):
                 bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
-        if time.time() - os.path.getmtime(db_file) < update_interval:
+        curr_time = time.time()
+        database_time = os.path.getmtime(db_file)
+        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), time.ctime(database_time)))
+        if curr_time < database_time:
+            bb.warn("Database time is in the future, force DB update")
+        elif curr_time - database_time < update_interval:
             bb.note("CVE database recently updated, skipping")
             return
 
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index f7a306c995..1411d16e20 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -71,10 +71,15 @@ python do_fetch() {
             if not os.path.exists(db_file):
                 bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
-        if time.time() - os.path.getmtime(db_file) < update_interval:
+        curr_time = time.time()
+        database_time = os.path.getmtime(db_file)
+        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), time.ctime(database_time)))
+        if curr_time < database_time:
+            bb.warn("Database time is in the future, force DB update")
+            database_time = 0
+        elif curr_time - database_time < update_interval:
             bb.note("CVE database recently updated, skipping")
             return
-        database_time = os.path.getmtime(db_file)
 
     except OSError:
         pass

