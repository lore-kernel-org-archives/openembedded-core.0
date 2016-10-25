Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF066719DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 07:40:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9P7eXvI008780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 00:40:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Oct 2016 00:40:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Oct 2016 15:40:43 +0800
Message-ID: <cover.1477381190.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: CVE-2016-7795
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
X-List-Received-Date: Tue, 25 Oct 2016 07:40:33 -0000
Content-Type: text/plain

The following changes since commit 6e96deb024e4c41d911f590ff2b92b402f672661:

  local.conf.sample.extended: remove RM_OLD_IMAGE (2016-10-19 17:07:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/CVE-2016-7795
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/CVE-2016-7795

Chen Qi (1):
  systemd: CVE-2016-7795

 ...s-zero-length-notification-messages-again.patch | 68 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_230.bb           |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-pid1-process-zero-length-notification-messages-again.patch

-- 
1.9.1


