Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1S6OhK-0003YL-To
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 16:59:13 +0100
Received: by vcbfl13 with SMTP id fl13so2686138vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 07:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0WDijwbTQ7YpRUNvLEbaDgI0kR0+DnBTwy6m17y3afM=;
	b=LxN6TQl5iCXg7X9fFF5zpACFsF2SdJ+MzfukEsYphJGuY7lHfXl/rknYNOEq/XHQvk
	FGCJvKeaAUWDLas6WwjzqoSXff54fPTVKJ29FdnYCIysDaS5VtShEILmrRlfeEqO6hWC
	aveabCOmwUl98tnfe12+xxhKxUSwlfF0zL1FqMxqEYIEL33yIZqWpzydQc2O0qKSW9Ax
	LdLDLSMMtorzmDFCIy4It2GnXbEt5ILdjmNzltfxCJ6k3r9j/ckHo7LYKrjvdGRRnd0K
	vAa5trCdBZuSgO8c4kxP985rKfTPYbF+8cytZAwy2uTTdxTv+Y/b8gjr8uuXaZuHtBpZ
	l1dQ==
MIME-Version: 1.0
Received: by 10.52.68.139 with SMTP id w11mr9626065vdt.110.1331394629932; Sat,
	10 Mar 2012 07:50:29 -0800 (PST)
Received: by 10.52.112.39 with HTTP; Sat, 10 Mar 2012 07:50:29 -0800 (PST)
Date: Sat, 10 Mar 2012 16:50:29 +0100
Message-ID: <CAHod+GeSPpVDjgk8r09V-2=omFtGvjd54pK01NJ3DPaMrbwN1A@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] Split xcb-util into separate packages.
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
X-List-Received-Date: Sat, 10 Mar 2012 15:59:13 -0000
Content-Type: multipart/alternative; boundary=20cf307f37eef9164f04bae5778b

--20cf307f37eef9164f04bae5778b
Content-Type: text/plain; charset=ISO-8859-1

add recipe for xcb-util-image


diff --git a/meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bbb/meta/recipes-graphics/xcb/
xcb-util-image_0.3.8.bb
new file mode 100644
index 0000000..2fb350e
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb
@@ -0,0 +1,10 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM =
"file://image/xcb_image.c;endline=24;md5=eafdf965cfb89955fdedf75054223fb4 \
+
 file://image/xcb_image.h;startline=4;endline=27;md5=4e4f1b0fae5694beed407dea01f38212"
+PR = "r0"
+
+SRC_URI[md5sum] = "245a96041f373b05764148e52d2e0211"
+SRC_URI[sha256sum] =
"40390528c26e8231132540f16579b821de68bb2e9152918f72182d5a4038a6d9"
+

--20cf307f37eef9164f04bae5778b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

add recipe for xcb-util-image<div><br></div><div><br></div><div><div>diff -=
-git a/meta/recipes-graphics/xcb/<a href=3D"http://xcb-util-image_0.3.8.bb"=
>xcb-util-image_0.3.8.bb</a> b/meta/recipes-graphics/xcb/<a href=3D"http://=
xcb-util-image_0.3.8.bb">xcb-util-image_0.3.8.bb</a></div>
<div>new file mode 100644</div><div>index 0000000..2fb350e</div><div>--- /d=
ev/null</div><div>+++ b/meta/recipes-graphics/xcb/<a href=3D"http://xcb-uti=
l-image_0.3.8.bb">xcb-util-image_0.3.8.bb</a></div><div>@@ -0,0 +1,10 @@</d=
iv>
<div>+require xcb-util.inc</div><div>+</div><div>+LICENSE =3D &quot;MIT&quo=
t;</div><div>+LIC_FILES_CHKSUM =3D &quot;file://image/xcb_image.c;endline=
=3D24;md5=3Deafdf965cfb89955fdedf75054223fb4 \</div><div>+ =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0file://image/xcb_image.h;startline=3D4;endline=3D27;=
md5=3D4e4f1b0fae5694beed407dea01f38212&quot;</div>
<div>+PR =3D &quot;r0&quot;</div><div>+</div><div>+SRC_URI[md5sum] =3D &quo=
t;245a96041f373b05764148e52d2e0211&quot;</div><div>+SRC_URI[sha256sum] =3D =
&quot;40390528c26e8231132540f16579b821de68bb2e9152918f72182d5a4038a6d9&quot=
;</div>
<div>+</div></div>

--20cf307f37eef9164f04bae5778b--
