Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B09C4332F
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:27:35 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.32951.1635172054460848282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Pr4mt901;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635172052; i=@fujitsu.com;
	bh=9h/SgFsKB9TVb8p52j8RTARX9DT+JUH59w5sBmQCSsU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Pr4mt901ni8tWwOSIYy1yU6LnYXdRBqk3EY/TIOa8yy0AqyCvjQdGIa44MiicHigZ
	 4PfckGJN5yO5HYK1sJqG3/FgsX11rg3p5zfpIkN1IRs++Cel8pQz8mKotg4CNJxwhy
	 YYX6i97an6gphFe/qZ3Bqu9cJFiDiCPYrjxps9/WkuvqNusTr8yGzZc7LupcZ1HYTQ
	 uQgRarTW1s+LkGPV2xtO5tXA1QjDCdTeC7V96mWHNIqh3UXY31WHggeMdDjJdMoxai
	 W4uUHRFIJ+qe5q0aurjEKNVszNu/MECQpahsjz+AhRERY+hZ0LIWLVonJnuTi088ur
	 47Nxqgx6xnB9w==
Received: from [100.113.6.252] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 04/D4-01506-4DEB6716;
 Mon, 25 Oct 2021 14:27:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRWlGSWpSXmKPExsViZ8MxSffKvrJ
  EgxVX+Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxnfSdYCyZyVNy6N4etgXE2excjJ4eQwGNG
  iZlL1bsYuYDs80wSN3aeYoVwTjBKrHz2lAmkik1ATWL6rRtACQ4OEQE9iav/REHCzAIqEi9+9
  4ANEhawlrh9+SILiM0ioCox+eBKsDivgJPEnGvNzCC2hICCxJSH78FsTgFniV8XHrJAHOEkce
  32HkaIekGJkzOfsEDMl5A4+OIFVK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMlklFmekZJbmJmTm6hgYGuoaGxromuobGBnqJVbpJeqmlusmpeSVFiUBZvcTyYr3iytzk
  nBS9vNSSTYzAAE4pZGnawfj71Qe9Q4ySHExKorxn5pclCvEl5adUZiQWZ8QXleakFh9ilOHgU
  JLg3bYXKCdYlJqeWpGWmQOMJpi0BAePkgjvqT1Aad7igsTc4sx0iNQpxnCON2uXLGLmeAsm2+
  7dBZLtYHLmgoOrmTlmgcn77YeA5AMQKcSSl5+XKiXOGwuyTQBkXEZpHtwyWLK4xCgrJczLyMD
  AIMRTkFqUm1mCKv+KUZyDUUmYVxqYeoR4MvNK4G56BXQuE9C5frolIOeWJCKkpBqYeDa1L1l8
  O/vl4XtHT8fdndjOstOBr1DSOT/c4exG9oqJcd25gif5ek7cPiSxcvL6/4uq+X81Ge54Wlz16
  8Oil44hwddkT8a8k3Xba3tu+6LCW5s3lmjpa0Xf3mzYfTt+69nPxqbz97NOXM6ksOvR6ZWLC7
  40XMt+aS1oqPdb5euWSr14U+05qyKZFfcoFSs8/BryebJG960cmYlGEawPPLVd/6xeuc7nU+n
  vuTOZJE+UiH5YeY/ZY7dS4G6+jnMs7IfmZu2YNqPZ7fUbp76L07NXX+yfe/ZtzNr0X9u/a291
  nvu7+M6uJmkujruXrOUS9TVjlnnaX3DUWP70y46Xu06Y7a1oNjlWUtovMDlIpEGJpTgj0VCLu
  ag4EQB9CjMHkQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-245.messagelabs.com!1635172051!289450!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16688 invoked from network); 25 Oct 2021 14:27:32 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Oct 2021 14:27:32 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A6A30100465
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 95F87100455
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 25 Oct 2021 15:27:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdnf: upgrade 0.64.0 -> 0.65.0
Date: Mon, 25 Oct 2021 22:26:55 +0800
Message-ID: <1635172017-18309-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
References: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:27:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157343

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnf/{libdnf_0.64.0.bb => libdnf_0.65.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.64.0.bb => libdnf_0.65.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.64.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.64.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
index 38d3307b11..78f2002040 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.64.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
            "
 
-SRCREV = "e5ecbc1e5062631f44cb94a3b73d9310db0ff386"
+SRCREV = "cee3e1c59f849d9be1bb8d7db3090cea5c59f4b6"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


