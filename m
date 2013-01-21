Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGYe-0005p6-0U
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:33:36 +0100
Received: from mail-bk0-f70.google.com ([209.85.214.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:17:29 -0800
Received: by mail-bk0-f70.google.com with SMTP id ji2so1021468bkc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=dF0W8rigaMvFvPsbLoQEacvFxH2VsnRztjXvFyE9PHE=;
	b=j0qgv1g1SoffFUL/w1I6RVvak3hY5aVLCWbT+A7JJAqthmN4C4AGooNle+vHM1AG4T
	ff7yxqoEzeaeDBXres+tnClzitqPBkEbr4HgOv+a7ml3f2Jg3bUYSWDZ4boM8t9ua1cT
	G0pCL1HKvj/MUmVIuugDIzz4+ZuK7vFByIe6me5E5uiIm0droE+7QRIC3LKFD2+9EiXy
	mt6tbgfq1IgBscbdEE4hHoLB7l6QqOsdmIDgdWtkGJNDgsyARy9RpqQ6c0PolpF5UBKr
	7JBQ1JytWHk7XOhF3PTSFG6K+E+NpN195x3Ddn+8dIv5vFEfio9NxAugD3Gw7kdcUmmV
	rSwA==
X-Received: by 10.194.109.10 with SMTP id ho10mr26206336wjb.16.1358770647875; 
	Mon, 21 Jan 2013 04:17:27 -0800 (PST)
X-Received: by 10.194.109.10 with SMTP id ho10mr26206318wjb.16.1358770647727; 
	Mon, 21 Jan 2013 04:17:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm18420527wiz.1.2013.01.21.04.17.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 04:17:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:15:27 +0000
Message-Id: <cover.1358770449.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmYMZQIWz/jbMy5uBvLD65CKGVx8Rb+g/EVN6Wj0om79/WRkHwH2uGzbD9cnINOWFz0GLxOGkWGV4jwhmPA94c8awRWQL1cZm0A1WLOjxIZMSa2Vx6/EGOk8VYh6iCYU41Eew0bEXPIM4AxoUH+MnbP5OgBnuQpG77SD2kpCfP8PI1R5EGPT/44I9QMsvATum1eQK4D
Subject: [PATCH 0/5] systemd fixes
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
X-List-Received-Date: Mon, 21 Jan 2013 12:33:39 -0000

Some fixes for systemd:
- skip udev/systemd so world builds work
- fix typo in FILES
- clean up gtk-doc invocation

Ross

The following changes since commit bac53df5e53ebe26cf2d267a30ab1bbdccd3b541:

  dbus: upgrade to 1.6.8 (2013-01-21 10:22:09 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd

for you to fetch changes up to f669e40a7f7bb2a8de0c6da4f6fdac21a0676b0d:

  systemd: use new GTKDOC_DOCDIR and clean up (2013-01-21 12:13:22 +0000)

----------------------------------------------------------------
Ross Burton (5):
      systemd: skip in non-systemd distros to fix world builds
      udev: skip in systemd distros, to fix world builds
      systemd: fix typo in FILES
      gtk-doc: parameterise the documentation directory
      systemd: use new GTKDOC_DOCDIR and clean up

 meta/classes/gtk-doc.bbclass             |    5 ++++-
 meta/recipes-core/systemd/systemd_196.bb |   20 +++++++++++++-------
 meta/recipes-core/udev/udev.inc          |    6 ++++++
 3 files changed, 23 insertions(+), 8 deletions(-)

Ross Burton (5):
  systemd: skip in non-systemd distros to fix world builds
  udev: skip in systemd distros, to fix world builds
  systemd: fix typo in FILES
  gtk-doc: parameterise the documentation directory
  systemd: use new GTKDOC_DOCDIR and clean up

 meta/classes/gtk-doc.bbclass             |    5 ++++-
 meta/recipes-core/systemd/systemd_196.bb |   20 +++++++++++++-------
 meta/recipes-core/udev/udev.inc          |    6 ++++++
 3 files changed, 23 insertions(+), 8 deletions(-)

-- 
1.7.10.4



