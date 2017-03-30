Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43E156B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 05:11:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2U5BRVr013855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 22:11:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 29 Mar 2017 22:11:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 13:12:43 +0800
Message-ID: <cover.1490850708.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] image.inc/qemu.inc: preserve directories to be used by runqemu
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
X-List-Received-Date: Thu, 30 Mar 2017 05:11:27 -0000
Content-Type: text/plain

The following changes since commit 2acc741dd02cd796b396484a8676250a8f97c975:

  maintainers.inc: Add maintainers to go-native and vulkan software package recipes (2017-03-29 16:37:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/runqemu_rm_work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/runqemu_rm_work

Chen Qi (1):
  image.inc/qemu.inc: preserve directories to be used by runqemu

 meta/classes/image.bbclass         | 1 +
 meta/conf/machine/include/qemu.inc | 3 +++
 2 files changed, 4 insertions(+)

-- 
1.9.1


