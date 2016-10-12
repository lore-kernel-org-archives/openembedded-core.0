Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 635FE70101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 09:19:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9C9J6uZ012233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 02:19:07 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 02:19:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2016 02:19:04 -0700
Message-ID: <cover.1476263868.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/2] fixes for package_foo
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
X-List-Received-Date: Wed, 12 Oct 2016 09:19:08 -0000
Content-Type: text/plain

The following changes since commit 1a2311c8fa9a3703568cd390c44639fe3335023e:

  build-appliance-image: Update to master head revision (2016-10-11 23:43:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/package
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/package

Robert Yang (2):
  package_tar: avoid chdir warnings and restore cwd after packaging
  package_ipk/rpm/deb: remove unneeded dir settings

 meta/classes/package_deb.bbclass | 1 -
 meta/classes/package_ipk.bbclass | 1 -
 meta/classes/package_rpm.bbclass | 1 -
 meta/classes/package_tar.bbclass | 5 +++++
 4 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.9.0


