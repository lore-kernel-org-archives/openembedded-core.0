Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68160FCD0B6
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:39:17 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7592.1773812351113284123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=D451APU5;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2360; q=dns/txt;
  s=iport01; t=1773812351; x=1775021951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5w9aO5h3SqwaHC66ykhefrYzQ+Z5hMC0pexYcmToKQ8=;
  b=D451APU5nFvz3DO8CXz4zD4OSYguxxKgFNIrTUcunj2QzK0aPhUOisWw
   4w9QYh2SYaTB2E0rncKpozjYZAomCWHRYOF3YYZ8MvuGCuZUkJEY+eHHS
   vZ/OYH6bmfzqYc+a19Dro5QMmz6oNrLwm1KB+LFvz6Ei2YEDYhGG6z991
   TZtXKDF2F9+bFHhw5X5jBwDZA3NTNqyDEXf5NMbn5T8INXV9WJh+vihzb
   JqZXBwcNgAAde3L94eC68b+KQX8l+gtlRm4jDu8WrXNwdvBVHDwipRLed
   ngVB+ccb+HHnuAlb6g3EaK+0sGC603y7LdxyehMlDtVo20q710kibBx8X
   g==;
X-CSE-ConnectionGUID: 6vQJwWrDTKm7f3OOrA9E4w==
X-CSE-MsgGUID: xBD9Zo33RQW8bct0XlYzSw==
X-IPAS-Result: =?us-ascii?q?A0CMBQCqObpp/5AQJK1aglmCGDAPgVBCSZZLA54agX8PA?=
 =?us-ascii?q?QEBD1EEAQGFBwKNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZbAgEDMgFGECAxKysZgwKCdAIBsw6CLIEBhHzbJgELFAGBO?=
 =?us-ascii?q?IU8iBlaGoR6JxsbgXKEfYUQhXcEgiKBDpJ8SIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ELGwcFhAAPiG10bYEThAwDCxgNSBEsNxQbBD5uB41PO4IzA?=
 =?us-ascii?q?QGBDTCCO6VhoQ4KKIN0oVgaM4QEpmeZBoJYoUo3hGiBaDyBWXAVgyJSGQ+PV?=
 =?us-ascii?q?QEHyDcjNT0CBwIHDQMLk2UBAQ?=
IronPort-Data: A9a23:729wyKujDSh9tS/oFr7kFtbdAOfnVAJfMUV32f8akzHdYApBsoF/q
 tZmKWCDOv7eZmSgf9hzbIm0/ENV75OGztRkGlA9+HozHnsVgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/na90s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwpPhOI35x7
 9AkCzVSYEukoPifkZ/nVbw57igjBJGD0II3s3Vky3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgt/5JEWxI9EglH/fiFAoU69rqss6G+Vxwt0uFToGIaLIIbRFZkNxS50o
 ErW1UioMBZBb+am9mqP+W70tuv+jxjkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:3AR2H6mBPD6BDXIhQT7JdCx3TEbpDfIr3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYsS4/izPIaurJB7K8gcaVuds=
X-Talos-CUID: 9a23:4FJB926z263bGNJqtNssqlAtON8aaFHh73KPLRSfLnxAGZDJVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A+Y2Kow74X6IDid4Vm3tmJfM0xox4yYj/OkdWyq8?=
 =?us-ascii?q?/hJmOPjAoCzOsng+oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,126,1770595200"; 
   d="scan'208";a="462238403"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 05:39:08 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 5221D18000365;
	Wed, 18 Mar 2026 05:39:08 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id ED8B8CE2A7B; Tue, 17 Mar 2026 22:39:07 -0700 (PDT)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH v1 4/4] cve-check: fix debug message
Date: Tue, 17 Mar 2026 22:39:06 -0700
Message-Id: <20260318053906.26606-5-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260318053906.26606-1-hetpat@cisco.com>
References: <20260318053906.26606-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 05:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233363

From: Daniel Turull <daniel.turull@ericsson.com>

Debug level was not added as a parameter, causing a warning.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40157fcbd9066f261812ba665ec963b2e496aa53)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 32fb9e8a5c..d84fe2a0d3 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -307,7 +307,7 @@ def cve_update(d, cve_data, cve, entry):
         cve_data[cve] = entry
         return
     # If we are updating, there might be change in the status
-    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve, cve_data[cve]['abbrev-status'], entry['abbrev-status']))
+    bb.debug(1, "Trying CVE entry update for %s from %s to %s" % (cve, cve_data[cve]['abbrev-status'], entry['abbrev-status']))
     if cve_data[cve]['abbrev-status'] == "Unknown":
         cve_data[cve] = entry
         return
@@ -318,16 +318,16 @@ def cve_update(d, cve_data, cve, entry):
         if entry['status'] == "version-in-range" and cve_data[cve]['status'] == "version-not-in-range":
             # New result from the scan, vulnerable
             cve_data[cve] = entry
-            bb.debug("CVE entry %s update from Patched to Unpatched from the scan result" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched from the scan result" % cve)
             return
     if entry['abbrev-status'] == "Patched" and cve_data[cve]['abbrev-status'] == "Unpatched":
         if entry['status'] == "version-not-in-range" and cve_data[cve]['status'] == "version-in-range":
             # Range does not match the scan, but we already have a vulnerable match, ignore
-            bb.debug("CVE entry %s update from Patched to Unpatched from the scan result - not applying" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched from the scan result - not applying" % cve)
             return
     # If we have an "Ignored", it has a priority
     if cve_data[cve]['abbrev-status'] == "Ignored":
-        bb.debug("CVE %s not updating because Ignored" % cve)
+        bb.debug(1, "CVE %s not updating because Ignored" % cve)
         return
     bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve, cve_data[cve], entry))
 

