Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TlGLK-0001U6-8m
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 10:53:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBJ9cssp024361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 01:38:54 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 19 Dec 2012 01:38:53 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:39:35 +0800
Message-ID: <cover.1355902677.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/4] Use dynamic root home directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 09:54:14 -0000
Content-Type: text/plain

Import variable ROOT_HOME which can be configured. Update base-files, base-passwd,
oprofile to use the dynamic root home directory.

The following changes since commit 2a9c574fd8b0800199b6569b6abf02634801013d:

  gst-openmax: fix build with newer GLib (2012-12-17 17:53:52 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/roothome
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/roothome

Kang Kai (4):
  bitbake.conf: import var ROOT_HOME
  base-files: use dynamic root home directory
  base-passwd: use configurable root home directory
  oprofile: use dynamic root home directory

 meta/conf/bitbake.conf                             |    3 ++
 meta/recipes-core/base-files/base-files/profile    |    2 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    3 +-
 .../base-passwd/base-passwd-3.5.26/root-home.patch |   16 -------------
 .../recipes-core/base-passwd/base-passwd_3.5.26.bb |    4 +-
 meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
 .../oprofile/oprofile/oprofile-root.patch          |   23 ++++++++++++-------
 7 files changed, 23 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.26/root-home.patch

-- 
1.7.5.4



