Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A540F74C4D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 18:13:19 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w7so9769595pgp.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i50LjNwmePivDe6JP1UIDMu/b7T7fCCP+CkD2JFwE6M=;
	b=a9DloIPfE6bSx4lmoDYJAeV578zVAZHfHsGN000lKfZTq1VtvENftIiX+qJLV/otz+
	inQIiJvNQ9M3AlDqFnweS+OUKDSTfJVDoMLXPJgpP7IzCgpLZXq85JDIBvzj6wWNNNSc
	+ta82RIzerBuvht7UFNpFveQegfohaKvustU7CWw08nKbN3uLe7Kz9Ueq3a9qkxKr+Q9
	8LikEsuqMWDKOZAFbNR+ZnPoF7qIZ6Q/HF2SQcI27G74QQdFGC2q56oF3/HV0c6C3Ts6
	KYUJUHrRBftA5yoXgcvuBcGJlH09So7nl4CxXvQQcjxouxGu+d1ZkSGaU5ObA6qSF5R1
	Tl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i50LjNwmePivDe6JP1UIDMu/b7T7fCCP+CkD2JFwE6M=;
	b=tx+HhjIfT9kGCQ6AVjU/5waxiAPp0hh3W+SQn9NeoIxa0k8Ku8GOc2tlG9xktYJ/s3
	+fHBfhxnqCEC3nph6AGmPPjpLE7iBnfMLMpbRR+ZPF3CQEnZ6ZzUyryvvWadSNlwcZU5
	6FuKh//AlgMqw9whz9api1KDNiw9oxMlXAPt5MxbWdVPsJ9WiWbdX1WffrpZMPVKSKON
	D8RX1/OTLQ+wAc8SMu58a/DQdPz6kazlFNcrCf6YR+KfKnl+sbh+jHUZThL9I9hgDxqE
	YjiUE7bbAQlu56r4upd5efrE/dF7nEIsJ3G9H+HXkZgsQ1Eb+7eJcZ/6rOZ7/odl7q4f
	F/Ig==
X-Gm-Message-State: AA+aEWZbhfwnrO7SkLNNkmkqNwKbrD5jrtXJCXK+pHq9Cl8nUXc6PoIA
	reSBKfuoCUn3ClGdFxLksrlM1pMASA4=
X-Google-Smtp-Source: AFSGD/XuyQXMyP3tEdP+lKU4lE+gPPzH3pDqBXEJ7DSavVwNAr1OwuPO7lt3GPw9YAZK1nPpi0KtYA==
X-Received: by 2002:a62:4156:: with SMTP id o83mr21341545pfa.72.1545243200663; 
	Wed, 19 Dec 2018 10:13:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	q75sm27536922pfa.38.2018.12.19.10.13.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 10:13:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 10:13:07 -0800
Message-Id: <20181219181309.8320-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219181309.8320-1-raj.khem@gmail.com>
References: <20181219181309.8320-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] libssp: Remove dependency on gcc-initial
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
X-List-Received-Date: Wed, 19 Dec 2018 18:13:20 -0000
Content-Transfer-Encoding: 8bit

Its not needed anymore and it can depend on gcc-cross instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libssp-nonshared.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
index 458eafef52..bae8c81cc7 100644
--- a/meta/recipes-core/musl/libssp-nonshared.bb
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -8,15 +8,10 @@ SECTION = "libs"
 
 SRC_URI = "file://ssp-local.c"
 
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
-
 INHIBIT_DEFAULT_DEPS = "1"
 
-STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
-
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-           virtual/${TARGET_PREFIX}gcc-initial \
+           virtual/${TARGET_PREFIX}gcc \
 "
 
 do_configure[noexec] = "1"
-- 
2.20.1


