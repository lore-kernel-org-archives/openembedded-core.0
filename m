Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id 386696BA9C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 23:59:12 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id v13so6450219ljk.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=u5Go1cc4wi/QmZbDNjm5x2r6clB0azIDCrEmoGg+5Rw=;
	b=g3TLwCxtQvZdW8t5BOLt1bFyAmEPggSGcyCrRSH1Z69oKv6QWSelZMHANpM1Skf5yk
	6YevLmu8PTY5+JJosK+S43aC0uiKx31HSBeqPZlbyE2FzMd//+xQnRCefoPJ0JX8u+Jm
	ILr5I8UGeSQQHQ16hlurcaWd1whA5fiXkQkYVS+7d669KZC642/BzBXF8uewWL6wT338
	VZG0TJ3iOQDLGsMLf/FClvSARLWtMB2Qn4GCDWkEKxSVEMoowh/EvlF1tK+8ysttE6wW
	KFCisSxxSwv/9XjJnP05dfzBthr+LUvgF6slA4CcbEFlehs2C/MS4YmVsPFWK8oxz95h
	u7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u5Go1cc4wi/QmZbDNjm5x2r6clB0azIDCrEmoGg+5Rw=;
	b=ocKJiCtI9hZukr+spGfbgdnq3noFDsVMWEC1I68hgZhSlrVkzRlr/+oVRUMbqkWZfQ
	CvuyYTdf8Mr0odT/oHybJGJs4pYviLg/QIXQJSB3J3wyS/AEAFJVwNE8UqtxPw8Kssuh
	pmTck2v+DSAsz2F/QpPBZlPMyrTkoeufcgXpBcwPRlVPu1k+e1E/V1KisPLEjDSFQGBb
	5Xc6BGEK8KAbUPkRM+hY5Opr0dxNGACFEAkQNIKgyOPeqHnv7NIfLI6yOTlZQGn/XOsU
	7/Gqk47Yd6E0BsVDsNE8gtc10lk+qML6WGw4ELo6kG69ql1zFboijfnJCS4mye6qGVaV
	TjfA==
X-Gm-Message-State: APjAAAWc4Pqy1adJfS5q7WvhBg05p+3hH8lupFMnnmkGVyZ4p0z0ZxUw
	g6NzT9DGPdl9zp0gn4aK/nVbE7RWf3c=
X-Google-Smtp-Source: APXvYqyT1XebSLgMygzlLRwNonOpbdjZCElzICo5ARLO3HqfuonWCCBuU607vzFnN599jP2aAi47Jw==
X-Received: by 2002:a2e:960b:: with SMTP id v11mr23057277ljh.135.1554076753344;
	Sun, 31 Mar 2019 16:59:13 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	e18sm1734542ljb.12.2019.03.31.16.59.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 16:59:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 01:59:09 +0200
Message-Id: <20190331235909.15648-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] librepo: update to 1.9.6
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
X-List-Received-Date: Sun, 31 Mar 2019 23:59:14 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../librepo/{librepo_1.9.4.bb => librepo_1.9.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.9.4.bb => librepo_1.9.6.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.9.4.bb b/meta/recipes-devtools/librepo/librepo_1.9.6.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.9.4.bb
rename to meta/recipes-devtools/librepo/librepo_1.9.6.bb
index c4d6c163e9..fecedc981f 100644
--- a/meta/recipes-devtools/librepo/librepo_1.9.4.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.9.6.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "928c2d9c66f0d10477b8c9d1192785b88e2b1155"
+SRCREV = "7d8acd45eb09809a5ab729c312744da4b2fe92bb"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


