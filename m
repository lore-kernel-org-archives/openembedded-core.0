Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id BD5F07D5AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:37:42 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l6so3032305ljb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=n8XyzAP34mYGjEPiLAmbKFmWIWTUeY4mN7XtTleYZ2A=;
	b=W3IyImhZLPNR6m1JV4H4g65dzvRBukxlqzZzrdvAMeMAUO2QSpangoz9MvscahhRK+
	FGDGQ1rsJEzYUmIzxdwwboDEm9wfiOgl3CCYwGgQdLikB2iXwwRx7u8Z1UxYLdSr2J+f
	9zKC5UcRQd05uWYuQkyVREHGrb82nfnYJjtXlM/Ji7YiuUi1F3uf0Hd/OuZUCqwJVbyL
	QJJZqJhi44MYR/e5fqTkQIxux/o/jfpKOzCnoO3ueg5/Rw9r2J7xxOmB06iYBlaEQ0RR
	SMVwLkVEx9uBBQd3Tix32xue69I3IMKI4PBgkLUZpt+QR4hIwxAGUtimXrC9M93CHaFD
	KDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n8XyzAP34mYGjEPiLAmbKFmWIWTUeY4mN7XtTleYZ2A=;
	b=h0iG8rpiBTaRg3P1DRy8Nh6M42bASs/7+qVaVhCQtUIQtTxa49Svy2Q+X3IyYVqAtp
	P968D+zQthBgvSQUQ0Bn0oNC5q8jvJSFHrcJruFpcnQnOqQan3mCAzL5Ahq/yA7lz553
	Y71nnEfV8pAntRo+fqwX2aReJ5gK2lqBDKmZFn09OJDVFo0Rf3h0eKYyoFzsUgcxvPFo
	SOGrqHdgtJVG2aV1DGvsmZW/z5X9uqmZKW2FYRd3prZeCaEZhagXpG/UvzDN+7o/VqL5
	ko9wLrFKozbOm+dhnqRJGAtmDX8RvqYU+uKufnOyVFIjDC23U7OtwAyNE/XSRVFSDoVw
	741w==
X-Gm-Message-State: APjAAAW5vHADz8oNmJ+R3gEDl39G5KJ0NETktCzjT8KJJSXTXbTmUvOU
	ZyfpdZGM6pmpuGkY8akAwF1+q9LJYLA=
X-Google-Smtp-Source: APXvYqz6u92AiOrueFYgqxuhBM+Hj4Rae2ZpEQEoz3QXltLWTVql+V3rT11kOw/uuRmZY3IfdD9H5Q==
X-Received: by 2002:a2e:420c:: with SMTP id p12mr18516768lja.1.1556131062730; 
	Wed, 24 Apr 2019 11:37:42 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id x25sm654486ljj.95.2019.04.24.11.37.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 11:37:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 20:37:39 +0200
Message-Id: <20190424183739.11532-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python-sons: update to 3.0.5
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
X-List-Received-Date: Wed, 24 Apr 2019 18:37:43 -0000

License checksum changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n-scons-native_3.0.1.bb => python-scons-native_3.0.5.bb} | 0
 .../python/{python-scons_3.0.1.bb => python-scons_3.0.5.bb} | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_3.0.1.bb => python-scons-native_3.0.5.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_3.0.1.bb => python-scons_3.0.5.bb} (63%)

diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.1.bb b/meta/recipes-devtools/python/python-scons-native_3.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_3.0.1.bb
rename to meta/recipes-devtools/python/python-scons-native_3.0.5.bb
diff --git a/meta/recipes-devtools/python/python-scons_3.0.1.bb b/meta/recipes-devtools/python/python-scons_3.0.5.bb
similarity index 63%
rename from meta/recipes-devtools/python/python-scons_3.0.1.bb
rename to meta/recipes-devtools/python/python-scons_3.0.5.bb
index d5084b2d16..c010cd94b8 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.1.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.5.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
 
-SRC_URI[md5sum] = "b6a292e251b34b82c203b56cfa3968b3"
-SRC_URI[sha256sum] = "24475e38d39c19683bc88054524df018fe6949d70fbd4c69e298d39a0269f173"
+SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
+SRC_URI[sha256sum] = "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
 
 UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.1


