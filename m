Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94CED6AA78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 14:35:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5OEZdO3002996
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:35:39 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 24 Jun 2013 07:35:38 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:45:46 -0500
Message-ID: <1372085149-30510-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/3] Update the sanity check and make
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
X-List-Received-Date: Mon, 24 Jun 2013 14:35:37 -0000
Content-Type: text/plain

The sanity check should also look for the broken version of make.

Our version of make also happens to be broken, so fix that as well.

And add nativesdk-make to the buildtools-tarball, to assist people with
broken buildtools.  (Note, current Fedora and CentOS machines contain
the broken make as well.  A patch is pending in the Fedora community
to update this.)

Mark Hatle (3):
  sanity.bbclass: Check for the known broken version of make
  make: Fix second part of bug Savannah 30612
  buildtools-tarball: Add nativesdk-make

 meta/classes/sanity.bbclass                        | 39 +++++++++++++++
 meta/recipes-core/meta/buildtools-tarball.bb       |  3 +-
 .../make-savannah-bug30612-fix_white_space.patch   | 58 ++++++++++++++++++++++
 meta/recipes-devtools/make/make_3.82.bb            |  5 +-
 4 files changed, 102 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch

-- 
1.8.3.1


