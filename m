Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBFC710C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:51:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s847p4Ei012219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Sep 2014 00:51:04 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 4 Sep 2014 00:51:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Sep 2014 15:50:59 +0800
Message-ID: <cover.1409816594.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] lttng-tools: add PACKAGECONFIG to support --enable-python-bindings and lttng-ust
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
X-List-Received-Date: Thu, 04 Sep 2014 07:51:06 -0000
Content-Type: text/plain

Changed in V2:
    The python-bindings requires swig-native as DEPENDS, and 
    swig-native is not in oe-core, so disable python-bindings
    by default

//Hongxu

The following changes since commit a44006262cf3b810ec78b4cccd8076102a7a0f3e:

  distro/poky: Add Debian 7.5 and 7.6 version as validated (2014-09-03 16:00:29 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-lttng-tools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-lttng-tools

Hongxu Jia (1):
  lttng-tools: add PACKAGECONFIG to support --enable-python-bindings and
    lttng-ust

 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
1.9.1


