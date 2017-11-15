Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 08E2078519
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:43:53 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f8so31480912qta.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hYL+6B4ERFMltBW7AxQ/S5XUt38vR6NQlAHMWeHqCi4=;
	b=TLbFxLIyzya+lvxkO3UzFHTp5vlZFALZgTRWbwnKg54KuIHInQ+rTU+4BcbHu70LIF
	mPVEYkqsrpgWjAiHMAkLqZk0LpGOK5O6Zrzn0ImCp2RmlpB2anHbsh6nU6D6kWjwLgzZ
	knLFapBPTdVzyOE/axfGSfwxWcL2K/4lcGLzh/smdqvMoms80TBk8LgN2owazV/4MME6
	9geLqHYIC50KsC4MsrceyGwMy8DctmebRhP7pD0Vqq8t44NWbD/L6u2c7cnkhK3tbLs0
	vgyFDuuBrh8xNBecYux0NAyyYjCJcdY6J5qKDB2t2lRtCT3n3GFpVwq6J8j8blFOU2Qg
	OHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hYL+6B4ERFMltBW7AxQ/S5XUt38vR6NQlAHMWeHqCi4=;
	b=j+tFk5TUL6MAqbwEUihrhwQKb9QqiD/z4Egeg5A6rZKl2VEEODK+4JDihU1nDmJ4lG
	IKKIqkBMKJ+B+nLKgfzuzk78DWBwGW+Hz+FmX1fOIXHjV0h5H7HOqX+9ahPtawCcNi3t
	6x/n/Tk6AzxKMbZmBh/28B8KId4ii2rWwipE60x4C6Fan6e5qlrfYZcoaOjEYOwWcBVa
	fG/xKDejUcBpIoPe7oKj38fh7a3TfiUdKFVfERMCdxMfri6hqkRfpcntNSUIADZ3Rl80
	wPkwnyOyLY8A6EIOEpSrd1t7EEGlHpfr6gIXw+GhgPpDCD4B0JfAcDaz6gUtEATbmGiC
	udHQ==
X-Gm-Message-State: AJaThX5+0g19vC3HxTVSR+RSJzqXJJy5sO/4hd6MiVDlKgMnVk5t948j
	+dQS0J4cAYvRb6oXZF/nmFVzQw==
X-Google-Smtp-Source: AGs4zMa0wQ0cM1Oqkrd22wMDfYhbIK7V1HQIChaJtvzt1tQGnA7JSsvRhRPkgnoGGjgNodXCNpum0Q==
X-Received: by 10.200.35.173 with SMTP id q42mr9188852qtq.199.1510717434195;
	Tue, 14 Nov 2017 19:43:54 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	z75sm13407762qkb.30.2017.11.14.19.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:43:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:43:42 -0800
Message-Id: <20171115034342.42901-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171115034342.42901-1-raj.khem@gmail.com>
References: <20171115034342.42901-1-raj.khem@gmail.com>
Subject: [PATCH V2 6/8] musl: Disable thumb1 ISA
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
X-List-Received-Date: Wed, 15 Nov 2017 03:43:53 -0000

From: Andrea Adami <andrea.adami@gmail.com>

thumb1 is unsupported see http://www.openwall.com/lists/musl/2017/10/20/10

Fix
[YOCTO #12336]

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V2: Add author attribution

 meta/recipes-core/musl/musl.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 56c9d7fe17..9af1172ae0 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -26,3 +26,8 @@ INSANE_SKIP_${PN} = "dev-so"
 # Doesn't compile in MIPS16e mode due to use of hand-written
 # assembly
 MIPS_INSTRUCTION_SET = "mips"
+
+# thumb1 is unsupported
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+
-- 
2.15.0


