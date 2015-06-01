Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id C40467567B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 14:13:15 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so25776298pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jun 2015 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AbiPWms4oLOXhiJqJhhOga+xiWU94aJva8YQagYggLQ=;
	b=V/C6YZVvRpBNDSnCEQSB/L/EoKZzk1KIghc07ZK1RGQYYHDAy3LW7flB/BPuMfF4rB
	bd3AO9qTCVqyJ8yZsEBEkzneQ4r8u5aLTWVvrWwzbetKtEmQGxPjOlNNssSMW/V3Dniv
	G5idUZZwXJrwYKFVQnDOwIr2hKccrm4QxGwpVRUyLehC3WeAk0vYykTSTzgZz3k70Ygm
	K8bxxFusKhoVF2+kx1/F6bXToAk+Xz05ol/iG15I1DTUVM5XZZ65iPxsr1kBQZifiyM5
	dx1iwKFYrYoJ/1zbYCk/EhgNKOOTI6nqpEuFofVk8O9mtCKkNhgBHNsCoq8RjKHDNQdZ
	7Mkw==
X-Received: by 10.68.110.3 with SMTP id hw3mr3360458pbb.128.1433167996240;
	Mon, 01 Jun 2015 07:13:16 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	fk10sm14740575pab.18.2015.06.01.07.13.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Jun 2015 07:13:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jun 2015 07:12:55 -0700
Message-Id: <cover.1433167180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/2] Gnutls 3.4.1 update
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
X-List-Received-Date: Mon, 01 Jun 2015 14:13:17 -0000

The new version of Gnutls removed several depricated API's that some packages use. 

core-image-minimal builds but not sato or oe-core world. I am providing this so those who want can test their apps with these changes.

I am working on neon.

The following changes since commit 40bc715b77f24f40fedebd4e5277c05bd7ff348b:

  tcmode-default: Test gcc 5.1 (2015-05-31 10:02:30 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/gnutls-update
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/gnutls-update

Armin Kuster (2):
  nettle: update package to 3.1.1 version.
  gnutls: update to 3.4.1

 meta/recipes-support/gnutls/gnutls.inc             |  3 ++-
 .../gnutls/configure.ac-fix-sed-command.patch      | 29 ++++++++++------------
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ------
 meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 ++++++
 .../nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb}    | 12 ++++-----
 5 files changed, 29 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb} (48%)

-- 
2.3.5


