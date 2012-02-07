Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusQN-0001tq-Eh
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 22:18:03 +0100
Received: by ghbf19 with SMTP id f19so3355799ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 13:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=346eMEMgjdVyU6N7RfMbTjvtuIysVUQ1ncZl/LnjRSo=;
	b=Pd7659CyI136qX75Q8gc5QsbBHautK0ivrvLDIOGJwGrBHdgvbjeS/h12SzBEhZtIQ
	lZ7H4IMnMdxu6lE4OL8yQ8aq7BgBDn8x4k5VLQsQyexEMDboPHo3T/GegCTo+ZqFGrMJ
	AuKZnr70LcjWxmgKAyfo0EZXNTY7l4nZap4GA=
Received: by 10.236.9.97 with SMTP id 61mr34602900yhs.71.1328648999954;
	Tue, 07 Feb 2012 13:09:59 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id f47sm30150280yhh.8.2012.02.07.13.09.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 13:09:59 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 21:09:47 +0000
Message-Id: <cover.1328648562.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/4] Pending patches at O.S. Systems' tree
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
X-List-Received-Date: Tue, 07 Feb 2012 21:18:03 -0000

I am sending the patches that are waiting in our tree. dhcp and udev
patches ought to have been handled by Saul but in any case they are
present here.

The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:

  libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (4):
  dhcp: move dhcp leases files handling to postinst/postrm
  udev: stop providing cache support by default
  cross.bbclass: add virtclass handler
  useradd.bbclass: skip processing on virtclass-cross extended packages

 meta/classes/cross.bbclass                   |   39 ++++++++++++++++++++++++++
 meta/classes/useradd.bbclass                 |    3 ++
 meta/recipes-connectivity/dhcp/dhcp.inc      |   25 ++++++++++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
 meta/recipes-core/udev/udev.inc              |    2 +-
 meta/recipes-core/udev/udev_164.bb           |    2 +-
 6 files changed, 69 insertions(+), 4 deletions(-)

-- 
1.7.2.5



