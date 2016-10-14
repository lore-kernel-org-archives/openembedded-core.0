Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9147071A21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 10:08:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9EA8cm4004542
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 03:08:38 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Oct 2016 03:08:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2016 03:08:35 -0700
Message-ID: <cover.1476439242.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/2] fixes for mips64-o32
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
X-List-Received-Date: Fri, 14 Oct 2016 10:08:37 -0000
Content-Type: text/plain

The following changes since commit d976454406adea2edd738096227ad53d600783ad:

  source-highlight: use with-boost-libdir (2016-10-12 20:17:35 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/mips
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/mips

Robert Yang (2):
  arch-mips.inc: remove duplicates from PACKAGE_ARCHS
  insane.bbclass: fix package_qa_check_arch() for mips64-o32

 meta/classes/insane.bbclass                  | 10 ++++++----
 meta/conf/machine/include/mips/arch-mips.inc |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.9.0


