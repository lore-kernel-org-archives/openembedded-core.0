Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1247.1793949576625009037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lfQ95p5M;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4018; q=dns/txt;
  s=iport01; t=1793949576; x=1795159176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UFSPe8pK6Tdm5bJeDdQ18CzIJRKpG5E54efgFKKgXpc=;
  b=lfQ95p5MkMxreMHxnJ988IjROgpKpK+d+Qu5CqH6taGdgl0zaajBepAc
   bwc+ZRBiE9RFXPXFoXvxLf4Z7Macxi3rDlVzKlcr9YhJMsqCRIsXArAgl
   hOAlcyTrRer/MCFbLWUaOqF2rNuFTyunJiYqFlOFd15P7yjbk1SFhqxLz
   wYU0vH6pIL5t1nqGExAGsCjgyg6jFGFaJpivSafAxUCr7/9f7PjNI4bTm
   70xvJe9IYL2JJOVZWUETqK5menqkTqQhhuSenHtsTcNn98R0EP1UP3Lj0
   r4GdXLZVGQ2XA323dzWaio300+r522JGQaW60P7yhrpcb6aHaHrdyMsa+
   g==;
X-CSE-ConnectionGUID: nfjJSM3cRCOqV2TmM9RbsA==
X-CSE-MsgGUID: beNJWl/OQ3yjVdbIwOkKEw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBrfu1q/5L/Ja1aglmCV3VgQ0mWSwOeIYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnQDEQa7Oxs3gXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMwELFAGBOIVAiCNdGAGEfScbG4FyhH6BBYFcAgGIJQSCI?=
 =?us-ascii?q?oEMgVoejHoCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YDUgRLDcVGQQ+b?=
 =?us-ascii?q?geSPYJyIGEtASkBAVQvSjc5kySSQaERCiiDeIwkglmSYRozhASmbQuYfY4Kl?=
 =?us-ascii?q?WkYA02EaYFoPIFZcBWDIgkWNBkPjjmDa4ZAxgUmMgIJMgEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:G7FCHaM278eb+OfvrR30lsFynXyQoLVcMsEvi/4bfWQNrUoh0zYFy
 zMbXj3SOv3fYWH8eNpzPYTg8UsCu57SzNA3GXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/NgDmMNGNYTwM1QGF8Uy
 fk9eQoHdTnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsjOW3YISEI43iqcN9lEu+h
 F3CuEPAWQAYCtCV6CWi8VGBmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:23PxiaN6yrgfosBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AWljxhmsfjkrdvXkv1bphmiD96IsjfH//91KLKHW?=
 =?us-ascii?q?TLn9XEoGQbA6q8rhNxp8=3D?=
X-Talos-MUID: 9a23:cydjIQUIahxrYX3q/DXhohNdMIBP2v+/Cn4Bm7QZnMqnGDMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545286919"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id AA09018000202;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 05C9ECBF234; Thu,  5 Nov 2026 23:19:35 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 6/9] curl: fix CVE-2026-92392
Date: Thu,  5 Nov 2026 23:19:29 -0800
Message-Id: <20261106071932.490299-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249602
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Finish request flushing before connection filters release their
references to the easy handle. Detach or return the connection before
resuming pending transfers, including HTTP/2 upload retry paths.

Adapt the order to curl 8.19.0's Curl_cpool_do_locked() callback and
process_pending_handles(). Keep detachment under the existing pool
share lock rather than importing the newer pool APIs.

[1] https://github.com/curl/curl/commit/8b0744af5b1b631da5b938ca31c3f9895ad5a321
[2] https://curl.se/docs/CVE-2026-92392.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-92392.patch            | 59 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92392.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92392.patch b/meta/recipes-support/curl/curl/CVE-2026-92392.patch
new file mode 100644
index 0000000000..4129d7f013
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92392.patch
@@ -0,0 +1,59 @@
+From 8b0744af5b1b631da5b938ca31c3f9895ad5a321 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Mon, 12 Oct 2026 07:40:45 +0200
+Subject: [PATCH] multi: adjust the cleanup order in multi_done
+
+Closes #23370
+
+CVE: CVE-2026-92392
+Upstream-Status: Backport [https://github.com/curl/curl/commit/8b0744af5b1b631da5b938ca31c3f9895ad5a321]
+
+Backport Changes:
+- Use curl 8.19.0's process_pending_handles() and retain its
+  connection/multiplex comment; multi_schedule_pending() is absent.
+- Keep Curl_cpool_do_locked(), whose callback detaches the connection,
+  instead of the newer Curl_cpool_return() and outer detach calls.
+  Notify filters after request cleanup and before that callback,
+  then process pending transfers after the pool lock is released.
+- Apply this to the older function's connection-required layout,
+  which has no outer if(conn) block. Keep a blank line between the
+  pending-transfer block and netrc cleanup.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/multi.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/lib/multi.c b/lib/multi.c
+index ec2d531..4e81001 100644
+--- a/lib/multi.c
++++ b/lib/multi.c
+@@ -720,19 +720,21 @@ static CURLcode multi_done(struct Curl_easy *data,
+   /* Make sure that transfer client writes are really done now. */
+   result = Curl_1st_fatal(result, Curl_xfer_write_done(data, premature));
+ 
+-  /* Inform connection filters that this transfer is done */
+-  Curl_conn_ev_data_done(data, premature);
+-
+-  process_pending_handles(data->multi); /* connection / multiplex */
+-
+   if(!result)
+     result = Curl_req_done(&data->req, data, premature);
+ 
++  /* Inform connection filters that this transfer is done and they
++   * need to give up any references to `data`. */
++  Curl_conn_ev_data_done(data, premature);
++
+   /* Under the potential connection pool's share lock, decide what to
+    * do with the transfer's connection. */
+   mdctx.premature = premature;
+   Curl_cpool_do_locked(data, data->conn, multi_done_locked, &mdctx);
+ 
++  if(data->multi)
++    process_pending_handles(data->multi); /* connection / multiplex */
++
+   /* flush the netrc cache */
+   Curl_netrc_cleanup(&data->state.netrc);
+   return result;
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 5abde681e7..71b7c06e71 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -67,6 +67,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92390_p2.patch \
            file://CVE-2026-92388_p1.patch \
            file://CVE-2026-92388_p2.patch \
+           file://CVE-2026-92392.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
