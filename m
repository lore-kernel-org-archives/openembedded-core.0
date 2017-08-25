Return-Path: <tobias.hagelborn@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0663477C31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 191872E11C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:11:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dOV9Eq-sz8MO
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:11:53 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 5A67E2E07B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:11:53 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 473F51A070
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:11:53 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C8311A06B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:11:53 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:11:53 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 30FF41D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:11:53 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 25 Aug 2017 11:11:53 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 11:11:37 +0200
Message-ID: <1503652300-5161-1-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v5 0/3] devtool deploy-target --strip option
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
X-List-Received-Date: Fri, 25 Aug 2017 09:11:54 -0000
Content-Type: text/plain

New devtool deploy-target option --strip which enables deploying
stripped binaries, saving some space on target.

Updates in v5:
- Updated according to feedback from Richard Purdie
  - Separate lint issue fixes
- Verified devtool-deploy-target with poky-master

[YOCTO #11227]



Tobias Hagelborn (3):
  package.py: Fix some lint errors
  package.py: strip_execs: Support for .ko modules
  devtool: deploy-target: Support stripped libs and execs

 meta/lib/oe/package.py        | 42 +++++++++++++++++++++++-------------------
 scripts/lib/devtool/deploy.py | 33 +++++++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 23 deletions(-)

-- 
2.1.4


