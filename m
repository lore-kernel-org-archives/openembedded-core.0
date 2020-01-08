Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE387FECA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u2so2498373wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VvbUkkedliBZJcF1+A58mlxc6sAnGNZyjFmngv/DEbg=;
	b=Ce/UkezlODs0hLgFH6sHRRJmWLCP684FYb1CKLerMvTSBBYk1OvEeoOwvBwuN3pl64
	muI5+BFJt0JMFt7ENPvhz2UcSzG94yP3av8Qyjo9qyQc7Er2zIkucsmetdtdJ2d4q7f1
	8QAtNwl3olam378UCu4IQCRKFp0QnJ+i0Au1wQMUTqGUmlg9H5rlCvnC1989leTYNkV9
	akSc5ohJnxgcNnvLYxCVsXmxs/q39W/ptyef1tUCbTyURNUZsDK3DE8msonbV6Z9CR6a
	sl/Rzhm2wub7/+3vG5zz1oqt5N9PzAomOeRnxUOoMmCOsBjNIUl4IjD1UT7q8FITat4u
	FZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VvbUkkedliBZJcF1+A58mlxc6sAnGNZyjFmngv/DEbg=;
	b=iivWL4+OIjYoyruxNMLnFEx9hgr1sXbJxKaR8UP0JA2K/jCQJiOduoSad1fQdfeABH
	tdeMNdcDF2CRYa5ssXRCRdKDhUcTZMc5/K+big93pztWmNjkZlDQhLEP5QYL2kGmx6aE
	QGOJ5ddMW7O+wNuiUv/OQCMgiwNRCuuhwvH5N89Q1pHeegUxxju7xk5cvty3VLV9YOXi
	+DhG1l6b4jzAeXMq8sTvzHbV44GFEACu3okH8U4kbYAxHOU3p3B0tKxZ2pAgofH2MGYI
	qPONB4/c36OC0cd2o3fVkcj9zF9Xk2uBx0TVyxLClppsUusSuVdBcxe9rd2Wy6DnmeJX
	JsNA==
X-Gm-Message-State: APjAAAXTIXwlwBYwaFYinTCyVcg+5udnojfVYXizosvXGcm5Y1FcM7Pq
	ZnvXw00fGiazK5iTt36aM8XEpA57YYA=
X-Google-Smtp-Source: APXvYqwQvezf2h7uRRyB674DOV6rotNJAlw5lBz6nSZ8i0SF7D5+P86+KqizOOL7brqjNM0hakwLow==
X-Received: by 2002:a1c:7dc4:: with SMTP id y187mr3777811wmc.161.1578490096042;
	Wed, 08 Jan 2020 05:28:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:41 +0100
Message-Id: <20200108132759.95603-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/28] resolvconf: update to 1.82
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:15 -0000

Switch to git, as using debian snapshots makes automated upgrades impossible.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../resolvconf/{resolvconf_1.79.bb => resolvconf_1.82.bb}  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.79.bb => resolvconf_1.82.bb} (90%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
similarity index 90%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
index 85501772880..67959576e84 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
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
+SRCREV = "cb19bbfbe7e52174332f68bf2f295b39d119fad3"
+
+S = "${WORKDIR}/git"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.17.1


