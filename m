Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8E2708B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 05:34:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s995Y1Mq013048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Oct 2014 22:34:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 8 Oct 2014 22:34:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 13:35:06 +0800
Message-ID: <cover.1412832836.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] rpcbind: make service socket activated
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
X-List-Received-Date: Thu, 09 Oct 2014 05:34:07 -0000
Content-Type: text/plain

The following changes since commit 16cedc3bce6fc37543e9ef053cd7c589e523ca1c:

  package_ipk.bbclass: Fix SRC_URI whitespace handling (2014-10-06 16:03:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/rpcbind-systemd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/rpcbind-systemd

Chen Qi (1):
  rpcbind: make service socket activated

 meta/recipes-extended/rpcbind/rpcbind/rpcbind.service | 9 +++------
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket  | 8 ++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb        | 5 +++--
 3 files changed, 14 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket

-- 
1.9.1


