Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D45D6F7EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 01:57:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2C1vlbg017663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 18:57:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 18:57:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 09:57:45 +0800
Message-ID: <cover.1394589334.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrades
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
X-List-Received-Date: Wed, 12 Mar 2014 01:57:51 -0000
Content-Type: text/plain

The following changes since commit 82c773e88aaefd9321481ad297554d5b4a3ae0b2:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:52:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/package-upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/package-upgrades

Chen Qi (3):
  sudo: upgrade to 1.8.9p5
  grep: upgrade from 2.16 to 2.18
  gettext: upgrade from 0.18.3.1 to 0.18.3.2

 .../parallel.patch                                 |    0
 .../COPYING                                        |    0
 .../Makefile.in.in                                 |    0
 .../Makevars.template                              |    0
 .../aclocal.tgz                                    |  Bin 37591 -> 37591 bytes
 .../config.rpath                                   |    0
 ...conv-m4-remove-the-test-to-convert-euc-jp.patch |    0
 .../remove-potcdate.sin                            |    0
 ...8.3.1.bb => gettext-minimal-native_0.18.3.2.bb} |    0
 .../{gettext_0.18.3.1.bb => gettext_0.18.3.2.bb}   |    4 ++--
 .../grep/{grep_2.16.bb => grep_2.18.bb}            |    4 ++--
 .../sudo/{sudo_1.8.9p1.bb => sudo_1.8.9p5.bb}      |    4 ++--
 12 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.18.3.1 => gettext-0.18.3.2}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/Makefile.in.in (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/Makevars.template (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/aclocal.tgz (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/config.rpath (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/iconv-m4-remove-the-test-to-convert-euc-jp.patch (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.1 => gettext-minimal-0.18.3.2}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.3.1.bb => gettext-minimal-native_0.18.3.2.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.18.3.1.bb => gettext_0.18.3.2.bb} (97%)
 rename meta/recipes-extended/grep/{grep_2.16.bb => grep_2.18.bb} (86%)
 rename meta/recipes-extended/sudo/{sudo_1.8.9p1.bb => sudo_1.8.9p5.bb} (83%)

-- 
1.7.9.5


