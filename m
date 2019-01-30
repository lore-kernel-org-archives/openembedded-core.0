Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 176D76C0F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 17:25:29 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id v23so264888otk.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KVP3Uk8f1egqrLERYwRy/GNW6OlV0NWCb9MkR5F80JU=;
	b=UptIW+Yp4RyqEDNmzmenzDyZmcSJQlT7iHe18beYyYl+eDPbgnjRsN3SM3LDYy3da7
	wRi9l4inI2ujCAkzWrvq5Pgk07vFSOqPT0EHJhlGbO5ST2HxAQgGyF/yNwi1Mp74viu+
	A0HcyyCBW5mPGbxd6Inje4snTGhFDIXzSYn1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KVP3Uk8f1egqrLERYwRy/GNW6OlV0NWCb9MkR5F80JU=;
	b=f2x9eufA5iXfoujcCbm9Tt43qqumLBhdABpjCSq56f+Kxf6JtuEEnBok4ivcd6fxCs
	1XGQXR7ri4rXyj8WX2iTCWS6qlOOXBoK2w45BUPx1vfDvpQxjDwFJ15N/BENDT8lVlx2
	pz7LImLC2yNnkh0CsCVT0C6wNA61u6DicHWRYB0UQAr3i6g5s4yUSTxVZIarD5d8rvpD
	FJ+TvRFgsJhpL5YNqlZAoPBIePoQWMRwIA3mzqXvnLY3MEmo4AO+k4xqk2Nq7+Bo0gld
	eHu9toZDc9qdUKzfEtKV1egBu63m02zLgzwxI65q5dRDxhhAIhH6pw4xnhnC+FknaEus
	FK/A==
X-Gm-Message-State: AJcUukfB5MwuWhG0xuADSUZj8sXsN+w11VwPjE032lNYVnYSUMLUUjb9
	KrXgq5Jd9DYOCYLs4Gy0nNCrwa0vw2U=
X-Google-Smtp-Source: ALg8bN4y9n5VUVGUEZlkh1Nl81+m+0SBvZ5rGq2Cx0kBDjdex+RPoFnNS3df6HHox/zFzQtfrr5orw==
X-Received: by 2002:a9d:1982:: with SMTP id k2mr22398168otk.197.1548869130787; 
	Wed, 30 Jan 2019 09:25:30 -0800 (PST)
Received: from blackbox.Home ([200.68.141.9]) by smtp.gmail.com with ESMTPSA id
	a201sm930485oii.27.2019.01.30.09.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:25:30 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:25:27 -0600
Message-Id: <20190130172527.7080-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][rocko] ptest-runner: Upgrade to 2.3.1
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
X-List-Received-Date: Wed, 30 Jan 2019 17:25:30 -0000
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
16413d7 README.md: Update to my current email
0e566f6 Add support to avoid load/run twice a run_ptest script
4f6d6c5 Makefile: libcheck now requires to link subunit
41b7f48 utils.c: Prefer monotonic clock to calculate elapsed time
8a93832 timeout option missing the argument option ":" to getopt

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../{ptest-runner_2.1.bb => ptest-runner_2.3.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.1.bb => ptest-runner_2.3.1.bb} (89%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
similarity index 89%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index 71c1dabee4..056a0c58d8 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "8a93832dad621535e90aa8e1fb74ae5ba743fc3e"
-PV = "2.1+git${SRCPV}"
+SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
+PV = "2.3.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.20.1


