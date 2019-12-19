Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id C5FA57FE3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a5so5416498wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZfjSZt3sQDzMmWgStjzdgKM6zOMwlD/rEMuFg1F3kVY=;
	b=nZr9KL84Nzuvh0DKjoWwZap5Mn9+kzAvSxaYZb6CABld1C/drKqn7IiCTk1Yo+S8sS
	9Hht+JojLbFEo6nOfySNWSY2VisqFAZmtMk/WK9EHmb0qsdmRwoND7C96Cur51vVfobr
	kZLnT8zzbxadxVeEQTje2vJ7kAstoZf2kp5YaK6Uu/iJR5UkPHbgoP682eU1JzpFlQsi
	T0Jzrl8+i727Hds8k6fKSzzlqw8GRyGgH2SarrHjfQIDpzuW6YL9PPNm72+4YloOsM01
	geFTZIH5K4iR9vIcgHJWtj9Gdldi0g2Yy6q976Zqbd3lvlz0YoGMWJpnH8VTqdEoHRos
	7cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZfjSZt3sQDzMmWgStjzdgKM6zOMwlD/rEMuFg1F3kVY=;
	b=RznMLUDXDMJCBzGfkVOHbDziqIeW0mK/wUypDAzYd0dCHrKlCYNk2EjCojhljel0lG
	ywSEnpvwQOsyNA039tQUoh324+a4ef/c8x3ODn771lKr5WG24/wMndIq0Q/5eUg41XOD
	e9PO6vPrxerNZNFbOWbEtkOw5tboy8JJ/ClbPk/BL7x4+BTzd7KUMIfw1cOFK2VV2F3U
	qyHo7RAOe04G1ZmzgQD3gersVjBrNKnZ1MlDgup/DDIWK0/owMW4/hY2zUFfC5aT2F9Z
	Efg/Ui12/JIZ12rOsZmYZdQCTymmq2IkjuajqewJ94BtYJNVj9FvNrURagG1c422usYj
	VdSQ==
X-Gm-Message-State: APjAAAWzarkvaqmW+QLbeo6Zkqyb8M8huzgrg4QV+v6Ckarpp7DLq9HC
	/h6M8tA32hLPD1W2pvZUnJM7r2iwu8o=
X-Google-Smtp-Source: APXvYqwSSBMBWOev1XMpvg9ByAgCmDdaEL9hyppSf/owOfb3RLupcjk+BrwsmvDwOEh18KLPKcT6gg==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr9707270wmj.57.1576761808888;
	Thu, 19 Dec 2019 05:23:28 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:57 +0100
Message-Id: <20191219132301.80034-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/16] boost: upgrade 1.71.0 -> 1.72.0
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../boost/{bjam-native_1.71.0.bb => bjam-native_1.72.0.bb}    | 0
 .../boost/{boost-1.71.0.inc => boost-1.72.0.inc}              | 4 ++--
 .../boost/{boost_1.71.0.bb => boost_1.72.0.bb}                | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.71.0.bb => bjam-native_1.72.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.71.0.inc => boost-1.72.0.inc} (85%)
 rename meta/recipes-support/boost/{boost_1.71.0.bb => boost_1.72.0.bb} (100%)

diff --git a/meta/recipes-support/boost/bjam-native_1.71.0.bb b/meta/recipes-support/boost/bjam-native_1.72.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.71.0.bb
rename to meta/recipes-support/boost/bjam-native_1.72.0.bb
diff --git a/meta/recipes-support/boost/boost-1.71.0.inc b/meta/recipes-support/boost/boost-1.72.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.71.0.inc
rename to meta/recipes-support/boost/boost-1.72.0.inc
index 7164d0f1c57..55a095bf1c3 100644
--- a/meta/recipes-support/boost/boost-1.71.0.inc
+++ b/meta/recipes-support/boost/boost-1.72.0.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "4cdf9b5c2dc01fb2b7b733d5af30e558"
-SRC_URI[sha256sum] = "d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee"
+SRC_URI[md5sum] = "cb40943d2a2cb8ce08d42bc48b0f84f0"
+SRC_URI[sha256sum] = "59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost_1.71.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.71.0.bb
rename to meta/recipes-support/boost/boost_1.72.0.bb
-- 
2.17.1


