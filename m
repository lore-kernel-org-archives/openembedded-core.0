Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45B316A463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 05:56:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBB5u8qC024476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 21:56:08 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Dec 2013 21:56:08 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Dec 2013 13:56:58 +0800
Message-ID: <cover.1386741230.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/3] Add ability to set clear text password and fix zap_root_password
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
X-List-Received-Date: Wed, 11 Dec 2013 05:56:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Changes since V1:
Modify the code of zap_root_password and rename the function to zap_empty_root_password
to better reflect it's original intent.


The following changes since commit 853f5db48f4cfcb34345938b583874fe5b6fc678:

  nativesdk.bbclass: support nativesdk to override with the PACKAGES_DYNAMIC statement (2013-12-09 21:36:33 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/cleartext-password
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cleartext-password

Chen Qi (3):
  shadow-native: allow for setting password in clear text
  image.bbclass: fix for zap_root_password
  useradd-example: add example for setting clear text password

 .../recipes-skeleton/useradd/useradd-example.bb    |    3 +-
 meta/classes/core-image.bbclass                    |    2 +-
 meta/classes/image.bbclass                         |   14 +-
 .../allow-for-setting-password-in-clear-text.patch |  208 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |    1 +
 5 files changed, 220 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch

-- 
1.7.9.5


