Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8733.1793269813984050624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DT3/G0LD;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3497; q=dns/txt;
  s=iport01; t=1793269814; x=1794479414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HsC5ytA7eOCh5Ap+NAEtFAlmKns0vhAlRPqoMT9rMqk=;
  b=DT3/G0LDuDWpaA7DCZlJQgy6dLMymVgUkdhI/mkeDhOvgfF3XKPcZJq7
   KWuaah60voHRvslGGEaIOrEKnHmVbhIaUuoDX5GiBB5rYxCLKX65dW3Yp
   syBQlvLdwLt4sto8Ug0FJtUdve53wq1x3eD4tIItN6b05WOcLWDtxQJJg
   BWAjdgNzUreS1SsJwIV/3WbXAo+8Re4j189KR8wfPLXmy6ZkMeSYdJg0R
   ZW2/BCfF7IT+5hFz0gKqjxdQx/RqqW1whuviDCgBeHxWE2j++wfXv4r+8
   NjQP89T0ryThyqVYS6MDPLO5fkfsXWMNNIG1ikJH3+TJVFXpYGCjBx2F7
   w==;
X-CSE-ConnectionGUID: ICDrRo71SJK4f5yq4skMdQ==
X-CSE-MsgGUID: NLzrYYVlQta+dy7M41lb9Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgCjH+Nq/43/Ja1aglmCV3VgQ0kDlkgDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMyARgBLRAcAwECLysjCBkagmgBgnQDEbRMgiyBAYMpA?=
 =?us-ascii?q?T8CQ1DbMwELFAEFgTOFQIgjXRgBhH0nGxuBcoEUAYE7gi6BBYFcAoIGhh8Eg?=
 =?us-ascii?q?iJ6EoFaHoYyhl4Ch1NIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEegRmBB12BKylgASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xouC4EaNTwJJkEVDGQLGgViCAINDHY5EDEgJjIEAx0YDUgRLDcVGQQ+bgeRX?=
 =?us-ascii?q?YMOFmUTARMYgWgBQ5MRkESCIaEPCiiDdowilToaM6pvC5h9jgqVU32EaYFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ+OOYNrM4RgyUcnMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:QDqTRajPgpdsrfW+nvMbIQTAX161NhEKZh0ujC45NGQN5FlHY01je
 htvDGCGPa6JNmv8LYxya4vgoU9UvcTRz9MyHFNv/HxmFC1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/jS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU50cptO2YRr
 Mc6C2wDMwGa2/m15b6CH7wEasQLdKEHPasFsX1miDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg5/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIJoXSFZoEzxjwS
 mTu2UDrGCArCtim1TPG/mPzo7OWmSmqYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:51G+HawyaRpj55l0ZEf6KrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3Ad/jZw2mkfnNfduzOXVoU2pbVlUzXOVz24G3qJBD?=
 =?us-ascii?q?hMkRKFLPIWEbM46BBn/M7zg=3D=3D?=
X-Talos-MUID: 9a23:hOPC0wUmQZ7jAkfq/BnIlitTBfls2rinS0wczrBa4s2OZBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="541087996"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:30:13 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id D0C51180005D0;
	Thu, 29 Oct 2026 10:30:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 78EAECBF202; Thu, 29 Oct 2026 03:30:12 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH v2 3/3] lrzsz: fix CVE-2026-105842
Date: Thu, 29 Oct 2026 03:30:12 -0700
Message-Id: <20261029103012.2335950-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261029103012.2335950-1-hthakar@cisco.com>
References: <20261029103012.2335950-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248931
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
Changes in v2:
- corrected the advisory reference in commit messsage
---
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch | 57 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch
new file mode 100644
index 00000000000..afa6a8ab3b4
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105842.patch
@@ -0,0 +1,57 @@
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
+(cherry picked from commit f8caa7b1b1a3a1bb50cf08677b15be7b17c2956f)
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
index ec98f690153..a6d1f62c61e 100644
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

