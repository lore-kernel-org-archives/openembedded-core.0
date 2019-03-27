Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 943E17D156
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:16:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o25so787611wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hklkGTfwSzr5jwL7SPlGO4pVVUfl6K6XMMlIny9aPaQ=;
	b=C2LmfSBcbOVbBElbTNuUq7nBdqEHWOBLpWPp8+aY6CWhmHjECCRCPDXf0UbAZgJLV4
	wHtbTK7Scd2gvzsyyfe/hjHCeYEpXsY9Q3pwYIQJ/bPF11MtiRGVHrLW0mtlFjU7MJ9J
	K31K4o6pI9wyXGl5xeUN/dc2DHje3bU6OUvmpyZ8CXpstrocLZu07GS+Jkar8jRHQlzT
	7jO+B+Jb6S76RqUgqqio0U2W/1PTBw8UWp/NDrNDnqayaisyILQK4KYMcsuh1lY+szGP
	lePxXN3IdJkgoFRcEb8i8u+Not9iEp3gD5Z9VTCBNFNLICiKfrW5I3dgjf2CzHZxhsjP
	yWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hklkGTfwSzr5jwL7SPlGO4pVVUfl6K6XMMlIny9aPaQ=;
	b=AbIxyvLqeCR9lFLMhA4NeB5lfXJBaK6fODtf0VkX6YrWZC84DhkTjUDiocMXHETPeb
	rm1Dgz7jMRZKvgGWlLxfVMMKyhqnsTZx9fOSsrjJVYoNQWhhK9+WjJW8gMjCdL3twnmn
	FsRCQINwswxkCmIb/qpDuI+rbaLxGelKB3lPEpC5xtR4bDUyINNdvrak1To7X3zEBuMz
	kjFjuprkqjQ2Co52Zpr2MZ0hZJbZUyxdEJ1J+7mJ+jG6HO4h1hf1wjpf9JLpSsq8X9qV
	5kCwYCGSAE0QcPiGm3WgVm8Nqw43/dYwiIaqU1QUoyVnypfsKqTynCDIK44o7S93QffX
	hgWw==
X-Gm-Message-State: APjAAAUEbXWcuKZGmYf8W6NeRhoh94HqhavGlYBTcwf38KHlzrUBd+Wy
	l1hW/8lGD2cVGUw+Di3rPfJlQ2iEPFM=
X-Google-Smtp-Source: APXvYqzQM4q69RBgJvL2RLO9IciTXjTeSuUpY8fjRiKE2OqSlCIMDOBIt1OzDQgY5pShNX3h3AzyRg==
X-Received: by 2002:a1c:44:: with SMTP id 65mr17880587wma.127.1553707005036;
	Wed, 27 Mar 2019 10:16:45 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id x84sm873848wmg.13.2019.03.27.10.16.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:16:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:16:30 +0100
Message-Id: <20190327171633.34697-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327171633.34697-1-alex.kanavin@gmail.com>
References: <20190327171633.34697-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/8] qemu: remove sdl option from PACKAGECONFIG default
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
X-List-Received-Date: Wed, 27 Mar 2019 17:16:44 -0000

This removes confusion over where qemu frontends are enabled for
native/nativesdk builds: currently they are also set in local.conf.sample
from poky distro, and with this change that becomes the only place.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 669638a6592..16eaa54a16c 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -18,7 +18,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
 "
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm \
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
 "
 
-- 
2.17.1


