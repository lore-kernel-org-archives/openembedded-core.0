Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id CFF56601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 16:15:43 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so11409654pad.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XHbvxzSiB2XbO6RynvN6de4IndI00RpRP4IEhivznXc=;
	b=YjK1BPE+R6hteQ53E4r/dPfU3dvh6ER4Yq8daXe5UHMtgWIo1OxxlV7dCR0/9RJk3A
	fzgxqcrALIFGl86ckMGfquswcM9uk7wh1X1BJlXzatisMzft4gQadCI81IpKX2yCb2y7
	wM8ZVYZlvxPcDMSX9ATCI4SMOgmRuPk2hTGzz7D5VJkbjjHmInK+uBkjz/3JmkxTDhFZ
	l9EchGzkd14QVDU9SwSnPLo04n1InwgQM+CBIMIbA9i1PszBVKGta+T/wdUqj47HN4ET
	6fcg3nxHIYhQUEDyS7wWc2ni4mSLjXptOvEr4RJIx+A5v8WX1HAwRuJyomWqUcY6Cga/
	wa6w==
X-Received: by 10.68.228.106 with SMTP id sh10mr42477272pbc.109.1407773745265; 
	Mon, 11 Aug 2014 09:15:45 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	kl7sm18165617pdb.13.2014.08.11.09.15.42 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 09:15:44 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 09:15:36 -0700
Message-Id: <1407773737-16725-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] python-dbus: use PACKAGECONFIG for doc generation
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
X-List-Received-Date: Mon, 11 Aug 2014 16:15:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

Adds 'docs' (for html doc generation) and 'api-docs' (for API doc generation)
configurations and leaves them both disabled by default. This avoids
autodetected dependency upon docutils.

Fixes [YOCTO #6530]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/python/python-dbus_1.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python-dbus_1.2.0.bb b/meta/recipes-devtools/python/python-dbus_1.2.0.bb
index e64f99f..b314dce 100644
--- a/meta/recipes-devtools/python/python-dbus_1.2.0.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.2.0.bb
@@ -14,6 +14,10 @@ S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
 
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python-docutils-native"
+PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python-docutils-native python-epydoc-native"
+
 export BUILD_SYS
 export HOST_SYS
 
-- 
1.8.3.4


