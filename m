Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 5365A6B5A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 21:21:40 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B497F2232CC0;
	Mon,  9 Jun 2014 23:21:37 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 753492232CBE;
	Mon,  9 Jun 2014 23:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.2
Received: from localhost.localdomain (e178184227.adsl.alicedsl.de
	[85.178.184.227]) by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Mon,  9 Jun 2014 23:21:36 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 23:21:26 +0200
Message-Id: <1402348889-26065-1-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 0/3] perf packaging improvements and fixes
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
X-List-Received-Date: Mon, 09 Jun 2014 21:21:47 -0000

This series improves the packaging of perf,
by splitting it up. So only the scripts
which needs python, perl or bash have the needed dependencies.

One minor bug in shell comparsion was fixed.

Slang was added for tui so it will work with older and newer kernels.

I tested the series for perf top only, which works on
qemuarm.

The series was sponsored by sysmocom and are mentioned
according to http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087190.html

Henning Heinold (3):
  perf: add slang to the dependencies
  perf: fix broken shell comparsion in do_install
  perf: split packging

 meta/recipes-kernel/perf/perf.bb | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
1.9.1

