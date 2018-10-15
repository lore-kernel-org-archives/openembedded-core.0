Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BED66004D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 09:21:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9F9IjIR021840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 02:21:00 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 15 Oct 2018 02:19:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Oct 2018 17:25:26 +0800
Message-ID: <cover.1539595482.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bind: fix startup failure in sysvinit
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
X-List-Received-Date: Mon, 15 Oct 2018 09:21:10 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit b02f3bfe2fee291a9db85094e5f31b1933acf871:

  local.conf.sample.extended: add another warning to comment about GLIBC_GENERATE_LOCALES (2018-10-14 23:45:40 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/bind-sysvinit
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bind-sysvinit

Chen Qi (1):
  bind: fix startup failure in sysvinit

 .../0001-avoid-start-failure-with-bind-user.patch  | 27 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.11.4.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch

-- 
1.9.1


