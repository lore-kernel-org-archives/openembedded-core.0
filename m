Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF8D611C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:44:47 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id p8so19016242iln.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nyxYfkC0QN7wEk4WsWv+e/s+Sn80EPXnaKNT/nESj1o=;
	b=cPVzmW8wq3GcjL76t/OCM9Nav1Rw72gcEhOOWC52XR8HrGJuojkTurq7M6tB9Eqf4x
	/TbsT2Ld/fm1OS9PsorTyp50A5+k38k9cPk66y3PMLK17xLyvmHZcHOtF2Ib8rZ3oSvS
	tMZr+smB9qXRiENSvqgsz22tetxRomfoEi7ZYB9YAFX7MF8lR+mOZHnVBgZXZnpDb82W
	uKlrVKlE8rI2m/juad/dfzQDKRWZ6S9lWq5qqkeH3d0g2qlf24Bik3nSsavF72Jngvhb
	tnIuOtNeOUnesLLmmqnzvHVnj7lx/7ODEM79ViW/+cg1zxuIVQnkJUWmAgXsxvfQEKsU
	mBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nyxYfkC0QN7wEk4WsWv+e/s+Sn80EPXnaKNT/nESj1o=;
	b=H5vcnp3uut3nxmnNdqgiBjhhw7vZCJ9Ks5mlxCfAGnnhUfWws+QeKo+7JXPLrqrD9q
	0Js4eCyAc0q2sDFqccB6udh8IdI6SeHJf2x1Y+uIOXt7D4V1O1nj8tIYXiRBz8iq0wEC
	PPbMZc8tXVEZsIeVjXtteFbQs6dsPqq39rnMgEc8XsC+OPIihZQhVDAIiArwpbMwG5CG
	0OunZtDUj7ipCEN8onx6GYx4mfS0cy/ULHSJBLng+EH4k9gEswUoutyTzJF3D8wiHYhF
	7fkLIcxdQufKe1fDAI/SvQwodn/1RoPdrq+3YVv8VuJ8AAgPNWJXtPm6TOXYQ3+sCMqI
	pDyA==
X-Gm-Message-State: APjAAAVo/EG+m1OX9Rw/uISTx/Seq5bDBc99P0tGEsRCuW0XLvUyy/1U
	TFZpFOR2Fo6HtjkbM2qb7Y4Q6Uvg
X-Google-Smtp-Source: APXvYqyWUv/C3BHUk4bXpSNrhEJYgApk0e9O5WDq7aGym8vLzekGCgwIuKCQmADEnNg4XfRMpn3KZw==
X-Received: by 2002:a92:8f4b:: with SMTP id j72mr22752222ild.1.1582073088341; 
	Tue, 18 Feb 2020 16:44:48 -0800 (PST)
Received: from farscape.garmin.com ([2605:a601:ac18:c700:d658:3b67:74f4:8891])
	by smtp.gmail.com with ESMTPSA id
	e13sm125163iol.16.2020.02.18.16.44.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 16:44:47 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 18:44:43 -0600
Message-Id: <20200219004444.21297-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219004444.21297-1-JPEWhacker@gmail.com>
References: <20200219004444.21297-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] jquery: Add recipe
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
X-List-Received-Date: Wed, 19 Feb 2020 00:44:47 -0000
Content-Transfer-Encoding: 8bit

Adds a recipe that packages jQuery in a manner borrowed from debian. The
primary purpose is to make the diffoscope output from the autobuilder
easier to navigate.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     |  1 +
 meta/recipes-devtools/jquery/jquery_3.4.1.bb | 29 ++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/jquery/jquery_3.4.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4a267faabce..901d607f2ec 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -284,6 +284,7 @@ RECIPE_MAINTAINER_pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-jquery = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-kbd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
diff --git a/meta/recipes-devtools/jquery/jquery_3.4.1.bb b/meta/recipes-devtools/jquery/jquery_3.4.1.bb
new file mode 100644
index 00000000000..e1080aec1d1
--- /dev/null
+++ b/meta/recipes-devtools/jquery/jquery_3.4.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "jQuery is a fast, small, and feature-rich JavaScript library"
+HOMEPAGE = "https://jquery.com/"
+LICENSE = "MIT"
+SECTION = "devel"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}.js;startline=8;endline=10;md5=cdb86f5bda90caec023592d2e768357c"
+
+SRC_URI = "\
+    https://code.jquery.com/${BP}.js;name=js \
+    https://code.jquery.com/${BP}.min.js;name=min \
+    https://code.jquery.com/${BP}.min.map;name=map \
+    "
+
+SRC_URI[js.sha256sum] = "5a93a88493aa32aab228bf4571c01207d3b42b0002409a454d404b4d8395bd55"
+SRC_URI[min.sha256sum] = "0925e8ad7bd971391a8b1e98be8e87a6971919eb5b60c196485941c3c1df089a"
+SRC_URI[map.sha256sum] = "8da74aec0fcdd7678a2663b3cc9bafbaf009e6d6929b28bb3dd95bced18206f6"
+
+inherit allarch
+
+do_install() {
+    install -d ${D}${datadir}/javascript/${BPN}/
+    install -m 644 ${WORKDIR}/${BP}.js ${D}${datadir}/javascript/${BPN}/${BPN}.js
+    install -m 644 ${WORKDIR}/${BP}.min.js ${D}${datadir}/javascript/${BPN}/${BPN}.min.js
+    install -m 644 ${WORKDIR}/${BP}.min.map ${D}${datadir}/javascript/${BPN}/${BPN}.min.map
+}
+
+PACKAGES = "${PN}"
+FILES_${PN} = "${datadir}"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.24.1


