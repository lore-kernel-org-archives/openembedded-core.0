Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74CC871210
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 05:55:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9A5t7M9024499
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Oct 2014 22:55:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 22:55:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 22:55:05 -0700
Message-ID: <cover.1412920464.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] fix rebuild for 2 recipes
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
X-List-Received-Date: Fri, 10 Oct 2014 05:55:10 -0000
Content-Type: text/plain

The following changes since commit 16cedc3bce6fc37543e9ef053cd7c589e523ca1c:

  package_ipk.bbclass: Fix SRC_URI whitespace handling (2014-10-06 16:03:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rebuild
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rebuild

Robert Yang (2):
  libassuan: fix for rebuild
  wpa-supplicant: fix for rebuild

 .../wpa-supplicant/wpa-supplicant.inc              |    2 ++
 meta/recipes-support/libassuan/libassuan_2.1.2.bb  |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.9.5


