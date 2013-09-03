Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A36B06BC26
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 07:57:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r837vkg4014017
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 00:57:46 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Sep 2013 00:57:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 15:52:50 +0800
Message-ID: <cover.1378194734.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] glib-2.0: fix a host contamination issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2013 07:57:47 -0000
Content-Type: text/plain

The following changes since commit 5745e45b18e5099e94b4d5a73bc97dc6d4cdc91f:

  buildtools-tarball: Add python-pkgutil (2013-08-29 00:23:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/glib-2.0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/glib-2.0

Robert Yang (1):
  glib-2.0: fix a host contamination issue

 meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.8.1.2


