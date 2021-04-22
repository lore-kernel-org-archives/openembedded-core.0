Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web11.9037.1619076517719996499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gk136kKe;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619076515; i=@fujitsu.com;
	bh=+ZByG+xxQUfs84C//Nzs9+gTpgBpeRBTzURX60tp6Xc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gk136kKeaPxjyX3Z01eVELvwD5AWsV7AvfrGnhUA121iz3ssReb0dytf83+/dTy7O
	 IGav385pRcM21UcSs9gjSBQEnnr0O2g2TAWtMMCGEAcOe8xwaXKJ+mXX5PjlZFi8JT
	 1Qb6ezceAYLT99wEbeuPmq7+gGZrVkZnBgj2SbOce2qsaimks8CVzpAN3RzsX7zzgl
	 b3sFmFerTasWg+vdL0FXMlejEjwhhGkgc6zXHsFamWquzZHf3NtChgbf28Jx0zWxKY
	 fzsNtg3T5tkm++HM+GdZ4BaJBMXZnvkc9M3KHEPNWURjxOO8f08RSgwIGgfOBbfEHS
	 hR4N0bDMklofQ==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 4B/D3-23163-2A521806; Thu, 22 Apr 2021 07:28:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0V2k2ph
  g8HSntMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrGx4w1rwW6OijP/frI1MJ5l72Lk4hASmMUk
  8e/8fmYIZzejxPsb/4EynBxsAroS5x6vBbI5OEQE9CSu/hMFCQsLeEjM297JBmKzCKhK/O56x
  Qhi8wLFpzd/YwGxJQQUJKY8fM8MEReUODnzCVicWUBC4uCLF8wgIyUEFCVmT5eHKK+U2D7tLO
  MERp5ZSDpmIelYwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY10TXyMBUL7FKN0kvtVQ3OTWvpCg
  RKKuXWF6sV1yZm5yTopeXWrKJERhGKYUsZ3cwfnn9Qe8QoyQHk5Io70K+xgQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKEryKykA5waLU9NSKtMwcYEjDpCU4eJREePeApHmLCxJzizPTIVKnGBWlx
  HkjVIASAiCJjNI8uDZYHF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMybDDKeJzOvBG76K6
  DFTECLtafUgiwuSURISTUwcW3cd2nDm/kSLxLmzZc+wnXsnQNP+N2wrTyyd7ZOCzxhyzd9yjf
  WT+zSB5vn3vS4rB95zei5Az/DdOVty0wr3jYuW2qq+tm56EjKhMUsmRLCAZETXZyXbVG1N7CT
  3BCqybxmuYTUY8MdE9QmzDM/fEvj3+Rr7Ue2HP8jc2zV2cKyCTH7mPJf51XWBd65fEPyw7mK/
  fd3WXSG2zYtlHE8suK5C79mrYfw3Mwc99nn2Q92Xnzk3bN4mpjLXN2/3Yc99zF9+D7x/2XRzV
  u+hcS4/src+fnt4WWnwq2mZpzSXVVS/Td3148/P5aqhAY+LFrQFXQpVn/6FOa+8knse26d1/B
  0urE2R+evmAi37MJZ7O+VWIozEg21mIuKEwGdsUomHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-238.messagelabs.com!1619076513!2989804!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29399 invoked from network); 22 Apr 2021 07:28:34 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:28:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7SSbg002815
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:28:33 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:28:26 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libedit: upgrade 20210216-3.1 -> 20210419-3.1
Date: Fri, 23 Apr 2021 00:00:18 +0800
Message-ID: <1619107218-54318-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libedit_20210216-3.1.bb => libedit_20210419-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20210216-3.1.bb => libedit_20210419-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20210216-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210419-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20210419-3.1.bb
index 97aceaf716..a34b773288 100644
--- a/meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210419-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "2283f741d2aab935c8c52c04b57bf952d02c2c02e651172f8ac811f77b1fc77a"
+SRC_URI[sha256sum] = "571ebe44b74860823e24a08cf04086ff104fd7dfa1020abf26c52543134f5602"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1

