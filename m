Return-Path: <nicolas.guyomard@open.eurogiciel.org>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 14C5A601F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 07:37:39 +0000 (UTC)
Received: by wgbhy7 with SMTP id hy7so55914820wgb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=open.eurogiciel.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=k23QNlZwMqldLcOnXBz5uJ9rOfzLnVJ9E4iLG6ofUfc=;
	b=FcWRXrfhGiLaGmR0j2+DnRHX4q3oeNno9fV0lq8zlBDnCyd7w8HOPaavF6wgRzu7XD
	sTSCRK+NnhSWPitwmEeZgKNI+ardqSyv6dz+Ztnx6iF2tn8yu1kvKH79qtzn5WSMd0Mu
	C7AxP0imuwfamZxImJsWxSFTJ54nmIL8tZyXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k23QNlZwMqldLcOnXBz5uJ9rOfzLnVJ9E4iLG6ofUfc=;
	b=gnUC0fVsLJ2DJWFQmYpu0aOWuugtrMMmAgZzwzGv8bSZ73V77/QtTFP3znaXVvYhWH
	d/PkeZFWaclXWqnibKyLSZ/1KSUe5djk0MOWwCNwcpsPHPCYuH4AOCVSSvT3PrgX5FMY
	EQsQGnib4w0tR701gY34em/NR3xZCkOIScDQnEd7W8QlZFAYpl8Qy21zIVo6DGxPtk9p
	acK+oKnmDaS3eKPZnpUg4CwzWPzlkAKed2MlUA5/ZI/fiKWPMpaRX5gzaTPHIYGQ5J4y
	9uIvrRKq+tu2MqwP2sY73UlzY+zES4/KltjasB26QjtN1m2ADsD+XT9v/TLkot8epGeu
	tX1Q==
X-Gm-Message-State: ALoCoQn6OuHfkr24wdcG2US6SW37VLBPf0zdtXOXsidWGZgJENGrodVsiaAnPr0KSDCSVN6VIBSB
X-Received: by 10.180.104.197 with SMTP id gg5mr62654063wib.27.1434613060437; 
	Thu, 18 Jun 2015 00:37:40 -0700 (PDT)
Received: from PCL131018.eurogiciel.fr (130.167.26.109.rev.sfr.net.
	[109.26.167.130])
	by mx.google.com with ESMTPSA id bh7sm10819279wjb.8.2015.06.18.00.37.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Jun 2015 00:37:39 -0700 (PDT)
From: Nicolas Guyomard <nicolas.guyomard@open.eurogiciel.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 09:43:04 +0200
Message-Id: <1434613384-12857-1-git-send-email-nicolas.guyomard@open.eurogiciel.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] grub-efi: Allow to use file name different from grub.cfg in GRUBCFG
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
X-List-Received-Date: Thu, 18 Jun 2015 07:37:40 -0000

To generate a same image both in live image type and boot-directdisk image type
and make boot-direct image boot directly on the rootfs partition without using
an initramfs we need to have the ability to generate several grub.cfg files.

Signed-off-by: Nicolas Guyomard <nicolas.guyomard@open.eurogiciel.org>
---
 meta/classes/grub-efi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 47bd35e..6d58d48 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -39,7 +39,7 @@ efi_populate() {
 	fi
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
 
-	install -m 0644 ${GRUBCFG} ${DEST}${EFIDIR}
+	install -m 0644 ${GRUBCFG} ${DEST}${EFIDIR}/grub.cfg
 }
 
 efi_iso_populate() {
-- 
1.9.1


