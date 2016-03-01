Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4824B6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 04:18:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u214IhXg029590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:18:43 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Feb 2016 20:18:42 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Feb 2016 22:18:40 -0600
Message-ID: <cover.1456805735.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/1] RFC - Enable GCC 5.3 transactional support
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
X-List-Received-Date: Tue, 01 Mar 2016 04:18:42 -0000
Content-Type: text/plain

GCC has supported -fgnu-tm, libitm and __transaction_stomic [and related] since
GCC 4.7.  OE however has not activated the functionality.  I'm starting to see some
data base programs (and RPM) that can make use of the functionality to create better
thread-safe code.

This includes a patch to GCC.  I've verified it is working based on the recent rpm
5.4.16 work.  It also should not expand the size of the target unless the user adds
the libitm support to their system.

I'd recommend we consider this patch to enable the additional support.

The following changes since commit 8b7ff912ccaadfc0f355642f2a9f99c334a61253:

  db: remove the NO_UPDATE_REASON and replace it a comment about RPM (2016-02-29 22:13:42 -0600)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib mhatle/gcc-libitm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/gcc-libitm

Mark Hatle (1):
  gcc: Add support for atomic opertions (libitm) where available

 meta/recipes-devtools/gcc/gcc-5.3.inc     |  2 ++
 meta/recipes-devtools/gcc/gcc-runtime.inc | 22 +++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.5.0


