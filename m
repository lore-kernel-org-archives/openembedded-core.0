Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B16D470034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 09:23:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4P9Nw51018376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 02:23:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 May 2016 02:23:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 May 2016 02:23:56 -0700
Message-ID: <cover.1464168189.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix utility-tasks.bbclass and nopackages.bbclass
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
X-List-Received-Date: Wed, 25 May 2016 09:23:59 -0000
Content-Type: text/plain

The following changes since commit bb4ead9b7b1400c37a72d148d9775bdf4210ec37:

  linux-yocto/4.4: integrate v4.4.11 (2016-05-25 07:49:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/list
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/list

Robert Yang (2):
  utility-tasks.bbclass: fix do_listtasks
  nopackages.bbclass: deltask foo_setscene

 meta/classes/nopackages.bbclass    |  6 ++++++
 meta/classes/utility-tasks.bbclass | 16 ++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.8.0


