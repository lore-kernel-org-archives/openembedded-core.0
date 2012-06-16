Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sfxab-0000Nr-Ip
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 20:19:13 +0200
Received: by werg55 with SMTP id g55so2668975wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pM+4WmX7km2mbgBiJP3moOGB7S/ZrFHGZqk0YEMe+7s=;
	b=KxauhJNco2+TQD08FBtnaIYuYx+3l1SIP2FPstW4K08eRn/U/3yHSuBKR2u0pBHe/I
	7gRZcYr9yd/PlduCdJMfKQ43hs/oeJZyE+ev4JI6rYZPrUYi4OImxRYu0N+RV9eO9j0U
	5Hcgi4BsXzTkqz8iDLQ0CdctNS/XEZPakFoEQZkK5sNsO43Bb0JzZ7X7mQ6uL5NKLUzl
	8MOAHg3IWRRekUEDojPQNJ9p+ggZ2HWX/jmZ+/jTqoLUIFEx+Jwxpgk/ve8mD86pLtDF
	IhTpZQdqccZQHzgcz0+peeZ0qXH5bAoDB5g/f/onT5dBdzdBTqNhK2RU+FZnMZrsc1bU
	uPhw==
Received: by 10.216.143.146 with SMTP id l18mr5049190wej.56.1339870113640;
	Sat, 16 Jun 2012 11:08:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eb8sm12457157wib.11.2012.06.16.11.08.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jun 2012 11:08:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 20:08:19 +0200
Message-Id: <1339870099-24648-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1339870099-24648-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120508180256.GB3138@jama.jama.net>
	<1339870099-24648-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] tzdata, matchbox-session, mini-x-session: replace RCONFLICTS with RCONFLICTS_
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Jun 2012 18:19:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2012c.bb       |    4 ++--
 .../matchbox-session/matchbox-session_0.1.bb       |    4 ++--
 .../mini-x-session/mini-x-session_0.1.bb           |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012c.bb b/meta/recipes-extended/tzdata/tzdata_2012c.bb
index fab8e01..bce787f 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012c.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012c.bb
@@ -5,9 +5,9 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=3;endline=4;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r0"
+PR = "r1"
 
-RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
+RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-arctic timezone-asia timezone-atlantic \
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index dc10031..3faa16c 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -6,12 +6,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://matchbox-session;endline=20;md5=180f1c169a15d059a56c30094f6fb5ea"
 
 SECTION = "x11"
-RCONFLICTS = "matchbox-common"
+RCONFLICTS_${PN} = "matchbox-common"
 
 SRC_URI = "file://matchbox-session"
 S = "${WORKDIR}"
 
-PR = "r1"
+PR = "r2"
 
 inherit update-alternatives
 
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 8f28d03..bc9368a 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Mini X session files for poky"
 HOMEPAGE = "http://www.yoctoproject.org"
 BUGTRACKER = "http://bugzilla.pokylinux.org"
 
-PR = "r1"
+PR = "r2"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mini-x-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
 
 SECTION = "x11"
-RCONFLICTS = "matchbox-common"
+RCONFLICTS_${PN} = "matchbox-common"
 
 SRC_URI = "file://mini-x-session"
 S = "${WORKDIR}"
-- 
1.7.8.6



