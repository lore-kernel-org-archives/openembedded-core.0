Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id ABECD60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:41:24 +0000 (UTC)
Received: by pawq9 with SMTP id q9so13318246paw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=WCzoqub5aF0X28LQvYkjczugkHf5FMHmRIZ/AnIsQcc=;
	b=GEk3dSXHlnsGao5Ua8Hnysi5vGlPB4zhrK19iSkjHgBvdfI4aNILHcsluuJmIn87fo
	XOPFrdKcbZIqwJdywqRS9S2QEFQV3XLByOwh5hZlnZygN5lGZO/EgqLNkJ8z+6ip9IRQ
	ph+fMI3cgQls3SIHvRHZdqGPNmYzLCzoWO1ezUmP8fCySI7qiz3GCyFPM0J6bVRsisIu
	uQH4MKwN1ER0iJ2lzxYEy5qVl2ageZpmk6YJ27HZx6oWlF6+kZ6jXKidKzx/eSH7yYtl
	9LtOVOrA1S1QYzpy2GO2E+sQGrALLpAVQmhhGcpYVYELa814qg35Rz2gMZGaFpUPBuWT
	TqJQ==
X-Received: by 10.68.192.9 with SMTP id hc9mr3809238pbc.57.1439826084429;
	Mon, 17 Aug 2015 08:41:24 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:a499:ca2e:e839:5908?
	([2601:646:8601:4580:a499:ca2e:e839:5908])
	by smtp.gmail.com with ESMTPSA id
	oq3sm6650416pdb.75.2015.08.17.08.41.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Aug 2015 08:41:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
Date: Mon, 17 Aug 2015 08:41:18 -0700
Message-Id: <5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Mon, 17 Aug 2015 15:41:27 -0000
X-Groupsio-MsgNum: 69541
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3D87F2B9-D40A-48BD-8441-64E57A896EA6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3D87F2B9-D40A-48BD-8441-64E57A896EA6
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6E8CC5C6-411D-4A0F-B57C-E54EA49F53D7"

--Apple-Mail=_6E8CC5C6-411D-4A0F-B57C-E54EA49F53D7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 17, 2015, at 5:42 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 17 August 2015 at 06:03, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> -LICENSE =3D "GPLv2 & LGPLv2.1 & MIT"
> +LICENSE =3D "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =3D =
"file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
> -                    =
file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c \
> -                    =
file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed"
> +                    =
file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c"
>=20
> Why?

removed unused license see

commit 8f1e0c5f38cdf7e401ab4d2bb93ad816d08e7715
Author: Kay Sievers <kay@vrfy.org>
Date: Tue Apr 21 19:21:56 2015 +0200

delete unused LICENSE.MIT


>=20
> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest gettext
> +inherit useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest gettext
>=20
> Why?

libudev API documentation has been converted from gtkdoc into man pages.

see

commit 2375607039517c88df51ef16ddbb624ec1c10654
Author: Kay Sievers <kay@vrfy.org>
Date: Wed Jun 3 00:09:23 2015 +0200

remove gudev and gtk-doc

The library moved to:
https://git.gnome.org/browse/libgudev/ =
<https://git.gnome.org/browse/libgudev/>



>=20
> @@ -108,8 +103,6 @@ EXTRA_OECONF =3D " --with-rootprefix=3D${rootprefix}=
 \
