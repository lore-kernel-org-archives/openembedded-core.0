Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60C9379F11
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 01:47:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA21lcJV019351
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 18:47:48 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 18:47:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 09:53:48 +0800
Message-ID: <cover.1541123540.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] systemd: backport patches to fix 3 CVEs
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
X-List-Received-Date: Fri, 02 Nov 2018 01:47:57 -0000
Content-Type: text/plain

The following changes since commit 411184bfaa6269bf2926bb2a576c0922958cbbb3:

  xserver-xorg: fix CVE-2018-14665 (2018-11-01 13:27:26 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-CVEs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-CVEs

Chen Qi (3):
  systemd: fix CVE-2018-15686
  systemd: fix CVE-2018-15687
  systemd: fix CVE-2018-15688

 ...sive-let-s-rework-the-recursive-logic-to-.patch | 216 +++++++++++++++++++
 ...eserializing-state-always-use-read_line-L.patch | 238 +++++++++++++++++++++
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |  36 ++++
 meta/recipes-core/systemd/systemd_239.bb           |   3 +
 4 files changed, 493 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch

-- 
1.9.1


