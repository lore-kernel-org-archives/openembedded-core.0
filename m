Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED388600FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:48:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7m2iT024535
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 00:48:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 00:48:01 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 15:48:21 +0800
Message-ID: <cover.1372405535.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 0/1] udev-cache: take a read-only rootfs into consideration
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
X-List-Received-Date: Fri, 28 Jun 2013 07:48:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 042203531b10b37ac9a8201b376f5dec403e51d8:

  sanity.bbclass: Fix COREBASE sanity tests (2013-06-27 12:48:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/udev-cache-readonly
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/udev-cache-readonly

Chen Qi (1):
  udev-cache: take a read-only rootfs into consideration

 meta/recipes-core/udev/udev/init       |   54 +++++++++++++++++++-------------
 meta/recipes-core/udev/udev/udev-cache |    6 ++++
 2 files changed, 38 insertions(+), 22 deletions(-)

-- 
1.7.9.5


