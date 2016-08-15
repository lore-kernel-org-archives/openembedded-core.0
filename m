Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 58AD277115
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:27:02 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id d65so3864346ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jvnjhFOdaXly8rDx9cWXRoj8vsoDFk2n9py8CZcR9d8=;
	b=M1B9OH2u8LoqIdxbTog7xPcQjx2/e4FYtnJ25hfECVhfm7BOicVi3MKuvpP7fv/d2v
	0VsPiiaxtOVttfyfGYh0whLl7vD8TZJRg6+R8RMzjdXc7Jwj6cian0NDcLglwv4OyHSE
	DYEy/BsEK/zzNik1B3els78nNCjBH9XmbuEiqao7A0a0IA9xZ4KVlP8uVLDL1+tH3EPT
	ixmu6forUXnVhTLISSLhalMmjVCcA0J3tYGfqTxmU0mxHfU37g0IFkVrDaMF3imVxbpm
	QFCdMs47kbaCs8Qa6kSTnGLQYoXNO0tvuFyXMoLWz7TEgv7BxNDoaOG0vb+mRQNQTasa
	3q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=jvnjhFOdaXly8rDx9cWXRoj8vsoDFk2n9py8CZcR9d8=;
	b=IlsZZn0QPf44N/ek3sYr6fhbFh6cNZABHeUTlUEG0wfE9pT8M+2/ba0C4NXFgX1fUk
	Xt7WNvjzU25MCHlwrri0DvMPd8dOJrWgpZzfUKjpjXerQZ5xOtZx03B8DF2rhRANJ825
	mpZ1zBSHHCcwNwuXSemTI8657Q2B9uD5/Xh0eMQPqlrl2fsPjIzyFtj8WD03XkewjxSn
	GPwF9aWZTnPDmxfHOncjDpHtJGEPga9Tldw1hQxQ15Z2GiB8z0u/3vfwusleZTUr/QYj
	vq07SLcCsv6Q0qA0JNZlt1robNQKfuz5koCI/odywqt8ig5WywcbBeCErbJAnzNbd16K
	P1KA==
X-Gm-Message-State: AEkoouszupYVbP8lImGbFhxOsHp1eq+z107nL613CWNhdSqyoCvSG5BwOcQcm+NlUteStg==
X-Received: by 10.36.61.67 with SMTP id n64mr10075414itn.74.1471285623072;
	Mon, 15 Aug 2016 11:27:03 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94])
	by smtp.gmail.com with ESMTPSA id 65sm7908858itl.16.2016.08.15.11.27.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 11:27:02 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2016 14:26:56 -0400
Message-Id: <a68dd58391c30a64e3b0830152b0ffbce04f90cb.1471281772.git.bruce@zedd.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/4.1: bump to v4.1.29
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
X-List-Received-Date: Mon, 15 Aug 2016 18:27:02 -0000

Integrating the korg 4.1.29 -stable release

Signed-off-by: Bruce Ashfield <bruce@zedd.org>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 6411175..d25911d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5772feaf5827e42e1950a91d95b2fc3c1845b5c6"
-SRCREV_meta ?= "0d6de63d4603b9cc3a4a68391bcb5156b9b0cf96"
+SRCREV_machine ?= "b1e722634976e1bcf9dc73bcbcfe3487c3fd7e4d"
+SRCREV_meta ?= "71dddd41d8395014d942ac8f20f1255751cb144f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.28"
+LINUX_VERSION ?= "4.1.29"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 9eae2e1..afc8819 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.28"
+LINUX_VERSION ?= "4.1.29"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f6ab3612272bb22bac371403121609c66c50cd45"
-SRCREV_meta ?= "0d6de63d4603b9cc3a4a68391bcb5156b9b0cf96"
+SRCREV_machine ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
+SRCREV_meta ?= "71dddd41d8395014d942ac8f20f1255751cb144f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 8ba0bea..b17d591 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2f133a201f2bbde4ce33731d1596d5144360bf87"
-SRCREV_machine_qemuarm64 ?= "f6ab3612272bb22bac371403121609c66c50cd45"
-SRCREV_machine_qemumips ?= "d1cbc627631f706d19e8e4518bfc38b266f3fb9f"
-SRCREV_machine_qemuppc ?= "d1699ce26291a3e07113057ad7e235f7891e73fb"
-SRCREV_machine_qemux86 ?= "f6ab3612272bb22bac371403121609c66c50cd45"
-SRCREV_machine_qemux86-64 ?= "f6ab3612272bb22bac371403121609c66c50cd45"
-SRCREV_machine_qemumips64 ?= "725278e5cbc402139051032a7b2137f6707c46d6"
-SRCREV_machine ?= "f6ab3612272bb22bac371403121609c66c50cd45"
-SRCREV_meta ?= "0d6de63d4603b9cc3a4a68391bcb5156b9b0cf96"
+SRCREV_machine_qemuarm ?= "09b5eed6e905503646514803787d82f504013144"
+SRCREV_machine_qemuarm64 ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
+SRCREV_machine_qemumips ?= "582073e7a49b0847052be78254805f33635dc837"
+SRCREV_machine_qemuppc ?= "0914d10f46f22582e955b06590768ec51e8a91c3"
+SRCREV_machine_qemux86 ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
+SRCREV_machine_qemux86-64 ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
+SRCREV_machine_qemumips64 ?= "ca25d7656f7eaeb8454a182cfa38fb704ec85276"
+SRCREV_machine ?= "053af7be9159a0b5a016a3e399de1484e51f26cd"
+SRCREV_meta ?= "71dddd41d8395014d942ac8f20f1255751cb144f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.28"
+LINUX_VERSION ?= "4.1.29"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


