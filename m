Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5AD6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 17:02:25 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 87A1C20B17
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:07 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Mon, 06 Jun 2016 12:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=CHEHUl9RrB7Ew1LA21gzyX2sy6
	A=; b=XE7NbW+iuCwoYicu2KM34yBXewB2hXQb0/GkchtjuYcAyZR1jPjNRqRe6Y
	cZ0mYr+bGny04ksfYUaXi8j5I3/VVBCyn/Qj5s4GG6NKhxftj1S30GBpBwoblG0V
	N4beCqr5I2BCy+s3OFb8RhPh/MQV7Wef+/T+0iqfFiaCxTbC8=
X-Sasl-enc: BT8jVHfNRhlVN5Ql+PoqRUh1yeYoS5A9Wa+yUlzMvMXG 1465232167
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 06A0AF29F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:06 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 19:55:54 +0300
Message-Id: <cover.1465231939.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 0/4] Update alsa recipes
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
X-List-Received-Date: Mon, 06 Jun 2016 17:02:25 -0000

Here are updates for the alsa 1.1.1 release. alsa-tools 1.1.1 was not
released, because there have been no changes since 1.1.0.

As a bonus, the first patch fixes the BUGTRACKER links that have been
broken for quite some time.

The following changes since commit 554719e3f65e468f89a96d4869766d3ff7a8012e:

  lib/oe/package_manager: adapt for Python 3 (2016-06-05 23:39:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/updates

Tanu Kaskinen (4):
  alsa: update BUGTRACKER links
  alsa-lib: 1.1.0 -> 1.1.1
  alsa-utils: 1.1.0 -> 1.1.1
  alsa-plugins: 1.1.0 -> 1.1.1

 ...fix-appl-pointer-not-correct-when-mmap_co.patch |  2 +-
 ...1-topology-Add-missing-include-sys-stat.h.patch | 35 ----------------------
 .../avoid-including-sys-poll.h-directly.patch      |  2 +-
 .../alsa/{alsa-lib_1.1.0.bb => alsa-lib_1.1.1.bb}  |  7 ++---
 ...ph-include-config.h-from-rate_speexrate.c.patch | 35 ----------------------
 ...alsa-plugins_1.1.0.bb => alsa-plugins_1.1.1.bb} | 10 +++----
 meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb   |  2 +-
 ...cripts_1.1.0.bb => alsa-utils-scripts_1.1.1.bb} |  0
 .../{alsa-utils_1.1.0.bb => alsa-utils_1.1.1.bb}   | 14 ++++++---
 9 files changed, 20 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.0.bb => alsa-lib_1.1.1.bb} (85%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.0.bb => alsa-plugins_1.1.1.bb} (93%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.0.bb => alsa-utils-scripts_1.1.1.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.0.bb => alsa-utils_1.1.1.bb} (89%)

-- 
2.8.1


