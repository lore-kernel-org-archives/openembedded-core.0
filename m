Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9CD61957
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:20:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA18K5xD004351
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 01:20:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 1 Nov 2013 01:20:05 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Nov 2013 16:21:05 +0800
Message-ID: <cover.1383294017.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] iproute2: de-bash its scripts to remove the bash dependency
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
X-List-Received-Date: Fri, 01 Nov 2013 08:20:04 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 523f2a9ea970713fb775bc48f84b67420b1106a0:

  cross-canadian: Improve comment (2013-10-30 18:01:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/iproute2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/iproute2

Chen Qi (1):
  iproute2: de-bash its scripts to remove the bash dependency

 .../iproute2/0001-iproute2-de-bash-scripts.patch   |   64 ++++++++++++++++++++
 .../iproute2/iproute2_3.11.0.bb                    |    1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch

-- 
1.7.9.5


