Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF1C86FB36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:54:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2PAsK05018214
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 03:54:21 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 25 Mar 2014 03:54:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 19:00:10 +0800
Message-ID: <cover.1395745170.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] bind: two fixes
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
X-List-Received-Date: Tue, 25 Mar 2014 10:54:21 -0000
Content-Type: text/plain

The following changes since commit 61ab69c4164c193083f541ce0912b6e3cb4d41a2:

  perl-native: fix path in Config.sh for sstate (2014-03-25 16:31:58 +0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bind
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/bind

Robert Yang (2):
  bind: fix no bind-utils package
  bind: remove nslookup from FILES

 meta/recipes-connectivity/bind/bind_9.9.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.3.1


