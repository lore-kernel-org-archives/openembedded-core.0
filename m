Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB136AC66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:23:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s626N11I013245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:23:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 1 Jul 2014 23:23:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 14:24:38 +0800
Message-ID: <cover.1404282047.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] openssh: avoid checking empty passwords to mess up with PAM modules
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
X-List-Received-Date: Wed, 02 Jul 2014 06:23:04 -0000
Content-Type: text/plain

The following changes since commit c36d459f0d40bdbd3ba809835e0475e8992bc778:

  python3: fix builtins imports (2014-06-30 16:35:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/openssh-pam
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/openssh-pam

Chen Qi (1):
  openssh: avoid checking empty passwords to mess up with PAM modules

 ...c-avoid-authenticate-empty-passwords-to-m.patch |   30 ++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |    3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch

-- 
1.7.9.5


