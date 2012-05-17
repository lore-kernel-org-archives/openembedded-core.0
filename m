Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SVAY7-0002nC-4C
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 01:56:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4HNjxI0011551
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 16:45:59 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 17 May 2012 16:45:59 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 18:45:57 -0500
Message-ID: <cover.1337298285.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: Fix typo
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
X-List-Received-Date: Thu, 17 May 2012 23:56:03 -0000
Content-Type: text/plain

So, somehow in the the cleanup, I dropped the "% tune" following a
%s.  Re-added in this patch.  And because I know how typo-prone I am,
I tested that this really does produce the right results now.  :)

The following changes since commit 7163ebd92a799b8f000b2b6f303b20de468b5f90:
  Koen Kooi (1):
        Revert "kmod: Use base_libdir for installing libkmod"

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/toolchains
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchains

Peter Seebach (1):
  sanity.bbclass:  Attach the missing value to a format string.

 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



