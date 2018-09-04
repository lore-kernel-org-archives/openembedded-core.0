Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id A2AED78D56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 14:42:50 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id l5so3455992edw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WbYO9/rrT3lQm6llc5iZsOAyGASoogyY6GkbsNkPFkA=;
	b=cTmTCgkgT52aHRe4+zWOVU5oGH5MnhmSEpgsefQ6hgTBzsF1o9cbk4trLkdcmhQK+4
	G1hK118IK/mDZPNxrHm0n8se1hBx9DLMdQYh/nPQOBfbOM8NWde1uo2dNGfpuvdrgNHa
	ce3lMqomDnYt1Te66L8yPbeRnOh6MIdNIWk+TACD7G4b6rxCQEPm25EomSzjx2TPgfDc
	iApusFLcKTG2Pr06axgWzaa3IoHCjJDaMUyo4x1/6V6Du5gnX9gyZcyORK/jAutpNIYe
	4tLjcsZeedSwXPH3JG4mzQWUFPr6U/K3GUQTyeoAjFO2aclHHA2PZu6VjeS3Hk+XALIb
	jAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WbYO9/rrT3lQm6llc5iZsOAyGASoogyY6GkbsNkPFkA=;
	b=YyBwbL0gfWA/5+wwpW7H4Jc7vU65owGFjv7CdlCz7LB3PWoRIUm9av0jYZ4Ja17rAn
	DkvOuT2k+5K8fjXVZrGLvLzZOJPqs/5SW2Zq2ZWb5wJ+Ag2N2X0FnBsV4ZEOUcWW0eq/
	Tolj6dvk9iVpEh+yxNtnxQW6rpjyExdHUl40ei17jSfKape606KXTMhThy/B05L5o/0Z
	tQOw4Ou+stWkEYn2cJh8IzOgXf1X6w2D51Ngj9EisP/x+0i8M7EFwFOAt7hyp+3b/Shg
	nVRu7yULEdxQ+pdfIpHm043xt/SNJEIJXX6KwzpQnX3vT5wA0XNae/pjf36wSIACA06T
	Xu0g==
X-Gm-Message-State: APzg51AetLnzpiAquWk3REyuh9ngZ8H7xUY1GwVX94KA2Oq9UB+soN8G
	m2elLuxfEdaCRo1FQRJ/jpwomOba
X-Google-Smtp-Source: ANB0Vda1SzLHAaCgzI7q/PdpmanzO5reG/p7eEDnLJaJwpKiR4VTWzc/n7HBl7cAruA6CnMxII+Vag==
X-Received: by 2002:a50:e185:: with SMTP id
	k5-v6mr31090996edl.195.1536072171182; 
	Tue, 04 Sep 2018 07:42:51 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	a11-v6sm8769426edn.95.2018.09.04.07.42.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Sep 2018 07:42:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2018 16:42:45 +0200
Message-Id: <1536072165-24922-1-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] openssl: rename PV to 1.1.1~pre9 to avoid future versions from going backwards
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
X-List-Received-Date: Tue, 04 Sep 2018 14:42:50 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
index 7fcb9c2..7122cfc 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
@@ -10,7 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
 DEPENDS = "hostperl-runtime-native"
 
-SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
+# This short sort lower than 1.1.1 final, to avoid package version going downwards issue
+PV = "1.1.1~pre9"
+S = "${WORKDIR}/openssl-1.1.1-pre9"
+
+SRC_URI = "http://www.openssl.org/source/openssl-1.1.1-pre9.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            "
-- 
2.7.4


