Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4696168E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id p17so305742wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hgQ4vHqChVGcHDgVUZvOQn39oqMayn8tv2rpnJ7D+tU=;
	b=Zb8cFZ0ayOHuxvKp8dBeytUZxkEbSM9nDKM2uqAdCCkpEsTBSwcGUxxq4JXfedZ+mo
	4eUNt/Rhnq0XDkTQJFx2QfpDWPcDwUCFGHssJIucd0CPBFtsMMuVZaEOR4ooKSw26tTI
	xvfrUGNGAFaCocCkar1sD5khJxiTPlLH9qX9Q0upz39z6MPKGX3iCZHeikGCijBLuECG
	4la6dByz74xRXIcmbL6QmGzK7sjx+JDTjyGgrm6LDv5pRpO80D8aeOhsNP5PTI9ciIm1
	Q1sMaUj7fguyLnQ4r0HaBrihOZaFvt9g9vrY/XIYKTSID0usDw6RS8fTAp3CTOU4dmyN
	MoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hgQ4vHqChVGcHDgVUZvOQn39oqMayn8tv2rpnJ7D+tU=;
	b=nIo6DcVTolx+NL2xuOpcMVeoNGzvxVvT+tpoLdDmQlvljJ7c/5QTYqzitOlJjU96sf
	OlZbNI/FeVXb/bgS66wIHmMVaai6qIK0J+6LndkbTwjJoyh6+vmVowJWqX7qsqiTEMUv
	JX0rRHDmMvYjd6ToggSzXFV6mtLjOoxRBJAKalFyQj0qTgZuxzmcww4+I5EbFCO5T7PS
	29uCH05o0ux1452y7JNJpoMp/URERVhuZ6/yQPSakkkEWB1/1Emjzkjwar35aevaygHj
	BH7b03WrSb8vXzKhz71nAEw4v/F1X5SuCkMMC853VoyJNtGqbIxZaLuHl3taQ839fwWm
	z66w==
X-Gm-Message-State: APjAAAXd12Nqus3xleKaiVuGCmCt2Vnp09gqW6GO7tYAOxw1AA9ngMjz
	AgZwYtONAJLTh0zOauB0/v552uLS
X-Google-Smtp-Source: APXvYqxlreir307fPLvaA+gOVWK9wxVaymXkYMEpQym618o6DoTg7Yv9UxGLlSJA7BkYMdoiaLhJ4A==
X-Received: by 2002:a05:600c:2255:: with SMTP id
	a21mr587078wmm.79.1582656849680; 
	Tue, 25 Feb 2020 10:54:09 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:28 +0100
Message-Id: <20200225185335.19326-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/12] python3-docutils: upgrade 0.15 -> 0.16
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:09 -0000
Content-Transfer-Encoding: 8bit

License-Update: formatting
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-docutils_0.15.bb => python3-docutils_0.16.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.15.bb => python3-docutils_0.16.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.15.bb b/meta/recipes-devtools/python/python3-docutils_0.16.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-docutils_0.15.bb
rename to meta/recipes-devtools/python/python3-docutils_0.16.bb
index f5c3f5d707..50547a1b0c 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.15.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.16.bb
@@ -2,13 +2,13 @@ SUMMARY = "Text processing system for documentation"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=35a23d42b615470583563132872c97d6"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
 
 DEPENDS = "python3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "f51729f19e70a9dc4837433193a5e798"
-SRC_URI[sha256sum] = "c35e87e985f70106f6f97e050f3bed990641e0e104566134b9cd23849a460e96"
+SRC_URI[md5sum] = "9ccb6f332e23360f964de72c8ea5f0ed"
+SRC_URI[sha256sum] = "7d4e999cca74a52611773a42912088078363a30912e8822f7a3d38043b767573"
 
 S = "${WORKDIR}/docutils-${PV}"
 
-- 
2.25.0


