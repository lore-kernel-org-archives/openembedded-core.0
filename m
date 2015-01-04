Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC572727CB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 10:04:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t04A4iss025400
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Jan 2015 02:04:45 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 4 Jan 2015 02:04:44 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Jan 2015 18:04:55 +0800
Message-ID: <cover.1420359776.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Package Upgrades: sysstat, coreutils, curl and sysklogd
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
X-List-Received-Date: Sun, 04 Jan 2015 10:04:55 -0000
Content-Type: text/plain

The following changes since commit 24f19fedb40d0af84beb8e9a6595ea06f09d4615:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 08:22:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/package-upgrades-2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/package-upgrades-2

Chen Qi (4):
  sysstat: upgrade to stable version 11.0.2
  coreutils: upgrade to 8.23
  curl: upgrade to 7.39.0
  sysklogd: upgrade to 1.5.1

 .../{coreutils-8.22 => coreutils-8.23}/dummy_help2man.patch  |  0
 .../fix-for-dummy-man-usage.patch                            | 12 ++++++------
 .../fix-selinux-flask.patch                                  |  0
 .../remove-usr-local-lib-from-m4.patch                       |  0
 .../coreutils/{coreutils_8.22.bb => coreutils_8.23.bb}       |  4 ++--
 meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb             |  5 +++++
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb               |  5 -----
 meta/recipes-extended/sysstat/sysstat.inc                    |  2 +-
 .../sysstat/{sysstat_10.2.1.bb => sysstat_11.0.2.bb}         |  4 ++--
 meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.39.0.bb} |  4 ++--
 10 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.22 => coreutils-8.23}/dummy_help2man.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.22 => coreutils-8.23}/fix-for-dummy-man-usage.patch (77%)
 rename meta/recipes-core/coreutils/{coreutils-8.22 => coreutils-8.23}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.22 => coreutils-8.23}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.22.bb => coreutils_8.23.bb} (96%)
 create mode 100644 meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
 delete mode 100644 meta/recipes-extended/sysklogd/sysklogd_1.5.bb
 rename meta/recipes-extended/sysstat/{sysstat_10.2.1.bb => sysstat_11.0.2.bb} (40%)
 rename meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.39.0.bb} (93%)

-- 
1.9.1


