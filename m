Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE6AE6132A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 15:43:53 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s1so6561227pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 07:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nLz3YSxyFQpxpKFEZDmDodnVDxvcl+yfBLmGUJH08sA=;
	b=aR9n3V/J8VFy3y56B1qKYzlLhTA95YRmwTfwhzIwXOUXo1o4LdkygsnLDDduHNQ2B+
	iFpt4qzo9CFqED+zN2kDphlBBApoXdARrG2xulk+q24qcl5zEC06MFu+2i/K6gOIEFns
	40DZldaph3Y029b0zkC7kCZRmhSq/sxbPFUfpGzxEbS5RH9TUBfSrZS5amwXbIQZIV9Y
	mvuUiEdn3MFsIxWznpJ1YwxdsLelQe4BYRCnECSZaFOYx+hsScUyssSdk7/N0zIhY/mf
	ojhn6m2bgDfwVfqx4uy/wLOYWjB69P1LxFsztJ0dqjIwoGArFYEjwIFj7bGZo+L0Vzt1
	C91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nLz3YSxyFQpxpKFEZDmDodnVDxvcl+yfBLmGUJH08sA=;
	b=jhetjggDimISDFQTz36s8LqDDmegtXLe/y1ci+ELieGFr2EwR+JzTwzCA03Aoj5UHE
	8HYWF192bB+e4GIT5sP+JYmcHowRj8C6XIphtHSlgqcqVkDbLgQqWKnLpRrE94vDxlAu
	KyjQo1DrBoPIDOmCKoBvp4jLeRGyvKifT94BgsB258lOP//CM4FDF+8iO0aE+tlDLYel
	rZ51FSymZazc1GWgg7QF3jEWTKySSvhEq9v2OaBeu94/ppp8feoZVSbPlPGpw25ri6Q6
	wonFqXRnfZbQpKNnAMAIwNopz6chHvT9aytLDLiIqPbzJNLR6sxXu0hLnBxpf3yHMRC2
	rTgg==
X-Gm-Message-State: APjAAAX7FsqX6sqKsnPrxzPvkYFDQd24kMGUkX+kYda5KeDO9CIu0Spx
	1t4hfmdXlRuH839CiH4CXVt9yCL5LVo=
X-Google-Smtp-Source: APXvYqwryHRmC4y0zpZtHZIzeDy0m9fFfCNGeh4PHtu6RqrJkFoqKk1E/G1+GT3PPfSYnLe++6aiEw==
X-Received: by 2002:a63:451b:: with SMTP id s27mr8990045pga.233.1581781434472; 
	Sat, 15 Feb 2020 07:43:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id
	u23sm10785173pfm.29.2020.02.15.07.43.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 07:43:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 07:43:58 -0800
Message-Id: <20200215154358.723689-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: Upgrade to 2.26.4 minor release
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
X-List-Received-Date: Sat, 15 Feb 2020 15:43:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/{webkitgtk_2.26.2.bb => webkitgtk_2.26.4.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.26.2.bb => webkitgtk_2.26.4.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index a184d833c4..c7f0d5e983 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -21,9 +21,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            "
-
-SRC_URI[md5sum] = "65e06fe73ee166447894aaea95038e3b"
-SRC_URI[sha256sum] = "6b80f0637a80818559ac8fd50db3b394f41cb61904fb9b3ed65fa51635806512"
+SRC_URI[md5sum] = "60f881729f3b71244b7f6e58790073e0"
+SRC_URI[sha256sum] = "4386900713dfadf9741177210b32623cab22562a79ffd0d446b66569934b113f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.0


