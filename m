Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65609728B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 06:21:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ6Lc8Y014894
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 22:21:38 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 22:21:37 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 14:21:37 +0800
Message-ID: <cover.1418969925.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/4] Change the way of CONFFILES handling
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
X-List-Received-Date: Fri, 19 Dec 2014 06:21:42 -0000
Content-Type: text/plain

This patchset has been tested by building core-image-sato and core-image-sato-sdk
against the three package backends in OE (rpm, deb, ipk).

Changes in V2:
1. Extract the common code in FILES handling and CONFFILES handling
2. Fix error for ipk package backend
3. Fix errors for deb package backend

The following changes since commit 8d0e56a850579f9a6d501266deeef9b257ce4780:

  serf: readded md5sum (2014-12-11 11:34:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/CONFFILES
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/CONFFILES

Chen Qi (4):
  packaging: allow globs in CONFFILES
  package_manager.py: user 'purge' instead of 'remove' in case of deb
  update-rc.d: use '-f' option in updatercd_postrm
  useradd.bbclass: avoid do_rootfs error for debian package backend

 meta/classes/package.bbclass     | 79 +++++++++++++++++++++++++++++++---------
 meta/classes/package_deb.bbclass |  2 +-
 meta/classes/package_ipk.bbclass |  2 +-
 meta/classes/package_rpm.bbclass |  2 +-
 meta/classes/update-rc.d.bbclass |  4 +-
 meta/classes/useradd.bbclass     | 10 +++++
 meta/conf/bitbake.conf           |  2 +
 meta/lib/oe/package_manager.py   |  4 +-
 8 files changed, 80 insertions(+), 25 deletions(-)

-- 
1.9.1


