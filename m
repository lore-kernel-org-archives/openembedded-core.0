Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id E11C97F604
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 12:37:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v17so2965786wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=npOiPGN6zqNN2CfTL/wVPCb/qv4MGNAIyhJuaweURpU=;
	b=J6zFIwjCk037jHUGJzZKREGLWXBmiXcnW89FQy/hvct0aghL7o3If5tBIDhDharcLa
	HVyxCLtt1D8bKcUsxw+o8/fL75GSJKLIUO7zqmx7Fas0+iZ7f+sYbrZDS2gYlPt1NpeK
	7fX4bOzlSfyWaGAD7Hbc7fjrs58KZgSKCxNpJYJSqPUMblVTvOUEcrW/VThEzXbnlzES
	zQym2+kHVaGCSeR56MQe7TxWVYUu8CYKO9lPc7aF0yAVYT6lQrGKC0gBYHOzSMALHzHN
	5AE3Msg/phez7Ci9QQKa8owjWvI9Kf8jS0KXkaObEn4ioYZGi96H72g+aX/iG335PYmF
	HGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=npOiPGN6zqNN2CfTL/wVPCb/qv4MGNAIyhJuaweURpU=;
	b=dkvbWPz2pshEGJFOFrDYzJG1jF3cewnSmsUDFT9fC9GUwqj3U9sclIcr1KlYZJwAoJ
	NXLkBaZZkNBNn65ig9eX58CBWnyZcLRmKtqYmLTswhOgO3cehf4m8SVgKwURRnqpTP8e
	NrNa3P3huER7O6GTxjb7IUHnuDKaY+FHOa6RQoaGK5OTPpJyuSnXATgdb3anemmbmX3t
	C13k3Au8iKFfIHNikttGVRY8JdqbO6VVHd8YQkq7jeTzPwaPkrtqALm+NwqZhuesUJk5
	p+ttlwKGdLt6o4wgV5dZQqwfauft+BNcqttKiKAoj9YC8zsn+5/SwTAjVW8q245DxZll
	440w==
X-Gm-Message-State: APjAAAVZD/sBSLGlts118Sz8BRssVbIZSkFATdAGxQgcWGt2pyAd4ae8
	h/aYqbqpxHL9P1ipqpp0vlGGSzQ4O1w=
X-Google-Smtp-Source: APXvYqz/q1YClLWaNvcBe7F3mCN8hQYOrg90jYzA439A/TjdfV5+6mYFPYktCmRlaZ9RcLjxlDBIog==
X-Received: by 2002:a1c:c5cb:: with SMTP id v194mr3305785wmf.108.1568723821039;
	Tue, 17 Sep 2019 05:37:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l13sm2412994wmj.25.2019.09.17.05.36.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 05:36:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 13:36:52 +0100
Message-Id: <20190917123655.30315-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] libical: upgrade to 3.0.6
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
X-List-Received-Date: Tue, 17 Sep 2019 12:37:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libical/{libical_3.0.5.bb => libical_3.0.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.5.bb => libical_3.0.6.bb} (90%)

diff --git a/meta/recipes-support/libical/libical_3.0.5.bb b/meta/recipes-support/libical/libical_3.0.6.bb
similarity index 90%
rename from meta/recipes-support/libical/libical_3.0.5.bb
rename to meta/recipes-support/libical/libical_3.0.6.bb
index 3832b20bf11..032f3655e9a 100644
--- a/meta/recipes-support/libical/libical_3.0.5.bb
+++ b/meta/recipes-support/libical/libical_3.0.6.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "9be4e8a1739a9c27e06aa8ce66b8cb34"
-SRC_URI[sha256sum] = "7ad550c8c49c9b9983658e3ab3e68b1eee2439ec17b169a6b1e6ecb5274e78e6"
+SRC_URI[md5sum] = "463a59244c6767b8e67b29379405e297"
+SRC_URI[sha256sum] = "5c8a21c2b732ece4a33e5c862970b4f35a8548bbcda50de5695f6fc211ac4d97"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-- 
2.20.1


