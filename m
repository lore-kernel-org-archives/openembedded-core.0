Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 789D671D87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:52:54 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r144so51958119wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=cdmIGnhtzt81AjXzhk8UvXLe+pk5BrVqIw70guISrc8=;
	b=GdIj1bNau+E3vm+PCbgDcAtJPsKfT4O6JMXGl7fB4wIg2zwQGHPLeSO8sZ8XB+2cAv
	ywhn6TxkRozlnQp+1V9HXLkBn1GvqCyIJdcvuzX1oLtZCUnCFFPiwLV9idrxSLYK4M8k
	wdGnHiwFD9rzHdirc1uZxfy6GxA5d3DLLY9EYa4JEMnCRwUVUSJtVbNd89c9l72hhDF4
	5rfcjZo7HzcAcoLv+6uvJa3xumzfH/yw6AWbxlJm5pWFYL9lZiMblE40b0csEcxVxJsX
	sttgcdxnjhZhVfNrp+vMzSg4rvnet522Q5g+28040AWixqFA7R3kCJ2dc9C8KplAd9gc
	d1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=cdmIGnhtzt81AjXzhk8UvXLe+pk5BrVqIw70guISrc8=;
	b=Vf4xQ5JHawYlqv/AYnI63WNpi/FGXQp/eCiMr7zGN1E9fVTVN/h5ssJ9CVdPcvji5V
	5k24/SGDPIzplj4sq3VB5JA/JofzmMTKfcOLP16JKizGFIQq9w1A5c+Eu/lCylH25MwD
	UFhwMAORd349+URb0magXWq/8hyEBJJXU/uyu7n1gOZ7FCdXeYlIFtiWyKLfPUJI0240
	33We/cUUoYxrDlRgQbrk5UtgzY6j9YYrK3CP5VmGR16bQ38btjUXVFpWT3s05DozEWd0
	LylXQcM5YK2bEHjM0Gqbm5zICDc7++3ZYSdwoXvaI3M8tlhuVjm1qcwPOhr+9Mj7b6vz
	cSIw==
X-Gm-Message-State: AIkVDXKWDjmxmKHR/BmadERFXJUQIpJPp0H0mvEMcNuveIdHgTvOEKUOm3XemivzEoaXnw==
X-Received: by 10.28.199.206 with SMTP id x197mr23234504wmf.5.1485377574086;
	Wed, 25 Jan 2017 12:52:54 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l10sm23975364wrb.44.2017.01.25.12.52.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 12:52:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 21:52:55 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20170125205255.GI3260@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: New warnings in default linux-yocto-4.9 builds
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
X-List-Received-Date: Wed, 25 Jan 2017 20:52:54 -0000
X-Groupsio-MsgNum: 92393
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o7gdRJTuwFmWapyH"
Content-Disposition: inline

--o7gdRJTuwFmWapyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Few more in default build of latest 4.9.3 for qemux86.

Probably caused by last linux-yocto changes.

WARNING: linux-yocto-4.9.3+gitAUTOINC+03a2d3f7f9_881cba95ae-r0 do_kernel_co=
nfigcheck: [kernel config]: specified values did not make it into the kerne=
l's final configuration:

---------- CONFIG_BNX2X_SRIOV -----------------
Config: CONFIG_BNX2X_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-source/.kern=
el-meta/configs/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNX2X_SRIOV=3Dy
Actual value:    =20

Config 'BNX2X_SRIOV' has the following conditionals:=20
  BNX2X && PCI_IOV (value: "n")
BNX2X && PCI_IOV (value: "n")
Dependency values are:=20
  PCI_IOV [n] BNX2X [m] y [y]

---------- CONFIG_BNXT_SRIOV -----------------
Config: CONFIG_BNXT_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-source/.kern=
el-meta/configs/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNXT_SRIOV=3Dy
Actual value:    =20

Config 'BNXT_SRIOV' has the following conditionals:=20
  BNXT && PCI_IOV (value: "n")
BNXT && PCI_IOV (value: "n")
Dependency values are:=20
  y [y] BNXT [m] PCI_IOV [n]

On Thu, Oct 29, 2015 at 05:55:13PM +0100, Martin Jansa wrote:
> Probably caused by last linux-yocto changes.
>=20
> NOTE: recipe linux-yocto-4.1.8+gitAUTOINC+aed9021602_dbe692d91c-r0: task =
do_kernel_configcheck: Started
> WARNING: [kernel config]: specified values did not make it into the kerne=
l's final configuration:
>=20
> Value requested for CONFIG_I2O not in final ".config"
> Requested value: "CONFIG_I2O=3Dm"
> Actual value set: "# CONFIG_I2O is not set"
>=20
> Value requested for CONFIG_I2O_BLOCK not in final ".config"
> Requested value: "CONFIG_I2O_BLOCK=3Dm"
> Actual value set: ""
>=20
> Value requested for CONFIG_I2O_CONFIG not in final ".config"
> Requested value: "CONFIG_I2O_CONFIG=3Dm"
> Actual value set: ""
>=20
> Value requested for CONFIG_I2O_CONFIG_OLD_IOCTL not in final ".config"
> Requested value: "CONFIG_I2O_CONFIG_OLD_IOCTL=3Dy"
> Actual value set: ""
>=20
> Value requested for CONFIG_I2O_PROC not in final ".config"
> Requested value: "CONFIG_I2O_PROC=3Dm"
> Actual value set: ""
>=20
> Value requested for CONFIG_I2O_SCSI not in final ".config"
> Requested value: "CONFIG_I2O_SCSI=3Dm"
> Actual value set: ""
>=20
> Value requested for CONFIG_MTRR_SANITIZER not in final ".config"
> Requested value: "# CONFIG_MTRR_SANITIZER is not set"
> Actual value set: "CONFIG_MTRR_SANITIZER=3Dy"
>=20
>=20
> NOTE: recipe linux-yocto-4.1.8+gitAUTOINC+aed9021602_dbe692d91c-r0: task =
do_kernel_configcheck: Succeeded
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o7gdRJTuwFmWapyH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIkQJwAKCRA3VSO3ZXaA
HArZAKCgdYv6GT63ddlueyVS3xNyB1H9hwCePIpMYiYi/funNrir7fhRPtlK5GY=
=BCQe
-----END PGP SIGNATURE-----

--o7gdRJTuwFmWapyH--
