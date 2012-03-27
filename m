Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SCQZD-0008PS-S4
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 09:11:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2R72fnm012660
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 00:02:41 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 27 Mar 2012 00:02:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Mar 2012 15:01:40 +0800
Message-ID: <cover.1332831633.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/2] contacts: fix build error and schema installation
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
X-List-Received-Date: Tue, 27 Mar 2012 07:11:44 -0000
Content-Type: text/plain

The following changes since commit d3e0beed9eef53018158c9f999cd20b44629aa61:

  guile: Deal with hardcoded path issues (2012-03-27 00:29:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/contacts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/contacts

Robert Yang (2):
  contacts 0.9: failed to build
  contacts.inc: conditionally install shema

 meta/recipes-sato/pimlico/contacts.inc             |    4 ++-
 .../contacts-conditionally-install-schema.patch    |   37 ++++++++++++++++++++
 meta/recipes-sato/pimlico/contacts_0.9.bb          |   15 +++++++-
 3 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch



