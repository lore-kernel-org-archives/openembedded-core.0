Return-Path: <limon.anibal@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7137F787CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 15:38:21 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id w131so14265660oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 07:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VkC8aVLF4atmyxDScjEFFcxhEhXPkvuYnFIts9pu2Jo=;
	b=EdUxxbpyBxnYywT1iL6t5skeTC6xzNVGPxmZJe+6REJC7gwbTpwTl3uqxfWgnsDgiL
	nRagm23JdoZnxodtFGvHMCKe2viC19V02jYjVlN/Fw1TkL5L+U2ycifAwScTIggUc58O
	wE4WlS23AwUd9ctGEeN7HxtmwQ1nG30JihzR4G6AUek8zM01G/qmy2gIJymfwTMut4jq
	vh0hEeBTySjFYbHvDTSFUhHw6mWTxhiTQ4qCsmqHWF+82EYsF4iqLKcw7uDwLzB3iiRi
	OOOI8UaghSFRhc2EGZsGN7JS0SKLLCx1fiCN8Ftb0EmKViUeBqSL8zbPap48fFH8+dmA
	Vhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VkC8aVLF4atmyxDScjEFFcxhEhXPkvuYnFIts9pu2Jo=;
	b=p0LVTjJhKI9u9aaj6tY+LjxfDI0z/GIx3VV7hJFhXXcQJkDjX4X00dPh08Ao2HCs2s
	VhIcuI0lTxuCXtERdXJGT+KhD4iJquxiWgYfylLn3GhCtstv45hEe/VSaqCux0oGn5UD
	0Mk1BZLFyepe96MN4H2HVmU2IogJL6Lo2NCAgo4rjLnKudnt6BTLGOmdpHB7p8LplAca
	u/22/3LjmFk1Z/SWjb/s6tjRByxFIeWtJJc7zYzgRJ3ZA5icaAobaCQ9PPN+fMysay7U
	HxCNLGOhF2SAKKgVe3hwIEq1aC/wxLm5PSYOwDi2A3ezCJIaUQXD7mR7qVDahUozzDly
	mqjQ==
X-Gm-Message-State: AKGB3mKnJvnQ2W5RcAvZqbNgjyQJS1I9gtryKXJtkz9ZzxvY/NXlGTN3
	Kzk7gRafZQ3e5PRzd+5mergiPw==
X-Google-Smtp-Source: ACJfBou9nzio3o7YnbZ4G9vAcPUBkd46rl7bYgt9/CFDPORqC54nkY+HOgW6x+XCC9+/eUeHJg53Yw==
X-Received: by 10.202.114.22 with SMTP id p22mr3419079oic.327.1513093102019;
	Tue, 12 Dec 2017 07:38:22 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id
	u19sm8073737otu.41.2017.12.12.07.38.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 07:38:20 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:38:17 -0600
Message-Id: <20171212153817.23905-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] ptest-runner: Upgrade to 2.1.1
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
X-List-Received-Date: Tue, 12 Dec 2017 15:38:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

Contains fixes,

- timeout option missing the argument option ":" to getopt
- utils.c: Prefer monotonic clock to calculate elapsed time
- Add support to avoid load/run twice a run_ptest script

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../ptest-runner/{ptest-runner_2.1.bb => ptest-runner_2.1.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.1.bb => ptest-runner_2.1.1.bb} (89%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb
similarity index 89%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb
index 71c1dabee4..e5b71c0f01 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "8a93832dad621535e90aa8e1fb74ae5ba743fc3e"
-PV = "2.1+git${SRCPV}"
+SRCREV = "16413d71cc06b02a6d859c35a017cc49b88283f7"
+PV = "2.1.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.11.0


