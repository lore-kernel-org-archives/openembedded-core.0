Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 455CC65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 08:20:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t888KZml012080
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 01:20:35 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 01:20:34 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Sep 2015 16:15:11 +0800
Message-ID: <cover.1441700018.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix screen build failure
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
X-List-Received-Date: Tue, 08 Sep 2015 08:20:39 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit c1df471feacaf2590216aa476ce242908dac38cf:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:26:27 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/screen
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/screen

Kai Kang (1):
  screen: backport to fix build error

 .../screen/0002-comm.h-now-depends-on-term.h.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.3.1.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch

-- 
1.9.1


