Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QqnYl-0000V0-4Y
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:45:35 +0200
Received: by ywe9 with SMTP id 9so43931ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 07:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2pKXdvZB1c03AzrlhhLR/QXzuiHbYQNvSVBBePv7IUI=;
	b=emoGhBKXQtgqWgXPvWFEnyEEe5wgJ37D/vtkmwBrBq5jt2RGNPoc7xYrTGHwHXkPCq
	daFOXndCrXScZ95ywfnfgUhV3CxYKkHuqUDdI6S02gkBdQNYtWQ60Wo25a0TuoCnKUyt
	f/AI6I9Fc+IuJxyP53b9czhzvzv5OP1JY0A/Y=
Received: by 10.150.47.40 with SMTP id u40mr5375820ybu.161.1312900865204;
	Tue, 09 Aug 2011 07:41:05 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id w1sm6579291yhi.65.2011.08.09.07.41.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 07:41:01 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 07:40:51 -0700
Message-Id: <cover.1312900463.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] Implement IMAGE_FEATURES in a general way
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2011 14:45:35 -0000

From: Chris Larson <chris_larson@mentor.com>

This is a second attempt at this, scrapping the class changes from the previous
request and redoing it in a less invasive way, and breaking up the changes into
3 pieces. This implements IMAGE_FEATURES. IMAGE_FEATURES is analagous to
DISTRO_FEATURES and MACHINE_FEATURES, for root filesystem construction.
Currently, the only supported features are any defined package groups, as used
by the oe.packagegroup python module.

Example usage:

    PACKAGE_GROUP_myfeature = "vim iptables"
    IMAGE_FEATURES += "myfeature"

This also makes the dev-pkgs and dbg-pkgs features general, and adds a doc-pkgs
feature.


The following changes since commit 866a34dd80228a0c10cbea5d7715e2acd6cea131:

  uclibc_0.9.32: Sync mount.h from eglibc (2011-08-09 15:17:45 +0100)

are available in the git repository at:
  git://github.com/kergoth/oe-core feature/image_features

go here for github's branch comparison interface:
  https://github.com/kergoth/oe-core/compare/master...feature%2Fimage_features

Chris Larson (3):
  image: implement IMAGE_FEATURES
  image: add support for generally useful {dev,doc,dbg}-pkgs features
  core-image: adjust to use the new IMAGE_FEATURES support

 meta/classes/core-image.bbclass |   77 +++++++++------------------------------
 meta/classes/image.bbclass      |   47 ++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 63 deletions(-)

-- 
1.7.4.1



