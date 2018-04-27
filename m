Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8EC71BF0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 07:55:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3R7tImp021543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 00:55:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 27 Apr 2018 00:55:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2018 15:26:23 +0800
Message-ID: <20180427072623.422-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524808358.git.kai.kang@windriver.com>
References: <cover.1524808358.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] lame: remove LICENSE_FLAGS
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
X-List-Received-Date: Fri, 27 Apr 2018 07:55:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The patent on mp3 format due to expire, so remove LICENSE_FLAGS from
lame recipe.

Ref:
https://bugzilla.gnome.org/show_bug.cgi?id=774252

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/lame/lame_3.100.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
index ff6ac7efb2..7f8996fb52 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -3,14 +3,12 @@ HOMEPAGE = "http://lame.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=290&atid=100290"
 SECTION = "console/utils"
 LICENSE = "LGPLv2+"
-LICENSE_FLAGS = "commercial"
-
-DEPENDS = "ncurses gettext-native"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
                     file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b \
 "
 
+DEPENDS = "ncurses gettext-native"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch \
            "
-- 
2.14.1


