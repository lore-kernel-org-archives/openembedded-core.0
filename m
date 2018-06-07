Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C89AC770CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 07:50:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w577oAcg019813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2018 00:50:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 7 Jun 2018 00:50:10 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jun 2018 15:52:45 +0800
Message-ID: <cover.1528357628.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] runqemu: clean up correctly on receiving SIGTERM
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
X-List-Received-Date: Thu, 07 Jun 2018 07:50:10 -0000
Content-Type: text/plain

The following changes since commit 1c7ad49bfd3e60c44281a8f49d69f4b96c359703:

  bitbake: bitbake: Update version to post release 1.39 (2018-06-06 13:35:15 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/runqemu-sigterm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/runqemu-sigterm

Chen Qi (2):
  runqemu: add SIGTERM handler to make sure things are cleaned up
  runqemu-ifdown: ensure to clean up TAP

 scripts/runqemu        | 23 ++++++++++++++++++++++-
 scripts/runqemu-ifdown | 10 ++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

-- 
1.9.1


