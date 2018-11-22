Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDE46C57E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:44:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y139so9341297wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=IGNwLB0090THlZ+qV5KEJF1CBQ2EMlGid9QA4ObfXy0=;
	b=MYYCL/fuUL8ZDcE5pgIJfBJ/HwSH3tKCvWjfsL9+NgEUwdMYj9JUusb/yuKLnvmX3Q
	bo4J9d5ZNDCH20/lUqQi4dfAAeSezl+rI0oEVSaDuAeMJGXm0H29Nxvt5qbLeGDpYb9d
	1fTod6h4robxo/A4ktPk9DJBPytPuzEgytoTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IGNwLB0090THlZ+qV5KEJF1CBQ2EMlGid9QA4ObfXy0=;
	b=Ux+DE7nvxWI5Y2p6NFjYyLPdz58fPB5Pw4zuzP3GZI7a0hn6jWwY6ljZ4j4TLH/B/R
	qtXOdowocRiMUklO9Avy15+n64npJI6EABD87dtNNJHhX6+ozvGoP3+k8Grdszeb6Z8Z
	7pqYTKjnKOKwZvcZus/AFSdSdBKeBcbkwDgPWMzz5d/C9CXjZB++HPSSRybhiNSmXrUH
	zBsq/CX1OEiGmVjCCznutgI27Qls1AJCnw9jY8qOBWyO0PSh5EqnikrFbjzdg4Wf91O2
	pQSpln1v/sVXbXgrZeAATj/FwW4PeCcLNRlWAoggnX9iIh9XAvWL8s+JSjyj47/g7UEb
	3RnQ==
X-Gm-Message-State: AGRZ1gJWRDNM2ewS6+F+kQT4vTUoXtYU8IKsRveHr+cxs08voQfx88In
	MLghfz/Fn6kLRDpQkTzn/PlAfkUPAk8=
X-Google-Smtp-Source: AFSGD/VPWK4PunwrDI6Me1+MerotwwceU+6GTEKtFYCYzVI3ymgqfR8ZljrbXWt3USaFJCmpzyzTDA==
X-Received: by 2002:a1c:5448:: with SMTP id p8mr10330562wmi.124.1542901494648; 
	Thu, 22 Nov 2018 07:44:54 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	4-v6sm4650425wmd.18.2018.11.22.07.44.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:44:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 15:44:52 +0000
Message-Id: <20181122154452.726-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] documentation: Add newlib to TCLIBC's [doc] entry
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
X-List-Received-Date: Thu, 22 Nov 2018 15:44:54 -0000

TCBLIC can be set to 'newlib' now, document this.

[YOCTO #13032]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index fc6d008807b..4d2a707563d 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -413,7 +413,7 @@ TARGET_FPU[doc] = "Specifies the method for handling FPU code. For FPU-less targ
 TARGET_OS[doc] = "Specifies the target's operating system."
 TARGET_PREFIX[doc] = "The prefix for the cross-compile toolchain (e.g. arm-linux-)."
 TARGET_SYS[doc] = "The target system is comprised of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
-TCLIBC[doc] = "Specifies C library (libc) variant to use during the build process. You can select 'baremetal', 'glibc' or 'musl'."
+TCLIBC[doc] = "Specifies C library (libc) variant to use during the build process. You can select 'baremetal', 'glibc', 'musl' or 'newlib'."
 TCMODE[doc] = "Enables an external toolchain (where provided by an additional layer) if set to a value other than 'default'."
 TESTIMAGE_AUTO[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images each time an image is built."
 TEST_QEMUBOOT_TIMEOUT[doc] = "The time in seconds allowed for an image to boot before automated runtime tests begin to run against an image."
-- 
2.17.1


