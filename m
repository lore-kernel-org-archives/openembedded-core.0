Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F0AC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 08:48:19 +0000 (UTC)
Received: from h4.cmg2.smtp.forpsi.com (h4.cmg2.smtp.forpsi.com [185.129.138.189])
 by mx.groups.io with SMTP id smtpd.web10.69129.1705913296279833559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 00:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=CsadrAzf;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=CsadrAzf;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.189, mailfrom: andrej.v@skyrain.eu)
Received: from localhost.localdomain ([62.197.243.174])
	by cmgsmtp with ESMTPA
	id RpyKrrYdeSqGRRpyXrlhWQ; Mon, 22 Jan 2024 09:48:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1705913293; bh=QO/rr8FC/OphKDVXFSFkSyvlb6JfsEvPRiPeaPQwRdE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CsadrAzfYIqcR1Rd1RSeMtLBx3/gK78aw+enmxlGDy2zJ3SsmWTI6qPoH6rtXdf9x
	 Q1GwgFjy2w8SNzKqLros2rVhSo2444J2f5zI2YHTuItC4M9oIF8nk87Isyma0a17bV
	 r375MOrpHnTs8f6+6+hOvWnpDiOMp9qi1OhJgvQiMfaWhWdnx3hE9vUyWI6TGgVtur
	 /bneFTfrafYT8oJMntP0fo0lIWT/CszFca0UbJ5Gd5g4FNEidj51+fWeaDO+1oEyTK
	 yGhpHXCzw7skteqP683oJ6OhUDP4R47PaIG1jco+08jWdwpaYciu7xEKHv+Gj7lNFW
	 WE0sebua8vv4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1705913293; bh=QO/rr8FC/OphKDVXFSFkSyvlb6JfsEvPRiPeaPQwRdE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CsadrAzfYIqcR1Rd1RSeMtLBx3/gK78aw+enmxlGDy2zJ3SsmWTI6qPoH6rtXdf9x
	 Q1GwgFjy2w8SNzKqLros2rVhSo2444J2f5zI2YHTuItC4M9oIF8nk87Isyma0a17bV
	 r375MOrpHnTs8f6+6+hOvWnpDiOMp9qi1OhJgvQiMfaWhWdnx3hE9vUyWI6TGgVtur
	 /bneFTfrafYT8oJMntP0fo0lIWT/CszFca0UbJ5Gd5g4FNEidj51+fWeaDO+1oEyTK
	 yGhpHXCzw7skteqP683oJ6OhUDP4R47PaIG1jco+08jWdwpaYciu7xEKHv+Gj7lNFW
	 WE0sebua8vv4A==
From: Valek Andrej <andrej.v@skyrain.eu>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	Valek Andrej <andrej.v@skyrain.eu>
Subject: [OE-core][PATCH] glibc: Refresh CVE statuses
Date: Mon, 22 Jan 2024 09:47:59 +0100
Message-Id: <20240122084759.76698-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMKF1sq=5y83bJEAQEibM+UZByZ04D1bYTNzEmjOB95Oojw0oA@mail.gmail.com>
References: <CAMKF1sq=5y83bJEAQEibM+UZByZ04D1bYTNzEmjOB95Oojw0oA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGSSWZmtX22+Q4wtrstlpYK9ot1SOZPXRZod6FNI/mkOWSAS3lrRbSvTPHU7NlkhH2HhmDDBae3EIHmmILuo1ahY68M/kIfkZkoOjBqIPPpvEuvu7IIw
 RCvJYRTZ1NJ/q/voOYvUVSfYU4HLDV/3E2fzCLCvlw0cWk8YDqoImlFy5fwUoRAG7jkVsK1EsgwF6DTiQrDIflNGfI75BFC3AgkeI+rmISHq6OjhwK9YBkx4
 yiurC6jJ6qGUsi2CUUtMu1Fw5SiPfNc7i8xd4CAV2XA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194124

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


