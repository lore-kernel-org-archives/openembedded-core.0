Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 913DA7711B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 07:01:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so14739235wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XyVpYWfQXyt4yMfIk1pB7EwJWCpkrZN+Us+Qz7929bI=;
	b=BRKpluHu/JKYuTG3FuV0jyfB3VskuSsHfKzcW50sqCO76+Y9/ZlwZAfqa807LGrPpz
	/p0t27eUMhqKHmq1e0UKHtWiHUEoR/WJPAJiG3ln8wgeMnffQARDG/wKIo0D0eEE46Ni
	iEoMwSCBzBxtfYPYmH1KZWNN2viHuEZs08bHwVYNdUJQrjaMmw4iE1eKPw7DgTuq+Wp4
	EGd+y3hEzOgLEty2kr5WSnytWUfAITnOalddSBl5YQyo90xaTq8wGNEacnfj4mswOf3Y
	o7sbcRr9R4bbUlA4raCNG9FQ4wXG0UYk+MsG4O8fKcWW04ZGdJhHMqlGFetcInf6lFBn
	0YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XyVpYWfQXyt4yMfIk1pB7EwJWCpkrZN+Us+Qz7929bI=;
	b=ffMU2PiBsFRoYsXj49Wg6rXz+HsoQlny7yQvtdHehoffAMQG9jI3yaYa1EMJaJji/2
	5mp6b9DjzopuXTIgEvrSY0Jm7Gao+OGMK+CI8jCg/6K/35GraoyL1iHTZBzvEZqVq9XN
	vtPf7poeS3YIH2nqgGbrCbaKZrlIjxTi7cJ3WsRtnh6bVmMDDFnxKFQOPHP0drAxgyMb
	trgml9/YFNflNk2Yl4aGiUr7ZOjJ7qCPmt9ziz0mKtuFvrafjbX4cOdWT7EwB0q+rW9H
	xJDkFp4zRPn7ImedbZSahFOIoKHOpSDBSdlKBld6XBGxuTWsjLY/ApQW7lp2HY+MLGtt
	1CpQ==
X-Gm-Message-State: AEkoousQsQ3VyVF9Y/ozgGW7T2o+VSz+QMcouLh4BPsSTgy17IafvqwgLW6W5yEhvCupbw==
X-Received: by 10.25.219.10 with SMTP id s10mr5797827lfg.101.1471330912375;
	Tue, 16 Aug 2016 00:01:52 -0700 (PDT)
Received: from localhost.localdomain (m77-218-246-155.cust.tele2.se.
	[77.218.246.155])
	by smtp.gmail.com with ESMTPSA id 196sm583412ljf.5.2016.08.16.00.01.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 00:01:51 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 09:01:48 +0200
Message-Id: <1471330908-26345-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] bootchart2: fixes a BOOTLOG_DEST typo
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
X-List-Received-Date: Tue, 16 Aug 2016 07:01:54 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A flaw was observed in bootchartd that BUILDLOG_DEST should actually be
BOOTLOG_DEST, this seems to be a typo or mix-up which has been fixed in
upstream.

Cherry pick the fix since bootchart2 0.14.8 is still the newest release
so far.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...ed-Missing-default-value-for-BOOTLOG_DEST.patch | 30 ++++++++++++++++++++++
 .../bootchart2/bootchart2_0.14.8.bb                |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
new file mode 100644
index 0000000..f710461
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
@@ -0,0 +1,30 @@
+From 2225ab2038bfe50f16f972e39d89bcd0bd7767f5 Mon Sep 17 00:00:00 2001
+From: Steffen Pankratz <kratz00@gmx.de>
+Date: Tue, 9 Feb 2016 13:49:42 +0100
+Subject: [PATCH] Fixed: Missing default value for BOOTLOG_DEST
+
+Upstream-Status: Backport
+
+BUILDLOG_DEST seems to be a typo or mix-up which was introduced with 281d1df80884bf2969c509ec60ee8a6593524fe8
+
+Signed-off-by: Steffen Pankratz <kratz00@gmx.de>
+---
+ bootchartd.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bootchartd.in b/bootchartd.in
+index f58ab9e..30af677 100755
+--- a/bootchartd.in
++++ b/bootchartd.in
+@@ -37,7 +37,7 @@ PATH="/sbin:/bin:/usr/sbin:/usr/bin:$PATH"
+ 
+ # Defaults, in case we can't find our configuration
+ SAMPLE_HZ=50
+-BUILDLOG_DEST=/var/log/bootchart.tgz
++BOOTLOG_DEST=/var/log/bootchart.tgz
+ AUTO_RENDER="no"
+ AUTO_RENDER_DIR="/var/log"
+ AUTO_RENDER_FORMAT="png"
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index d0555c3..e6b6611 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -92,6 +92,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 SRC_URI = "git://github.com/mmeeks/bootchart.git \
            file://bootchartd_stop.sh \
+           file://0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


