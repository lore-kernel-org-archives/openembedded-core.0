Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 22CDA71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 20:22:01 +0000 (UTC)
Received: by wiae7 with SMTP id e7so7197190wia.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MJ1cBKw8JaZND+0Y3xEuBswh36mI2DeIC9c5PaFNb0A=;
	b=OqCd5r+Uvc7bWdfNiOjE1fY114RlMdWmOu2Gt+kyDacVLaXjGRalhsa/w3bHBh6bzC
	8NJxrR3lI9oQ7OCD7zHNxaS5IAxkY13209qvzxl6QAgCzUEOVf9WW9ftBj/B9GZHnTwK
	p0qn4hEUZn7aMQ2+gSBIzpPhFgxYVSQclzvxamuuZkX0UWsDUY5sf+lnbpH23BIm0kiI
	ko81QDRBK/cyd86rCZE29Ws26tJb5L5A0Rw8tbwY1JAfMSXoloWlOO7uoZbGVf579tMM
	Fx5MsCAcYbglveD9YdD13BHsjKbnv8oRSfWJv2uf1HlDVtc0wDsNbna75ono4v+U5vl7
	HXcA==
X-Received: by 10.180.85.36 with SMTP id e4mr472022wiz.7.1440793321087;
	Fri, 28 Aug 2015 13:22:01 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ne7sm5323172wic.12.2015.08.28.13.21.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 13:21:59 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 13:22:54 -0700
Message-Id: <cover.1440793291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/5] Add 'iw' recipe and include in packagegroup-base
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
X-List-Received-Date: Fri, 28 Aug 2015 20:22:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

iw uses cfg80211/nl80211, which is the way of the future. wireless-tools uses
WEXT, which uses ioctl, which is in deep maintenance mode. See
http://wireless.kernel.org/en/developers/Documentation/Wireless-Extensions.
Also https://wireless.wiki.kernel.org/en/users/Documentation/iw indicates "The
old tool iwconfing, which uses Wireless Extensions interface, is deprecated
and it's strongly recommended to switch to iw and nl80211."

See also the mailing list thread '[OE-core] iw in place of wireless-tools'.

v2 changes: add Upstream-Status to patch, remove duplicate
VIRTUAL-RUNTIME_wireless-tools definition.

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
 ....sh-don-t-use-git-describe-for-versioning.patch | 43 ++++++++++++++++
 .../iw/iw/separate-objdir.patch                    | 57 ++++++++++++++++++++++
 meta/recipes-connectivity/iw/iw_4.1.bb             | 33 +++++++++++++
 .../packagegroups/packagegroup-base.bb             |  2 +-
 5 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 create mode 100644 meta/recipes-connectivity/iw/iw/separate-objdir.patch
 create mode 100644 meta/recipes-connectivity/iw/iw_4.1.bb

-- 
2.2.1


