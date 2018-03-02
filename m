Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB137855C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:53:04 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id y8-v6so6088969pll.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 09:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cDxplXZw9x1DoJh6xyU8WoKSiO8EhnwuhZduESMTY/0=;
	b=ao/RnQA3JWcnxJ2vD9aQlpw9vcuU146ZapQXXjCV9V/tqmIY7z/ze1zkSPsnvcPZCH
	kJh4mBhtBSnz/T0QyN/QPEe/5p/MIduJEqOqzWFgjf1Nb8FINVQV68DyfLDsIAFCUXE0
	kGp/1tZPO1xZiK0A7rjlJ6lxByjkMjb1iSVtDzfIm6IC3Y8kCSllaXV1CV7OXFtj1UEz
	rD69j4QUeDg55C1LmdmVBOEgvo5qGUfHJuCjaHQ7jK9ItpKpp4kZ3gmkImIoEamk33UF
	z2ifQF1+DmdB7oDZAD5AEOnnNcXsHimefr7C9XqsP2TZ2+VKodKQ/zn+POm/PN64WmPv
	qPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cDxplXZw9x1DoJh6xyU8WoKSiO8EhnwuhZduESMTY/0=;
	b=s5e852g8IOQ75mR43jLIFLkOALEBIe1fVJgk0kZNUd5YCOMHJzWrv3B8Ur6WHTYMMO
	lyxGDt6r6MhJys3DfpDJJCotyrKI8e1E4c7wfEdySWxkIw5gnMsjhfbyTy1//GuEa7qh
	8apNphyYu//BX7PJ2Oj89VDAKWqywxlfNLuQ+lnPH+XsrZUT4gCmNa79nI4jC6lFzTPY
	lRvj6zbyhAxiE3Z8ZBSGgbCjQULu+69l8K+sVTuDLCCRpgLDwkYVLGS4YugOOU+3KWGt
	mkPkMPIsY4dtw5gB9nrOPVoqPAP2FI++u2YQDAnJErA54wQ873IUMCpkzaTQjVSfSvW3
	kp8A==
X-Gm-Message-State: APf1xPBJVEX37/WsNszbPKU/s2A3KxMKtDG3s+aqNZgGQ8DeMUQGeuqF
	tKMJpNOHe+sC1gDQeXQSmYSdCA==
X-Google-Smtp-Source: AG47ELv5pu1V7AHelbmPVFp79HCe8Pw8Ds1T2l2FQNO7fUbWpZ+D+5/s2s9PneIzVTa/M9Vck6Otog==
X-Received: by 2002:a17:902:be02:: with SMTP id
	r2-v6mr6019472pls.234.1520013185985; 
	Fri, 02 Mar 2018 09:53:05 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a28sm13329196pfe.70.2018.03.02.09.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 09:53:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 09:52:55 -0800
Message-Id: <20180302175256.29044-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180302175256.29044-1-raj.khem@gmail.com>
References: <20180302175256.29044-1-raj.khem@gmail.com>
Subject: [PATCH 3/4] musl-utils: Add package
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
X-List-Received-Date: Fri, 02 Mar 2018 17:53:05 -0000

This contains getconf, getent and iconv glibc compat utils

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl-utils.bb | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl-utils.bb

diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
new file mode 100644
index 0000000000..74b846df59
--- /dev/null
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -0,0 +1,25 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "getconf, getent and iconv implementations for musl"
+HOMEPAGE = "https://git.alpinelinux.org/cgit/aports/tree/main/musl"
+LICENSE = "BSD-2-Clause & GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9d08215e611db87b357e8674b4b42564"
+SECTION = "utils"
+
+# Date of the commit in SRCREV
+PV = "20170421"
+
+SRCREV = "fb5630138ccabbbc14a19d372096a04e42573c7d"
+SRC_URI = "git://github.com/boltlinux/musl-utils"
+
+inherit autotools
+
+S = "${WORKDIR}/git"
+
+PACKAGES =+ "${PN}-iconv"
+
+FILES_${PN}-iconv = "${bindir}/iconv"
+
+COMPATIBLE_HOST = ".*-musl.*"
+
-- 
2.16.2