>                   --with-rootlibdir=3D${rootlibdir} \
>                   --with-roothomedir=3D${ROOT_HOME} \
>                   --disable-coredump \
> -                 --disable-introspection \
> -                 --disable-kdbus \
>                   --enable-split-usr \
>                   --without-python \
>                   --with-sysvrcnd-path=3D${sysconfdir} \
> @@ -210,7 +203,7 @@ python populate_packages_prepend (){
>  PACKAGES_DYNAMIC +=3D "^lib(udev|systemd).*"
>=20
>  PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs =
${PN}-analyze ${PN}-kernel-install \
> -             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh =
libgudev"
> +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh =
${PN}-xorg-xinitrc"
>=20
> Why?

Its newly added see
commit 1401ec2d34bcde406ced531a72dc46ebaf332594
Author: Kay Sievers <kay@vrfy.org>
Date:   Fri Jan 9 21:23:48 2015 +0100

    push xorg information to the systemd --user instance


>=20
>  SYSTEMD_PACKAGES =3D "${PN}-binfmt"
>  SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"
> @@ -224,8 +217,6 @@ FILES_${PN}-analyze =3D =
"${bindir}/systemd-analyze"
>  FILES_${PN}-initramfs =3D "/init"
>  RDEPENDS_${PN}-initramfs =3D "${PN}"
>=20
> -FILES_libgudev =3D "${libdir}/libgudev*${SOLIBS}"
> -
>=20
> Why?
>=20
> Okay, I know that kdbus is now enabled by default and gudev was =
removed and is now part of GNOME, but that should be explicit in the =
commit message and a rationale for moving from the "stable" series to =
latest release made.

There are many reasons, for me its overlay support for systemd-nspawn, =
networkd has got many new features that is now usable w.r.t. IP =
forwarding, vxlan etc.
and it has many bug fixed in those 2000 odd commits since 219, no =
different then any other package upgrades we do in general it keep the =
upgrade workload lower as we roll the releases.
Any specific concerns ?

>=20
> Ross


--Apple-Mail=_6E8CC5C6-411D-4A0F-B57C-E54EA49F53D7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 17, 2015, at 5:42 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 17 August 2015 at 06:03, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> =
wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
-LICENSE =3D "GPLv2 &amp; LGPLv2.1 &amp; MIT"<br class=3D"">
+LICENSE =3D "GPLv2 &amp; LGPLv2.1"<br class=3D"">
&nbsp;LIC_FILES_CHKSUM =3D "<a =
href=3D"file:///LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe" =
class=3D"">file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe</a> =
\<br class=3D"">
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
<a href=3D"file:///LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c"=
 =
class=3D"">file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c</=
a> \<br class=3D"">
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
<a href=3D"file:///LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed" =
class=3D"">file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed</a>"<=
br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
<a href=3D"file:///LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c"=
 =
class=3D"">file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c</=
a>"<br class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Why?</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>removed unused license see</div><div><br =
class=3D""></div><div><div style=3D"margin: 0px; padding: 0px; border: =
0px; line-height: 1.57143em; font-family: gotham, helvetica, arial, =
sans-serif; font-size: 14px; color: rgb(56, 56, 56); widows: 1;" =
class=3D"">commit 8f1e0c5f38cdf7e401ab4d2bb93ad816d08e7715<br =
clear=3D"none" class=3D"">Author: Kay Sievers &lt;<a =
href=3D"mailto:kay@vrfy.org" class=3D"">kay@vrfy.org</a>&gt;<br =
clear=3D"none" class=3D"">Date: Tue Apr 21 19:21:56 2015 +0200<br =
clear=3D"none" class=3D""><br clear=3D"none" class=3D"">delete unused =
LICENSE.MIT<br clear=3D"none" class=3D""></div><div class=3D""><br =
class=3D""></div></div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">-inherit gtk-doc =
useradd pkgconfig autotools perlnative update-rc.d update-alternatives =
qemu systemd ptest gettext<br class=3D"">
+inherit useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest gettext<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Why?</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div><span style=3D"white-space: pre-wrap; widows: 1;" =
class=3D"">libudev API documentation has been converted from gtkdoc =
</span><span style=3D"white-space: pre-wrap; widows: 1;" class=3D"">into =
man pages.</span></div><div class=3D""><br =
class=3D""></div><div>see</div><div><br class=3D""></div><div><span =
style=3D"color: rgb(56, 56, 56); font-family: gotham, helvetica, arial, =
sans-serif; font-size: 14px; line-height: 22px; widows: 1;" =
class=3D"">commit 2375607039517c88df51ef16ddbb624ec1c10654</span><br =
clear=3D"none" style=3D"color: rgb(56, 56, 56); font-family: gotham, =
helvetica, arial, sans-serif; font-size: 14px; line-height: 22px; =
widows: 1;" class=3D""><span style=3D"color: rgb(56, 56, 56); =
font-family: gotham, helvetica, arial, sans-serif; font-size: 14px; =
line-height: 22px; widows: 1;" class=3D"">Author: Kay Sievers &lt;<a =
href=3D"mailto:kay@vrfy.org" class=3D"">kay@vrfy.org</a>&gt;</span><br =
clear=3D"none" style=3D"color: rgb(56, 56, 56); font-family: gotham, =
helvetica, arial, sans-serif; font-size: 14px; line-height: 22px; =
widows: 1;" class=3D""><span style=3D"color: rgb(56, 56, 56); =
font-family: gotham, helvetica, arial, sans-serif; font-size: 14px; =
line-height: 22px; widows: 1;" class=3D"">Date: Wed Jun 3 00:09:23 2015 =
+0200</span><br clear=3D"none" style=3D"color: rgb(56, 56, 56); =
font-family: gotham, helvetica, arial, sans-serif; font-size: 14px; =
line-height: 22px; widows: 1;" class=3D""><br clear=3D"none" =
style=3D"color: rgb(56, 56, 56); font-family: gotham, helvetica, arial, =
sans-serif; font-size: 14px; line-height: 22px; widows: 1;" =
class=3D""><span style=3D"color: rgb(56, 56, 56); font-family: gotham, =
helvetica, arial, sans-serif; font-size: 14px; line-height: 22px; =
widows: 1;" class=3D"">remove gudev and gtk-doc</span><br clear=3D"none" =
style=3D"color: rgb(56, 56, 56); font-family: gotham, helvetica, arial, =
sans-serif; font-size: 14px; line-height: 22px; widows: 1;" class=3D""><br=
 clear=3D"none" style=3D"color: rgb(56, 56, 56); font-family: gotham, =
helvetica, arial, sans-serif; font-size: 14px; line-height: 22px; =
widows: 1;" class=3D""><span style=3D"color: rgb(56, 56, 56); =
font-family: gotham, helvetica, arial, sans-serif; font-size: 14px; =
line-height: 22px; widows: 1;" class=3D"">The library moved =
to:</span><br clear=3D"none" style=3D"color: rgb(56, 56, 56); =
font-family: gotham, helvetica, arial, sans-serif; font-size: 14px; =
line-height: 22px; widows: 1;" class=3D""><span style=3D"color: rgb(56, =
56, 56); font-family: gotham, helvetica, arial, sans-serif; font-size: =
14px; line-height: 22px; widows: 1;" class=3D""><a =
href=3D"https://git.gnome.org/browse/libgudev/" =
class=3D"">https://git.gnome.org/browse/libgudev/</a></span></div><div><sp=
an style=3D"color: rgb(56, 56, 56); font-family: gotham, helvetica, =
arial, sans-serif; font-size: 14px; line-height: 22px; widows: 1;" =
class=3D""><br class=3D""></span></div><div><span style=3D"color: =
rgb(56, 56, 56); font-family: gotham, helvetica, arial, sans-serif; =
font-size: 14px; line-height: 22px; widows: 1;" class=3D""><br =
class=3D""></span></div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div =
class=3D"">&nbsp;</div><div class=3D"">@@ -108,8 +103,6 @@ EXTRA_OECONF =
=3D " --with-rootprefix=3D${rootprefix} \</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
--with-rootlibdir=3D${rootlibdir} \<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
--with-roothomedir=3D${ROOT_HOME} \<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
--disable-coredump \<br class=3D"">
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;--disable-introspection \<br class=3D"">
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;--disable-kdbus \<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
--enable-split-usr \<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
--without-python \<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
--with-sysvrcnd-path=3D${sysconfdir} \<br class=3D"">
@@ -210,7 +203,7 @@ python populate_packages_prepend (){<br class=3D"">
&nbsp;PACKAGES_DYNAMIC +=3D "^lib(udev|systemd).*"<br class=3D"">
<br class=3D"">
&nbsp;PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs =
${PN}-analyze ${PN}-kernel-install \<br class=3D"">
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${PN}-rpm-macros =
${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${PN}-rpm-macros =
${PN}-binfmt ${PN}-pam ${PN}-zsh ${PN}-xorg-xinitrc"<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Why?</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>Its newly added see</div><div><div>commit =
1401ec2d34bcde406ced531a72dc46ebaf332594</div><div>Author: Kay Sievers =
&lt;<a href=3D"mailto:kay@vrfy.org" =
class=3D"">kay@vrfy.org</a>&gt;</div><div>Date: &nbsp; Fri Jan 9 =
21:23:48 2015 +0100</div><div><br class=3D""></div><div>&nbsp; &nbsp; =
push xorg information to the systemd --user instance</div><div =
class=3D""><br class=3D""></div></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&nbsp;SYSTEMD_PACKAGES =3D "${PN}-binfmt"<br class=3D"">
&nbsp;SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"<br =
class=3D"">
@@ -224,8 +217,6 @@ FILES_${PN}-analyze =3D =
"${bindir}/systemd-analyze"<br class=3D"">
&nbsp;FILES_${PN}-initramfs =3D "/init"<br class=3D"">
&nbsp;RDEPENDS_${PN}-initramfs =3D "${PN}"<br class=3D"">
<br class=3D"">
-FILES_libgudev =3D "${libdir}/libgudev*${SOLIBS}"<br class=3D"">
-<br class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Why?&nbsp;</div><div class=3D""><br class=3D""></div><div =
class=3D"">Okay, I know that kdbus is now enabled by default and gudev =
was removed and is now part of GNOME, but that should be explicit in the =
commit message and a rationale for moving from the "stable" series to =
latest release made.</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>There are many reasons, for me its overlay support =
for systemd-nspawn, networkd has got many new features that is now =
usable w.r.t. IP forwarding, vxlan etc.</div><div>and it has many bug =
fixed in those 2000 odd commits since 219, no different then any other =
package upgrades we do in general it keep the upgrade workload lower as =
we roll the releases.&nbsp;</div><div>Any specific concerns ?</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D""><br class=3D""></div><div =
class=3D"">Ross</div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_6E8CC5C6-411D-4A0F-B57C-E54EA49F53D7--

--Apple-Mail=_3D87F2B9-D40A-48BD-8441-64E57A896EA6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXSAKIACgkQuwUzVZGdMxS9vACeIcNaoKmTiMvFEug3aZR9dHeL
+YoAoIXUhiTwOuDcuu52GE+RQqm9KDHd
=fMTe
-----END PGP SIGNATURE-----

--Apple-Mail=_3D87F2B9-D40A-48BD-8441-64E57A896EA6--
