Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B204265DAE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 04:40:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s674ebfU000146
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Jul 2014 21:40:37 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 6 Jul 2014 21:40:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Jul 2014 21:40:36 -0700
Message-ID: <cover.1404707988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] base-passwd: install passwd and group atomically
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
X-List-Received-Date: Mon, 07 Jul 2014 04:40:43 -0000
Content-Type: text/plain

The following changes since commit a5531a2b8983318b99c119a87b78a92cf84160b8:

  bitbake: fetch2/svn: Add transportuser parameter (2014-07-04 09:28:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/pw
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/pw

Robert Yang (1):
  base-passwd: install passwd and group atomically

 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
1.7.9.5


