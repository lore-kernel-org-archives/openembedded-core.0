Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30DF36FF64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 06:39:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2F6dVnR007300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 23:39:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 14 Mar 2016 23:39:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Mar 2016 14:39:39 +0800
Message-ID: <cover.1458023911.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] dhcp: enable gentle shutdown
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
X-List-Received-Date: Tue, 15 Mar 2016 06:39:31 -0000
Content-Type: text/plain

Changes since V1:
Rebased against latest master.

The following changes since commit 300f858ba07c938427ccd05a3d7220027a03d461:

  local.conf.sample: Disable prelink by default (2016-03-13 22:08:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/dhcp-gentle-shutdown
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/dhcp-gentle-shutdown

Chen Qi (1):
  dhcp: enable gentle shutdown

 .../dhcp/0001-site.h-enable-gentle-shutdown.patch  | 25 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb       |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch

-- 
1.9.1


