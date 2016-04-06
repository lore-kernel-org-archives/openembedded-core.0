Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A432C73199
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 09:30:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u369U2OT016735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Apr 2016 02:30:03 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Apr 2016 02:30:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Apr 2016 02:30:00 -0700
Message-ID: <cover.1459934955.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Fixes for len(TMPDIR) == 410
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
X-List-Received-Date: Wed, 06 Apr 2016 09:30:04 -0000
Content-Type: text/plain

The following changes since commit b2dc5a68e74dafedf7960ef77ad3d73912ed7960:

  bdwgc: use github repo for source location (2016-04-05 11:48:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/long
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/long

Robert Yang (2):
  sanity.bbclass: fix a hardcode in check_path_length()
  wget: fix build when len(TMPDIR) == 410

 meta/classes/sanity.bbclass         | 2 +-
 meta/recipes-extended/wget/wget.inc | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.8.0


