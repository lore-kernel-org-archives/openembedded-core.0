Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 703297C076
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r10so16535921wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wXZ3oYzXbeYAUKDg2PDbBAHF29WeMbWrFXaApUAkVEA=;
	b=vNmv6YLp7l2CxQof0j73K48orf43pmUQs+z1wTMvjRG/9Qn7pozXRoYDUaEJ5WmM6s
	7/k3Y6teit6ehsjwsOEE0VEwCRfric1XyQwvzmyDmeRB1uwQvApDWCA+l1XhTVzzd2wN
	eIhKUZp6f0rhKo2X7rT0EunYp3RpHHX8hEtgO5PJFa4oTiqfQmwgW/V1se0wtOBPqkEX
	B0GVCmZp8HQ+29osd+yFeF5vTvOWZpJ9NFDPI8H888joMExJ3YfEu8eI/L8+dsYvRIJ2
	sSkNOJGoI+6U5QQREDqQD0BHkUTgoAjJr5owfBypZ0TbNeVP2yeFZIaotzuowVPb80lD
	gNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wXZ3oYzXbeYAUKDg2PDbBAHF29WeMbWrFXaApUAkVEA=;
	b=nBmqGeTc5Hi9SGlls/BkI9vuGMu+TX3BC9kuKukH6xdrBxhOMU2JtWaNKRxhs5Dlw5
	/9k7ONi7UsM2ZxFOFgO0yDRPtyV0KKmb5BY4gvao0tJ6SY7ln5dmlh0ovYoK4Ax/MSzP
	31pLsSSRrZVa5YCZDj/V6v3OzsnK10uL/rJRQFfx8LzoUyTbKyfjWQrij7z5wjMKVps9
	W11FhwbNhw0mpugkMGUuRXjQlZAubsKEARIgvk7cb2KN9bVNwnUfUwcFIa7Cum03agTn
	5A3Dbton4ayCQA8S4X+buBjHZjk741bv9oEKCqPm0R/JiTWzMq0F9fqYHz0Y97qKd4Mi
	epTg==
X-Gm-Message-State: AA+aEWa4S9aLqEYe34VsZN6oX1Tf/eEMbyzMERonzc/C04oV4lF4r6Qg
	xAy0LlHpJh4VDOsdxZPC/u2IFC8H
X-Google-Smtp-Source: AFSGD/WLhoDjj72xjRR8jFH2w4lr9xjqKm5GhV8Tx19VivlqBuTdCMxLlo7HMAPCLpSWQNt1ha7dLA==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr14403159wrq.108.1545150624935;
	Tue, 18 Dec 2018 08:30:24 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:30:03 +0100
Message-Id: <20181218163005.1330-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/13] libcomps: upgrade 0.1.8 -> 0.1.9
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:25 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libcomps/libcomps_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index a0b6767b3df..500d412340f 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -9,8 +9,8 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.8+git${SRCPV}"
-SRCREV = "01a4759894cccff64d2561614a58281adf5ce859"
+PV = "0.1.9"
+SRCREV = "58be208122179ca6e4edc0635a26f02bf733d6a9"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


