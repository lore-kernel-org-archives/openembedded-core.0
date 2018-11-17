Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3C12E6C241
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:58:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 79so76404wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=we9D00Dr/bqVvmJBykLzuAcKuO+JbnFPuuKQz/fn77Q=;
	b=Qk70G5stVfH7zSzqHFhCgDNnXR+JkXQC6Rvl7ThUFN4fyeuNYNYeGTNgBMlxEEGnZa
	hnyQ5fl3lt+kMhxCdO4Q9NIyqAtOBiv1iq9783B5PDxyV/jWGn60pDvMfskcsgmfzBW6
	dHL/bXqX7CetpLaQiSSvVGdfDs4gRkTfRdbcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=we9D00Dr/bqVvmJBykLzuAcKuO+JbnFPuuKQz/fn77Q=;
	b=K5rX7Nt/5tAdnRtwR9E96EHQ2btQnygS1dpVRtmKMn82Z5Qr9wyu1q0w+YbYb+mZ6E
	tXWTRr1CHm1GjSGsqLHhJBJBeGJhW86Ur3IzVPv0LL0L575WcQUSzl9kfngrZmkky8ze
	6CO5Ud7gQ8hauPsoUsdCsl/1L3HZJUKr4HWKFmYL7LKWo6hVSxFilC2UqmAlI0Ed7bpN
	fkIL5XZGy+j34rpDuvBBA0rt4iIJh2T8wyTg/Aeyghjd/Qxn58MfbEYYBlf6dHiNM2zm
	0i8TXR732hloplb11rzGr1rLQ85yQzevDOzIxsIYJaKg/pOgFVyOT/zC5+pUbGviZZo/
	VsfQ==
X-Gm-Message-State: AGRZ1gLSeZKkmrrn/LtxnQyvrLwk1yZgPBECusM9LeYFBe+IzVxVIREJ
	P43j6YhjRU17mg3e6+hckO9h83YqV8w=
X-Google-Smtp-Source: AFSGD/UZZvGdW3BKAD8eqTLkazv4NAMHDV4fatfLWmVSKuGb33sMnjH+/bKYQ7D4eMbzwwjx3YXKwg==
X-Received: by 2002:a1c:d1cd:: with SMTP id i196mr2574076wmg.107.1542495481260;
	Sat, 17 Nov 2018 14:58:01 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.58.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:58:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:50 +0000
Message-Id: <20181117225753.15733-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/9] libepoxy: upgrade 1.5.2 -> 1.5.3
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
X-List-Received-Date: Sat, 17 Nov 2018 22:58:01 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libepoxy/{libepoxy_1.5.2.bb => libepoxy_1.5.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.2.bb => libepoxy_1.5.3.bb} (83%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
similarity index 83%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index 106721226bf..92f644c039d 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.2.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "4a6b9e581da229dee74c2263c84b1eca"
-SRC_URI[sha256sum] = "a9562386519eb3fd7f03209f279f697a8cba520d3c155d6e253c3e138beca7d8"
+SRC_URI[md5sum] = "e2845de8d2782b2d31c01ae8d7cd4cbb"
+SRC_URI[sha256sum] = "002958c5528321edd53440235d3c44e71b5b1e09b9177e8daf677450b6c4433d"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig distro_features_check
-- 
2.17.1


