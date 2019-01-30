Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7B18E6C0F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 17:20:09 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id t5so305042otk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IPteCFDRkHHJJn7wMcCXUyUl1zkXOJxkjrLseGPQG0k=;
	b=fWT9d4tSEWeZQ/XtPM0JUqgYQ2hlFyKwaTYno1nBMQq5zi6UqsasubtlSrANeiF0qV
	A/DzN5Y/s3W9SiZHHMv3yNlMFg/ZwgJidHji/ZlxrYbLulVYZjDspTC6A49Xxz3DwZDS
	xLZmrUrdathc6IeYU6BQIKkrWDD9OnZLESBBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IPteCFDRkHHJJn7wMcCXUyUl1zkXOJxkjrLseGPQG0k=;
	b=DUu7xe2sEcMGhQnbtUuz8b4Eq87HylGnc0O+KHYqbJVnMYjj4QpYEMJDo+Fu0ruFGk
	fOdffP8qRI1sD6r/7aorTjGC5Qh54p+2VgF0xZZvvrJVqT+iUQxa6W+5dvylHu40Enki
	sS1EzY16crVO3TCTA08DuDSFn30DwvCIVVRuAwZta1kmxucCODY5hfxkZjM72/7aQ4h4
	j2oCflXKigDAhAeBNr6PQFBGv+oe/NzSqishLvw2hiGwuf9UDBfSCUrBIJF5rSUG/8w1
	/Vtirj04t2nsUoK7jjm7T0FMY7x7Fi1wyyeKfHIXGBfZ0WsDZMKdczMJL+vZ5JrMp5Ao
	T1Kg==
X-Gm-Message-State: AJcUukcRsTB8QQkxAThF1jA8DKErtt/gzpOYPMH4K/eYBW4Da/hs6Jfq
	tLm/nh0tz5/QnozVh2pTQT2cJiB4Kyw=
X-Google-Smtp-Source: ALg8bN7+05DfQ5c2HOgXkz7Dv3BMSTU2sNyxSy/svIAdD89qtqP/rSeGZTqgFvBCnaEvTD39b0aBXg==
X-Received: by 2002:a9d:638f:: with SMTP id w15mr22235459otk.230.1548868810338;
	Wed, 30 Jan 2019 09:20:10 -0800 (PST)
Received: from blackbox.Home ([200.68.141.9])
	by smtp.gmail.com with ESMTPSA id v20sm743950otp.10.2019.01.30.09.20.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:20:09 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:20:06 -0600
Message-Id: <20190130172006.6534-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][thud] ptest-runner: Upgrade to 2.3.1
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
X-List-Received-Date: Wed, 30 Jan 2019 17:20:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changeset,

05b112b utils.c: Print DURATION after ERROR
acb5efb utils.c: run_child redirect stderr to stdout
e1062f7 ptest-runner: make DEFAULT_DIRECTORY be able to be defined when compiling
8071258 ptest-runner: Add support to report duration of each ptest
a16f2c1 ptest-runner: Add support timeout failure type to XML result file

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../{ptest-runner_2.2.bb => ptest-runner_2.3.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.2.bb => ptest-runner_2.3.1.bb} (89%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
similarity index 89%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index 622d23ba91..056a0c58d8 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "49956f65bb53ea2a2c1b394e5e59ffdfcdcc490f"
-PV = "2.2+git${SRCPV}"
+SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
+PV = "2.3.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.20.1


