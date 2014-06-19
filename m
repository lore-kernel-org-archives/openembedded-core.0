Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0C66FC0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 07:32:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5J7WHS3024236
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 00:32:17 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Thu, 19 Jun 2014 00:32:16 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2014 15:31:51 +0800
Message-ID: <cover.1403162980.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/1] Don't force volatile directory to be a link if already mounted.
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
X-List-Received-Date: Thu, 19 Jun 2014 07:32:22 -0000
Content-Type: text/plain

The following changes since commit 5b1c329804f9f3fadcc46452390f537052ff7d0e:

  bitbake: bitbake-user-manual-fetching.xml: Grammar, typo, and tweaks. (2014-06-18 13:48:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/volatile
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/volatile

Kai Kang (1):
  initscripts: update populate-volatile.sh

 .../initscripts/initscripts-1.0/populate-volatile.sh           | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
1.9.1


