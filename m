Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 426327FC79
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:01 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id f9so5603888plr.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4GKVcs0D5RZVem3cMcp1fIARYMCj5uKAXBkxeE1GDLI=;
	b=unHBx8L/FUSuKjKDUzmARiC4d8DhI3ReXBfcUjOiaWvwQklzLzYXxmCI+pN1uAFEAZ
	vkHyxqIZVF/KXRuVqXpbcpER8abxJffrPfZWRKSngDFuBozoSdSyArZeN5Vz3J2BsujH
	mMlM13XI8OobCJDHYeKyFyA8w1y5TESWfWCekdVCUpbzNAR6mFB7EgqblPufVzAUQhnz
	loWoaYGrhQ/Qya4WodfKX0H1kn/08nV5nr8Q113nnSKskVQ1fSrejmIY4sR1NYJo7Lpm
	MOpMIvNkgmQtqiB1kZxzdS504wcxxHjkZpsDFCcAe2LkR86Hunjoa8YFq2BNEqHeJY9Y
	/mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4GKVcs0D5RZVem3cMcp1fIARYMCj5uKAXBkxeE1GDLI=;
	b=BE87QjpLRKZXT9d2xI2inFWpsz3q5SR9QNxZEGWzbukvt5w1yl1U2Mb341ybqtynwb
	n2AQIRbX6rzhBEO7Jt525bQ7Dk3SwrPyKImWbf9bMx72QaGlN94JNYt3b/4yW/Nbnefl
	zn4HYfGvbh4GXY5Uz8vmB4ZJcL2AEzNWRuGjKGYxaWJded7gGHmGdjT4W9NeZ1kR5M3T
	f5qZs1RPYgBYp7eyUw+z/aZFwaSPihHjgoJ4OjKSyaTde5e7c7KbqcYdy95LfKWuPnOV
	0mvxUuu2koqzzDAgUZ55XXZU/Hq2SCOJS1SBiIblQKIDwl0wOas+C1x2rwbcDJ+S7zkq
	+pcw==
X-Gm-Message-State: APjAAAWRYG/y+BZynmNG75HNVMMRaPqhZfKhkIDFHQboHxjT52vee8PB
	By7+Qs3UA5NXdOd/Vn6Y7T8PjBVK
X-Google-Smtp-Source: APXvYqxvkl+wbJCgJBsMFnw1licVbz1AIu7iw/Ph2RQqtsOlbu3Xt7TQ/XrmWPR0bQexfXqYHjr3Vg==
X-Received: by 2002:a17:90a:e656:: with SMTP id
	ep22mr13370614pjb.58.1574639462216; 
	Sun, 24 Nov 2019 15:51:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:24 -0800
Message-Id: <cf8834271d9f66a43bf7e62263b6a17f7e9217ef.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 19/35] gstreamer1.0-plugins-bad: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:01 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...er1.0-plugins-bad_1.16.0.bb => gstreamer1.0-plugins-bad_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.0.bb => gstreamer1.0-plugins-bad_1.16.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index f9289e9..4330c79 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -8,8 +8,8 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "e9e562d86c1527c44d904500dd35e326"
-SRC_URI[sha256sum] = "22139de35626ada6090bdfa3423b27b7fc15a0198331d25c95e6b12cb1072b05"
+SRC_URI[md5sum] = "24d4d30ecc67d5cbc77c0475bcea1210"
+SRC_URI[sha256sum] = "56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed70e7dcd799c2adb5"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.7.4


