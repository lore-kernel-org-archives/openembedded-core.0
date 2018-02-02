Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 00B927867C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:18:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w122I7cj026570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 18:18:08 -0800 (PST)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 1 Feb 2018 18:18:07 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 10:16:07 +0800
Message-ID: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 0/7] Packages update
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
X-List-Received-Date: Fri, 02 Feb 2018 02:18:07 -0000
Content-Type: text/plain



Yi Zhao (7):
  debianutils: update to 4.8.4
  libbsd: update to 0.8.7
  wget: update to 1.19.4
  rsync: update to 3.1.3
  json-c: update to 0.13
  tcl: update to 8.6.8
  maintainers.inc: update maintainership

 meta/conf/distro/include/maintainers.inc           | 42 ++++++------
 ...-FALLTHRU-comment-to-handle-GCC7-warnings.patch | 74 ----------------------
 .../json-c/{json-c_0.12.1.bb => json-c_0.13.bb}    | 11 ++--
 .../rsync/{rsync_3.1.2.bb => rsync_3.1.3.bb}       |  4 +-
 .../tcltk/tcl/tcl-add-soname.patch                 |  4 +-
 .../tcltk/{tcl_8.6.7.bb => tcl_8.6.8.bb}           |  4 +-
 meta/recipes-extended/wget/wget.inc                |  2 +-
 .../wget/{wget_1.19.2.bb => wget_1.19.4.bb}        |  4 +-
 ...debianutils_4.8.1.1.bb => debianutils_4.8.4.bb} |  8 ++-
 ...r-older-GCCs-not-supporting-__has_include.patch | 31 ---------
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 65 +++++++++++--------
 .../libbsd/{libbsd_0.8.6.bb => libbsd_0.8.7.bb}    |  5 +-
 12 files changed, 80 insertions(+), 174 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
 rename meta/recipes-devtools/json-c/{json-c_0.12.1.bb => json-c_0.13.bb} (75%)
 rename meta/recipes-devtools/rsync/{rsync_3.1.2.bb => rsync_3.1.3.bb} (86%)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.7.bb => tcl_8.6.8.bb} (95%)
 rename meta/recipes-extended/wget/{wget_1.19.2.bb => wget_1.19.4.bb} (60%)
 rename meta/recipes-support/debianutils/{debianutils_4.8.1.1.bb => debianutils_4.8.4.bb} (86%)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-Fix-for-older-GCCs-not-supporting-__has_include.patch
 rename meta/recipes-support/libbsd/{libbsd_0.8.6.bb => libbsd_0.8.7.bb} (89%)

-- 
2.7.4


