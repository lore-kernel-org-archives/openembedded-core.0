Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id E06F377040
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:20 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id b35so7531261qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Kqxiza1MsWc9HrEoJoMngN0ZN6Z9pjCXJQqEvruke68=;
	b=X0bP5rzMF4jLqUCi1ZifpbjqO1yPrN+xfxTs1d49yZd2qK6oVbtdAkiuHu28U0PvLC
	AvxKLlZKRkuqqoPTuQFfBEDjJ6brKtNyQp60DHIYM9Dz81DErfBnbocDfgZ/q+L9xMX4
	9L31cJswGklQMFTphxOsb/aOw2u8ieiOU89X1q9g+bvavA9+OBWU/1UdihfRlxAbcEA/
	xeEfbexQXxgZBwP/66tF0cgmp8Ody9RlE3rG2YvlzaOcbRo72eWyw5vv5kidZ77qwLgv
	nTL7sdqkTMBWrIE63E3qFOpxpct8+GztTz5bnyw4ANg+Br33mRVsi9mewzF0v/UWuJt7
	UMVA==
X-Gm-Message-State: AG10YOT2+TEjePxCXdS6A3MTkTD6hq0DNQf5s8pbbFnNQDHdCC8DYJ0lNoGHeZAl6d/egw==
X-Received: by 10.140.201.20 with SMTP id w20mr13497322qha.10.1453590621416;
	Sat, 23 Jan 2016 15:10:21 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:03 -0500
Message-Id: <603b9c9d49db9fee00b9685bf6113c63df2d5dc2.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 06/13] python-lxml: update to 3.5.0
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:22 -0000

---
 meta-python/recipes-devtools/python/python-lxml.inc                 | 6 ++++--
 .../python/{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb}           | 0
 .../python/{python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb}         | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 1d5d7f4..ac0f0bd 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "a9a65972afc173ec7a39c585f4eea69c"
-SRC_URI[sha256sum] = "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099"
+PYPI_PACKAGE = "lxml" 
+
+SRC_URI[md5sum] = "9f0c5f1eb43ff44d5455dab4b4efbe73"
+SRC_URI[sha256sum] = "349f93e3a4b09cc59418854ab8013d027d246757c51744bf20069bc89016f578"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb b/meta-python/recipes-devtools/python/python-lxml_3.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb b/meta-python/recipes-devtools/python/python3-lxml_3.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.5.0.bb
-- 
1.9.1


