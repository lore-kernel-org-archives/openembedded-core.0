Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0DE6E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:38 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v187so33903682wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=uygoSm1wCK9aGCJMxwsaYRNMS+0WAdWb903npK3irN0=;
	b=HFawOcoIn381N8dIeCsIb2X77ZZui0C+hmXMzA5oVwd4SjXiXvoD2Mk4NKXiHEiS24
	gB8BtSgV+CsRCR2Z44VDbmvU+JGs+UNI9DGrLQLGXiZvpxjIjR2zr/itN6l02Dou53te
	nNSc7naQ8fUOh8yuSe8X46VZLsEA2Cc82is/yka8MnxF9Z1AVPeIix4tkm51IwVSF9h4
	NN6LIkLFUydK51P7waNnNzqux8bYv5/ksQMx3p/GchV7hCAEo5fFEylnYbffUKD+EaUZ
	m/xEBFwxp0Qu+z0NtHWt7T1sLF5gDUIo/TlSKAH1o3U9Ae788q4AYvRIdGlh2dW78IeY
	WqkQ==
X-Received: by 10.28.35.66 with SMTP id j63mr18948418wmj.10.1449755199266;
	Thu, 10 Dec 2015 05:46:39 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z66sm944617wmz.7.2015.12.10.05.46.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:16 +0100
Message-Id: <cover.1449754339.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][fido][RESEND 0/5] Backports for fido
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:39 -0000

The following changes since commit 9f339f516ab03d598fae0e536b3a420ea4d8ee1a:

  bash: Disable custom memory allocator (2015-11-20 15:46:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/fido-backports
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/fido-backports

Martin Jansa (2):
  texinfo: don't create dependency on INHERIT variable
  linux-dtb.inc: drop unused DTB_NAME variable from do_install

Mike Crowe (1):
  allarch: Force TARGET_*FLAGS variable values

Richard Purdie (2):
  layer.conf: Add several allarch dependency exclusions
  layer.conf: Add missing dependency for allarch package
    initramfs-framework

 meta/classes/allarch.bbclass                 |  4 ++++
 meta/conf/layer.conf                         | 11 +++++++++++
 meta/recipes-extended/texinfo/texinfo_5.2.bb |  2 +-
 meta/recipes-kernel/linux/linux-dtb.inc      |  1 -
 4 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.6.3


