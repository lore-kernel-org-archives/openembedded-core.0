Return-Path: <crg7475@mailbox.org>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 872DD7E429
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 16:42:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id 6C5A250326
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1559234526; bh=MkEnoEuMtJW72fj
	OBsF78v3rX8qOr1DPXOGQ6IZbPYc=; b=f7LirNswGXqjFou50f46aghPl16TxGc
	0c473UJMaXQwssd9N912r0IlX4kQ1FfxzYgBw2JFzkMD891hGmoeelksIrhyFgDp
	66oubpo6ksXQWEel+HopOyuJxWcgQJ6X1yGMqpwRJ7VAilET6e3ErtKvuF6cP94y
	10X7rgwRL9UNqIEo9qOpp1Ebe+JBY4acpYzh+Eik7FSE8yWLjE/OTvaJ//AmUPUA
	yW1RmLnJFSei0OTWkOvfuz4j/mHyqpOD29PsxZ6XuqkGMJr/SrtjjCD/pppKYwZ1
	FZCEbfYYR5yOUtPNoADOYtHiE92SMKQZlKjzlVTIQ3txPo74IcdoE3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559234534; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=1prAS+4W0Lf6nCwkkHdkQ+WAkXUBF3TYMvAU1qc4PCM=;
	b=xIyRDiXFPtDn3L/vLsWly8rjtioJyyNHtwa7H+gUeUGTUK0jnSEK7opLK1TsyqUlg1epyh
	7OQl0F9zlg+AnDBaTo0LzIXZedibNE1SYx5SUYC8QePHMJ23jDwe4sr5jH7HBo+niFuHGj
	HzDD44nTMybsGirkg7Ie5qbTon1/OSIlCJE6LbNsVb3e0gvbJrGBih4bVnV9Dk0Erl5pQn
	f0hPQpLytqZWo2hwEPSeSZq/7Fa2jzHZDSwgRAsn1W+eY4dtghRE5RGOjx+l5K1PW5ldxC
	H+n1JRU/XiIW8n8tcvwCfosWdG5dpwFc7UiXElr8AkI118dLQbv4xytx4y66eg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030) with ESMTP id vhjDMZud-iPM
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:06 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 18:41:45 +0200
Message-Id: <20190530164150.27038-6-crg7475@mailbox.org>
In-Reply-To: <20190530164150.27038-1-crg7475@mailbox.org>
References: <20190530164150.27038-1-crg7475@mailbox.org>
Subject: [PATCH v2 06/11] gstreamer1.0-omx: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 16:42:13 -0000

From: Philippe Normand <philn@igalia.com>

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...{gstreamer1.0-omx_1.14.4.bb => gstreamer1.0-omx_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.14.4.bb => gstreamer1.0-omx_1.16.0.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
index 39ca1e3854..d94bad36f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "81e67ea03be607b7c548ce911598d754"
-SRC_URI[sha256sum] = "969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4"
+SRC_URI[md5sum] = "c6f8554513980682099a2a9832250b01"
+SRC_URI[sha256sum] = "fef77cddc02784608451c46b9def880b63230a246decf8900f2da2ed54a8af4a"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.17.1


