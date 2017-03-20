Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54EAD77A27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:47:45 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g2so20880551pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Fb4V5nmqq813K0yEZGH7JF3fIzWtChVnphpWVxRk+XU=;
	b=dyewBoElsEJpBlrPqA7S8lgf7XSrLMbRgI6/2CGEYy5CcCSWFtp50mIE2kA0XiyhOV
	z61L+adl4UF2l0wda3KKd77wdIDKBs2H/JU3FMgdTPTUp/PE5TMzJLmPUFhjAK81l8I+
	OjFd+jiX6qJcN20oh1njeXrMacHhPqfP15/96sC8qEMbQC5PTg3lSbTmrDhd9z/m4LoH
	+mR2r2K7HosowczsEdIgNcE5MUn1mxbJHxORq31s99MRZO6k4RFr1fb4qO2bjUuxYssS
	L3Qu0/FYconbY9rzmPaPGY1KwWVLVhOI58vXsSHVg3rtdpU2//AKdHdi1y2W9S25lDxw
	CFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Fb4V5nmqq813K0yEZGH7JF3fIzWtChVnphpWVxRk+XU=;
	b=CrhHiUn19kRxfsLrUVyTVpOiYPkpkCQ5tHVVW60CBK0zKaqI0Nj9YNwTpQeLzsKKBi
	Y6XW9iZW/FSvINoA0KriJu5pRU1VpuuCBiY/vfjHcFWw88jqHJuxHObTBwaqVUx3Q6ln
	Lc2yAOyUxStIKvTIP/mg9zI8GoWpK0sLut/VgTldtt7dqX7ZTFEc8e3m+sQEyVwxapLd
	QzDx8lJlgYYFFRpk60ju78M9w1kqCgxgEq+SeALQ0d3vAgkgJya4Kh9hwQFOmqqOupcQ
	aVGw6rwVxd2wupa0AaVPKqR25PH6gqeOPMZAPHUjfU4kv6fHCFMzNAaXDebsG1/hW0g3
	1O8w==
X-Gm-Message-State: AFeK/H3Z8JdlRcAnLiLmhvBPAuIu4ozwQ1rhVK1A50ilLZ69StvKm3vykLoo2ig0fLo2gg==
X-Received: by 10.84.214.22 with SMTP id h22mr7572839pli.65.1490028467554;
	Mon, 20 Mar 2017 09:47:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	k2sm34536513pga.29.2017.03.20.09.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 09:47:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 09:47:35 -0700
Message-Id: <bd89ccf422a56d8fe08cf888ab7ca321df9a2442.1490028304.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490028304.git.raj.khem@gmail.com>
References: <cover.1490028304.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] go-native: Install bootstrap binaries with 1.4 suffix
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
X-List-Received-Date: Mon, 20 Mar 2017 16:47:46 -0000

Currently, bin/go and bin/gofmt collide between go-native
and go-bootstrap-native packages, these are scripts anyway
which call the go compiler proper from right install, in
this case create go1.4 and gofmt1.4 names for these scripts
to avoid namespace collision

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-native.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index c1ada5121a..c21f8fda78 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -22,14 +22,14 @@ do_compile() {
 }
 
 make_wrapper() {
-	rm -f ${D}${bindir}/$2
-	cat <<END >${D}${bindir}/$2
+	rm -f ${D}${bindir}/$2$3
+	cat <<END >${D}${bindir}/$2$3
 #!/bin/bash
 here=\`dirname \$0\`
-export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
-\$here/../lib/go/bin/$1 "\$@"
+export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go$3\`}"
+\$here/../lib/go$3/bin/$1 "\$@"
 END
-	chmod +x ${D}${bindir}/$2
+	chmod +x ${D}${bindir}/$2$3
 }
 
 do_install() {
@@ -45,7 +45,7 @@ do_install() {
 	do
 		base=`basename $f`
 		install -m755 $f ${D}${libdir}/go${BOOTSTRAP}/bin
-		make_wrapper $base $base
+		make_wrapper $base $base ${BOOTSTRAP}
 	done
 }
 
-- 
2.12.0


