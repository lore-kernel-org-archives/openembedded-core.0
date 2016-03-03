Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 884A577139
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:41:43 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p65so6090007wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 12:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uWL5fGW5o7XHkZ0TK5Mq0yLsPI+8ipFfKJDvfLInj08=;
	b=PCAAw9blIXFmf6VgiFmu+kPJ3jai70bVozHVDRvmN4+d7MLVAvRfwWFS/zmCR1xZ2i
	87MU/DtD7DSyjSfPlWmFKYY2JkuVsAOfSp7App0/LFFjInr+g7Yxk9NcCzOcfMYbx5R9
	2RRZugQ/P4ga3emmEXiOgTLeWdeDgdSZr8V6kFLqLrcjVF/2rStgCkDlTjxj+nPfL2BT
	lYr1+IZTDj8bZYHVrXGRGzX9opVt1tQz/tN5BOEgCFcvfSazMsQQVruGTxF+MyGdtnGX
	9BxqMcGuOc0LayMsT0+CWrIVGq8W7axVhG+eOfK9Wb+Id3hT8GUx3paKhsixrq4KML6P
	gllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uWL5fGW5o7XHkZ0TK5Mq0yLsPI+8ipFfKJDvfLInj08=;
	b=Ri6DfTj+4lTZ3Wg21UQHEC2WkdJ65dbaTa+XhjfsPT6Gcz3oNkz8AikVzNZBL2mJVR
	gEfrFYy6NwosrNQaJpuFUm6A4VrdPaoOIqabKbA8oantDkzMUrf1tW94chDmcs80yf7P
	hTpa9RrcV1UXOuVGzrjwafErPafIU2wpQG7fDS/qMr6ZuYJJr9/5y6ci4T3cXcvX/INB
	v8XMn4GO/iTxE9t/mZRn4JOxpy7VDrGVk2o6EC5u6XdVYEdNcxceYy+kyMmstJ5ubne3
	VHi5N5ce/tWiK5q5WWoq2jdEBefB2JQdbtduSreyr/w2bz92q3TWqVi0Wo65hj5a2Ocl
	02bA==
X-Gm-Message-State: AD7BkJL0jsCW7krxGADig5EIEKcX4O5/GJDiIYlbyNh8svF3pZvSyv50UruoRHDqUYOpXQ==
X-Received: by 10.194.71.177 with SMTP id w17mr5866353wju.36.1457037704554;
	Thu, 03 Mar 2016 12:41:44 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	s66sm192467wmb.6.2016.03.03.12.41.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2016 12:41:43 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 21:41:38 +0100
Message-Id: <1457037699-13788-2-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1457037699-13788-1-git-send-email-johannes.pointner@gmail.com>
References: <1457037699-13788-1-git-send-email-johannes.pointner@gmail.com>
Subject: [Patch v2 1/2] xcursor-transparent-theme: Add new recipe for git repo
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
X-List-Received-Date: Thu, 03 Mar 2016 20:41:46 -0000

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 .../xcursor-transparent-theme_git.bb                 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb

diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
new file mode 100644
index 0000000..580967a
--- /dev/null
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Transparent X11 cursor theme for touchscreens"
+HOMEPAGE = "http://www.matchbox-project.org/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SECTION = "x11/base"
+
+SRCREV = "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
+PV = "0.1.1+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit autotools allarch
+
+FILES_${PN} = "${datadir}/icons/xcursor-transparent/cursors/*"
-- 
2.7.2


