Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QaBpF-0000bj-TU
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 21:13:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OJAKEq012330
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:10:20 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 24 Jun 2011 12:10:19 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 14:10:15 -0500
Message-ID: <cover.1308942534.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Uprev prelink
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
X-List-Received-Date: Fri, 24 Jun 2011 19:13:58 -0000
Content-Type: text/plain

Uprev prelink and fix a couple of issues noticed during the process.

The following changes since commit 3aec2fa2df9aaa883feda0d7aed85e63d01398b9:

  qemuimagetest: update cvs and iptables to newer version for toolchain test (2011-06-24 11:28:28 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/prelink
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/prelink

Mark Hatle (1):
  prelink: Uprev prelink to latest version

 meta/recipes-devtools/prelink/prelink_git.bb |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

-- 
1.7.3.4



