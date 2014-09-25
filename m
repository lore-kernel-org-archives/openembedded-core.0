Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A637160144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 09:10:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8P9AYci003219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 02:10:35 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 25 Sep 2014 02:10:34 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Sep 2014 17:09:48 +0800
Message-ID: <cover.1411636114.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] apt: fix for CVE-2014-0478
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
X-List-Received-Date: Thu, 25 Sep 2014 09:10:35 -0000
Content-Type: text/plain

The following changes since commit 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3:

  build-appliance-image: Update to dizzy head revision (2014-09-23 22:10:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/apt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/apt

Chong Lu (1):
  apt: fix for CVE-2014-0478

 .../apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch    | 188 +++++++++++++++++++++
 meta/recipes-devtools/apt/apt.inc                  |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch

-- 
1.9.1


