Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6597FB50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n1so5400441wra.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=B6J9951Ea2MYlpuetyfvJ3ehZUQn3ZmakJ6NOQwzQeY=;
	b=h8JEo9v7/yxh9ucJtnaJ3Qvd9B3QxhFe1N34Fmg/vuG03c/ZN/uvQfemc8HP5u8NpA
	CHvjDFrUIuvkQ5q5VCRDn+YhsciIn5CVd5tVY3slA8BeR4fl6KA/pnOqwJIpvy6T6blf
	0CDWh8ad/3X+slyhwl6JeMw7Ne4GLNQNyICoTy/45b3ssmPwETBMuIyw+27w/M/JVuat
	dFCypoV1reEmsJFoXX8mL5Dz907ts99hxUJ8OBglzdHEkuvtlMrOg0/nN2UKADAFk1zy
	Dyy7+P2P6N/xWWD5q8naQ88xbKpmUpsjk8icFb3Jwcs7ZmfxxZ2t3A662JuzNsdPwzJo
	4dZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=B6J9951Ea2MYlpuetyfvJ3ehZUQn3ZmakJ6NOQwzQeY=;
	b=gKT3Mhs9KTSIbsc+xCIAOI++ysLYWO3JzGJAm8X9HtxrjoudPXKtPokI/PXd6WtoC0
	mIIu2KRWZeSCHJ1ILSUPAuYoD9ga/DQ3prQAP7a5UQFpoeX1soPe291CJyrefnFvejth
	iYNadbt79J7GbF5vBtZd8/EkvdUBLQnWnvWQs8X9D94Lp3P9NlJU5ExQH1kYpFiQpBz5
	zuAKocMKESf0CYv2Q+pTBGgHrXxfwW0DXVaEmbnb0CeZWGLbCvFxALlkkF5BW3H6lLie
	1O4ShNETnlhkConqsD+66d6TJGBeJnFDkdjdC/6IWVVyNCJ0MsDtlESQOyNSEz+bdpn3
	tj1g==
X-Gm-Message-State: APjAAAUdzVxDDlsrZ1eiGUOQELR2MFOiffBi9Gotd8QqvcOPl40x8pEi
	GtbUvMvPTSwupboKDMnLsEP82Y2gB30=
X-Google-Smtp-Source: APXvYqzaNfAp2w4SXPgauWVCG3+kot/XvTryR737lZw2/AgIQWnzMxCSBdPfAOtViNhVr3BNsQ+Z1w==
X-Received: by 2002:a5d:6a91:: with SMTP id s17mr20164955wru.224.1572342468613;
	Tue, 29 Oct 2019 02:47:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:20 +0100
Message-Id: <328a6454ee0eff275a63c299fb93cbfeefc9aad3.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 07/19] kernel-yocto: import security fragments from meta-security
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:48 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Adding the following fragments from meta-security to make them
centrally available and easier to maintain:

   283939d5c9e kernel-cache: add yama security fragments
   0b86f3fa241 kernel-cache: add ima fragments
   731b466654d kernel-cache: add smack
   813afe8ff47 kernel-cache: add apparmor fragments

(From OE-Core rev: 3063d64984e993d3e7dc2f4c80fb74005f5d6d7e)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 213a21e..958f0ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "ca2e3322f4c5678eaef6434c808d0842c805d74d"
-SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
+SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index d1adf0c..abc8b0c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e6cb812b5532630b6fc6dfd7778d57a4907d3180"
-SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
+SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index a4be4b5..0178947 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b5a2efa31290f31384971494031285d394635938"
 SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
+SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 7d49de6..9b5e69d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b9001287984b0066814c8739f38d629de73739b7"
 SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
+SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 9c794ba..f5e03da 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
 SRCREV_machine_qemux86-64 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
 SRCREV_machine_qemumips64 ?= "ca47368b698795cd5cada84dbfcceda1f47da1aa"
 SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
+SRCREV_meta ?= "283939d5c9ebec9750c34982405a39a9864ac10f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 35088da..6008e3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -20,7 +20,7 @@ SRCREV_machine_qemux86 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
 SRCREV_machine_qemux86-64 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
 SRCREV_machine_qemumips64 ?= "9d4105b32cf123a861bc754377d2f2e156278a7e"
 SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
-SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
+SRCREV_meta ?= "7f6e97c357746382d4339e7e0463637e715acd4b"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


