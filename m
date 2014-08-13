Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 434 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Aug 2014 17:46:31 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 24F2065E0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id EC3982E45B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id tJ6QaOCMEPZK
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id C25AA2E457
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A3D741465
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 988F8340
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 8DA0D34005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHkQWl003069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:26 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHkP8Z003053
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:46:25 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:46:21 +0200
Message-Id: <cover.1407951828.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] Allow libgcrypt to configure again
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
X-List-Received-Date: Wed, 13 Aug 2014 17:46:35 -0000

We have had troubles building libgcrypt for a while. It turned out to
be because needed m4 files were removed which caused autoreconf to
fail.

//Peter

The following changes since commit 6882d2d9993c8655a292c93e84ea01b4738a700d:

  yocto-project-qs, ref-manual: Added 'socat' package to essentials. (2014-08-12 13:50:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/libgcrypt
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/libgcrypt

Peter Kjellerstedt (1):
  libgcrypt: Do not remove m4 files so aggressively

 meta/recipes-support/libgcrypt/libgcrypt.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.0


