Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADE0731E7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:11:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B5BcIM013533
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:11:38 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 21:11:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 21:11:35 -0800
Message-ID: <cover.1452489034.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Mon, 11 Jan 2016 05:11:37 -0000
Content-Type: text/plain

Hi,

The 2 patches can reduce a lot of QA Issues for buildpaths.

// Robert

The following changes since commit 5661d8cb7849df62358368743134c0aaf523965e:

  image: Really remove lockfiles flag (2016-01-07 13:41:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/relative
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/relative

Robert Yang (2):
  glibc-initial.inc: use relative path to run configure
  autotools.bbclass: use relative path to run configure script

 meta/classes/autotools.bbclass            |    4 +++-
 meta/recipes-core/glibc/glibc-initial.inc |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.9.5


