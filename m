Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2DED47741E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 11:35:43 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n186so13092314wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=2WVymByeBszW+E5Dz0drJRhooTLnO0HbVDMzGI4DPkI=;
	b=MG7s+QslB7Dig+G/VEkmVoqNqlsHfyEf6OEr7aaObuIR4fa+2syjJ5DFZoJv/50odn
	M+Os2nC7go2fSpgRkEyioNI0JUVesH+BUbCxQqvA44vb7qLudQcPD2f7UW0DQosXYqWv
	WLp8hrbZuM4jN/Nw9RPxMMCusBdLAGb2z5CzhK27g0YsmNhVuymTg4CJ+aTADa8j8pia
	9Tgabfbnq/XE0S/ZVEFWHD18skzAm069HWfVGw90IBE6Aylu+JoU3F4NVeQzjXNoIN/2
	3X1pYdkp4JUzfWt8Ga+Y+lNbfWvi5L4nu/Vm8Rv8KlPdtVXzv5mmeoVxmxjhbroIthgP
	HyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=2WVymByeBszW+E5Dz0drJRhooTLnO0HbVDMzGI4DPkI=;
	b=kIK/MRCjdNzMq8iCHdHE3X8Xy/ecwtcGSgOtja4jx9JoqiaAKcSzjt304pdHe3hwV6
	DR9O94HvEJMqr1h4YG40lhLZ16NZIVW6WnPO3MCsxonhxA4teJT44LiH8gJLeVlaJV1p
	FlctTwBNbS30lnpuALlVc92d3DiOqAuB71hEF84GjdcYYHkvT6RIIo5r2BCou9SO6uS/
	07/eFF3Je96UgdoSHtqIOm01DNGmdsATH8fky1UIC6eLUQ1HGktI9Z4D51YZEGceWYX0
	UGWdUC64v0JQHfcPGyMA6iZ5F3d8qlvfWftiQntX+eLxVl3mNheWFc+bX1Gugc+pLDHN
	Uzeg==
X-Gm-Message-State: AD7BkJKZ+s9A463W9F21LL7Bynhm781Hpvo8lCLlUgtPcUSaSlBhDe6L6MaA9A83wqXwRA==
X-Received: by 10.28.158.198 with SMTP id h189mr6396977wme.74.1456659344215;
	Sun, 28 Feb 2016 03:35:44 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	d9sm20711234wjf.43.2016.02.28.03.35.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 03:35:43 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Sun, 28 Feb 2016 12:35:41 +0100
Message-Id: <8BA17D11-B15F-46F1-A406-F403836BFD88@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH RESEND 1/7] udev: Don't introduce usb or pci dependencies without usb or pci being featured
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
X-List-Received-Date: Sun, 28 Feb 2016 11:35:44 -0000
X-Groupsio-MsgNum: 78845
Content-Type: multipart/signed;
	boundary="Apple-Mail=_86870B8E-CD09-420D-B41A-17A78307B658";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_86870B8E-CD09-420D-B41A-17A78307B658
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Fixes that udev always requires PCI or USB, idenpendently from =
DISTRO_FEATURES
or PACKAGECONFIG.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/udev/udev.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
index 93d7369..df41f11 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -12,7 +12,14 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \

 LDFLAGS +=3D "-lrt"

-DEPENDS =3D "glib-2.0 libusb usbutils pciutils glib-2.0-native =
gperf-native libxslt-native util-linux"
+PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'usbhost', =
'usb', '', d)} \
+  ${@base_contains('DISTRO_FEATURES', 'pci', 'pci', '', d)}"
+
+DEPENDS =3D "glib-2.0 glib-2.0-native gperf-native libxslt-native =
util-linux"
+
+PACKAGECONFIG[usb] =3D =
"--with-usb-ids-path=3D${datadir}/usb.ids,--without-usb-ids-path,libusb =
usbutils"
+PACKAGECONFIG[pci] =3D "--with-pci-ids-path=3D${datadir}/pci.ids =
ac_cv_file__usr_share_pci_ids=3Dno =
ac_cv_file__usr_share_hwdata_pci_ids=3Dno =
ac_cv_file__usr_share_misc_pci_ids=3Dyes,--without-pci-ids-path,pciutils"
+
 RPROVIDES_${PN} =3D "hotplug"

 PROVIDES =3D "libgudev"
@@ -42,10 +49,6 @@ RDEPENDS_${PN}-ptest +=3D "make perl python"
 libexecdir =3D "${base_libdir}"
 EXTRA_OECONF =3D "--disable-introspection \
                 --with-rootlibdir=3D${base_libdir} \
-                --with-pci-ids-path=3D${datadir}/pci.ids \
-                ac_cv_file__usr_share_pci_ids=3Dno \
-                ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
-                ac_cv_file__usr_share_misc_pci_ids=3Dyes \
                 --sbindir=3D${base_sbindir} \
                 --libexecdir=3D${nonarch_base_libdir} \
                 --with-rootlibdir=3D${base_libdir} \
--
2.6.3


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_86870B8E-CD09-420D-B41A-17A78307B658
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW0tuOAAoJEESZlq7c5Qqd+AYP/1/B09zx58n1S/q/JFsAFwzS
JHZBBZwgL89lRP4xk1Lu2sZ22i0tkuxCFMXvj/t68kr4P5eauvsFwaJREK2KbUXG
k0E1Ez+WLtIbIF11pJC9mVmjL2tjIqThvY7jKjnojGKqj7NKmA58wh7XWfIPRzwu
6tiNoPX1hPK7yPsXD0fISerlBEbItGLDu6fXER+A4tc1R7V9sxwEzxCP7ptEBIOE
6osIjYKpUJXc1KyKmkVBwG57FxGIlolhhy4Ch0Xe67vS15+PaRrlt5X+gmphcswO
aDD5Qkj34SctR69dgQHOqnusoVO8C0vAHcx4rZu+0RTexRJTVRZnVV1kicwGRt4U
K+N3iie9pEgFQPPJO99BTzbTv+2/qBf+vHHlCviVroL8U3sxWF9a37eW+Dz0YBJZ
ocIJddUd0OEMACFNI3GGe92Uze8u0OMIFq2uTsokh2gKkf1eDaX36k8hhHBmUa7Y
y7z4oltaF/EI8oCWv6/96O9l0oP8e3cxcYDLNtsCcac2OdOWIF6m6W3JaXQnkOrD
BHEMdK2XSdl6v+uq+XBS6iAqyNNsfKfgZt2XFf539Xow5QGJO5DWpiTdAU/V8K2u
XsQCdG0nH3d88lNEB72TmfCc0NPB889QwKoEISVHF9f1NGnzTg3QOyLwCm2nAHpz
Vstgi1VvWJREfE+KGpvr
=FLtp
-----END PGP SIGNATURE-----

--Apple-Mail=_86870B8E-CD09-420D-B41A-17A78307B658--
