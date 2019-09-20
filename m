Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7627F8C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 11:16:05 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b9so6392541wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yBlt5A72ez1XKxhiaNguHUtWarmq+kWFWGjaZ8VW9IU=;
	b=v7pzqob1BtSGlJvTkTOXQuPw8MRLKTfE6scVjRMOqwN9caHdjtXihI5BYf+cypcnXO
	xEt0cZaG82CimoVxbBkhPX8hhRHQRbYdMNDDpDB5/Wki2uUoawil192/65Buax06bQGL
	NxSiGymRzYyk3lIqAzZBcRPt2lEK58/Z7ADjOw0vwLWmP3kL4HhV3IfW9CqdgeV9+YNX
	TPk+gUpEeh0rjQsjVfgsb5faXZSiH11FkRmYTUqjMrZcxBxLnzcDVl2N6qg4xSiPcCh1
	h0T0r/bh0KOgbCHEkt+UL1F8GDZj0TLAUBK/8wzjDr3x0hKK0o9BWRnp8RUUa9Hot7yA
	WXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yBlt5A72ez1XKxhiaNguHUtWarmq+kWFWGjaZ8VW9IU=;
	b=UVGGFhKV2ICUM0IGkNn4SAywt8BcOp5qQH1plqSpiL2KszWZW04/lUrZGAWt4Gcnvc
	kWCoOK1Blf9alTuJKI+iWXWuXFSrwo78IUKS/TT/OtMU+gqFQ9pX8BYY7YgpDiWEDKPx
	cfW1hlQTpRqlHdxI4qzZuJ060448AI8NJL8xkcFNyBT+GjgcXhuICwluotmO7V/MGLqn
	RiBW8ye2QplTLi1gNIqzNUOmPsrMXAsxzd0rBdZIQg1JHi/jvDazVCTODGsecgNQEvx/
	Q4ty0d43sNMVX7rx1yBVUd9nwqetdAMMyrRTAa7J9bVkdhwUUbR+FQ3eTC+7P7Ma4ne8
	yanQ==
X-Gm-Message-State: APjAAAUTxnTDcIYcFhMS9qraQLes9G/4i1ezMijA+2LSSot0PYISrXZR
	SjDWuDs5EjRYATn4LPySfRC4eaai0n8=
X-Google-Smtp-Source: APXvYqwTtVubF3hlwNWCDxn7qJH9bW4WHBqYXGr9bB5z9J42b8rtkAC4BgOsclKT5Uiy9n2xjmGKgw==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr10876402wrw.314.1568978165745;
	Fri, 20 Sep 2019 04:16:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t14sm1747724wrs.6.2019.09.20.04.16.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 04:16:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 12:16:01 +0100
Message-Id: <20190920111602.27927-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] json-c: use GitHub for upstream release checking
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
X-List-Received-Date: Fri, 20 Sep 2019 11:16:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 9654e60a3d2..fcc3e4337ea 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -10,13 +10,7 @@ SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
 SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
 SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
 
-UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
-# json-c releases page is fetching the list of releases in some weird XML format
-# from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
-#UPSTREAM_CHECK_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
-RECIPE_UPSTREAM_VERSION = "0.13.1"
-RECIPE_UPSTREAM_DATE = "Mar 04, 2018"
-CHECK_DATE = "May 02, 2018"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
 RPROVIDES_${PN} = "libjson"
 
-- 
2.20.1


