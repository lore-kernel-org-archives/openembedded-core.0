Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A00A71994
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 06:26:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6H6QUfU017575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jul 2017 23:26:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 16 Jul 2017 23:26:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jul 2017 14:30:25 +0800
Message-ID: <cover.1500272958.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: workaround login failure on qemumips64 when 'pam' is enabled
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
X-List-Received-Date: Mon, 17 Jul 2017 06:26:30 -0000
Content-Type: text/plain

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd_qemumips64_login
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd_qemumips64_login

Chen Qi (1):
  systemd: workaround login failure on qemumips64 when 'pam' is enabled

 meta/recipes-core/systemd/systemd_232.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


