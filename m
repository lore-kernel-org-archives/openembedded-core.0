Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id D708B7FB3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v9so12861887wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4uul3AWpiVgCf/jggZ6mIqNXSCa/NVWfR6Z16c2WdwQ=;
	b=FrRWNlGRMnAdtJSWPMZ7DofR0WcCpZsFNOByb1h7Se2Nrekqe9ZFfNSISjANj4DG1g
	8KFbeJMDp0xKquo9LB8w2MzvNEVucYEaUIZcy9zV8Pio1sblJN/2++LpCwC6/e30D7YL
	CFjA10HC6INfIk+QAJF43mFstfyxvAUmkC0audChW+aO1cD1XjznQFXFnhQrX5QOe6ap
	d7jf8en71N+X2oL8UiXITwHrY6hWS/IQMIY5KcrPf/S9iu4BR7KE+w/CC4gAzbR6J1T9
	u69iw4yMk3R2l+oJvGgB8nJ57rS/ZKDn0ki/tsXO0srkLRcPowoANffvqNSHo2cbej2n
	v/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4uul3AWpiVgCf/jggZ6mIqNXSCa/NVWfR6Z16c2WdwQ=;
	b=ZHDoiUayasOo/pY9wmkr5T0/yjBuz5P5aUZONkh3jbLCSxpqJy0K/61FKC+8eXKO7n
	+V0KHW9IxZrBHYu7MvVY9hiSYMYeLWIgpGI1sJPm2xCppT6WyyPFCaKOV7Ud8cMi2s00
	pT8LM6SzLdiexKoGRicRYHakxH32lqqOxadsp9VyQaZMhhXndAJeszwzy1zh0QctUyEI
	0f+Zcvb2g53f2gFZFXEsJgaM48wUHpJB8hEcu7LBpup4E0NLNt3UAmTTrIaKxr5EL439
	NUdsh6xvGa+2eJiFLeEE7S0eB62nDAcAPSNq4tTTdKPU/ut1vbWVPf0acB53T/h1Y7Xi
	0Z1A==
X-Gm-Message-State: APjAAAWJxXJkL4Gs0N2vZaRC8QJa6Tj8Fe+5hV2LcAIs6jNIhhLm0ouY
	YMtznvWy2fp9cM3AlhtEjdmLsRLNPpM=
X-Google-Smtp-Source: APXvYqzFtU5mGDQ/PZMguY9iQMjT+c72pdo0E43O0BAXgC9qhO8pxSqC6anEJS25T9PuffVCgHTIQA==
X-Received: by 2002:adf:f087:: with SMTP id n7mr18542824wro.1.1572342469442;
	Tue, 29 Oct 2019 02:47:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:21 +0100
Message-Id: <fbd9939c4b0591bad52af392b904e9f41b59d558.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 08/19] linux-yocto/4.19: make drm-bochs feature available
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:50 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The other active kernel versions have this feature available. To
consistently enable the same video output for qemu, we can cherry
pick the feature to 4.19.

(From OE-Core rev: a777e0f34e106455f963bd58fd8728a16c588c4d)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 958f0ee..db7ade9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "ca2e3322f4c5678eaef6434c808d0842c805d74d"
-SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
+SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 0178947..cadf1a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b5a2efa31290f31384971494031285d394635938"
 SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
+SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index f5e03da..d200e4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
 SRCREV_machine_qemux86-64 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
 SRCREV_machine_qemumips64 ?= "ca47368b698795cd5cada84dbfcceda1f47da1aa"
 SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
+SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
-- 
2.7.4


