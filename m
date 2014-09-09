Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEF6E712EC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 10:16:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s89AG8LE004025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Sep 2014 03:16:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 03:16:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 03:16:07 -0700
Message-ID: <cover.1410257258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] rootfs.py: fix PRE/POSTPROCESS_COMMANDS for rpm and deb
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
X-List-Received-Date: Tue, 09 Sep 2014 10:16:10 -0000
Content-Type: text/plain

Hello,

This patch fixes RPM_PREPROCESS_COMMANDS and RPM_POSTPROCESS_COMMANDS
(the similar to deb).

Btw., there is another ROOTFS_POSTINSTALL_COMMAND, only the ipk's
install runs it atm, what's the difference between
ROOTFS_POSTINSTALL_COMMAND and ROOTFS_POSTPROCESS_COMMAND? Do we need
rpm and deb run it, please ?

// Robert

The following changes since commit e72aac2ae9e5fce1715fa04b7e94034fd06892d9:

  alsa-lib: libasound should runtime depends on alsa-conf (2014-09-03 11:30:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/post
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/post

Robert Yang (1):
  rootfs.py: fix PRE/POSTPROCESS_COMMANDS for rpm and deb

 meta/lib/oe/rootfs.py |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
1.7.9.5


