Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2400.1793956886511139014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 01:21:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ezdrSulJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3346; q=dns/txt;
  s=iport01; t=1793956886; x=1795166486;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RlHdSiUWsCiIVgdFB2UG4GltWZ7hSgTS18a7oxI3F2Q=;
  b=ezdrSulJu0hlPywTXH/3vTdkrJqNQ0kMLSaf4/OBsUvTylyMzEVS2iMD
   eDq+gZFoZ+oP2U6EbMVnTkIGR/TDTOhualifwFy6t3aalntJDiNmSsMxl
   nyLwuapFswZ1dMdXC2x0YYad7StlXSSjLx/HyKw0twFpwaMT517Un0XRP
   GnptoBFeBJ35Q+ygDf0Z9lysQQOa/HlIL+TtOOYoz70KeYecy3Sgn0kmy
   S/5kC4aNSuqgvk3sHUobwRWF1Q8Kgj+fNwLDgg6PTvXhLH0WGstNXJ7bl
   8U5BIVeuV09P07KORNxgYTzW9zrK+dAPts3iFPDoI/F1OEVzDUmfrar8K
   A==;
X-CSE-ConnectionGUID: Xq7OvzChQg2ppAJC1rjl7w==
X-CSE-MsgGUID: IlK470bVQAeBV55fuP684Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgDpmu1q/4z/Ja1aHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iEDniGBfg8BAQEPRA0EAQGFBQKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIvKyMIGRqCaAGCdAMRv?=
 =?us-ascii?q?CqCLIEBgykBPwJDUNszAQsUAYE4hUCII10YAYR9JxsbgXKBFAGBO4IugQWBX?=
 =?us-ascii?q?AKCBoYgBIIiehKBWh6GIoZYAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSPYMSFmUTARMYgWgBQ5MRkESCIaERCiiDeIwklToaM6pxC?=
 =?us-ascii?q?5h9jgqVVH2EaYFoPIFZcBWDIglKGQ+OOYNrM4RgxmUmMgIJAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:iu73aKMx8r653RnvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUpx1zQDz
 DAdWm3Ta6zYMGX2Ko12PY61p0MB7cPRm4VjSnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68V3U2YoL6YYw+ktGXln1
 9dBMjIJMQ/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmCS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNHwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEtjOG2aIOEIrRmQ+10mmXE+
 TrMwV3QDzskaYGR1ALboi6V07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:G4wjWKpJhOZxv6Uw3s9/xaMaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:1ePeqGGxiMPpGx9OqmJX7REzBNIOckTSlm/ICm2TUHxrTOKKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AUelX1A9ESfyO+oc5pqnWDxOQf+ZswPjxUEozqLw?=
 =?us-ascii?q?LkffZaCJtA2nN0A3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544130190"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 09:21:25 +0000
Received: from sjc-ads-7857.cisco.com (sjc-ads-7857.cisco.com [10.30.222.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 893B9180001D1
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 09:21:25 +0000 (GMT)
Received: by sjc-ads-7857.cisco.com (Postfix, from userid 1887505)
	id 2E3C2CBEF5B; Fri,  6 Nov 2026 01:21:25 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH  3/3] lrzsz: fix CVE-2026-105842
Date: Fri,  6 Nov 2026 01:21:25 -0800
Message-Id: <20261106092125.2587191-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106092125.2587191-1-hthakar@cisco.com>
References: <20261106092125.2587191-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7857.cisco.com [10.30.222.144];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.222.144, sjc-ads-7857.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249624
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Overlong sender-controlled filenames can overflow the fixed-size
Pathname buffer when copied with strcpy(), causing heap memory
corruption.
Backport upstream commit [1], which replaces the remaining
fixed-size Pathname allocations and copies with strdup(). This
allocates space for the complete filename and addresses the
vulnerability described in [2].

[1] https://github.com/UweOhse/lrzsz/commit/f8caa7b1b1a3a1bb50cf08677b15be7b17c2956f
[2] https://security-tracker.debian.org/tracker/CVE-2026-105842

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch | 56 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch
new file mode 100644
index 0000000000..08b5cbb429
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch
@@ -0,0 +1,56 @@
+From f8caa7b1b1a3a1bb50cf08677b15be7b17c2956f Mon Sep 17 00:00:00 2001
+From: Uwe Ohse at akiar <uwe@ohse.de>
+Date: Mon, 10 Aug 2026 18:40:36 +0200
+Subject: [PATCH] avoid buffer overflows by strdup instead of
+ malloc(PATH_MAX+...).
+
+CVE: CVE-2026-105842
+Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/f8caa7b1b1a3a1bb50cf08677b15be7b17c2956f]
+
+Backport Changes:
+- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
+  0.12.20 release history and is not needed for the security fix.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/lrz.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/lrz.c b/src/lrz.c
+index 168636e..e11f909 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -743,11 +743,10 @@ wcreceive(int argc, char **argp)
+ 		if (Pathname)
+ 			free(Pathname);
+ 		errno=0;
+-		Pathname=malloc(PATH_MAX+1);
++		Pathname=strdup(*argp);
+ 		if (!Pathname)
+ 			error(1,0,_("out of memory"));
+ 
+-		strcpy(Pathname, *argp);
+ 		checkpath(Pathname);
+ #ifdef ENABLE_SYSLOG
+ 		shortname=strrchr(*argp,'/');
+@@ -1288,15 +1287,16 @@ procheader(char *name, struct zm_fileinfo *zi)
+                 return OK; /* dummy */
+         if (Pathname)
+                 free(Pathname);
+-        Pathname=malloc((PATH_MAX)*2);
++
++        Pathname=strdup(name_static);
+         if (!Pathname)
+                 error(1,0,_("out of memory"));
+-        strcpy(Pathname, name_static);
+         if (Verbose) {
+                 /* overwrite the "waiting to receive" line */
+                 vstring("\r                                                                     \r");
+                 vstringf(_("Receiving: %s\n"), name_static);
+         }
++
+         checkpath(name_static);
+         if (Nflag)
+         {
+-- 
+2.35.6
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index ec98f69015..a6d1f62c61 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch \
            file://CVE-2026-105841.patch \
            file://CVE-2026-105840.patch \
+           file://CVE-2026-105842.patch \
            "
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
-- 
2.35.6

