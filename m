Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B87C47084
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.5010.1650605985676527066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 22:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Z5c/nBmG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650605983; i=@fujitsu.com;
	bh=Wo17aEBdYa6KMaI/mIurM0VDq0gAOFwJ2eiRlP2wI1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Z5c/nBmG6z5FOEuttVe1b90/t/VZE+PcbNhp26sJoaja5cwxN+89FWcMjZsOlQE+i
	 skhaUWc2RIEKnqs0n1+lsWI+/ePv+L+LrOZigSoseA+RCYhF3SzcAdfaTeH6C6YrXZ
	 3k502ooMqgjbYg7eZ/syE9hIkPUQGuMsSiyWxS4C3w5jEGhQzsQnN1YodT6udoMi+U
	 kO0QEnZLS4EXxw7S5SWTVRIZL4v21nR+PSwpU0UFNzb0es7WYZnWXh25/2RdI5TVuI
	 vUBxIPIBzHP7BmcbKYo4EKIg8mozROoz1V8s5tqq1ZxWbrSJtbEwGQtN7EttkCNu+A
	 Q6xHbXiJmIaJg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSXe+fVK
  Swe/9khZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8brtW+YCno4Ko7cmMXawLiOvYuRi0NI4DGj
  xNI9C5kgnPNMElsuz2GEcPYwSsy4/J65i5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBdwlVt7/wgJiswioSqw+cZwVxOYVcJK4N6cXrEZCQEFiykOIkZwCzhL9sycygthCQD
  WTGp8yQdQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0TirKTM8oyU3MzNE1NDDQNTQ01TU20TUytNBLrNJN1Est1S1PLS7RNdJLLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM45RipVs7GDes+ql3iFGSg0lJlNf0XGKSEF9SfkplRmJxRnxRaU5q8
  SFGGQ4OJQleW9ukJCHBotT01Iq0zBxgTMGkJTh4lER4282A0rzFBYm5xZnpEKlTjIpS4ryVdk
  AJAZBERmkeXBssji8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZ9A7KdJzOvBG76K6DFTEC
  LXToTQRaXJCKkpBqY2HVPRZ4MP2xxaffCFTfcJBJjHcXtDZgdJ7HNYZJ8l+gTc6Xue9DTtvjv
  i1Q7u7MzDOO5ynqPbzsvUckpMNl3W0lT+K/PeVs45tyIXenT+aIscda9jM9HfBTyNJtNjjsnS
  l6+35dyUiX2HFPUzfnvPNnWu35ztvP4bKDYGKwsr2tRwcAeEa3xRNBIrnPxri9bJGbtOZPJ1n
  Wzhzty/5MUVW6b8EfC7TYzhE7dFF//4uChZkMD+x+PI1me3PWeeOfwhdx80c1GUsUX5BUUpy7
  POXk4b+bTST3fJp2obfZIn7H85YbTcm/X8PpuuuhdzrdcNm7isdgD6qecnQ7nbDH9qt23b1l5
  puShIptdYrxKLMUZiYZazEXFiQDIVwyVXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1650605983!215933!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25503 invoked from network); 22 Apr 2022 05:39:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Apr 2022 05:39:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 064A4100478
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 06:39:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EE2FC100466
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 06:39:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Apr 2022 06:39:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.41.0 -> 6.44.0
Date: Fri, 22 Apr 2022 13:39:13 +0800
Message-ID: <1650605953-10177-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650605953-10177-1-git-send-email-wangmy@fujitsu.com>
References: <1650605953-10177-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164774

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.41.0.bb => python3-hypothesis_6.44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.41.0.bb => python3-hypothesis_6.44.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.41.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.41.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb
index 9174b606bf..e0f80b0e11 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.41.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "de48abb676fc76e4397cd002926e5747cef518570d132221244d27e1075c0bec"
+SRC_URI[sha256sum] = "620ffa1782f9cb0b732b66b811d11c3beeb678b96fae947740aaab1dfd74a996"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


