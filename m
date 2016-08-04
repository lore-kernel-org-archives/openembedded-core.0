Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id DFBA976806
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:35:23 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 81811A0040A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:27:58 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080415275718-19325 ;
	Thu, 4 Aug 2016 15:27:57 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Aug 2016 15:27:47 +0200
Message-Id: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 15:27:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 15:27:57
X-TNEFEvaluated: 1
Subject: [PATCH 0/7] dangling patches
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
X-List-Received-Date: Thu, 04 Aug 2016 13:35:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There are some patches floating around with no reference to it. I guess
one just forgot to delete them during package upgrade. They should be
removed for consistency.

Stefan M=C3=BCller-Klieser (7):
  gstreamer1.0-plugins-bad: remove two dangling patches
  openssl: remove dangling patch
  guile: remove dangling patch
  python-numpy: remove dangling patch
  alsa-utils: remove dangling patch
  matchbox-desktop: remove dangling patch
  matchbox-panel-2: remove dangling patch

 .../openssl/crypto=5Fuse=5Fbigint=5Fin=5Fx86-64=5Fperl.patch |  35 -----
 .../files/opensuse/guile-turn-off-gc-test.patch    |  49 -------
 .../python-numpy/files/add-glibc-check.patch       |  36 -----
 ...1-alsabat-rename-to-avoid-naming-conflict.patch | 153 -----------------=
----
 .../0001-glimagesink-Downrank-to-marginal.patch    |  32 -----
 ...window-fix-memory-leak-of-navigation-thre.patch |  35 -----
 ...thing-on-delete-event-when-not-STANDALONE.patch |  60 --------
 ...top-Make-sure-active-state-is-initialized.patch |  50 -------
 8 files changed, 450 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/crypto=5Fuse=
=5Fbigint=5Fin=5Fx86-64=5Fperl.patch
 delete mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-turn-o=
ff-gc-test.patch
 delete mode 100644 meta/recipes-devtools/python-numpy/files/add-glibc-chec=
k.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-re=
name-to-avoid-naming-conflict.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0001-glimagesink-Downrank-to-marginal.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
 delete mode 100644 meta/recipes-sato/matchbox-desktop/files/0001-Do-nothin=
g-on-delete-event-when-not-STANDALONE.patch
 delete mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-showdeskt=
op-Make-sure-active-state-is-initialized.patch

--=20
1.9.1


