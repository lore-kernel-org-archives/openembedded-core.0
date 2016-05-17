Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 27E3165C5C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:36:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id l68so1936790qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=/YwOPC8by8FthFQFWwVFNQRFW5m2ebDeiGajotfsmUI=;
	b=NU5A7ZkOWj1dSuLhiYrq3NC2Ql3t8K+N3HkvsZfNNYoGlOkfd2p0viVJnIB7AyhE4q
	5g81ZgFiXUUb931JZmZ7omy5PoAM2fjoRDPSJoJKxRh9KQa6qV0vACMKPkpwy++S+Azr
	v6yqKFSumYKeDbia1SvEX9aSvpyuO6Je+BRJrYMqaPshrWBH5IyG4RF96m+qeaRry5Fd
	bzOmOpOuczlPILIEAF+dPyN8CspK8mT6wG2ug14x/1ZpOQMFJ1n+0asKCvQyqDqmFJVE
	3Yqdrvj1AnsriMnZYsB4Wqw6GS5uune3maiXBLq0U/5cWrwuzF89mEaLHae/2v0EM0tB
	c/Qw==
X-Gm-Message-State: AOPr4FVdIBZwdlxZtbAtdkViItxl0hEX4tAkCenbqys55KCc9mw7je7drG4SFMYULKgaXw==
X-Received: by 10.55.201.145 with SMTP id m17mr2596318qkl.85.1463503018450;
	Tue, 17 May 2016 09:36:58 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 23sm1728252qkd.8.2016.05.17.09.36.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:36:57 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:36:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:14 -0300
Message-Id: <1463502985-5428-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 02/13] weston: Fix SystemD service description
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
X-List-Received-Date: Tue, 17 May 2016 16:36:58 -0000

This improves the log shown in boot. Now it shows:

  [  OK  ] Started Weston Wayland Compositor

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
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


