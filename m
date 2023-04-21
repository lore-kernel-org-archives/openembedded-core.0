Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C89C77B71
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 14:51:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.14385.1682088652116649001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 07:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JETIMpC/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682088650; i=@fujitsu.com;
	bh=9PhIY3FHT717EGmc8vPVm4HbMsKLfuy9m1Q0XSvDZcM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JETIMpC/lKSTN3wUuPLxdR2WkRcXq9upMriQVAgZbS2Vjmw+EyH21AVyB6cZx6Uh1
	 sdPbr39DvWUpAHgVYuUpZaYz6QFLnGRIY6go4r753sfvs1tAjJ1Thi2l6/qFH/hftg
	 DU5Aiyx/v8AtbRxNzsp8wdeFGKTJUaBrktm5xg35V4guEyXayjz6EwC6h0xlmZFM4N
	 K3+vDpVB8k2mUKrIsdSVTvRRaTPBQCgQabk1sSontkv0hk1zIM40Hd6eF58tLReS9q
	 bbZV/pCDjvuCxBy4QojEiecptWCYo41NzsNYKKk1/vfclI4kQUeo6Vo1xHNF5uFdJJ
	 duriWNkRFjZJw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSffkIqc
  Ugzdz1Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyrX3pZC+ayVZxe1s3YwHiQtYuRi0NI4DGj
  xL5rf9ggnOtMEvtPz4DK7GWUWLp5KpDDycEmICVx4/5/oCoODhEBPYmr/0RBwswCKhIvfvewg
  9jCAg4ShzsOMILYLAKqEluPHAOzeQWcJOb82AlWIyGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmFgi7UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdI72kosz0jJL
  cxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwFBMKWb4uYPx4M6/eocY
  JTmYlER5X+x2SBHiS8pPqcxILM6ILyrNSS0+xCjDwaEkwTtvvlOKkGBRanpqRVpmDjAuYNISH
  DxKIrx75wKleYsLEnOLM9MhUqcYFaXEeactBEoIgCQySvPg2mCxeIlRVkqYl5GBgUGIpyC1KD
  ezBFX+FaM4B6OSMO9EkCk8mXklcNNfAS1mAlr8UMwBZHFJIkJKqoGpOOjk+WdJjxnlxPLW3Sy
  479PdvKj5WsmzZ/1+N91+VsxKm+t1q9Us4bzS1rMhBxPiqhXO6rGf1zYxiC5qZ1S7xGlb2SaW
  f+C6WOgplT0xZrMf+Onq5O1QX7V8I0Mfh4CvOfOLB15rrrEY+fBznT7b9bTp1QON419et2X9C
  4hlKT72oVFA6fZHbl+LU3/Tj9/9N2lpue1l8X+S3w6lbO2caqhQsudt3zaNF2uX/Z0WLcW9ql
  Y6PP7Wkf31Mww2rEqd8Vvh4C67BVWygUweHi+4e46qM17csfD886f97vxajQcOnsorCnQP+q5
  yI9HskU/wlZ/r5iq2iP85wx83UcT/HtPpjaJRVgw7jqafzT6hxFKckWioxVxUnAgAUGmZwUAD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1682088649!272574!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1314 invoked from network); 21 Apr 2023 14:50:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Apr 2023 14:50:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3AEA110047F
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 15:50:49 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2F1C6100337
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 15:50:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 21 Apr 2023 15:50:47 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gdb: Fix conflict of sframe-spec.info
Date: Fri, 21 Apr 2023 22:50:31 +0800
Message-ID: <1682088631-23023-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 14:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180287

From: Wang Mingyu <wangmy@fujitsu.com>

error message:
file /usr/share/info/sframe-spec.info conflicts between attempted installs of binutils-doc-2.40-r0.aarch64 and gdb-doc-13.1-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 925b0c2f80..9db61b785f 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -58,6 +58,7 @@ do_install:append() {
 	rm -rf ${D}${includedir}
 	rm -rf ${D}${datadir}/locale
 	rm -f ${D}${infodir}/bfd.info
+        rm -f ${D}${infodir}/sframe-spec.info
 }
 
 RRECOMMENDS:gdb:append:linux = " glibc-thread-db "
-- 
2.34.1


