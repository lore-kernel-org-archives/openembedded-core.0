Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 407036B5D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 02:58:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s062wcse015503
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Jan 2014 18:58:38 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 5 Jan 2014 18:58:37 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2014 10:57:34 +0800
Message-ID: <cover.1388976868.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/1] beecrypt: add ptest support
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
X-List-Received-Date: Mon, 06 Jan 2014 02:58:37 -0000
Content-Type: text/plain

Changes since V1:
Add ptest support in beecrypt_4.2.1.bb.

The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/beecrypt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/beecrypt

Chong Lu (1):
  beecrypt: add ptest support

 .../beecrypt/beecrypt/enable-ptest.patch           | 22 ++++++++++++++++++++++
 meta/recipes-support/beecrypt/beecrypt/run-ptest   |  5 +++++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    | 12 ++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/enable-ptest.patch
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/run-ptest

-- 
1.8.1.2


