Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SXdX7-0006Nd-0i
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 21:17:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4OJ707k013278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 12:07:00 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 24 May 2012 12:06:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 14:11:01 -0500
Message-ID: <cover.1337886141.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Help debug QA foo rdepends on bar-dev
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
X-List-Received-Date: Thu, 24 May 2012 19:17:13 -0000
Content-Type: text/plain

After numerous attempts to try to remotely help people stuck by the QA test
that a base package requires a -dev package, I needed to figure out a way
to add diagnostics to the logs to help identify what was happening.

The patch adds some basic diagnostics to indicate what dependency was found
and what package it triggered to be added to the rdepends.

In addition it was observed that a lot of duplicate processing was occuring
so I modifed the system to eliminate the duplicates.  This has the potential
to improve performance, but I was not able to measure anything statistically
significant in my builds.

The following changes since commit 0f795f81fe5ad3ef78c21a177eca90fbc8810f81:

  qemu: disable vnc-jpeg compression (2012-05-24 08:53:40 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/package
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/package

Mark Hatle (1):
  package.bbclass: Add additional debugging for dependencies

 meta/classes/package.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.3.4



