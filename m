Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7400B60765
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 03:09:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4839u5C008413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 May 2017 20:09:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 7 May 2017 20:09:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 May 2017 11:12:10 +0800
Message-ID: <cover.1494213091.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] cve-check-tool: backport a patch to make CVE checking work
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
X-List-Received-Date: Mon, 08 May 2017 03:09:56 -0000
Content-Type: text/plain

The following changes since commit 381897c64069ea43d595380a3ae913bcc79cf7e1:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:47 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/cve-check-tool
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cve-check-tool

Chen Qi (1):
  cve-check-tool: backport a patch to make CVE checking work

 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  1 +
 ...are-computed-vs-expected-sha256-digit-str.patch | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch

-- 
1.9.1


