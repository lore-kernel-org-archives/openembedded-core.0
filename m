Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D06B2755F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 09:44:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t519i522023682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 02:44:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 1 Jun 2015 02:44:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jun 2015 17:44:11 +0800
Message-ID: <cover.1433151775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Upgrade gawk and util-linux
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
X-List-Received-Date: Mon, 01 Jun 2015 09:44:06 -0000
Content-Type: text/plain

The following changes since commit 7ffe10df73cc20d10fcd41b121074445273bd60e:

  license_class: license_create_manifest improvment (2015-05-09 22:26:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20150601
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20150601

Chen Qi (2):
  util-linux: upgrade to 2.26.2
  gawk: upgrade to 4.1.3

 .../{util-linux_2.26.1.bb => util-linux_2.26.2.bb} |  4 +-
 ...-in-extension-Makefile.am-when-removing-..patch | 56 --------------
 ...dd-DESTDIR-prefix-to-remaining-pkgextensi.patch | 86 ----------------------
 .../gawk/{gawk-4.1.1 => gawk-4.1.3}/run-ptest      |  0
 .../gawk/{gawk_4.1.1.bb => gawk_4.1.3.bb}          |  6 +-
 5 files changed, 4 insertions(+), 148 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.26.1.bb => util-linux_2.26.2.bb} (86%)
 delete mode 100644 meta/recipes-extended/gawk/gawk-4.1.1/Use-DESTDIR-in-extension-Makefile.am-when-removing-..patch
 delete mode 100644 meta/recipes-extended/gawk/gawk-4.1.1/extension-Add-DESTDIR-prefix-to-remaining-pkgextensi.patch
 rename meta/recipes-extended/gawk/{gawk-4.1.1 => gawk-4.1.3}/run-ptest (100%)
 rename meta/recipes-extended/gawk/{gawk_4.1.1.bb => gawk_4.1.3.bb} (80%)

-- 
1.9.1


