Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D3F6A607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 04:10:54 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c74so5309352pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 21:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=9UGvVuxGU4FKgYvL+0cVJtX40EBIW7otdAxWiaQZvg0=;
	b=F71ExCjKdWSe+VZRG+XFq/D2h9HJJG2fS16UhwQXi/tw97mHrGRKpTwY+aX+BbRo2y
	mj8ztpnG/dSJmYeEpAFkkKgPWbQ62DUMQMrYSBENOBTWEOpOL38wipJt0WTlLekcCiRk
	NHP6RGGrsXDbUPHr3oOIy4rPr208zLSE7ztXKNcENH3oM57gAUiuCrU7EXqMkV1i5kAZ
	YOTTWYcfSQHW5AHPzk/0TVHgS7Anq4KeiIiNIrV09a6y9cgjhoGRqqsxPQj0fxOZsqzY
	WUSxKqfkTH0haUYrgtFxhMgmacd1Q07L1lEc2u3u54eZ0UJE9KsxCkV8gc4dgmeOHXjU
	xCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=9UGvVuxGU4FKgYvL+0cVJtX40EBIW7otdAxWiaQZvg0=;
	b=Zx8l6CxIHVj0Bbg7dL7q1TkvMBVXrcbZNwu2Gg6HMlvQpoKpZw58KEmu4AWrmK3r7t
	2RzsVAtwNTqgiaIybpdXcVqvHBaBsIRNS3MKNlWp+pt3Wu6nzunF7t4AlMrew4T9QIcK
	VeESiPcXq3NKbEjpXwQ0kjfXILjRfK/eYARgSujLTxtlfQrQt2WsMazi58N8+Z3ACSRG
	oUDv5jMPXjzcD0l29n/HQxUM61oRuFu9bLcTbvLhILq6vbAWpfKDTmASDrQJBScM0cM2
	BmNx5rwv/gt5MPoUFJhTZlz8Tmjuq4TfYghYmg6K93y7KEanlBf2kYqPf6TPsFKlWaFx
	iRWg==
X-Gm-Message-State: ALyK8tJBuTWwLG9/zU6q+ozbMwcZBM12xxhbq3HeUC4pztNfuTciimQXwSpj5fcw/h+HZg==
X-Received: by 10.98.51.197 with SMTP id z188mr30797pfz.100.1466136655362;
	Thu, 16 Jun 2016 21:10:55 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v126sm1481770pfb.60.2016.06.16.21.10.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2016 21:10:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <9cc3d71a9624333bd6c3c676ee2b855be1903568.1466134498.git.Qi.Chen@windriver.com>
Date: Thu, 16 Jun 2016 21:10:53 -0700
Message-Id: <61D9E1B1-1ABB-4B99-96C5-7F5E019B5750@gmail.com>
References: <cover.1466134497.git.Qi.Chen@windriver.com>
	<9cc3d71a9624333bd6c3c676ee2b855be1903568.1466134498.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] systemd-bootchart: add recipe
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
X-List-Received-Date: Fri, 17 Jun 2016 04:10:55 -0000
X-Groupsio-MsgNum: 83544
Content-Type: multipart/signed;
	boundary="Apple-Mail=_78F6D49A-2602-41F0-BB89-9C217183AE60";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_78F6D49A-2602-41F0-BB89-9C217183AE60
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 16, 2016, at 8:36 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> .../systemd-bootchart/systemd-bootchart_230.bb     | 30 =
++++++++++++++++++++++
> 1 file changed, 30 insertions(+)
> create mode 100644 =
meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
>=20
> diff --git =
a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb =
b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
> new file mode 100644
> index 0000000..7c135cb
> --- /dev/null
> +++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
> @@ -0,0 +1,30 @@
> +LICENSE =3D "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c \
> +                    =
file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe"
> +
> +SRC_URI =3D =
"git://github.com/systemd/systemd-bootchart.git;protocol=3Dhttps"
> +
> +# Modify these as desired
> +PV =3D "230+git${SRCPV}"
> +SRCREV =3D "dcb246b46239259ec99b3c6e6ab7d27e1a5a8a84"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "libxslt-native libxslt-native xmlto-native =
docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool"
> +RDEPENDS_${PN} +=3D "systemd"
> +
> +inherit pkgconfig autotools systemd
> +
> +SYSTEMD_SERVICE_${PN} =3D "systemd-bootchart.service"
> +SYSTEMD_AUTO_ENABLE_${PN} =3D =E2=80=9Cdisable"

why disable the service by default

> +
> +do_configure_prepend() {
> +    # intltool.m4 is a soft link to /usr/share/aclocal/m4, delete it =
and use the one in our sysroot
> +    rm ${S}/m4/intltool.m4
> +    cp ${STAGING_DIR_TARGET}${datadir}/aclocal/intltool.m4 =
${S}/m4/intltool.m4
> +}
> +
> +FILES_${PN} +=3D "${systemd_unitdir}/systemd-bootchart"
> +
> +EXTRA_OECONF =3D " --with-rootprefix=3D${base_prefix} \
> +                 --with-rootlibdir=3D${base_libdir}"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_78F6D49A-2602-41F0-BB89-9C217183AE60
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldjeE0ACgkQuwUzVZGdMxTpGwCghRguqMqCpx9ryEGbmWu3p0XV
oREAnRaX6szFcRr5I3vqs92NxtCV9F6h
=ukJP
-----END PGP SIGNATURE-----

--Apple-Mail=_78F6D49A-2602-41F0-BB89-9C217183AE60--
