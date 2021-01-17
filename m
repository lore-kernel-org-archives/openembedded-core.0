Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.18666.1610893556901785298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 06:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=OdpeEA57;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from dom0.fritz.box (unknown [87.123.119.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id EE48A20B7192;
	Sun, 17 Jan 2021 06:25:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EE48A20B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1610893556;
	bh=pjMsbwXA0CzPMfex1Xpr91UuE7D+oGrXdZ34ZUxHILM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OdpeEA57lqX4lHtNdY7FsuHKsqi4dGSuy6CQVVS57b3cvFjehjV35x07+PdDsJzkr
	 wtYnN4v2nQ+i9gkQglD3CsZ16rOuW6hh6FcxiRlCOn/PoxmfBYws6nAeBBpYqj7W0R
	 wKvqpL2iHOAuLHAKKsCpDbn7//mVVp+LUeWiWbjE=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Barker <pbarker@konsulko.com>
Subject: [meta-oe][PATCH v2 3/3] appliance: Add VHD/VHDX generation
Date: Sun, 17 Jan 2021 15:25:19 +0100
Message-Id: <20210117142519.21297-3-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117142519.21297-1-anbelski@linux.microsoft.com>
References: <20210117142519.21297-1-anbelski@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sinan Kaya <okaya@kernel.org>

Signed-off-by: Sinan Kaya <okaya@kernel.org>
Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/m=
eta/recipes-core/images/build-appliance-image_15.0.0.bb
index 8b95026218..c5c9d385ef 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -20,7 +20,7 @@ IMAGE_ROOTFS_EXTRA_SPACE =3D "41943040"
 APPEND +=3D "rootfstype=3Dext4 quiet"
=20
 DEPENDS =3D "zip-native python3-pip-native"
-IMAGE_FSTYPES =3D "wic.vmdk"
+IMAGE_FSTYPES =3D "wic.vmdk wic.vhd wic.vhdx"
=20
 inherit core-image module-base setuptools3
=20
@@ -129,6 +129,8 @@ create_bundle_files () {
 	mkdir -p Yocto_Build_Appliance
 	cp *.vmx* Yocto_Build_Appliance
 	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vmdk Yocto=
_Build_Appliance/Yocto_Build_Appliance.vmdk
+	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhdx Yocto=
_Build_Appliance/Yocto_Build_Appliance.vhdx
+	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhd Yocto_=
Build_Appliance/Yocto_Build_Appliance.vhd
 	zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Buil=
d_Appliance
 	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${IMGDEPLOYDIR}/Yocto_Buil=
d_Appliance.zip
 }
--=20
2.29.2

