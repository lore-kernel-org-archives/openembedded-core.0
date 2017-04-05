Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 8013A77BE1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:05:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id 868562656B5
From: Romain Perier <romain.perier@collabora.com>
To: liezhi.yang@windriver.com
Date: Wed,  5 Apr 2017 17:05:19 +0200
Message-Id: <20170405150521.19160-1-romain.perier@collabora.com>
X-Mailer: git-send-email 2.9.3
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] logrotate: systemd support
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
X-List-Received-Date: Wed, 05 Apr 2017 15:05:43 -0000

SystemD is now supported by upstream logrotate. This set of patches first
bumps the recipe to the last upstream version, that is 3.11.0. Then it adds
support for systemd.

This series is the continuety of the following patch:

1. https://lists.yoctoproject.org/pipermail/yocto/2017-March/035277.html

Note:
The default SRC_URI to be used for tarball is still under discussion on the ML.
Do we use github or downloads.yoctoproject.org ? How do we upload the tarball ?

Romain Perier (2):
  logrotate: Bump to 3.11.0
  logrotate: Add systemd support

 .../recipes-extended/logrotate/logrotate_3.11.0.bb | 78 ++++++++++++++++++++++
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 60 -----------------
 2 files changed, 78 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-extended/logrotate/logrotate_3.11.0.bb
 delete mode 100644 meta/recipes-extended/logrotate/logrotate_3.9.1.bb

-- 
2.9.3


