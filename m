Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA4E67313D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 18:13:27 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 1so7315306pgz.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 10:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BMEPdUkdYJ8sG2btzh6WEwal81ne3Gvkd61DQZGvIjQ=;
	b=Ycq2ahE90RS3PjtKuNxQQagYtmCHUbvzsYn27MdaBDJyCvesNGcTV9M7pBvyv5BNs7
	7dUo+ITTHUJQgSt7keTNQdHwey8QW9QOukSalQUvTs0Dnccr0sjynwbBuZP5YMXX8aDx
	ObCPoQKTvRfgzQAHG+VN+jVTO4SVZckEtaEDktvLPYEe9A5HSmacZXc68BnRQMF6sTmT
	V49UJ6Ez94rIm9QUtx91xD+SKcjV4odnCfsIwLMA/Ao0dSriEsoUW9aZPludwEfXjM8W
	3dTRRHyUe5HfS3xgHko0s9nJPN3p0xVbOnVhc/cHvqmlWBCdkNZIvCcHZjoLyn1eA9dv
	NOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BMEPdUkdYJ8sG2btzh6WEwal81ne3Gvkd61DQZGvIjQ=;
	b=We1ZkQJTYkL/7FgZLP0fdWJoHuSCPyt/KVSSh5WS0f5VEohgy6SnQUqpbb1mhMMUpM
	XcFmKlKaDTHubEerNH81PqdZtGRHSDx3neBE/ZgbzqMdvx+UIzYt384mPar+uFl8PeIN
	7Q58MetxVzFiz/zmPkKKd0NY4PEODQy6wwhknjohfe5pIYBUOfFInV+UPFI9lqxmKSsz
	br1TeTAty+w3EG1BKK9j4Ha1pXkaSkLV8MicXDh99Quf4LEgKL1TbSns0hlMolH/5CSf
	fWrnGz1WgFH8070EEicy/r0yNkDAy4LqsIcwQKY9DKZLroHEXOY0tY0GVnetikmE14si
	xPtg==
X-Gm-Message-State: AMke39no50jhaDhxzOsZtt5lT/9KDd+VzIF2kRb4zHRI7CG5kUdCH1CXT1d2/cea+Jo3Ew==
X-Received: by 10.84.231.200 with SMTP id g8mr12764198pln.100.1488046408870;
	Sat, 25 Feb 2017 10:13:28 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y5sm21851692pgy.28.2017.02.25.10.13.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Feb 2017 10:13:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2017 10:13:14 -0800
Message-Id: <dac6679c71b845d4adeb7b1c7c75f0af32fe0435.1488046239.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1488046239.git.raj.khem@gmail.com>
References: <cover.1488046239.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] go: Use CC for CC_FOR_TARGET and CXX for CXX_FOR_TARGET
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
X-List-Received-Date: Sat, 25 Feb 2017 18:13:28 -0000

Helps building with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 2449936dab..754fa34c1b 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -13,8 +13,8 @@ export GOARM = "${TARGET_GOARM}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+export CC_FOR_TARGET = "${CC}"
+export CXX_FOR_TARGET = "${CXX}"
 
 do_configure[noexec] = "1"
 
-- 
2.11.1


