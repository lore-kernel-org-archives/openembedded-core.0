Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F33C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:01:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.187.1668308460936116041
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=guXy6/jq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308459; i=@fujitsu.com;
	bh=Lcn4XOXi7QPIvoh1beSkYgF18D5p2PgWMU37ZU1ORmw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=guXy6/jq8e6lzbqR6/J/GpwyL3cAdDvFgzv7j6G8hKUXXeK7/EimHCNQKywEkuXYP
	 o+cv7h1co/F972IX9STloYX160BxY8c5qzXHAcDcH5NkBj5Ie64dGB0G1uSzsveRaq
	 igL2E8O5cnWjF/Qy5rhgZ/B3ll37QBWO2l1KhNVAkNTEoUcSgFShdSkrgyNrBI2mXF
	 C2ZTrgYKiMOWq+N4AHdyLYEAr5/U5/E9pdhTLhmLtRTc8AVyW82jhi8DlHPUR41zVm
	 KY5gnOF8o4k7uKWApWuqp8dm0dnxafDFDZMtleR7kmRaVb8mMZiTmMp+g+4ONCrh3E
	 8B0IKXHKua9vA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqPsqtiD
  Z4M1GHYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaOz7SFTwQ7uiimdx5kaGFdydTFycQgJPGaU
  ePRmCjuEc41J4tXhX8wQzh5GiXUH17F1MXJysAlISdy4/x/I5uAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSzgJrF/wVuwchYBVYmF38+wgNi8Ak4SK769ZQSxJQQUJKY8fM8MEReUODnzCQvEHAmJgy
  9eMEPUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWhWnFpUllqka2igl1S
  UmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYjCnFLPE7GB8u
  +6N3iFGSg0lJlDften6yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne35EFyUKCRanpqRVpmTnAy
  IBJS3DwKInwVtgBpXmLCxJzizPTIVKnGBWlxHklYoASAiCJjNI8uDZYNF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMy7NhpoCk9mXgnc9FdAi5mAFn+PzANZXJKIkJJqYNI71/jKneNiGpN
  AV5OPyDLG9NcBZ5b3d7kmri3tC/QSO76/q3DSriMPXu6a4FXH8vDXt4ecTT62XTwPeJwFe/80
  ifuuvv9IM+h2V6dRz5rPjyP+1QVfihbQm/68QZXl9+FNv7f7Nq3jL9q71dbXvePoTK6ekiuGz
  uaZe/PfqOR9fXn0/eqHV3LPZTzWL/CtrrOIZG4LDJmw8s65dg2B1LR/vy5szUx3O8db9lgjOc
  pxVkJPGad0w/RzHNE3zZbdSzt9z2LalibuTLm5n9WmvDSZ7uQ62cjEzu1CTnfo7Aeeb/Jr28/
  deV39w5sn5n/aMQeWP/xVZ87m/TintvJwjEZb8bey//tfffzXn3BqsRJLcUaioRZzUXEiALpZ
  7WhBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1668308458!781925!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3777 invoked from network); 13 Nov 2022 03:00:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:00:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5B06D10019A
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:00:58 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4ECEB100194
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:00:58 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:00:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dtschema: upgrade 2022.9 -> 2022.11
Date: Sun, 13 Nov 2022 11:00:40 +0800
Message-ID: <1668308440-14720-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173172

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Rework exception handling to better handle Ctrl-C exits

- Various updates to README.md including examples on running different
  commands

- Allow using schemas for validation which fail meta-schema checks. This
  will allow using schemas which have failures due to new meta-schema
  checks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dtschema_2022.9.bb => python3-dtschema_2022.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.9.bb => python3-dtschema_2022.11.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.9.bb b/meta/recipes-devtools/python/python3-dtschema_2022.11.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.9.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.11.bb
index 3dcbc2dcb2..fd87db2c2b 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.9.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.11.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "c9533312a2d77c4ccdbffda1504aba850d9b224fd8b43e929cee2aa68478e82a"
+SRC_URI[sha256sum] = "825e51b8bb82a2d4833d15c25ff2b9a3f5a53b36a490d7c4b6b136037e823320"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.25.1


