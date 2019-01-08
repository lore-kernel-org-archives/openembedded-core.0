Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 323A46BA72
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 09:05:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0894mv7029706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 01:04:58 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 8 Jan 2019 01:04:37 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jan 2019 17:12:51 +0800
Message-ID: <cover.1546938633.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] netbase/base-files: move /etc/hosts from netbase to base-files
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
X-List-Received-Date: Tue, 08 Jan 2019 09:05:08 -0000
Content-Type: text/plain

The following changes since commit fd045373e01409e273479c9e0e2e69bd1b7815f9:

  python-native: fix one do_populate_sysroot warning (2019-01-07 14:38:39 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/etc-hosts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/etc-hosts

Chen Qi (1):
  netbase/base-files: move /etc/hosts from netbase to base-files

 meta/recipes-core/{netbase/netbase => base-files/base-files}/hosts | 0
 meta/recipes-core/base-files/base-files_3.0.14.bb                  | 5 ++++-
 meta/recipes-core/netbase/netbase_5.5.bb                           | 6 +-----
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-core/{netbase/netbase => base-files/base-files}/hosts (100%)

-- 
1.9.1


