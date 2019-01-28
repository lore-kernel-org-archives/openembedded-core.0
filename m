Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 07E077C48D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r10so17863489wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=WaQIPpQZB+nTwHI7X29Rwiz0QAhm8Oe1f0M0bvztoYV0YEEyMKzto4HXw2Bwq4Oho3
	GTgBMlxIVfBazF9Mbe+DAltwZvglCHP3wvMDH/TijXx7BcP8RT+ceaHRNBqxX3OG2zk4
	RzqbjTQVbIyv97TDvLD/7+CA2L9G+vch7aCtOT65uHeq6wNdj784OsNOzAMro0mt08M1
	wPYQH3pXhKp1lPyJG8e4BcZ7xZHFnN/dp6KvxZICxztVeBIX+cFNIEM84amVrp8TyIte
	e9wOAbLPdSjJ0c8qWSTZyGuN1vuNU/wQlMkjehjDud2megn8hxjFC/NMAqk/h5qR9D5/
	CHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=oaet5Nkyhjo3ardsVoQox1pkALVZY9xrd4fBselmv/rxJQO6aLh07MVsBR3hd6vzdt
	Qu5Mo2eGWbBy2UUr8M9RGAeCFEaUSwoZ/ikKuZ+TgVBexDufMo9tcGR/iLdvvzYBUGsQ
	PyWdkA08IjFqzAc3M0ysof2b3i0OqyD+35JLL7NDwtuxhz5TSk0JnqjjOdIBYyoG5Awx
	DBNQnWPWXVU5rlXQX/xfB3czSzhQqGXpXVJfhYHH+Bkc2bWNu5Bqv2wwzAcht99UYSSB
	KVPspHsD2/te7TYbZoTgaT6dRUrcqgsGTEAYbfbYTdQf5sZ0ZpR1T1Kml6yAUm/gaL0B
	Uhhw==
X-Gm-Message-State: AJcUukcOcJQLVCAS+1K3jHx4X7cxlXUW+bXzQa8HrvtNOjuwCwFyiTh+
	SHlFvukqMil88iMv8GASOf90QRem
X-Google-Smtp-Source: ALg8bN4kh2yRYKn791v8ivQhjmpGXvVk/ACKt2hs4WcoyoemdtSydMb+/seq0pa+HokhWqSxhmNDGQ==
X-Received: by 2002:adf:b190:: with SMTP id q16mr21838143wra.95.1548679642391; 
	Mon, 28 Jan 2019 04:47:22 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:45 +0100
Message-Id: <fef8729b7fb139ad4196ffa698f3fb49169e0be3.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 14/24] qemu: remove support for building against host sdl
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:22 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 07f78058e7b..dccf9dcb00c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,14 +39,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


