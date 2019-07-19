Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id EC1937E3BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 21:25:57 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id s15so8850708wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DH5x5F2YsTCREhroLeIVkQN9wJE0Qtn04AmPhnFZWvU=;
	b=UmPcqeBnOm8oBIqHiOKrMiIkYDMjvu3tpaiKXaW2wRbwq5nAFc9KHjeSEyErhqPhCu
	8OLlmEmkduXxK9hTAbtNuSttgpjc4oTcazGRmupndEjFKWE+OT+lMZtBZSpHholSyKOB
	ojBbRuPVoCwgzL0awzKKsParS8byRJnLH4M4km83psBaoCuzjV3PpLhCLpKWhL8DNdb/
	wdsGfoPjn/WkP7mwBhddaGVkNds0dHVc9XJ34uRvK4iqRJ/W5cd5jmyZYTyiEASYxuWM
	jf78xOEFH8wyrdy18Q1RANpgrkxo76UqtYEO7W//lFoTAn7CFgMCOVEqSv+3lJEnFW1N
	xy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DH5x5F2YsTCREhroLeIVkQN9wJE0Qtn04AmPhnFZWvU=;
	b=SxkVKyEU72v9VVRwkipY1WiGh35/SBITNi1vXILAAL1h+QD4ZJdaAdBOGSBs4TpSBO
	X2oQkWauBwIJ+kbe1jKXiqqwDzWr9Ed12/T4Ey3Rbm6HYE0JyRU68rugZPCu9FDtFNe6
	fKV/in7c94BlSGwUqKiWeHHw6wEugHLAKmiSXx0vMWZveDAcL168YB2wbRnRVVxvRJ9i
	zAC8w5Pl3dmkOHbvdKddJgr7NhVWgrqK4tpiC4uPMMqcq3uikzrfoscOE8P/uG4pqYNl
	Slt2EOjihfj9d8stUo3ZhLlax9t1nOIDAbkCJGZC2X0rf5NcBs/gnLIN2JonMOJ1qmma
	ohHA==
X-Gm-Message-State: APjAAAUtz2QFDX5fzQwJxh7XM3RX2eqaN1ogKzkxKQGv933mFLsnJyXb
	Hbb2HsPEBEIc2XQO2hr0vzfqfCETcSo=
X-Google-Smtp-Source: APXvYqzOSswZ20MjAUT0h0KtuFX0f3y5LgPxRbxwz0SNnT1AQEii6XaSfyKhIZrut+9oi2XKRL2uAg==
X-Received: by 2002:a1c:2302:: with SMTP id j2mr48057750wmj.174.1563571558513; 
	Fri, 19 Jul 2019 14:25:58 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a84sm35473162wmf.29.2019.07.19.14.25.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 14:25:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 22:25:55 +0100
Message-Id: <20190719212555.25845-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] unfs3: set upstream tag regex to avoid false-positives
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
X-List-Received-Date: Fri, 19 Jul 2019 21:25:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/unfs3/unfs3_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 4b2cd5f2ce8..a4ac46c68e5 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https \
            file://0001-attr-fix-utime-for-symlink.patch \
           "
 SRCREV = "c12a5c69a8d59be6916cbd0e0f41c159f1962425"
+UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>.+)"
 
 PV = "0.9.22+${SRCPV}"
 
-- 
2.20.1


