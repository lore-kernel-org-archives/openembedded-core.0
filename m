Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5173277CE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 02:51:03 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id z1so5088125pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 19:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+Lj8UJl6wX0O9BcHh6U14G2DfA3My0tTPAlJJh0bxFY=;
	b=l4qzFZjZ8b039zqGe5JKgMgPnIxq7LjzXmFDwmP/iMyI8kXS6HMXGN01ldDgllpUs4
	W0AxtoQcmxbeD7YuzPUVTj3uwQK5cHgZF2DJGB1FmPf6g4MJ0TTx8pnfyWrlk6SK6wj4
	LAcRjFpGy1XueUmjlNDibKoCxaPX/gbKSlx4fL9bCDEtIxbYTmmMFe3By9VwmlaVkWYB
	fC4E4ksTlTW89Jw5+SK3yzihJzcD//f0MjtPRKodHMmBp41i/bQjvuGRh6YOUhf0V3X5
	WJVGPQaRI8h+d4+QGES6ISacFdd6IDb4LXXuDhXVF7eAMuB1i2oTd0leDBLa18eE+a2H
	/IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+Lj8UJl6wX0O9BcHh6U14G2DfA3My0tTPAlJJh0bxFY=;
	b=q+5MBXDqSSA8lRmNY0TooAJz5Hx4o6zRoHs5Lgymg03ML3w3Ooc1woZOeMYchnGS/7
	4qC2+k6Vf+qi/KOaYUVabdGmqlEUpj4z3lJOkM5fbdagYhIq86Cx+plNw+72rfhbtfgW
	NRV8USaJI5hyrZeX+Fev0N15gOd9yoFY/b7JCdSA1mo77HeX1tRL9pIoELr6cv2y7oUk
	DKr6fAcB5lJfUM+cb+AWs7iofl7ICwLSvVlb3cYAZ4MVKCbBMW47TpCmNLaoHNW+y3qa
	SngWPCClhPmkLPdRueJVcWk0iw/9wdo2pqu5MA6GSNI9sR3uG6c7SNpIDa+96tR8vtfO
	bSFA==
X-Gm-Message-State: AIVw112HBmoGncx4ReB0qO7qlpUnbiOrWICjWUm6CMoHBXuWLaTR7daV
	LAnExSqXK8Fx9oAM
X-Received: by 10.84.194.37 with SMTP id g34mr755602pld.111.1500432665051;
	Tue, 18 Jul 2017 19:51:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w87sm7726077pfk.100.2017.07.18.19.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 19:51:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 19:50:54 -0700
Message-Id: <20170719025055.34644-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH 1/2] glibc: Update to latest on 2.26 pre-release
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
X-List-Received-Date: Wed, 19 Jul 2017 02:51:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb | 2 +-
 meta/recipes-core/glibc/glibc_2.25.90.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
index 5dd0c70400..429076ea98 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
@@ -22,7 +22,7 @@ SRCBRANCH ?= "master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
+SRCREV_glibc ?= "91ac3a7d8474480685632cd25f844d3154c69fdf"
 SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb b/meta/recipes-core/glibc/glibc_2.25.90.bb
index caf1ff4138..477b04d867 100644
--- a/meta/recipes-core/glibc/glibc_2.25.90.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
+SRCREV ?= "91ac3a7d8474480685632cd25f844d3154c69fdf"
 
 #SRCBRANCH ?= "release/${PV}/master"
 SRCBRANCH ?= "master"
-- 
2.13.3


