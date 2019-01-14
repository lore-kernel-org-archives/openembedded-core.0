Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9287C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d15so9255558wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E+lDLwps2kExZk1iG7J+myNm00tdEoKk3cf4Vbvrdws=;
	b=iY/+10vCR8OcTyoFRO5o6SfOkXUdCHvcGTuuRXrh0b31xlu4zXUMRDSLzq+j9Y1Tt+
	XtaY5VJX3hcHmTnFv285D5egfEnJqyEJ++CQwac88yS6FmaFnsvtSMPyWNdNYNHGji9B
	4geeZz+gSM1xeXDVYW8AGyYL9x9wZyeOuEq0FUHHM6C8ORKi07Nac59PMvIbcurHAt8i
	lcNq/DpduGT7d7lFJzs+sYDAqkRO7FpMmdoNiXDahIT2cfQUXf5mOV8sOwnQPxazZ7kO
	ry81jRc2nkw0/1kGzrDXMIdGRmy2ctDjQmEQDrFbbChpGVT3nxSfaSij2qK6Ibdwy3sh
	rOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E+lDLwps2kExZk1iG7J+myNm00tdEoKk3cf4Vbvrdws=;
	b=LT1+RpvTbJ5XAsJZk7oM0Bn2eXle6yxIwmZ8woRgse6+wuQAY96vaU1S+xj5FBTAT4
	aAuE06bu236Z1n79sUeq5thJq8hhVIJIq45XER8LXp75YsiZ4ziSLDUpis8DsAoQLY9Q
	9oGhVjuWWiSlEIMRZbcSDY2QL88/05CoAbgg+ItCS4pl9Ww8RzjhAwR5eex4r5Nfb/iN
	Q+TIvqUyDKG3ssItUjeHBtJg/VLK0GtBA0TvBVoTZF3oN4H5VZsOwGs3dTB4qF1vdGGA
	bbZCcz/pqKay7vRnxoxZGPZzsuNBWf7WZRuuWXFn5f6ljC58rGZyMibjtBKNYuvcV+5U
	SkKA==
X-Gm-Message-State: AJcUukf1lpxsqn9/fR8MRBGRkRLF8GkxU5n6S//8d9/VD75AkLSXlYPR
	eZal3LBy1Qac6ctcvpq7draX1xbk
X-Google-Smtp-Source: ALg8bN5XwBmISsAuEtMaI9mmQ6OFATtb6jFlwaqX7CpxriiTVGy6+7sCciLjxI8jbUvKKrRSIFVkTg==
X-Received: by 2002:a1c:7616:: with SMTP id r22mr12152005wmc.35.1547478214666; 
	Mon, 14 Jan 2019 07:03:34 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:06 +0100
Message-Id: <fc6e0e8467bb25e4b68fa2ed411d63aaa29cf2d9.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 10/23] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:34 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b05c1cee9eb..f943b9ee5a2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,8 +74,8 @@ PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
-PACKAGECONFIG_class-native ??= "fdt alsa kvm"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.17.1


