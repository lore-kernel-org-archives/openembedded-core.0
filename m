Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3333A7318F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 07:54:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u057sOXl019092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jan 2016 23:54:25 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Jan 2016 23:54:24 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jan 2016 15:54:23 +0800
Message-ID: <cover.1451980412.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] image/populate_sdk: seprate variables to fix dependency
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
X-List-Received-Date: Tue, 05 Jan 2016 07:54:25 -0000
Content-Type: text/plain

The following changes since commit 80b3974081c4a8c604e23982a6db8fb32c616058:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:08:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/bug8670
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/bug8670

Chen Qi (1):
  image/populate_sdk: seprate variables to fix dependency

 meta/classes/image.bbclass             | 16 +++++++---------
 meta/classes/populate_sdk_base.bbclass | 14 ++++++++++++++
 2 files changed, 21 insertions(+), 9 deletions(-)

-- 
1.9.1


