Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED8FF75C60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 06:16:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7I6Gvsj012612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 23:16:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 17 Aug 2016 23:16:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 23:16:55 -0700
Message-ID: <cover.1471500999.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] packagefeed-stability.bbclass: cleansstate should remove pkgs from deploy dir
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
X-List-Received-Date: Thu, 18 Aug 2016 06:16:57 -0000
Content-Type: text/plain

The following changes since commit c86bf80abd87acb0da5860806822c64ec9dee089:

  oeqa.buildperf: use oe.path.remove() (2016-08-17 10:35:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rt/feed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rt/feed

Robert Yang (1):
  packagefeed-stability.bbclass: cleansstate should remove pkgs from
    deploy dir

 meta/classes/packagefeed-stability.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.9.0


