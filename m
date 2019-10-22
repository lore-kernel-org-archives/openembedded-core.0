Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 22CE67F729
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id 5478FA34EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756378; bh=/pXYmpG17hKcTgU
	TOZRLjLcwsHVPeKne1xpdJU3xjmM=; b=wOe0dVwshayoskqaEdHeRiLDx++gjvK
	yRkZlRSQkRw849AWs+jjwa+8yTdR6//bWrTx7pNfNnhLibsT31z89uI/sUoscCKq
	iFs5J/RMwRn0KfvvkbVsu+UDTFz9GpRTiT8TlkF4SSapEErbzlAjwc53owPwNNHK
	Z0//gan47Fb4m+N0cac/zPZgMR6d9mB9r/OXrfcnOV2BfFdp2atw9YlayvasttrF
	V5A3KI1Hqv7VtlwuKdgqhwzX8x3ZmSLg2hSVf7nZQdrH/x4pWF/JEepVIkWI7vvN
	UnC/Qw9g1QqkMYqjOEZDqell7B9JTZy96rIun0r8/t2FhsQ8cGyzPcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=ETCNCmf9WsCpPH0mEn9v2ivKX+kwAKDB6i5/VvGpjxM=;
	b=KG8nsiErvlFnx1PVsP5gXH4Ca7uyS2fB7oY2TE5IWIlPxbUM+TCL0U8yrPg9NkO89FFX3a
	L52a0Coifb0lHVYJI3mp3B5S8V1WvQjLYZeMvGMEMb6DtSy/vLElSrQFcs0RHxHa5RwdgN
	FvqQ7oI8AEZw7GCbcVg9pG25buiQoPuJEFg2uikksiPlVeD8gRUBuUpYWCCTC0rg/Gfb0e
	YB42HcCvldnEKoM1B04C4MWTKRG9BGppxD6mm41zIZMgrH7AaLRFu79bYgYY4c56Sd2w29
	RVseJeCTJRpZ56V/S7j0TYt6YJO06sy1skRwZ7CGdl4lzyZKFVqw+M0qF1gXpw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id 7zXtxeaZbf-B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:38 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:20 +0200
Message-Id: <20191022145927.1241-5-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 05/12] gstreamer1.0-plugins-ugly: upgrade to version 1.16.1
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
 ...ins-ugly_1.16.0.bb => gstreamer1.0-plugins-ugly_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.0.bb => gstreamer1.0-plugins-ugly_1.16.1.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
index 11a0e790ea..de677c0fd4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
-SRC_URI[md5sum] = "1ec343c58d4b17d682f7befa8453c11c"
-SRC_URI[sha256sum] = "e30964c5f031c32289e0b25e176c3c95a5737f2052dfc81d0f7427ef0233a4c2"
+SRC_URI[md5sum] = "668795903cb4971fba9aa89abdea8369"
+SRC_URI[sha256sum] = "4bf913b2ca5195ac3b53b5e3ade2dc7c45d2258507552ddc850c5fa425968a1d"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.17.1


