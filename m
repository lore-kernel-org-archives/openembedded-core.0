Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1A16E7718E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 14:50:03 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 682781866; Tue, 02 Feb 2016 09:50:04 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQcHI-0003we-Jp; Tue, 02 Feb 2016 14:50:00 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQcHI-00025g-IG; Tue, 02 Feb 2016 14:50:00 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 14:49:44 +0000
Message-Id: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 02 Feb 2016 14:50:04 -0000

bitbake.conf currently contains:

EXTRA_OEMAKE = "-e MAKEFLAGS="

Back in November[1] I submitted a patch that allowed this default
value to be overridden without affecting anything else that was
appended to it. I received feedback that the default value was no
longer useful and that it would be good to get rid of it.

So, this patch series fixes the two recipes that still appear to be
relying on the previous default and then makes the default
EXTRA_OEMAKE = "". After these changes core-image-sato builds
successfully for me (although I have not run it.)

Mike.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112393.html

