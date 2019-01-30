Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	by mail.openembedded.org (Postfix) with ESMTP id E795E7C22E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 17:22:54 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id w13so254181oiw.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6HZ+NSH9uMicwdycR+opktKqSkda8wWbB7NRZnLts3Q=;
	b=B/GmNu3T2c18T9qz7zZWuIOOjpn7S0tKZtugJHcvZpGgvPji1RcZDFOSFlUxpt2wqK
	BbhmDS40YRzP9VhTkaTankPGHNsbE/RsEGIlAc6LR98yflVH9g/oGlxUcuBUjiWvCf0r
	HImxW76dwEA9+3AlPn589VQOziz6SjEDeFgtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6HZ+NSH9uMicwdycR+opktKqSkda8wWbB7NRZnLts3Q=;
	b=G/VR0iPs7L0E/MmNAjHaYQTz+v78McCtFGms3jatWbYFANsuxy6XEvsoH1UE3TMW8E
	RfykCUobcOw6aYpqrE+uMLrbYdbyYZEzgcXvQyfDnL9quVeP5icchO0yGQXbsVJhn2DP
	vHxafvxbfFpDvhcPEazIuPDGrAXMxd+npEpR25hdcpNFvTWP6M3hynFSWehxpY9sOiCO
	9c3DvUwYajz4Qm7iJf3NL7v2l5eHfvWdsbdYyVnX8zeEs7UUkblqkNiGjEIsBefSgyBy
	bfHs0EDykCHecdxWVHMDPfm37TJYz1ZeAihToZ/jXJUvg1l5D4VGzQ6k6L9NKuRhBtLh
	5BDw==
X-Gm-Message-State: AHQUAuaXn+9LW0TQnZz75DbcqSsmPo00zzfQ185hrCPrxFykRnYGBPno
	Fd+sMvfZf9YtghHwMhAdAnqwLcbfOak=
X-Google-Smtp-Source: ALg8bN6xpOdo5EIHB/vaoO0TxJedSrip5aappizgxMZj7lRQz1hShoKLzwDk/g3oFgO9+F1DSusiKw==
X-Received: by 2002:aca:ab53:: with SMTP id u80mr13469889oie.261.1548868975687;
	Wed, 30 Jan 2019 09:22:55 -0800 (PST)
Received: from blackbox.Home ([200.68.141.9]) by smtp.gmail.com with ESMTPSA id
	a201sm927160oii.27.2019.01.30.09.22.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:22:55 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:22:52 -0600
Message-Id: <20190130172252.6752-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][sumo] ptest-runner: Upgrade to 2.3.1
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
X-List-Received-Date: Wed, 30 Jan 2019 17:22:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changeset,

05b112b utils.c: Print DURATION after ERROR
acb5efb utils.c: run_child redirect stderr to stdout
e1062f7 ptest-runner: make DEFAULT_DIRECTORY be able to be defined when compiling
8071258 ptest-runner: Add support to report duration of each ptest
a16f2c1 ptest-runner: Add support timeout failure type to XML result file
49956f6 main.c: Add option (-e) to exclude certain tests for execution
5bd94a9 main.c: Use realpath to get the actual directory of ptests

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../{ptest-runner_2.1.1.bb => ptest-runner_2.3.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.1.1.bb => ptest-runner_2.3.1.bb} (89%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
similarity index 89%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index e5b71c0f01..056a0c58d8 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.1.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "16413d71cc06b02a6d859c35a017cc49b88283f7"
-PV = "2.1.1+git${SRCPV}"
+SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
+PV = "2.3.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.20.1


