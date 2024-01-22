Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A24C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 08:58:29 +0000 (UTC)
Received: from h4.cmg2.smtp.forpsi.com (h4.cmg2.smtp.forpsi.com [185.129.138.189])
 by mx.groups.io with SMTP id smtpd.web11.69258.1705913902558587645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 00:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=NAOPt892;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=NAOPt892;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.189, mailfrom: andrej.v@skyrain.eu)
Received: from localhost.localdomain ([62.197.243.174])
	by cmgsmtp with ESMTPA
	id Rq87rremqSqGRRq8KrlkMF; Mon, 22 Jan 2024 09:58:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1705913900; bh=QO/rr8FC/OphKDVXFSFkSyvlb6JfsEvPRiPeaPQwRdE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=NAOPt892WSSP1XLjWaIeKAb1xW81PYEkqrbWWga4kemBWKKz9u0LjE1+C7BkU7fIY
	 vYpOMC2xKAN5gOGaXLad0ec9d8SfJLVue33b/d/qYw04Qajl3LcfS/MJ+0kv3ofUhz
	 GAALUjyHKriN7NYMHLTC7j9E86tJKPmD/LtSvwFWNH/rWsp2eExe/7bmxy0ZMLjtd0
	 C8PFtFweWRO1xJQ/1caFRYxx9QPDoVIIngCFx9nw1GCWFHOx8iKStWs6jehTkPR3qB
	 DUDok4ERXYpMDafw4IjFKtTh3jgK5v/XUYtHUhloXOvwge6Qoz3usFWfMuUZAFDAAp
	 s/XcuSIbPCP/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1705913900; bh=QO/rr8FC/OphKDVXFSFkSyvlb6JfsEvPRiPeaPQwRdE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=NAOPt892WSSP1XLjWaIeKAb1xW81PYEkqrbWWga4kemBWKKz9u0LjE1+C7BkU7fIY
	 vYpOMC2xKAN5gOGaXLad0ec9d8SfJLVue33b/d/qYw04Qajl3LcfS/MJ+0kv3ofUhz
	 GAALUjyHKriN7NYMHLTC7j9E86tJKPmD/LtSvwFWNH/rWsp2eExe/7bmxy0ZMLjtd0
	 C8PFtFweWRO1xJQ/1caFRYxx9QPDoVIIngCFx9nw1GCWFHOx8iKStWs6jehTkPR3qB
	 DUDok4ERXYpMDafw4IjFKtTh3jgK5v/XUYtHUhloXOvwge6Qoz3usFWfMuUZAFDAAp
	 s/XcuSIbPCP/w==
From: Valek Andrej <andrej.v@skyrain.eu>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	Valek Andrej <andrej.v@skyrain.eu>
Subject: [OE-core][PATCH] glibc: Refresh CVE statuses
Date: Mon, 22 Jan 2024 09:58:05 +0100
Message-Id: <20240122085805.77461-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMKF1sq=5y83bJEAQEibM+UZByZ04D1bYTNzEmjOB95Oojw0oA@mail.gmail.com>
References: <CAMKF1sq=5y83bJEAQEibM+UZByZ04D1bYTNzEmjOB95Oojw0oA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfB30a3Ol0q2zilcnBl6DWjSWdLqLfBD0EPO5RpbTtih9EWIUumTsNbO1VcFVQWJtzgS3gVo/AIsjPYz/M9ocbkXJFdwBVKjc0cxpVwlBQOo2pjd3Pri5
 sTm34Ik5QIfxdw5dFk0w9hibR4vendN+d3QjxQEtTc/9ZKhAoPG6IyJfqr6ljvi0JiirtRQrL6foOrZaLHTDTstY8NUb86OzHgaouMPWzvzKnDvgjq9KG/Ot
 BvfqBK+xKu4fJEUMee1KqBezxRz0596hlZBRWHEJnCo=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194128

- drop irrelevant CVEs

Signed-off-by: Valek Andrej <andrej.v@skyrain.eu>
---
 meta/recipes-core/glibc/glibc-version.inc | 5 -----
 meta/recipes-core/glibc/glibc_2.39.bb     | 2 --
 2 files changed, 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 7efcd0818f6..b8f0a4a119e 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -7,9 +7,4 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
-CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-5156] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-0687] = "fixed-version: Fixed in stable branch updates"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 910bbdd71b0..b5aa15ec5bb 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -16,8 +16,6 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
-CVE_STATUS[CVE-2023-25139] = "cpe-stable-backport: This is integrated into the 2.37 branch as of 07b9521fc6"
-
 DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.34.1


