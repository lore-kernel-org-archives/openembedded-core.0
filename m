Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ4LI-0002Op-9z
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:34:41 +0100
Received: by yenm12 with SMTP id m12so2538752yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 09:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=rMT5dSpfM0IRcCFTg2orofJlnGRbN7E6xcwKQMhmAXw=;
	b=yEW/BYOKmeFKqSOkTa82vGwYbXYtE5g76gf1EXLFMhMjGdBTn+6Cl9jFy0dkQfAFG1
	RiQsWcPDNaGaYf88UBEcGvZCosU9RLj8DLTinZfJDXkHo6QQ5qhQjvXEBcDaoBYgP0NR
	EMk0x47IsdVT4hgm1mu0yc+ye3QjBuICOeY74=
Received: by 10.236.91.67 with SMTP id g43mr13175033yhf.68.1323451668477;
	Fri, 09 Dec 2011 09:27:48 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l11sm25562627anm.22.2011.12.09.09.27.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 09:27:47 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 17:27:30 +0000
Message-Id: <cover.1323451575.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/5] ConnMan improvements and misc fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 17:34:41 -0000

The following changes since commit 4a13766c7b223d82e8cf682db999a135d2b8412c:

  gtk.inc: ship gtk-demo to independent package (2011-12-08 16:58:41 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (5):
  dosfstools: update native to 2.11
  scripts/send-pull-request: allow sending of patches without a cover
    letter
  connman: drop git version
  connman: move files from connman-0.75 to connman dir
  connman: update to 0.78

 .../connman/connman-0.75/dbusperms.patch           |   14 ---
 .../connman/connman-0.75/xtables_version.patch     |   64 -------------
 meta/recipes-connectivity/connman/connman.inc      |   96 ++++++++++++++------
 .../add_xuser_dbus_permission.patch                |    0
 .../connman/{connman-0.75 => connman}/connman      |    0
 meta/recipes-connectivity/connman/connman_0.75.bb  |   29 ------
 meta/recipes-connectivity/connman/connman_0.78.bb  |   10 ++
 meta/recipes-connectivity/connman/connman_git.bb   |   11 ---
 .../dosfstools/dosfstools-native_2.10.bb           |   19 ----
 .../dosfstools/dosfstools/2.6.20-syscall.patch     |   72 ---------------
 .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |   74 ---------------
 .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |   68 +++++++--------
 .../dosfstools/dosfstools/mkdosfs-dir.patch        |   62 ++++++-------
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |   24 -----
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |   11 ++-
 scripts/send-pull-request                          |   21 +++--
 16 files changed, 160 insertions(+), 415 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
 rename meta/recipes-connectivity/connman/{connman-0.75 => connman}/add_xuser_dbus_permission.patch (100%)
 rename meta/recipes-connectivity/connman/{connman-0.75 => connman}/connman (100%)
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.75.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_0.78.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman_git.bb
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools_2.10.bb

-- 
1.7.2.5



