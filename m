Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 190216057A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:07:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3D27vFo006140
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 12 Apr 2016 19:07:57 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Apr 2016 19:07:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@windriver.com>,
	<raj.khem@gmail.com>
Date: Tue, 12 Apr 2016 19:07:55 -0700
Message-ID: <cover.1460513113.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1] linux-yocto-tiny: update SRCREV_meta to support /proc/sys
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
X-List-Received-Date: Wed, 13 Apr 2016 02:07:59 -0000
Content-Type: text/plain

Hi RP,
I'm sorry to say that I didn't send this yesterday was because I have to
wait until the kernel's part get merged (now it is done), otherwise I
can't have the correct SRCREV.

// Robert

The following changes since commit b3afe7d9bd25a943e947de3ec064ea245173c5a8:

  archiver: Ensure sstate-inputdir directory is created (2016-04-12 22:46:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sys
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sys

Robert Yang (1):
  linux-yocto-tiny: update SRCREV_meta to support /proc/sys

 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.8.0


