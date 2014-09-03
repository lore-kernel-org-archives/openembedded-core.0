Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AABC7108D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 09:04:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8394UqV025512
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 02:04:32 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 02:04:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 02:04:29 -0700
Message-ID: <cover.1409727368.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] rpmresolve: ignore null requires
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
X-List-Received-Date: Wed, 03 Sep 2014 09:04:35 -0000
Content-Type: text/plain

The following changes since commit 4c0a9ccbad2889b27b4b1d2ab91215a4bdcca3ce:

  python-numpy: Fix build for mips64 (2014-09-01 18:00:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rpmresolve
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rpmresolve

Robert Yang (1):
  rpmresolve: ignore null requires

 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
1.7.9.5


