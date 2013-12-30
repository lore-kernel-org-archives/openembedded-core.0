Return-Path: <a.renault@kaptalia.com>
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.8])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF4660647
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 11:21:13 +0000 (UTC)
Received: from linux-krvt.site ([46.18.96.158])
	by mrelayeu.kundenserver.de (node=mreu4) with ESMTP (Nemesis)
	id 0LaeSa-1VZZoX1bo0-00kOs6; Mon, 30 Dec 2013 12:21:13 +0100
From: "a.renault@kaptalia.com" <a.renault@kaptalia.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2013 12:16:04 +0100
Message-ID: <1550216.XXvskmQOuT@linux-krvt.site>
User-Agent: KMail/4.10.5 (Linux/3.7.10-1.16-desktop; KDE/4.10.5; i686; ; )
MIME-Version: 1.0
X-Provags-ID: V02:K0:mtCQMdJn5jjrn+HXZqAHTqV8QGw2qv28iqyQUyyA182
	dX2OESvDUM5Jg7RSAlC5Ql5mQadKSQQfRfc+/pXDqwXj8jO29J
	S0MY9TNbNw2stcqYtQiR88eIQHgcQBPgn0YZtSYPxuuH0sZ1ma
	jsoM6kJHGwsqXeeTadHtJXIBoqMHQont9n1YWRVu5SMzvvMvUP
	ePy8QMRI1ens3/M2Vo09Y1MO+V4Kwwcf3VWvBKXX7zZouK2rU7
	P1jFaxRulns2xEkwsv3zUv1DMfC3M6mj6GkgwZS8JU3iKJy1pv
	d9eUianum9YKMCghsJhx6ZwiHwjUzl1IuTwjP8H8cQjLSk8RFL
	bwyRKFMXfp6AImjPh8XM=
Subject: networkmanager_0.9.8.bb
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
X-List-Received-Date: Mon, 30 Dec 2013 11:21:14 -0000
X-Groupsio-MsgNum: 48521
Content-Type: multipart/mixed; boundary="nextPart7311491.srsxvJFti9"
Content-Transfer-Encoding: 7Bit

--nextPart7311491.srsxvJFti9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi all,
I want to propose a modification : --without-systemdsystemunitdir=3D ->=
 --
without-systemdsystemunitdir on networkmanager_0.9.8.0.bb, this file is=
=20
available on meta-openembedded/meta-oe/recipes-
connectivity/networkmanager/networkmanager_0.9.8.0.bb

Not sure if this is the correct way to doing that, but this is my first=
 one.
Best regards,
--=20
Adrien RENAULT
Ing=E9nieur R&D
Kaptalia Monitoring
02.97.68.14.18

--nextPart7311491.srsxvJFti9
Content-Disposition: attachment; filename="networkmanager_0.9.8.0.bb.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="utf-8"; name="networkmanager_0.9.8.0.bb.patch"

--- networkmanager_0.9.8.0.bb.old	2013-12-30 12:11:50.605941952 +0100
+++ networkmanager_0.9.8.0.bb.new	2013-12-30 12:11:36.879942841 +0100
@@ -35,7 +35,7 @@
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
-    --without-systemdsystemunitdir=, \
+    --without-systemdsystemunitdir, \
     polkit \
 "
 # consolekit is not picked by shlibs, so add it to RDEPENDS too

--nextPart7311491.srsxvJFti9--
