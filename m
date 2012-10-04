Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJlbm-0000Wm-Jm
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:36:58 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so407683wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OtXocdCN+HCTDZvUXZblChkYPRF5s+HUfWFlWCP4sWw=;
	b=Z4koD34MkbTyT9sGlBMudGHulGBrLyiccHBc5yy38glBAesci7N137cHOKdn48Y2mp
	Dz2WVmzLtjK3TQYOTgGfMLDtogEAq/I1q3CCzJu7oFDbyiFxpJuVGyWKaLUhPCYzFsmd
	Ak6bdllnRoPFjTugX9RWlLvqVSwoQx19JOnjKcdzgnIJoNNw3QuAXr16AgWkQd95595h
	DudfTIdgK2ssm+MEaKSJuOZrzSA9v7T1YdlUQGB2BAx1T6CPK8yiA4JCD7ig0a9Ybx0k
	peSIYt5OQcmg8MnwHB3nCyCMUAZOHCNx8xzygBXYEOpLB13jBniC6FjnTqTQlMj+f54c
	7mDg==
Received: by 10.180.106.9 with SMTP id gq9mr12983921wib.12.1349357037946;
	Thu, 04 Oct 2012 06:23:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm32411414wiv.11.2012.10.04.06.23.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 06:23:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 15:23:36 +0200
Message-Id: <d90271bc6d6538a8c8a914b0c1d30c5d287c374a.1349356755.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1349356755.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/7] bitbake.conf: add TUNE_CCARGS[vardepvalue]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 13:36:58 -0000

* we don't care about expression but value
* e.g. tune-xscale and tune-arm926ejs have different expression
  in TUNE_CCARGS but with the same DEFAULTTUNE the result is the same
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/030032.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5cb5b13..fa8fb5e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -98,6 +98,7 @@ HOST_EXEEXT = ""
 
 TUNE_ARCH ??= "INVALID"
 TUNE_CCARGS ??= ""
+TUNE_CCARGS[vardepvalue] = "${TUNE_CCARGS}"
 TUNE_LDARGS ??= ""
 TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
-- 
1.7.12



