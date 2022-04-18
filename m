Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0288C64EC3
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.38700.1650283976969863254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cQxk8Z2f;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650283975; i=@fujitsu.com;
	bh=VgVOqa5XqLxbqYSYZ3P2XuSEa/U7leajWD3hH+/32Vk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cQxk8Z2fuyac1DJi19fvcsauFM44EfNUHNWPgVx5g0FW7WmBMzhrgZAvM+XfeBEFI
	 rd3Wo2evfPkkfWX4Ymhs5JyGwxeWNgwHt9z06xcZLkeSCV3qM542ARBQ78TjOnoEQb
	 1RnqQOmPFlvdUbIGalme9wAHRC4n5DPL7VVftgDg/9uDECKjIHu74IKvYEs3HLjfpo
	 tF6pPkmXyHjyY23C1NTe/37lG93Pk9wgEl9qQFlIvWpoGpX63aBzvHxMoweXnYj20M
	 ibHQfX5nCsnfDPqh0NbWGmEVL3aZoeppyekueFNJDtNl1us11WGvRozDEwZlNRKG+R
	 fibjAPRHj2sgQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8MxSfdYaGy
  Swf5VqhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b0Lw9YCx5xVqz69JS5gfEuRxcjF4eQwGNG
  iT8b/rJDOOeZJJqOvGLpYuQEcvYwSqy9kghiswmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJVER+s6RhCbRUBV4taDP0wgNq+Ak8Tj/ilgcQkBBYkpD98zg9icAs4S065uYoJY5S
  Tx//d2Foh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWMdklFmekZJbmJmTm6hgYGuoaGprpm5rqGZmZ6iVW6iXqppbrJqXklRYlAab3E8mK9
  1OJiveLK3OScFL281JJNjMBQTil2XraD8V3fT71DjJIcTEqivP99Y5OE+JLyUyozEosz4otKc
  1KLDzHKcHAoSfC2BADlBItS01Mr0jJzgHEFk5bg4FES4eUIBErzFhck5hZnpkOkTjEac1y9cm
  UvM8cNECnEkpeflyolzvskGKhUAKQ0ozQPbhAs3i8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52B
  UEuYVDQGawpOZVwK37xXQKUxAp2yfHwlySkkiQkqqgYn/xRYLJaXGb6FSBVb33SfX/dzw3kC0
  pPW3zb/4ZQZCt2Y0XToZ9uLnher41q6uSdMlpMS3b7xd8Kg4ONF29oWHHlrzruz7xNmzy3jXy
  lWa7/QbMxXf9BaUrDWZMOeAQEeoiXqjQZBDr+Tx2qfRJnxiCyaELl1icbJ2mfNHqdsrOnkipl
  lYTpPSmLXCrCpYZ4qeFatW0gK7lQoT3pS39T3fHrT9zwNLkWj+jzn+slXxn2w9lrutZ/2SFVi
  pyhqht9PVoPl0pMO+RrGI28mX1/8KvPTqLs+XE33bRdXLGvWNegKNZz2Xuj9pboOQ65zo8DtL
  TwXL3pbcYd7+77/luhSrbW3VPRs4VNa7avDwK7EUZyQaajEXFScCAAxdqZZyAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-545.messagelabs.com!1650283974!198786!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14269 invoked from network); 18 Apr 2022 12:12:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-29.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:12:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 22190100476
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:12:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 15359100441
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:12:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:12:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libgit2: upgrade 1.4.2 -> 1.4.3
Date: Mon, 18 Apr 2022 20:12:22 +0800
Message-ID: <1650283944-16485-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650283944-16485-1-git-send-email-wangmy@fujitsu.com>
References: <1650283944-16485-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164593

Changelog:
=========
Validate repository directory ownership (v1.4)
midx: Fix an undefined behavior (left-shift signed overflow)
fetch: support OID refspec without dst
Fix crash when regenerating a patch with unquoted spaces in filename

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.4.2.bb b/meta/recipes-support/libgit2/libgit2_1.4.3.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.4.2.bb
rename to meta/recipes-support/libgit2/libgit2_1.4.3.bb
index 88bf5a8520..7e27b5b018 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.2.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
-SRCREV = "182d0d1ee933de46bf0b5a6ec269bafa77aba9a2"
+SRCREV = "465bbf88ea939a965fbcbade72870c61f815e457"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


