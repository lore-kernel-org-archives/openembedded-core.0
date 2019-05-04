Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4A96A7DDC0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:28:06 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d9so4162704pls.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5M3flwLwEB6jDyI6h2DI1NO+4m4H75eEVlk+AunghW4=;
	b=uxU57pu5sbJX5Tq0G1m2+Gq4KjXrdgLDxnYML6O3WEuRF5iQIAn17gwzTtM4dWOQF7
	NPte47KQM3jOes+GoqfCVwV43Zr2L/DuAUU7Y4RFz/SN8GyieRsQ8M2T6n6OVuDiA1CZ
	7Az3v8YMxpEzyhhUZ2w89yMyigPciy2Zfd87g26/Mxd3Wh20hMA9A+oN16NIv3RV6xUn
	iMYAXHeHuX+AQxCDTMAql1qKLvICeKTcSOvAUUGPYvxUYMQXiY6TKoVWBlPLW6RzlCzS
	OLVLqRohAY0SJHxBit3sdHYVroaOWSILGupgk6e7jcbMS0/16AEJm0TDqbzuujaxo1lX
	jP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5M3flwLwEB6jDyI6h2DI1NO+4m4H75eEVlk+AunghW4=;
	b=q20GfgHi4amga3Q07n7vnUeELBYj5EiDCG/QyiWsn9x+MZhF3uyVVceD1CohRPfTmt
	h4yIaY9s3UdkhxhKUaHcUJAZeyVm+TTkJu2m12dvvQGGJyKXU/EDvlR/zV6LDxAGxQpD
	jPc2OhDhQv6qe6ENei/tj8wQzsqoBrNNDQylRVeX9e6ov796YcAt26Jn1EL8KMipdE+2
	njLiSSmPGv3/PXDj/riz0E42RskIOlrhcwsrs4NYN61HK+IWVtwiDmmQ7sNAWjhfzs1m
	ajqLU99HENBkB7CA+gyf9+SdsHroeBpr/b9r31UPBL9hbhwc4H1DqnWffLGMHz9Qg/qq
	6kWQ==
X-Gm-Message-State: APjAAAUHCHsW04YX6QPMF6Ll4BHWq5iK26r++DQJOigszGYSRvq6PU5M
	qUEVJK4nCI2znFMCS+hEIR54nuL5
X-Google-Smtp-Source: APXvYqzB5M42wkk3DviTkPNJrjqfhQbWE57EhQpRkbOfNz3wGUdh2/XpydB4+0LgG3V2F276o10JWg==
X-Received: by 2002:a17:902:6bc5:: with SMTP id
	m5mr19770210plt.180.1556983687495; 
	Sat, 04 May 2019 08:28:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.28.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:28:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:18 -0700
Message-Id: <ce14bfab0bb2fe33d3d28a47afbf18b4a3f389c1.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 42/43] libsdl: set CVE_PRODUCT
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
X-List-Received-Date: Sat, 04 May 2019 15:28:06 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb  | 2 ++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 3680ea9..7718d11 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -31,6 +31,8 @@ BINCONFIG = "${bindir}/sdl-config"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
+CVE_PRODUCT = "simple_directmedia_layer sdl"
+
 EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers \
                 --enable-file --disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas \
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
index c741cfb..bac91d3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
@@ -23,6 +23,8 @@ SRC_URI[sha256sum] = "255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54
 
 inherit autotools lib_package binconfig pkgconfig
 
+CVE_PRODUCT = "simple_directmedia_layer sdl"
+
 EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
                 --disable-video-dummy \
-- 
2.7.4


