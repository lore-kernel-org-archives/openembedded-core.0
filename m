Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDC4C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:22:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.4845.1665476527181681892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bfCZ3RR0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665476525; i=@fujitsu.com;
	bh=CM78Jrl29svoIStoL4OdMjYwv+CZjIabDrAFAOY/8vk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bfCZ3RR0HvwTUl86HlG2ACGhfxYawIFUlYsvVZFOyVAAxU+Fy7jg5Qeu6ibVAQXpN
	 Z/HsHcCT5PeJE8DaqaVd48U4NR2pyqwtS/OIoguvmvgt17YAVAx+iToIt+FJb31VzH
	 mfA+ZmY7mj+ndDoHecLCBq8tEiZdqD+QRljP65t5KgWzN7p3Chr6OX94HodzC0LaLV
	 T6bgRdQZWi/imonJzQtuWgQ+kLBIGIWhApuasV/EBWTzFPr/IYrMgHZJSLHPhXkn/Q
	 J6ljbP6D634qSM+ws1jtPvZS9eaD8uLiFId3fGJ/7TNQeDplo8M/7Iy1gycD7/cxus
	 2Wr2rO7+kJ8Ww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWXeNumu
  ywYkj2hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bXjx3sBfvZKpr6yhsY37J2MXJxCAncZ5To
  3PqWBcK5zCTReXoWVGYPo8T1P9uYuxg5OdgE1CSm37oBlODgEBHQk7j6TxQkzCygIvHidw87i
  C0sYCMx//tfFhCbRUBV4vrKxWCtvAJOEnu+TmIEsSUEFCSmPHwPFReUODnzCQvEHAmJgy9eME
  PUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWidVJSZnlGSm5iZo2toYKB
  raGiqa2yqa2hhopdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERiUKcXKO3Yw
  tq36qXeIUZKDSUmU9+pzl2QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwvVF2ThQSLUtNTK9Iyc
  4ARApOW4OBREuFdqgKU5i0uSMwtzkyHSJ1iNOa4euXKXmaOmV/bDjALseTl56VKifO2qQGVCo
  CUZpTmwQ2CRe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8K0Cm8GTmlcDtewV0ChPQKSe
  vOoGcUpKIkJJqYJpyTlpP0ujy3euRD7/IcUwR3W+1MnqngOSJW1FNKy4VrxDiO2IdO8muS3ZC
  QMn6/47dWfO8PW9YP5x2XITh++pyO/9bKgrmUmd3veq31uzPmfZwnfQX886dz+zqonT01tw/6
  Vn/vnRBUeQWVwH9thoLfu0b4m8vzH/cdnLL2gtcwd82urY0y1R5sa6bvy9Uny9cK/v3DodJnj
  XXLSynrtyZObkk522ewr2iB6LBi87/DIybvX+auXrPrGdJc4/tOVhquO3h22d5Zu08jTk3Zvn
  4H9ma5DjJRaBc/8kDmaqLQvdOZa6ZOz3T4GOHQ0tb+h2TYId9d6z6Cs5JWd+QvbwjUXLnXOGM
  jMW6vrJpUkosxRmJhlrMRcWJAD/3MypXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1665476524!101709!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13737 invoked from network); 11 Oct 2022 08:22:04 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:22:04 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6D9F37C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5C868154
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:22:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] numactl: upgrade 2.0.15 -> 2.0.16
Date: Tue, 11 Oct 2022 16:21:44 +0800
Message-ID: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:22:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171606

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/numactl/numactl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 712cf0203f..23be0a3b4f 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,8 +10,8 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "01a39cb4edc0dd0f4151b7ad11e0c56d2e612a02"
-PV = "2.0.15"
+SRCREV = "10285f1a1bad49306839b2c463936460b604e3ea"
+PV = "2.0.16"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.25.1


