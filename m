Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F63D73211
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 08:37:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u738bsGu015331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2016 01:37:54 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Aug 2016 01:37:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Aug 2016 01:37:52 -0700
Message-ID: <cover.1470213435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] package.bbclass: remove unneeded chmod() and chown()
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
X-List-Received-Date: Wed, 03 Aug 2016 08:37:55 -0000
Content-Type: text/plain

The following changes since commit 986f7fbe37a48d050611f08f7160ed96755ac3dc:

  foomatic-filters: Security fixes CVE-2015-8327 (2016-08-01 12:11:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/mode
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/mode

Robert Yang (1):
  package.bbclass: remove unneeded chmod() and chown()

 meta/classes/package.bbclass | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.9.0


