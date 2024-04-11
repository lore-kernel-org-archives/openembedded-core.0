Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1A6C001CC
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 13:33:07 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.17933.1712842376555417505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=FYXaAHUV;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1081; q=dns/txt; s=iport;
  t=1712842376; x=1714051976;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WocgyxaxSyha78JDWSc2fo6A4AetcRqOB1wAIq4aWyM=;
  b=FYXaAHUVZC9pZT8KusZSPpI720kLuVVOvxXdiG1mohqfL2U3ckkg+IDf
   AYHMNX0H/JxfJXw3IsrrLdTGj3mlho/ugXOiSxUNUXtgaSv1LcjTq58HS
   fhSPKkEOEgcVKKVs70vtCJShVuESWApGQQvyT+UoFGoz2b9ZZ7cmZzEWw
   U=;
X-CSE-ConnectionGUID: hPD6fc6aQ96PQysBjAPfzw==
X-CSE-MsgGUID: Kx7tEmFKSZOWzp2p6pZZFA==
X-IPAS-Result: =?us-ascii?q?A0DzAQCG5RdmmIQNJK1ahhhWQUiUG4IigRaKXZM9A1YPA?=
 =?us-ascii?q?QEBDzUPBAEBjR4CJjgTAQIEAQEBAQMCAwEBAQEBAQEBBgEBBQEBAQIBBwUUA?=
 =?us-ascii?q?QEBAQEBAQEeGQUOECeFbQ2HEgFzfCeDAAGCXwIBsEKCLIEBhHjZN4FqgUiNA?=
 =?us-ascii?q?4VhJxuBSUSBFYJydoUQhXYEjDOUXkqBIwNZIQIRAVUTDhMJOg8MGgIbFA0kI?=
 =?us-ascii?q?wIsPgMJChACFgMdFAQyEQkLJgMqBjYCEgwGBgZbIBYJBCMDCAQDUAMgcBEDB?=
 =?us-ascii?q?BoECwd1gz0EE0QDEIEyihmDP4IggRGDIk2FEkQDCQMHBUlAAwsYDUgRLDUUG?=
 =?us-ascii?q?wYiH24HnGMBgglyAQGBDUwCdscZhB2MDpUfGjOqMwGYYqQihGOBeyOBW00jF?=
 =?us-ascii?q?YMiCUkZD445iHWYZkM1AjkCBwsBAQMJimgBAQ?=
IronPort-Data: A9a23:4PrkOa3xZnLcM+FM2/bD5cBxkn2cJEfYwER7XKvMYLTBsI5bpzAGz
 WAcWGuFbKrZYDTwfd9yPYni/E8OsZCDz9ZlHABv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ1yFjmE4E71btANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXV5
 rsen+WFYAX5g2ItazpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauG4ycbjG
 o4vZJnglo/o109F5uGNy94XQWVWKlLmBjViv1INM0SUbreukQRpukozHKJ0hU66EFxllfgpo
 DlGncTYpQvEosQglcxFOyS0HR2SMoVGwJOZL3PhuPXCkXX/YmDGwdxWAlMpaNhwFuZfWQmi9
 NQRLDQLKxuEne/zmer9Qeh3jcNlJ87uVG8dkig/lneCU7B/GtaaGP+iCdxwhF/cguhJGP/CZ
 tcCaRJkbQ/LZFtEPVJ/5JcWxrrw2imjImYDwL6TjYknvHT+ySJS64rKD8jNIMTUXfdnsG/N8
 woq+EyiX0lFb4bAodafyVqrnuLJkCbxVY4eGbH9/flwjXWXx3cPE1sRTVa9rPyzh0KyVt4ZL
 FYbkhfCtoA78EitC9L6RRD9+SbCtR8HUN0WGOo/gO2Q9kbKywahKjYKRWBIUY14jPYnXhYo/
 2eHjcy8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4oe0tvYKLTGYb0EunczpzLJNZmOEZDt0Z/
 txnhCE6g7NWhskR2uDipRbMgimnod7CSQtdCuTrsoCNsF4RiG2NPtDABb3nARBocN/xor6p5
 ydspiRmxLpSZaxhbhClTuQXB62O7P2YKjDailMHN8B+rm7ypCXzItsNu24WyKJV3iAsJ2eBj
 Kj75FI52XOvFCrCgVJfOtvuW5pwkcAM6/y8B6qPBjaxXnSBXFTapH41PxH4M5HFm0k3mqZ3I
 oaAbcupFj4bD68hpAdatM9DuYLHMhsWnDuJLbiilkzP+ePHOBa9F+xfWHPQNb9R0U9xiFiPm
 /5FKdCwwglSOMWnJHG/HXg7dw5adBDWxPne9qRqSwJ0ClE4RTt4UK6MmutJlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:nZLZy6x7n7ksJ3myFyTTKrPwP71zdoMgy1knxilNoHtuA6+lfq
 +V88jzuSWftN9zYhEdcK67VpVoKEm0nfVICOIqUYtKMjOKhILRFuBfBU+I+UyEJ8U4ndQtt5
 tdTw==
X-Talos-CUID: 9a23:fecwBmxkmR4YpO8QwQIQBgUUIux7fHaDxU6BfXeBGH1DSpStR02PrfY=
X-Talos-MUID: 9a23:ORk/dAgjO+mO2ac+vVSVssMpF9c3/4mrJmM2o7I5qdHeLXJoCQWzpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.07,193,1708387200"; 
   d="scan'208";a="250484933"
Received: from alln-core-10.cisco.com ([173.36.13.132])
  by alln-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 13:32:55 +0000
Received: from sjc-ads-4348.cisco.com (sjc-ads-4348.cisco.com [171.70.55.119])
	by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTP id 43BDWtHE027186
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 13:32:55 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nativesdk-gzip: fix reproducibility issues
Date: Thu, 11 Apr 2024 13:32:55 +0000
Message-Id: <20240411133255.3217812-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.55.119, sjc-ads-4348.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 13:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198130

There is absolute path in zgrep binary. It is related
to the changes that fix an issue with zgrep on Solaris
and other platforms with 'grep -e'. I'd like to ask here
if Yocto supports Solaris as host architecture, and
if there's a reliable way to detect the host arch.
If there is, I'll place additional check to be
compatible with it.

Original change:
git.savannah.gnu.org/cgit/gzip.git/commit?id=60b3f4eb672a85de28ecaad47ed426f8c8fe6c32

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
 meta/recipes-extended/gzip/gzip.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index b32584033b..62b3e2f4f9 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -8,6 +8,7 @@ inherit autotools texinfo
 export DEFS="NO_ASM"
 
 EXTRA_OEMAKE:class-target = "GREP=${base_bindir}/grep"
+EXTRA_OEMAKE:append:class-nativesdk = " GREP=grep"
 EXTRA_OECONF:append:libc-musl = " gl_cv_func_fflush_stdin=yes "
 
 do_install:append () {
-- 
2.33.0


