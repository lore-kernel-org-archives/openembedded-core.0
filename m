Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qtcjf-0004CX-JU
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 11:48:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7H9hqP7000365
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 02:43:52 -0700 (PDT)
Received: from localhost (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 17 Aug 2011 02:43:51 -0700
Message-ID: <cover.1313571206.git.kai.kang@windriver.com>
Old-Date: Wed, 17 Aug 2011 16:53:26 +0800
Date: Wed, 17 Aug 2011 17:43:44 +0800
To: <openembedded-core@lists.openembedded.org>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.220]
Subject: [PATCH 0/1] at: make at usable for common user
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
X-List-Received-Date: Wed, 17 Aug 2011 09:48:32 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Fixes [Yocto #1297]
    
The pkg_postinst was added to fix Yocto #675. But it seems not needed
any more. Remove it then unprivilege user could use at.

The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:

  Fixup remaining bb.msg.domain users (2011-08-15 17:31:52 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/at
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/at

Kang Kai (1):
  at: make at usable for common user

 meta/recipes-extended/at/at_3.1.12.bb |   26 +++++---------------------
 1 files changed, 5 insertions(+), 21 deletions(-)

-- 
1.7.5.1.300.gc565c



