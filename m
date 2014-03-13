Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBA36F7D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 02:14:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2D2ETuf015581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Mar 2014 19:14:29 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 12 Mar 2014 19:14:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Mar 2014 10:14:19 +0800
Message-ID: <cover.1394676641.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: msm@freescale.com, saul.wold@intel.com
Subject: [PATCH 0/1]eglibc: tweak glibc.fix_sqrt2.patch for eglibc-2.19
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
X-List-Received-Date: Thu, 13 Mar 2014 02:14:41 -0000
Content-Type: text/plain

The following changes since commit 5f81d9d1fa537445d5da49e12de1e16300e94552:

  bitbake: runqueue: Use SIGCHLD instead of polling waitpid (2014-03-10 11:10:02 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-eglibc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-eglibc

Hongxu Jia (1):
  eglibc: tweak glibc.fix_sqrt2.patch for eglibc-2.19

 .../eglibc/eglibc-2.19/glibc.fix_sqrt2.patch       | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
1.8.1.2


