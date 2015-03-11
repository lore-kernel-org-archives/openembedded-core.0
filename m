Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA18473956
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 06:46:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2B6kuis021370
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 23:46:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 10 Mar 2015 23:46:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 14:47:07 +0800
Message-ID: <cover.1426056350.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: fix CVE-2014-9114
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
X-List-Received-Date: Wed, 11 Mar 2015 06:46:59 -0000
Content-Type: text/plain

The following changes since commit 99f209a49a4390192b95184ff86bd6f973010111:

  layer.conf: bump version as error-report interface changed (2015-03-10 17:44:56 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/util-linux-CVE-2014-9114
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/util-linux-CVE-2014-9114

Chen Qi (1):
  util-linux: fix CVE-2014-9114

 .../util-linux/util-linux/CVE-2014-9114.patch      | 174 +++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.25.2.bb  |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch

-- 
1.9.1


