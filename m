Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE6065DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 19:59:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA7JxlTS027702
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 11:59:47 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Nov 2014 11:59:46 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Nov 2014 13:59:44 -0600
Message-ID: <cover.1415390286.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] eglibc option groups fixup
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
X-List-Received-Date: Fri, 07 Nov 2014 19:59:54 -0000
Content-Type: text/plain

This is a first pass at addressing 6796, 6797, and 6809. For the
latter two, I've just adopted the suggested fixes, for the former I've
dropped an #if that I don't *think* we need. This might produce bogus
results with the locale option group disabled, but it'll work in the
normal case and reduce the number of -Wundef warnings and build problems.

The following changes since commit dd93b3a950d063f4e3020362c636006f51fb5782:

  image_types.bbclass: whitespace and reorder (2014-11-06 16:41:38 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/glibcoptions
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/glibcoptions

Peter Seebach (1):
  eglibc-use-option-groups.patch: Several fixups

 .../glibc/glibc/eglibc-use-option-groups.patch     |   40 +------------------
 1 files changed, 3 insertions(+), 37 deletions(-)


