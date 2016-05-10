Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 301517325A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 16:04:52 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 145so1268081pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 09:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=m72s9pAPnvw94WuVIsLctbIOjPgNuOuqnrlmIMQuN+g=;
	b=DXqw0WvIUm0+qeF4pCNvZEF2tZrtbz1t1I9zhj8U1ACJcoR4NhOOJo0MboACBrl022
	mez4EijAQjA6CerYBzl2YC5idmgJ9Ix+p2OiC8LAP6cY4k7RsdPCssV4p+KHTKsU3sSH
	uRUh3i9pZLC41GUkzq9DvYgpvM6sXZwjHwgZ541YISYoJT+UdODJU3uypZvcM3B6pHnu
	KuuUVnojOjabhP1EepI3qqVoM/vO5GulY7pOGpSFga18dsm/2zAjGWZnoZZIf1vvDXvs
	eH0m5o/CiiyFwiywsBV80EUOvsDV+S0bqkkxpz1bWKDPBQQHveI9R+LiDA1LhfdIF34L
	fvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=m72s9pAPnvw94WuVIsLctbIOjPgNuOuqnrlmIMQuN+g=;
	b=kqdS1gLz+lvhltWKxeNNvdxYP5RONkQz5UguUciY7PxzeyhkAro1+Whx4hLHMUcSuU
	nRbVye27B0HpdqzzlNqmv2XSa+jsvOA8dh/h91ih8qETRLeLjdKGsahsExkIpodC/jLx
	kPCplcP3nJUHLFwB421aXtzHfCi40iIyff4y+nERA+s81ft8/m1hmXNPMeObTgJ07g4H
	Kw7t3C1ThrpmECHq3ylT0bUbTKDvaP8qeBkPq740taDSxrhKdInUOjlOVUXibbjKNMCJ
	v1eKD3LJAWie/9jjzyWSjN5k/8uETWieg4G0pNjgrHVAAAgjOVeeW5TKagfMgZL6nTMg
	ge4g==
X-Gm-Message-State: AOPr4FU0MeR9b3k9+dgkDTdqo4KnpjSqPxEW6miNEp6qMC2G5EPvTcNd/nCZjfLtxDB94w==
X-Received: by 10.98.95.4 with SMTP id t4mr59749630pfb.162.1462896293235;
	Tue, 10 May 2016 09:04:53 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	ez6sm5569097pab.12.2016.05.10.09.04.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 09:04:52 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 10:04:48 -0600
Message-Id: <1462896289-15644-3-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462896289-15644-1-git-send-email-danismostlikely@gmail.com>
References: <1462896289-15644-1-git-send-email-danismostlikely@gmail.com>
Subject: [master][krogoth][PATCH 4/5] binutils: disable werror on native build
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
X-List-Received-Date: Tue, 10 May 2016 16:04:52 -0000

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

binutils has some warnings when compiled with gcc 6.0. Disable
werror for the native build to work around build failures.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/binutils/binutils_2.26.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.26.bb b/meta/recipes-devtools/binutils/binutils_2.26.bb
index b70ffbf..e976bad 100644
--- a/meta/recipes-devtools/binutils/binutils_2.26.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.26.bb
@@ -13,7 +13,8 @@ EXTRA_OECONF += "--with-sysroot=/ \
 EXTRA_OECONF_class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
-                             --enable-install-libbfd"
+                             --enable-install-libbfd \
+                             --disable-werror"
 
 do_install_class-native () {
 	autotools_do_install
-- 
2.8.2


