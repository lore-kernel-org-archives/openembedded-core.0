Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C08D73163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:51:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l6so13934578wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 06:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=kflqPbf1bFMpgqqcHnjEd9jL5xaI3Ohh2p6YVp7ribDhAd5PhE7ZwvxOKcoCtk07QC
	pzqq0Nntxl/fDi7xfVy7zkhlJN3FkdXXRHI3fIJunvxo5O4b86fD1uMmHgNPspmlRU3/
	hr/3h4mNhLAcX+usOK41PCD2F2dfu/LAB4/lw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=c61t8c3qOhri2aPfs3PhphDbPOiBUUOL8nKhEje3AnQk5FABxnwnIK7bm41X2O/wTB
	V/irGTcyLc4hRtw0JRDVB4sTFw5S1CkbBYHOu4Nc7XBMO3f91Vabe7euhScLzvFPY03m
	WLFFfwk2LxlGKilE1YNFyisbrmlR4dUwxbu1AjCEsHVYMbkGv7QoKDihICUawfNMxxHf
	NUqWYy0+XD5anJFFRJbHFaYO+kZ4XjCrQ9Fd7wnBSzyFQveeluP8s/fM+9feRFvM8e7W
	GWTWDRCPglrX45jFj49NqAwsWUdgYQDNgdX5na4q3VYI95RAueH4KujGWgm9Rh5pVHnR
	sU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=cv/hermfsv4x/UR9h0vDKfyryt8YPSpYdI94fBNtoS4=;
	b=WRV4YlhdqMRVF9jBsKQXrUgXgwrsJIYciV7LUjFaFJK1QjS9xF/it0eSqLmfyRiLAJ
	A2f3Drt5DByklV4Ank/RZfsWoYoEP4acmH/hrZOk08s5VNHGkR8Fc7HD/5oBdZ/Ide9P
	mWYDmU+V5+b/fRwgsou7HgFmBfvBRCPVz94CQfz6T/WeFBoMXn8o/YtjPfjC+f/qd6yG
	UodVYYMq5f00HQfMv0GNSPd3qwU/eYYaj+GvyjGkmSNYSRlNHyFRIy7uzXAszGDgKxgm
	hQsM5ljv/VdOHvZbZ7JSD/FbszNAD7ZVWRY2pDVclgkI0pWiI5MGPnyDhmv6x/gbqH4Z
	IvJA==
X-Gm-Message-State: AOPr4FW8X+UE/G+oG9RZlMYeKyzlL8u9puWoK7tfS+YdyMkTDVDkNbRIEhGNnVJe81OSYg==
X-Received: by 10.194.179.168 with SMTP id dh8mr10192510wjc.130.1461160293678; 
	Wed, 20 Apr 2016 06:51:33 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164])
	by smtp.gmail.com with ESMTPSA id w3sm5770581wjt.0.2016.04.20.06.51.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 06:51:33 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 15:50:38 +0200
Message-Id: <1461160239-7799-4-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [RFC][PATCH v2 3/4] kernel: fitimage: support device tree compiler options
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
X-List-Received-Date: Wed, 20 Apr 2016 13:51:34 -0000

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


