Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1A69871CA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:04:56 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id k87so8529202ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gXnQC1/x2bk491xrcjaYY73lYFtcFB/DL+XSvvAvjoM=;
	b=eLGfVD2vCBxXrm4hfb8JjsjxTGk65PdbL4IA31OgbqkBhH7ZoWwiHusTLBI+YfkZ2k
	W+Xg2gCqXkarfmCHCVYvV8HdWz3pkKS6w+d0NmjxuZJlKQgW8jlDUZ/A3kJmPJEnBRQj
	YSWLsXyQo4jSjwdw79CVuymnPK1Wq2gbDDSGCHYg934vAnGHYJ1UCTk8KCbi8toR1icl
	5lzpfXJC95FPqSHJiPptuC0ruMOgzN4u4uM/2IZnp2OMaO7Tp8x0K0OOgz/9askIyi0O
	vDHyjQu5ETmhX4HtZlC89eDg5/+Cr3YW0R5svIxJbw9KG7otmC4L5gQXy8jt1n9HkNge
	hNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gXnQC1/x2bk491xrcjaYY73lYFtcFB/DL+XSvvAvjoM=;
	b=R8orWxitj8kH9OVIqQ2fh8wZtlKXRxZ1+zOeSivqQPbBPZy8oqUEgQb5me01zHviAj
	HdvjoC8TNcigeF7l0BbQumu+ldSY7YYX/pZG1jx2Ts/dccVm9Zj7iDxufJhOzQrFb8zT
	V69+TYW/cQ3T2nq0ked8PRaM0xmmUNPvt5hQT9LzwhD9ewL4VQshPH2DkX+3RmeP0x1a
	vLGC3EIlai+XXUeBEMm2J0do62DvuHG6IQQV3oANbsXjtJ03kmdclm54XuQ47Nxayevm
	QfNLbrjbnYo0f0wxc7eLRotxKlYwBn1gfpPoJLjUvmiKTNKZGz/bh1OAttp4fNRpMTbZ
	xYkQ==
X-Gm-Message-State: AN3rC/60s2V/cue9+nnBOO9RQLmWCf/n3yRISsDob9IH/aQFzRPqYcE/
	qV125v7kuYj2xQ==
X-Received: by 10.99.123.81 with SMTP id k17mr5234218pgn.139.1492643098033;
	Wed, 19 Apr 2017 16:04:58 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s68sm6393655pfj.77.2017.04.19.16.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Apr 2017 16:04:56 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 16:04:46 -0700
Message-Id: <1492643086-31218-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492643086-31218-1-git-send-email-armccurdy@gmail.com>
References: <1492643086-31218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH] documentation.conf: update TCLIBC[doc] to match current options in oe-core
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
X-List-Received-Date: Wed, 19 Apr 2017 23:04:57 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 06527cb..35b9103 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -415,7 +415,7 @@ TARGET_FPU[doc] = "Specifies the method for handling FPU code. For FPU-less targ
 TARGET_OS[doc] = "Specifies the target's operating system."
 TARGET_PREFIX[doc] = "The prefix for the cross-compile toolchain (e.g. arm-linux-)."
 TARGET_SYS[doc] = "The target system is comprised of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
-TCLIBC[doc] = "Specifies GNU standard C library (libc) variant to use during the build process. You can select 'glibc' or 'uclibc'."
+TCLIBC[doc] = "Specifies C library (libc) variant to use during the build process. You can select 'baremetal', 'glibc' or 'musl'."
 TCMODE[doc] = "Enables an external toolchain (where provided by an additional layer) if set to a value other than 'default'."
 TEST_IMAGE[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images."
 TEST_QEMUBOOT_TIMEOUT[doc] = "The time in seconds allowed for an image to boot before automated runtime tests begin to run against an image."
-- 
1.9.1


