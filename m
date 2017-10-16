Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 72438607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 11:58:12 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b189so2380865wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ptIrEPvr3tFgKVkS2eYTyUL9vs2L5tPtteNi4H1PIjs=;
	b=eD2l92CAuceI7cAYJCU1cjh3Y9ux95wCQ/K78Qrdtc/2moDV3YW3Lm3mLn0oP9dY3d
	AINCLvUQ262/mvCsFa5VhG559OlJ5sXI1hVNYS9PB9qBFbVKWTgERUy1zMiPg6arH6wI
	UeLC5zm3x3f9bzf+uaL5vxKnr2uGL4BZtSWEIigdkIt86ta9ptvUJ5xtxJZ3Fr0X+Wyt
	6T39jsUvB5W6F0R53JFgyxUJLuCb23SkqO/r6IAWBu1miswCZRTWMScPBu11YlS6CQHc
	4AoKZtCFISFERH9zmdtnLNpqq1qq1q9rnwUmmR+9VX03BUOzvPScDR3CifL817FzD++A
	Mh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ptIrEPvr3tFgKVkS2eYTyUL9vs2L5tPtteNi4H1PIjs=;
	b=omFV1fWVKwsPqrAeLl072eu5f3Wt1L4pPFcprj4Snu3adEXZmcTnxndCkQlL9mg9Kc
	qEyCLw/2wUK2MeUeDSxMGS3A2znMIJWq6qZ6J9Rd8/TNSk1MIloEPynI51S4gzJ4Cubv
	XtfgT/T13LFx9YMcc+3xm6FsqGQTvzqv2MqbykEqpVZSwxyMawND6XrcqfpSmyzSZxkl
	/O+ZAb52COX2i58WO8quDyh1Awh+P5HyHx2tt8iVt2eTC1fHswOLoA0zr1M2AF+YzvCg
	a1NZ3mQVz35AcKcXahSuuo1XFCBPckE5ErPJC2ZAUNYenl09T62Jqy9yQj6tOb7uWxvI
	DjPw==
X-Gm-Message-State: AMCzsaXojI/Plh19YV3T1dmi9ugplpxwRp0JWyTRi/YyddWVE8NsYtym
	x2tKxtu3YV3lTSB0jKNXbRW7PMMw
X-Google-Smtp-Source: ABhQp+Q+9W3TQFna23h7hOCFy1hF831WeswF56aeSPgiBJdLXAGrVHhFLGgmm4QLASQNPkEd4ra7PA==
X-Received: by 10.223.146.101 with SMTP id 92mr330726wrj.21.1508155093230;
	Mon, 16 Oct 2017 04:58:13 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y129sm7300596wmg.42.2017.10.16.04.58.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 04:58:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Oct 2017 12:58:10 +0100
Message-Id: <20171016115810.1287-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libxml2: use HTTP instead of FTP in SRC_URI
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
X-List-Received-Date: Mon, 16 Oct 2017 11:58:12 -0000

HTTP is more reliable in general so use it instead of FTP.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/libxml/libxml2_2.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index ec2d25a2da7..9adb29cfdd7 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
 
 DEPENDS = "zlib virtual/libiconv"
 
-SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
+SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
            file://libxml-64bit.patch \
            file://ansidecl.patch \
-- 
2.11.0


