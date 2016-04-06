Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8797F65CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 18:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 3DF7F2E145
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id aGlIr-SKhonA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 970452E118
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 7BBFA121D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 70AC5DFB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 65FAEFD1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:16:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u36IGhEP004038
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Apr 2016 20:16:43 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u36IGhBm004037
	for openembedded-core@lists.openembedded.org;
	Wed, 6 Apr 2016 20:16:43 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 20:16:41 +0200
Message-Id: <cover.1459966555.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Correct the packaging of libnl
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
X-List-Received-Date: Wed, 06 Apr 2016 18:16:46 -0000

This corrects the packaging of libnl so that the modules that belong
in libnl-cli actually ends up there and not in libnl-dev.

//Peter

The following changes since commit c1157400ab6f5cb0f057bd07e55c4790499107ed:

  bitbake: fetch2/git.py: remove .indirectiondir workaround (2016-04-06 10:29:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/libnl
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/libnl

Peter Kjellerstedt (1):
  libnl: Make sure files end up in libnl-cli as they should

 meta/recipes-support/libnl/libnl_3.2.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


