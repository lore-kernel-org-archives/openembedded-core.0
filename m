Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA847389D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:28:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t249SRR6009130
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 01:28:27 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 01:28:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 01:28:25 -0800
Message-ID: <cover.1425461268.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Upgrade wget and git
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
X-List-Received-Date: Wed, 04 Mar 2015 09:28:30 -0000
Content-Type: text/plain

The following changes since commit 3c78468f12296abd02abce6eeac0f69bc7509958:

  build-appliance-image: Update to master head revision (2015-03-03 13:12:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (2):
  wget: 1.16.1 -> 1.16.2
  git: 2.3.0 -> 2.3.1

 .../git/{git_2.3.0.bb => git_2.3.1.bb}             |    8 ++++----
 meta/recipes-extended/wget/wget/fix_makefile.patch |   17 +----------------
 .../wget/{wget_1.16.1.bb => wget_1.16.2.bb}        |    4 ++--
 3 files changed, 7 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/git/{git_2.3.0.bb => git_2.3.1.bb} (41%)
 rename meta/recipes-extended/wget/{wget_1.16.1.bb => wget_1.16.2.bb} (45%)

-- 
1.7.9.5


