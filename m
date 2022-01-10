Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E658C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:02:55 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.31994.1641823374288485218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MZi5MZXA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823372; i=@fujitsu.com;
	bh=yDpgjf5M4ljLrRwEUitUPVGetEeRHGqp3gyiwKxh9c4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MZi5MZXATd1kMoqsci6Bp3IT1IsLvxcEt0dMVgZx3mcWxknir/qFTHR7QHzZ002Qp
	 KMQ1+1ZDorrAHTTzTOwBGStbLi9heOWn0alI+WQ73pjwqJ9+nl33u25q625wUmNLoo
	 mmo/G4BdCdwvQx2NQeKHJQVbI3x5/8VDxbk38V9NLD2uBIXMSXMe4YtV6du8MrLmNq
	 bNvWElwdDaY1s7b0d51VfNE/kD0K7jJ4DM7E23saHOCrdgydDcL0pn/aSkhXVnwqzz
	 Vm4BM4mgaBjmHYlM0LemnyljAGrY4tNA4w83CzqJQoKHZLIwDhxDBiB6A4gHVccztx
	 VJpZuSSFgX7VQ==
Received: from [100.115.64.12] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 1A/96-24146-C8C3CD16; Mon, 10 Jan 2022 14:02:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleJIrShJLcpLzFFi42Kxs+FI1O2xuZN
  oMOMOl8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH2jXbBco6K3qm/WRoYd7J3MXJyCAk8ZpTo
  niDUxcgFZJ9nkthxZDcjhHOCUeLMoZ2MIFVsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3D
  9ggYQFHiW1LDrGB2CwCqhLfv60Ba+UVcJI4dXgdWI2EgILElIfvmUFsTgFniQf9M1lARgoB1X
  x7nw9RLihxcuYTFojxEhIHX7xghmhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0S6pKDM9oyQ3MTNH19DAQNfQ0FTX3FDX0NJAL7FKN1EvtVQ3OTWvpCgRKK2XWF6sl1pc
  rFdcmZuck6KXl1qyiREYxinF7vt2ML7o+6l3iFGSg0lJlPeJ8Z1EIb6k/JTKjMTijPii0pzU4
  kOMMhwcShK8CZZAOcGi1PTUirTMHGBMwaQlOHiURHg1QNK8xQWJucWZ6RCpU4zhHG/WLlnEzP
  EWTLbduwsk28HkzAUHVzNzzAKT99sPAckHIFKIJS8/L1VKnJfXGmicAMi4jNI8uGWwlHGJUVZ
  KmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvAchRPJl5JXA3vQI6lwno3GSO2yDnliQipKQamGy0
  f0ryul+59d/q76KOt3yhh2cyZvBr8Uw5uGeCjZxpeR/zlrW+9/0NhY8fqlygUV2/dubRWXsKj
  gV+Xrx87mvrmhvrIrXDV6gGuGn17Zy2ZfIRjoqmhBwO/csnXHombXild3lK56nNW+LmciyyE/
  KxavkQH1nVaqN+3yOG4U2M13XH3T8XB1S1Ks/7zXoqou1Y78ECWbPpEzKu/jiRJuMxlyM6J3Z
  q0pUZ78+x9GVcysv3VD4Q0Cmj4HAzv6JN2aZM16moSNJ1LmPNWretc+Y1reXQvXwi2SDRTaf9
  97tVB96U79jjuuiBisft0ECzrYYa30+fcf/9/FybxYbyLyseSvvOiF34/aFa70Oj80osxRmJh
  lrMRcWJABrAwjeUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-545.messagelabs.com!1641823371!24052!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5059 invoked from network); 10 Jan 2022 14:02:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:02:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9A45B100197
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:02:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6F9A21001A7
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:02:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:02:47 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 0.17.7 -> 0.18.0
Date: Mon, 10 Jan 2022 22:02:30 +0800
Message-ID: <1641823351-62709-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641823351-62709-1-git-send-email-wangmy@fujitsu.com>
References: <1641823351-62709-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:02:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160354

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_0.17.7.bb => createrepo-c_0.18.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.7.bb => createrepo-c_0.18.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
index 0c27756d2a..e249b767ff 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "c4e6808c710ec68e56bd93b0366f3b6cbeee3167"
+SRCREV = "09ea861c8ef11927de5a276116ecb83ab8e93462"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


