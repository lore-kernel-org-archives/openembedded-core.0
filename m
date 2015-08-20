Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4CD73E20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 19:20:36 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so28667960pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 12:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=98sOL6tdy6w3uTqogWEQ29EnPTMf6Fjf75ipoSsjYF4=;
	b=hvkPKxrjRFoXAoJBEeYYbZybeCBkRLnX5pryTtRZbihw/OP5gfxSgTyMW1rn/W3cXL
	7BaPHO8dCcFXUkCioLgVTehstswEO23RJFNXxKOSKe3HHsCf4ortgRCeGWdWSlDrffDk
	d0oNSysTvPct7Mfrk1+FHePQGk8Xt6GFCO2WnDBqUSYYuOP8rQkUcZjxq6pVv7TCd4rP
	I56Itp62+dWLSEMMcBqJVSuwjXFbiLhaSGjmSBAzQqU9LhAob8JCnLSRVjdkGlCK7Rfg
	+ecaGMKEjMPOJBEgu11VQQJwGEAQfRPmv/QwIWPLGGMk3WlyhunzevSN/sEr0tRkYJVD
	vd7Q==
X-Received: by 10.68.203.42 with SMTP id kn10mr9471717pbc.43.1440098436439;
	Thu, 20 Aug 2015 12:20:36 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ob4sm5203661pbb.40.2015.08.20.12.20.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 12:20:35 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 5B3A1FC07A4; Thu, 20 Aug 2015 12:20:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 12:20:31 -0700
Message-Id: <cover.1440098114.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/7] Dizzy-next for 1.7.3
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
X-List-Received-Date: Thu, 20 Aug 2015 19:20:39 -0000

Please consider these changes for inclusion to the 1.7.3 update.

The following changes since commit e8da5133c2efd3bc4c5f41bb27207c053bc2360d:

  runqueue: Add message to explain the problem if diffsigs multiple tasks don't exist (2015-08-20 12:11:24 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Richard Purdie (2):
  fetch2: Extend mirroruri handlling
  sstate: Use SSTATE_DIR for FILESPATH

Saul Wold (2):
  grub-efi: Use the backport patch from grub
  grub-efi: Add trailing \ missed in last patch

Sona Sarmadi (3):
  bind9.9.5: CVE-2015-5477
  qemu: CVE-2014-7840
  qemu-vnc: CVE-2014-7815

 bitbake/lib/bb/fetch2/__init__.py                  |  1 +
 meta/classes/sstate.bbclass                        |  4 +-
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
 .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
 .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57 ++++++++++++++++++++++
 .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  2 +
 8 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch

-- 
1.9.1


