Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id EF15E788F3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 13:47:13 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id n12so15457164qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 06:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a6VFd7jzw5dkZaLuvb+dnr5tnRdoMdpEJwm0rUrSeM4=;
	b=tIAeJvO0aWu1DCsNzXSyFPZicv2S5cRu/F+G0i+kgYdHBAf4WkNDtMWH4k8PGTxK4W
	gEWi2AFRjVvf//yf5xZL3peV6prnnFXygrWZWfKjAarilzbKWkSmU7rSMgVziLppC0gd
	e81V+KBCDoxJR4fiNkpaTs+cXP3hrLlIjONFRSi9MYKik+2iIpePjAo8aIVKhZzJM4L2
	ad0GdZDgKRuQKrM18NAAYNJ6ddoQrBaMQmlNHV9M7m8G420P9SXEFzaYpc2EJJNYq08V
	rN8GMuJDAHSZWHUfsT9ECKyD/YXWTLecVj9ZxL59KVGHDr3/xojSGEpZ9VC1qtW5gVwd
	8dww==
X-Gm-Message-State: AElRT7GPMxJcNiIXUEa4iKsGpY5pPjLzWps2avNX8YDAtuzr3VLal7hP
	8Q/peLE3hDLc3Se7tpOYF6uyrx4S
X-Google-Smtp-Source: AG47ELt2e3DWhDIYnOM4IKDbrFIZVHbpHEoYpKLMb0EH+fW06aRUweM6xe8pQ+u4MhefDiL/bSx8cA==
X-Received: by 10.200.15.252 with SMTP id f57mr12994685qtk.171.1521380834552; 
	Sun, 18 Mar 2018 06:47:14 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	q189sm8020144qkb.2.2018.03.18.06.47.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 06:47:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Mar 2018 09:47:08 -0400
Message-Id: <1521380828-3050-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python-numpy: update to 1.14.2
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
X-List-Received-Date: Sun, 18 Mar 2018 13:47:14 -0000

Update to the latest stable release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc                   | 4 ++--
 .../python-numpy/{python-numpy_1.14.1.bb => python-numpy_1.14.2.bb}   | 0
 .../python-numpy/{python3-numpy_1.14.1.bb => python3-numpy_1.14.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.14.1.bb => python-numpy_1.14.2.bb} (100%)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.14.1.bb => python3-numpy_1.14.2.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 10af4c5..08e6762 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -9,8 +9,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://fix_shebang_f2py.patch \
            ${CONFIGFILESURI} "
-SRC_URI[md5sum] = "0e09f20f62ab9f8a02cb7bd3fd023482"
-SRC_URI[sha256sum] = "8708a775be9a9a457b80a49193c57bd9d51a8a195ed1f1c4b8e89eaf3aa646ee"
+SRC_URI[md5sum] = "e39878fafb11828983aeec583dda4a06"
+SRC_URI[sha256sum] = "ddbcda194f49e0cf0663fa8131cb9d7a3b876d14dea0047d3c5fdfaf20adbb40"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.14.2.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.14.2.bb
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.14.2.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.14.2.bb
-- 
2.7.4


