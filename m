Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD2F65CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:23:24 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n129so4378773wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=D8IqhZ3UleTbc6gEd4aBDz9mTMZPe51Mz3T4z1JQMnSidQI87rer/yRzlk/H3GM6ma
	atk6G6jNLf3JQxTnmlgobbfnVsxHU81S5KAFhni26/orWHLDCP91KwcAjhnRAx0Pr9NQ
	zySaSGXBWII7qAvSJr0/HLrDgfJDxVBxy4VGE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=rIY/MPwR2aY+GF83ferjO9NooNvDJBLBLM21cwVy5//TcqPGUsY5CXP/E+WsVXAAaU
	p6Nxtau0K6Toid2nG0SiYJdLoyX0oAUxYW9FVaaGVM3KVDYsv+w6isvlf/gASJQ0rs6L
	Rh49hwR0nljwmVw13x9M7AWcIY/UNmU0pbS/XF4bF+TAp+NdjrcTkjDbfJBxXg6U6J3X
	wGt+M4d2LMuPtNMOhMVEnhn0TSFje/e0fvp3yvumq5xLfiI6ZEXOP8f4nZ5dv36l41Ea
	DwoP81dOEmigGUEqQ7h9ysx5fTEF6wraNbHlSPcme8zszQK7xJfHkzxeGf/94a0jKDxb
	bL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=mw0kVT54D8nPfN6+nyRRerRhqjR5hDFtNZPpN68VzkmIyylmZDvaVj/3QmahcG6/xJ
	S8dKRfu3u0OYoQ1gOkre/aI6Ldg2dhaA3hlfJZkW921Onz8dQa3USmxdzWlLNkdbXPAt
	dGvvFfP6MrF8gFgVInrI1eU2eAxhgxhqmiw9ozsKy1TMykcac+e57icuFj7EOGUqNAy7
	ecAhsCGzHGl2igq5l0R2uxxmY/JvavELX9RQlmeuyjGfJDyOsyY3OXkW3e3iNqwyjVnE
	1IxHQnYqLDL4c2D76/mTX20/JmKqFqYfbzYMHYUexftIyFq4tQiSo5i0FN3ezDbedyMD
	wTAA==
X-Gm-Message-State: AOPr4FUJs8hUo4TbEOaG2iyjGx2LWVTNYivq3NhRU0U75j8j5x64x/Y4zKDEXoQX92snOA==
X-Received: by 10.28.135.200 with SMTP id j191mr25924845wmd.54.1461767005550; 
	Wed, 27 Apr 2016 07:23:25 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	kq9sm4313514wjc.26.2016.04.27.07.23.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 07:23:24 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:20:55 +0200
Message-Id: <1461766856-27881-4-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [PATCH v3 3/4] kernel: fitimage: support device tree compiler options
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
X-List-Received-Date: Wed, 27 Apr 2016 14:23:25 -0000

This introduces a new variable to set the device tree compiler options while
calling mkimage ('-D' option). By default, this variable is not set but it can
be defined in a configuration file, as following example:

UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/kernel-fitimage.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index e5b75ed..62e0017 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -17,6 +17,9 @@ python __anonymous () {
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 }
 
+# Options for the device tree compiler passed to mkimage '-D' feature:
+UBOOT_MKIMAGE_DTCOPTS ??= ""
+
 #
 # Emit the fitImage ITS header
 #
@@ -209,7 +212,10 @@ do_assemble_fitimage() {
 		#
 		# Step 4: Assemble the image
 		#
-		uboot-mkimage -f fit-image.its arch/${ARCH}/boot/fitImage
+		uboot-mkimage \
+			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+			-f fit-image.its \
+			arch/${ARCH}/boot/fitImage
 	fi
 }
 
-- 
1.9.1


