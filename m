Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEBA784E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 02:10:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA92Anm2014570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Nov 2017 18:10:50 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 8 Nov 2017 18:10:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Nov 2017 10:12:10 +0800
Message-ID: <cover.1510193452.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Package Upgrade: sudo, sysstat, cups, gawk
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
X-List-Received-Date: Thu, 09 Nov 2017 02:10:49 -0000
Content-Type: text/plain

The following changes since commit b656fd9267b1f36d46ca20a1c0bcfaedbf7df438:

  gcc: fix miscompilation on mips64 (2017-11-08 22:24:04 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-20171109
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20171109

Chen Qi (4):
  sudo: upgrade to 1.8.21p2
  sysstat: upgrade to 11.6.1
  cups: upgrade to 2.2.6
  gawk: upgrade to 4.2.0

 .../cups/{cups_2.2.4.bb => cups_2.2.6.bb}          |  4 +--
 .../test-arrayind1-Remove-hashbang-line.patch      | 30 ----------------------
 .../gawk/{gawk-4.1.4 => gawk}/run-ptest            |  0
 .../gawk/{gawk_4.1.4.bb => gawk_4.2.0.bb}          |  5 ++--
 .../sudo/{sudo_1.8.20p2.bb => sudo_1.8.21p2.bb}    |  4 +--
 .../{sysstat_11.5.7.bb => sysstat_11.6.1.bb}       |  4 +--
 6 files changed, 8 insertions(+), 39 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.4.bb => cups_2.2.6.bb} (40%)
 delete mode 100644 meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
 rename meta/recipes-extended/gawk/{gawk-4.1.4 => gawk}/run-ptest (100%)
 rename meta/recipes-extended/gawk/{gawk_4.1.4.bb => gawk_4.2.0.bb} (85%)
 rename meta/recipes-extended/sudo/{sudo_1.8.20p2.bb => sudo_1.8.21p2.bb} (90%)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.7.bb => sysstat_11.6.1.bb} (53%)

-- 
1.9.1


