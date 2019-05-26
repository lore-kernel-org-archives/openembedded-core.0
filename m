Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 91C997C7A9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 11:06:53 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 6C702A015E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1558868809; bh=7scYTQ608lDYgaN
	MP6FaWKLstBxR3vu2YD68oWHDIyY=; b=gnvGRYFB4y2esJIFxtctXRWoOKMQOk0
	jXOxnrgqxwWLtlpVOKcMga5e/9mcAihUwOlhgGjSJ7WnvjDTROqZTS4NVY5FsrdT
	rO5tbX5eLApww0x0ifdxEBMMebHCWhi1twaQxHNUjyzrlJq6cbFSCxrwpkbPdsZ/
	OQdAWOXzYq/s3AgGnfPx1Z29OF5ixNgJO7hClAJpU8ZgknmbGhB8y3u2gZUEOHOi
	Kl54WeVT+kAIibJLah6fz7/a7r5QzKOAPCl0A11/ait+LJXHB0JD+3igbMRHqpkn
	Zbyn0YEqQPkv6rKb9hfvKOEiV/3XykwTLKy3PaprJUuriizXNK+8yAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1558868814; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=h4zSYTI1JBaHDRXsn63H/0TpN9ziep5wfc4Agvc63eM=;
	b=KOfEAk9mF+54eq40dfSQLRT+DPWxVVD6RsmQTCvoZMWUsQpdvG8Y0sAQjsNKAzAUGKCz4+
	VsCjZYlyg94TB/BDsdD+JyhtRXFQphDpXZL1sTpS9VWWFt81mJkktNDMwVtKMXZgF9/xy6
	6OmlAJT0ISfn2w+RLVEwoQUcD3HxWhv3vqhea1yCaC/maiTTu9Ae0sZbVvS0pmu0UckS+E
	Hq4B1o0Tb8LUVgasYU0YKQgAEUtwEk6TSKtybMOF7xDP1gwv3aGVfZN6BfbSyC9/IcodKN
	+hNQca6p3SZsFtxHT6I/MKyRE17mvIB4dBGW+ZuW7T++9B3jIrDOOJu4fj70Fw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030) with ESMTP id fren7Ypj0gWC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:49 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2019 13:06:42 +0200
Message-Id: <20190526110642.5341-11-crg7475@mailbox.org>
In-Reply-To: <20190526110642.5341-1-crg7475@mailbox.org>
References: <20190526110642.5341-1-crg7475@mailbox.org>
Subject: [PATCH 11/11] gst-validate: upgrade to version 1.16.0
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
X-List-Received-Date: Sun, 26 May 2019 11:06:54 -0000

From: Philippe Normand <philn@igalia.com>

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../{gst-validate_1.14.4.bb => gst-validate_1.16.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.14.4.bb => gst-validate_1.16.0.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
index a4b3b465cc..1f4370619c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "1f4fc5308695adfdc11d13046aa4888c"
-SRC_URI[sha256sum] = "18dccca94bdc0bab3cddb07817bd280df7ab4abbec9a83b92620367a22d955c7"
+SRC_URI[md5sum] = "c5c57f3325a2e62aae4a8ec4931f7711"
+SRC_URI[sha256sum] = "9331ae48a173a048243539730cc7a88607777762dea4aebbc3ab55981e68d6c9"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.17.1


