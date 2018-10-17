Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBAC79B21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 19:03:29 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w5-v6so30894471wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 12:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B7D/cHTWIpw+T29XmmyG3vI8lxwhNYJsMiOuZPaq3Ws=;
	b=TQyeILENvyz2Binrqdp2kZ3gZ0jNxpYrcjM43kff2Doa8lDvqn1h7YloOCkoDO4AgQ
	rNgiskgvSrzi3DiIVnFrubdLFqLTBcRejiQYkJNO5nCoan1hWgIW8XC+u8E2vawob7Ta
	tQclhu3TbGlG43ndfM+huILLfnAh6wE7gAqBTTb7uyOiqpJihvqeBSRiZZ90k+6bIJAm
	uEfrueBNceYC42L5dAwXm3L4lq1jRzivtkYeQ2Xx7IY73NAKGYhJzl5Fva/jKoAb+enh
	sFqzSgbAL7Ba5D5VzEPcXiEgWbHOzGiSXmY0Zwk+mSsPf76CX5Jco9kXd7UHSo102Ni8
	XLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B7D/cHTWIpw+T29XmmyG3vI8lxwhNYJsMiOuZPaq3Ws=;
	b=UzQP/RnbTI4QWr8aOt+6VTzKQnds4bBSaiZ9JBTf9AAnBSps8l2k6pYjoUht2uwPAl
	20PUcFZSTEQvd48+5flanA9189klq0IXor16eny0ezB2/GKPtAcrcpq+8iCFifXWMP6n
	rW04IbioSmgT+Ok+IXKg9i+R+MXi+ERik4W54hC/dfTkdYsciHF0ze2xZTHtYvGBod1A
	pZiselNS0xtCfxf7oAIUxkvC9eanBgYPKRi/UTkk5gRwiMicbnmTo9kWCMfyvMSJXR0F
	25WvJcYWObZjP5PapaSbHubr2HpsqOLP81EkdKOWz5LRE8dfb1pnVk6zC7KTuuHGJMYK
	mQXg==
X-Gm-Message-State: ABuFfogXGptHx3ewydvS2GnaxcV5fZwkXzasa1/mAdEKlEDVZO6Se+Z1
	gqPUOJN0ZzizWIaKA4P+xi5+5WAt
X-Google-Smtp-Source: ACcGV61OJx29F21y4G1xvKTRnvIX3n/JtZlbFbsWO0F+axqmwDVoSmoqXd564oPSRP95bJF42wC9/A==
X-Received: by 2002:adf:b743:: with SMTP id
	n3-v6mr25477111wre.274.1539803009864; 
	Wed, 17 Oct 2018 12:03:29 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b143-v6sm4929045wma.28.2018.10.17.12.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 12:03:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 19:03:28 +0000
Message-Id: <20181017190328.53-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQekaVbr5MMkW7TFWXeFq5Ye-Cyfn5WBn-0ZiM=QVTW-GA@mail.gmail.com>
References: <CA+chaQekaVbr5MMkW7TFWXeFq5Ye-Cyfn5WBn-0ZiM=QVTW-GA@mail.gmail.com>
Subject: [PATCH] systemtap: fix QA issue
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
X-List-Received-Date: Wed, 17 Oct 2018 19:03:29 -0000

ERROR: systemtap-4.0-r0 do_package: QA Issue: systemtap:
Files/directories were installed but not shipped in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/stap-exporter.service
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
systemtap: 4 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 3c45bfa937..88942a2362 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -27,6 +27,8 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 
 inherit autotools gettext pkgconfig distutils3-base systemd
 
+SYSTEMD_SERVICE_${PN} = "stap-exporter.service"
+
 do_configure_prepend () {
     # Improve reproducibility for c++ object files
     reltivepath="${@os.path.relpath(d.getVar('STAGING_INCDIR'), d.getVar('S'))}"
-- 
2.17.1


