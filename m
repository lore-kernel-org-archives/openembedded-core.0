Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3FC71C71
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:20:26 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id x86so32989886ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UR1hjL0DybBpCUDTrsSfjFEyt2Ur+7Cj784P4GMMajo=;
	b=Q6SHJrvvWATg+jdMYE7VdrP392MOtTSLQkcN+uNvC6AKPNepdnkJFTwP+hYBukmiGG
	dbPRNapps97OEuyIceFbXru+wJRSFG8o1W18SW/f2Vhj0AjHqX+jv6yOFhzz9ALPymqL
	gvYDV0tQsMkZz63zY5GAz/l/BsxXheIZ4k9m/GJi0RiBOIQUV4yp21vsBET46xbWctgy
	AHIDud6yPWwZHi3DUCa+zrBvLFrOV0WUkI0kQ6cDwODP1glGcSvGykOoOCA7kW17onRm
	0A97EsI/iTw3+agFYuREj339QOQHQAe5aOtuATw0rXPQDzZsOT6ZSkOrHXik1AGpvXeb
	ZopA==
X-Gm-Message-State: AN3rC/6bML84Qd+cdCz3vZfVe93QbNCrN7hJAlb01x+UH6NZuawxe7lH
	1oswjLzC+swT7g==
X-Received: by 10.36.175.86 with SMTP id l22mr14405925iti.18.1492521628378;
	Tue, 18 Apr 2017 06:20:28 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	m124sm4879865itd.3.2017.04.18.06.20.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 06:20:27 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 09:20:03 -0400
Message-Id: <1492521609-26624-3-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv3 2/8] bluez5: remove libasound-module references
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
X-List-Received-Date: Tue, 18 Apr 2017 13:20:27 -0000

Cleanup references to libasound-module since this code has been
completly removed from Bluez.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 11cf8fb..4244fc8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -79,14 +79,11 @@ do_install_append() {
         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
 }
 
-ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
+PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
 
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${systemd_unitdir}/ ${datadir}/dbus-1"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
 "
 
 FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
-- 
2.7.4


