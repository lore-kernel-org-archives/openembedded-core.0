Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1TOFBs-0001hB-Jx
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 00:00:45 +0200
Received: by mail-qc0-f175.google.com with SMTP id j3so5491308qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 14:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=jvr7NLTawgZZLh+XVYSxa3+TYPpMngtiRzJ7Rg+Gal8=;
	b=h9A13IfgXPcR7nwC7C0e6MKM9HWcjgFNWIFim6wl6dTc4sdE3ul9EJPLRv0i4MrNfR
	LMiBVFu3BpFp3uiUK8svZEKjpj7XNA2F0xNEh0cjNQJzJvFL5YcdsFpBtyIs7qaMAjYf
	06JPDOg+9cGVueN0YG+nBY/i2UhsTVF7I0/FrET+HpWqjVTlD3dPe6L38UVFGlA8ewlC
	xA9otE2PAtf0mL64/9MWgKliOpItbu6eei24jx9iP0JOa5qKW3itEpqFn8eAjEtf3BF1
	6cFGAL8jY9git/VfEnhS4L41i8d+vFybANesFiPknQQWk3a3+HEn3gUU5N7CArAqPQcR
	WeGg==
Received: by 10.224.189.197 with SMTP id df5mr13343054qab.70.1350424046854;
	Tue, 16 Oct 2012 14:47:26 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id o10sm19540341qaj.14.2012.10.16.14.47.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 14:47:26 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 16 Oct 2012 17:47:26 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2012 17:47:25 -0400
Message-Id: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] lmsensors: Initial commit (cover letter)
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
X-List-Received-Date: Tue, 16 Oct 2012 22:00:46 -0000

Hi,

This is a first attempt at getting lm_sensors included in oe-core. Comments
are very welcomed!

Regards,

Marc

Marc Ferland (1):
  lmsensors: Initial commit.

 meta/recipes-bsp/lm_sensors/files/fancontrol       |    2 +
 meta/recipes-bsp/lm_sensors/files/fancontrol.sh    |   48 ++++++
 meta/recipes-bsp/lm_sensors/files/sensord.cgi      |   10 ++
 meta/recipes-bsp/lm_sensors/files/sensord.conf     |   16 ++
 meta/recipes-bsp/lm_sensors/files/sensord.sh       |   49 +++++++
 meta/recipes-bsp/lm_sensors/files/sensors.conf     |    2 +
 meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb     |  150 ++++++++++++++++++++
 meta/recipes-support/rrdtool/files/automake.patch  |   15 ++
 meta/recipes-support/rrdtool/files/configure.patch |   19 +++
 meta/recipes-support/rrdtool/rrdtool_1.4.7.bb      |   31 ++++
 10 files changed, 342 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/lm_sensors/files/fancontrol
 create mode 100644 meta/recipes-bsp/lm_sensors/files/fancontrol.sh
 create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.cgi
 create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.conf
 create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.sh
 create mode 100644 meta/recipes-bsp/lm_sensors/files/sensors.conf
 create mode 100644 meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb
 create mode 100644 meta/recipes-support/rrdtool/files/automake.patch
 create mode 100644 meta/recipes-support/rrdtool/files/configure.patch
 create mode 100644 meta/recipes-support/rrdtool/rrdtool_1.4.7.bb

-- 
1.7.5.4



