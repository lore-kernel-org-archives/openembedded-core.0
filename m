Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3826E717
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 11:39:45 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id w61so4517047wes.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 03:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TignyEFJdg7hs0T4otjq1Y/WvuS0SoSiuOqH6nDABS4=;
	b=okGnzm9YtwJrxkPYfvYu3BMUVO/d71z1s+4slgU8suFngA/1HAFE96JKaQvEMQCGvI
	2wCcC4Sgl7D1+7mSfuRDC6hX+jq80SUZixGZPHY+VuYGNokivGbKyevOmCKUv4DgSDjg
	tgVhzCNr9NwfvwK8ZevKSWk14Rg7g3jkNCkVEIiZsLdNB4JX8YmtaQk/RxQd7kOpRaNw
	GeSustlOJBGw4p1eQwMsKT3RfdaVyL/tDA0r8fMmADY4h8li+YS1fFZioHENjoGof8CJ
	1VonzDzQ+S6Ow1JPqU0AjE2L0z9/1UAFTJ0z1YpJp1kHWXA+AfJhI29vMTkwwK3CdDsk
	KM/g==
MIME-Version: 1.0
X-Received: by 10.181.13.112 with SMTP id ex16mr13809693wid.23.1393241985597; 
	Mon, 24 Feb 2014 03:39:45 -0800 (PST)
Received: by 10.194.8.35 with HTTP; Mon, 24 Feb 2014 03:39:45 -0800 (PST)
Date: Mon, 24 Feb 2014 11:39:45 +0000
Message-ID: <CABuzA3Odaup7ZC1EZPMLEULzjpDxrhRq6Oq97Ben9uLjCOKNEA@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: qt4-embedded - jpeg, gif, tiff support
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
X-List-Received-Date: Mon, 24 Feb 2014 11:39:46 -0000
Content-Type: multipart/alternative; boundary=f46d043c06bea345b204f3256d82

--f46d043c06bea345b204f3256d82
Content-Type: text/plain; charset=ISO-8859-1

I've just noticed jpeg, gif, tiff are not working for me.

I am building qt via an 'inherit qt4e' line in our qt application.

Out target hardware is similar based on beaglebone.

I've tried -

--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -22,7 +22,7 @@ QT_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES',
'pulseaudio', '-pulseaudio

 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
-                    -system-libjpeg -system-libpng -system-libtiff
-system-zlib \
+                    -qt-libjpeg -system-libpng -system-libtiff
-system-zlib \
                     -no-pch -stl -glib \
                     -no-rpath -silent \
                     ${QT_DBUS} \


but that doesn't seem to help

I get  this sort of error when I try to run it -
Error decoding: <file.jpg>: Unsupported image format

Any advice on getting this working ?

Thanks
John

--f46d043c06bea345b204f3256d82
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve just noticed jpeg, gif, tiff are not working for =
me.<div><br></div><div><div>I am building qt via an &#39;inherit qt4e&#39; =
line in our qt application.=A0</div></div><div><br></div><div>Out target ha=
rdware is similar based on beaglebone.</div>
<div><br></div><div>I&#39;ve tried -</div><div><br></div><div><div>--- a/me=
ta/recipes-qt/qt4/qt4.inc</div><div>+++ b/meta/recipes-qt/qt4/qt4.inc</div>=
<div>@@ -22,7 +22,7 @@ QT_MULTIMEDIA ?=3D &quot;${@base_contains(&#39;DISTR=
O_FEATURES&#39;, &#39;pulseaudio&#39;, &#39;-pulseaudio</div>
<div>=A0=A0</div><div>=A0QT_CONFIG_FLAGS +=3D &quot;-release -no-cups -redu=
ce-relocations \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-shar=
ed -no-nas-sound -no-nis \</div><div>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0-system-libjpeg -system-libpng -system-libtiff -system-zlib \</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-qt-libjpeg -system-libpng -s=
ystem-libtiff -system-zlib \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0-no-pch -stl -glib \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0-no-rpath -silent \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0${QT_DBUS} \</div>
</div><div><br></div><div><br></div><div>but that doesn&#39;t seem to help<=
/div><div><br></div><div>I get =A0this sort of error when I try to run it -=
</div><div>Error decoding: &lt;file.jpg&gt;: Unsupported image format<br>
</div><div><br></div><div>Any advice on getting this working ?</div><div><b=
r></div><div>Thanks</div><div>John</div><div><br></div><div><br></div><div>=
<br></div><div><br></div></div>

--f46d043c06bea345b204f3256d82--
