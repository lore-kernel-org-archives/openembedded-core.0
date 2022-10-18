Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9471C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 06:39:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.3772.1666075157581165647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 23:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S+YMIotE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666075155; i=@fujitsu.com;
	bh=iTM+pq7O9m1LnOSxvK/gRFFSK+Yc2ENcfYHj212sKns=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=S+YMIotEh2HB8qsYZNjlUT4XN1C2LkQqlDUf2vNkP/T/sKVWsuVBO2zvanG/+t0ku
	 EsA1NVowhqaWotKYYfu9HqC11ONhFP8lok2t8JFkXfcXxxG+8lzVPiLzj13acPMDIi
	 zGffbdpg3V4DXl9Kl7YYCxg6cKxWOvyblugS44m41TOZsvk/ZJyBBpKZh5XOqyM/bB
	 KW0LsUvq+gWqFuLiYtsecHaxHEaL5AzAcllQLleBkG0Tn8xZi3W+Z/X/W24GYQlkeI
	 NiYekzZ/oEBtV+hM3oeOG6zWlT/I2y6CUcdGnAANd1SurOK6WQESRpWwS5XQDqLuiq
	 NajdroY1lmDWA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8OxWVfYyy/
  Z4ON8IYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePDvL9sBYeYKm7ducbawDiBqYuRi0NI4AGj
  xJUzT5ghnMtMEhtWbWGDcPYySvx+PR+ojJODTUBOYvHjqaxdjBwcIgJ6Elf/iYKYzAJKEg/2K
  YJUCAv4SXy9vogVxGYRUJW4cbgRrJNXwFViQvcNdhBbAmjKjtVPoOKCEidnPmEBsZkFJCQOvn
  jBDFGjJHHn12VGCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdM72kosz
  0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwEBMKWYv2ME4c9kf
  vUOMkhxMSqK8ApJ+yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeE+7A+UEi1LTUyvSMnOAUQGTl
  uDgURLhneYBlOYtLkjMLc5Mh0idYlSUEufdAtInAJLIKM2Da4NF4iVGWSlhXkYGBgYhnoLUot
  zMElT5V4ziHIxKwrwLQcbzZOaVwE1/BbSYCWhxxn4vkMUliQgpqQamoLcVO7iM4rZ2aas2TlC
  9KrhOndPB69SFhxNFZ6Q9+LL779tfvqdO/eES2DWvYmnttLTnCh7z3J60cQq1HnAv+lcYPWvm
  1XOyfr4p0xI4FjA1hf/bozZR+HrcycybV5ZypbUEp15bONusT/f7rjnfwqdKfbDc1OLj/DYyu
  +Zok23pO/dWG+5rJefKlqlPScm68mjG9oUCKUw7jxes53vBEH+gLPC+dDjbiZoCE/0LUy5uOy
  WzT2JGZsr5hvqFlpJnC7X3Mx6XO6OyMEHH9tGW9Y+ilXuyvrjrOF5qeXFy1e5kV2mnKZvP9iq
  y/RCZmLjbsvfIrFsTfDRDAze0zG27c88t/fkJkw5LK053H54JSizFGYmGWsxFxYkALrszTj8D
  AAA=
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1666075155!297487!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12477 invoked from network); 18 Oct 2022 06:39:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 06:39:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E5D54150
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 07:39:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D972C142
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 07:39:14 +0100 (BST)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 07:39:13 +0100
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: yanxk <yanxk.fnst@fujitsu.com>
Subject: [PATCH] Nothing to say. Signed-off-by: yanxk <yanxk.fnst@fujitsu.com>
Date: Tue, 18 Oct 2022 12:05:48 +0800
Message-ID: <1666065948-5932-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.218.229]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 06:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171934

From: yanxk <yanxk.fnst@fujitsu.com>

---
 nothing_but_email |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 nothing_but_email

diff --git a/nothing_but_email b/nothing_but_email
new file mode 100644
index 0000000..08b0898
--- /dev/null
+++ b/nothing_but_email
@@ -0,0 +1 @@
+hi?
-- 
1.7.1


