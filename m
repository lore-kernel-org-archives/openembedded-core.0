Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id E02F765D34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 21:35:21 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 87B5C2232CC0;
	Tue, 24 Jun 2014 23:35:20 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CA7102232CBF;
	Tue, 24 Jun 2014 23:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.2
Received: from localhost.localdomain (f052237089.adsl.alicedsl.de
	[78.52.237.89]) by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Tue, 24 Jun 2014 23:35:19 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 23:34:44 +0200
Message-Id: <1403645687-19655-1-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 0/3][for-dora] backport of the perf enhencements
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
X-List-Received-Date: Tue, 24 Jun 2014 21:35:23 -0000

The following patches are backports of the perf enhencements.
They are not critical, but can reduce imagesizes
for analysing performance issues.

Henning Heinold (3):
  perf: fix broken shell comparsion in do_install
  perf: split packging
  perf: add slang to the dependencies

 meta/recipes-kernel/perf/perf.bb | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
1.9.1

