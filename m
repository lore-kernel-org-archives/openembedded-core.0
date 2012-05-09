Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SS9Y2-0003So-QM
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:15:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49G5bs3000690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 09:05:37 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 9 May 2012 09:05:36 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 11:08:41 -0500
Message-ID: <cover.1336579481.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] Import the blacklist functionality from meta-oe
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
X-List-Received-Date: Wed, 09 May 2012 16:15:31 -0000
Content-Type: text/plain

This imports the blacklist class from meta-oe, and then a subseqent patch
revises it to use the OE variable and change the message generation.

Once accepted into oe-core, a patch for meta-oe will be generated to remove
it from there.

The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:

  kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/blacklist
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/blacklist

Mark Hatle (2):
  blacklist: fix typo in name
  blacklist.bbclass: Rename to OE_BLACKLIST and minor cleanup

 meta/classes/blacklist.bbclass |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/blacklist.bbclass

-- 
1.7.3.4



