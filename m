Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 963F07C880
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 12:41:22 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id r10-v6so14240035ljj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 04:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XBeCuBfcVSAQ3DZuNtp+4TeVh+2tGNTCKBZjYlmnaw4=;
	b=L+xUtmITUJ/NRYcytJkBqbUcWKXeEajVBJljcfi+4tXhARMH1Ih6d2fsl513Ja+j4c
	c+T3yxO0cmUhOzJX/UHkxMZXzuZdkHuatwYSezVpQmHlYXA5SJWoXuAoRsyfTYJSHHQz
	3MurhtFTo3EeuJ3zNy/y9vIScb7qbxQzOtTcC+H442DeuA24rCsg8bER5xpJyeQcWmgq
	F196xxSyzwj8O2NkJ2Y6lfTjvZ1kRSg/rUq/6eAVIcFNruwlXvWU9wnZhCaBSx55cypo
	OJT2qZr6RKfQjLmDrJ6jdfpgfMxreN/AA1WtgCVEVuMIzVdva+s9/I4s1ySpk7IYj4bH
	ybFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XBeCuBfcVSAQ3DZuNtp+4TeVh+2tGNTCKBZjYlmnaw4=;
	b=nrtp/oOl5xgJhtV/sFAbBJpiCGfD2Xms4rA6JpPeII+fqpln+2u8u2aP4RQyKz1uiN
	LPTmlb3B+7d/lAXGDPKc3OGGabv3UPmk918MvjWmdJEfRmRnXgWFFzlF/FbP8V++zVzu
	9MZIeZ2jEjTxZWk//1neOhScR0MHXUxNG9atlFNoZWFjs3NMFxx7C+eLIHqwRATEv5fo
	3Alx0B6K90ZGkAnfuKVi1HUWpkEPn+YMeyNtthd77Rg3Khvfc6NBtbYXpRvZvYjJx7Kz
	+7J73S7depXbLwWIWWGOSye08FTLtaYRv0cVjNhPdsrkuGhPSZkUPWCzqgBow53uakRD
	EscQ==
X-Gm-Message-State: AHQUAuZOeHEwnTD5+vDy7RYlB1g/Lx/AMsvp9U3jYO3HdZAe1lXrWCtu
	NTgYUL+AuVTgMTgKmeu1DpAtQ4UD
X-Google-Smtp-Source: AHgI3Ibg8AuJ/KcKHmfLIcpyXPQ5nj9+mWyum/H7jaSITzc7acVB1g32/4JcHCduCfZ174OWRQsbcA==
X-Received: by 2002:a2e:9209:: with SMTP id
	k9-v6mr14024760ljg.12.1550493682910; 
	Mon, 18 Feb 2019 04:41:22 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h3sm3733898lfj.25.2019.02.18.04.41.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 04:41:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 13:41:08 +0100
Message-Id: <20190218124108.7846-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190218124108.7846-1-alex.kanavin@gmail.com>
References: <20190218124108.7846-1-alex.kanavin@gmail.com>
Subject: [PATCH 8/8] llvm: switch to the official git repository
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
X-List-Received-Date: Mon, 18 Feb 2019 12:41:23 -0000

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
index eca78af09e4..9e9b15bddec 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,20 +19,24 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "e5cc6808dc0d5b773479bf36c51d59d0d3174733"
-BRANCH = "release_${MAJOR_VERSION}${MINOR_VERSION}"
+# SRCREV is set to the revision of 8.0.0-rc2 tag, while latest release
+# tag is 7.0.1 as of Feb 18 2019, hence the need for UPSTREAM_CHECK_UNKNOWN
+# Remove the UPSTREAM_CHECK_UNKNOWN line once 8.0.0 final is tagged
+UPSTREAM_CHECK_UNKNOWN = "1"
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


