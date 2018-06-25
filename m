Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43D8A6079F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 09:31:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5P9V04N022262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 02:31:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 02:30:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jun 2018 17:33:50 +0800
Message-ID: <cover.1529919069.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] oeqa/runtime/cases/systemd.py: avoid timeout problem
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
X-List-Received-Date: Mon, 25 Jun 2018 09:31:03 -0000
Content-Type: text/plain

The following changes since commit a5d1288804e517dee113cb9302149541f825d316:

  meta-yocto-bsp: Workaround the Ethernet malfunction on edgerouter when building with gcc8 (2018-06-21 09:59:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-bus-timeout
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-bus-timeout

Chen Qi (1):
  oeqa/runtime/cases/systemd.py: avoid timeout problem

 meta/lib/oeqa/runtime/cases/systemd.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
1.9.1


