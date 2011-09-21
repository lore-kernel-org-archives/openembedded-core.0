Received: from mail-qw0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1R6Tmv-0007af-7A
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 22:53:01 +0200
Received: by qwb7 with SMTP id 7so4234701qwb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WU8gbmARoj6dWrC1wKSHBM+TEg3WDtMJ/dyG+ghsZ7U=;
	b=ajKTMqGvIIzND13tx0uxzosZtJ9sQqN5WxPyMvfuD1Uc/0Z4aIwj8jbpbSgOH5zoWD
	qRm2PvdrRu/o/4rVacukD2TKEoL9K7gzVA8EdOvmbacENYibvFeS0dZlUk5QVCPIlXXC
	Yrc1cWe6dZiqKXrHvDgRygy+YRAAMai6j+2H0=
MIME-Version: 1.0
Received: by 10.52.186.98 with SMTP id fj2mr1068532vdc.487.1316638062075; Wed,
	21 Sep 2011 13:47:42 -0700 (PDT)
Received: by 10.52.181.73 with HTTP; Wed, 21 Sep 2011 13:47:42 -0700 (PDT)
Date: Wed, 21 Sep 2011 22:47:42 +0200
Message-ID: <CAHod+GefxnzwC0BGDYKe44Wjx=kVXUGK_YhbzYVT0uBxz7FbUw@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bluez4:replace deprecated configure switch
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
X-List-Received-Date: Wed, 21 Sep 2011 20:53:01 -0000
Content-Type: multipart/alternative; boundary=bcaec548a3adfcde2204ad79afb3

--bcaec548a3adfcde2204ad79afb3
Content-Type: text/plain; charset=ISO-8859-1

"--enable-configfiles" is deprecated upstream. Here is the original reason &
patch:

http://www.spinics.net/lists/linux-bluetooth/msg14266.html

Replace "--enable-configfiles" with "--enable-datafiles" in the bluez4
recipe.

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bbb/meta/recipes-connectivity/bluez/bluez4_4
index 994cec7..7ca6ac1 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN}-dev = "bluez-hcidump"

 ASNEEDED = ""

-PR = "r0"
+PR = "r1"

 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
@@ -39,7 +39,7 @@ EXTRA_OECONF = "\
   --enable-dund \
   --disable-cups \
   --enable-test \
-  --enable-configfiles \
+  --enable-datafiles \
 "

 do_install_append() {

--bcaec548a3adfcde2204ad79afb3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><s=
pan class=3D"Apple-style-span" style=3D"border-collapse: collapse; font-fam=
ily: arial, sans-serif; font-size: 14px; "><div>&quot;--enable-configfiles&=
quot; is deprecated upstream. Here is the original reason &amp; patch:</div=
>
<div><br></div><div><a href=3D"http://www.spinics.net/lists/linux-bluetooth=
/msg14266.html" target=3D"_blank" style=3D"color: rgb(66, 99, 171); ">http:=
//www.spinics.net/lists/linux-bluetooth/msg14266.html</a></div><div><br></d=
iv>
<div>Replace &quot;--enable-configfiles&quot; with &quot;--enable-datafiles=
&quot; in the bluez4 recipe.</div><div><br></div><div><div><div><div>diff -=
-git a/meta/recipes-connectivity/bluez/<a href=3D"http://bluez4_4.96.bb">bl=
uez4_4.96.bb</a> b/meta/recipes-connectivity/bluez/bluez4_4</div>
<div>index 994cec7..7ca6ac1 100644</div><div>--- a/meta/recipes-connectivit=
y/bluez/<a href=3D"http://bluez4_4.96.bb">bluez4_4.96.bb</a></div><div>+++ =
b/meta/recipes-connectivity/bluez/<a href=3D"http://bluez4_4.96.bb">bluez4_=
4.96.bb</a></div>
<div>@@ -12,7 +12,7 @@ RDEPENDS_${PN}-dev =3D &quot;bluez-hcidump&quot;</di=
v><div>=A0</div><div>=A0ASNEEDED =3D &quot;&quot;</div><div>=A0</div><div>-=
PR =3D &quot;r0&quot;</div><div>+PR =3D &quot;r1&quot;</div><div>=A0</div><=
div>=A0SRC_URI =3D &quot;\</div>
<div>=A0 =A0${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \</div><=
div>@@ -39,7 +39,7 @@ EXTRA_OECONF =3D &quot;\</div><div>=A0 =A0--enable-du=
nd \</div><div>=A0 =A0--disable-cups \</div><div>=A0 =A0--enable-test \</di=
v><div>- =A0--enable-configfiles \</div>
<div>+ =A0--enable-datafiles \</div><div>=A0&quot;</div><div>=A0</div><div>=
=A0do_install_append() {</div></div></div></div><div><br></div><div><br></d=
iv></span>

--bcaec548a3adfcde2204ad79afb3--
