Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RllMM-0007sz-Oq
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 18:56:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0DHmfwB026727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 09:48:41 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 13 Jan 2012 09:48:40 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jan 2012 11:52:59 -0600
Message-ID: <cover.1326477036.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Update cross prelinker
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
X-List-Received-Date: Fri, 13 Jan 2012 17:56:15 -0000
Content-Type: text/plain

Update the cross prelinker to fix a MIPS issue.

The following changes since commit 9b446e954b55e7d42c39ff87a42564a48786b60e:

  prelink: Update to latest version (2012-01-13 11:47:01 -0600)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib.git mhatle/prelink
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/prelink

Mark Hatle (1):
  prelink: Update to latest version

 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 meta/recipes-devtools/prelink/prelink_git.bb       |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.3.4



