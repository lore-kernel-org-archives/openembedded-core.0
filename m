Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A5C2B605C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 97CB62E2BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id q2q79TlSBjts
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id E0C2A2E2AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBE361E07A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0CCB1E078
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id B4C1F4C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u8UJrgba011107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:53:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u8UJrgI1011106
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2016 21:53:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 21:53:39 +0200
Message-Id: <cover.1475265162.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/1] Avoid unnecessary dependency on awk in devtool deploy-target
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
X-List-Received-Date: Fri, 30 Sep 2016 19:53:44 -0000

After updating to Krogoth, our developers were faced with the
following error message when using devtool deploy-target:

/tmp/devtool_deploy.sh: line 23: awk: not found

This is of course due to the fact that we do not have awk installed in
our products. However, the use of awk in devtool deploy-target is
completely unnecessary. It is already using sed, and sed is fully
capable of extracting the information that awk was used for.

//Peter

The following changes since commit a75b79a9e9d76db8f75af64c3792c7a1bbfd15b8:

  genericx86-64.conf: Add SERIAL_CONSOLES_CHECK = "ttyS0" (2016-09-30 16:52:22 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/devtool-minus-awk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/devtool-minus-awk

Peter Kjellerstedt (1):
  devtool: deploy-target: Avoid unnecessary dependency on awk on the
    target

 scripts/lib/devtool/deploy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.9.0


