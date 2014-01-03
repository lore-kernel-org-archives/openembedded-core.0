Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E39160CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 09:24:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s039Of6i017847
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 01:24:41 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 3 Jan 2014 01:24:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Jan 2014 01:27:11 +0800
Message-ID: <cover.1388769973.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] fix unrecognised options
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
X-List-Received-Date: Fri, 03 Jan 2014 09:24:41 -0000
Content-Type: text/plain

The following changes since commit e3e1d52ca34a975739e79e4baeb28cf04e5e49c2:

  bitbake/lib/bb/cooker.py: remove a duplicated self.data (2014-01-04 01:22:32 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/warning
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/warning

Robert Yang (2):
  gconf.bbclass: remove --disable-schemas-install
  mime.bbclass: remove the --disable-update-mimedb

 meta/classes/gconf.bbclass | 6 ------
 meta/classes/mime.bbclass  | 2 --
 2 files changed, 8 deletions(-)

-- 
1.8.3.1


