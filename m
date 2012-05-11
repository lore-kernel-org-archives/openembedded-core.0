Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SStaI-0002uK-VO
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:24:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4BHEwbl004644
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 10:14:58 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 11 May 2012 10:14:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 May 2012 12:17:53 -0500
Message-ID: <cover.1336756602.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Further optimizations to the sstate.bbclass
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
X-List-Received-Date: Fri, 11 May 2012 17:24:55 -0000
Content-Type: text/plain

A few minor changes to the generation of the fixmepaths file in
the sstate cache file generation can lead to significant performance
improvements in recipes that generate large file sets.

The following changes since commit 9cd30beba77497288eeb2545920bc23f2a77cf16:

  .gitignore: add /bitbake to the ignore list for external distributions (2012-05-11 17:59:53 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sstate

Mark Hatle (1):
  sstate.bbclass: Optimize the generation and install path fixups

 meta/classes/sstate.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

-- 
1.7.3.4



