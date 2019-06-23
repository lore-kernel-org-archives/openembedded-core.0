Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB9E7C5C0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 23:21:17 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r15so8595023lfm.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 16:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=aqkxVHBrn8/6LlmYPMyBimP6F89qvLxcxTR+thxYq0k=;
	b=PlNLG3B2UG9dCjJjzwGqpHlp5nccBOLyyjCWmeWvfHHFLiXxnjd4y5+54+Zdq6jITz
	NJDEkgKsv07KMUG/p07JQUEI7Hr62Ul1g8P7vsVjssG10dFq6FObEoIJDGcC6FlIU6cM
	XFv4mpoOikXfHLGsCQE90zOtf/KCxRc68dEnXurLqQaf/M09fBprryKxHpZkE454tEo8
	EoJ0JurSY3rtfEQr6fw6RKZZeKMc+EcrSgJu6YRtw4k1NJg7nZBdy+4TU0LWbLFZ8h43
	34SygXCuFIfn0R4w+24CRg3ABvzca6GJZQWpzKL8qL4zDNiBd7sdUll2hMFT2wzuv2jr
	ze8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aqkxVHBrn8/6LlmYPMyBimP6F89qvLxcxTR+thxYq0k=;
	b=ix8jMu9B6BZEQmkLAVcnieCps3TvgbNaxP55WeNFYuGRs6TZNENG+P3h7IKAXEZ39H
	qyMFjRDQZ6LlxJKFuhoIU/FisOE3TS4k0wC/6pSuCyXhh8JRW9wgvy9+iOsbmX4hPTKc
	OEeyGssABvBQ5dK2vlJDFR3bCU4L1FHZsgrxwkMXXV9pzd7khi/xk6/NB3XLndaCsx/J
	3jyDBawLxyutw5bO21W1nfAO/+phM/6j+QDKAxTyWyRjCr7B85RqQSwmMyGNocr+X+QZ
	sIDEkAy8Z0N65VhaoswZ9gXGPUurMzAkg1z+vzdo8TBQZ+I05Iexnd9tjp/PgkXfPmhC
	gw7Q==
X-Gm-Message-State: APjAAAVhG9RzuEMigCg09n8DsdmOKMQbG2ayVPh59HPYJBWEP2U8LTfa
	2O15dse+3+xITg+OBDXeNsXaA/7ASrc=
X-Google-Smtp-Source: APXvYqyr2oHGEqydWvzhHD0h3xrbPeWxhRGI0z+fR5Q7+EEnVF9cEP8BeY+G/wrJmlYACXct/SK3jw==
X-Received: by 2002:ac2:5285:: with SMTP id q5mr73156699lfm.146.1561332078467; 
	Sun, 23 Jun 2019 16:21:18 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	p76sm1465891ljb.49.2019.06.23.16.21.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 23 Jun 2019 16:21:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 01:21:15 +0200
Message-Id: <20190623232115.30367-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] mc: update to 4.8.23
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Jun 2019 23:21:18 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/mc/{mc_4.8.22.bb => mc_4.8.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.22.bb => mc_4.8.23.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.22.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.22.bb
rename to meta/recipes-extended/mc/mc_4.8.23.bb
index f64effbce4..83de8dbb2c 100644
--- a/meta/recipes-extended/mc/mc_4.8.22.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            "
-SRC_URI[md5sum] = "29983a215c96030f06d5b112088ec5dc"
-SRC_URI[sha256sum] = "8d9f1c75369967adfd317a05fef9861444ed049b033e4debaeaafc6df218b431"
+SRC_URI[md5sum] = "152927ac29cf0e61d7d019f261bb7d89"
+SRC_URI[sha256sum] = "238c4552545dcf3065359bd50753abbb150c1b22ec5a36eaa02c82808293267d"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


