Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 438E16AC48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 04:38:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q4cph2024065
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 21:38:51 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 25 Jun 2013 21:38:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 12:38:45 +0800
Message-ID: <cover.1372215660.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/3]adt-installer: fix sdk relocation issues
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
X-List-Received-Date: Wed, 26 Jun 2013 04:38:50 -0000
Content-Type: text/plain

Some of them have already been fixed in toolchain:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=aeb53bd78991af9fbb60d64176ec864cfc2ddbb9
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5ce8c7fe9ebb8dca0a0b091bda9c58141da26216

//Hongxu

The following changes since commit 8e9501ffa8726d69412d669580d787ffedb88d34:

  populate_sdk_base, adt_installer: abort install if path contains spaces (2013-06-25 17:59:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-adt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-adt

Hongxu Jia (3):
  adt_installer_internal: fix perl modules relocated failed on older
    distributions
  adt_installer_internal:fix perl lib version mismatch
  adt_installer_internal:add sudo when permission deny on installation
    directory

 .../adt-installer/scripts/adt_installer_internal          | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

-- 
1.8.1.2


