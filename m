Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE6396010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 06:18:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1E6ITSn006673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 22:18:29 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Wed, 13 Feb 2019 22:18:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Feb 2019 14:37:18 +0800
Message-ID: <cover.1550126097.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] base.bbclass: Check BuildStarted for HOSTTOOLS
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
X-List-Received-Date: Thu, 14 Feb 2019 06:18:29 -0000
Content-Type: text/plain

* V2
  - Tweak the position of BuildStarted a little and fix comments as Peter
    Kjellerstedt suggested.

* V1
  - Initial version

// Robert

The following changes since commit 430bd28093fb743ba3bd032e11e40b4dd8e5bd1f:

  linux-yocto: add baseline ARC support (2019-02-12 14:04:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ht
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ht

Robert Yang (1):
  base.bbclass: Check BuildStarted for HOSTTOOLS

 meta/classes/base.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.7.4


