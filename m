Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 45EEF6FA74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 02:39:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4R2dR9G020733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 19:39:27 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 19:39:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 May 2014 22:15:13 -0400
Message-ID: <cover.1401154976.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [dora] [PATCH 0/3] 3 fixes for dora
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
X-List-Received-Date: Tue, 27 May 2014 02:39:30 -0000
Content-Type: text/plain

The following changes since commit 4c58fe468790822fe48e0a570779979c831d0f10:

  openssl: fix CVE-2014-0198 (2014-05-21 09:32:38 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib robert/dora-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=robert/dora-next

Chen Qi (1):
  populate-extfs.sh: keep file timestamps

Jonathan Liu (1):
  consolekit: fix console-kit-log-system-start.service startup

Mark Hatle (1):
  rpm: Fix rpm -V usage

 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   10 ++++++++-
 .../rpm/rpm/rpm-verify-files.patch                 |   22 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
 .../recipes-support/consolekit/consolekit_0.4.6.bb |    6 ++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch

-- 
1.7.10.4


