Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id A9F6D60653
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:26:28 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd20so2006064obb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=oA55OMjicrtHHA9P8M+uEUQQShe3tBW/O/4SCGWGU84=;
	b=srWcezUsFkqWsXm3JH+ZghNxQk4YZg3MeJk60jox4xG7aL3cRvY0t9BKlgEZaRCyj5
	RKfCIRFdvxlEmmPyRnyQJ+2P2w+svFXa60F/0qa+J6rHXAOM76P0PUp6/jVMpM0llBbn
	bhKpmgpFnPCHql0LqVfcp2foIVf5//m/ESYom74SlPvcj7PptvlPyD5EH0lwBFsuP+hN
	H0RhZd6u7Gyumg6ce1z+3vMmADqeWrN4tNjuYZijHRqJLQf3a6d1smt+lBLte7IW714B
	0Y8SqV3SAklXcEwi5cSe6tLuQ5LxhM2C8oidKKJLegURa5HWyeSMupgKtMK/kHPPVBxk
	gAaQ==
X-Received: by 10.60.141.2 with SMTP id rk2mr5158533oeb.69.1369967189130;
	Thu, 30 May 2013 19:26:29 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id sa2sm14397164oeb.1.2013.05.30.19.26.26
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 19:26:27 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 19:26:24 -0700
Message-Id: <cover.1369967097.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/5] Add 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Fri, 31 May 2013 02:26:28 -0000

From: Christopher Larson <chris_larson@mentor.com>

This makes rpcbind, quota, systemd, portmap, and nfs-utils obey the same tcp
wrappers PACKAGECONFIG which xinetd obeys.

The following changes since commit aa500de527b3afdac8765d68f9cd1c2e09149477:

  hicolor-icon-theme: keep inherited dependencies and switch to gnomebase (2013-05-30 22:31:33 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git tcp-wrappers-packageconfig
  https://github.com/kergoth/oe-core/tree/tcp-wrappers-packageconfig

Christopher Larson (5):
  rpcbind: obey 'tcp-wrappers' PACKAGECONFIG
  quota: obey 'tcp-wrappers' PACKAGECONFIG
  systemd: obey 'tcp-wrappers' PACKAGECONFIG
  portmap: obey 'tcp-wrappers' PACKAGECONFIG
  nfs-utils: obey 'tcp-wrappers' PACKAGECONFIG

 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb | 5 ++++-
 meta/recipes-connectivity/portmap/portmap_6.0.bb       | 5 ++++-
 meta/recipes-core/systemd/systemd_204.bb               | 5 +++--
 meta/recipes-extended/quota/quota_4.01.bb              | 3 +++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb         | 3 +++
 5 files changed, 17 insertions(+), 4 deletions(-)

-- 
1.8.3


