Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tzv5c-0005pK-VS
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 21:14:01 +0100
Received: by mail-pb0-f51.google.com with SMTP id un15so687363pbc.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=GI2/Tu2EYW4sCdZYt7Oaz3Fk8RD24KusfHELKFTN4qU=;
	b=WdQ9JzZtTj/vD3Q+/vmaLItPxr0V4t6ZxNWGhhbTmwc/i1uI6ISWuMmUHnovAYkRoj
	yd+x8Tzra04IW15ad1ZXHDx8kWTEms2+WmwrEB0x6NTbCaIm2kkm/Q+ZxPNHQXizSCBq
	rB6LEDREqzPxG/spdjg/gsXAMyKPUBYQDRmvfakQKJSPqUolBdRuRZpFkEq2dXGJ1OM2
	hJ+zk6t16go4MRXmv+SnfMhF5cla+hRGYtOe6Bt4n4OoRRphZdLSXZzflxWd+93ZAtJs
	KBWvOKIXlJHXACF2CZ0MIYCSon1I9Vmaph3QFmCmjNHp42cvJn5vlO7XPs1yJ8AQnc4x
	hQHw==
X-Received: by 10.68.209.230 with SMTP id mp6mr40025981pbc.8.1359403101518;
	Mon, 28 Jan 2013 11:58:21 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id th10sm6834987pbc.76.2013.01.28.11.58.20
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 11:58:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 11:58:09 -0800
Message-Id: <cover.1359402980.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] rpcbind, module bbclass and systemd fix
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
X-List-Received-Date: Mon, 28 Jan 2013 20:14:01 -0000

This patchset is already in mailing lists for review in one form or another
I am putting it into a branch consolidated

The following changes since commit e11fdc145255c8b97c6c7ac6c5f7ce8aa50bdf0d:

  mtools : upgrade to 4.0.18 (2013-01-28 12:46:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (3):
  rpcbind: Dont use nss with uclibc
  systemd: Drop ppc build breakage patch for test-unit-file
  module-base.bbclass: Call make instead of oe_runmake in
    do_make_scripts

 meta/classes/module-base.bbclass                   |    2 +-
 ...it-file-Add-libsystemd-daemon.la-to-LDADD.patch |   32 -----------
 meta/recipes-core/systemd/systemd_197.bb           |    3 -
 .../rpcbind/rpcbind/0001-uclibc-nss.patch          |   30 ++++++++++
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   60 ++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |    6 ++
 6 files changed, 97 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch

-- 
1.7.9.5



