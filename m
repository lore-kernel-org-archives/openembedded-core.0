Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4CC77547F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 04:36:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA24aJZk020433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 21:36:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 21:36:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 12:42:40 +0800
Message-ID: <cover.1541133621.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/3] systemd: backport patches to fix 3 CVEs
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
X-List-Received-Date: Fri, 02 Nov 2018 04:36:19 -0000
Content-Type: text/plain

Changes in V2:
* fix the cve tag problem in the included patch
* use the patches from systemd-stable repo instead of the systemd repo

The following changes since commit 411184bfaa6269bf2926bb2a576c0922958cbbb3:

  xserver-xorg: fix CVE-2018-14665 (2018-11-01 13:27:26 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-CVEs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-CVEs

Chen Qi (3):
  systemd: fix CVE-2018-15686
  systemd: fix CVE-2018-15687
  systemd: fix CVE-2018-15688

 ...sive-let-s-rework-the-recursive-logic-to-.patch | 219 ++++++++++++++++++
 ...eserializing-state-always-use-read_line-L.patch | 250 +++++++++++++++++++++
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |  39 ++++
 meta/recipes-core/systemd/systemd_239.bb           |   3 +
 4 files changed, 511 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch

-- 
1.9.1


