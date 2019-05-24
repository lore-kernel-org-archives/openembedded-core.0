Return-Path: <nick83ola@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4C97DDA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 14:45:22 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y6so5965978vsb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T2A5HmoBpjU+PFDLR9pK9tqmmxVQv3g3+nHF+otMAQo=;
	b=oW6DeSg5P1pz+Bv9bzPhQsHz8YaF6mIiqI1scW2ZcdxLHIaOJoL1vSN7F8O3xy3xUO
	INSx5W3YRDG01syKl7h2D8YDpvCU9zBOul+2Vw0vvwxoL9IRWCOJZlXIIYjJtRle3983
	UOpezcFyM0HaZan9ccPM13vZpY58TMEPGQiVQvOJ9yrr+xKKiG8gqBLG2xaQgCRhXoed
	6w0AlPdbfE1eXklktGI12+HCsfDNqFid6k26UFcZNW3oGybwoVoPaZWjhvGkEsKO9FmH
	2lZt++JyweeWlEMv+W2fN+z1QQxDovhpQdkCxLB2Cc6VsrsqmhPVKAnvL1vSuTQLvVRB
	WAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T2A5HmoBpjU+PFDLR9pK9tqmmxVQv3g3+nHF+otMAQo=;
	b=cFcTwlMliBZBtsfFuAFy6d2bMnKTUaoASxEGywO82L3h3Wgco+DcJD01Q8to4s6p8L
	I8w4xvpWQzMBVIYPHAH+vjgOHkuGNOW93GC8W0U7X2TS7VV9lg5A05JaKufwqR0Tau8i
	c7PC/EhJ7td56YtEqm52l3vwh0A1surK1YZ7ubFGZLvwtzsdvAwEgZBUpOySR9E2smmT
	dQWcN/utl8wAZVwV0R+Ll0WqTlPqrxYpnVOCynCtexTAIiFRgFT9K/byFXCMJU7uMyfp
	nEHWHQc5tw4PlkZTQ7bSuinkLfYpCj159LfdVstqWW3P3BlUyM7s7C5shsOMzC2K22kh
	RaTQ==
X-Gm-Message-State: APjAAAWEoRyDBgU4x13Ank+Phr80PHKdtxaw3yh90r5MjLOpkxq13Swo
	yBLc5aYfLlhCmxMujkjzTSOb5e7RB/s=
X-Google-Smtp-Source: APXvYqwO8/JI4ssrHxLeiKWz+k/96hmQwAUf0ak5jt2CGK3zaY9SwK/1tz//HrgHtYW2svvsoVWhsw==
X-Received: by 2002:a67:ff08:: with SMTP id v8mr35641762vsp.81.1558709122705; 
	Fri, 24 May 2019 07:45:22 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id a95sm747485uaa.13.2019.05.24.07.45.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 07:45:21 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 15:44:47 +0100
Message-Id: <20190524144447.24103-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [oe][meta-webserver][PATCH 1/2] nginx: update to version 1.17.0
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
X-List-Received-Date: Fri, 24 May 2019 14:45:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
deleted file mode 100644
index 5e6dc33e9..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
-SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
new file mode 100644
index 000000000..8774a87ff
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
+SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
-- 
2.20.1


