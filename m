Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A203C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:29:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.37227.1656674939558027992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jqdCcoPK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656674937; i=@fujitsu.com;
	bh=p1zccnkvLqu+qY+HmAUnOk6Gd9HVO/C1X8QJqr8OTBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jqdCcoPKYP7NDSPLRzmg8NVR+jDjPr+/21tC6UYX6Y6w5Pv+VZJPteiw7ZqSVSjKU
	 j2y2At5McTF039wErhvseZfECV0G/CNlc85MiKVNZn3cKM1f8mA+s1AnjJC6EXxBLw
	 B5CnGMNB1vMf3p77TpH69kwl/hwhekHIozmOU2usYNurfmjpaubiEYiRfq78nCDg9f
	 hZBFl8H2z+Jt04aKHyRsmOq0tqO1CHjLCC7AQxqKVlwFhOudtCOiNw88WzEz3yVS17
	 G4JJm2yHbyP8mWvA0bN43W4u1uWsF6VST5+RqoXkD4e4ympb/AzwBjlzU4hXPBQACu
	 1OLqenFvoBo4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8OxWbfy1r4
  kg1/rZS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxL396xFmzgqljQ1cjcwLifs4uRi0NI4AGj
  xIQdrxghnEtMEkfOtrNAOLsZJWZNucXcxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAkESrWs2soCUsADFdy72AzF5BZwkJp/TB6mQEFCQmPLwPTNImFPAWeLRdW6QsBBQxf
  5V01hBbF4BQYmTM5+wQAyXkDj44gUzRKuixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNjYBME73EKt1EvdRS3fLU4hJdI73E8mK91OJi
  veLK3OScFL281JJNjMAATilWyNjB+H3lT71DjJIcTEqivFev7UsS4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMGbdxMoJ1iUmp5akZaZA4wmmLQEB4+SCG8/SJq3uCAxtzgzHSJ1ilGXY+bXtgPMQi
  x5+XmpUuK8f08DFQmAFGWU5sGNgEX2JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvJuuA03
  hycwrgdv0CugIJqAjdk7bA3JESSJCSqqBKXdnyoEW/3zFbe33r6wSmX1re7Cy2eSI52H/XTeq
  vZ3Dzhl22PeQiP7LtZnvOsQcNi74NqGORcxJxuXPsz3mGse9j1o0FBxknNK18g6Db871daJZr
  9QqyvlWhmryqvC0rJBSCvi+bPpSebe59X0zi/lXOx25kvv6XN2y7OyHPxUDozbars+pZDvd2X
  D+8PFt1r5nJCfP9C397MCxLjvoVmDhcuHm/sJCudXKhYc+HP3r+nv1Lr0NsyOmr5V65p+e+u7
  fGq98m+rmmQt3r79Sd+MiD8/TwIyftZpuh//ynGNlC/B3XXdmx9e2VLmH9TemttTd0PrVrKCq
  InPchGNbnZg099RFDd+4vrzKLE9gV2Ipzkg01GIuKk4EAKJnOJxnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1656674937!3773!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12602 invoked from network); 1 Jul 2022 11:28:57 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:28:57 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 34A92142
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2817B75
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:28:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 4/11] gstreamer1.0-plugins-bad: upgrade 1.20.2 ->
 1.20.3
Date: Fri, 1 Jul 2022 19:28:32 +0800
Message-ID: <1656674913-20419-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
References: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:29:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167457

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...plugins-bad_1.20.2.bb => gstreamer1.0-plugins-bad_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.2.bb => gstreamer1.0-plugins-bad_1.20.3.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
index 53c78d4366..2dd42395f7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "4adc4c05f41051f8136b80cda99b0d049a34e777832f9fea7c5a70347658745b"
+SRC_URI[sha256sum] = "7a11c13b55dd1d2386dd902219e41cbfcdda8e1e0aa3e738186c95074b35da4f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.25.1


