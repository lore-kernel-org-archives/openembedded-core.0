Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51F7A6F09E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 02:34:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2R2YF3P009301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 19:34:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 19:34:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 10:34:40 +0800
Message-ID: <cover.1395887644.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] bind: add support for read-only rootfs
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
X-List-Received-Date: Thu, 27 Mar 2014 02:34:15 -0000
Content-Type: text/plain

The following changes since commit f0e1c22ee1cc581fbe8a56e707dcdb015d58fdb6:

  local.conf.sample.extended: update it for the archiver (2014-03-26 12:15:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/bind-read-only
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/bind-read-only

Chen Qi (1):
  bind: add support for read-only rootfs

 .../init.d-add-support-for-read-only-rootfs.patch  |   65 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    2 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch

-- 
1.7.9.5


