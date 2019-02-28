Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C5B357CC1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:15:17 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o17so21933145wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e8sDYrj7DEDGxm5trlw1FnEJvazu8pmE+stw8xLmFf4=;
	b=lqZy03bGZwIehpx6f9hyA5E0OV/PUTLC8j5VEcmOPW6rhu9fx1yNvuQco9aQ4VndIW
	8/2u8xUIvZ2SefFY8TR+bD66LgXB1AFqZu1JTCdzL9f8XhN7DXj9ssoMzukX3wW5zzv4
	cX6QEmdDvVD6F5robBF2FSAiE1KOg7+hca/MYzjtWazmAVlDYW+I0z2WhnfBOHjEg1D7
	FwLoJi8IlK7SVeRGVcQgoRV61+lWs2yMddOv9n83UWCaq8oRmROO5jsD4PoG4paptM6l
	NcVTtR+OyHjwZGR/hX6Vi9Jd/YDvCEatD9jqeT9nv46ScLO0WbODqk95IBFyIFQQXEk3
	EyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e8sDYrj7DEDGxm5trlw1FnEJvazu8pmE+stw8xLmFf4=;
	b=X51dbUgVYKFnc11ayMr8GJiutsT5qHk2QJsbspPdG+NPo2BCGBKa/HTfMtIfWl3rch
	yu748QBDrlQGS7ki4iT93KHRPDX15R6nS0CHinZ7tgo2bXK8vG1Ivbt4O5NgUFonRtYj
	2B9CiG3peIIyhW/G85zO8E15/0FTzhk+1oOxv0q69S+YVYqHVb3erEPCT8cPv5synAsM
	k4nkBnyftxHBHXZ71GolbfeIoam5ayihSam+lN5cPaxZkh3DnqtoiHmyhmRI9KjxO+3m
	x522fPNzeiTEjmBuvCMTq7HWyVfRAkrqfGujz4XDugGYVrk/rSFcXWbJVtkJIByj/Z8D
	sBOg==
X-Gm-Message-State: APjAAAUpLvdci7x8evBdpNaRt093+qS8mX0tmxLK8jqJIewfBvGAGAY6
	wYlojLmeEIVi2eprNZN0ar8El8dw
X-Google-Smtp-Source: APXvYqwpsXBcGk1FuonwCs2DxWolNSqsFj3nFdqI7knL06a47uLClCEqWQ2gtlNJRv19WCNZusA29w==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr6568561wrv.304.1551359718160; 
	Thu, 28 Feb 2019 05:15:18 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c17sm13644910wrs.17.2019.02.28.05.15.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:15:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 14:15:05 +0100
Message-Id: <20190228131510.43557-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190228131510.43557-1-alex.kanavin@gmail.com>
References: <20190228131510.43557-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/8] qemu: add a gtk+ frontend to target builds
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
X-List-Received-Date: Thu, 28 Feb 2019 13:15:18 -0000

sdl frontend remains enabled and available

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 3c404d408d0..26a33b4d860 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -14,7 +14,7 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt sdl gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
-- 
2.17.1


