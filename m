Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E0737605FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 08:29:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2P8SurZ008928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Mar 2016 01:28:56 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 25 Mar 2016 01:28:55 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>, <tudor.florea@enea.com>
Date: Fri, 25 Mar 2016 04:28:53 -0400
Message-ID: <cover.1458893281.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] quilt: run ptest as normal user
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
X-List-Received-Date: Fri, 25 Mar 2016 08:29:26 -0000
Content-Type: text/plain

The following changes since commit b58e5b1fb3bcacbcfce17a748bca5f60c3528b4f:

  bitbake: bitbake: xmlrpc: set single use mode differently (2016-03-24 12:31:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/quilt-ptest-fail-fixed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/quilt-ptest-fail-fixed

Dengke Du (1):
  quilt: run ptest as normal user

 meta/recipes-devtools/quilt/quilt.inc       | 4 +++-
 meta/recipes-devtools/quilt/quilt/run-ptest | 5 ++++-
 meta/recipes-devtools/quilt/quilt/test.sh   | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-devtools/quilt/quilt/test.sh

-- 
1.9.1


