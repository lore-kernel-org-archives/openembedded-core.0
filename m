Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 09A0D71974
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 17:19:23 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b132so5554767qkc.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 09:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6hWdb3bxh7zCyqv7tzbfTp6ve1YDw2+1nK2UyoT9MLQ=;
	b=VHeXyMlYtbV9Gdgz8H7zUNE0HE6DhedIpUrNKPsOOzP3uvn98BzlZCDt/o3BHhcv57
	x4v3HvgmgUray3CJcJcT+4/esk12/yK1AFtjbiybcjUN2Ck+SNNGi+yt8eJt+spV4J2K
	y/9klT1Xa2XCCF4mJRy8aEtPkkPXY58DnvKvBICxCqAOiuwKrC2yq1SjZ5YWg6kU57tJ
	LXanlzJyhvzjdYCcLpUTtng1nmtPiYszPKlh81NzXWwnj3snO5a22XUFe/ePHdAVlplF
	NS7MEpob1GriQg5z2po4aE1gXPqB569bobFm6zkEPhpCPEmunasXl+9nC0CBx25kLEKq
	23ow==
X-Gm-Message-State: AKGB3mKA1OGwIFCtr2wT1GwmsaEQuQZxgPOBtKDXi7+KeVcYyb3pG0SU
	YhF49LfqixQjy6UcTY7qxTM51MZH
X-Google-Smtp-Source: ACJfBosRXT7LHS+ssXVuRLDe1QAd7BwZ7/naqMCK81u6tCWlO9onQXv113JFAYRMD9At/F9XqmYkRg==
X-Received: by 10.55.126.198 with SMTP id z189mr21120817qkc.100.1513963164547; 
	Fri, 22 Dec 2017 09:19:24 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s4sm14202372qkd.66.2017.12.22.09.19.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 09:19:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2017 12:19:17 -0500
Message-Id: <1513963157-11174-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] python3-pygobject: update to 3.26.1
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
X-List-Received-Date: Fri, 22 Dec 2017 17:19:24 -0000

Update to the latest stable release

Tested in qemux86-64 running core-image-minimal

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pygobject_3.26.0.bb => python3-pygobject_3.26.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.26.0.bb => python3-pygobject_3.26.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.26.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.26.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pygobject_3.26.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.26.1.bb
index f368e6c..0405b44 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.26.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.26.1.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "1c1719b1798cc8bf1cb97777c41c83d1"
-SRC_URI[sha256sum] = "7411acd600c8cb6f00d2125afa23303f2104e59b83e0a4963288dbecc3b029fa"
+SRC_URI[md5sum] = "d898fc768ebec7a9ed4e4270c6fabfde"
+SRC_URI[sha256sum] = "f5577b9b9c70cabb9a60d81b855d488b767c66f867432e7fb64aa7269b04d1a9"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


