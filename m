Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0GNr-0002oL-BO
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:49:11 +0100
Received: by gxk3 with SMTP id 3so472678gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Mk/50xdPoDrttCY2BPyCr/PGK3DBf1KmU+lLmKjQzTg=;
	b=f9nVmbR9RaSj/uHW4fCis+AcEkd68w2GX3qh6HWn2dkWyQoLWfkrHKlCuqFwUGyf3a
	LpPxH9EtG6t3exaVF53eNV12oXsZTP6TTO9s9jc+mwD8iHbJo8bf++fqYKO5F8v4irbh
	FnGPJgim0UN8s2EjsfW2qFi+TUAqG/YbzObrc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kXnYZes0UeQdTUel8YFHY2tldeRK57VmiD7v5q1D+D7PXZfTDGEI1TlLIgZJlzsWRq
	0rtOfAYyzgQkyR/bBQQsz2NnTxh/CyMSKgnkO9kmA0mnAb9PuYav9bwkZXGiCrdTaR27
	SoVxXxEcwLlcElYCycuSbuFIptpnRbz60O9a0=
Received: by 10.151.136.2 with SMTP id o2mr36989ybn.204.1300378755197;
	Thu, 17 Mar 2011 09:19:15 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:14 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:18:58 -0700
Message-Id: <cover.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 00/12] Pull request - some sync bits from OE
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
X-List-Received-Date: Thu, 17 Mar 2011 16:49:11 -0000

From: Chris Larson <chris_larson@mentor.com>

This is primarily a sync of a couple OE features, along with a few minor
changes to ensure those features work fine for us.  More OE sync bits will be
forthcoming.  These certainly need review.  In particular, I haven't gotten
any feedback on how the poky folk feel about this approach to IMAGE_FEATURES
relative to their own, so please do comment on that, if you would :)

Pull URL: https://github.com/kergoth/oe-core
  Branch: oe-sync
  Browse: https://github.com/kergoth/oe-core/commits/oe-sync

Thanks,
    Chris Larson <chris_larson@mentor.com>
---


Chris Larson (12):
  oe.utils: add bb, bb.data imports
  oe.patch: add missing imports
  oe.path: sync up with current OE
  oe.utils: add inherits (sync from OE)
  base.bbclass: switch to current OE's imports handling
  Shift oe import logic out of the event handler
  Implement variable typing (sync from OE)
  oe.packagegroup: add code for package groups (sync from OE)
  Move packagedata code into oe.packagedata (sync from OE)
  packagedata: don't choke on empty PACKAGES
  image.bbclass: switch to OE's IMAGE_FEATURES
  Use oe.data for IMAGE_FEATURES

 meta/classes/base.bbclass                          |   44 ++++----
 meta/classes/image.bbclass                         |   41 +++++++-
 meta/classes/package.bbclass                       |    4 +-
 meta/classes/package_rpm.bbclass                   |    3 +-
 meta/classes/packagedata.bbclass                   |   68 +------------
 meta/classes/poky-image.bbclass                    |   88 ++++------------
 meta/classes/typecheck.bbclass                     |   12 ++
 meta/conf/bitbake.conf                             |    1 +
 meta/lib/oe/data.py                                |   13 +++
 meta/lib/oe/maketype.py                            |   97 ++++++++++++++++++
 meta/lib/oe/packagedata.py                         |  107 ++++++++++++++++++++
 meta/lib/oe/packagegroup.py                        |   29 ++++++
 meta/lib/oe/patch.py                               |    2 +
 meta/lib/oe/path.py                                |   21 +++--
 meta/lib/oe/test_types.py                          |   62 +++++++++++
 meta/lib/oe/types.py                               |  104 +++++++++++++++++++
 meta/lib/oe/utils.py                               |    6 +
 meta/recipes-core/images/poky-image-minimal-dev.bb |    2 +-
 meta/recipes-extended/images/poky-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/poky-image-lsb-sdk.bb |    2 +-
 meta/recipes-sato/images/poky-image-sato-dev.bb    |    2 +-
 meta/recipes-sato/images/poky-image-sato-sdk.bb    |    2 +-
 22 files changed, 544 insertions(+), 168 deletions(-)
 create mode 100644 meta/classes/typecheck.bbclass
 create mode 100644 meta/lib/oe/data.py
 create mode 100644 meta/lib/oe/maketype.py
 create mode 100644 meta/lib/oe/packagedata.py
 create mode 100644 meta/lib/oe/packagegroup.py
 create mode 100644 meta/lib/oe/test_types.py
 create mode 100644 meta/lib/oe/types.py

-- 
1.7.2.3



