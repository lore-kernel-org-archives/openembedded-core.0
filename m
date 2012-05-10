Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SSceu-0004rj-Vj
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 01:20:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4ANAboO002120
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 16:10:37 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 10 May 2012 16:10:36 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2012 18:13:37 -0500
Message-ID: <cover.1336691544.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Performance improvement in install_sstatepkg
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
X-List-Received-Date: Thu, 10 May 2012 23:20:33 -0000
Content-Type: text/plain

Significant performance improvement when large numbers of files are involved
with install_sstatepkg.

To reproduce the problem:

bitbake perl
bitbake -c clean perl
time bitbake perl

The following changes since commit 910452727fc277c1caec7612b36c37b58d845350:

  eglibc: Add patch to fix /var installation location (2012-05-09 21:42:37 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sstate

Mark Hatle (1):
  sstate.bbclass: Improve sstate_installpkg performance

 meta/classes/sstate.bbclass |   28 +++++++++++++++++++++-------
 1 files changed, 21 insertions(+), 7 deletions(-)

-- 
1.7.3.4



