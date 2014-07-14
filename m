Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF9457045F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:41:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E9f5Yp023262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 02:41:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 14 Jul 2014 02:41:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 02:41:02 -0700
Message-ID: <cover.1405330780.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] check and convert file depends on bash, perl and python
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
X-List-Received-Date: Mon, 14 Jul 2014 09:41:09 -0000
Content-Type: text/plain

The following changes since commit fa325e44f5b429b4038022b31285af9c94672943:

  insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:19:18 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/filedep
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/filedep

Robert Yang (2):
  insane.bbclass: QAPATHTEST: check file depends on bash, perl and
    python
  package.bbclass: convert file depends into pkg depends

 meta/classes/insane.bbclass  |   32 ++++++++++++++++++++++++++++++--
 meta/classes/package.bbclass |   14 ++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

-- 
1.7.9.5


