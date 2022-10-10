Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B4FC4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:43:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.4206.1665391413230718633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=coVUxVAm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391411; i=@fujitsu.com;
	bh=qyGHC59pkUxD9ux7f1gRD4A9V3bCO80Fz9FvObhDRLA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=coVUxVAmBkfEzYi0H3aPFqOxytLM/IcWr7pjpzWdgxhb18NJNAiiBEFGNCaU2UzSE
	 +kRXyCKBGNoALkJQFYhFzjsnQdHTzLcDPTGyqw9hWR6lZpE3lFML2NyC0kdAiYBacU
	 FFuac4jZunCe3PhaIvf1TdSlsLxzKKaILUQSx0rVZ+uU2J0J0Bf4ZkdP9620DNS9qR
	 cTarx3mwYwttWPbXclZHjqjena7cB8DNSt1bMlo0uotup399Tn4ReFyTuSV/HdYEOL
	 0FXjnE5f3BaVpZy4CzOFyuq8dhrGMUpV/P6SRrQJzHBf8YcFDeLOBfGx5zJLMKJU+R
	 WaeBdbb/mAzng==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8OxWdfotnO
  ywePPFhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8abVxoFyzkqDv/xb2Bcxd7FyMUhJPCAUWLa
  uk9QzmUmidMnFzFCOHsYJWZd/c3UxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg
  4SFBWwlVk/IAwmzCKhKLH67iB3E5hVwlNjxeDHYFAkBBYkpD98zg9icAk4SK271soDYQkA1b2
  dPZIOoF5Q4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVBjVTTeLquU3MExgFZyFpn4WkfQE
  j0ypG26SizPSMktzEzBxdQwMDXUNDUyBtrGtoYq6XWKWbqJdaqpuXX1SSoWuol1herJdaXKxX
  XJmbnJOil5dasokRGMQpxemTdzBe2vdL7xCjJAeTkiivwSHnZCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvE9uAOUEi1LTUyvSMnOAEQWTluDgURLhfXARKM1bXJCYW5yZDpE6xWjMcfXKlb3MHD
  O/th1gFmLJy89LlRLnbb8JVCoAUppRmgc3CBbplxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCo
  J8166AjSFJzOvBG7fK6BTmIBOOXnVCeSUkkSElFQD0zI1wdz7J3LeCE9IFZrcdP3BUyWrTezs
  hT33jmRUr1ph1Dbv3M1OsyOvRR7v1zj26YDUmoYpDW+O7mabxrTYIPyH5kY7drWL0ck9ek2Hw
  +49j/A3LTFf43vm79zU9r9hX//tXs+2s3bV1QkFN1q35MtXWKYkSntaRbE77nWwm2LhLRE120
  jk74QW1sB1YYGVCt9DFk34JzRT/NA+U1kVVabNyqoLbD38D/oG/ZTcmvhqygzD0Js8Nj/fJnA
  77Olm/tpgd9avtHH1NGfP4OjdVb3vNY7dVAzTenwngFM+8InH1bxzBvPTrvq0pEmbzJuhw9l1
  qY/R7JqrufzbhxuZV184/lc3sPv13hk/7rNWKLEUZyQaajEXFScCAFX0Nb1vAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1665391410!265711!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18971 invoked from network); 10 Oct 2022 08:43:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:43:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5DE94156
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:43:30 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 506FB155
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:43:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:43:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ifupdown: upgrade 0.8.37 -> 0.8.39
Date: Mon, 10 Oct 2022 16:43:10 +0800
Message-ID: <1665391393-8101-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391393-8101-1-git-send-email-wangmy@fujitsu.com>
References: <1665391393-8101-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:43:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171564

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} (97%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
similarity index 97%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
index 57d4152a39..7096bc94d7 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://0001-ifupdown-skip-wrong-test-case.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
-SRCREV = "2b4138f36ce3ba37186aa01b502273e0c39ab518"
+SRCREV = "be91dd267b4a8db502a6bbf5758563f7048b8078"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


