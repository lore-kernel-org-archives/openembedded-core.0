Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PvBi5-0003rR-2s
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 17:49:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p23Gla5I000111
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 08:47:36 -0800 (PST)
Received: from localhost.localdomain (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 3 Mar 2011 08:47:35 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Mar 2011 10:47:29 -0600
Message-ID: <cover.1299170758.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
X-Originating-IP: [172.25.36.229]
Subject: [PATCH 0/2] Two minor fixes for oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2011 16:49:10 -0000
Content-Type: text/plain

The first fix implementes the workaround I posted in the oe-core getting
started.  Simply adding the BBFETCH2=True is all that is needed.

The second fixes the ELF qa loaders bit size identification.


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: mhatle/oecore/fixes
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/oecore/fixes

Thanks,
    Mark Hatle <mark.hatle@windriver.com>
---


Mark Hatle (2):
  poky-env-internal: Add FETCH2 enablement
  qa.py: Fix a typo when evaluating bitsize

 meta/lib/oe/qa.py         |    4 ++--
 scripts/poky-env-internal |    2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.4



