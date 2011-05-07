Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QImzx-000634-UQ
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 21:17:06 +0200
Received: by bwz5 with SMTP id 5so3616340bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=dbFCbGCTO770ZkqaUZwZsCQppoyZzjJgkVXbHrtq6EI=;
	b=u92Y8DUhbIzGzku6iaweZ0wzpQHvAzl1pC6+3L/13NH8jA3Pi+8WGga+fqb26IlxxC
	g4MFFW2r5wMy60dkCrmOwVVAOgLg6o4k0aRzk9apaeG/9tOKc5x1riF2BvvBhq8PfNPV
	xsKG95JbTgXMj1TLaS6GqKpGb8WNRMsb4YNTA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=SwRfvUVhIm9iE8BiA/ozEz5FYR1dJRkLyH7Abr8lN7dIMBuSpedSTlLAMPfpviVoyU
	//NXnGquhrCNba2HgVTfzpwf6sSADYGZTm3e2hQzBlatDXD1GEqUiXW7C8Y4xkoqBvLR
	HyGS31KnOgXLqwexVk4HJAee2Qgke6KG3mUpo=
MIME-Version: 1.0
Received: by 10.204.36.7 with SMTP id r7mr2931423bkd.2.1304795656602; Sat, 07
	May 2011 12:14:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.70.138 with HTTP; Sat, 7 May 2011 12:14:16 -0700 (PDT)
Date: Sat, 7 May 2011 16:14:16 -0300
X-Google-Sender-Auth: HIqxF2WSCJi3DUXdhI20iykV6PU
Message-ID: <BANLkTi=EENCHs5vHLhf3L6s2ACRbABFkFw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Pull request with misc fixes
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
X-List-Received-Date: Sat, 07 May 2011 19:17:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I have sent those patches to mailing list some days ago but they
haven't been merged since it and some merged changes has conflicts
that need to be fixed. So I did.

The following changes since commit 4f4bac0a459fe238e105e96b2b59b6af88e639c4=
:

  sanity.bbclass: Add cpio to list of required utilities tested for
(2011-05-07 09:05:57 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core.git master

Otavio Salvador (5):
      meta/conf/local.conf.sample: fix mklibs comment line split and typo
      scripts/oe-setup-builddir: fix typo
      syslinux: improve packaging
      busybox: add support to mdev
      libxkbfile: disable xcb

 meta/conf/local.conf.sample                        |    7 ++--
 meta/recipes-core/busybox/busybox.inc              |   14 +++++++-
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +
 meta/recipes-core/busybox/files/mdev               |    7 ++++
 meta/recipes-core/busybox/files/mdev.conf          |   35 ++++++++++++++++=
++++
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |   12 ++++++-
 meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb |    4 ++-
 scripts/oe-setup-builddir                          |    2 +-
 8 files changed, 75 insertions(+), 8 deletions(-)
 create mode 100755 meta/recipes-core/busybox/files/mdev
 create mode 100644 meta/recipes-core/busybox/files/mdev.conf


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


