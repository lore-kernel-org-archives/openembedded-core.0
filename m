Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Sx7LX-0004As-0A
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 04:10:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q731wqth007112
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 18:58:53 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 2 Aug 2012 18:58:52 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Aug 2012 09:57:26 +0800
Message-ID: <1343959047-24613-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Subject: [PATCH] libxpm-native: add dependency on gettext-native
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
X-List-Received-Date: Fri, 03 Aug 2012 02:10:35 -0000
Content-Type: text/plain

libxpm needs xgettext. There can be failures if gettext doesn't get built first
and it's not available from the host.

The target version doesn't have issues since it will get the dependency
indirectly.

Jesse Zhang (1):
  libxpm-native: add dependency on gettext-native

 meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.7



