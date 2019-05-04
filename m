Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 939A27DD90
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:28:03 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k19so4226628pgh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wNo3laWSh8hzUVAyu+qJ7ckHORgOlEiq9AJGXUmRnXo=;
	b=u4ojD2gA33aR4spRzrmRMUJrvVGfiPdngoPMRWRgXw8rj71Ez2MvzpcMlQKIQaIqXu
	aLVPDOOxv2hU0dVnA/hehRhx2p/If0CLNbWAuOW+CG3D5VtnrAFnAP55h48SyE8SNZ5p
	VOAnLMPsWEM+pwD0B6k39jKQIMBkSt8pSOoHiS8yKWZXt0M4WfIe0Ip5okZ1MSH5yoHv
	sB+5t9cc6Z+w0DTCV0xU4wobUg/KFgmYS87RmwDGcC17jC2eZvPLwQtkMBWPOgWzJSU/
	biP3f98Z0rQIePC3ZGhvoXW0y/8PdkPRf4m+ZaWUuuHmGYRmcC/1SbZylpb37ejAHc2o
	sjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wNo3laWSh8hzUVAyu+qJ7ckHORgOlEiq9AJGXUmRnXo=;
	b=tYhdw2PT4D/EoDOUGU04dNZ8fkN3OT2RGS63Z4fPAhTnXbbujBaXNeAHjXUn2LHDQT
	iYmwADGSzvhp8DN4oyRuMgZ7yG6mmPgWtDeip3Xb/Mx9IFvf7DqraWGz4+NfVCrxU787
	4MBtPWaLhXzb47I/phJUZ7IE4spwNiw5yIyBnIloFJ+Yi6l4/FM6JJDIXyq6YQPvyo1t
	WVkAhFB8WxbGT9y8mymL6NltMfKVieFhzzDPTzlMb2NxuNhuQEAhRa7AJ/ZgBobvYS/N
	kNQPbpsW54alIh7wlFQeGsVWAaUJCEgAIzz1vsf9cN589H65iawkfAGuDDTvCFbZ5Fu9
	lLAQ==
X-Gm-Message-State: APjAAAUoGInau57UrzIatVgBCkLVaJ6Gn2j2vpZdBVvkM3Je0kEpgxOd
	ipFHDaDnMWnhEtkV76+zRYE5fWw+
X-Google-Smtp-Source: APXvYqwL5FBHr/0gWTWbl57H3I9Y27OdnzuCS25/SzAkGwxNsUj9AZACaqvHlhmIeJ1orEsdfA6rSQ==
X-Received: by 2002:a65:6659:: with SMTP id z25mr19039214pgv.10.1556983684683; 
	Sat, 04 May 2019 08:28:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.28.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:28:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:15 -0700
Message-Id: <3364b4160854f69a67bfd78a9a3c985c59251025.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 39/43] dropbear: set CVE_PRODUCT
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
X-List-Received-Date: Sat, 04 May 2019 15:28:03 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 3fbdb5e..2537603 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -34,6 +34,8 @@ RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS
 
 inherit autotools update-rc.d systemd
 
+CVE_PRODUCT = "dropbear_ssh"
+
 INITSCRIPT_NAME = "dropbear"
 INITSCRIPT_PARAMS = "defaults 10"
 
-- 
2.7.4


