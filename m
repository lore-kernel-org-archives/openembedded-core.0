Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6B2C433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:38:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.62240.1638200335297094791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sL/vNDLP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638200333; i=@fujitsu.com;
	bh=W3uXu7DWlf5HOZ8X8rg1dTzC3yabA0YgoQnS663MEpg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sL/vNDLPyA/wBiAtiXCzKIdDOVeGszZq0dNTu9qbcqFE/pskt00XZPaemIpJTheRO
	 2+pduEkD7FKfUG22UO6ofMVYlNf+0TL8yiNiGC4NP6HMgcEXdSnlIhACYzIP7Au6Wa
	 loIHl3H99rxnkxsRhJL3wA2CrMx/kiKfe8ug2Fz8Tm4OJeFPxAyYX9j3vutJUWPrdh
	 mFYaW6rVV3PzfG6oRTKNkmH4+oVNbUxk6m3X+ilE+VmVsg3UVDWL32Rhzlp7dTztVZ
	 iH8uPt1fPvyof0P5jnkuejQcGwimER85YLliFVtc4uya4BNABoRxhvTxRQLj55gHzC
	 oZ4mIaymcNbjw==
Received: from [100.115.39.55] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id DA/07-01854-C04F4A16;
 Mon, 29 Nov 2021 15:38:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSZfny5J
  Eg54PqhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bS6TMYC/6xVvRM7mdrYFzE2sXIxSEk8JhR
  4vq350AOJ5Bznkli8ToTiMQJRomVD5YzgiTYBNQkpt+6AVTEwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBS4t/bh2wgNouAqsTvmcfA4rwCzhI7994Cmy8hoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZRYvblZhYIu0Ji1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypG66SizPSMktzEzBxdQwM
  DXUNDU11jIyBlopdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERiUKcUKRTsY
  53z9oXeIUZKDSUmUt/zTkkQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryNH4FygkWp6akVaZk5w
  AiBSUtw8CiJ8N4CSfMWFyTmFmemQ6ROMdpzvFm7ZBEzR9u9u0By5oKDq5k57rcfWs0sxJKXn5
  cqJc7bCrJRAKQtozQPbigsoi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua9DTKFJzOvBG7
  3K6CzmIDOert0MchZJYkIKakGpsm3l6hyfYnvNjo1M4PrAtMHpWmci46yZLF+6uVe2vl9i2zP
  +tAvcvuX1c4svZb1r++glBun++l5v+Z+XbYlLD1q7pWD7aqTTt5ayv/lYPS51TN1npTZZj9tK
  b0o+GF6Ifuhvyl31q27x3Wzqt3qQ8b21il3bXz7+FO27Gx5cmf+hF0vLyxfe2uXZEHgo77Lu5
  8pKhQXruS78zO0Sddih9ncv0GC5r8nfPrFpWL+7GcEy37r5eqrdq1eLzbzXoL5/2C5jA1vk2s
  qrkZnKmbWrr+vnTnVkCdGi/PfNY5tto6qV0OyGRJ157f8uHA2osf0VnJa1QLJdyfCQ4s/7+NL
  VdZ0jDzzx+afpev6Uy9Leg8osRRnJBpqMRcVJwIANkq7EWMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1638200332!10907!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7428 invoked from network); 29 Nov 2021 15:38:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:38:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 071F71AF954
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:38:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id ECE671AF1B4
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:38:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:38:33 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ovmf: upgrade 202108 -> 202111
Date: Mon, 29 Nov 2021 23:38:24 +0800
Message-ID: <1638200304-119240-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158953

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index ce3b650ddf..5b7fadab8c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,8 +25,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0001-Fix-VLA-parameter-warning.patch \
            "
 
-PV = "edk2-stable202108"
-SRCREV = "7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5"
+PV = "edk2-stable202111"
+SRCREV = "bb1bba3d776733c41dbfa2d1dc0fe234819a79f2"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.25.1


