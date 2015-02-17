Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 41C2365C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 02:08:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1H28GOC025291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 18:08:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Feb 2015 18:08:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 10:08:11 +0800
Message-ID: <cover.1424138791.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/4] Change the way of CONFFILES handling
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
X-List-Received-Date: Tue, 17 Feb 2015 02:08:21 -0000
Content-Type: text/plain

The following changes since commit d5af8539c0a1718a7254bcdcfa973e3c887dfbd6:

  syslinux: support ext2/3/4 device (2015-02-15 08:11:19 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/CONFFILES
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/CONFFILES

Chen Qi (4):
  packaging: allow globs in CONFFILES
  package_manager.py: use 'purge' instead of 'remove' in case of deb
  update-rc.d: use '-f' option in updatercd_postrm
  useradd.bbclass: avoid do_rootfs error for debian package backend

 meta/classes/package.bbclass     | 79 +++++++++++++++++++++++++++++++---------
 meta/classes/package_deb.bbclass |  2 +-
 meta/classes/package_ipk.bbclass |  2 +-
 meta/classes/package_rpm.bbclass |  2 +-
 meta/classes/update-rc.d.bbclass |  4 +-
 meta/classes/useradd.bbclass     | 10 +++++
 meta/lib/oe/package_manager.py   |  4 +-
 7 files changed, 78 insertions(+), 25 deletions(-)

-- 
1.9.1


