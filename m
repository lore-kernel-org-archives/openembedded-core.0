Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 527487C864
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 11:28:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id a62so1996929wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 03:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=giRMXPSMmt5nUfdJRMG1WF2znUVRtdXNWHWAy/eF2EQ=;
	b=Coiln4CqKaKalA7QWB6Ng6rcUB0IJN9eDdSmpCCX9+FANU47C6GrhexIXjDzOllST6
	Ic79BZkcwA0vrUYTPJvQIoR4lSxjKUPZU0Z9/T8jckCHZq3enmL4z5sO6dlLl0X0qDkK
	bfobKODgJP/Sx7noQsK1k3cuZQC/p7M5lctCimRn7pI5byb/zi3/W+Y77rMD+lLbDJLc
	SsTHpU7qLtRwR03WekOucjvFeJhsmylEbOq6pncD3D08ePtigV+2UVb2sQd0nZeqJaqo
	GBUjq/p953CPnsQemEiQZV5ocisFqwMUM++pAo6WGHL7UpLpLGMnGCjbPcOKwby9lIb9
	ne2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=giRMXPSMmt5nUfdJRMG1WF2znUVRtdXNWHWAy/eF2EQ=;
	b=lEJfVi6ftct792IgkKPmWDYpDFCMf2y5dO+FpU1JvS654xNCAaUdtWjcN0COgXiMXS
	UNGkwRXnMf6ZNlyy8X/Q5DtKDKM9GRrpIb31Ss1XFM703pH45TIe7UF0hh819fL2SXpM
	VlCzlXL62zfcvCmeGOLpG4l5dzNygZF6HqY+ExV0uE1pr8pI9md1bz8TVC4V/thmouSd
	dt/YBYYjceF0c+ERWBSV0e129uDo54pOnxWSxVc9+LL0u18sot9o2zhBlJ9G1IlYWOpS
	IbmKgoSsut/boFSyyD45nTffBbwKfxwhriUIz0xQDoJVt3ixmTISpN0ZuYU7jGExG8A8
	bNDw==
X-Gm-Message-State: AHQUAuY+u3ID5AL6CXZV3QhP4d462FPdnnA+icdJP8LHQ6xDhVjitfzf
	A+U9TyFvDV18NCh9FucUOX2KUlhi
X-Google-Smtp-Source: AHgI3Ibj8PQGqxvWJHIe61Gg5onYLP8rc3N330u8KSCz6On1CzN0P1N0GOpnyXXEhthSN4fFM3e9yg==
X-Received: by 2002:a1c:4d6:: with SMTP id 205mr8809854wme.66.1551612483755;
	Sun, 03 Mar 2019 03:28:03 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id r6sm3773462wrx.48.2019.03.03.03.28.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 03:28:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 12:27:48 +0100
Message-Id: <20190303112752.16353-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190303112752.16353-1-alex.kanavin@gmail.com>
References: <20190303112752.16353-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/9] qemu: remove sdl option from PACKAGECONFIG default
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
X-List-Received-Date: Sun, 03 Mar 2019 11:28:03 -0000

This removes confusion over where qemu frontends are enabled for
native/nativesdk builds: currently they are also set in local.conf.sample
from poky distro, and with this change that becomes the only place.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 26a33b4d860..8457e2c2f87 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -17,6 +17,6 @@ PACKAGECONFIG ??= " \
     fdt sdl gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
 
 
-- 
2.17.1


