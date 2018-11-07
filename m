Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09F0779D75
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 09:13:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA79DZU0009067
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Nov 2018 01:13:35 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 01:13:34 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Nov 2018 16:30:45 +0800
Message-ID: <cover.1541579326.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH v2 0/1] glide: disable ptest on mips
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
X-List-Received-Date: Wed, 07 Nov 2018 09:13:34 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* use override 'mipsarch' for all kinds of mips rather than 'mips' and 'mips64'

The following changes since commit 411184bfaa6269bf2926bb2a576c0922958cbbb3:

  xserver-xorg: fix CVE-2018-14665 (2018-11-01 13:27:26 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/glide
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/glide

Kai Kang (1):
  glide: disable ptest on mips

 meta/recipes-devtools/glide/glide_0.13.2.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.18.0


