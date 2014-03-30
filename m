Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5473D6F737
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 10:30:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2UAUZML000405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 03:30:36 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 30 Mar 2014 03:30:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 30 Mar 2014 06:30:32 -0400
Message-ID: <cover.1396175372.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] gtk+3: set proper FLAGS for native
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
X-List-Received-Date: Sun, 30 Mar 2014 10:30:37 -0000
Content-Type: text/plain

The following changes since commit 2a33669ee0bd8a5d79489cafbff7309320de8d36:

  packagegroup-toolset-native: remove it (2014-03-29 00:12:30 -0400)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/gtk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/gtk

Robert Yang (1):
  gtk+3: set proper FLAGS for native

 .../gtk+/gtk+3/fix-flags-for-native.patch          |   40 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb            |    4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch

-- 
1.7.10.4


