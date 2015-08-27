Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 089DB60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 18:47:29 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so868193wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yi0srTvPYPDPNt7I8r8KaLxjAj93vsbn+IaY1Kd6ZcM=;
	b=ewAg6m2dev2PELg62+TtKkHGP5UdE+z4SUvbLTGNKchAl1Mz+pebudKZH8N4m5Bokw
	AHXuIul8vLB28CHt+vDYKvmFoj03Abs0m189ciTTCKbf9FazktYPxIhilJ6HvBd+CiJG
	HKiDOF5rlRG+E1D/9YBWLBj3NztCtccx2YN/ukj4SxjC5tLVAZL1cK/zTOnoyJ2gfzBL
	uGCbfFScoxQgMHWfVHtih/5HxILg++52J4OO2MxHIwA47VML+Cj8ayiHVfl1H46qAMYf
	ESzE46qTjSokWYacH9qgnvyMTHkFzlG7Y1XfFO0qBmy8lXU4cfGQlRaXBq/+K3itrCdF
	Osdg==
X-Received: by 10.180.39.229 with SMTP id s5mr100806wik.70.1440701249439;
	Thu, 27 Aug 2015 11:47:29 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id x6sm68821wiy.6.2015.08.27.11.47.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 11:47:27 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 11:48:19 -0700
Message-Id: <cover.1440700983.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/5] Add 'iw' recipe and include in packagegroup-base
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
X-List-Received-Date: Thu, 27 Aug 2015 18:47:30 -0000

From: Christopher Larson <chris_larson@mentor.com>

iw uses cfg80211/nl80211, which is the way of the future. wireless-tools uses
WEXT, which uses ioctl, which is in deep maintenance mode. See
http://wireless.kernel.org/en/developers/Documentation/Wireless-Extensions.
Also https://wireless.wiki.kernel.org/en/users/Documentation/iw indicates "The
old tool iwconfing, which uses Wireless Extensions interface, is deprecated
and it's strongly recommended to switch to iw and nl80211."

See also the mailing list thread '[OE-core] iw in place of wireless-tools'.

The following changes since commit f07045fcae859c902434062d1725f1348f42d1dd:

  oeqa/oetest.py: add better package search for hasPackage() (2015-08-26 08:26:37 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core add-iw
  https://github.com/kergoth/openembedded-core/tree/add-iw

Christopher Larson (5):
  iw: add recipe from meta-networking
  iw: inherit pkgconfig
  iw: obey our target path variables
  iw: support and enable separate build dir
  packagegroup-base: pull in iw as well as wireless-tools

 meta/conf/distro/include/default-providers.inc     |  1 +
 ....sh-don-t-use-git-describe-for-versioning.patch | 43 +++++++++++++++++
 .../iw/iw/separate-objdir.patch                    | 55 ++++++++++++++++++++++
 meta/recipes-connectivity/iw/iw_4.1.bb             | 33 +++++++++++++
 .../packagegroups/packagegroup-base.bb             |  6 ++-
 5 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 create mode 100644 meta/recipes-connectivity/iw/iw/separate-objdir.patch
 create mode 100644 meta/recipes-connectivity/iw/iw_4.1.bb

-- 
2.2.1


