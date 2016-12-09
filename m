Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27B077199A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 19:28:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB9JS19E021492
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 9 Dec 2016 11:28:01 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 9 Dec 2016 11:28:00 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 9 Dec 2016 14:27:58 -0500
Message-ID: <cover.1481311536.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel-yocto: yet another set of changes
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
X-List-Received-Date: Fri, 09 Dec 2016 19:28:02 -0000
Content-Type: text/plain

In the never ending stream of kernel pull requests, we have an update
to the latest 4.8-rt from Paul Gortmaker.

And as it turns out, my effor in making sure that meta data errors were
trapped was a bit to simple. I do in fact need the set +e to allow some
of the other checks in the routine to follow else clauses.

So there's a patch in this pull that puts the +e back, and I explicitly
trap and error if a meta data command fails.

Cheers,

Bruce

The following changes since commit 36e178a62f04e7f2611b26964efe46b9af97189a:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.8 (2016-12-09 08:54:07 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/4.8: update to -rt7
  kernel-yocto: explicitly trap subcommand errors

 meta/classes/kernel-yocto.bbclass                 | 7 +++++++
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 4 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.5.0


