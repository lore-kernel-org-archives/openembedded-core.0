Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJVy1-0002qA-3R
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 21:18:05 +0200
Received: by wye20 with SMTP id 20so4631176wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=MC/VpkbZA9rwspomc4/NfVoH+Df1CoRsEVxYWG4at4c=;
	b=cfdUukMY+y+7RWwY8uYMipMEseupObXcpL+eysNIMNtCzUd7sLrD/c3fVYeSoi0Mqn
	vPX/liCGrcPDw3gHllVPjiJ5TBWVjUpZeAIAqGIM2WfJbt1IXmPKyhuvJ58grTx1oB+r
	BWRg3i6BIoRgbqNHtljuwdO3lRA8JBvrpC5ww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=T+PHzPRQzMArVNFFG9Pof2+8MzfqKK9jZPk6E0GpHHJandvkAtLhwHTP2UPlQiFbjG
	MSmenpjKPfNmlKDWKWf3b5q3CMbFEb/hyxGfwEpyNKQULy7avVSuep1A0ILfQ+ph4MGx
	uunptWrHu4qgVnZa9UTxC9oww/ZX4wYxhZWho=
MIME-Version: 1.0
Received: by 10.216.230.153 with SMTP id j25mr3235659weq.22.1304968520383;
	Mon, 09 May 2011 12:15:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Mon, 9 May 2011 12:15:20 -0700 (PDT)
Date: Mon, 9 May 2011 16:15:20 -0300
X-Google-Sender-Auth: v8oLIsMi2gK3I6BpJ8pcZvPdMN4
Message-ID: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Pull request with misc changes
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
X-List-Received-Date: Mon, 09 May 2011 19:18:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

This pull request fixes some issues I found since the last pull
request and should be preferred against the first.

The following changes since commit d0dc2b5bb02ef55a41e7a97b6831c72391ae7f36=
:

  u-boot: correct COPYING MD5SUM (2011-05-08 23:56:11 -0700)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master

Otavio Salvador (10):
      meta/conf/local.conf.sample: fix mklibs comment line split and typo
      scripts/oe-setup-builddir: fix typo
      syslinux: improve packaging
      busybox: add support to mdev
      libxkbfile: disable xcb
      insane.bbclass: skip license checksum if LICENSE is "CLOSED"
      cmake.bbclass: fix qmake and rpath issues
      qmake_base.bbclass: add generate_qt_config_file task
      cmake: add support for oe qt4 tools names
      fuse: drop since it is not used by other recipes

 .../fuse-2.7.2/not-run-updaterc.d-on-host.patch    |   15 ----
 meta-demoapps/recipes-kernel/fuse/fuse.inc         |   13 ---
 meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb    |   22 -----
 meta/classes/cmake.bbclass                         |   19 ++++-
 meta/classes/insane.bbclass                        |    4 +
 meta/classes/qmake_base.bbclass                    |   15 ++++
 meta/conf/local.conf.sample                        |    7 +-
 meta/recipes-core/busybox/busybox.inc              |   14 +++-
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +
 meta/recipes-core/busybox/files/mdev               |    7 ++
 meta/recipes-core/busybox/files/mdev.conf          |   35 ++++++++
 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    2 +-
 meta/recipes-devtools/cmake/cmake.inc              |    3 +-
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |   85 ++++++++++++++++=
++++
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |   12 +++-
 meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb |    4 +-
 scripts/oe-setup-builddir                          |    2 +-
 17 files changed, 199 insertions(+), 62 deletions(-)
 delete mode 100644
meta-demoapps/recipes-kernel/fuse/fuse-2.7.2/not-run-updaterc.d-on-host.pat=
ch
 delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse.inc
 delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb
 create mode 100755 meta/recipes-core/busybox/files/mdev
 create mode 100644 meta/recipes-core/busybox/files/mdev.conf
 create mode 100644
meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


