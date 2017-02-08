Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80A1271AD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 06:30:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v186Uoho009860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Feb 2017 22:30:51 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 7 Feb 2017 22:30:50 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Feb 2017 14:30:50 +0800
Message-ID: <cover.1486535388.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix string formatting issue in console-tools
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
X-List-Received-Date: Wed, 08 Feb 2017 06:30:52 -0000
Content-Type: text/plain

The following changes since commit a624cf7f95c8cf4ff764cc997fd1db4601b97dcc:

  oeqa/selftest/pkgdata: use m4 instead of bash (2017-02-07 14:50:10 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/BUG9540
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/BUG9540

Chen Qi (2):
  console-tools: fix string formatting issue
  security_flags: enable string formatting check for console tools

 meta/conf/distro/include/security_flags.inc        |  1 -
 ...001-Fix-format-security-compilation-error.patch | 57 ++++++++++++++++++++++
 .../console-tools/console-tools_0.3.2.bb           |  1 +
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch

-- 
1.9.1


