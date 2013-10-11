Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C46C66CC7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 10:06:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9BA680X013621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 03:06:08 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 11 Oct 2013 03:06:07 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Oct 2013 06:06:05 -0400
Message-ID: <cover.1381485178.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] populate_sdk_rpm: add python to nativesdk INSTALL_PROVIDESNAME_RPM list
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
X-List-Received-Date: Fri, 11 Oct 2013 10:06:08 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If any native SDK packages involve python scripts that start with
'#!/usr/bin/python', then the populate_sdk step will fail with:

    error: Can't install nativesdk-xxx-$ver@x86_64_nativesdk: \
    no package provides /usr/bin/python

Just like perl, we also need to add python to INSTALL_PROVIDESNAME_RPM
list to fix this issue.

The following changes since commit 102bf5e0f640fe85068452a42b85077f1c81e0c9:

  build-appliance: Update SRCREV for release (2013-10-08 16:33:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/nativesdk-ignore-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/nativesdk-ignore-python

Wenzong Fan (1):
  populate_sdk_rpm: add python to nativesdk INSTALL_PROVIDESNAME_RPM
    list

 meta/classes/populate_sdk_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


