Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CFBB06CF3C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 07:37:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAG7bdq1014440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:37:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 15 Nov 2013 23:37:39 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Nov 2013 15:37:51 +0800
Message-ID: <cover.1384587416.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] shadow-native: allow for setting password in clear text
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
X-List-Received-Date: Sat, 16 Nov 2013 07:37:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit ea92671d9823e3667d6ced7ac2af20f991da404d:

  bitbake: cooker: replace "w" file opening mode with "a" mode (2013-11-12 17:01:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/cleartext-password
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cleartext-password

Chen Qi (1):
  shadow-native: allow for setting password in clear text

 .../allow-for-setting-password-in-clear-text.patch |  208 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |    1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch

-- 
1.7.9.5


