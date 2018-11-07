Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9177D79D69
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 03:33:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA73XqoH015879
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Nov 2018 19:33:52 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 6 Nov 2018 19:33:51 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Nov 2018 22:33:43 -0500
Message-ID: <cover.1541560699.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/1] glide: disable ptest on mips
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
X-List-Received-Date: Wed, 07 Nov 2018 03:33:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 411184bfaa6269bf2926bb2a576c0922958cbbb3:

  xserver-xorg: fix CVE-2018-14665 (2018-11-01 13:27:26 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/glide
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/glide

Kai Kang (1):
  glide: disable ptest on mips

 meta/recipes-devtools/glide/glide_0.13.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.19.0.rc2


