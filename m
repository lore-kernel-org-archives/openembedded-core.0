Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 286D77F731
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id A70E8A35D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756380; bh=GJc6oruxofw8LES
	iGN7APEMoiyTC58+GOJTZRSOi8qw=; b=Y+9ElGBAaFoqAjaKQtOArvGbAqZI7cG
	6jQYKYO8Lnss51hcseXSoOLBrwP+Gg83qhwj/jwKPC5aC6nvjMczTRVcQZhCtSXU
	Np9IqnfEytzUnHV6VRw3m9lEOWKDCgxi2NwYEfykxfp96KBdUOXL4O2jqd4c/0Xb
	bYUz093vOYtQze4tJ25LSseaCocX8GD4PPpIShL0cjved3L3gviGvgcT1SWH0IjO
	8EdaTVx1DqeiATvuEXuMH8v1CNw+8yQEj5op1fQ2jms3hPC1DGB+dX9yicaUchoy
	rLUZfgNZ6grybIkCPOypqoG/Qe87mMNGr7OOgf5cXDLciuevqX9OoBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=J7PJ9CXg456RaRbYBI70Wfn69Pu8dtBOlKCmQzIAO7Y=;
	b=nP8EhjxjGH2Zg18QwSHf2bHTZpathRmSrwWCrbBkhKF7FieCckhaBQJW38vI479OCDScdt
	DEyA07zZHIq/k/nJuZ56GJLaJlU6lni7LYVowHpSTnT2pjPllCQuCGif2MJxJV5BRSDRLI
	QsriR6ZdKJMrHaZBdTzH4oSfMWJDKnogAgcVbaqpbltbLThcH7kQ/uFbSyWTn6MCMxcbf+
	UmM9LJcGMiaAa5i75nK72gK83JmasZivhsXkDGvt7xA4PVkCuU+wyGjnl18GQsv7BVRP4t
	4X9VBiJo4+BoYu8nI++1hpaL1vcYmOHUA6RRCZLS/A8E9zc2zRrVU0d+BY9fAw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id hX2LDexY88bc
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:40 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:25 +0200
Message-Id: <20191022145927.1241-10-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 10/12] gstreamer1.0-rtsp-server: upgrade to version 1.16.1
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
X-List-Received-Date: Tue, 22 Oct 2019 15:06:26 -0000

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...sp-server_1.16.0.bb => gstreamer1.0-rtsp-server_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.0.bb => gstreamer1.0-rtsp-server_1.16.1.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
index 042938b88e..ca360bc244 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "adc4460239ec2eccf58ad9752ce53bfd"
-SRC_URI[sha256sum] = "198e9eec1a3e32dc810d3fbf3a714850a22c6288d4a5c8e802c5ff984af03f19"
+SRC_URI[md5sum] = "380d6a42e856c32fcefa508ad57129e0"
+SRC_URI[sha256sum] = "b0abacad2f86f60d63781d2b24443c5668733e8b08664bbef94124906d700144"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.17.1


