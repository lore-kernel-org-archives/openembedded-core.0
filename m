Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD3B74248
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 08:07:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t68875Nn005484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 01:07:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Jul 2015 01:07:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 16:07:43 +0800
Message-ID: <cover.1436342667.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] nfs-utils: fix to start nfs-server correctly in systemd images
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
X-List-Received-Date: Wed, 08 Jul 2015 08:07:10 -0000
Content-Type: text/plain

The following changes since commit df6ddc4bf9795212fda87f9d401893eb254074da:

  file: fix long-options (2015-07-07 23:57:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/nfs-utils-systemd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/nfs-utils-systemd

Chen Qi (1):
  nfs-utils: fix to start nfs-server correctly in systemd

 .../nfs-utils/nfs-utils/proc-fs-nfsd.mount                   |  8 ++++++++
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb       | 12 +++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount

-- 
1.9.1


