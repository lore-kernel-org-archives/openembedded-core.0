Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C61278744
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 10:06:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0VA6tJA011396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 02:06:56 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 31 Jan 2018 02:06:53 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jan 2018 17:44:04 +0800
Message-ID: <cover.1517391537.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 0/1] i2c-tools: fix libdir for multilib
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
X-List-Received-Date: Wed, 31 Jan 2018 10:06:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit e5e89cfb7bc2231ac4fcc16f4cb4f74d806136c4:

  pulseaudio: improve glibc 2.27 patch (2018-01-30 12:53:16 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/i2c
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/i2c

Kai Kang (1):
  i2c-tools: fix libdir for multilib

 meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.14.1


