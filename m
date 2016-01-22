Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 740AE6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 02:01:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0M21rAg013720
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 18:01:53 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 21 Jan 2016 18:01:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 10:02:17 +0800
Message-ID: <cover.1453427632.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: work around the boot problem on qemuarm64
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
X-List-Received-Date: Fri, 22 Jan 2016 02:01:52 -0000
Content-Type: text/plain

The problem is that systemd based systems cannot boot on qemuarm64.

The patch is a workaround and I hope people who have more knowledge in this area
come up with a better fix.

The following changes since commit 8084c185c43cb7e7f5e29d31939dfd308f8a0f93:

  udev: Add 2 patches to support 4.4 kernel (2016-01-20 09:20:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-qemuarm64
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-qemuarm64

Chen Qi (1):
  systemd: work around the boot problem on qemuarm64

 meta/recipes-core/systemd/systemd_228.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


