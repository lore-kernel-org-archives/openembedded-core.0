Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABD165D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 09:03:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9V93DFn005851
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 02:03:13 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 31 Oct 2014 02:03:12 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Oct 2014 16:59:53 +0800
Message-ID: <cover.1414745908.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] docbook-xsl-stylesheets: add perl to RDEPENDS
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
X-List-Received-Date: Fri, 31 Oct 2014 09:03:14 -0000
Content-Type: text/plain

Change since v1:
use patch instead of sed command

The following changes since commit f19b4e995ea47f9243f152b39337330307453c9f:

  bitbake: bitbake: clarify startup message (2014-10-30 13:39:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/doc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/doc

Chong Lu (1):
  docbook-xsl-stylesheets: add perl to RDEPENDS

 ...-stylesheets-no-bashism-in-docbook-xsl-up.patch | 24 ++++++++++++++++++++++
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |  2 ++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch

-- 
1.9.1


