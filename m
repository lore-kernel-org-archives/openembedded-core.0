Return-Path: <matt@madison.systems>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 59492789D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:36 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id i14so4234970pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d+DclZa0ngIdg6KdKoI+qEFMODvTVjpWeqLMxhI6kTc=;
	b=t3KtGHmUrlu3NNax9PGsTmE8z4ddXROOWy0BFNCOsOjZAQbuMVyajk3Hj3HhFvTYm3
	vqUIYpR1QN1AZJMoXW0IwNeOejIxdiHRDYJFGy8BaMuWw43DH871M6c8XC36XFQOzqBw
	Lggl4Jemkr7x2pziMABPZwtGffzorRfbG1k2Wsk8chS+QsreQRNk1YYq894p5uHh8bTd
	YT2R3atDA5kom6C3lXpwpDMboExkAugZ50d9YfxnX83hvliq4C8i0OKOfPKzLy2raddA
	6Wt6KaIB78K4TXfFpW/yxo4kDtjdcl17coCgZVJdTtReYs+F/cKJoF1niG4jb08ZApde
	aodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d+DclZa0ngIdg6KdKoI+qEFMODvTVjpWeqLMxhI6kTc=;
	b=QKeWOThFtX2DPPDJJ4/AW4rw9ddYIgQc2BFT+23dwqTKq7zJWGATERxLcToU95LMcR
	7LhhT8ah3KkCwpH3RoNsz9ZL7rd9eMtHtLHGq0YxI+Sb76Jm0vqQsuMdcibfqPveqAhc
	bE+xEEEcg8WbGSHHJyz+xHcUr0Znrc+D2iK2BqofrUiQwR6hHOS3LKMzGE+eKMweYjmM
	urVRGjk+GfzzsXZ/nqhd1JyEsW9NPUrfdaIiLZ95VPtd44Lm1U6venOwmAC9IXtyJAFe
	rF2isabb4KTXTndaISRSx/cAeWyvNgO39e9c2rsF256WccELbVU/aDt/4Gcmp9z94c1l
	QOpw==
X-Gm-Message-State: APf1xPC4IwRnaDhoJIYFM5/RolPjFLvnHzamDPzQYvXHzI+mV8wvls0S
	dg66ztDtd/+a8uA19oVuW0ZO4eIV
X-Google-Smtp-Source: AG47ELv24XQjLrUJeu5U7hINgJt0mZrXeMdb22uUT3PpDLEbuXhWu5flzoWCM0vD9j/D2ZliYNeBqw==
X-Received: by 10.99.120.13 with SMTP id t13mr5573616pgc.35.1520022817250;
	Fri, 02 Mar 2018 12:33:37 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:36 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:05 -0800
Message-Id: <20180302203314.32737-5-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 04/13] go.bbclass: remove debug-related commands
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:36 -0000

The 'go env' in the do_compile function and
the set -x/+x in the do_install_ptest function
were used for debugging the bbclass, and aren't
really needed.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 805d92e101..33a6fff0cd 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -88,7 +88,6 @@ go_do_configure() {
 do_configure[dirs] =+ "${GOTMPDIR}"
 
 go_do_compile() {
-	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
 		if [ -n "${GO_LINKSHARED}" ]; then
 			${GO} install ${GOBUILDFLAGS} `go_list_packages`
@@ -124,7 +123,6 @@ go_do_install() {
 }
 
 do_install_ptest_base() {
-set -x
     test -f "${B}/.go_compiled_tests.list" || exit 0
     tests=""
     while read test; do
@@ -158,7 +156,6 @@ EOF
     else
         rm -rf ${D}${PTEST_PATH}
     fi
-set +x
 }
 
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
-- 
2.14.1


