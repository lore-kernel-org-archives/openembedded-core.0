Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 810D67CDB7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 16:37:23 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id v83so11156847itf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CK6T53iYdvVoy4mIkSdBNro7W5+rYqKyM/8ErAK9F/I=;
	b=KIt7oRcMVgScsvh3gj3mFCal1MXQyVAXPcwRZe666HzziqHRus5MHw+UIG580yQzdX
	J6vc/bzjdOu7o00sRte9QSMdRNBs1kqruJMXIQShDdUxN0YVY65CvWLQJQMckdv1ki0H
	Tm9Tg8oxlo/ayE2yuK4IJd9TBNd/mH3zLmWfMjovwdZJ2b1B2EmL06hgTRAITIs8tika
	KLL7n0wS+fm6Phe9rrVPPpUgcuY0VV2jTNLHAwwSMNHjjwAY7/DLI6+7dDegnt6E+kib
	tXMZQCNyInhU7xRBIvVJjFSGidJI1W6S7h5a3TyuvSCPws9NlBARW2yYUbH9fHiqC3zv
	yAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CK6T53iYdvVoy4mIkSdBNro7W5+rYqKyM/8ErAK9F/I=;
	b=MlbgIhgiPEL24MtYwnCqodm7XsydoD1PEx1QyytH+qzZtBUatYW5xbrSmWIrfi/ILt
	8/zwd8vNhmlP+km7Nn1FyizNnoEIUbw3RwMmkC8ZAYGJnGBGEcUqPrJRXc93TDsZZpTk
	RxNbNzrWicPrAzjBYimbU8OVt9BjSTlysdydKDhygHkJB9DdL2jOP7Tga3wXnzzYOmef
	Z2/Te8bI0wuQBR9LKVyLbtfpdMWyeZ6P4TDUeXIKbPbNoWjlhP5GRfELsBVabuWyxK/u
	Zoomep+OcDYXPJZsdI0shf7BH83eOsk6URvzWBRi0wdVTmMxVV/5+ftpFkFzg1Vxf6c0
	0ASg==
X-Gm-Message-State: APjAAAW0M/NUIHECrkp7d4So9hJG7FW8aYVrmXnGWGk+ti3BUwfMyiAK
	AnI/2cIxmsKaWSB8bDqgZwUQZa998+g=
X-Google-Smtp-Source: APXvYqwcVaDbW3eaSfBX/nb16nhXDq3OhWmSCMsQctFrvxm9k+v2eD6ZKsagUPCNHXwCy3aZCydvPw==
X-Received: by 2002:a24:1751:: with SMTP id 78mr2430077ith.172.1551890244398; 
	Wed, 06 Mar 2019 08:37:24 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	x191sm1072550itb.8.2019.03.06.08.37.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 08:37:23 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Mar 2019 11:37:13 -0500
Message-Id: <86285aeaf5987f2e6dd4dbd88a9eb13cb255986d.1551889557.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551889557.git.bruce.ashfield@gmail.com>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.0: update configs for h/w reference boards
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
X-List-Received-Date: Wed, 06 Mar 2019 16:37:23 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating configuration changes from Kevin Hao for the reference
boards on the 5.0 kernel:

   be627e4e386 beaglebone: Switch to the 8250 omap driver
   957f6060c25 beaglebone: Update the audio options
   ab5298a6983 mpc8315e-rdb: Enable the CONFIG_MTD_PHYSMAP

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index b7e0e5da23..a757945f8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "8ae7073a934d80c4f4b808bc01884777454aae8f"
+SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index b95efa9306..57aada3f62 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6da91ac9afd3b8c144760e3ceacc6a812ddfa3f6"
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "8ae7073a934d80c4f4b808bc01884777454aae8f"
+SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 768036e298..a56e9a19d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
 SRCREV_machine_qemux86-64 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
 SRCREV_machine_qemumips64 ?= "5f072445126e6a9e44f9435a552f4fcf6fc15499"
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "8ae7073a934d80c4f4b808bc01884777454aae8f"
+SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


