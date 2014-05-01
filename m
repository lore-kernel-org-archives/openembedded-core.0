Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 31AF860781
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 12:20:12 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id mc6so2058040lab.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 May 2014 05:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nBLviuxXLQgK7nYh02GOHBL5Dcj2o3wnFJNBpWdJLJ8=;
	b=c2GvvZq03Wj59QHFkvqbK6OPCPO7QGye4YOlH6GhJHLxQ/qjf3uLoy+4TgL0P6wUKl
	e9nZy4f56+ZbJq2/Nf1vtyIBWuhe1ELzy9vUBKCx9Qqom6bsX/aEerzHoErMHbICErdV
	ASEHyXCG/y+WmRQo3fct5kP8xTY1LoM3hM3tDag2c7+IKcaUjxw85IEcurppcJ48125H
	gPnrfoN8hIGuQtVMhaSlKRfpFLlta2hgmNv79Y7/z/dH7ccwYaXV3WGY+eDBqy+dFRVL
	Rwhzo+0v+EmW2wGNWOEdVxOMt5gnDk7QpiTPceUAOw+BKus1PUJEkiPtDTlYraZYMkXA
	N4bw==
X-Gm-Message-State: ALoCoQkep/SMf9sQeIoQhCy81xDNwgkHles+qjQyG4tQtnqXeBHQK5iRoclfq3J8cAsnzGk7yD/C
X-Received: by 10.153.6.2 with SMTP id cq2mr6615745lad.0.1398946812791;
	Thu, 01 May 2014 05:20:12 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	cr6sm29732987lbb.19.2014.05.01.05.20.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 May 2014 05:20:12 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 May 2014 15:20:06 +0300
Message-Id: <1398946806-28117-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] systemtap: update to 2.5 release
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
X-List-Received-Date: Thu, 01 May 2014 12:20:13 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c280313..78439c1 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "ae91e3d552aff4f0e74662d055dae06ea55eb6bc"
+SRCREV = "8f0fcd995f7f650a2ee0a94539f90c99e6d19e1d"
 PV = "2.5+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-- 
1.9.2


