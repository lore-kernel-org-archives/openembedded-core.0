Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38A3E70034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:47:32 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e201so2704158wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 05:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dJBFlWoVObQ9dOm7qknSoSGdgSPcC6S3I2lkRMXiRLI=;
	b=Ei/vsezhyaUMb365hbb9xsJkG6srGAPLH0mMGrQSZDd84DOvVBtOWB6zY5MnoEaUps
	0dN8QoKh+XgEcIqQU2sdQF4hggHj9quXIpQ/vRA7CBk73kTlTpx4WBQ/4j1vo1lYrzGV
	TB/MwmYoVYYoZYu3gAkf4UoZk48+P/StuOb3U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dJBFlWoVObQ9dOm7qknSoSGdgSPcC6S3I2lkRMXiRLI=;
	b=Mejo94Yiyn9IzfFOQYmIOshGosVARI+qxZCnqybkCigtnXtTFla+Y+fsAik3mmhpj0
	Ns+2lGLCMw9eT9BuSBAmj8MhN3Wd9qjfC6n16UkfE7JIBC/UoufRtGD+jPX85JH2lPb9
	eIYBplGBYy9agsne9sFUdlHlTYTLr/j5y1QWC39l0QgyxnhD82npRo2KOnkEwKzpOCvV
	NPv9Clah3W/8Wv/bE/EjdNbgKvdGYArjqWBROg0iVTuBCx0MPP8YCs4P/I5APvsS9ObB
	w+I8Bm2tNSSlzsWUVQ4lENKfSVSyOM2AS/SCWnvFsJscV66WJ3HZvCt9CsNr/l84igFq
	0nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=dJBFlWoVObQ9dOm7qknSoSGdgSPcC6S3I2lkRMXiRLI=;
	b=Px1/+SbDT5gMAL8u+nIIJSj5njqOQvYOGwqgMSWsS5zjKvmzOH1jQW6lIyFagKQ5jw
	q+5tqJigG+B47LZSVfMbWI+ZNRLhFWPTujBs9taepnB5vDQ2I82PX40KUBDH7vEQYppe
	fV3ykjU4k349cH/gMGyYPhbVKqYW9VCrYzlfeO7Mpm9PN1PzOQJ3nYug7leUaNsTMGhl
	N0DR4RSEMHcgRTK8JfqfDMq9UEjwo7FJGpw/h8h1JSPL2QZPX0X+afPKlyx49dNLyTBA
	7KLy/d7Y9H2JJREJcMA5Kjsg7xrlCfVTUrZEYuCP3mNtDmYA69PZGwSUl/f6Ys6ce92e
	5LLA==
X-Gm-Message-State: AOPr4FUu47KGk39AP8CiRezrGPcYRVFq945R2ZbsZb5YlVO18r1+9QjL6sGchoopuabLMQ==
X-Received: by 10.28.92.69 with SMTP id q66mr3698790wmb.102.1461070052571;
	Tue, 19 Apr 2016 05:47:32 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	g141sm4228868wme.0.2016.04.19.05.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 05:47:31 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 14:46:41 +0200
Message-Id: <1461070003-12494-3-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [RFC PATCH 2/4] u-boot: deploy u-boot nodtb and dtb files
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
X-List-Received-Date: Tue, 19 Apr 2016 12:47:33 -0000

This enable the deployment of u-boot-nodtb.bin and u-boot.dtb files.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 29b0b95..749f8d8 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -239,6 +239,20 @@ do_deploy () {
         rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+
+        # OF_SEPARATE generated files deployment
+        if [ -f ${S}/${UBOOT_DTB_BINARY} ]; then
+            install ${S}/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+            rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
+            ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
+            ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
+        fi
+        if [ -f ${S}/${UBOOT_NODTB_BINARY} ]; then
+            install ${S}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
+            rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
+            ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
+            ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+        fi
    fi
 
     if [ "x${UBOOT_ELF}" != "x" ]
-- 
1.9.1


