Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5AF865CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:23:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w143so13658715wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1QvH6wOrmXcbghs0zRH5BW6ZJJKD4QUidrzFHJYj1zw=;
	b=ere1ssgCYRiknog5gu878kqCkh4xdV36XOXENCklnOlf9gVCoIBdVhvDLG4gM0VatL
	mNmTQpGT/PB5A+VCWPGWm3wcXVBILLNgtUFTO+/mNFpoVjsQsPG2AqnuiDK4GwfWKp0Q
	lt97wkVhUs8ocpKkgK3d1BpPSunk64e8dAGw8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1QvH6wOrmXcbghs0zRH5BW6ZJJKD4QUidrzFHJYj1zw=;
	b=xTPMNYgqN6ZZjNml05Zjy1wTROEyl2Ms4UszStI1vI4hh0guT+2L5YOM6gEeGF3BYj
	uRFaBwylxboP4d+zYZHbzVYR2kggsmGaVgPqBY3RkWWLhvvfwTfxjZpyIu9hVL/S/wN2
	jW+UQhpIi2SjThUzKdBbF443T/bca+YxZ46kNA9bBPlgLJhLVHvrN1thQYfJkYyFGJI8
	PTV7iRs20HI2Rko5x8ppeRcVI0kdaOPmrytDqvzyb5Ceu/IY4ylI7hgdNL9844e2seIz
	Y4WuvqF9WMMCkDklh0iQZLiS7VLwl8YFLXux0bBe47eZcCQqZhZiDsjtVNUGZt3TZ8iu
	LSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=1QvH6wOrmXcbghs0zRH5BW6ZJJKD4QUidrzFHJYj1zw=;
	b=k+HhMMkQGx8U0rcX1FOPYmxo8xVZhnYHxqYY6nGvMkHBpt9Tpo8f/LL42A+PHx7F5i
	qq1dZ/dHoN8jsyEYyF6UXWx/7EQcyo0IDsI0YbME8WFBRfUfIUHSJtF/LXVWfK0qUIgu
	ZK1MGkiOP0La1jU1vpbfdBn42DRX3VaR3ZFc7Y9Rq7ycgBQ33YL8yCma6ce4qNEmfvSN
	Yz6lvi5mu+BMVenT7zUcZyHyhxqtUsEZ57ME/hUpxBIcMMWPA6qq9R2lRfc2QB5QnMMD
	5UbjemnmdxSbvLA6she7W6aaUgz27JSBsgod3jGHhRjQ17d2R+bb4VghuGCHLTcP0Cb1
	trXg==
X-Gm-Message-State: AOPr4FXFUKXkXAiiZXOhdVqfnDEe2b/kODSBb1cCe3JmC2nzYHAsOZVn6DUcu15VGweW5g==
X-Received: by 10.194.104.202 with SMTP id gg10mr10195271wjb.103.1461767004426;
	Wed, 27 Apr 2016 07:23:24 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	kq9sm4313514wjc.26.2016.04.27.07.23.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 07:23:23 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:20:54 +0200
Message-Id: <1461766856-27881-3-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [PATCH v3 2/4] u-boot: deploy u-boot-nodtb and dtb files
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

This enable the deployment of u-boot-nodtb.bin and u-boot.dtb files.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/uboot-sign.bbclass | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index ad84c44..82cec9e 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -42,6 +42,24 @@ UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
 # Following is relevant only for u-boot recipes:
 #
 
+do_deploy_dtb () {
+	mkdir -p ${DEPLOYDIR}
+	cd ${DEPLOYDIR}
+
+	if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
+		install ${B}/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+		rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
+		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
+		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
+	fi
+	if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
+		install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
+		rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+	fi
+}
+
 do_concat_dtb () {
 	# Concatenate U-Boot w/o DTB & DTB with public key
 	# (cf. kernel-fitimage.bbclass for more details)
@@ -60,6 +78,10 @@ python () {
 	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == uboot_pn:
 		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
 
+		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
+		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
+		bb.build.addtask('do_deploy_dtb', 'do_deploy', 'do_compile', d)
+
 		# do_concat_dtb is scheduled _before_ do_install as it overwrite the
 		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
 		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
-- 
1.9.1


