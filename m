Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31FB9737F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 08:52:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t688q5LK007977
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 01:52:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Jul 2015 01:52:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 16:52:44 +0800
Message-ID: <cover.1436345434.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] nfs-utils: fix to start nfs-server correctly in systemd
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
X-List-Received-Date: Wed, 08 Jul 2015 08:52:05 -0000
Content-Type: text/plain

The following changes since commit df6ddc4bf9795212fda87f9d401893eb254074da:

  file: fix long-options (2015-07-07 23:57:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/nfs-utils-systemd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/nfs-utils-systemd

Chen Qi (1):
  nfs-utils: fix to start nfs-server correctly in systemd

 .../nfs-utils/nfs-utils/proc-fs-nfsd.mount                     |  8 ++++++++
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb         | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/proc-fs-nfsd.mount

-- 
1.9.1


