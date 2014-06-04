Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD6CF6FBF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:46:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s549kDEY027217
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jun 2014 02:46:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 4 Jun 2014 02:46:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jun 2014 17:47:07 +0800
Message-ID: <cover.1401868700.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [daisy][PATCH 0/1] systemd: update a uclibc specific patch to avoid segment fault
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
X-List-Received-Date: Wed, 04 Jun 2014 09:46:16 -0000
Content-Type: text/plain

The following changes since commit af347d3298e15552d502d5b2ce497bbda9705bc7:

  binutils: Fix building nativesdk binutils with gcc 4.9 (2014-05-29 13:42:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/daisy-systemd-uclibc-alloca
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/daisy-systemd-uclibc-alloca

Chen Qi (1):
  systemd: update a uclibc specific patch to avoid segment fault

 .../systemd/systemd-pam-fix-fallocate.patch        |   57 +++++++++++---------
 1 file changed, 33 insertions(+), 24 deletions(-)

-- 
1.7.9.5


