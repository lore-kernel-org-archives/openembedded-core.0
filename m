Return-Path: <kergoth@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA1774581
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:24:48 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id v13-v6so3602109pgr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R77VY4tw8Knf+VWtiVnUctDxVoVXr0vO83EXIB3xxB8=;
	b=dlj6NxpW0lRAEi9MG9n38EB33S/0ufBjRZF8RWucjkF/26hEGs62hRPmaI2+P2/CXl
	98AvllDIQe7C4D2hCQ/MDsVu5LkTO/BvUgKLCu5Vp+jn2C9hUAjv6GzmcHefPgvOM4pT
	C1NOlStfj61cAUZVf5E7u4aM37soimSl1a4ChCMGmemgYK7d/Stouylkx2aHiQOXHnP2
	x9Uu+Frl6DkajTGLj7ehmifd5CjZF3yfv6ws2kSRHH29rgEJha3vGRA+IKWQ/AZbl36U
	2P64qqGPGJHvpiST6gmCKpmLhbcTZIzw7YskQ9Jw6K3my2dNJhiK21jE4+mhCnWRBMZC
	CyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R77VY4tw8Knf+VWtiVnUctDxVoVXr0vO83EXIB3xxB8=;
	b=hZ710Tate1XKWP9fgbMwUan+59Rn1jTpWg/cV774HbajM62kbVauybNrHm+IB3dkkr
	I2gCnjvSDrG1uNfdb+oQZvqQo5Xj809rXpgz1rc/lULwood+E5opohK0g0WlgoCOapXX
	TJWbVDVAmlMZIKqNWYL+BXizdW5FZbdL6qqg1X+gF7gdFscgLVYajsX84E7B9P0jJ1B4
	aTi+rDGrGoLVzocyCmGBV/Mq8JVWxTTfz2kNV8J2SQsJj2Tb0JxgvfyhQIFqAwo6KsUe
	CzlgzG6CSwmB+vAOV5jVzdBmW+SIBNTibxG7IXOPG3jMf6ugF3oZ2BXCTZtaTA9/8uRX
	3eSQ==
X-Gm-Message-State: AOUpUlGU+f6nALeuTGlR5ww7QpLEc5S/MXOzghGLzFfXr2oK7W4j8aOV
	9Y3JFPXFtnT1xDL2QcFMKIOKyRf7AUU=
X-Google-Smtp-Source: AAOMgpcHrRu9uXNfQl3x1qBk6n78Olk/ZRuT+sGGB0JfI6zY8bTCdw5dHeGSHIWjdJcERwvzgDo1+w==
X-Received: by 2002:a65:660a:: with SMTP id
	w10-v6mr6788242pgv.366.1532712289266; 
	Fri, 27 Jul 2018 10:24:49 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm6399195pfn.177.2018.07.27.10.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 10:24:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 22:24:29 +0500
Message-Id: <fa3426daa7c0eb4c1beaf55f4ce16ef85029833d.1532711448.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1532711448.git.chris_larson@mentor.com>
References: <cover.1532711448.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 3/4] image.bbclass: inherit and use image-postinst-intercepts
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
X-List-Received-Date: Fri, 27 Jul 2018 17:24:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c3e73676dca..c0f6ffe31d4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -14,6 +14,7 @@ IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'ima
 IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
 IMGCLASSES += "image_types_wic"
 IMGCLASSES += "rootfs-postcommands"
+IMGCLASSES += "image-postinst-intercepts"
 inherit ${IMGCLASSES}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
@@ -246,6 +247,7 @@ fakeroot python do_rootfs () {
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
 do_rootfs[umask] = "022"
+do_rootfs[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask rootfs after do_prepare_recipe_sysroot
 
 fakeroot python do_image () {
-- 
2.11.1


