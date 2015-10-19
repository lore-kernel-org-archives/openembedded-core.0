Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99B237704A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 03:16:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9J3G5H6029775
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Oct 2015 20:16:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 18 Oct 2015 20:16:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Oct 2015 11:16:39 +0800
Message-ID: <cover.1445224515.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix file permission for pam configuration files
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
X-List-Received-Date: Mon, 19 Oct 2015 03:16:08 -0000
Content-Type: text/plain

The following changes since commit 10e5df3503632a6e1c54612055b19f7258c3ae2f:

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:22 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/etc-pam
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/etc-pam

Chen Qi (2):
  openssh: fix file permission for /etc/pam.d/sshd
  sudo: fix file permission for /etc/pam.d/sudo

 meta/recipes-connectivity/openssh/openssh_7.1p1.bb | 2 +-
 meta/recipes-extended/sudo/sudo_1.8.14p3.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


