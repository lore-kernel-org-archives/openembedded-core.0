Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62hg-0002p6-76
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 17:30:04 +0100
Received: by yhjj56 with SMTP id j56so913457yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=a21VagH46aZaQa0QIkamR79mwxmF4uvERalKbE3D1S8=;
	b=jZ8ucv81bfDojgn+U88R7GssQnxBgmnoo5wy4zfYeiom3XwM14yf/KU8zQhwwI3vTC
	iVaT3bXybL89oH1YuwGkduy2SihZ8mzn4APWhAYOdyM92crQnacG90x/hyokFNvHd939
	18wfBkTC7On2hteiXA82Dw1euTWYuPK0OprXEuWInjkhoGrmeIAYXlWuWX+vfQvP4fvZ
	gebms1b5REgL0SWImQLs3lu5ScpBPkauydeXvwZjLrrdpubT44wgT9lGadpqddzfZ+/F
	XXH5lGuH3khxyYH7195JmF11znCrCNTW1R7kXHk6XTF/QcTkXH22fZXOGXoNzgXPt670
	uN6A==
Received: by 10.236.197.41 with SMTP id s29mr3187223yhn.7.1331310084498;
	Fri, 09 Mar 2012 08:21:24 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm15000143yhj.7.2012.03.09.08.21.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:21:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:21:11 +0000
Message-Id: <cover.1331310044.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/6] Pending patches on O.S. Systems' tree
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
X-List-Received-Date: Fri, 09 Mar 2012 16:30:04 -0000

The following changes since commit 50dc8bfbac42b9a9b52a2f7d0568740c41790c13:

  rpm 5.4.0: Add rpmdeps-oecore to replace rpmdeps for package.bbclass (2012-03-09 06:39:52 -0800)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (6):
  run-postinsts: fix opkg data path
  image.bbclass: fix rootfs generation without package management tools
  rootfs_rpm.bbclass: rename postinst trigger script
  opkg: rename postinst trigger script
  dpkg: rename postinst trigger script
  connman: update to 0.79

 meta/classes/core-image.bbclass                    |    2 --
 meta/classes/image.bbclass                         |    7 +++++--
 meta/classes/rootfs_rpm.bbclass                    |    6 +++---
 .../connman/add_xuser_dbus_permission.patch        |   12 +++++++-----
 .../connman/connman/disable_alg-test.patch         |   18 +++++++++---------
 .../connman/{connman_0.78.bb => connman_0.79.bb}   |    6 ++----
 meta/recipes-devtools/dpkg/dpkg.inc                |    6 +++---
 .../dpkg/run-postinsts/run-postinsts               |    4 ++--
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 meta/recipes-devtools/opkg/opkg.inc                |    8 ++++----
 11 files changed, 37 insertions(+), 36 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_0.78.bb => connman_0.79.bb} (79%)

-- 
1.7.2.5



