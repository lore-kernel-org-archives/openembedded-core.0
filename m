Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id B75E7701D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 14:22:23 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so6989449wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 07:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YT1dnbXgk8JTqo1tD7ZcVh12EpLGoTRJont3o5Kt+vY=;
	b=bJt/Arh5yE5Rw6zCQfX71Gic1qIY0MLdV9OPgW2LF3TVp4wHGxSxY6pcHM6btmXSp/
	0GybFC3yuNx4rmJ6DCVaePt7YoEThhr4cKzFO1V0XMFuhtAK9SrxGuzlF52GrVHJOk+1
	rahYPf3UcJK1NJVR+GYgfZhSlrhyxAtxviaC32MMYzYM59h0Bmh2JhoPsYHtSxSovNvj
	ZSsw57I1X67iQaRYCm7mn2iMw/4UwAJxvW9/Ba9I+gI+QBUpl1Uz+lfT7PiASN2evJn0
	E3pWRje+lVcFhcP1qB2IBD9q7jRyBMzpEL9NHxCWSjHCg64Z5usY3krivafVgfZlYgLo
	clNQ==
X-Gm-Message-State: ALoCoQngrggEZGpg/l4U1Kl17ZHHJgLiMRe8V+N0oHYvUfWauPuBo5IoQHlAta48bn9e+cwmTJyL
X-Received: by 10.194.90.228 with SMTP id bz4mr33489495wjb.65.1404742944953;
	Mon, 07 Jul 2014 07:22:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id w6sm31048106wjr.4.2014.07.07.07.22.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 07:22:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 15:22:20 +0100
Message-Id: <1404742940-1438-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] binconfig-disabled: add a default value and comment for BINCONFIG
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
X-List-Received-Date: Mon, 07 Jul 2014 14:22:26 -0000

To avoid syntax errors when inheriting this class without setting BINCONFIG, add
a default value and a comment.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/binconfig-disabled.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes/binconfig-disabled.bbclass
index 1308358..27f904e 100644
--- a/meta/classes/binconfig-disabled.bbclass
+++ b/meta/classes/binconfig-disabled.bbclass
@@ -2,6 +2,9 @@
 # Class to disable binconfig files instead of installing them
 #
 
+# The list of scripts which should be disabled.
+BINCONFIG ?= ""
+
 FILES_${PN}-dev += "${bindir}/*-config"
 
 do_install_append () {
-- 
1.7.10.4


