Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 332F97316D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:51:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id e201so10795017wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2GA8G+3nmFcCq2UNLJsU0/0fiH3IxWl2YGpT7D441tw=;
	b=ImC/Obqzf3kDdeQd6KHrFnP7EAvkPKoFUXYvlVZJ3ZXCDhjgdWHPuD/VdEkIMnEdJZ
	zfIneW0ZBrqFN+aPh9DuT6ugNcVf03M9p/j8WETkMtlsXbDHtRptbngMRFmjV4c+biWt
	GfWBq+LHixkZQ1GLwV50qvhY78HUIDrjjayNM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2GA8G+3nmFcCq2UNLJsU0/0fiH3IxWl2YGpT7D441tw=;
	b=fGSbOu+DCADw5n+PGTFUgVCFOZd2yFPiedIZx5d4fQzGKmAEj62WTSDW3PB0cQjsju
	s2kTvAdiR9MdFoK/PNr/f0fPka5ZP9ooSu09ImjNh+T2EiecrepkdOe2yLmCLdpsqAtU
	SINvi2H5iQBPNtPqzSCSgCVtGAmYtOj9M2PdgDnhG/pCAQedwQj9r+kGSHII/XGzJF5F
	A3AmWxMBBizz5E6soLNPFvjuZMIs03EwyEgucGVtoiLb08syfh4fg1jKbnmxjQaogOMR
	qNYkhb9PchvurRT4cq/tNnLspXAA6St+nVxCoFm+TzYHTUy2pNVfT+KvEG8A4LKo7XO/
	eoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=2GA8G+3nmFcCq2UNLJsU0/0fiH3IxWl2YGpT7D441tw=;
	b=RkSWRcd8JLeJzwWPfVhFvXUfNjDE5zMTbS6Ji0TmjayCP68a67ZNwQfqZWDD1ETx4s
	otQd1MfzgnUQsY/mxGc/uibjJMQORPfROUZeDO554jwks57B8I7b0kpJUalXbz9M9Tc/
	6ML5ZLLvli6K2yush6cT9PJspRRBdkh2n7tA+zrr9eU74SE+ul+lcxtWTV40RqzIBoYV
	J2q6+QhL9zpNJYykvsGq9dmHes3/CYP+7HF/VsS5JY8obkaYb9Lz7EoynGeviICQUJ49
	aWY+JPBOklFQxznaHB/C1pjmGoTXiNUG6rpjttWf26q9XkScuGBhNRC69DF7R8PY7rC7
	qQnA==
X-Gm-Message-State: AOPr4FVhKT0rTXASyFvFQIOdNC07xKCoqvWxqkqA+b4F5ja5y9D6mpQsB6bRi0dnIam69g==
X-Received: by 10.194.111.199 with SMTP id ik7mr10022116wjb.150.1461160292686; 
	Wed, 20 Apr 2016 06:51:32 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164])
	by smtp.gmail.com with ESMTPSA id w3sm5770581wjt.0.2016.04.20.06.51.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 06:51:32 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 15:50:37 +0200
Message-Id: <1461160239-7799-3-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [RFC][PATCH v2 2/4] u-boot: deploy u-boot-nodtb and dtb files
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
X-List-Received-Date: Wed, 20 Apr 2016 13:51:32 -0000

This enable the deployment of u-boot-nodtb.bin and u-boot.dtb files.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/uboot-sign.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 63a5181..adb24d4 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -38,6 +38,22 @@ UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
 # Following is relevant only for u-boot recipes:
 #
 
+do_deploy_append_pn-u-boot () {
+	# OF_SEPARATE generated files deployment
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
 do_install_prepend_pn-u-boot () {
 	# Concatenate U-Boot w/o DTB & DTB with public key
 	# (cf. kernel-fitimage.bbclass for more details)
-- 
1.9.1


