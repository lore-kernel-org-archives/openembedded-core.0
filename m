Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 650307DF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i3so7764458wml.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8BETtvugiOtbAQV9qFZGMN2OEwpDaIAl4W1lmGnJvec=;
	b=QYxoQ6pYx3L7pdNP1+VSH/NAAQtCc1FprQ3sidEj/Rv1N07Sj0qrui4OKnRsc9FAAs
	ZAWsVu0sWLn+7Jy6moUynPuQdf1KO/yMq0k37mCZ4VN+6z7myX7PpkOAj+h1CbcOYk7V
	U0QFik6HDLgUR3yFrDV6ytzQCzTIXHJkv6PuXnng43rtUgei5fPBAqcvqXc23yHjehV3
	szSOiQGTbLFhys0qYHfm8kZgxOeH1ZS+E1//S5puLNfkjPhiwOhxnSsWf0jywK442uWw
	IzdbIUjssCyjFmZNt/bQ0i0xdvbloYaYiJ1hjmJ9BtmvGLkDNqdOqX+dw0xYU9Cz1G6d
	aMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8BETtvugiOtbAQV9qFZGMN2OEwpDaIAl4W1lmGnJvec=;
	b=hv8rl4/HSVlc0vaqqSYXKxaEtQGd024ZC4YQEbwRu73Td8HNnC/3Yh8Muh9dBW0IMl
	PYC/wTGj76hXCd3/8LDhIqxCQAoqmxd7c/iOI3xxIwF3NluQbEoAJ17g3zlwpgeR4MgE
	zmShym+Azqzy2ui6Ezdmv31VqL+Abb7zyrCBrzqvAtHbV4p8/OQgefgj/lIx/WbW/0bh
	fPTjsfpwo/Q2kvHvR+FH5kErszvNWuBIfz7IeufzgYDaoVRWWEooLGO0/KGmHVuxWHlE
	YQDNSD4rimPr5ms6E5zRHVBeAbCSeNGKsQeUnBL7Rz1DJmQ/iQrdRWzN+XIXgpLYBhQh
	TObQ==
X-Gm-Message-State: APjAAAW8IAKzmmWa0haBWnAap78bK3m1ulYzs3NCZCdvVJ4WSRCgt/h3
	AQfodBq1KU70FW0W+c64YL90ee9j
X-Google-Smtp-Source: APXvYqzlQtJCd5lRQDtnbXs5LTLAxpYRHqTY1s4LEDJQZYImS00N9r1+opNz0m9wRM/Rxeuo7jqXoQ==
X-Received: by 2002:a1c:9689:: with SMTP id y131mr34420377wmd.74.1558116731013;
	Fri, 17 May 2019 11:12:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:28 +0200
Message-Id: <20190517181151.44001-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/37] alsa-plugins: upgrade 1.1.8 -> 1.1.9
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
X-List-Received-Date: Fri, 17 May 2019 18:12:10 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../alsa/{alsa-plugins_1.1.8.bb => alsa-plugins_1.1.9.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.8.bb => alsa-plugins_1.1.9.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
index 2d9cc06f585..b94fc5cee32 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
@@ -21,8 +21,8 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "d0f87211d1560f2c07c8eae4297bc4f6"
-SRC_URI[sha256sum] = "7f77df171685ccec918268477623a39db4d9f32d5dc5e76874ef2467a2405994"
+SRC_URI[md5sum] = "e0caffbd849c51ed81751378f56cb563"
+SRC_URI[sha256sum] = "161772303da521abbbf1d91f63b470c4791392d5728f2192a42d71292078f907"
 
 DEPENDS += "alsa-lib"
 
-- 
2.17.1


