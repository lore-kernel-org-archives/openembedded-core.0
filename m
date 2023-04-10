Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74C2C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:04:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.39897.1681117485587237163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D+ZUUWZP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117484; i=@fujitsu.com;
	bh=XZuq4Rdu4n1sSLOkivXPxr5vT2/dqhoYaRcX2TDgmz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=D+ZUUWZPyprhd8Lvh7BCEvIEf7tuG0nP8JDlzq5UFcWiWJN//kLTUb6iHer0NUccD
	 JfoqLayT8jEQuM72odxzNkldFeEUL0WzWN7R5NfNEJ6TMaEmKnKNo6b/kgFnJrZQC6
	 OhEwsLMEvFvASN7LJHL1L2QGGFZUCYjncVVZxouKvaMbdOHJL5ADIBYuLPukrd5jvM
	 fES6OlRKv+zNyavoo1N1TJHcoyW8Q2Fi1vW3x7kdgSbM7y1VKtMU7iRQkta+7/TO7t
	 eeHhJoYt/Kx+x1VRp7qR/zkNlo8LFFBgQj5mfmxBhTFFFD8e78JF/jvVKf5OPF53rk
	 FHVvC4oQrJq2w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpKt90Tj
  F4PV1TYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPX7R+sBae5KnbMms7UwDiBs4uRi0NI4AGj
  xKnzE5ggnMtMEnvmXGODcPYwSvT9nMLcxcjJwSYgJXHj/n+gBAeHiICexNV/oiBhZgEViRe/e
  9hBbGEBK4lrp2eygdgsAqoSS1vusILYvAJOEtffPwOzJQQUJKY8fA82klPAWeL4hd1gvUJANd
  3H7kPVC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskGqcfYoKw1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdI1tNBLKspMzyjJTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J
  0ctLLdnECAzelGLlDzsYl/b91TvEKMnBpCTK28VlnCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  tfgAlBOsCg1PbUiLTMHGEkwaQkOHiUR3qzzQGne4oLE3OLMdIjUKUZdjo9/Lu5lFmLJy89LlR
  Ln5QApEgApyijNgxsBi+pLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5tx0GmsKTmVcCt+k
  V0BFMQEdwuRiAHFGSiJCSamBS2aG4yFNtwq9rOgdbWfYm7XPKOxrQlmdkuurw5kulS8+JpDy8
  fPv1Pv0vkg/ZuwwNY/jKrp1b6Vjf+eRggfr+rlt/Gvgr1jyzmnDwgme22MEVxusytPdWcs9NZ
  8hQfvL3XWqyz64LXKan+BxmSHo/WxTsnR7smRx04VjQw596+wwcXbJD42//EnqxkW+9s4tcZ7
  npq3XLePPj9x7Yfk8oytOBc8vzbdazPmypFkvY6inK4ne4SMAvRI/nf//LcKm95yvjd2tVNj5
  g+dV8L3Upa/ijj/l9wpdDYxcmOs/3lm7jfNTW4Ztxwrz4cOHD/7tVvqS1sV36dvEmy6Vzs+Yf
  kQnqeSIkPfO5fR371UolluKMREMt5qLiRAD8eX7JZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1681117483!194658!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31673 invoked from network); 10 Apr 2023 09:04:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:04:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 65A541CD
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:43 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5AD011C7
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:04:41 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] texinfo: upgrade 7.0.2 -> 7.0.3
Date: Mon, 10 Apr 2023 17:04:19 +0800
Message-ID: <1681117459-24898-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
References: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179867

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* texi2any
  . fix performance regression when Perl binary extension (XS) modules
    are not being used (e.g. with TEXINFO_XS=omit)

* info
  . further fix of recoding of UTF-8 files to ASCII to avoid text
    disappearing from nodes
  . avoid possible freeze at start of a file with '-v nodeline=pointers'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../texinfo/{texinfo_7.0.2.bb => texinfo_7.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/texinfo/{texinfo_7.0.2.bb => texinfo_7.0.3.bb} (97%)

diff --git a/meta/recipes-extended/texinfo/texinfo_7.0.2.bb b/meta/recipes-extended/texinfo/texinfo_7.0.3.bb
similarity index 97%
rename from meta/recipes-extended/texinfo/texinfo_7.0.2.bb
rename to meta/recipes-extended/texinfo/texinfo_7.0.3.bb
index da455df4bb..b149177b72 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.0.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.0.3.bb
@@ -35,7 +35,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[sha256sum] = "a9c646bc4f6bb31843f129f8408a3a627334575faf7b22ebc416be5cb1570553"
+SRC_URI[sha256sum] = "3cc5706fb086b895e1dc2b407aade9f95a3a233ff856273e2b659b089f117683"
 
 tex_texinfo = "texmf/tex/texinfo"
 
-- 
2.34.1


