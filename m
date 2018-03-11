Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9796B60110
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 15:03:29 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id t6so16257904qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 08:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MsEBCI7mcKPHRrp3y6nSJKhr/Fbq9Ed0/gHcXUCoFGk=;
	b=D64rsll56dsEWH5DvY4EpNUMcQ/Z8tWO9WrpvYi4/P6rl30deDYNzz1i2102TlhlA3
	XNObBu8XzNVtFxOWxwqAhcb+dfChgH8N1UZ92BoAdm1cmJ3GX77fAec0uo0k7PDLT/Xk
	bJmHxTyIGwqiXpegtkiLxk0NSbo4XNZcOzHHio+4rfSpXuYXHS0pkhxWlZaTf7pF0i7h
	U0lANymF2mZ0kao8qCzxi76IJu2KnE0pDSILG2TKBZBvhmUaIb4erRo8eofgDizt2lFH
	7v4Z+ui7SWFYLg5ha0hA7M/+Bel5ywleL9F+pQU0ylCWqbDBIQjs/VhgD7KAXAW6uv6v
	XPRw==
X-Gm-Message-State: AElRT7GZ0W2IMBjTt9VFFa7ZoE2uD7iK12pRJio5CffcHYCIrl+ZGPy/
	+wGrZgwpUV9lgyPlRnNRqfCDSTdz
X-Google-Smtp-Source: AG47ELt2ylQyyN62ThX1ajCf2rC1O75m5dKgQasqUE1HJW0cV/Hv0d08W4pFJ7dT1RZtEYEQd+/uXQ==
X-Received: by 10.200.1.17 with SMTP id e17mr7828489qtg.137.1520780610338;
	Sun, 11 Mar 2018 08:03:30 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	r13sm3576310qke.76.2018.03.11.08.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 08:03:29 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 11:03:21 -0400
Message-Id: <1520780601-18488-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 38.5.2
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
X-List-Received-Date: Sun, 11 Mar 2018 15:03:29 -0000

Update the python{3}-setuptools to the latest stable version

Tested on the qemu with core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_38.5.1.bb => python-setuptools_38.5.2.bb}      | 0
 .../{python3-setuptools_38.5.1.bb => python3-setuptools_38.5.2.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_38.5.1.bb => python-setuptools_38.5.2.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_38.5.1.bb => python3-setuptools_38.5.2.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 65383ce..b5bd8cc 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI[md5sum] = "1705ae74b04d1637f604c336bb565720"
-SRC_URI[sha256sum] = "6425484c08e99a98a42209c25c3d325f749230b55284d66192784f941a7e6628"
+SRC_URI[md5sum] = "b4c7f29c8079bdf2f0f355cdcd999e69"
+SRC_URI[sha256sum] = "8246123e984cadf687163bdcd1bb58eb325e2891b066e1f0224728a41c8d9064"
 
 DEPENDS += "${PYTHON_PN}"
 DEPENDS_class-native += "${PYTHON_PN}-native"
diff --git a/meta/recipes-devtools/python/python-setuptools_38.5.1.bb b/meta/recipes-devtools/python/python-setuptools_38.5.2.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_38.5.1.bb
rename to meta/recipes-devtools/python/python-setuptools_38.5.2.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_38.5.1.bb b/meta/recipes-devtools/python/python3-setuptools_38.5.2.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_38.5.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_38.5.2.bb
-- 
2.7.4


