Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D63660720
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 16:13:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i85so3072496pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2016 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=EsP+dXOUCflNt7FhiqDYk+PNIVDn6EgZO3lK+Nt60ro=;
	b=PGX6y5P0Gs0A3fRgRnCmoI/dzNwYnh3Toxoo4rZEkz9MEKOhGtDbjBIq8hkh/g43+o
	QyveLX3CYHAGF01mkyxeP3l1ozpFN/tKmDB/+fGYmhaB7uJ02babedsIiZ5HmruWZVcf
	SRDz5Bx3BmG+4QQJQUp3b28wHuIzugWfkWD4ayJpy7uWP45ExQXVMgl0oLNpucKX1Rnk
	9WeNl2/y6r30DvmzKpzbnrB1Xvrh6IeLByo0ylV2+fS4BqnC9DgNY0N7VWK78HMrzMN4
	yuE8gvfuXgaACbdXGNrx5pTB+IicZFjrh7XjTaNhxEOkDMRMxCnxRaePVwwOAaupGcYQ
	b7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EsP+dXOUCflNt7FhiqDYk+PNIVDn6EgZO3lK+Nt60ro=;
	b=Vp26l2nqlPLr4L3uSI3W/WErVyATjT6oyZ4xK8S2796wcxSGZwHRPp/buoQjTnrlYQ
	2n7ShRHmv46kwLw9W/UKfcrGNY27T5GinsKyGdJio40mIX8unwofnpWFnFQvFHLyCi5/
	qaD9ijvUBC8HATkJgKrpPoG1QqhK6mc/Xr95hCyK/eqND5fnxLFaJ07VpM/a35N3k3wO
	Jjd7NuUUJd9mllMzcxqAJLrpX9pDX9KfvjevSZFhHzOL+JHP7EQrWhhOgTDrW/vytwoW
	jigRJMjkyRDZG51wLcU6+5CBN6jtBkVfO7xlEB3VoILZsjgsBFpYnlwVgq42Y+J+C/tI
	W4OQ==
X-Gm-Message-State: AA6/9Rl2NSbAv0nM5Ivvne40xYeMCUbODBYDAkKkAA0wPgsGUzVO+gXA341n5yLxb/J1sg==
X-Received: by 10.98.104.71 with SMTP id d68mr37711255pfc.163.1475856811251;
	Fri, 07 Oct 2016 09:13:31 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:4c9c:7764:1f56:1b2d])
	by smtp.gmail.com with ESMTPSA id
	fm6sm32116443pab.37.2016.10.07.09.13.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Oct 2016 09:13:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2016 09:13:29 -0700
Message-Id: <1475856809-16759-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V2][PATCH] mklibs-native: update broken SRC_URI
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
X-List-Received-Date: Fri, 07 Oct 2016 16:13:30 -0000

From: Armin Kuster <akuster@mvista.com>

fixes checkuri AB failure.

V2] change to snaphot instead of ubuntu

ERROR: mklibs-native-0.1.41-r0 do_checkuri: Fetcher failure for URL: 'http://ftp.de.debian.org/debian/pool/main/m/mklibs/mklibs_0.1.41.tar.xz'. URL http://ftp.de.debian.org/debian/pool/main/m/mklibs/mklibs_0.1.41.tar.xz doesn't work
ERROR: mklibs-native-0.1.41-r0 do_checkuri: Function failed: do_checkuri

[ Yocto #10391]

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
index a5da936..b3c1b5b 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 DEPENDS = "python-native"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160207T221625Z/pool/main/m/${BPN}/${BPN}_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
-- 
2.7.4


