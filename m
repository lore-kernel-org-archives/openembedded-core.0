Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EFBC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:07:17 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web12.13332.1636470435965570158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XddQoSbX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636470433; i=@fujitsu.com;
	bh=UxtEmqFvt4enDqadhlBRh6OzAE1u1PFaQ7q/u1IM/Ds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XddQoSbXR0HYCcux5XgyJ3cXr1H7Z/zyRGLLHOjBytppb9JrV05/ecojVuZb/sBXB
	 eZgtIdYfm6JEQQ1igldAPvqczutY7pZY1V93gNIkdFsOfvWTxkQ8tckqgzgXaM2Wmz
	 ZUQV488fWKDMxHHX87FrBD3Jb+Wexn3ugtyEQNT5t8NuTFOGsa9nI2O4mHic0TdDLh
	 LqJ/NcVOI6a6CYZOmjBB92Bjoc0RbPu1mpHfCm9Scx9zq0l7dewCNOuHrypxQSOmAY
	 Pqoe0sWeljeCcXRLpadz0TGoG782s0Vz4K08ny/zL6rzzEfhI2bTuYNjCUm6TKNRlx
	 drWlf1JMFwIsQ==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id BD/4B-11692-1AE8A816;
 Tue, 09 Nov 2021 15:07:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVXdhX1e
  iwcKXEhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b5DpWC3RwVnW95Ghifs3cxcnEICUxnkmg6
  2AnlHGeUWDNxBlMXIycHm4CaxPRbN1i7GDk4RAT0JK7+EwUJMwuoSLz43cMOEhYWsJLY1ygDE
  mYBCj9fN48ZxOYVcJJYsuEdI4gtIaAgMeXhe7A4p4CzxJMFj9lBbCGgmov3L7BD1AtKnJz5hA
  VivITEwRcvmCF6FSVmX25mgbArJGbNamOawMg/C0nLLCQtCxiZVjFaJhVlpmeU5CZm5ugaGhj
  oGhoa6xrpGhma6SVW6SbqpZbqJqfmlRQlAmX1EsuL9Yorc5NzUvTyUks2MQJDMaWQ6cYOxm+v
  P+gdYpTkYFIS5f3X1ZUoxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3C0hOsCg1PbUiLTMHGBcwa
  QkOHiURXrEOoDRvcUFibnFmOkTqFKOilDhvfz1QQgAkkVGaB9cGi8VLjLJSwryMDAwMQjwFqU
  W5mSWo8q8YxTkYlYR5k3qBpvBk5pXATX8FtJgJaPHBL+0gi0sSEVJSDUyGn05NSWBhr7z8Udp
  sOrNC5PtSJZP+DI/s2dF59U0ZOjIvDsc+WLjKf92xa53nClmmOujURNy945PwdtW2hSdeaYUa
  d7fPWPF/jZe26RLmgyV/T/kw7bt68kBd0wr+BeYZNccDZMzV6rhvbGY4mjjn9sP+uRFXl27jD
  RbdJ7/zr9K5ECanpdO+JR93tOi+q5V844rkjeDa+VOM9k57VytSeSH7+aIajhyDpluF5w/Jvj
  OdHHliT1HMxi1K/7YIJH6/FaZ+3cL+TVPU+4iQT0YH+vQ8fk/b3cVQaJGVvr63Tzrk8aTq2+p
  XeFTqOKyvxq9otZyhlbu7p8k6r+mB8ISfM54a//8fLSjpPd1YoVmJpTgj0VCLuag4EQCY8OCT
  QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-232.messagelabs.com!1636470433!11521!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30795 invoked from network); 9 Nov 2021 15:07:13 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:07:13 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A9F76Kh013464
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 15:07:13 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:07:07 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.18 -> 1.8.19
Date: Tue, 9 Nov 2021 23:06:54 +0800
Message-ID: <1636470414-60993-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636470414-60993-1-git-send-email-wangmy@fujitsu.com>
References: <1636470414-60993-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 15:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158055

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.18.bb => msmtp_1.8.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.18.bb => msmtp_1.8.19.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.18.bb b/meta/recipes-extended/msmtp/msmtp_1.8.19.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.18.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.19.bb
index 1a6cf72392..29f0e07fe4 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.18.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.19.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "14fc62af37ebdcc5ed19a245a05eb8376efe7016118f00c9c594bc999d5560a5"
+SRC_URI[sha256sum] = "34a1e1981176874dbe4ee66ee0d9103c90989aa4dcdc4861e4de05ce7e44526b"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.25.1


