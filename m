Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 619D879980
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:08:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T68CRO003425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 23:08:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:07:59 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 14:13:28 +0800
Message-ID: <cover.1538201555.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Two fixes regarding eSDK
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
X-List-Received-Date: Sat, 29 Sep 2018 06:08:11 -0000
Content-Type: text/plain

The following changes since commit 3bbbe25ae74e120f7d3452685f0cae2245d7b14d:

  glibc-package.inc: correct intention for deleting /usr/lib as needed (2018-09-27 23:41:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/esdk-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/esdk-fixes

Chen Qi (2):
  nativesdk-packagegroup-sdk-host.bb: remove nativesdk-dnf
  libsdl2: disable sndio explicitly to avoid inconsistent result

 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 -
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb                     | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


