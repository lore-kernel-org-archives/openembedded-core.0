Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9E27D123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:09:34 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id j89so14539502ljb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fUexvMKef40ln8xPjpK1p7wc6lxm2vElCgaz8FSeut4=;
	b=mf1/DDFwafHTXrag9T4ROh6yUIcZRDBfFSff39iAw5Gr/zl81ZLDchVqeKfXPuh7Mo
	36NEcuVWZppPtwM5K5ZUlH0QxX/hkTYQo+81mmlTSkE5JDsAGq9iqXC80qa7pnElNAr2
	okuWDJrYrG6gpN2vc3a9dq3YgIC0jFj6bqGeMaO16SFMNM0zhIajEihNg9dEyLkY434i
	jaD58oQwHZzpqpZUYAZ+b/izE/qeNGaKHaPi4orMlvmKUomoShdC8ZXIgRcQ3VXFZrBJ
	Lfw1sW+rtrwD/dMbUu3qs8vSdUkeSbmGb+W+JoANrth1CFj6FuOA2CF6KbggrC4sxKdR
	jGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fUexvMKef40ln8xPjpK1p7wc6lxm2vElCgaz8FSeut4=;
	b=B7CZakRR8HB/0mLJhmD6vJi0oiSHYN/JqxXXtAqPWIGRoUsAh1ihrUT/gQkZNp7YVc
	fdmFQTy+iBBXQS/WlGMoSDN3BO9dpk6FozvnQkqibn3lE5D2OpvrZSouhDqwiJgH8M3G
	n/A7z4nONb+51/l/ArGefKbujEQSi4ngWk2AhuYfQMGNjfVlLgy1MOPNVL2VJtophOAU
	BXonRcctt6gkrNKloh7sgpd3Us2LkuZ+mlHRLE+T+7ukqMdWoUn/l5fnkmxOwX9ndigc
	UQ3eU0htOiTMoXAQqjF4mDuRJsN7v+SD139tx//9eo2EKMVTq5FnGOBFV0GEzuouCbGa
	P/Qw==
X-Gm-Message-State: APjAAAWCrWeqzdLy2q84cc2qFchort2IS20A4b36UvFd83Ldv2omER8Z
	CI9qUiB2pfJ8JPggBcfbwAJDlnY7
X-Google-Smtp-Source: APXvYqxainl5yaMIlmtqf8fpvR1EeL8dBmqKbX7g/Jhr1Qu/9+KXOUMEFaJh8D9s5I+HRhBiqYItgQ==
X-Received: by 2002:a2e:8156:: with SMTP id t22mr10615173ljg.77.1553695774860; 
	Wed, 27 Mar 2019 07:09:34 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 1sm4704382ljw.56.2019.03.27.07.09.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:09:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 15:09:21 +0100
Message-Id: <20190327140922.109867-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327140922.109867-1-alex.kanavin@gmail.com>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/8] llvm: update from 8.0.0rc2 to 8.0.0 final release
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
X-List-Received-Date: Wed, 27 Mar 2019 14:09:34 -0000

Also, update PV to match the version scheme used by upstream
to tag releases (e.g. major.minor.patch).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index d2ea927651d..d1832e03f71 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,18 +19,14 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-# SRCREV is set to the revision of 8.0.0-rc2 tag, while latest release
-# tag is 7.0.1 as of Feb 18 2019, hence the need for UPSTREAM_CHECK_UNKNOWN
-# Remove the UPSTREAM_VERSION_UNKNOWN line once 8.0.0 final is tagged
-UPSTREAM_VERSION_UNKNOWN = "1"
-SRCREV = "98ebe7460199b9cd79eb562b5e8705ad28f5513f"
+SRCREV = "d2298e74235598f15594fe2c99bbac870a507c59"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
 MAJOR_VERSION = "8"
 MINOR_VERSION = "0"
 PATCH_VERSION = "0"
 SOLIBVER = "1"
-PV = "${MAJOR_VERSION}.${MINOR_VERSION}"
+PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
-- 
2.17.1


