Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D593F72644
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 07:24:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBH7OMwl010058
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 23:24:23 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Dec 2014 23:24:22 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Dec 2014 15:24:22 +0800
Message-ID: <cover.1418800947.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] dhcp: add dhclient.service
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
X-List-Received-Date: Wed, 17 Dec 2014 07:24:23 -0000
Content-Type: text/plain

The following changes since commit 68ddb28a68ceb59cd1ed322c16143827ce1ac712:

  distrodata_class: checkpkg make usage of latest_versionstring methods in bitbake fetcher (2014-11-28 13:59:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-dhclient
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-dhclient

Chen Qi (1):
  dhcp: add dhclient.service

 meta/recipes-connectivity/dhcp/dhcp.inc            | 16 ++++++---
 .../dhcp/files/dhclient-systemd-wrapper            | 39 ++++++++++++++++++++++
 .../dhcp/files/dhclient.service                    | 13 ++++++++
 3 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient.service

-- 
1.9.1


