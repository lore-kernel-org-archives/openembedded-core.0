Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 63990601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 19:28:29 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id h41so1261052ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 12:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=72gnI6YNRmpRlZDrfnirJCtBDhvF2kwZzjptyR9XpJs=;
	b=BmyC7M7jh2GEu/YkGUeGaVOyz/yaRuAm/6P7whnym34Z7CoqFCW2+72o2EppUvR5JG
	+PSV1Y9QTvy0QdKm+zv+TssID/a7r19w14SFFK11h7saQ6fABYQFpNrkByiNenlRZIo/
	DEVvxwhNI2niXDbiAPPvWTjUXCoCGI3zwHluLCAnaiXwnIm7mdAGTAYvYmWLFh9VrGKG
	0suHWjEdDwzOLyQ7reur610P6ZiHJfzS45c0fTL33LI+YMXXFSnL/Qsc4C0DXqZeX8YC
	5WmtU2jg8XT+FBIkSjZUegpfJgBmagOX1B7C9zzHUyalrgYjkiSz+q+HJFvW0LW2UqKw
	qlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=72gnI6YNRmpRlZDrfnirJCtBDhvF2kwZzjptyR9XpJs=;
	b=tbMkezGwO/kgi5uXfCgfRVNcKYY09m+C77MGIZ0wGCoHh3/dnkpBXv76AUGwXrEfnv
	q4dT97RURmkr0UOmstMimZUhALkvIQOjNicppINYYlDdGsISjFzVvp+L6vWEmB2mQ0CC
	wMmRVA3aQ4AN64jKMh22LiftidJYxGGMH6cyyGFzU9+YVPwXgWf6wJ4muaAyAKyWbQlc
	Agw0KjXmNG028KDOgdFV2xcjZPBODG2bxw9KyhP9JBLzmpDr7kce+jNjx64IIroMabMo
	eEvVigqsN2m3n8aG639sExtcyX45kAzevA63Q1f+KX7xr0K7sBIWSQTR16Ge1JgWCUCU
	z0YA==
X-Gm-Message-State: AN3rC/5N9kuQePwP2IBU9w7wNKVDeFisRW2nMSk9fc0oDCHlHOe6SFaN
	+pGVXSuPSTt4nMJ8MEE=
X-Received: by 10.107.182.70 with SMTP id g67mr16918150iof.120.1492543711159; 
	Tue, 18 Apr 2017 12:28:31 -0700 (PDT)
Received: from linux-uys3.suse ([108.161.123.115])
	by smtp.gmail.com with ESMTPSA id l63sm221081ioe.38.2017.04.18.12.28.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 12:28:30 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 15:28:20 -0400
Message-Id: <20170418192820.27256-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
Subject: [PATCH] gtk+3: libgl has multiple providers
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
X-List-Received-Date: Tue, 18 Apr 2017 19:28:31 -0000

The libgl can be satisfied by a set of libgl providers, therefore set the
dependency to virtual/libgl.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 27da844fea..c430aecde2 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -46,7 +46,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland x11', d
 PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
 # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
 PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
-PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,virtual/libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/mesa wayland-native"
 
 do_install_append() {
-- 
2.12.0.rc1.48.g076c053


