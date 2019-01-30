Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id 727497C29E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 17:14:36 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id x202so206428oif.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GyF8MpHqP3zv/4O7IfK0Z9kAXKN7WiOvZ1V1SLiFP5A=;
	b=ktrTVSxEA/OfQOhxGH4zNn5rOKEFJ7q3LvRHt22VgiqFWHmHpvyVQtbtmBDLlY+pRk
	H872n5AdsJpWzLaAUg/1VDwQeKgPYvHyjkVo5+V97Ry0Rv/4eh1BNSLhSUTTBZffyS7L
	PaEVd85J3Skr5VeZ7InlIhy5jnzEE9JT/MVAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GyF8MpHqP3zv/4O7IfK0Z9kAXKN7WiOvZ1V1SLiFP5A=;
	b=ZiwGzpllUxjeBlAhlhyHKsLcQ3S74GczJlTvLnFgqquBAJ/FMUGSRs+ErG4ErWeoPe
	y2Z9qz3JCTgPjOBsZP/3awvuH4t19/HuX13jS17lU61+QKxaMnmSi4VF39ZEAkCgMbc3
	O58Gj1ODySFWj2qp72abQB1iBBiShG1v7JkX7jd4L/aQQsDcgCdLXxCCMeQbZNl0T9Q4
	3X/bNHV0ygP7c2uxxa7fkukbBkj8NBZc608GnR+njorCTRoTs6oT2hfbllv/rfiyI/mV
	GT7JgtBpTHihBQHAAaTB+Oc34LpnYZOYVGFe77OLD8qc3ygzDoSr2HkiMT/9MPnADlNg
	sRgg==
X-Gm-Message-State: AHQUAuZH14tEfJeC6UZaBuP44mll+m7WYBlylSbfBJ5LX2Rwz3wTDkCg
	I4mx5XKO9nu6fxVaBBwQ43vX/SRH73U=
X-Google-Smtp-Source: ALg8bN60kxxz1Tlvtv3GhYqFrNnh8b90DOBkoAOjTlLc7LhsxfUo58JTmGecZTH1S702JHSdUmyJlg==
X-Received: by 2002:aca:e241:: with SMTP id z62mr13425604oig.59.1548868476606; 
	Wed, 30 Jan 2019 09:14:36 -0800 (PST)
Received: from blackbox.Home ([200.68.141.9])
	by smtp.gmail.com with ESMTPSA id w4sm748753otm.46.2019.01.30.09.14.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:14:35 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:14:32 -0600
Message-Id: <20190130171432.5922-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][ptest-runner] ptest-runner: Upgrade to 2.3.1
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
X-List-Received-Date: Wed, 30 Jan 2019 17:14:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changeset,

05b112b utils.c: Print DURATION after ERROR
acb5efb utils.c: run_child redirect stderr to stdout
e1062f7 ptest-runner: make DEFAULT_DIRECTORY be able to be defined when compiling

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../{ptest-runner_2.3.bb => ptest-runner_2.3.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.3.bb => ptest-runner_2.3.1.bb} (90%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
similarity index 90%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index 0a58f74ea2..4b7992bf2f 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "e1062f776eea60c50435c6b8ddf9714a31141aee"
-PV = "2.3+git${SRCPV}"
+SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
+PV = "2.3.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.20.1


