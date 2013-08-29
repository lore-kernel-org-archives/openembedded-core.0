Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51BC66BC8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 13:13:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7TDDcQb017382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 06:13:38 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 29 Aug 2013 06:13:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2013 09:13:33 -0400
Message-ID: <cover.1377781793.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] state.bbclass: check before open the manifest
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
X-List-Received-Date: Thu, 29 Aug 2013 13:13:40 -0000
Content-Type: text/plain

The following changes since commit 5745e45b18e5099e94b4d5a73bc97dc6d4cdc91f:

  buildtools-tarball: Add python-pkgutil (2013-08-29 00:23:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/sstate

Robert Yang (1):
  sstate.bbclass: check before open the manifest

 meta/classes/sstate.bbclass |    3 +++
 1 file changed, 3 insertions(+)

-- 
1.7.10.4


