Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2BC7F737
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id 7F204A33CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756378; bh=EdRUf+WQd1xPQIS
	kR7/6QF0lMRNSMpumfGNPLgrnj1A=; b=UzWWZQZfI2HcHTKoK5TqYCdshu42jGh
	JdBHfOVSxSMvGXCzuRuIgW7pW2ypMPsl8GTCl/Sqq6+Htfsj8kiwahzYy6sBPDn5
	WAHVUnTaUHe+KHDOyJJYDSIoGlTCiGNTHOa04m8PC/fhQLQSeiRcWWSPuvpzIpPm
	4voOmWK4E43vy+QxgNYAzUjP0Efa0sjIGDy+47NwFkyUHNGadLX2DuqpGHf/td+R
	2IfYqwjOHKR+bxy2EuuWzCETum06PZdDrf8TR8yBJ1yjy8x0Qi8xm4FmlxuPjBGd
	CtEklPRxXbhFAIeg2dtJZAfun/Y5jr+bLEaZvKo5L05WrYMw3isLjOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=CNotzIlFiET+k+z9jRYtGvatS+az84qEsUQvVXrncKc=;
	b=Eh/qokbGbASzwL7sC0jxD3FpiSAwUvFO3cWo5hIfT2gO7KYKod2h//DdL8izG3vRHAok4b
	VeqhPVJrlyZmaByELrYQnAMwj1nP6T2lNvaPyQH3nfgDToV2ifuA11PUFqCyUtzrdTIrV5
	ebTWT2FkfyFAJy6r9pDSqZ/aXqCv2GL0Ql4dyegIUfzlZQhyf3CPUafPvzAKzAC1s5pmEz
	OukcGGBwh3bBCDyJFPhPPeir0gekfP7f2zrA5FxbQ8KxNvj5TzhtYvwzFaoxIyWJckufp7
	ja1YAf8rOCSdaDNiVS3mfgD9Q0pN/NtwlIDjxNaHZllSxmuHZN8Ph/TjCg41wA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030) with ESMTP id PulYXq-nJxYA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:38 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:17 +0200
Message-Id: <20191022145927.1241-2-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 02/12] gstreamer1.0-plugins-base: upgrade to version 1.16.1
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
X-List-Received-Date: Tue, 22 Oct 2019 15:06:27 -0000

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...ins-base_1.16.0.bb => gstreamer1.0-plugins-base_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.0.bb => gstreamer1.0-plugins-base_1.16.1.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
index 1d6f15e9c1..9df67e7b88 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
@@ -18,8 +18,8 @@ SRC_URI = " \
             file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
             file://link-with-libvchostif.patch \
             "
-SRC_URI[md5sum] = "41dde92930710c75cdb49169c5cc6dfc"
-SRC_URI[sha256sum] = "4093aa7b51e28fb24dfd603893fead8d1b7782f088b05ed0f22a21ef176fb5ae"
+SRC_URI[md5sum] = "b5eb0651bab70bf1714f103bdd66ce47"
+SRC_URI[sha256sum] = "5c3cc489933d0597087c9bc6ba251c93693d64554bcc563539a084fa2d5fcb2b"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.17.1


