Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D70187FC2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d16so5937932wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uxOLuPS6JAIDtPt2EUImlER8He5wvcE5AgZQreIJQSI=;
	b=jT8iQxolTFxfuM/LIaXdAyBqwEzoxdF6+dUffEjCKnyN8Bo2oXwAmkCBhBLhPTuQCH
	1aZJMqRnm0MJJir1UlmJiRc0G2XAXP5WOLwCcf7syj1t4kP/o9O+iOhq+0AX11Tfb+J+
	Hb7nU3BsTv9TwHrkD29XT1V31Ippphj+Pq3spGo3+/scFn2zEM5fM3EBEBlUk90nqtuu
	W9tSFhOE6CrxaTzQ9Nc1mJb/L8COYKaCf6OR9aPss8Ur9W/6WU57Jl+dkdT/6dAxwJg0
	CKIiVuuSQGgCshxhqpmCz55x/kapHBoRpgiGJiXqArQxtiLlSR/HW/BP9yHTrKOnnq5d
	4C2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uxOLuPS6JAIDtPt2EUImlER8He5wvcE5AgZQreIJQSI=;
	b=Bu8Mji7zyvp17n+TJPQxrbPFC4vcpNMacY9+zv3mQyiY8yJkoNOUZQ0VYelBv4U4ZK
	DeB2byAeY4E1IOt2EUBxTv/UnRZPWBcL4PLB4+RjaRD4RxcbWiKOvBrn6UOQAjOZXMay
	7e0yNsugmLke49qxE5Kd5kHYReLd+IZYC/r+8UtooZBjqWdtoUCBcuB5x8WblRUFIklU
	nyblpubpRgpaDcxrWBa0wVXoCGj4CewbtC7o7BEyoEScgocZNYhF0+YECjzFvjKGir/f
	reUjWFC/WwXbKJANFJjTtXSycWhpS7UHs8J5oBQHB/iqYTi7AskVu5ZUKa++2GPQxdFS
	MlEA==
X-Gm-Message-State: APjAAAUioToHQbOcdfd/wJqu5Zq2sn5wyuXqFZPxni5HrCoYWTILHzke
	Ky7ibiG5TZyRMBuy0tH5OUFgmxIAzkI=
X-Google-Smtp-Source: APXvYqzmPCgj6EhkfE9zdcKuGHmXCKn5zn/D6gVRBmSuv/c3V2T4yvMoRIG63hvja10uoQn7M3JP6w==
X-Received: by 2002:adf:f052:: with SMTP id t18mr9248482wro.192.1576761788008; 
	Thu, 19 Dec 2019 05:23:08 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:46 +0100
Message-Id: <20191219132301.80034-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/16] resolvconf: update to 1.80
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:08 -0000

Switch to git, as using debian snapshots makes automated upgrades impossible.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../resolvconf/{resolvconf_1.79.bb => resolvconf_1.80.bb}  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.79.bb => resolvconf_1.80.bb} (90%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.80.bb
similarity index 90%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.80.bb
index 85501772880..c1ca4d996f7 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.80.bb
@@ -11,13 +11,14 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160520T044340Z/pool/main/r/${BPN}/${BPN}_1.79.tar.xz \
+SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
 
-SRC_URI[md5sum] = "aab2382020fc518f06a06e924c56d300"
-SRC_URI[sha256sum] = "8e2843cd4162b706f0481b3c281657728cbc2822e50a64fff79b79bd8aa870a0"
+SRCREV = "63b179d496d7e20cee979d44b1ad4d5a39545d96"
+
+S = "${WORKDIR}/git"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.17.1


