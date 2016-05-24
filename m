Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51D8D60107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:15:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4O3Fl6k000799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:15:47 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:15:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 20:15:45 -0700
Message-ID: <cover.1464059717.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] tcl: fix sed command in do_install
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
X-List-Received-Date: Tue, 24 May 2016 03:15:49 -0000
Content-Type: text/plain

The following changes since commit d6241e4c94a0a72acfc57e96a59918c0b2146d65:

  useradd: Fix infinite build loop (2016-05-23 10:33:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/tcl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/tcl

Robert Yang (1):
  tcl: fix sed command in do_install

 meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 2 --
 1 file changed, 2 deletions(-)

-- 
2.7.4


