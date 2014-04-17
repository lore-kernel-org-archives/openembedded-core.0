Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id A722C65D11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 09:08:25 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id q5so2597631wiv.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 02:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vg28sgoB4ICRE+bDyGnjikcEHQH4+7WOCDO5E+A/16s=;
	b=Hh0CmcTDAjFtmsYrA0BNY/f0CK6/5lRV1uy5IdtUBMdORhu/zKiY9raKmNpnmO1nbx
	KeVJ30afO95HV5h6VoTPkBr5vGY6jr8latYFST1EJ7SRFlcgtdxHEDTA5hQEjbIDZTG0
	cTWrSXHY8VQXwNbKyg/uNidbGUz4NO9Xsk04HB8ukiiQiIzfDMRZbK5QZPN18RdpTqcn
	lVyhqmf8tmO5h7jwTTQviqozNOXrczgpjBGJsHBhvVPfXNZTkqZd52izvukp6dl2gJqn
	iyPUL4eokkia40PplbgsyNbXU1Jy2UfgVTxrKtLYXAqsRmMggc/Z6/VSbDfK6MtMqrML
	Ys0w==
X-Gm-Message-State: ALoCoQnhyBWN3AA64cijTPDY9OwMRHy1KCGR+XwvT3ZWV42ybam20Um5NJDV1/8TJqab00BEwCRB
X-Received: by 10.180.94.8 with SMTP id cy8mr23185403wib.29.1397725706121;
	Thu, 17 Apr 2014 02:08:26 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id ed10sm3651765wib.7.2014.04.17.02.08.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Apr 2014 02:08:25 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Apr 2014 11:07:39 +0200
Message-Id: <1397725659-9004-3-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1397725659-9004-1-git-send-email-koen.kooi@linaro.org>
References: <1397725659-9004-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 3/3] git: add a runtime depency for liberror-perl to git-perltools
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
X-List-Received-Date: Thu, 17 Apr 2014 09:08:28 -0000

This makes at least git-send-email work.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/git/git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 888b2a5..1e819dc 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -84,7 +84,7 @@ FILES_${PN}-perltools += " \
     ${prefix}/lib/perl \
     ${datadir}/perl \
 "
-RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
+RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path liberror-perl findutils"
 
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${libdir}/python*"
-- 
1.9.0


