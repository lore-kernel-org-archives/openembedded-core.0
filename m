Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Sep 2015 15:52:54 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id C5DB076E2E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:52:54 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8520ED4035D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:44 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3B5CDD40050
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from rhein2.am93.sysmocom.de
	(ip18863918.dynamic.kabel-deutschland.de [24.134.57.24])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:43 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:47:33 +0200
Message-Id: <1441727255-16829-1-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [RFC 0/2]
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
X-List-Received-Date: Tue, 08 Sep 2015 15:52:57 -0000

Hi,

our current script for busybox-udhcpc, which handles the
different dhcp-options has some limitations.

The following two patches introducing a default
file so the error proven editing for the script
it self is not needed.

The first patch also handles the modifications for
/etc/resolv.conf .
The second patch deals with setting a default route
or not.

We like to get this upstream and of course
some feedback.

Henning Heinold (2):
  busybox:udhcpc: add option for modify resolv.conf
  busybox:udhcpc: option to skip the default route

 meta/recipes-core/busybox/busybox.inc          |  4 +++-
 meta/recipes-core/busybox/busybox_1.23.2.bb    |  1 +
 meta/recipes-core/busybox/busybox_git.bb       |  1 +
 meta/recipes-core/busybox/files/simple.script  | 30 +++++++++++++++-----------
 meta/recipes-core/busybox/files/udhcpc.default |  5 +++++
 5 files changed, 27 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/udhcpc.default

-- 
1.9.1

