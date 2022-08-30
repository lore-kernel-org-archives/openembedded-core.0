Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05239C0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:25:22 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.7791.1661833519097084899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ny+kckY9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661833517; i=@fujitsu.com;
	bh=yoE81lCckMnGEMahOhks08GjCFnV4yiGy5EpysL6G7Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ny+kckY9VkGsXnCTiEvKzqUbFcFEaT/TwNRVzeF3qGyvPe3MUlaDl3br5so5pMX8l
	 Hk5VCPw1ZBqWjSZVaGdawEqgSJqpPjqwOCwngtXfgopyIJzjNS777K9jwnANrlKB9X
	 JVggclXJP2UnredLHwaz3cHZnydUvtBvZokxuPUJFIhG/g/Hag9xLw2/Ddb4GNFfLq
	 xE3VOQqmBmbXPCch7EaJoWNVNrzO0PM65MLTkpbdoVnrfuyzMxQN/g4uSi+YNMrOjG
	 DnvJjC+uefd2BYqrD4N1qWu+9eUSKtxqbOCDGrI9Y7Xe+/XSFpN03x/jpbS6Px+Byb
	 LBAn590oxL1PA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8MxSVd3Im+
  ywVQvizs/37E7MHqc27iCMYAxijUzLym/IoE149N14YI1nBXnp21jbmC8yNHFyMUhJPCYUWLT
  rwtsEM51Jok5x2GcvYwSr+9MYe9i5ORgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e8BKh
  AVcJJ5fagezWQRUJY5NecMGYvMKOEls+zyXFcSWEFCQmPLwPTOIzSngLDHp2hWweiGgmqtr3r
  JC1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJfbM6meCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrRKKspMzyjJTczM0TU0MNA1NDTVBZJGxnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIEBnFLMUL2D8X/vT71DjJIcTEqivAtbeZOF+JLyUyozEosz4otKc1KLDzHKcHAoS
  fBe7gbKCRalpqdWpGXmAKMJJi3BwaMkwuvdBZTmLS5IzC3OTIdInWK05Jg6+99+Zo7lYHLm17
  YDzEIsefl5qVLivOv6gBoEQBoySvPgxsEi/hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4
  NPUBTeDLzSuC2vgI6iAnooIdLuEEOKklESEk1MJlfqYpKj91r1yoYnGlkHNcfut/9/8nX77+z
  rLj2dduViY9yuS9K8J2KOLbFVXXBuxMJK/43T46Zs/rBVvflc1a3OeZc2f30adHejBv6B9fuf
  RN8KKj3tlrK4WyLE62sl/6pVlfNsp9cv5pjwVqznRxTrzDJG1woOfXoxu6yvD826srXme/t3F
  0lsprp+7+JIhckE/RsXQ4d8nll+kZqRseUVWtCRP/pnnomkZrEUd6zP80m1/mDganR9pPC0oI
  dzave+T4V7dlinKxX6aGq+a1G0aEg7Zdd9OGtWY/4VjPdLJrJsMB70TW57Qf+tmsK9L7exvQ7
  /90dx964Onu7QwoS65tXzDW9NS83Xf+B6hslluKMREMt5qLiRADWleHccwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1661833516!405033!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1399 invoked from network); 30 Aug 2022 04:25:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:25:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9F0821000C2
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:16 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 92BB1100078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:16 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:25:15 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.8.0 -> 1.8.1
Date: Tue, 30 Aug 2022 12:24:54 +0800
Message-ID: <1661833494-12657-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
References: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170061

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hatchling_1.8.0.bb => python3-hatchling_1.8.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.8.0.bb => python3-hatchling_1.8.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.8.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.8.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.8.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.8.1.bb
index 17a10eeb2d..bfdb664715 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.8.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.8.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "a4f982fdca0717d8c46bfe7b501302f90aaf2a5302845d550b49c8739681feb2"
+SRC_URI[sha256sum] = "448b04b23faed669b2b565b998ac955af4feea66c5deed3a1212ac9399d2e1cd"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.25.1


