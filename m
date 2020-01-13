Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id C0BCE7FD08
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:31:01 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id ay11so3961300plb.0
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XliIPniO84ZtBu0Uwrcerz8+txIen9T5LsodVx6IZTM=;
	b=Zaya5KBZlFfK2RHtsoA4GPtLrh19nGHKdJsmjv2tjhmbKkyGGYmstIaIZ9Qv8H2KUj
	RnAuBxYDBs+vdglyOGOxjR+oMSq3KMLe+pCu1BJVoJS4RCtXoYRVvSZ0GrpwpKvdrb02
	kF3UBiY0shIp00MqPMKkNAamMhnoFZOkPAJwu34R+bG6cgclWrEY2nNXDPiFCpwicu6o
	Sx3q+2rFQJHZ3SIIZxBh6ZXSa+OdCbmb3t+i2pDXSQseSd0ZBD/bVaqMHIG6aHVI3TzJ
	MEj0waHbffVTHFo+Lz52OYpaE32or0XnbhyHBmqrtyZkNqrldCZIpXdLtm4ke2yaTAxd
	Z4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XliIPniO84ZtBu0Uwrcerz8+txIen9T5LsodVx6IZTM=;
	b=ZJQqPoVg1eeQn6fT+okyE5TNKqAIIWEZwruBtAZPnTJijxEiNBRCHTTBYMA0xWK9fN
	x2eTQsYTpSXGD1Uywt2H+eT/RWOX0gvGKahNOaBBoVD8HQUTk8k8qzTd1FJpUmKmH92t
	41VrjCURy3tSdGEzSe3RTIQU5jA8re8hYOIXYzUIMP43mh+T4X2u8JyNRYGqXwZ/1kEP
	4NzYSR+jA25QwLK/BFAuqmqkNyIr6e8DczLpZmiEDuyueWU+9RCwsn/zoyNGyUKbDkZ1
	TzVDa1eTUZJzZzm8KH30XOh/IVixou/QFeM0sKhyES0BqDkq6MKRkTa/RfuP00sMomvu
	4WWQ==
X-Gm-Message-State: APjAAAVKJnL6RsGrdCybpkwRLXYQ717vsu8KnKLDtjITb41hb8QTi4v4
	ZzabiSQjI+abFkgJlWXPgCrFVGji
X-Google-Smtp-Source: APXvYqyNDz+JPXsaTy8MHM/AzjZqKaR3OUWZx2L644978vTXe7dUsTUzrPB+V6sGhxrd0JVzbHWjCQ==
X-Received: by 2002:a17:90a:e2d4:: with SMTP id
	fr20mr23598943pjb.85.1578929462628; 
	Mon, 13 Jan 2020 07:31:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.31.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:31:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:24 -0800
Message-Id: <2e2fb4e9db2e328dcb771951feb7f7ab5c0c4dd6.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 25/28] popt: fix SRC_URI
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
X-List-Received-Date: Mon, 13 Jan 2020 15:31:02 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

rpm5.org has been down for about a year now. Use linuxfromscratch.org
as an alternative reliable source instead.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9224014da9a512b1b8837e4e7a736d465c97be3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 478288f9bf..27e49c2ca2 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
+SRC_URI = "http://anduin.linuxfromscratch.org/BLFS/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
            file://disable_tests.patch \
-- 
2.17.1


