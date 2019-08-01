Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id A0AB37F35A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 19:58:55 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id t28so70595185lje.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2019 12:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0KKmuBEieCkhsae8PyKuLbAC5wstvejJuO8GBE/2oiw=;
	b=UZUjKEUhRS2O6l94SW6ZozQoOFE+sPUJnIqjXl9n9eQINOMtvJK786W63h4lr5qkac
	sA8Zfz1Hn2TRLUrmo+AJoz3vaOvaiDrYQOF0qzoois5ht/XkXfWs02WL+8TUndWnjBZg
	eSQMUP+7M0bgkJHFHUnGMau1r9k2EzIMxCsFSgaft1DOQ6Pu5QVABdGjaDlk+fXyUAe1
	Tx4V2n+NIYUkUGKDU0AfNZcnuMdBQHr9O4wjsOhcJAuXGrYfoKxNdM3DWEl2m/ehwOIl
	rlc9nFrzHFNgqfVktIwbk85jNtmYWa6/l6ySdfBlViG+Ed/I5PKSPN16DHw8tCpxMbk0
	1K7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0KKmuBEieCkhsae8PyKuLbAC5wstvejJuO8GBE/2oiw=;
	b=Vmm/nsy9nqWwbgbf7VnxtXC0hIKnq2Z6KYfRq9zGC5HJWauXLNw12jiVCqUd0f939I
	LV7Rl9mdro5gspxH15ndh7qghP71kv0tRa0hNnxE51q5aVDfaq4rpnzeSvBBBVkxnmv8
	l6p7XVRLLXpejy/Aoy6Z9hf5X8axLLaOCUprfyLt+zNfu1aulfSZVEsM5FDFpTaCrNmr
	Oue/PTe8bZmEoFTfw2nsz5p45TbMoG3KR5aKRsbRV7qzh4LyCTIc+zvFabCe9xcWRWGl
	BuMRHKGFNe1zELG8GCtmFlAUtb0CqGJC8zOOTlXuBgh1W98dRjbkY3aMi+uBtWT1uRLS
	mVvA==
X-Gm-Message-State: APjAAAWh5FqxHVNkNI9GGojwWOwR0EKGplQ9UF/bsU+0mch26kwR3z8S
	qfFlK0vI96v9vf9ftpYCqiZQCP6R
X-Google-Smtp-Source: APXvYqyYU47sXmlM3hxBXTkLzbRfkMFEHJ8b8LGrF1vSyQzkyjzXref8eQAZOdDoO9KsYTCt2Z9NIg==
X-Received: by 2002:a2e:9188:: with SMTP id f8mr23758076ljg.33.1564689535867; 
	Thu, 01 Aug 2019 12:58:55 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	i9sm12526806lfl.10.2019.08.01.12.58.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 12:58:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2019 21:58:49 +0200
Message-Id: <20190801195849.2695-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-git: update to 2.1.13
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
X-List-Received-Date: Thu, 01 Aug 2019 19:58:57 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-git_2.1.12.bb => python3-git_2.1.13.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.1.12.bb => python3-git_2.1.13.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-git_2.1.12.bb b/meta/recipes-devtools/python/python3-git_2.1.13.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-git_2.1.12.bb
rename to meta/recipes-devtools/python/python3-git_2.1.13.bb
index 380371f783..fd6ba50df5 100644
--- a/meta/recipes-devtools/python/python3-git_2.1.12.bb
+++ b/meta/recipes-devtools/python/python3-git_2.1.13.bb
@@ -12,8 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "33bfbc89fe616ca22b6336be80d570f4"
-SRC_URI[sha256sum] = "7428f1cc5e72d53e65c3259d5cebc22fb2b07f973c49d95b3c3d26c64890a3c3"
+SRC_URI[md5sum] = "1ecc2d27123418e4c9e5602788c96855"
+SRC_URI[sha256sum] = "c15c55ff890cd3a6a8330059e80885410a328f645551b55a91d858bfb3eb2573"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.17.1


