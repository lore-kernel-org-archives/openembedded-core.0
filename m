Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id A7FC1618F7
	for <openembedded-core@openembedded.org>;
	Tue,  3 Mar 2020 21:09:04 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id lt1so1911855pjb.2
	for <openembedded-core@openembedded.org>;
	Tue, 03 Mar 2020 13:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FEYr0g6OWfXkwT6dyysYez6GrIj+EsRLqqp/ZdQ7NYE=;
	b=CZjZiQ5kS+E8Ub6PtTCU+wIwfKSCuVeFkzXnVKCL80pEOSzPv/EZ4PJ0nU4WriRLnh
	FJMcLZpyCMBpku8h7eThEY0ZHN8buto6pF6kMCp2CJ+4LGcA56S3CngaND1yzuqVL0kD
	mL3rRuyfS1XzIw50/AJYchB6c4qAUl4HRKV6vs4Q8ZtqfFJDCDLCqqr0XcSm0dB9CrS0
	iDYZPXN1LGwsAdIcD+VcleOe2QJkymq7cHP/PTxuK3hhwmLEJkOg4Roa2qoE0kWOzdne
	NoT+v2OxWzHmEcjZFzvzAU+hvUuS3rDJszs5wEv5GKQTvs3PE1J3jlC2Y4pK65o9ktbO
	YMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FEYr0g6OWfXkwT6dyysYez6GrIj+EsRLqqp/ZdQ7NYE=;
	b=QTSMzomW1WrgXaT6wYUktCsGS2aVDfM/h6kZr48sw4jaXNjWuAC3dnmlRJx2o6cnVD
	xIe0ePYycMaePvMyaNvMRMkiMCI/8wJeBnP1DPWR8tRT0TImPElxwqb7VXWGhkKq6mOg
	DP8edcQEho6i55h1dnOc9dI6DbC28qzTwGvsw6oxjGSnSqWJgmNSxP5MCWym7rvfQ7tI
	nSe1bdMqcCHe/Me8P0owDM3Bs0xyxb/qhCxlcVjb4sEItkIicLHMwXdsCVaQgihoqN2L
	N9uTeUVZRIQIqM+QhTRqBx/AaLWTZ8RV0sQ2rYAEta35OZNPvNLl/+Z9Lacrgagio+3C
	/DFw==
X-Gm-Message-State: ANhLgQ0amx691sHpAbuqsgS3b4BDlsFThFMIbpSpTmVvTqppCDUnibnq
	vwX0poO+BHOQ2nB3DbU3nkJliWkh
X-Google-Smtp-Source: ADFU+vvcqbpF/C1KGUtlg3oxkMOAfUpvRZA8ab3aZJ+tLqqDNukDIWJpIZanEZTI92vscalMbjZv8w==
X-Received: by 2002:a17:90b:34f:: with SMTP id
	fh15mr474335pjb.49.1583269745303; 
	Tue, 03 Mar 2020 13:09:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id s23sm124742pjp.28.2020.03.03.13.09.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 13:09:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  3 Mar 2020 13:09:03 -0800
Message-Id: <20200303210903.29570-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [v2][PATCH] libuv: move from meta-oe to core for bind update
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
X-List-Received-Date: Tue, 03 Mar 2020 21:09:04 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>

[v2]
Add maintainer
Update to newer version in meta-oe
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libuv/libuv_1.34.2.bb                     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 10095ffe76..d724148014 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -392,6 +392,7 @@ RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
+RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libvorbis = "Tanu Kaskinen <tanuk@iki.fi>"
diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.2.bb b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
new file mode 100644
index 0000000000..234cec37bb
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
+HOMEPAGE = "https://github.com/libuv/libuv"
+BUGTRACKER = "https://github.com/libuv/libuv/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
+
+SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+do_configure() {
+    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


