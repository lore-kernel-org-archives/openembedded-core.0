Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id B1ABA7CC46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:15:18 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id l5so21910544wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=giRMXPSMmt5nUfdJRMG1WF2znUVRtdXNWHWAy/eF2EQ=;
	b=fL4gfooTpqt99NbSKyU1jdZDyUGLrYpKRZH7vbVHGPmS5e8m7MxR4kI82O5ZpDWU1c
	Mpz2Ao5lPlYzsD4Gban4ZPZEzNcamffr7KeCVgFvxYtMQ0kSqx2PWqO76IbTQ9KF0ccO
	iLJTcP/Z1t4DkjF+zOYVI0eaSfMFM5WuTi5t6gpc7T2S0bDU1baRv7LP3xu8a/M7OzQO
	FXdkd0aoeK2xsCoygynvEo5FBdh9pWlUFfflQnAk+ZJC1FYV7g7O6ZgpsuUlUjrwHspn
	+j8yFe3nEBsYo4s/IvFdyS2aeveZ/kXF1MJ/GWGKFy/kQ1a1DH7TptisvY5Vc+2vVwzb
	O5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=giRMXPSMmt5nUfdJRMG1WF2znUVRtdXNWHWAy/eF2EQ=;
	b=ZVp/JSf0VL+hjBbL1zkmcdkQU3Xdaj1UBvuu+HkY66fsf/iM1aK0KhLVy3lsbzqIuy
	2TNN18O1LewTZL4mXdXaJYhHxdzfaxltTyk/o0GtZTgfstOeNQR2EChIOi926knBazoA
	lDmmiV0MmjR49tfPXMc6G4fscLtuk77dPEonwG0hqGreRHIpbB1s74v0q+qyVrBJ9SiE
	yQWpRzNjf2VGnnbR0lyKCBwXMAIv7SiHgQlkKg8EqT+mMffv9D5D37NvEbQXZwlYmUMA
	s55Rw5/HyXVSweTiBgxaR++hkTVqgjykBtQALiBPTgtb/w0FRwsC6nkC8RPQDKCRsMRA
	exCw==
X-Gm-Message-State: APjAAAVeebjUeIHn/3SUpfVbZMqS9BPHL8SnnqV9UsxI66oO/0CKYBi9
	A+ppLY0LFYVFXDb4cJXD1UIwJ0io
X-Google-Smtp-Source: APXvYqw5LuLRf6Eo0tT3FY7AyY2aORcDgsfqf+yzviK2yaSvAEzK/jZ5ckl917vEv/2bAhVX52j8rw==
X-Received: by 2002:a05:6000:14d:: with SMTP id
	r13mr6746823wrx.231.1551359719212; 
	Thu, 28 Feb 2019 05:15:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c17sm13644910wrs.17.2019.02.28.05.15.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:15:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 14:15:06 +0100
Message-Id: <20190228131510.43557-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190228131510.43557-1-alex.kanavin@gmail.com>
References: <20190228131510.43557-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/8] qemu: remove sdl option from PACKAGECONFIG default
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
X-List-Received-Date: Thu, 28 Feb 2019 13:15:19 -0000

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


