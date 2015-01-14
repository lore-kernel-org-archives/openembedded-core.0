Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF3172541
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:20:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E9Kdox007575
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 01:20:39 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 01:20:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 01:20:34 -0800
Message-ID: <cover.1421227202.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: set CLEANBROKEN for 3 recipes
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
X-List-Received-Date: Wed, 14 Jan 2015 09:20:48 -0000
Content-Type: text/plain

The following changes since commit b61a2acc321489c3427f0afa3059486dc144a13b:

  bind: Update libxml2 check to make it deterministic. (2015-01-08 09:21:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/clean
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/clean

Robert Yang (4):
  slang: set CLEANBROKEN
  mkelfimage: set CLEANBROKEN
  quilt: set CLEANBROKEN
  autotools.bbclass: print make clean

 meta/classes/autotools.bbclass                     |    1 +
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    2 ++
 meta/recipes-devtools/quilt/quilt-0.63.inc         |    2 ++
 meta/recipes-extended/slang/slang_2.2.4.bb         |    2 ++
 4 files changed, 7 insertions(+)

-- 
1.7.9.5


