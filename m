Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43CC66AC01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 09:06:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9U96rsZ021584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 02:06:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 02:06:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Oct 2014 17:08:30 +0800
Message-ID: <cover.1414659743.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libpam: add system-auth in case of systemd
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
X-List-Received-Date: Thu, 30 Oct 2014 09:06:59 -0000
Content-Type: text/plain

The following changes since commit 4143f3b0ce0d0c52f5b0babc1bb16ac0ac9610eb:

  nativesdk-cmake: Adjust toolchain paths dynamically (2014-10-24 21:59:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/libpam-systemd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/libpam-systemd

Chen Qi (1):
  libpam: add system-auth in case of systemd

 meta/recipes-extended/pam/libpam/pam.d/system-auth | 12 ++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/pam.d/system-auth

-- 
1.9.1


