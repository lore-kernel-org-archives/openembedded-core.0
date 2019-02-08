Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2DD37C5C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v13so3856326wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qYYAsecWaONxSWmkSSn0G5sTmUAfSiqAUoFA3YEaDHQ=;
	b=SLoin7ztta966AXLeXF37Lai9zFDIAkatBaq6NeB5y+KoiO30oBKaExmjxuAdHSv9V
	OhAdJSSiwGD+hTxvmwdyoSPcJ4AoX08Ii17aRwxIDMUAerazi4Pb5MwyLD3cIM0nidqQ
	lkMAjnc6eT2yIQN9RhxOIPG/WilHnbcu2hbuGAg8NGtI6VngYpcE9IAIJ7D95+A1hNaB
	PgYiGLG6YZJotk9DXRoKFKqRhnuXXua2PQ3HTlRB++5Ipzzb/ikG5EsgN4XFHh+WkPQQ
	LGTqdVcWADrJlmjN7czP3fWMU+QMpR7oQ7+LlIsjwxYtNI7O+R8T15uFu5ne1gDI/Mah
	xVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qYYAsecWaONxSWmkSSn0G5sTmUAfSiqAUoFA3YEaDHQ=;
	b=iHhAhlrkmykBlSrer1IhxVyNPtWXvjoLzQQ6ja1+2ElXVwLetVi71b41WvH1qEPEjv
	h3YbMK86llZbGTm8aTMSH6o9/4lnF+p+Xy8dlBiNUlr9ohgY0mw8DzmcSfcLGbjkpuzY
	3perNAoUcnga9jAB06bbZZ4SPE6uS4jcsaduKKStjUALAcPfykfVRXFZU0qTMdafEvQV
	HgFOeC/MhYquu7NwWvdWGDByPd3KPC0x38oJC4NkmSqjQB+eu+W7kIitRbrGs9RV5gfN
	lPziuXTgxQry4JVU6X65Dl0NO1je23yFWlTtIsIDPKBF2UlRtGtb+6OCntcmicLJGbRO
	JG5A==
X-Gm-Message-State: AHQUAuZgvCBSdWeuRKLE2BgDtwxNwNFRtxaubTt0jFA3gx/xm3dielzQ
	9sViwrp1uvxLAFqKT+SARwsCG9hC
X-Google-Smtp-Source: AHgI3IYK03OEKNzkLYgOLr+/oLdNnEOpMm0Xf/olFookO5Cm64wY2Uh5VjFY2hjEt4ZuuxzyZNABfQ==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr8230555wrp.247.1549637164184; 
	Fri, 08 Feb 2019 06:46:04 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:45 +0100
Message-Id: <a85aa0f19d694bd828ddde75c92d96bd7bbf4778.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
Subject: [PATCH 04/12] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:03 -0000

As sdl is deprecated in favor of gtk+, it should not be the default.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 95e9e0ede77..07f78058e7b 100644
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


