Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB256DF66
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 07:53:06 +0000 (UTC)
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id CF8C240083;
	Thu,  5 Dec 2013 07:22:40 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 08:52:57 +0100
Message-Id: <1386229978-6747-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] boost: updating to 1.55.0
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
X-List-Received-Date: Thu, 05 Dec 2013 07:53:07 -0000

Dear oe-core mailing list, Dear Saul,

As one of the main users of the boost recipe with the meta-ros layer,
I created a patch to update boost from version 1.54.0 to 1.55.0.

The changes in the patch is mostly straight-forward and described in the
commit message of the patch. During my inspection, I was wondering about the
status of the patch "arm-intrinsics.patch".

The patch has been reported as Backport by Qing He in 2010, but I looked
into the file of the current SVN repository and could not find the changes
applied by this patch in the repository.

Could someone in touch with the boost development community provide the patch
to the boost developers, and adjust the status of the patch in oe-core
according to the discussion with the boost developers?

Yours sincerely,

Lukas Bulwahn, BMW Car IT GmbH


Lukas Bulwahn (1):
  boost: updating to 1.55.0

 ...bjam-native_1.54.0.bb => bjam-native_1.55.0.bb} |  0
 .../boost/{boost-1.54.0.inc => boost-1.55.0.inc}   |  4 +-
 meta/recipes-support/boost/boost_1.54.0.bb         |  7 ---
 meta/recipes-support/boost/boost_1.55.0.bb         |  4 ++
 .../files/boost-1.54.0-thread-link_atomic.patch    | 59 ----------------------
 meta/recipes-support/boost/files/glibc.patch       | 26 ----------
 6 files changed, 6 insertions(+), 94 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.54.0.bb => bjam-native_1.55.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.54.0.inc => boost-1.55.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost_1.54.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.55.0.bb
 delete mode 100644 meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
 delete mode 100644 meta/recipes-support/boost/files/glibc.patch

-- 
1.8.3.2


