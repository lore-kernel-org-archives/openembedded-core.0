Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id D1E8F7FBF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id f129so9014769wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XLk7L29HAR//o7zxsKEWD2h5RSy4wu7Lqk3rWmqwyMA=;
	b=FjnbtxOmG7zWIST/wPbAPH214d/GwoiECP1H1CBdIQ9T9lZSIgItKtaeE0Csid4iLE
	Cl4Vs5+hQfcxv7g4+oKIjSsd4P1BhTwF+vICjkcWqUfjUmqZVIivapfpIulogWSYngxL
	O2QzgqD24T699iXru13srlHWW6UEkWfZGN7AKKxtoYS3CNQ/VivbB6pbokm4r0gjt1qr
	kfthw0QYFgkMQsTBU5Zxt8nXzc4G43mVE3lJ1EUkZ5uueo1BsJ5eR5KFfsnKuJrK5K/3
	NZzwlg3jPH0E9I9vGdTrGJKTB+ZSciiK1xRZSmKvyblpGLPAYSK/FSO7PIFtbeKKtLfB
	zc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XLk7L29HAR//o7zxsKEWD2h5RSy4wu7Lqk3rWmqwyMA=;
	b=JDdbxHSVDwYHXveZD7ZglWfNn/Bj3D444y00fAuTW0roz53ZesFsD2LZLlRgZGrSSX
	NMmU/qwGFTFFcOYincfyYTGRRZ+xGjIRRdSIQYprdutrVTcalpu0rhn7/ZR9J3CWs/xt
	Tteb1Dg3RyKozLfeyNARnR99EjtO36w+eH1SUkxy6Wdf92zdic1aFiUwLmqHEcV74FMW
	x4Rf3/4HB00YbZ7ycXfUqz/K7lpp1NLveNOzjE/2eTHHTLEa6P1jD5tQSpQCqzCxwt5A
	c630aGPmANtaCrtTdOmAvZkVGrK+DQG60Evul2DdY6FId1GqDuEtoO1imxWS1Ueq8WSu
	EdlQ==
X-Gm-Message-State: APjAAAXyoeRQ1vglhjtIsHrcurCbjvWwDptwwszqMPy3eD7PlyJidXzP
	PHu1Fx2ax4AKzVJI2fXPv3Z+NaCP6Mg=
X-Google-Smtp-Source: APXvYqy86+9MJDO/N/VsMIlElHxZIf1T6bSKSplaLklJAbGzeiA4nE0gToS52koyKXPp2gcRaJNNvQ==
X-Received: by 2002:a05:600c:1050:: with SMTP id
	16mr6655341wmx.20.1579296557368; 
	Fri, 17 Jan 2020 13:29:17 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:28:58 +0100
Message-Id: <20200117212908.32647-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH][v2 00/10] Make MIME work on desktops
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On fresh images file-browsers do not know how to open files and usually open a
dialog with ALL applications available on the machine. This is not what users
are used to when working with linux: For just one application installed per
Mime-Type, the application is opened automatically.

To get a working MIME on desktop it needs two 'databases' on target:

1. Mime-Types: This is handled by mime.bbclass and creates database in
   /usr/share/mime/mime.cache.
2. Mime associations: A simple text-list of pairs Mime-Type <-> application
   in /usr/share/applications/mimeinfo.cache

This patch series updates/implements/enhances both parts to get images work as
expected.

@Khem: This series creates many QA warnings for layers in meta-openembedded and
a patch series fixing many was prepared [1]. Once this series get's applied (or
you ask for it) I can send them out.

[1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2020-01

V1 -> V2:
* Shelve global path export thingy
* Add me as maintainer of itstool (let's consider 'ü' in my name as test case :)
* Change "to to" to "to" in commit message
* Build shared-mime-info from git to allow automated upgrades
* mime-xdg.bbclass: Be prepared for packages as libreoffice: Desktop files
  installed are absolut symlinks broken for us. In case other projects do same: 
  Offer asolution and guide recipe writers how to handle by generating warnings
  with instructions how to handle.

Andreas Müller (10):
  itstool: add from meta-oe
  itstool: extend to nativesdk
  shared-mime-info: upgrade 1.10 -> 1.15
  mime.bbclass: rework
  insane.bbclass: introduce a warning for mime missing in inherit
  shared-mime-info: add mime to inherit
  gcr: add mime to inherit
  mime-xdg.bbclass: initial add
  insane.bbclass: Spawn warning for missing mime-xdg in inherit
  gcr: add mime-xdg to inherit

 meta/classes/insane.bbclass                   | 41 ++++++++++
 meta/classes/mime-xdg.bbclass                 | 74 +++++++++++++++++++
 meta/classes/mime.bbclass                     | 62 ++++++++--------
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-gnome/gcr/gcr_3.34.0.bb          |  2 +-
 ...-build-time-hardcoded-python-binary-.patch | 35 +++++++++
 ...ld-time-hardcoded-python-binary-path.patch | 29 ++++++++
 meta/recipes-support/itstool/itstool_2.0.6.bb | 21 ++++++
 .../shared-mime-info/install-data-hook.patch  | 25 -------
 .../shared-mime-info/parallelmake.patch       | 33 ---------
 .../shared-mime-info/shared-mime-info_1.10.bb |  7 --
 ...-mime-info.inc => shared-mime-info_git.bb} |  9 ++-
 .../update_desktop_database                   |  8 ++
 .../postinst-intercepts/update_mime_database  |  9 +++
 14 files changed, 257 insertions(+), 99 deletions(-)
 create mode 100644 meta/classes/mime-xdg.bbclass
 create mode 100644 meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
 create mode 100644 meta/recipes-support/itstool/itstool_2.0.6.bb
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
 rename meta/recipes-support/shared-mime-info/{shared-mime-info.inc => shared-mime-info_git.bb} (75%)
 create mode 100644 scripts/postinst-intercepts/update_desktop_database
 create mode 100644 scripts/postinst-intercepts/update_mime_database

-- 
2.21.0


