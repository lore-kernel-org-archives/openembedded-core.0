Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8269D74AF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 06:23:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wB66NG3u003097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2018 22:23:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 22:23:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Dec 2018 14:30:35 +0800
Message-ID: <cover.1544066027.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] oeqa: drop support of listing machines in QEMU_USE_KVM
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
X-List-Received-Date: Thu, 06 Dec 2018 06:23:21 -0000
Content-Type: text/plain

Changes in V2:
* Also check QB_CPU_KVM to determine whether to enable kvm or not

The following changes since commit aa93957c8353d222961f08e54fe8d4095dad72c1:

  tcl: Upgrade to 8.6.9 (2018-12-05 22:30:19 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/qemu_use_kvm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/qemu_use_kvm

Chen Qi (1):
  oeqa: drop support of listing machines in QEMU_USE_KVM

 meta/classes/testimage.bbclass | 12 +++++++-----
 meta/lib/oeqa/targetcontrol.py | 12 +++++++-----
 2 files changed, 14 insertions(+), 10 deletions(-)

-- 
1.9.1


