Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7AD6E5FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 06:09:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q69ZGv014508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 23:09:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Oct 2016 23:09:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 14:09:46 +0800
Message-ID: <cover.1477462109.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] systemd: CVE-2016-7795
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
X-List-Received-Date: Wed, 26 Oct 2016 06:09:36 -0000
Content-Type: text/plain

Changes since V1:
Change the patch's commit message to conform to OE's requirements.


The following changes since commit 1886ab2f1dc1e3b5758a85604998e8deb9198f5e:

  image_types: Use softer setting of WKS_FILE (2016-10-25 17:58:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/CVE-2016-7795
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/CVE-2016-7795

Chen Qi (1):
  systemd: CVE-2016-7795

 .../systemd/systemd/CVE-2016-7795.patch            | 69 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_230.bb           |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2016-7795.patch

-- 
1.9.1


