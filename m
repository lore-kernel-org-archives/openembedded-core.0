Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id F117371FF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 20:34:42 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so12504235wiv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 12:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eMa6UAqcyQWchFDPiC8wd5xrf+9N5okpY28AeRFIOsA=;
	b=c8YAkka9TGzQ7s4wpTRssGOdmk1SLgq61W9sDweqE22CTP4hTF7WMyPaAq7AOwl9hG
	npO1CE/krw1JXm7avgRiG2DIKpBspqPIyieF2dsfQlrUIgSUib7+LMeaE3EDsG+ju51h
	bna5BwbCX6H7wBuo/rhLq2IpwrhuCTG2bpIT33Ozz7Us23zcnL35I76f3xhpUdnDRh6z
	6EmETXglp3uF98Rm5W+mVSIyWrlrzJc/roZKP40p7/Yjn6RLf/FpU1aMqoyhTiLK/V8e
	iHy2B9raO7E3KX3U9y+DCw47WXnXry3qZUnQMuFMdSwGZx5nyQVa0rvq4L5/eNVWgDjm
	Zovg==
X-Gm-Message-State: ALoCoQl2Xh/7LB3YdAVUGOtkPZAfgO9vIKJ7u7I5RcuweLUhc9kONlry/IcbKnKfi2wW2NU0jjLh
X-Received: by 10.194.92.42 with SMTP id cj10mr57420102wjb.6.1415219682862;
	Wed, 05 Nov 2014 12:34:42 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id he3sm5321370wjc.15.2014.11.05.12.34.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Nov 2014 12:34:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Nov 2014 20:34:40 +0000
Message-Id: <1415219680-24341-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] buildtools-tarball: package all of Python
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
X-List-Received-Date: Wed, 05 Nov 2014 20:34:49 -0000

Instead of cherry-picking pieces of Python to put into the buildtools tarball,
ship all of it.  We can't predict what bits of Python will be needed in the
future.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb |   25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 283312c..58e0ffa 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -9,32 +9,9 @@ TOOLCHAIN_TARGET_TASK ?= ""
 
 TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python-core \
-    nativesdk-python-textutils \
-    nativesdk-python-sqlite3 \
-    nativesdk-python-pickle \
-    nativesdk-python-logging \
-    nativesdk-python-elementtree \
-    nativesdk-python-curses \
-    nativesdk-python-compile \
-    nativesdk-python-compiler \
-    nativesdk-python-fcntl \
-    nativesdk-python-shell \
+    nativesdk-python-modules \
     nativesdk-python-misc \
-    nativesdk-python-multiprocessing \
-    nativesdk-python-subprocess \
-    nativesdk-python-xmlrpc \
-    nativesdk-python-netclient \
-    nativesdk-python-netserver \
-    nativesdk-python-distutils \
-    nativesdk-python-unixadmin \
-    nativesdk-python-compression \
-    nativesdk-python-json \
-    nativesdk-python-unittest \
-    nativesdk-python-mmap \
-    nativesdk-python-difflib \
-    nativesdk-python-pprint \
     nativesdk-python-git \
-    nativesdk-python-pkgutil \
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
-- 
1.7.10.4


