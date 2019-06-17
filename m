Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8757B7E711
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 02:00:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5H20RqA017625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2019 19:00:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 16 Jun 2019 19:00:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2019 10:12:28 +0800
Message-ID: <cover.1560737530.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] context.py: fix skipping function
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
X-List-Received-Date: Mon, 17 Jun 2019 02:00:26 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 27d60c5a812774f0e5c43161e5b514c4aebdf301:

  gstreamer1.0-libav: disable API documentation (2019-06-15 13:46:38 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/oeqa-skiptests
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/oeqa-skiptests

Chen Qi (1):
  context.py: fix skipping function

 meta/lib/oeqa/core/context.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.9.1


