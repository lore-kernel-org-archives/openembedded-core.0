Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 77714606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:55:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id AF73426BB85
From: Romain Perier <romain.perier@collabora.com>
To: liezhi.yang@windriver.com
Date: Tue, 11 Jul 2017 08:46:04 +0200
Message-Id: <20170711064606.8941-1-romain.perier@collabora.com>
X-Mailer: git-send-email 2.11.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/2] logrotate: systemd support
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
X-List-Received-Date: Tue, 11 Jul 2017 06:55:44 -0000

systemd is now supported by upstream logrotate. This set of patches first
bumps the recipe to the last upstream version, that is 3.11.0. Then it
adds support for systemd.

This series is the continuety of the following patches:

1. https://lists.yoctoproject.org/pipermail/yocto/2017-March/035277.html
2. https://lists.yoctoproject.org/pipermail/yocto/2017-April/035497.html 

Changes in v2:
- Bumped logrotate to 3.12.3
- Refreshed patches (did not apply)
- Fixed systemd support in the recipe: don't break sysvinit integration,
  keep systemd service enabled by default

Romain Perier (2):
  logrotate: Bump to 3.12.3
  logrotate: Add systemd support

 ...upport-system-dates-back-to-the-year-1970.patch | 27 -------
 .../logrotate/act-as-mv-when-rotate.patch          | 32 ++++----
 .../logrotate/logrotate/update-the-manual.patch    | 16 ++--
 .../recipes-extended/logrotate/logrotate_3.12.3.bb | 85 ++++++++++++++++++++++
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 71 ------------------
 5 files changed, 111 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch
 create mode 100644 meta/recipes-extended/logrotate/logrotate_3.12.3.bb
 delete mode 100644 meta/recipes-extended/logrotate/logrotate_3.9.1.bb

-- 
1.8.3.1


