Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.1270.1622078761343848538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 18:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r4S6/vNc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622078758; i=@fujitsu.com;
	bh=1wlUQaAiFwpjXRIqtr4ls0ljVDDqtndaGE+VSIieJvE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r4S6/vNc5RIBJM3HDckudxoetMfX2RdQUUOKsIUzagNvrB7g3ppOYeAcBU0BSVD/F
	 Dp2/VAbzbFesn4F3rkc6zEMW3DBIyb+rUc2DF/NEnOG5pfgli+JuZigl+pwZYfZFXO
	 uN8LXdrp7IUzmZHYcMdmBLxt7ReRrW0QiaqlCd80GMsYjw7RWCfkbyk6z6Cbe7069x
	 SbpnZ+4kinVzXshdrqce6ITdXIz5RQ5+G7zpwewNkuGQ+Ti0mltAmPwsxuFS6zjE5K
	 2M9Rno604WAQ7vGkiK1DQVwR2C34vCKDSVzdjjMFcn+wdObXMguhjAonQGed+eFkZM
	 /kPysxLWwhXJw==
Received: from [100.113.5.216] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 4B/C8-15146-625FEA06; Thu, 27 May 2021 01:25:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYoqv6dV2
  Cwe9Z1hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bZ5r/MBYc4K3b+ucPYwPiGo4uRi0NIYBaT
  xMGeFiYIZw+jxIUPO9i7GDk52AR0Jc49Xgtkc3CICOhJXP0nChIWFvCW6Ft+hRXEZhFQlTh9f
  gkLiM0r4CnRMG8mM4gtIaAgMeXhe2aIuKDEyZlPwGqYBSQkDr54wQwyUkJAUWL2dHmI8gqJGT
  O2sU1g5JmFpGMWko4FjEyrGC2SijLTM0pyEzNzdA0NDHQNDY11zYAsvcQq3SS91FLd5NS8kqJ
  EoKReYnmxXnFlbnJOil5easkmRmAQpRSyce1gfPr6g94hRkkOJiVR3msn1iUI8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuBlfQ6UEyxKTU+tSMvMAQY0TFqCg0dJhLfxNVCat7ggMbc4Mx0idYpRU
  Uqc1+AzUEIAJJFRmgfXBouiS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeaNApvBk5pXATX
  8FtJgJaLFQItjikkSElFQDk23Pry91p9rv79ovYm4+rVJs5v9npm//bZ1maPxKkyV2t+JaJc/
  p0vJxb9fEmPZYhFY4zPYtW2HNptS3ye7QSbXTebHz2V5n71im27bqp9GXMAeXwFxbN4PIgytd
  DqrXuK4J2hf2QTt0mnXTnB+pjG27Z6y0ut+eWd88Mbf88gnP41+vv0nKv88pnyqjeiD646OEN
  vcFjn63+HnNHtWdVDVJCBQMzWyx9d8Wk2y3rd3l60keMZeAymvnEnJEq7XZpzw5adq/TmhOiN
  M5loVrOB5Y+WWf/xO+6ey7sipGswVhFkKPZ9z4tsbWePaavTftVAp4TmRq3fN4cWbX5a9bHc+
  WLd9WLeU97axf4kl7JZbijERDLeai4kQAfKh8Bh0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-248.messagelabs.com!1622078757!63884!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14041 invoked from network); 27 May 2021 01:25:57 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 01:25:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R1Pvbx006483
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 02:25:57 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 02:25:55 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libtest-needs-perl: upgrade 0.002006 -> 0.002009
Date: Thu, 27 May 2021 09:25:48 +0800
Message-ID: <1622078748-116425-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...-needs-perl_0.002006.bb => libtest-needs-perl_0.002009.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{libtest-needs-perl_0.002006.bb => libtest-needs-perl_0.002009.bb} (86%)

diff --git a/meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb b/meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb
similarity index 86%
rename from meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb
rename to meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb
index c44ee6340c..2234f6a74b 100644
--- a/meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb
+++ b/meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb
@@ -17,8 +17,8 @@ DEPENDS += "perl"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/H/HA/${CPAN_AUTHOR}/${CPAN_NAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d5c96d51d8d5510f7c0b7f354c49af1c"
-SRC_URI[sha256sum] = "77f9fff0c96c5e09f34d0416b3533c3319f7cd0bb1f7fe8f8072ad59f433f0e5"
+SRC_URI[md5sum] = "5643cd323afb77d20363acbaf9b12bcc"
+SRC_URI[sha256sum] = "571c21193ad16195df58b06b268798796a391b398c443271721d2cc0fb7c4ac3"
 
 S = "${WORKDIR}/${CPAN_NAME}-${PV}"
 
-- 
2.25.1

