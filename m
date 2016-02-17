Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFE4E731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 05:20:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1H5KpBF029290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 21:20:52 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 16 Feb 2016 21:20:51 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2016 13:21:21 +0800
Message-ID: <cover.1455686332.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] image/populate_sdk: seprate variables to fix dependency
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
X-List-Received-Date: Wed, 17 Feb 2016 05:20:54 -0000
Content-Type: text/plain

Changes since V1:
Rebase patch against latest master.

The following changes since commit 31af4a37c429bb1db8bfc64242b2963220f9a0e1:

  oeqa/parselogs: Whitelist dmi firmware failure message in 4.4 kernels (2016-02-16 23:53:43 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/YP8670
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/YP8670

Chen Qi (1):
  image/populate_sdk: seprate variables to fix dependency

 meta/classes/image.bbclass             | 16 +++++++---------
 meta/classes/populate_sdk_base.bbclass | 13 +++++++++++++
 2 files changed, 20 insertions(+), 9 deletions(-)

-- 
1.9.1


