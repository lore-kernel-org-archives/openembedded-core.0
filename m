Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A485479BE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 06:57:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9M6vbAX017996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 23:57:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 21 Oct 2018 23:57:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 15:03:42 +0800
Message-ID: <cover.1540191752.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] systemd: add back alternatives for init utitilies
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
X-List-Received-Date: Mon, 22 Oct 2018 06:57:36 -0000
Content-Type: text/plain

Changes in V2:
* Remove 'init' from alternatives.

The following changes since commit 8e4c03744cfa8cc559682ebf7074643216dd2b9d:

  oe-selftest: devtool: Support meta being a symbolic link (2018-10-21 21:30:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-alternatives
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-alternatives

Chen Qi (1):
  systemd: add back alternatives for init utitilies

 meta/recipes-core/systemd/systemd_239.bb | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
1.9.1


