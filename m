Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38A986B40D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 07:19:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x097Jkt5021886
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 23:19:46 -0800 (PST)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 23:19:46 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 15:19:34 +0800
Message-ID: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 0/9] Packages upgrade
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
X-List-Received-Date: Wed, 09 Jan 2019 07:19:46 -0000
Content-Type: text/plain


Yi Zhao (9):
  libcheck: update HOMEPAGE
  ltp: update HOMEPAGE
  file: upgrade 5.34 -> 5.35
  libcap: upgrade 2.25 -> 2.26
  libsdl2: upgrade 2.0.8 -> 2.0.9
  wget: upgrade 1.19.5 -> 1.20.1
  gnu-efi: upgrade 3.0.8 -> 3.0.9
  logrotate: upgrade 3.14.0 -> 3.15.0
  json-glib: upgrade 1.4.2 -> 1.4.4

 .../gnu-efi/{gnu-efi_3.0.8.bb => gnu-efi_3.0.9.bb} |   4 +-
 .../file/{file_5.34.bb => file_5.35.bb}            |   4 +-
 .../logrotate/act-as-mv-when-rotate.patch          | 141 ++++++++++-----------
 .../disable-check-different-filesystems.patch      |  40 +++---
 .../{logrotate_3.14.0.bb => logrotate_3.15.0.bb}   |   6 +-
 meta/recipes-extended/ltp/ltp_20180926.bb          |   2 +-
 ...need_charset_alias-when-building-for-musl.patch |  30 -----
 meta/recipes-extended/wget/wget_1.19.5.bb          |   9 --
 meta/recipes-extended/wget/wget_1.20.1.bb          |   8 ++
 .../{json-glib_1.4.2.bb => json-glib_1.4.4.bb}     |  10 +-
 ...01-GLES2-Get-sin-cos-out-of-vertex-shader.patch | 141 ---------------------
 .../libsdl2/{libsdl2_2.0.8.bb => libsdl2_2.0.9.bb} |   5 +-
 .../files/0001-Fix-build-with-gperf-3.1.patch      |  41 ------
 .../libcap/{libcap_2.25.bb => libcap_2.26.bb}      |   5 +-
 meta/recipes-support/libcheck/libcheck_0.12.0.bb   |   2 +-
 15 files changed, 120 insertions(+), 328 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.8.bb => gnu-efi_3.0.9.bb} (95%)
 rename meta/recipes-devtools/file/{file_5.34.bb => file_5.35.bb} (91%)
 rename meta/recipes-extended/logrotate/{logrotate_3.14.0.bb => logrotate_3.15.0.bb} (94%)
 delete mode 100644 meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/wget/wget_1.19.5.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.20.1.bb
 rename meta/recipes-gnome/json-glib/{json-glib_1.4.2.bb => json-glib_1.4.4.bb} (83%)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-shader.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.8.bb => libsdl2_2.0.9.bb} (92%)
 delete mode 100644 meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
 rename meta/recipes-support/libcap/{libcap_2.25.bb => libcap_2.26.bb} (90%)

-- 
2.7.4


