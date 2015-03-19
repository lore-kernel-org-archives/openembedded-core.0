Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D911860034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 02:59:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2J2xJI7024539
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 19:59:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 18 Mar 2015 19:59:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2015 10:59:12 +0800
Message-ID: <cover.1426733823.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/5] Changes regarding log checking and license checksums
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
X-List-Received-Date: Thu, 19 Mar 2015 02:59:20 -0000
Content-Type: text/plain

The following changes since commit 0752c79282b1cc9699743e719518e6c341d50a3a:

  systemd: fix /var/log/journal ownership (2015-03-16 17:38:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/log-check-license-warn
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/log-check-license-warn

Chen Qi (5):
  rootfs.py: two changes regarding log checking
  rootfs.py: add log checking ability for deb and ipk
  license.bbclass: skip license checking if the package contains no file
  os-release: add LIC_FILES_CHKSUM
  glibc-collateral.inc: add LIC_FILES_CHKSUM

 meta/classes/license.bbclass                 |  8 ++++
 meta/lib/oe/rootfs.py                        | 64 +++++++++++++++++++---------
 meta/recipes-core/glibc/glibc-collateral.inc |  2 +
 meta/recipes-core/os-release/os-release.bb   |  1 +
 4 files changed, 56 insertions(+), 19 deletions(-)

-- 
1.9.1


