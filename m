Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF1D78AF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 12:14:40 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y9-v6so40691wma.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=g5Bc7vM2JTAbU3VswWC5RP3+S+xaPXxAdc31oqSrOOE=;
	b=nWVPxY1IS6qkeo2EHL2DAazc3r6uj00IkxwPgS2P5h6n1SV8a3NpWlCANI0YBXbWUA
	5pFDzAt85CBhEoi+zk1nP+g9DlTA1XWMyJMnBaC6uQd0mhFvJMVYloLenlpFRXFIeJc+
	6Jl5sCOvI/LzBxoF2+JWVSSK4A2CyO3ehxA3LJqXODP6kCbplo1eSYtuPn41kqZEl71t
	cSP36YU0OQLPPMmQdqf/T868JFp7EPGukzYPcDn/I5wDapwLJNbB6a2Nb+uPk2exkocV
	Z8a0rM2aSzgQ9OnnmsZcdmqjIEgOL+DBMCazIswSA+BZwG3Lpxwy67UkbVze/T7DZh0T
	naWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g5Bc7vM2JTAbU3VswWC5RP3+S+xaPXxAdc31oqSrOOE=;
	b=iFPnCQJaYih4TPcEaudMbNvVBoZN5I1UVXI509Gv/sOe4OElWzFCdZaRV/pY9HCl+q
	3ie8xO9MxzPf3m+f7FnDPenNJ6c0uy4wbam5G++82dcWQupGmtZ8DBaPTggGh5ucIPiq
	YIBMnFThtrITuC5lLrhJsJfKM9yMxESq+yLtLNmwRqhE8e2SI0QOii+OZL8NaqFUzhYB
	y98sJXWZiqeMDh7PGFp5inbgL2u+syuo5/TYAY7eMOgP9bn40KYjHbP3CpRHtgw5ftAu
	nJfgctg+scgX/QSAyVdqxlLmkdlh2X2wDPeX3s46+oVTO1MmccRSN9iK9mhAock/aSdy
	Ujlw==
X-Gm-Message-State: AOUpUlHWS9cBDbStehZs93chi8tfwnN89H75B1wMV0IDBm0JBHmE11Jc
	EL0s71+GFckj5lHXOGOzbcx6psBk
X-Google-Smtp-Source: AA+uWPwrAnakwEOK2Y6BcJVUrfVWo+d4G6i3erQ6JMtk2Am2zN1aFyDX67b1sIjUro5AT7QO5agxHw==
X-Received: by 2002:a1c:90e:: with SMTP id 14-v6mr1480964wmj.130.1533816881675;
	Thu, 09 Aug 2018 05:14:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b22-v6sm12037826wme.48.2018.08.09.05.14.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 05:14:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 12:14:41 +0000
Message-Id: <20180809121441.7191-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCHv2] perf: inherit manpages instead of adding man to RDEPENDS_${PN}-doc
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
X-List-Received-Date: Thu, 09 Aug 2018 12:14:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2c6bbb42b9..ccd2c7d11b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -39,7 +39,7 @@ do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 PROVIDES = "virtual/perf"
 
-inherit linux-kernel-base kernel-arch
+inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'pythonnative', '', d)}
@@ -247,7 +247,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
-RDEPENDS_${PN}-doc += "man"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-- 
2.17.1


