Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 05C497C219
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:38 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y14so8274159lfg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=V9Lh5bXqebP/XxwoFM2moUlgL9C/nRocbERUjbw0HB4=;
	b=MSQo1Ebya5RXWWvX4RTPa5mozsm3rjpyYsAb3TTsKGgHzPMdTYuwcWlJc4KS7IvnUx
	bEjE179Nm8R95qvVP1jNMAzarDN/b+0bTnjjTSVFFf77UsAwGeeO+EBz/EeeBU0jmMy7
	Lwf+zKjkraw7THpgkAZdATAiaJVEU5F1BATuF6bJi+3do3a1xzhMH7Esr0ghwUMuXdgZ
	1lZuFqfbYXfRGwxkHurqURUaCOBg4Ga3f/WLWSIxUrdh1M0ThHj46Rf2N2OXE8yPXA5q
	dTRjZqzb+xoss2II8t9fxw8pEGuEdK5YlBSSoHKIk1kPzODQpPKF8GHzPHTK+Z6liy/P
	oFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=V9Lh5bXqebP/XxwoFM2moUlgL9C/nRocbERUjbw0HB4=;
	b=X568bBCmDSBOyRkoaaIzf0zsbMGRtEEJMaEWDPnm4DV0hUX4XEVWngCHUmwh4M4THH
	OehF6v5bvYSOTeoVksfoV+DiZ8ZG+qFh6sGq7msFRGgsaiO0atuc280ZjgOm6WcNuiNN
	QWf8ytFaPravG1JSdoAXwK+/4Ar2kKh+NP9/+NbY/4d5MXwCTx/iFC2/vp2GcrfWRDpA
	Sz9greaGH7sPfs3NdjUC6fmclIkabxNNMJkLXF3o++F3PT8RIAXqu4/1D/TToSm1dwCv
	h9xn+xGrI8N2lktzL45VtVXCxMMywNLZ2906p/4PQCLOrImwqWVXxdjGRWDUxYfWV9sG
	L6gA==
X-Gm-Message-State: AJcUukdzBOQTNYcMthAG5vAyMGauy3Z0yetJEVX/unIy5qmZ9yqXXqwY
	KmIhmp0Flk/+T1gIuvyVVcUnV2e6
X-Google-Smtp-Source: ALg8bN6joZkSta/gIKTEhDJjOnQhan3ixbESE+BM4c0B3rKg7ouGwUPTA5mn22dAF19r8kn71j30eg==
X-Received: by 2002:a19:5059:: with SMTP id z25mr6309834lfj.120.1547743239313; 
	Thu, 17 Jan 2019 08:40:39 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:58 +0100
Message-Id: <f4465231049bc4151ee422ae20bc043bf8878986.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 13/27] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:39 -0000

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


