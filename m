Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1730E772BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:42:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3g6kA003891
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Feb 2017 19:42:06 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:42:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:42:01 -0800
Message-ID: <cover.1486697927.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] libpcre2: add it for newer vte
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
X-List-Received-Date: Fri, 10 Feb 2017 03:42:07 -0000
Content-Type: text/plain

The following changes since commit d1109378d730c5cf50240c4d1a468e3aef5208ea:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:50:54 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pcre2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pcre2

Robert Yang (1):
  libpcre2: add it for newer vte

 .../libpcre/libpcre2/pcre-cross.patch              | 65 ++++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre2_10.22.bb     | 56 +++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2_10.22.bb

-- 
2.9.0


