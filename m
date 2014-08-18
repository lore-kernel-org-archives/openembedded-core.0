Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3D4617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:30:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6Uq24026529
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:30:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 23:30:51 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 14:26:30 +0800
Message-ID: <cover.1408343136.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] librsvg: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Mon, 18 Aug 2014 06:30:51 -0000
Content-Type: text/plain

The following changes since commit 59b0f7f01bbac6f1c10ee00382c5136d1f327960:

  chrpath: Drop warning from darwn builds (2014-08-17 10:01:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/librsvg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/librsvg

Chong Lu (1):
  librsvg: disable Bsymbolic if it is not supported on some hosts

 meta/recipes-gnome/librsvg/librsvg_2.40.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


