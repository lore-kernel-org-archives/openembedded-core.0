Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 733E87D674
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 15:24:16 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id v27so6619698pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GgZBgPmow5ehu8UB3kvmHXJ8ZxX7VMDMQY09HvTHRPk=;
	b=Y6ry+55AvNWKhtAvY50xNhxx4wnT7XIk2cAnbp1+Pjg0nDGFaOJ3rb/O/H7CEYyefh
	YEPIAZ/AIYR568nIBMVY+F17oJloXOCuDJLKKfJSxA+/LKYrgf2z857lUH51OwB2KxoE
	7OF25Q3rf/xJ/XuCY7f1dNBE3ajoOUkT1imgesDo0pmSZmMI0pjKC49WevSj8OsIdQsD
	3yMBQYOkUAu2adIzonYmI6gwd37u0QtbsNZxtK/6g7B0u/7yifKieB9BOR+Fyv55M3pz
	DkpgUJX/oNujV8tfVqFPcbcrjkT7oFH12aCjVKnn50y5nDiycJKV4r7KG50VXJ4It8SP
	A7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GgZBgPmow5ehu8UB3kvmHXJ8ZxX7VMDMQY09HvTHRPk=;
	b=hsmKu01mwWzfFcNchgbH1QnVoBpdWPvgjPwgIfZ+qGTO/3U3j4XhCJ4nv3CU4x9pso
	LV3c8OhUzv624bYqnfGt0dGAYqWdwQBKgFa0FDmJRQNhi7T7YGqI+JIhyO4PwIy7Yzng
	94zqqFAHjMi7aqAWf8rlUp7/oNmqkh9uWYKW9oE1fhOwz78+CdtEGKAWdvNllr3HdlAD
	S7PKh9/20FHDblDgo0lkIgcHFZyD8nB7RmAjMvfdfUGst2lfTeuxCWZ7osvi5Bx9eERc
	kKexioaOcJ64OcGg1adSpZosP9ike4tFIUbExtFq+VveoGqF0svpLgIUm01OCzgbpA0j
	9ehw==
X-Gm-Message-State: APjAAAWhbhSE10Xtbu7CJhryjo0Vt/fKbtYcGoN04czlDKJQKCNr0skd
	7+BlmPv1wIbldggvU5pPi9OOZIZuyw0=
X-Google-Smtp-Source: APXvYqx3pwN4ikj3A79b7ToeXSyTLN+3dEWSybqTUiDpmx9sVmlfkitXsWa4aCzrBhK8H3oIj4Xd1Q==
X-Received: by 2002:aa7:8604:: with SMTP id p4mr21788383pfn.229.1570375457671; 
	Sun, 06 Oct 2019 08:24:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	v1sm10586425pjd.22.2019.10.06.08.24.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Oct 2019 08:24:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2019 08:24:06 -0700
Message-Id: <11819621707cb62213c53334e65f26971a6203f3.1570375187.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570375187.git.akuster808@gmail.com>
References: <cover.1570375187.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior] 6/8] classes/image-live.bbclass: Don't hardcode cpio.gz
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
X-List-Received-Date: Sun, 06 Oct 2019 15:24:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrii Bordunov via Openembedded-core <openembedded-core@lists.openembedded.org>

There's INITRAMFS_FSTYPES that can be set differently.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index af71be5..54058b3 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -37,7 +37,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 LABELS_LIVE ?= "boot install"
 ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
-INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
+INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}"
 
 LIVE_ROOTFS_TYPE ?= "ext4"
 ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
-- 
2.7.4


