Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RktRz-0001bW-Sp
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 09:22:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0B7jjKJ011894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 23:45:45 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 10 Jan 2012 23:45:45 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jan 2012 15:34:10 +0800
Message-ID: <cover.1326266933.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH v2 0/1] archive.bbclass: archive work directory
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
X-List-Received-Date: Wed, 11 Jan 2012 08:22:28 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

v2 updates:

1) Remove the special-casing for gcc, checking for any packages under
'tmp/work-shared';

2) Remove some bash-specific code, replase the '[[regular-expression]]'
with isovalent 'grep' statement.


The following changes since commit 4a8a3c503fd896593b787c26edbe46a7324e494e:
  Richard Purdie (1):
        Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works"

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/1590
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1590

Wenzong Fan (1):
  archive.bbclass: archive work directory

 meta/classes/archive.bbclass |   49 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/archive.bbclass



