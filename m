Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id BDB8676EBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 01:04:24 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b5-v6so1667398plr.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 18:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6WkxXyo4W9ZryHu9yxPsQ/SF5AZHS07ZM10drKt0ulM=;
	b=e/xNNcTy78uY6u32r0po5WkJGHgAsxAIMIqmrYomizq2WIR5oD6+9EbdBWL/Su6Vn5
	H6VAOIKXZAVwTKJyTWhN2CUo8mkTxbzh+X93pvucmB0s/owz1xKTAlPF4qz4U/8exIKu
	LP2D9nNECRYBZvYG/fXQeltJSAV8J2feiMr/kRzVr7FydlP12oyAlT4y/zLsEu5ehkPO
	/1WbaugJGz+dTXh3gbDht7wVxsA/TIHfeYx5BSTt7mzcqZivmvHt5hucw4IgY0eTobuy
	12cm3KqtsxZK7nDEqb6XLjzsGCAjbRPmK7hSY7AoMbpvnHqzVhd8W06x42hOMuTDigZr
	IrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6WkxXyo4W9ZryHu9yxPsQ/SF5AZHS07ZM10drKt0ulM=;
	b=b6sXSlv1zHmL7UkhVt6S6q7gXEfD+ExFjZJLkOMV6XWoagYG/VDbQqTtMuiMuole0p
	ipLThlooB68tGMGRAXhFDdQcIv83Zu+QhhNxRPau75GqDu1Q6nBhdBy3IySoYCOOVcoW
	fTxw9Mk9ADI38b8z/xODCo+rIxVQXgTrOrfvH2a0pN6dyERlKjup4FRBj753s9eiN7B/
	FzYRAXkufTzm5JqRkMIGEh+JeaFTiCHG7/pwXKL5BbEzQSKkrNuH5pstBcTM8k+1RyLD
	XF0ZZTXfHOmIk/FYMRrn1ms+BNGQj6DLMn2Jvw+PSWcQSMCmYp6OrLn1xcp7imjkFmnh
	dRZw==
X-Gm-Message-State: ABuFfojKsFrF6BaTnNYw2RCByCh28sJekiL/QiTXDsAlP/eV+Uh2tRVI
	ym2C2hZb7DjTvC5dKPG7AtssmtAK
X-Google-Smtp-Source: ACcGV62J4mQAnP6+SATrbLI7c2VGrCYNW8ALF1T3w4p+AtT/OMbxNLbrqXZengioUtVeOOoRkiyc9g==
X-Received: by 2002:a17:902:32a2:: with SMTP id
	z31-v6mr31150652plb.308.1539133465635; 
	Tue, 09 Oct 2018 18:04:25 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	p13-v6sm39947387pfd.65.2018.10.09.18.04.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Oct 2018 18:04:25 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 18:04:18 -0700
Message-Id: <1539133458-25059-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libxml2: move xmlcatalog and xmllint back into libxml2-utils
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
X-List-Received-Date: Wed, 10 Oct 2018 01:04:24 -0000

Packaging of libxml2-utils has been broken since 2011:

  http://git.openembedded.org/openembedded-core/commit/?id=76052861cc95fd4ad4c4b9eb6ce4cd1065ad4dc9

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/libxml/libxml2_2.9.8.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index f01cb2c..d35f608 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -67,12 +67,13 @@ python populate_packages_prepend () {
         d.setVar('PKG_libxml2', '${MLPREFIX}libxml2')
 }
 
-PACKAGES += "${PN}-utils ${PN}-python"
+PACKAGE_BEFORE_PN += "${PN}-utils"
+PACKAGES += "${PN}-python"
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES_${PN}-dev += "${libdir}/xml2Conf.sh ${libdir}/cmake/*"
-FILES_${PN}-utils += "${bindir}/*"
-FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-utils = "${bindir}/*"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 
 do_configure_prepend () {
 	# executables take longer to package: these should not be executable
-- 
1.9.1


