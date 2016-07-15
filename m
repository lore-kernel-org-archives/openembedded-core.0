Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A60C73166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6F1nb7U018924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:49:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 18:49:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 09:49:33 +0800
Message-ID: <cover.1468547302.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Package Upgrade: at, byacc, cups, sudo, sysstat
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:38 -0000
Content-Type: text/plain

The following changes since commit da7a2c7b00b40a8759dbe9f4ab6df3e337e3d6b6:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:11:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20160715
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20160715

Chen Qi (5):
  at: upgrade to 3.1.20
  byacc: upgrade to 20160606
  cups: upgrade to 2.1.4
  sudo: upgrade to 1.8.17p1
  sysstat: upgrade to 11.3.5

 .../at/at/configure-fix-with-without-selinux.patch | 53 ----------------------
 .../at/{at_3.1.18.bb => at_3.1.20.bb}              |  7 ++-
 .../byacc/{byacc_20160324.bb => byacc_20160606.bb} |  4 +-
 meta/recipes-extended/cups/cups.inc                |  2 +-
 .../cups/{cups_2.1.3.bb => cups_2.1.4.bb}          |  4 +-
 .../sudo/{sudo_1.8.16.bb => sudo_1.8.17p1.bb}      |  4 +-
 .../{sysstat_11.3.4.bb => sysstat_11.3.5.bb}       |  4 +-
 7 files changed, 12 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch
 rename meta/recipes-extended/at/{at_3.1.18.bb => at_3.1.20.bb} (89%)
 rename meta/recipes-extended/byacc/{byacc_20160324.bb => byacc_20160606.bb} (74%)
 rename meta/recipes-extended/cups/{cups_2.1.3.bb => cups_2.1.4.bb} (40%)
 rename meta/recipes-extended/sudo/{sudo_1.8.16.bb => sudo_1.8.17p1.bb} (90%)
 rename meta/recipes-extended/sysstat/{sysstat_11.3.4.bb => sysstat_11.3.5.bb} (53%)

-- 
1.9.1


