Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 490947FC89
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:07 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i187so2170290pfc.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=am9KOpIUGUa6D+BhMWAunnc/GFAcQq6rPmATgBih0Jc=;
	b=QnaYT5Wg3RD8s5JU6K+jxfLjnuZKZ0tzwRkebHxPH6jenvG9WKQisOg4X5UMTvUP50
	WlirJ7RIX43Vpt18rbGkw8EaDe9IzRswb23c71+sdoyIFBoznPDbvV/VwAVtUfQBaHQN
	pH6VIJE6MUbckAZY071gnLG2euJMmjiuVDRU/0gzHom2cktNeTgpyKUlmKthZ+5SO3Dv
	eezl8eWdsBad5mijPVEz1IuXSrpuErFhB4sWZdVOjU4QHB2J252FGXkUfF0x4ltEOhwq
	qC4+gaa1JOZybpJRZAcq+J6l4DBpHcjl8kbmQJkqO7Kr7+C6MaaUTb0+RN92G/al414P
	Okrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=am9KOpIUGUa6D+BhMWAunnc/GFAcQq6rPmATgBih0Jc=;
	b=G+Gcvb+l08bgvQIVPvX3lR3ExZPqJD8Z3AHLYIwWW2XPD/S7wSNnmnU9Vpu/D7240H
	ZbzhUWIjP7oGjdiB6xX6rYsLIYdXV6Ema47ZBY7RK9hWOJ5Th8sd8EsSrRpl755LjWzR
	qQNhopTbxk5pkpimTM7YiwrWHL6gMkeItb8eY+yxWMKbM37/EGlEiQ5rjdfudZvxqNXH
	Lj0jJtGnbX4D42C43/OsK2dRvmEXfGg0ZjFjpJWQXLs+6u3EhbDNw52jNb8m9qofeaY3
	oc29qbrpznwIAY36mf2FqvnfCdaBjxJUUG+JdBwerf+4SPCbRY2CSH0S9c31K+/IzPgR
	fLIw==
X-Gm-Message-State: APjAAAUDul+clFGYoqBW18hZMHZOhs17qW5NH3FpA1n/eMSkeFJps9Le
	K+baDMX/6k4YRmLmI9mXIWgznKZd
X-Google-Smtp-Source: APXvYqxkiN0n8XXLj4KfIyoUstwgWjBOYhEXcgjlHJ8ses3wlsNLGe78TngppHAoumTxO98XlxtmMg==
X-Received: by 2002:a65:678f:: with SMTP id e15mr8532566pgr.130.1574639468276; 
	Sun, 24 Nov 2019 15:51:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:31 -0800
Message-Id: <af37b17da16a678d9c00cab5876b562321344302.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 26/35] gst-validate: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:07 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gstreamer/{gst-validate_1.16.0.bb => gst-validate_1.16.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.0.bb => gst-validate_1.16.1.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
index 1f43706..7d602ea 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "c5c57f3325a2e62aae4a8ec4931f7711"
-SRC_URI[sha256sum] = "9331ae48a173a048243539730cc7a88607777762dea4aebbc3ab55981e68d6c9"
+SRC_URI[md5sum] = "793e75f4717f718ad204c554d577b160"
+SRC_URI[sha256sum] = "7f079b9b2a127604b98e297037dc8847ef50f4ce2b508aa2df0cac5b77562899"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.7.4


