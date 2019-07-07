Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id A1CEE6C4DA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jul 2019 01:57:16 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id i21so12588095ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2019 18:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XykmMtWzOa2/23Fp6clgcf4uCS5A9/ZOo76XNf898Ew=;
	b=FacWgXWjPxZHWP0IaDDYvJxLrrgmFud5gAC7EmIEqisFwEm8s1dkx6YwG9tr2K42+3
	OvbucHKfReu8iD9dVvbvyh/EM/YiOVsNVB0/pDkqQGzw3u+KhbwbTr0b7XQCFtaoyXtS
	YhHIqheyOtQXROuQ7EOyL52SN7GxSi5zNpynnaQINt+lIPq5lYU6VKjgWkK1lJRXqB00
	Sx3YPSnd4geLKXI0dFoz6HlZPRZqpIrElDpI7nbpbXHZ+kM/sDiePMHwKRUu73eftfAl
	ELo+gTS7kyRmuITZMxEnJJD+WafZ+sGZk0YJOL47uS/h6KBrm9oR0rlnVac46OsQLzNR
	kafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XykmMtWzOa2/23Fp6clgcf4uCS5A9/ZOo76XNf898Ew=;
	b=OZap9Zd8ZTVwxZgIp+qGa5ZfvkW3w+jsv5rcPByKWazXOHzHI/FctfM8uvYUSd2k/F
	UGNAjuNpOHL88SvLaR0cooNuuqOBiHS6pWxy3g/FKHelxWCUvYlXjm8cnNNDSBrC5aa3
	pN+0S+ccLf4bo91peEh/ipBHZB3huMDunn3H1E+dd9NL9KEE6yaI5aK8/D87JzoLyghr
	69GbqdeeJpT2M57ZJuDD6rLz3ksadRaOG18J+vrUZ9Pi08n+WQu0UqfwRkQPa+2JCdFD
	3tHtkrsZ8ZuSW/+ZtWln4yRrmm+3wvzUTF5MhqIV/QtJLkrprafHCzY/m35R8g8y1RvB
	kFEw==
X-Gm-Message-State: APjAAAWRef0S5N8SFlTlMGz7Pl5nU1K/9wfry6/VpWnhafGgKMi/j3o8
	yRVv7oYz0S1yWIhTvFsS1UVmPkcxTzQ=
X-Google-Smtp-Source: APXvYqzM0lqEJfGw72lvePxkDJR4wuPMlsz8oJqxs+rO/KnxdNXIpiE+BG3PoEo0Cdzou1Sh/HB4cg==
X-Received: by 2002:a2e:7315:: with SMTP id o21mr6135495ljc.3.1562464636582;
	Sat, 06 Jul 2019 18:57:16 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	h23sm2736897ljg.17.2019.07.06.18.57.15
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 06 Jul 2019 18:57:15 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jul 2019 03:57:14 +0200
Message-Id: <20190707015714.16009-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pbr: update to 5.4.0
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
X-List-Received-Date: Sun, 07 Jul 2019 01:57:16 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-pbr_5.3.1.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.4.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.3.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.3.1.bb b/meta/recipes-devtools/python/python3-pbr_5.3.1.bb
deleted file mode 100644
index 12892b60cf..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[md5sum] = "bdaec663a75d10e9e0f2224afa3a1318"
-SRC_URI[sha256sum] = "9181e2a34d80f07a359ff1d0504fad3a47e00e1cf2c475b0aa7dcb030af54c40"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.0.bb b/meta/recipes-devtools/python/python3-pbr_5.4.0.bb
new file mode 100644
index 0000000000..1f1ec3a420
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.4.0.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[md5sum] = "fcf120102d3e4859d41425638122058c"
+SRC_URI[sha256sum] = "36ebd78196e8c9588c972f5571230a059ff83783fabbbbedecc07be263ccd7e6"
-- 
2.17.1


