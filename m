Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7597A7CAAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 20:10:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i16so19241379wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 12:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=emFgVm/Oo9EJxs/B8mV16r57e30rcu5ZRcclWfHB/CU=;
	b=N+eW5zw7PQK2Gyj/9zkqoClH5diWIky+sy3oVcM3G1gJPmXFE4Gpy8jJH48N96Mqoj
	o6J0coF55cyag8jLrdcrLzuyX44TiLBTKmoHRorQ68s6oyKKnhaIfmOoHCEfa241XhCK
	vipmdtSOg/NKr04LvXwbMWhXQT2lfuV7lc7PTRGla9V7VII4wOh1xku+Dc74ZnSTFnjP
	SSZphakj833eJJdY1IE9SZc07U0VDy2YxJ83RSHBX9W2V9uVPE/hyxImA1f8dFQbcTRX
	tSxCU8rMkcuC4slq4HRYoGEDyI2lRq7vHK3SeuCbdn9aJR3CrOKRskDF4/5WRXQMH8KB
	fAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=emFgVm/Oo9EJxs/B8mV16r57e30rcu5ZRcclWfHB/CU=;
	b=Xena2nT3L7eUxtUsZy1SmUD52sjWmXwvIjaFjHasc0DZABfbjt+cOiwKuOZdWlr1f5
	Ac8UZloj4XfoNiigOuFTQEfqmr9HoWhggg1WtmpH4UW/71beRicPS/ONXB7YBgmt58lw
	TlkQACh8wzGayoBUk4crgqMTeGDySMQLUTUyY1rilYlz+6wYclJGq6n7bwLORplbq8hP
	UJ5XGmismGgPlvJdzASviF89z+PqETakf3c5gUCc8AZfS2kOUqICxM+pfRGEHlS4a1CR
	tI0dRMAFsJqWEHREmlcqTb4IxdboODHbLdo9zxnaQwphe+3J0h/xDwPY6m+yZJ+dSk3R
	alEQ==
X-Gm-Message-State: AHQUAubF+j91gklyF7ceZWiAd+kPjZg3lik2OZfz5kGNPpOAMk3zoPg2
	RCk2wKoJfutfwv09sMzM7dSevPyPJag=
X-Google-Smtp-Source: AHgI3IY7AigfBqL//0jff7dViGsS9aNq26Hv4sCoo1HBRsXbZev6ChaZfwMUgTfcdf62G75MOv5Neg==
X-Received: by 2002:a5d:650d:: with SMTP id x13mr3522243wru.119.1550693433899; 
	Wed, 20 Feb 2019 12:10:33 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	g202sm4997205wme.26.2019.02.20.12.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 12:10:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 21:10:24 +0100
Message-Id: <20190220201026.70803-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190220201026.70803-1-alex.kanavin@gmail.com>
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/4] llvm: switch to the official git repository
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
X-List-Received-Date: Wed, 20 Feb 2019 20:10:33 -0000

Until now an unoffcial mirror was used, which may or may not
be maintained in the longer run, as the need for it has gone.

Also, the official mirror has version tags which allows us
to track upstream development in an automated manner.

${S} has changed as upstream decided to use a monorepo for all
of the llvm-related projects.

Further info:
https://www.phoronix.com/scan.php?page=news_item&px=LLVM-GitHub-Mono-Repo
https://llvm.org/docs/GettingStarted.html#checkout-llvm-from-git

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index eca78af09e4..c68512cc63f 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,20 +19,24 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "e5cc6808dc0d5b773479bf36c51d59d0d3174733"
-BRANCH = "release_${MAJOR_VERSION}${MINOR_VERSION}"
+# SRCREV is set to the revision of 8.0.0-rc2 tag, while latest release
+# tag is 7.0.1 as of Feb 18 2019, hence the need for UPSTREAM_CHECK_UNKNOWN
+# Remove the UPSTREAM_VERSION_UNKNOWN line once 8.0.0 final is tagged
+UPSTREAM_VERSION_UNKNOWN = "1"
+SRCREV = "98ebe7460199b9cd79eb562b5e8705ad28f5513f"
+
+BRANCH = "release/${MAJOR_VERSION}.x"
 MAJOR_VERSION = "8"
 MINOR_VERSION = "0"
 PATCH_VERSION = "0"
 SOLIBVER = "1"
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}"
-SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH} \
+SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
           "
-UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-- 
2.17.1


