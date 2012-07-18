Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SrO6h-0003L0-ER
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 08:51:35 +0200
Received: by pbbrq2 with SMTP id rq2so1867165pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cjtJqyj2jwMY/azy7lP4CK2pxDz0BVQZL+2iyDEbPlY=;
	b=PUKFBwrAPTPqI4jjjWIGXVjMbpEJoH72H+cBhW322d/+zDIuC31LoDC0/dttFlsBN1
	3bfeD/0KtHERrshinhMax8ReK/yAP7HuzbzdLgUxfC1rXgVy7yKA4FYm6IZnPbkZdFBM
	yPxPtgNaREZmWW3Z4Pg21Mm/VEop+HZylqu3NvF5Ot3iaPvkj7YBW/3b/gq3xIa+kHRr
	kkW0EDSWFXmvFqEgoXPfil07/431GovCOnF3/AVMJO9cjabTxILYlLOfcpCCqTJucSJV
	qEOArrBfdIBl3BLMVYjrgZv3dH9Sqrv5LI/8Pa5/XnMFgswx9bKH/5CKLFjKxDY1DXO3
	vJZQ==
Received: by 10.68.223.138 with SMTP id qu10mr4540746pbc.50.1342593614387;
	Tue, 17 Jul 2012 23:40:14 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id of4sm15585711pbb.51.2012.07.17.23.40.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 23:40:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 23:39:28 -0700
Message-Id: <cover.1342593440.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] more eglibc 2.16 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 06:51:35 -0000

This patchset is a followup to eglibc update
It cleans up the use of 'proto' in SRC_URI of
svn recipes

Fixes eglibc 2.16 build on ppc e500v1 and e500v2 cores

The following changes since commit 2bd0aaf98c5d586638d82f5f22c1c24122a889a3:

  toolchain-scripts: Sync the SDK/ADT values to the build system (2012-07-17 18:02:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.16

Khem Raj (2):
  eglibc: Fix build for e500 cores
  recipes: Change 'proto' to 'protocol' in SRC_URI

 .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
 .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
 .../eglibc/eglibc-2.16/e500-math_private.patch     |   31 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |    2 +-
 5 files changed, 36 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch

-- 
1.7.9.5



