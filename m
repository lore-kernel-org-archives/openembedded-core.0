Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F792746F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 07:40:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5S7e44U020733
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 00:40:19 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 28 Jun 2018 00:39:53 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 15:39:45 +0800
Message-ID: <1530171589-21641-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 0/4] packages update
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
X-List-Received-Date: Thu, 28 Jun 2018 07:40:28 -0000
Content-Type: text/plain


Yi Zhao (4):
  file: update to 5.33
  libbsd: update to 0.9.1
  debianutils: update to 4.8.6
  gnu-efi: update to 3.0.8

 .../gnu-efi/lib-Makefile-fix-parallel-issue.patch  |  14 +-
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   |  16 +-
 .../gnu-efi/{gnu-efi_3.0.6.bb => gnu-efi_3.0.8.bb} |   4 +-
 .../file/0001-Add-P-prompt-into-Usage-info.patch   |  39 ---
 .../file/{file_5.32.bb => file_5.33.bb}            |   3 +-
 .../{debianutils_4.8.4.bb => debianutils_4.8.6.bb} |   8 +-
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 376 ---------------------
 .../0001-flopen-Add-missing-fcntl.h-include.patch  |  46 +++
 .../libbsd/libbsd/0002-Remove-funopen.patch        |  52 ---
 .../libbsd/{libbsd_0.8.7.bb => libbsd_0.9.1.bb}    |  19 +-
 10 files changed, 75 insertions(+), 502 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.6.bb => gnu-efi_3.0.8.bb} (95%)
 delete mode 100644 meta/recipes-devtools/file/file/0001-Add-P-prompt-into-Usage-info.patch
 rename meta/recipes-devtools/file/{file_5.32.bb => file_5.33.bb} (92%)
 rename meta/recipes-support/debianutils/{debianutils_4.8.4.bb => debianutils_4.8.6.bb} (86%)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
 rename meta/recipes-support/libbsd/{libbsd_0.8.7.bb => libbsd_0.9.1.bb} (72%)

-- 
2.7.4


