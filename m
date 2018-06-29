Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 62EB174EAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:46:54 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b188-v6so2282491wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OycJgxzX1tSFCqJqPlmRbXrd8uwlLvW1f+38ghClWLo=;
	b=ZvCYCnkSXGMAWiQ+wcGpHxW3Go0mbAnY2Goc/s3eOvdEjS5qFnFTiAAogt987Lb6NB
	oKL68cpyiWhYSS5jAvYWbOATv3aTklbj8cgWR37zcoTX02Fe6tgFz5c8Svqko7EARKBg
	SKbpmyf+AnJY1Irql8oA3VSJCe3WJZspSJv2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OycJgxzX1tSFCqJqPlmRbXrd8uwlLvW1f+38ghClWLo=;
	b=JIvhu/o1dsSBQdXj4rYHfAG5KN3OmaAvaVqR+6UDLR0CKTZk8MpY25nzPz4qXSmg+U
	mUqghffxHh7W4QclSdB1aqvwuMNfbiKNHo0f0RiH+vM9vsbeerHXZ0R255n/79yNJQgf
	lpELuA9MvOFp/sYuZf2vnn92BT6f2tBO9sQ9c3scmRdmfg9FE+zXt66vREyIV6LbZpKA
	R4MNhtRYmVylBbrReWqG2vxw+55YQ6+z7Wou/UcZB/uofvrJZ7nyvm8Dwwq2rnz0sMuH
	zBFEzRpjE5H8EDmQp3uBCFBzLJehSbAWdMJQ2Vpv/KwnTOqL9B83qYKJ7ISt0nAzpEBY
	ooPA==
X-Gm-Message-State: APt69E3usClvi3feRw2jziPldPy8ffaUSkIPIj8ht3wgapClyGipvr2t
	B6AjSzTSt6z+6UuxUPxkKi0XNqzirms=
X-Google-Smtp-Source: AAOMgpeRe6DfClNjOAC7/iRpXM98UyyrLEUH8za1l6AWj0JKq69uNjvnLcTIe6AJ0WICoUN+ct/Zow==
X-Received: by 2002:a1c:7d58:: with SMTP id
	y85-v6mr1843672wmc.91.1530280014830; 
	Fri, 29 Jun 2018 06:46:54 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	r15-v6sm8119573wro.21.2018.06.29.06.46.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 06:46:53 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Fri, 29 Jun 2018 15:38:31 +0200
Message-Id: <20180629133831.21377-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629133831.21377-1-nicolas.dechesne@linaro.org>
References: <20180629133831.21377-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [sumo][PATCH 2/2] lame: remove LICENSE_FLAGS
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
X-List-Received-Date: Fri, 29 Jun 2018 13:46:54 -0000

From: Kai Kang <kai.kang@windriver.com>

The patent on mp3 format due to expire, so remove LICENSE_FLAGS from
lame recipe.

Ref:
https://bugzilla.gnome.org/show_bug.cgi?id=774252

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit ef98095cabeb54bd86c2cb78229a1180c7403d4d)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
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
2.17.1


