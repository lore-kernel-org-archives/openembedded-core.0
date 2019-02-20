Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 08AA171AC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 11:31:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w2so10941796wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hdf16cgxNDnC+iSRbg+pygJxFv9JeLyNN16hpOqIr/Y=;
	b=IbGM8RVsAeaFqdfJ8W/LgUGUjz9evFHSjOYuaL+OsMYlVK1LhGiYpXIQSulkWKclq/
	CoLoIJTv5x82pqXPXcj16tw7VWjZcgd1v4SgOX7NCcpAvvu7nv+UTlHZXkP5mFwPDrwH
	l4KN6/A3aegE0pw2ghDydGP75hUWy0BK101vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hdf16cgxNDnC+iSRbg+pygJxFv9JeLyNN16hpOqIr/Y=;
	b=L9iGg4da+6AGcbIp9+PaL/drQZFBKY7rByrzL1zDyaoOUm5wWZ9xgaH/jg3QNouIwF
	BB+H4dUzl4ESkj4PdJ6uHZ+lxFbrEnMhGoXiG+nIpwk6bZQ1ma8mxuGvd/sRuP4+yjKi
	mHxtcILxmF/nHZeocu3h5xk6OrFwjdLsFgHm1uiL1mkmdcbXnnTukqLta1ax8iYOcBzg
	cTG27CxGg+ZaDy0hiBpdCAS45DjSs+8FaIyYcQ+dNa3uXPVSDQQkcJNQJG4VFRsCh8xu
	K2b7KP5M9OEHyghb8FNDxiwPuoTrLAJjVkAiVC+R41t0BazqJpObTPFLaTgGhcxR3Bpb
	terw==
X-Gm-Message-State: AHQUAubmt48fpFn81DU7E3QFlp7qmnrCgq3kf94r2vxTxq3UmfROLWlF
	x9G99rm0ZrA353gR8+DUqLCFlA7P74k=
X-Google-Smtp-Source: AHgI3IZT8MIYe5KdxY1y7sbKhwCyPw5cvF63aVqopdSVp9OXngIO9oS1+m82/W5gKh4gzA5x2s5oAA==
X-Received: by 2002:a5d:6252:: with SMTP id m18mr5932015wrv.199.1550662298173; 
	Wed, 20 Feb 2019 03:31:38 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l125sm10377824wml.18.2019.02.20.03.31.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 03:31:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 11:31:32 +0000
Message-Id: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] python3-gitdb: upgrade 2.0.4 -> 2.0.5
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
X-List-Received-Date: Wed, 20 Feb 2019 11:31:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python-gitdb.inc                 | 4 ++--
 .../python/{python3-gitdb_2.0.4.bb => python3-gitdb_2.0.5.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-gitdb_2.0.4.bb => python3-gitdb_2.0.5.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index aeaf55e610b..633752fd1b0 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -8,8 +8,8 @@ inherit pypi
 
 PYPI_PACKAGE = "gitdb2"
 
-SRC_URI[md5sum] = "6e21f5795a204f7afecb0a72fff66932"
-SRC_URI[sha256sum] = "bb4c85b8a58531c51373c89f92163b92f30f81369605a67cd52d1fc21246c044"
+SRC_URI[md5sum] = "94e59e5fb00960541f6e137b1456ab0a"
+SRC_URI[sha256sum] = "83361131a1836661a155172932a13c08bda2db3674e4caa32368aa6eb02f38c2"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_2.0.4.bb b/meta/recipes-devtools/python/python3-gitdb_2.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-gitdb_2.0.4.bb
rename to meta/recipes-devtools/python/python3-gitdb_2.0.5.bb
-- 
2.20.1


