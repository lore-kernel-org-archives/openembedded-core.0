Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHFu2-0005rQ-Hq
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 16:16:54 +0200
Received: by gyc15 with SMTP id 15so3752816gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=AhWyqW58ojOxJQlZG9qgCd/sZthFfcFGx9xt297RKec=;
	b=edgB4d8MJ3BRpDJyaph+nQrJewa/H7/TkBWYuDHmM9YkshVwgYXCBz36tGJzAg5Y+l
	+RiQ+QpDkHn2CVsNeGhc/f9NkOmQQFx9NszjtV4zduxGqBYZKh+TuWPkZbqkKs9FHodP
	dXkYN3rm7Bby8od4oNqsN79cCiQoL2Hbl9zoo=
Received: by 10.101.106.35 with SMTP id i35mr1653046anm.148.1319206254976;
	Fri, 21 Oct 2011 07:10:54 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm24713630anh.8.2011.10.21.07.10.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 07:10:54 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 14:10:42 +0000
Message-Id: <cover.1319206126.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/4 v2] Fixes and improvements
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
X-List-Received-Date: Fri, 21 Oct 2011 14:16:55 -0000

The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476d6b3:

  distro-tracking-fields: update fields for tzdata and gst-plugins-good (2011-10-20 13:07:16 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (4):
  bootimg.bbclass: add support to disable HDD image building
  useradd.bbclass: check if a group already exists manually
  base-passwd: move initial criation of group and passwd to preinst
  dbus: use useradd class to allow use in read-only filesystems

 meta/classes/bootimg.bbclass                       |   44 +++++++++---------
 meta/classes/useradd.bbclass                       |    8 +++-
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   19 +++++++-
 meta/recipes-core/dbus/dbus.inc                    |   48 +++++++++-----------
 4 files changed, 69 insertions(+), 50 deletions(-)

-- 
1.7.2.5



