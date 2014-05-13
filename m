Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A181366069
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 07:46:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4D7k6Ec029349
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 00:46:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 13 May 2014 00:46:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 May 2014 15:46:25 +0800
Message-ID: <cover.1399967110.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] openssh: two CVE fixes
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
X-List-Received-Date: Tue, 13 May 2014 07:46:05 -0000
Content-Type: text/plain

The following changes since commit 23521fccb122b64f3469d46176f73fe476b0dfc5:

  gstreamer1.0-plugins-good: add libxfixes and libxdamange to x11 depends (2014-05-11 13:07:36 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/openssh-CVE-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/openssh-CVE-fixes

Chen Qi (2):
  openssh: fix for CVE-2014-2532
  openssh: fix for CVE-2014-2653

 .../openssh/openssh/openssh-CVE-2014-2532.patch    |   22 ++++
 .../openssh/openssh/openssh-CVE-2014-2653.patch    |  114 ++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb |    4 +-
 3 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch

-- 
1.7.9.5


