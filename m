Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B2B057C12A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t200so3934727wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=V9Lh5bXqebP/XxwoFM2moUlgL9C/nRocbERUjbw0HB4=;
	b=HIb5aIrQMQ9VbmqLla8eocwUbxiBFX8GL+DqoiMNji5MixbbuyzI8WO++vkjI53WGo
	CpdVsgdrlmHurvgsTgNSSRrS0LPXAaFDvi+i9nb8hsNXlbdHfQfpmVZCNY0uWW6yuT/3
	+xh7BgcihLBSN6BjN2q/QqeKHDSyb7ImbU9ERYDf3cVtBBn9ctXDM/8nVhccIZPg+qq5
	SC/roHgUw1KVG1lzmdPsGJFgQHn9kco9CqgzzLJI5DOcDPXxeDSmtjcwKha9bLDt9r8V
	VEf6AbtvOImXogXGUGJCsNyTkXnDJG029X3OHc646smEAzrhT/xJUcp/eGXJ9VDeifON
	DEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=V9Lh5bXqebP/XxwoFM2moUlgL9C/nRocbERUjbw0HB4=;
	b=TaKzJg12WNEfAID+uV9UY0qk9TCLRcQD6pNgc0GzGEodctBDpJpthQXHAnYFoFIssW
	RyXCbZ1pVEJj0ZXZsfLWejoj1IHleAl22Z7yajANmcDMMJfB8VOqGtMTWDBe3OqkuxQ7
	vffXrICIrMiOWNdaK7hTA1AZrDCzV+peuo5SMmLI/7V/clcMMGyvIq0OCXBh7JSnhU1E
	bkrocguV3kyBhBtOE8Hc6j73WaeNKBJsRAJNfmTcRgA+Pndw6DsbavFG5FFOYGYN0ITY
	ReDgiiE/tjbO1tTvd7nuHxH98HkbJDEDdFtkl1rmQcuiyOnqKIeWkQk+GpwYA7qLij6J
	ECrw==
X-Gm-Message-State: AJcUukdBiBuS47ctrmPBgTxtaYtZx69t46y+t7PLrUy0udpP/EILC0Jn
	VtwMymC92z+yozXLN9mdhHWIuJWtq7s=
X-Google-Smtp-Source: ALg8bN4k6NEqCVQmP31s4zverLe6TBEN2Mep2Wh6mmO74c3Wr8vVOzP1zyLb+O2XI6pjFdFvaasXJw==
X-Received: by 2002:a1c:2686:: with SMTP id m128mr3904231wmm.52.1547570357198; 
	Tue, 15 Jan 2019 08:39:17 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:48 +0100
Message-Id: <d400e6ea966fe903ab19f73aa4e674a672739a61.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 13/22] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:17 -0000

As sdl is deprecated in favor of gtk+, it should not be the default.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6db1facc9a5..531f0a04c58 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -71,11 +71,11 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
 PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.17.1


