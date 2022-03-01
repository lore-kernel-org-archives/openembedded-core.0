Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64575C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:42:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.6394.1646127733436347084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JAHwWfqx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646127731; i=@fujitsu.com;
	bh=wsK2gFexA9E0EcMGZGzIZAktLBCXNFPs0zSerai22bM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JAHwWfqxSyK4FdbSKPCVTxwE0AFVevgxmNQUtZA3oc9aGH3le6YRbnIIoA0GcnGNB
	 +5fBDCkTfYQDSmiQMy+2isszCkZX1cR+OktazGf8OpzHOqMFt0Gz+oUp0J8p5JznPq
	 ew1eYmo1gbgQtAWN92iAz+Ib3vpxE70b8LLe2rUXZbWddGnKa1NjD10o2aQ7/6sNSd
	 JDe2VsPevVLHOdN3qZm+HdX9iLVQ/LIYGRAiXA1m1gL3ZZArfhRy3MQOoeQy7VXNhr
	 m16pZL8/gVQ+TUsdajc5l6mnEcQkOYTKVxXC2BMJWyvNWMp3qs3OW8lbS8v+YDizb9
	 jD/rtxwq4Ij9Q==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 0F/8E-00700-37AED126;
 Tue, 01 Mar 2022 09:42:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqFv8Sjb
  JoG0Xu8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrHp5i+mgk3cFYfOnWFuYNzI1cXIxSEk8JhR
  4l3PJfYuRk4g5zyTxNZnKhCJ44wS7c2vmEESbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w9Yr7CAq8T3tdfAylmA4n3X97GC2LwCThKtd54xgdgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qg+pVk7h6bhPzBEb+WUjaZyFpX8DItIrRKqkoMz2jJDcxM0fX0MB
  A19DQVNdA18jEWC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAkU4oZPu9g
  XND3U+8QoyQHk5Ior9pN2SQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxcz4FygkWp6akVaZk5w
  PiASUtw8CiJ8PbcAkrzFhck5hZnpkOkTjHqciy+emUvsxBLXn5eqpQ4L/tLoCIBkKKM0jy4Eb
  BYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPfPC6ApPJl5JXCbXgEdwQR0xN9gKZAjShI
  RUlINTNm2Ffusd9hnRJw01TbfyHt6WibDsubvwj0Ra1a9s5hgzfE904xp19XFnx/NZ3d0uszK
  XMWXYLkvvONeQe6VQJsDb5OOHz9/kkfm1EvTn8ZCgfln3T7W9R698D8531ZLyNx0Qf0rzsNvJ
  k9WuZP3taBGe+uXc03x9tzxb/5yzjXqmG19s3/3jpKllzsMO4M7dLc1iFku8EtaL7JPJvPZwZ
  mJ1Xa2H3N8mbJSjm7+Ujn7pojlQwO+u+rynhkJRhcb55avefZWOfGQ7Qses4kzpKe3PnnYmRB
  wVPrZtui3vTp36haqv362ovCu995nfjlLQ60yU9p/dL8Wm8KtYpUsbOp+yOj9Ujev2hdcrxw0
  lViKMxINtZiLihMBYYi+G1ADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1646127730!3095!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30992 invoked from network); 1 Mar 2022 09:42:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 09:42:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A5918100190
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 09:42:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 99B6E100186
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 09:42:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 09:41:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.25.0 -> 0.26.1
Date: Tue, 1 Mar 2022 17:41:43 +0800
Message-ID: <1646127704-38701-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 09:42:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162540

Changelog from 0.25.0 to 0.26.1:
==========
- logind template: Add locking API
- bluez5 template: Add RemoveDevice() and RemoveAdapterWithDevices() methods,
  fix properties
- Documentation improvements, particularly wrt. raising errors
- Fix README content type to Markdown, to fix releasing to PyPi

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.25.0.bb => python3-dbusmock_0.26.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.25.0.bb => python3-dbusmock_0.26.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb
index 3a9cdda5f6..d892ac9804 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "6f4ce7650ecbb022684dc158df720e199635f3a3df75f7020f4fe8f6ff0394db"
+SRC_URI[sha256sum] = "0e95ef6ec1e6b58aeb0e08839a76972debea94184570f09e29e5f12551399e55"
 
 PYPI_PACKAGE = "python-dbusmock"
 PIP_INSTALL_PACKAGE = "python_dbusmock"
-- 
2.25.1


