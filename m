Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5A36BCAA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 02:34:01 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so9489973lab.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2014 18:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=FT8Vx9rYcXDpVwHmMpTlMCVVKoUlHxTLd0YPXDTVRak=;
	b=id+vDNoxPlpvp32BP3VbmiqxAClbr+LAogga3u9uTzWcWBy0+LxIJFLscbCVrSBXeQ
	qjSg5Cx7wIiV5KHB9GCXhYKtLir9UhJTr2PkLoVSdkJ9i7+zdnM6bErHheuEjFsVqGbn
	WtBV7Xvbm0XIu/oSthikFiyAd87hTmEXqhwRKu0gFQbSrSWDXqiWS1NYSY6n2DgfZgV2
	tFjlhGRE7jcQl8vpv/XkXsMZOrv2KXaYI+5Mt6L8IpS59WJAMyvnzJhUCvVp3h/KncoN
	aGV3L8qZ4+DYzkmyQ8ctq7qTQNQ6eY0lQzROeUFZvxiPpPeCXH2FgCtadA71UKeSuF2r
	F2vQ==
X-Received: by 10.152.225.161 with SMTP id rl1mr42778427lac.5.1388975642420;
	Sun, 05 Jan 2014 18:34:02 -0800 (PST)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id c8sm53720249lag.3.2014.01.05.18.34.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Jan 2014 18:34:02 -0800 (PST)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2014 03:31:34 +0100
Message-Id: <1388975494-14104-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.8.4.2
Subject: [meta-qt5][jansa/qt5-5.2.0][PATCH] Re-add qtjsbackend dependency for qtdeclarative in Qt 5.1.1
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
X-List-Received-Date: Mon, 06 Jan 2014 02:34:02 -0000

The dependency was removed in efd3f947a08e0976e24bc266de4ec229298115cf.
Since the .inc files are shared between the 5.1.1 and git recipes,
add the dependency in the 5.1.1 recipe.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 recipes-qt/qt5/qtdeclarative_5.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtdeclarative_5.1.1.bb b/recipes-qt/qt5/qtdeclarative_5.1.1.bb
index be72469..344b7db 100644
--- a/recipes-qt/qt5/qtdeclarative_5.1.1.bb
+++ b/recipes-qt/qt5/qtdeclarative_5.1.1.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "0ee989a5d45a94e927609b22e2413c7f2788a7b4a23af66ecfa15c31db
 FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.png \
 "
+
+DEPENDS += "qtjsbackend"
-- 
1.8.4.2


