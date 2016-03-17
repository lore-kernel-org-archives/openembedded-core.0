Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1EA60116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:27:42 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p65so3867275wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yy+Du9xByqaaNqDtfaracxLh1T2WhEFU18RQ9PG7X8U=;
	b=bqE/iUHDr3YqtsQBGmBfyaizzNdOQABX1uo7zB1B3WQ9nO2/iyrIA0RcTPAJBmQfWm
	DtBTUlBAq5vmukkuETKw86BwnoAxT+RbBPvM8bODHX3wHpLrEmMQw2mNDcUondaPghCH
	W3Ibode0jTgpezblH9LMNkrQNb8314yzYe75L8NkygAKIkcSUOVjYw9mWbnvOJm/4Hi9
	/+T5nGoLmTE/GduUjOI6+fGcz3drdr1cLbxOqfc/AUGS/XZUWrHSdn42Pzc8H9oGqcli
	rIS9h727M0ks3PO4YJPQOn8PCQ5/i/AaPn2IZXeuBVBxCPcF6fCmQnd6JRp30w8Vnb8z
	QGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yy+Du9xByqaaNqDtfaracxLh1T2WhEFU18RQ9PG7X8U=;
	b=PKZQfHN41lYJlvzIbuaplW31MfigVu0AeGEfaDbsRYeQnbcFjxR5Rmnr/5qh1d8twf
	+9yFx2imV1Mo3LXKMoqgF8MDd5yOWTA5i3j88/qOYA0xyTb2W6j8S9hqjTvqUZRZmk/r
	YGBYdiVovdRLwqLecWPqMYQB8XJj+Q0RfK2qP/v8LYNWUlJdxb4GCHM91ZMpdBnIJmkq
	TvyxTduSHrbvVjWsULwHEITenMyfVs1C0laAqZILzeAJzDTuBJI5QdeHEwl0cKgeS6dO
	b7kfefUme/fsZn2bxMIeabKktWRTmh6U8T6sI/OVO/AohjYa//wY6LnMsJYQIhx4vcBn
	xM5A==
X-Gm-Message-State: AD7BkJLm4RPX5ID1U3NaSvgDAVRPO1kuGM4yZRzfagZXPcSDCjD6mw1KfA6jxOwgyy7xmA==
X-Received: by 10.28.212.19 with SMTP id l19mr35892163wmg.97.1458235662833;
	Thu, 17 Mar 2016 10:27:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z6sm9070233wme.9.2016.03.17.10.27.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 10:27:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 18:31:22 +0100
Message-Id: <1458235882-1101-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH] grub: add --disable-werror to native EXTRA_OECONF
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
X-List-Received-Date: Thu, 17 Mar 2016 17:27:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 4e80e18..9d4768b 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -35,6 +35,10 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
 
+# Generates many trampolines even with -Wno-trampoline
+# bsdlabel.c:161:7: error: trampoline generated for nested function 'check_msdos' [-Werror=trampolines]
+EXTRA_OECONF_append_class-native = " --disable-werror"
+
 do_install_class-native() {
 	install -d ${D}${bindir}
 	install -m 755 grub-mkimage ${D}${bindir}
-- 
2.7.3


