Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id AC85C7FCBA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:05 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id z4so6330426pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=I3G2AilM8uHCVkqUM/BXhNeto+nNXx/Eau9VewdRXfE=;
	b=Wn+SxFEPNlkjpwk8Wc0w8DjMsNvfb8cG7BVL7njncEiUJFbcPsefHLsKdKqUPYsrQF
	8VMBFSPmtw2Iz4DYJSz4H1Hy/N2/CqXbvgEcrIJ6CFVkxzvaW75HzwCGXnFVSDp+Hjm0
	1T4PTcLTWx685+aNJW0V5BefNfwjVhgHK2poEmEUmGZC1OoERKtnjzgth7GthLXM60Ss
	aqkpIUGIymY1IqbpNpzYcW3CYMwlh9AM2DdG7AyhyETiUk9AhFBROXqaZbDTefhbyAQV
	gFcirAWwBhpxZHkuZx4E3KjRP9dVzx8WAjsJibTiR4TI81oBLBq4LlVHKlGNTgMORnUE
	iTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=I3G2AilM8uHCVkqUM/BXhNeto+nNXx/Eau9VewdRXfE=;
	b=cIQalT0KI6WyzbQAqBP0cI/ljFMcVgGvv76AbbMScz/oUdwcOcwaoOPfElmaaATdjF
	AMQxbjpp6703lMAm+HRUpTQP75Fh8xHItvm81qqK4l8YGb4iDWG7dXaH6gAup2s+i+YX
	poNYZzOfHDimY+5Ll4gBz8J+AHZdtU/dLeSIkrxjE+Glr4r4YJxuXd5Yq18FkirzCkD0
	G20TSVHhGYTtEJAY7do4iHOLqVH8YGyQ9/HPDwXtqU5gBTYv4nauKI8dj0og8L2BEfKC
	Fq3n1ZW4et/JltgQRq1fbG00JTC6KP0Oai+pGSMcTd0rbMMyk7xaUeKpdPB9jCP9xUhh
	iK/Q==
X-Gm-Message-State: APjAAAX9DTrAzSWWpmOoMjgpL/33OJM9l3jSxKnbjGCI4mTSXBQqKlTd
	WYDmTQ7ATD1Sq39yDkNF+11/IGCF
X-Google-Smtp-Source: APXvYqxLQ4Qk2lzQq8LukxlU+fZ1h4Sy8WlryTbPgQ3WeR4YS2SSmCfU3T0Z48iqI8p4O4nO9MTTHA==
X-Received: by 2002:aa7:9f89:: with SMTP id z9mr31791812pfr.123.1574639466699; 
	Sun, 24 Nov 2019 15:51:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:29 -0800
Message-Id: <5c60fdc336af4c1172449690cf75e4954e22f4ab.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 24/35] gstreamer1.0-python: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:06 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gstreamer1.0-python_1.16.0.bb => gstreamer1.0-python_1.16.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.0.bb => gstreamer1.0-python_1.16.1.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index 0f3aac1..52ed150 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "877b2ed2aaffdb62e63f38ea9469b70f"
-SRC_URI[sha256sum] = "55dc7aaed1855565f9b9ef842d93e93bfc5cb2b376faef6af5b463e1774e2d38"
+SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
+SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.7.4


