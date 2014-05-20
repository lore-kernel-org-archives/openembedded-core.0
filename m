Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 712136A499
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:28:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1SS8A024123
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:28:28 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:28:27 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:28:25 +0800
Message-ID: <cover.1400549249.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] guile: Update to 2.0.11 version
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
X-List-Received-Date: Tue, 20 May 2014 01:28:27 -0000
Content-Type: text/plain

The following changes since commit 0e2777fc3da1f59a227264068e5030c57e5ff33a:

  maintainers.inc: js package removed (2014-05-19 16:22:16 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/guile
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/guile

Chong Lu (1):
  guile: Update to 2.0.11 version

 .../guile/files/guile_2.0.9_fix_noreturn.patch     | 65 ----------------------
 .../guile/{guile_2.0.9.bb => guile_2.0.11.bb}      |  5 +-
 2 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch
 rename meta/recipes-devtools/guile/{guile_2.0.9.bb => guile_2.0.11.bb} (95%)

-- 
1.8.1.2


