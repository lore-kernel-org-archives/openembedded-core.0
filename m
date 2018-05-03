Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 74BCC749A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 15:38:51 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id m11-v6so14957631otf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jbBJKsMhsGxirJdQ6MvIqa4fKpD2KaKvGwQ+QkFnKqQ=;
	b=DY66FiWigUn+mtMWuLkmeWkxR3OIVahhPgLiYLiXgJPxKTE2O48kgT37iwTZmQxPN5
	BuCZG5SQNSm2lG59Z7yOwqPEROfIb/AQRZdyxvAnfwolrIQLWwSu5gJq4Trw505pRrQH
	OfOm/g8/FvPXYn34YybulUdPzOpg9IH0p1na4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jbBJKsMhsGxirJdQ6MvIqa4fKpD2KaKvGwQ+QkFnKqQ=;
	b=Vv4eo8VLLniNPJCq427y25er64ISKUUzSxAvdGz5qxwd4SgCF0kQGXWM/c3hUml8Xw
	UKVBqO8gFL2ie0DbD+KcIZaL+XZPlEvnFfmzH90fZAY2oUDT/kbP0oraSzkVbycX93YB
	Uq2r3MlcGaYvYYD2PdLjnrEK5v3LK0hhpSnw2SdkiBSBvSAwe7RrHj4kdoQAyv7zxzRY
	KS3F9davirLg0ktrv6oYVSS/Orslhw90xadGQckV/MPrtU/u2WdvwHoPvkAwCRbhSXkM
	4hdqdwUB+dsx67RVT9MnG0it8WH7tablFSm/eabD7hVcM5oqOc++lE+q0abIVghoydzV
	HkHA==
X-Gm-Message-State: ALQs6tDIqiL4i3j9QAPaSJIVJbOCUCV067mYHkeWjI+XLuJbQqsH2AGm
	jEalYk9fpMF5rLKa7iObC8uUD918d2g=
X-Google-Smtp-Source: AB8JxZr6aY5YNwAPGn9teKdtgqg6/VP8nOEYfPPOCQnC3orX0r5W2A/FJoyjyulGyucj5JrPBaOVOw==
X-Received: by 2002:a9d:5a85:: with SMTP id
	w5-v6mr11371297oth.337.1525361931939; 
	Thu, 03 May 2018 08:38:51 -0700 (PDT)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id
	n50-v6sm9273018otb.14.2018.05.03.08.38.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 08:38:51 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 10:38:42 -0500
Message-Id: <20180503153842.14382-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] recipes-support/ptest-runner: Upgrade to v2.2
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
X-List-Received-Date: Thu, 03 May 2018 15:38:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new version contains an option to exclude certain tests to
run, example:

$ ptest-runner -e "perl"

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../ptest-runner/{ptest-runner_2.1.1.bb => ptest-runner_2.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.1.1.bb => ptest-runner_2.2.bb} (89%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
similarity index 89%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
index e5b71c0f01..622d23ba91 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "16413d71cc06b02a6d859c35a017cc49b88283f7"
-PV = "2.1.1+git${SRCPV}"
+SRCREV = "49956f65bb53ea2a2c1b394e5e59ffdfcdcc490f"
+PV = "2.2+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.11.0


