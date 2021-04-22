Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.9037.1619076538318878918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=w4WHs/Z0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619076536; i=@fujitsu.com;
	bh=/veaBA1EPRV9oRE9Sqd+lykOTpTOoHMP+AQkJH0aJpA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=w4WHs/Z02WpV1jhvGxXhsVhuRFyadvzSK3lvmWECORVtIzt3axzSrRKNDYb2GS+Et
	 9CSqR3mYRMlO9C0Z8xCg5q5BSkvXGRgUb3vyp2bOuS8IBmOSk3UvrvVLM/moLnQw/T
	 UQyA7KjsZfDEyLW/MPeJZpcmm0oGBk3WhhbfXaxBDvkJLbKb96aJSm6vELgCvIrlRs
	 QCkghgCBQ7KGlWMym2V1I8qYuV1n4igbBAHk/2YsxRyeDbZIdJwtoZrpnyI7xIRDTE
	 HwkcSw0UAfpOk2id3ltYnV3LeE0SAoDkW7iVdAmqgg5xrr/UMBXDGMqlYOhUiRKJMa
	 5iwWjqgD2f6zw==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id DB/B8-46412-8B521806; Thu, 22 Apr 2021 07:28:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqrtDtTH
  BYPcNSYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPj+SamgnfsFctfNDM2ME5g72Lk4hASmMUk
  sbz1ACOEs5tRYsLkuSxdjJwcbAK6EucerwWq4uAQEdCTuPpPFCQsLGAt8XT/I1YQm0VAVaJ99
  Rw2EJtXwENi2bWr7CC2hICCxJSH75kh4oISJ2c+ARvJLCAhcfDFC2aQkRICihKzp8tDlFdKbJ
  92lnECI88sJB2zkHQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2hppmtkaKyXWKWbpJdaqlu
  eWlyia6iXWF6sV1yZm5yTopeXWrKJERhEKQVHru5g7H7zQe8QoyQHk5Io70K+xgQhvqT8lMqM
  xOKM+KLSnNTiQ4wyHBxKErx7VYBygkWp6akVaZk5wICGSUtw8CiJ8LIAg1qIt7ggMbc4Mx0id
  YpRUUqcNwKkTwAkkVGaB9cGi6JLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5V4FM4cnMK4
  Gb/gpoMRPQYu0ptSCLSxIRUlINTIpPnqjdey9SsvWZwbbc9DZX7Rb+qzLXSnIv3KnlXTp9+Sn
  m/v+6IrMnNn7XUPg8b+O8fxPijU4+bvPSd5y0sGa2zDpRqdQ/244s/d160y1im+9y5dwN8h94
  P7Okv/h5NaGSe239tK6sJ7ObT1gduH7yxKl88eLCqW83ufKcspZ/unitwdY2paq4+UKXs1+3X
  LK/8tD70/aTYZY1pceOfE0o71I2+e7ZGfBA9B337bstAUftJttcKdsU1VB145R/7/sjQUa7+1
  mCHk54ECpxb+KyCuvK7fcutjdZJ0asZFtf/zht4gkme32PuTtD13/dcu/rhesJt05v/7b2TfT
  8iYZy8w3084Uuir2f/ejowxXqSizFGYmGWsxFxYkAx7u4Th0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-285.messagelabs.com!1619076536!1643049!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23010 invoked from network); 22 Apr 2021 07:28:56 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:28:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7StCc027780
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:28:55 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:28:54 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libhandy: upgrade 1.2.0 -> 1.2.1
Date: Fri, 23 Apr 2021 00:00:47 +0800
Message-ID: <1619107247-54362-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libhandy/{libhandy_1.2.0.bb => libhandy_1.2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.2.0.bb => libhandy_1.2.1.bb} (95%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.2.1.bb
similarity index 95%
rename from meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.2.1.bb
index 1e37feb20a..68c8e01940 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.2.1.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https"
-SRCREV = "7b38a860ffcec6c2ad28153358cc3d037ddb618f"
+SRCREV = "e6e5b4f747d43f10ad2af18060bf1c1d034c9c1a"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.25.1

