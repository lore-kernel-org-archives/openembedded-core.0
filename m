Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 34F88610DC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 06:53:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA26r4ua009114
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Nov 2013 23:53:04 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 1 Nov 2013 23:53:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Nov 2013 14:52:58 +0800
Message-ID: <cover.1383374625.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1 V3] qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+, libcap-ng
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
X-List-Received-Date: Sat, 02 Nov 2013 06:53:04 -0000
Content-Type: text/plain

Change in V2: Improve floating dependencies as many as possible;

Chnage in V3: Add comments to make it clear that all PACKAGECONFIG varflags
              disabled by default and how to enable them by setting in
              local.conf;

The following changes since commit 523f2a9ea970713fb775bc48f84b67420b1106a0:

  cross-canadian: Improve comment (2013-10-30 18:01:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-qemu-nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-qemu-nss

Hongxu Jia (1):
  qemu: add PACKAGECONFIG for vnc,libcurl,nss,uuid,curses,gtk+,libcap-ng

 meta/recipes-devtools/qemu/qemu.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
1.8.1.2


