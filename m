Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 551BA71974
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 08:41:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7R8fvJO028311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 01:41:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 01:41:56 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2018 16:46:35 +0800
Message-ID: <cover.1535359523.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] staging.bbclass: avoid staging native components for target sysroot
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
X-List-Received-Date: Mon, 27 Aug 2018 08:41:56 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 87d3a9685dd9613e4f6718031d4ebd9344b01c47:

  bitbake: parse/ast: ensure saved event handlers really do get restored (2018-08-24 07:53:14 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/staging-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/staging-native

Chen Qi (1):
  staging.bbclass: avoid staging native components for target sysroot

 meta/classes/staging.bbclass | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


