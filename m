Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB7D965CED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 04:42:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA54gEgZ015650
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Nov 2014 20:42:14 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 4 Nov 2014 20:42:13 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Nov 2014 12:43:59 +0800
Message-ID: <cover.1415162598.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: avoid using system-auth
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
X-List-Received-Date: Wed, 05 Nov 2014 04:42:15 -0000
Content-Type: text/plain

The following changes since commit d7a277b35bcc67050046c76fb70412101679a545:

  docbook-xsl-stylesheets: add perl to RDEPENDS (2014-11-04 10:20:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/system-user
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/system-user

Chen Qi (1):
  systemd: avoid using system-auth

 ...0001-systemd-user-avoid-using-system-auth.patch | 27 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemd-user-avoid-using-system-auth.patch

-- 
1.9.1


