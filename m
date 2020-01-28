Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 94D487FED6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 15:16:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so2973619wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rClqw/ZFoejqMRNHD9RxN3GPX2EdwfoV6nngYvU14HY=;
	b=K60u79egBJVeV40jr44smPY0MEsNBKgMDTkgT6eArddEEbGCP12uH+vrfunC1jvO3B
	MINolPiE8btYyMkAmNWOo9T+VbXyEwj5U0If8qbQNi189XD0Ao59Zb/FEcjWI6Pw2cXO
	OhMTSOMur4mCvCqntyHevdtoefGckkc3ahJ/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rClqw/ZFoejqMRNHD9RxN3GPX2EdwfoV6nngYvU14HY=;
	b=qfsm51Z/RWe4eqkNthHGw23c2IfYQ80P4uJB6X62RH66MmIgFsIZGTLc6pysuKwnUI
	5dRy3hCmgqv1SG579lcxYPDWZNumAThovK9db3B/NpUTPpAs1tqelpn8Mmi/zT2RGhe0
	dt3MKwpsEF+pi4q6TmCdRsGA1scEnG1NkrGv0cNIxqhyA3WSniqeQOVW0UXZR6Qj30Ei
	rM1xxIIO7WmcrGzgeiruRsv6vPoTE75ToFyCrh6uqpdph5Gio2P1dsYaH0basjz+14pq
	WeP1PqqwjWhu+WRt3ER0fMfhHnMcE/VhFLwDFfybvSzwkUrMi0XbQxMD2G99iWKuEwan
	0oig==
X-Gm-Message-State: APjAAAVJnzHNEx8eRb5CFe2N9sMsVoAgvxuZURoPXlJVjfHA8b/HUPMK
	lOTwFhuwW+G2gIq7maYRdx78+d/jiMc=
X-Google-Smtp-Source: APXvYqyr5eJ/IJoBa3TjH19zhLITUlm8GXsyphpSYmLx5DUCEg3/INBUs5OcvlgoWf5BwrCs+huqfw==
X-Received: by 2002:a7b:caf2:: with SMTP id t18mr5819733wml.131.1580224607156; 
	Tue, 28 Jan 2020 07:16:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm25711302wrt.1.2020.01.28.07.16.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 07:16:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 15:16:41 +0000
Message-Id: <20200128151643.9711-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] texinfo/texinfo-dummy-native: Drop native path prefix
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
X-List-Received-Date: Tue, 28 Jan 2020 15:16:48 -0000
Content-Transfer-Encoding: 8bit

Now we have recipe specific sysroots we don't need this native path
prefix. It was breaking the crosssdk/cross-canadian cases and causing
bugs, removing it is the simplest solution.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/texinfo.bbclass                                  | 4 +---
 .../texinfo-dummy-native/texinfo-dummy-native.bb              | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/texinfo.bbclass b/meta/classes/texinfo.bbclass
index 6b0def0eac4..72091c733e5 100644
--- a/meta/classes/texinfo.bbclass
+++ b/meta/classes/texinfo.bbclass
@@ -10,9 +10,7 @@ TEXDEP = "texinfo-native"
 TEXDEP_class-native = "texinfo-dummy-native"
 TEXDEP_class-cross = "texinfo-dummy-native"
 DEPENDS_append = " ${TEXDEP}"
-PATH_prepend_class-native = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
-PATH_prepend_class-cross = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
 
 # libtool-cross doesn't inherit cross
 TEXDEP_pn-libtool-cross = "texinfo-dummy-native"
-PATH_prepend_pn-libtool-cross = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
+
diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
index 1254bc89b48..3e6dfb0f1b9 100644
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
@@ -9,8 +9,6 @@ SRC_URI = "file://template.py file://COPYING"
 
 S = "${WORKDIR}"
 
-NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-
 inherit native
 
 do_install_name() {
-- 
2.20.1


