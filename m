Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8B5771B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 09:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 6C4FD2E241
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4Gtfzbv82kwV
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id B9F7D2E234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 9E29D1AD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 9321717EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 87A78100B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4V9pocQ014494
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 11:51:50 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4V9po5c014490
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2016 11:51:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 11:51:48 +0200
Message-Id: <cover.1464688273.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Correct tclConfig.sh in the sysroots
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
X-List-Received-Date: Tue, 31 May 2016 09:51:54 -0000

Restore the contents of tclConfig.sh in the sysroots so that
postgresql can build again.

//Peter

The following changes since commit fcc2c3c4b3ca08528722442c90acd27e89291405:

  yocto-bsps: Update to 4.1 to include musb fixes (2016-05-30 15:58:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/tcl
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/tcl

Peter Kjellerstedt (1):
  tcl: Only set BINCONFIG_GLOB for target builds

 meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


