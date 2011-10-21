Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5vW-0004t9-8y
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 05:37:46 +0200
Received: by gyc15 with SMTP id 15so3363880gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=HZ3iQx0mmBVaTM31NSl7BRg5bfgs2M+3tpTOsn3RHuQ=;
	b=jBVjqORU7qFcckxaFsKQywJTbuh7j9/yP+cX708chNI6Die5hUttNrUfE7V/O06A2F
	BB+zpzPfqTRSeD9A5CTySSTvubfh2X68JYXl32fw0w4LaxcTSkHDOMMrg+QWUNkgbQy+
	y0P0KEqj0zyme5YmdZFROB5N0tdN3IA1M9tOk=
Received: by 10.151.21.4 with SMTP id y4mr12368537ybi.92.1319167909780;
	Thu, 20 Oct 2011 20:31:49 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m3sm32008971ang.0.2011.10.20.20.31.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:31:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:31:38 +0000
Message-Id: <cover.1319167843.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/4] Fixes and improvements from O.S. Systems
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
X-List-Received-Date: Fri, 21 Oct 2011 03:37:46 -0000

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
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    4 +-
 meta/recipes-core/dbus/dbus.inc                    |   48 +++++++++-----------
 4 files changed, 53 insertions(+), 51 deletions(-)

-- 
1.7.2.5



