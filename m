Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4E56AF6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 19:56:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6FJuxv3019564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 12:56:59 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Jul 2013 12:56:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 15:10:25 -0500
Message-ID: <1373919029-19108-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/4] A few misc patch
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
X-List-Received-Date: Mon, 15 Jul 2013 19:56:57 -0000
Content-Type: text/plain

The following is a small set of patches create in the last week or so when
upreving to the latest oe-core.

The sanity.bbclass may be the final fix for Yocto Project bug 4845.

Mark Hatle (4):
  sanity.bbclass: Update gcc sanity check
  terminal.bbclass: Fix BB_RUNFMT processing
  busybox: fix ip reference in simple.script
  dbus-ptest: Disable python module check

 meta/classes/sanity.bbclass                        | 42 +++++++++++++++-------
 meta/classes/terminal.bbclass                      |  4 ++-
 meta/recipes-core/busybox/files/simple.script      |  2 +-
 .../dbus/dbus-1.6.8/python-config.patch            | 25 +++++++++++++
 meta/recipes-core/dbus/dbus-ptest_1.6.10.bb        |  1 +
 5 files changed, 59 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.8/python-config.patch

-- 
1.8.3


