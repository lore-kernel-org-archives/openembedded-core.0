Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9715877E7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 02:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id BEEFE2E652
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8TmbJ7P+2FKB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id F1D832E64C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF2001E07B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D42F71E077
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C871C329B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3E2eKZX013784
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3E2eKwp013783
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Apr 2017 04:40:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 04:39:52 +0200
Message-Id: <cover.1492135840.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/2] Allow postinst functions to be verbose
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
X-List-Received-Date: Fri, 14 Apr 2017 02:40:20 -0000

This enables tracing of the postinst functions created in base-passwd
and useradd.bbclass if BB_VERBOSE_LOGS is enabled. I found this
extremely useful during verification of the useradd functionality,
especially as there otherwise is absolutely nothing in the logs of why
a failure in a postinst function happened.

I also simplified useradd_sysroot_sstate() by only having the code to
create the postinst files once.

Feel free to squash these commits with the "base-passwd/useradd:
Various improvements to useradd with RSS" commit if you prefer.

//Peter

The following changes since commit 79ac98550f0aa25940404a9805c12744f7047c76:

  base-passwd/useradd: Various improvements to useradd with RSS (2017-04-14 00:03:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/verbose_postinst
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/verbose_postinst

Peter Kjellerstedt (2):
  useradd.bbclass: Make postinst functions verbose if BB_VERBOSE_LOGS is
    set
  base-passwd: Make the postinst function verbose if BB_VERBOSE_LOGS is
    set

 meta/classes/useradd.bbclass                        | 11 +++++------
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.12.0


