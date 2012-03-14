Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S7ia4-0001MG-R1
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 08:25:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2E7GNZn010524
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 00:16:23 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 14 Mar 2012 00:16:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 15:16:02 +0800
Message-ID: <cover.1331709176.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] do not split debug pkg when no debugsources.list
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
X-List-Received-Date: Wed, 14 Mar 2012 07:25:09 -0000
Content-Type: text/plain

Changes of V2:

* Do not split debug pkg when no debugsources.list rather than create an
  empty debugsources.list as Richard suggested.

// Robert

The following changes since commit 81379dc141e245307ca391a02b7490b199128991:

  dates: Fix unpackaged files warning (2012-03-13 23:18:19 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/debugpkg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/debugpkg

Robert Yang (1):
  package.bbclass: do not split debug pkg when no debugsources.list

 meta/classes/package.bbclass |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

-- 
1.7.4.1



