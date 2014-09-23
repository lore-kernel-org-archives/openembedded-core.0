Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE7D617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 10:29:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NAT1Cc004400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 03:29:02 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 03:29:01 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 06:28:59 -0400
Message-ID: <cover.1411467020.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] systemtap: disable libvirt
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
X-List-Received-Date: Tue, 23 Sep 2014 10:29:08 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

libvirt is automatically linked to if present, this undetermined
dependency may cause build errors like:

  ../lib/libvirt.so: undefined reference to `libssh2_channel_open_ex'
  ../lib/libvirt.so: undefined reference to `libssh2_session_hostkey'
  ...

Both libvirt and libssh2 are not oe-core recipes for now, just disable
libvirt to fix this issue.

The following changes since commit afdbe3112b940987f3f3cddcb32c91a5e17a297d:

  bitbake: bitbake-worker: Fix bitbake -n (2014-09-22 15:54:40 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/systemtap
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/systemtap

Wenzong Fan (1):
  systemtap: disable libvirt

 .../configure-allow-to-disable-libvirt.patch       |   39 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    3 ++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 3 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch

-- 
1.7.9.5


