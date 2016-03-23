Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00ED060670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:14:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2NBEaPm028671
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 04:14:36 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 23 Mar 2016 04:14:35 -0700
From: Dengke Du <dengke.du@windriver.com>
To: 
Date: Wed, 23 Mar 2016 07:14:31 -0400
Message-ID: <cover.1458731173.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] pTest-quilt: pTest-quilt failed fixed
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
X-List-Received-Date: Wed, 23 Mar 2016 11:14:39 -0000
Content-Type: text/plain

The following changes since commit 8037ba4d86a65ee296cfdcee736dfd614c568818:

  bitbake: bb/tests/fetch: Update cups url (2016-03-21 12:43:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/pTest-quilt-fail-fixed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ptest-quilt

Dengke Du (1):
  pTest-quilt: fixed the quilt ptest fail

 meta/recipes-devtools/quilt/quilt.inc       | 9 +++++++--
 meta/recipes-devtools/quilt/quilt/run-ptest | 3 ++-
 meta/recipes-devtools/quilt/quilt/test.sh   | 1 +
 3 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100755 meta/recipes-devtools/quilt/quilt/test.sh

-- 
1.9.1


