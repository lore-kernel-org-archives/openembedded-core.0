Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.7252.1623313924938070626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 01:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZAOVT7Np;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623313922; i=@fujitsu.com;
	bh=fxKPzUw285SV+Qzq3FnYJaGPUIQsiuKheDgAIu85FvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZAOVT7Np6Y1E+lBZcdKkad822tp68GI6Xmm9gB0bbW83TuQ9GJBWkkqCtH3xyrQkx
	 ofwLjEyiUJmZ41YxtAGAzNq73q6Y3MriMYKCLLAHUpL7Q23rKUokpTwYUHB0AaqOK3
	 XfpJxurAC69Let5Rf7E1TytCXPOrjaiR2JJ1lbCKDFQEfK1dioSrgjCRacoJZ7rmQc
	 UgV8kVZACPFO4kq3m5jWgu26bCEboF9PPUXISBV42DHJ82CUN4t/HOGkR0QFVDEcWu
	 Vp3p8iMK/nP4svZN654DIQ6H+82Y4ruYaXtFyufcR6qz/rU9TdYI+yPrF8hnvuNy49
	 CzDVeTSZx95Ag==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id A5/AD-19780-20EC1C06; Thu, 10 Jun 2021 08:32:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVZfp3ME
  Eg0cXuC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxp526xFxxhr9j6NKyB8QNbFyMXh5DALCaJ
  I18fs3cxcgI5Jxgldi1wB7HZBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHrByYQFjiR2L5
  rGC2CwCqhK3t08As3kFnCT2Xn3EAmJLCChITHn4nhnE5hRwlpjccYAVYpWTxIOVt9kg6gUlTs
  58wgIxX0Li4IsXzBC9ihKzLzdDzamQeH34EvMERv5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9f
  QwEDX0NBY10jXyNBML7FKN1EvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERiMKYVMN3Yw
  fnv9Qe8QoyQHk5Io7+0FBxOE+JLyUyozEosz4otKc1KLDzHKcHAoSfCeOgOUEyxKTU+tSMvMA
  UYGTFqCg0dJhLfyLFCat7ggMbc4Mx0idYpRUUqcVxYkIQCSyCjNg2uDReMlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8oSBTeDLzSuCmvwJazAS02NF4H8jikkSElFQDE/OVuDs7/ygdL+a
  yni/amcbzhemh8wMF5+mFC+yZXcSXqDbd9rBPUUzPehKmfO/Yv1oFm6oXW9xKOKsEOxcoerx7
  yJvOq+NVPVOww/B/U4PY2vsfNKvjOjdovJWfl98fLqH8Kbrx9NEp3XMuv4oJqp72Ym2r7HvP5
  7a/qq8rx9j+C7LwiJdY//t0Q7FD9hELzcdLitQeuoZsDlixtaJcN/3L+w77i+4iVZ+S305wW6
  H5/vdyD7WMH5F3Jiy13HC2+tTTqAlZ62XeRb76rXmm9TdnLovttfDaPxzmk4WeyhsvdRfKznv
  gulfowdU37v6KH419N1/ZXXS8aH/Sb/FljAaVdsxKOn97TeSOu+9RYinOSDTUYi4qTgQAB2aB
  1kEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-228.messagelabs.com!1623313921!49097!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7851 invoked from network); 10 Jun 2021 08:32:02 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 08:32:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A8Vw5X017392
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 09:32:01 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 09:31:56 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] less: upgrade 589 -> 590
Date: Thu, 10 Jun 2021 16:31:37 +0800
Message-ID: <1623313898-45731-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623313898-45731-1-git-send-email-wangmy@fujitsu.com>
References: <1623313898-45731-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/less/{less_589.bb => less_590.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_589.bb => less_590.bb} (93%)

diff --git a/meta/recipes-extended/less/less_589.bb b/meta/recipes-extended/less/less_590.bb
similarity index 93%
rename from meta/recipes-extended/less/less_589.bb
rename to meta/recipes-extended/less/less_590.bb
index cf459a382d..82a2312642 100644
--- a/meta/recipes-extended/less/less_589.bb
+++ b/meta/recipes-extended/less/less_590.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "a15cd502196c1fb2c1f0235db19d4baad564d07be00df42281d6f1f056f5dda8"
+SRC_URI[sha256sum] = "6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.25.1

