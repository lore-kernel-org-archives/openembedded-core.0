Return-Path: <Ning.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9AB6A5AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 09:45:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4T9k0gH006183
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 02:46:00 -0700 (PDT)
Received: from pek-nzhang0-d3.wrs.com (128.224.162.247) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 29 May 2013 02:45:59 -0700
From: Ning Zhang <ning.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 17:45:55 +0800
Message-ID: <cover.1369820394.git.ning.zhang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 0/1] yocto_kernel: check current items before add a new one
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
X-List-Received-Date: Wed, 29 May 2013 09:45:58 -0000
Content-Type: text/plain

The following changes since commit 676fd3f394a0c0576b63c77ed2184bf5f42c29b6:

  dropbear: a fix for hang in dropbearkey, built for x32 (2013-05-24 14:14:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ning/znbug4558
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ning/znbug4558

Ning Zhang (1):
  yocto_kernel: check current items before add a new one

 scripts/lib/bsp/kernel.py |   32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

-- 
1.7.9.5


