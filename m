Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 019F771994
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 17:17:49 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 33so37094733qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 09:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FJ7NeGQmQDaS1UwO5CmTP5EJB4YBQazBADHl0ba9V8w=;
	b=s1l7nYH/O3ubG+Rv9N4nsqZE5bSHj9dMoSa5dzRDZbJBIQyQ5Az161h+9KFvJ9bDnQ
	MDc/bn2DcKoyOv6KlEmL+DyihbXkEeHP52pinZn+VPwJDQQPMvqCPlQPm4sOyLztW4/O
	8hE/aQ20WqdQlRYBWNk2+0swC2d4JwquDmEhKLV/MLzJhdq+DTq2PDIVHgrkf1r082MI
	XfwT25PEus69pcJGdfubtWNLUwcGMukwRNtmhdct1WvTwQjkla5Kv1alAsckW+S6BDHL
	z3/W6Wj/YwwYNioKwY3qOUWZsmfb6ZGTwPZ0hB4XhgcHNlm+LgjR6iJzXntDglYXKjgv
	c5Xw==
X-Gm-Message-State: AKGB3mKVzrSjRg1BcsrSsY94uD58Hm1wh2aPHpkIBqixY7KyyIZW+Zb9
	xbGHFJxblQS9rC1TfVvkjGwatkHU
X-Google-Smtp-Source: ACJfBovAijZRU1qeoG+Y4Foon2AdXKETWYKqE1A/AuXR+5JiDxODXIWDjjaXkU5jtxYkp6DhhTXXYA==
X-Received: by 10.237.63.33 with SMTP id p30mr20944460qtf.321.1513963070962;
	Fri, 22 Dec 2017 09:17:50 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g8sm13687055qth.68.2017.12.22.09.17.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 09:17:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2017 12:17:41 -0500
Message-Id: <1513963061-11081-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] python3-pycairo: update to 1.15.4
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
X-List-Received-Date: Fri, 22 Dec 2017 17:17:50 -0000

Update to the latest stable release

Tested in qemux86-64 running core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pycairo_1.15.3.bb => python3-pycairo_1.15.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.15.3.bb => python3-pycairo_1.15.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.3.bb b/meta/recipes-devtools/python/python3-pycairo_1.15.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pycairo_1.15.3.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.15.4.bb
index 9022482..a6c9e5a 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.15.3.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.15.4.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "7390cd413271fe5569f6eef73d72bf7a"
-SRC_URI[sha256sum] = "8642e36cef66acbfc02760d2b40c716f5f183d073fb063ba28fd29a14044719d"
+SRC_URI[md5sum] = "89f04740078fb5f4e4dd92a0c4d3b537"
+SRC_URI[sha256sum] = "ee4c3068c048230e5ce74bb8994a024711129bde1af1d76e3276c7acd81c4357"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.7.4


