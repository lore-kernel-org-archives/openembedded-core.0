Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A112B6FA9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:01:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q71V4d000162
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 00:01:31 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 00:01:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 03:01:28 -0400
Message-ID: <cover.1395816581.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux-native: fix qsort_r for CentOS 5.10
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
X-List-Received-Date: Wed, 26 Mar 2014 07:01:34 -0000
Content-Type: text/plain

The following changes since commit 43d717df16312a8f0333aff6b8b037b4b9d51bf3:

  toaster.bbclass: update buildstats event data (2014-03-25 14:19:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ul
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ul

Robert Yang (1):
  util-linux-native: fix qsort_r for CentOS 5.10

 .../util-linux/util-linux-native-qsort.patch       |   34 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.24.1.bb  |    4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch

-- 
1.7.10.4


