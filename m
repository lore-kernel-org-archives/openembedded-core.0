Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 572687F36C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3154118149
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:45 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id j7h1c2QODiGI
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 240991816A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DB4F1A097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 021AA1A08E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:40 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id EA1002CE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:40 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x9GGUeFE018420
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:40 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x9GGUeD4018419
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Oct 2019 18:30:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 18:30:24 +0200
Message-Id: <cover.1571243326.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [warrior][PATCH 0/8] Backport relevant changes from Zeus
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
X-List-Received-Date: Wed, 16 Oct 2019 16:30:44 -0000
Content-Transfer-Encoding: 8bit

This patch set contains backports of our changes from Zeus that are
relevant for Warrior.

//Peter

The following changes since commit 79a850a10a4b88a6d20d607b322542f947874323:

  conf/poky: add Fedora 30 and Opensuse Leap 15.1 to supported distributions (2019-10-14 09:49:27 +0100)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/warrior_sync

Niclas Svensson (1):
  devtool: finish: Keep patches ordered when updating bbappend

Peter Kjellerstedt (7):
  meson.bbclass: Remove the MESON_*_ARGS variables
  nativesdk-meson: Remove some unused variables
  devtool: Avoid failure for recipes with S == WORKDIR and no local
    files
  package_rpm.bbclass: Remove a misleading bb.note()
  tzdata: Correct the packaging of /etc/localtime and /etc/timezone
  devtool: finish: Add suppport for the --no-clean option
  lib/oe/lsb: Make sure the distro ID is always lowercased

 meta/classes/meson.bbclass                      | 15 +++++----------
 meta/classes/package_rpm.bbclass                |  5 ++---
 meta/lib/oe/lsb.py                              |  8 ++++----
 .../meson/nativesdk-meson_0.49.2.bb             |  5 -----
 meta/recipes-extended/timezone/tzdata.bb        |  5 +++--
 scripts/lib/devtool/standard.py                 | 17 +++++++++--------
 6 files changed, 23 insertions(+), 32 deletions(-)

-- 
2.21.0


