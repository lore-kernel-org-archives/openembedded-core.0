Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D135C73BB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 03:08:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6738Dt4004988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 20:08:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 20:08:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jul 2015 11:08:50 +0800
Message-ID: <cover.1436238493.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: upgrade to 8.24
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
X-List-Received-Date: Tue, 07 Jul 2015 03:08:14 -0000
Content-Type: text/plain

The following changes since commit dd09fab685de2eaf04aa5ab60f8220b89c1deae9:

  tune-core2.inc: set X86ARCH32 to i686 (instead of i586) (2015-07-02 23:08:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/coreutils-8.24
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/coreutils-8.24

Chen Qi (1):
  coreutils: upgrade to 8.24

 .../0001-Unset-need_charset_alias-when-building-for-musl.patch    | 0
 .../{coreutils-8.23 => coreutils-8.24}/fix-selinux-flask.patch    | 0
 .../man-decouple-manpages-from-build.patch                        | 0
 .../remove-usr-local-lib-from-m4.patch                            | 0
 .../coreutils/{coreutils_8.23.bb => coreutils_8.24.bb}            | 8 ++++----
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.23 => coreutils-8.24}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.23 => coreutils-8.24}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.23 => coreutils-8.24}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.23 => coreutils-8.24}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.23.bb => coreutils_8.24.bb} (94%)

-- 
1.9.1


