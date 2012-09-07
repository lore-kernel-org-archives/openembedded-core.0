Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TA6q7-0006rB-Ii
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 00:15:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q87M3NeF004839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Sep 2012 15:03:24 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 7 Sep 2012 15:03:23 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Sep 2012 17:05:42 -0500
Message-ID: <cover.1347055413.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] Enhancement / bug fixes to the complementary install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 22:15:52 -0000
Content-Type: text/plain

This is one bug fix and one enhancement to the complementary install.

We have a use where we would like to call the complementary install directly
with a set of parameters, the enhancement allows us to do this.

The bug fix is specific to the implementation within the RPM rootfs generation.
Without the fix, a suboptimal installation is generated and performed.

The following changes since commit 0de1827a9601143b090f751ea702fdb65a936b77:

  classes/mirrors: remove bogus gnutls mirror (2012-09-07 14:51:10 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/comp_install
  http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/comp_install

Mark Hatle (2):
  image.bbclass: Enable the complementary install to be called w/
    globbing params
  package_rpm.bbclass: Avoid unnecessary installs in complementary pass

 meta/classes/image.bbclass       |    4 +++-
 meta/classes/package_rpm.bbclass |    9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
1.7.3.4



