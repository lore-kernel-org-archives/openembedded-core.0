Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82B8CCA47F
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:30:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.36909.1656675011679221982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RP21oPQc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656675009; i=@fujitsu.com;
	bh=FpIYqIj5GHzQIP/16OOltfzDgr1kyCHHKHvowdLhkKk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RP21oPQckbbmeBbcxip0+WLh7W4S6wPqrquiz4IGdi4BA3EijGdHlby3PhwnXo/p8
	 0TatcMhPklG3o9Bjreq7YGNG/F9WmYfwN3sQTcPLwmRPTwyZ5x18gh7EIco9VgBnWW
	 YKMWTA0H8cDfMsr5B8XT4Qh6F0f74LgzQdMpvhssx7Zri02k4/AsXbPk+7RaIQZrDg
	 PWIOvRR6VHOxkGxGlWFa1kg1nn3djXSRsxDDsjoFltWs4PSbYOPdSujRL14FUrfGzG
	 huWzmzf6E7njzfzWbOK8ldvAYASjlRBLUEHTWq7JsHiltM3aIgf0a4lxS58nGqyIJ+
	 l68bAgY/kxXwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSffgrX1
  JBqde81nc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBn9J1ewFKzkqlj/bDNbA+NFzi5GLg4hgceM
  ElcutrBAONeYJKZ93McI4exmlNiw7R5rFyMnB5uAmsT0WzeAbA4OEQE9iav/REHCzAIqEi9+9
  7CD2MICvhLvni1gArFZgOL9938xg9i8Ak4Slyd9ZgGxJQQUJKY8fA8W5xRwlni4ZzIzyEghoJ
  ruNTwQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5uhxlRIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0TapKDM9oyQ3MTNH19DAQNfQ0BRIG+sampjrJVbpJuqllurm5ReVZOga6iWWF+ulFhfr
  FVfmJuek6OWllmxiBAZySnH65B2Ml/b90jvEKMnBpCTKe/XaviQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErx5N4FygkWp6akVaZk5wKiCSUtw8CiJ8PaDpHmLCxJzizPTIVKnGHU5Zn5tO8AsxJ
  KXn5cqJc779zRQkQBIUUZpHtwIWIRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMu+k60BS
  ezLwSuE2vgI5gAjpi57Q9IEeUJCKkpBqYGt8e3SRxJrP60+bf6emBR9t3/M7/3Tk/fuXRU0L+
  R56K/wqyP/7OLepekfVup/syH47H8ujNnSbz0tTF7uam09uK8lh3fvOVPNbRf0ey5Yq/ZGP/W
  fPu49MzOi6UpYsnh+x8qucc6nlRruT1VH7OG9kpKgHRd5ZmLz7lq7e31Ef114KwRPnWOVvez7
  xdaG3Gc92Ni/VMLtO28u9uqjkpcV0u3TuT5TbsDTra4mHBzrnYhk/2YecDXTPjQIMZFZff6v4
  /ctu0dM/0x56hKqsY/Io0vDdO3pqSZnRhuqrQ3O9p4otWfFKb82fy6x3LLx9OPvHp9ZwyjsMe
  xQrnzrx7HBMta7+lcbamy8pDdy/MUGIpzkg01GIuKk4EADd9BGdrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1656675008!8232!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32535 invoked from network); 1 Jul 2022 11:30:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:30:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8C9EA1000C0
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 790E61000C1
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:30:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 8/11] gstreamer1.0-python: upgrade 1.20.2 -> 1.20.3
Date: Fri, 1 Jul 2022 19:29:47 +0800
Message-ID: <1656674989-20458-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
References: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167462

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reamer1.0-python_1.20.2.bb => gstreamer1.0-python_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.2.bb => gstreamer1.0-python_1.20.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
index 34bc4bf4f4..57026ba73b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "853ea35a1088c762fb703e5aea9c30031a19222b59786b6599956e154620fa2f"
+SRC_URI[sha256sum] = "db348120eae955b8cc4de3560a7ea06e36d6e1ddbaa99a7ad96b59846601cfdc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.25.1


