Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5999B748D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 03:15:05 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v24-v6so448576plo.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 20:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MZCl1JrPZ2SodXJA0YFxXAFYfz2sw0JQ0YGbYF1NCCg=;
	b=hfcDVbL7tf5sV1HCXvueemTf2pvhyQwqnNgn/G2uYAIPNKdyxgiUarB7oEZmhaexmP
	N3NZK4w5c+W07OVtetd1po1CP7msKcOMJ0LxS/0bCsjKwssyMmt0uYQpWKB4OLwkrDHs
	2f2qeCgLYqVJ+5RtnhneLZJSB7ceRHc9uisw/6Ib1yllAz6HnuDs5EQr/FBFhq3+agLQ
	nI0s4U7MCMREDBxnrw8Xg2Wmdt12ACIWZJIm1LizoOg4YOdcvKgAex3VjWsJCgUdiFGN
	AfFdt6w7dUgFOBDrQ6AgM6QdEcRH7xVzWWOQIs+GIpaV4nT26ZDTzMnNjyQOlw7BoQRu
	QpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MZCl1JrPZ2SodXJA0YFxXAFYfz2sw0JQ0YGbYF1NCCg=;
	b=qgOjvTN1t5ipSnWrqF6Sr8T/ZjjNTj/+j+JWrdFcQQyLqHhG81kiyoNJBkTxFrxQw5
	g96Vj+wQU89EUDNYN2Dyo6eOJFhoAEHmqqklQuMcZ4bVs24TkvehhFqooZ3fJvPv2RVp
	zdD3HZZFCMKNWTKsOQOc+uRxPcVyL+nlThj188KppCf5cfJVB5w03teIplf8D08B789P
	g8jlAjPTdXNpOpj3+nUFLIQ0Tyqi/ZEyjms165WtSSExbJzGOFzXnzIugYzboOzyZ3lY
	qECLEEZiU1Ww6QKBHupSToo2x5YxdmOpPpGCpGbw/xCEuxAMOZvcSn4fBglKCXk6TTmB
	L9Ng==
X-Gm-Message-State: ALQs6tBZc+ndn/pvkC+ToX/o+8NC/KdHvqrZh6/BVmPMWURC1vIqs5Ol
	s7SQtvXquS+0irbwY7SDb4hmVg==
X-Google-Smtp-Source: AB8JxZod+W2t8/awHBolf2ymRlToB/KwQPR41PrUuVEyBN8VhDris2gYZmnMhvBCyrvA9wmMBAXHtg==
X-Received: by 2002:a17:902:28ab:: with SMTP id
	f40-v6mr47754820plb.208.1525922106342; 
	Wed, 09 May 2018 20:15:06 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	203sm55271472pfz.131.2018.05.09.20.15.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 20:15:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 20:14:57 -0700
Message-Id: <1525922097-15292-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] bitbake.conf: drop _build-${BUILD_OS} over-ride
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
X-List-Received-Date: Thu, 10 May 2018 03:15:05 -0000

Building on a host OS other than a recent version of Linux is not
recommended or supported. Drop the historical _build-${BUILD_OS}
over-ride to avoid giving the impression that other host OS's might
be supported.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/cross.bbclass  | 1 -
 meta/classes/native.bbclass | 1 -
 meta/conf/bitbake.conf      | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 4e85cab2..34d7951 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -37,7 +37,6 @@ CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
 CXXFLAGS = "${BUILD_CFLAGS}"
 LDFLAGS = "${BUILD_LDFLAGS}"
-LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE}"
 
 TOOLCHAIN_OPTIONS = ""
 
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index ad7e98a..ddccfe2e1 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -44,7 +44,6 @@ CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
 CXXFLAGS = "${BUILD_CXXFLAGS}"
 LDFLAGS = "${BUILD_LDFLAGS}"
-LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE} "
 
 STAGING_BINDIR = "${STAGING_BINDIR_NATIVE}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR_NATIVE}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a772cab..702f498 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -735,7 +735,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
 LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
-- 
1.9.1


