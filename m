Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 3C93B7F72C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id 4A2E8A3589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756379; bh=8o8lBaJt3c06HNl
	xCVjE4miL2sQW40sSKRQpNWixaDw=; b=CregNGLfjF8WfXp3Be07b3qrG2H+VwG
	YGOEla/s5aUT05g5774C2CXJKV+pzlMhaWUBtIzSMiSXwNVtAlG614DqOsrjCVbL
	MpCSUK3VHw3fVuskTYU/1FOAzN1cfsJFH6StZ4R4NdRnYn8TfM2sUSa5fcE8sIQx
	alDYFBPf1odkcZP1GcA6DsuegylHwTSqRC80fHHT/6Ap4pI37nWppPfWzBG4q8jT
	lc4WxzOgSrXrOs2BFdtKCgf9ULFkbIS5keKhRwVYzHIL/iz5JXxvjmFcOtUvLBlp
	j4aBN8tCmcvR+gFZTe2PTwW4yvlck8DBvrr0bJHJhlPIkCS/pev8RLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=XBbiCF3jXHcF+sHGl4/MzbUSvrqUqL9dXoAFe9ZSUmg=;
	b=Mp2JW6ZR6LZ86n80KnLZoZGW46S2DImyfMfhLqdBbQciEiVBxNP4UlTizjX8rPzU8Ae+kK
	jp5sYHWq9rVmsKi7yXOWL25isEymjh8v8wfuX5NPAREvynheo3a4U6BPYKCqnJ1Pu/Kl4L
	ftrmB5YcvQvskw5mx/wlbUO+RPrPmhrk7H11u5PJ7rDxfPT7YbS2431JkEQ9BAWcMQhHOT
	vVHWBjAgBGU1N78NGnzn1sQ5GqV1udU8zKKeD2esuosE98uvmZa6ARvpKnvP5a/9IjJpL5
	ddxrXwd5trL9cm8RhPOqrp3OQL1dSRKpZmRPBssgGr0n02oU0YxYhlh4wma8YQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
	(amavisd-new, port 10030) with ESMTP id kzjzKRBJAUkJ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:39 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:23 +0200
Message-Id: <20191022145927.1241-8-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 08/12] gstreamer1.0-omx: upgrade to version 1.16.1
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
 ...{gstreamer1.0-omx_1.16.0.bb => gstreamer1.0-omx_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.0.bb => gstreamer1.0-omx_1.16.1.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
index d94bad36f9..4c6c839bf8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "c6f8554513980682099a2a9832250b01"
-SRC_URI[sha256sum] = "fef77cddc02784608451c46b9def880b63230a246decf8900f2da2ed54a8af4a"
+SRC_URI[md5sum] = "89772e7a277fd0abfc250eaf8e4e9ce9"
+SRC_URI[sha256sum] = "cbf54121a2cba575d460833e8132265781252ce32cf5b8f9fa8753e42ab24bb2"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.17.1


