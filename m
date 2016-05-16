Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 970A9606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:13:00 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n62so8756612qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=dvtQdihnKiTs2svwWhgst0ZBqTck0EKO6tlrl2/Z8K4=;
	b=DrIF90P+bWr4p8++++HSojoAfFp7iVnol6KiT306ZCH79ZsQjzTFbSI5DADWs7jmxO
	wsA1fRqvcUv+go9UFM7K6vAbnu8GhNW1ogT2yK1bvgyGsPmiJocFmL8C+fVXfuFEwfVn
	TlaO6WhCVEQcUHS8ixo2wZsJC0EZETKvjKO6nVx4JC0I3uotFaUWJK9j9zN2KcoGK3GT
	puw4oRWYaUWX13f+5A4KCQQKu67JFzyBW3F6jVVM34WdcNJ7YXZx52hpEIwJCcq3XMlI
	k+asRNy/sDG9Im/4u+4X7i5qnf90VRUyj4vsNHsSdXtHv4KSYJ/debEaEM+p3uMHQa06
	hXLQ==
X-Gm-Message-State: AOPr4FXD5Dt1rnvygRdhR5gsYJgerpymZ0aGHT1AlURkOMQ09z4lebKDWHAzljY6He5TRg==
X-Received: by 10.55.77.202 with SMTP id a193mr33082028qkb.48.1463425980999;
	Mon, 16 May 2016 12:13:00 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id a5sm6088817qhb.26.2016.05.16.12.12.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:12:59 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:12:51 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:01 -0300
Message-Id: <1463425932-10080-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 03/14] weston: Fix SystemD service description
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
X-List-Received-Date: Mon, 16 May 2016 19:13:02 -0000

This improves the log shown in boot. Now it shows:

  [  OK  ] Started Weston Wayland Compositor

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- Fix typo on commit log (rborton)

Changes in v5: None
Changes in v4:
- New patch.

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init/weston.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 4f1f7ff..12aedb7 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -1,5 +1,5 @@
 [Unit]
-Description=Weston Wayland compositor startup
+Description=Weston Wayland Compositor
 RequiresMountsFor=/run
 
 [Service]
-- 
2.8.2


