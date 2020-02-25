Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 70ABA616C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j7so3533084wrp.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bvnq9D9xy4JojRfiZ2WWvDh36zdS3DvMA05aoRpZd+4=;
	b=BfAhlS8NJZPqmMvnTxbPhJxCY8w8YkXIpm+zibJDobUwMrbqxphB+BCZymsZNY5g3u
	Z4/O71MY/TjurjKVek27vDi+SiBCv+XiTFDG/RXOwES0cizXEF5jmySc8P5pKJrv3GlW
	Fz+JHCx9YiG9UkL5/fk23VLgR2204RqWR90XhgsQBnyJ2EUZLU5cmDTjiGXTgH8h2UPK
	wvRJbFVY2C2Ii8GMYePi26Hc57c9YMCDL3QUDncY3YAuPgjw3CxjaAVUQ8OH5nmmVcE6
	JZsDwaSsWdpwKEuWTxHq8gMfYtgv3OuiQhsDPA/veEPeYj6P7hOnswlphO+qd8OuKzfm
	N76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bvnq9D9xy4JojRfiZ2WWvDh36zdS3DvMA05aoRpZd+4=;
	b=lL2VrDcX+p+RMQCYslew/oBGR9hhBBGxkSLkKbccNsD2LGh79zk7slwJsElxDVIml6
	5BhSVfiBnM/Xa0I0+PWb5JFsJT4mCYEO15BAijFeM3+i4uk89wuGJy2sEhoM8bfU7vlH
	15bn7u/6xfUMOW6i+4NesfLgNTF1j7gOooe73gysuODLQNqjfOM61ibwDD4IQBTEz/F9
	1KIowyrCx5AhPf1Udq6BHp6fOpooZjt5cPrCTugSAUHHNawD0YJ/8CrLzMVo667JzmkU
	NzCV/EqE00rM6M4RSasnTRYNWarEe5nKrT/F8vSNjVkKqbfpU2D8c+ozZa7uhdeUugja
	QfTw==
X-Gm-Message-State: APjAAAX9QvdAhYM31VeoemjM294sZNjHqEp0sGEC0zqOjNcH26qkOL1p
	eXntqUwP7pXmetkszUtWinVNU53x
X-Google-Smtp-Source: APXvYqwrmESIIznRIDy9fbbhOLCNi5h1NB3oqZVMq16cTtdFIH1O+keb3lP4BWkiZIUL/aFAdSkPMw==
X-Received: by 2002:a5d:5263:: with SMTP id l3mr492979wrc.405.1582656855965;
	Tue, 25 Feb 2020 10:54:15 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:35 +0100
Message-Id: <20200225185335.19326-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] gst-validate: upgrade 1.16.1 -> 1.16.2
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{gst-validate_1.16.1.bb => gst-validate_1.16.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.1.bb => gst-validate_1.16.2.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
index 7d602eabc6..35492fe861 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "793e75f4717f718ad204c554d577b160"
-SRC_URI[sha256sum] = "7f079b9b2a127604b98e297037dc8847ef50f4ce2b508aa2df0cac5b77562899"
+SRC_URI[md5sum] = "688f42c52d62e8c5e506df911553fb2c"
+SRC_URI[sha256sum] = "4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.25.0


