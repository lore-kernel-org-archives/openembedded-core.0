Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 85A6C77BC0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:34:07 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d193so467172pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yL99Jzq+/VKtl0QtmeuAqFF1i9YrHpexIx6rpKAcePg=;
	b=QDPCaYkSZruXJ3JbnY9VBcBtbFth6aTVjbwEo5hmwKd4z1hGfoLPcApaYKnUz1Bwdn
	KjE8fdsi/sEsoUiSgq+VHHBc8n8EV2R1H1aZN/tZzl8uZfcftGuOVVHtIjbNpcZRLPdn
	i9jILxaYfQMwY1jc3qDvI1hIK9dkW4rwiwa6Iq26Wqs5YgEvRYwnuUmT/OkJD4vS7gvE
	DVkuSGQV6CePv2c1TK4anKEfO4Z6W/HoZqK4JtU+in3YihyPcm5E3nqqYw9lY+k/E0T3
	1Q3NsdVZ9Cz1FQOfLbs4pnjUngUDbRVcWKM7knAP5HyOYKFEE1qD9yqPvBwuo5jXGVp9
	HUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yL99Jzq+/VKtl0QtmeuAqFF1i9YrHpexIx6rpKAcePg=;
	b=PPbSw8nBbgdmExLttjIerQ4sg6w6BM/f4422NA4X59QLG0AqHomo7hqJI740bobWAT
	EnjeZceulu5yLEL7SG6YfonxXBouVdg8MWWbomTukD6hhDW8n4WX2+u4FXzZZ3awpyqe
	F3DpNJE9ebZR9ZBRWzWyTYnCvniQl9r1wTmbivygezCTDQCau6JmGLDxzVyeH4O+0MDi
	Z5bMfGZ7x+bmmc3aDMVf4WQTRpjfyUeI/7WPghcBdIxlMk3KhkOQogHgu2hQwyzgVJ19
	o7nDEprInauGCLBlGJEHb+8PlMpZ/3kEpXJHSU0vJAp4yBAP6ZIQsu0XObGcDYjhUh3d
	kOlw==
X-Gm-Message-State: AIVw110WY/3k7ahetQHNoTT1KxbNFSS95dlKRhuqyN3/iZgw0wwMvvVx
	B2nsuKCr+lYi94dy
X-Received: by 10.101.88.67 with SMTP id s3mr26325233pgr.224.1499351648610;
	Thu, 06 Jul 2017 07:34:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.34.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:34:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:23 -0700
Message-Id: <3107cc24993f111ff2d5714213bd85ff15173221.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 22/22] testimage: Use the renamed buildlzip
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
X-List-Received-Date: Thu, 06 Jul 2017 14:34:07 -0000

buildiptables has been replaced with buildlzip

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/testimage.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6fa2d6fd9f..0c4a84e111 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -49,10 +49,10 @@ DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildiptables buildgalculator \
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
     connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildiptables buildgalculator \
+DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
     connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
@@ -61,7 +61,7 @@ DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
 
 # qemumips is quite slow and has reached the timeout limit several times on the YP build cluster,
 # mitigate this by removing build tests for qemumips machines.
-MIPSREMOVE ??= "buildcpio buildiptables buildgalculator"
+MIPSREMOVE ??= "buildcpio buildlzip buildgalculator"
 DEFAULT_TEST_SUITES_remove_qemumips = "${MIPSREMOVE}"
 DEFAULT_TEST_SUITES_remove_qemumips64 = "${MIPSREMOVE}"
 
-- 
2.13.2


