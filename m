Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6CD0601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 05:21:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAO5LitP010688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 21:21:44 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.138) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 23 Nov 2015 21:21:44 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Nov 2015 13:21:43 +0800
Message-ID: <cover.1448342223.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dhcp: enable gentle shutdown
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
X-List-Received-Date: Tue, 24 Nov 2015 05:21:49 -0000
Content-Type: text/plain

The following changes since commit 6f98c39418c60b7c0b25b30983d2e5257158a6a4:

  gcc: Drop 4.8 (2015-11-16 14:59:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/dhcp-gentle-shutdown
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/dhcp-gentle-shutdown

Chen Qi (1):
  dhcp: enable gentle shutdown

 .../dhcp/0001-site.h-enable-gentle-shutdown.patch  | 25 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch

-- 
1.9.1


