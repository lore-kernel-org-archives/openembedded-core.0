Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tv30Q-00049v-7F
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 10:40:30 +0100
Received: by mail-ea0-f179.google.com with SMTP id i12so2032871eaa.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 01:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=mChrJtoJHAd7dB0u6Ee2UBIta5C7I7uEaY2uvq12Yu4=;
	b=HbC27diHR2M3M25TMSey1ziAT2xZBQqE15+Glmk9eVaticKNLkO733qJMGDjcPoMTE
	YVFo03nkaQ0pzE2pJgiGGu/DmohdZvTYgRSrfyVi8ZuHXFK9+eqV8EZOF3MDP1gCON6x
	oc76vz/YUzxtzvv9mqGUUHlzAebsDM/A66hxoUG2YMhm5xBRQDegNL1x6FC9PvN8Amsh
	K6B+t3QCSBnl8ALr4dVn6WQxv127/fLyzXfkYYN9/iOUNnkKOCXfLSoND3z3AFlVuidF
	DXyYdzS79ojg0G8/dNRMqOrGdmuURiXhUvQNj0SziLIeI7jVvLiDGmoF0Mw0bukPeqm6
	LkMA==
X-Received: by 10.14.205.199 with SMTP id j47mr239112031eeo.26.1358241910032; 
	Tue, 15 Jan 2013 01:25:10 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id f49sm24802960eep.12.2013.01.15.01.25.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 01:25:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 10:24:37 +0100
Message-Id: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
X-Gm-Message-State: ALoCoQknmD22aU0GoC/fiGzs/Jq5EMfBbdLp/fCJPNipzPZeaCnDbRnLlUhGezoQB8KF36OscHAv
Cc: Martin Jansa <martin.jansa@gmail.com>, scott.a.garmin@intel.com
Subject: [for-denzil][Fedora 18 fixes][PATCH 1/4] bison: move remove-gets.patch to BASE_SRC_URI, it's needed for bison-native too if host has (e)glibc-2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 09:40:31 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/bison/bison_2.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
index e3f9273..4d82723 100644
--- a/meta/recipes-devtools/bison/bison_2.5.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.bb
@@ -9,15 +9,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
-PR = "r2"
+PR = "r3"
 
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
 	   file://m4.patch \
+           file://remove-gets.patch \
 	  "
 
 SRC_URI = "${BASE_SRC_URI} \
            file://fix_cross_manpage_building.patch \
-           file://remove-gets.patch \
           "
 
 SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
-- 
1.8.1



