Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 41B9377D2F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 10:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B7F852E3F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5UsLLsLM9gS9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 8F3762E3EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79ED51E085
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F1691E084
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 6354AEA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v4GAuL6B013123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v4GAuL9n013122
	for openembedded-core@lists.openembedded.org;
	Tue, 16 May 2017 12:56:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 12:56:18 +0200
Message-Id: <cover.1494932131.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/2] Allow oe-pkgdata-util package-info to display more info
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
X-List-Received-Date: Tue, 16 May 2017 10:56:22 -0000

After a build in our autobuilder, we use `oe-pkgdata-util package-info
-f package.manifest` to store a file with information about each
installed package. This is typically used to compare builds later
on. Since not every difference to a package is explained by its
version, we have found it beneficial to also include the SRC_URI in
the generated file.

This patch set adds SRC_URI to the pkgdata that is stored for each
package, and adds a new option to oe-pkgdata-util package-info,
-e <var>, that can be used to display extra variables from the
pkgdata.

//Peter

The following changes since commit 0fcbb4d0ec26ef24db78190dcdc5568af3beaa14:

  GNU_MIRROR: switch from ftp to https (2017-05-11 16:56:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/oe-pkgdata-util_extra
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-pkgdata-util_extra

Peter Kjellerstedt (2):
  package.bbclass: Add SRC_URI to pkgdata
  oe-pkgdata-util: package-info: Allow extra variables to be displayed

 meta/classes/package.bbclass |  1 +
 scripts/oe-pkgdata-util      | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.12.0


