Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id E32C179CAC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 18:35:44 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id s5so7565939oth.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 10:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l+J0es+lIOwneqeJenwcvQwbuTS1+Baaxa4n7YB0pRA=;
	b=YvZ1IxkSyM2SXhXXFLrLRh0/GxwckQCHoKMG35ao0jh5xfoVDDcr6oiUam8gzB1KQS
	GwEdes8rwomx6e7YgwvapyQt3OFI2XcYbwJZydD9IfYj3DXt8esjSu0QgW3JT2KA8LX7
	fQ5gnf5K4FvaA1jgufb5jhgyASXvOkQYEAJk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l+J0es+lIOwneqeJenwcvQwbuTS1+Baaxa4n7YB0pRA=;
	b=dRTQzmRnaX3mSR1aGVb81f8MVb8WofYcpqoGndLH+efn0UuIwSdIiN3wS+yS42aBR6
	Lga3YxwGh37weyfTGYhtWufbAByIjV0iJ978lStSwEc88JHZXYvGAXn6W6kzKrQUjFzj
	k0rpC4TZHa7yAZYQKalZNIkaJ30HQzLA1PHe2z5QgfM/GPvP2zhgN/Ree55OzKgjjYH+
	OUdylN7fa8pcpf/lXZNRZ8SacXZjVBoSvKyRQJgB4Ag04mZ9Bhj/efQHgkiFCyBAflTc
	yX/xUcn64BUNIDQxX3QDtcCR6UBe/qyMUgVlWzqfxTJZ5ldUXdFmmVe1bRdXdtpRcTq5
	+rJg==
X-Gm-Message-State: AJcUukcGCf7X/ThU2QX94Y4jtFf/z5zqzB22vrxlcQCHfMZAxk0Bx5sC
	DapRKDZo125IsswuasG5iQlGbFQn934=
X-Google-Smtp-Source: ALg8bN6+jRsZU4MSoI+odJxJBB8X3HlvYekeqghaA7NRIP/sg09q3nCVF5XObCG44IW+E4XUEXqOqA==
X-Received: by 2002:a9d:6c3:: with SMTP id 61mr5097155otx.314.1547058945590;
	Wed, 09 Jan 2019 10:35:45 -0800 (PST)
Received: from blackbox.Home ([200.68.141.36])
	by smtp.gmail.com with ESMTPSA id
	30sm34126384ots.52.2019.01.09.10.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Jan 2019 10:35:45 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 12:35:41 -0600
Message-Id: <20190109183541.3758-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] ptest-runner: Upgrade to 2.3
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
X-List-Received-Date: Wed, 09 Jan 2019 18:35:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Addes support to report timeout in XML file and duration in
stdout and XML file.

See,

http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/commit/?id=a16f2c137b
http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/commit/?id=8071258373

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../ptest-runner/{ptest-runner_2.2.bb => ptest-runner_2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.2.bb => ptest-runner_2.3.bb} (89%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
similarity index 89%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
index 622d23ba91..26add9b0a0 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "49956f65bb53ea2a2c1b394e5e59ffdfcdcc490f"
-PV = "2.2+git${SRCPV}"
+SRCREV = "80712583732b4a809532f644fb09e7d2e812d7ba"
+PV = "2.3+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.20.1


