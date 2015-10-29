Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id D628C755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 16:54:45 +0000 (UTC)
Received: by wijp11 with SMTP id p11so293129947wij.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=YunHEuuvYa7o5PqQ1oMfBtGRlTVwgCrHXwYlqJ9Lxsw=;
	b=DpVykXEpLhobA/NKEC5yNSOE4qKv87DklCnK83rz63+RJvZQNO5x+cjoviKYH1qDZt
	oNCdnbzI1KFuenJCEHLqGzNMZ/u9jdv5cFbJX2fd7m6JavfTuo8ed5YeLgK7WuKFGQIL
	govp44lsHp+Zsjan74RBoUQcVX8/AX07xItcTBlYOdYSKz0042Z898io8hFNpo3Y6Hyk
	6WndZ5qrMfiYVfbTxVpjuvNLmzm6pLb0kY5fIGUh/gyPV4FL1Pfu+raN5BZ/TYLcNJ8R
	qQfECBOQh6GjpepD8Ai5bpudAOCETA1c22JDeHzSkOFt40msJffGETX7Bh9kgMCWJOkm
	CQ7g==
X-Received: by 10.194.216.34 with SMTP id on2mr3333691wjc.109.1446137685169;
	Thu, 29 Oct 2015 09:54:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r65sm10063086wmb.20.2015.10.29.09.54.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 09:54:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 29 Oct 2015 17:55:13 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20151029165513.GB2564@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: New warnings in default linux-yocto-4.1 builds
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
X-List-Received-Date: Thu, 29 Oct 2015 16:54:46 -0000
X-Groupsio-MsgNum: 72743
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline

--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Probably caused by last linux-yocto changes.

NOTE: recipe linux-yocto-4.1.8+gitAUTOINC+aed9021602_dbe692d91c-r0: task do=
_kernel_configcheck: Started
WARNING: [kernel config]: specified values did not make it into the kernel'=
s final configuration:

Value requested for CONFIG_I2O not in final ".config"
Requested value: "CONFIG_I2O=3Dm"
Actual value set: "# CONFIG_I2O is not set"

Value requested for CONFIG_I2O_BLOCK not in final ".config"
Requested value: "CONFIG_I2O_BLOCK=3Dm"
Actual value set: ""

Value requested for CONFIG_I2O_CONFIG not in final ".config"
Requested value: "CONFIG_I2O_CONFIG=3Dm"
Actual value set: ""

Value requested for CONFIG_I2O_CONFIG_OLD_IOCTL not in final ".config"
Requested value: "CONFIG_I2O_CONFIG_OLD_IOCTL=3Dy"
Actual value set: ""

Value requested for CONFIG_I2O_PROC not in final ".config"
Requested value: "CONFIG_I2O_PROC=3Dm"
Actual value set: ""

Value requested for CONFIG_I2O_SCSI not in final ".config"
Requested value: "CONFIG_I2O_SCSI=3Dm"
Actual value set: ""

Value requested for CONFIG_MTRR_SANITIZER not in final ".config"
Requested value: "# CONFIG_MTRR_SANITIZER is not set"
Actual value set: "CONFIG_MTRR_SANITIZER=3Dy"


NOTE: recipe linux-yocto-4.1.8+gitAUTOINC+aed9021602_dbe692d91c-r0: task do=
_kernel_configcheck: Succeeded

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYyT3AACgkQN1Ujt2V2gBy/8gCfYPDrc16z4csyIUgfHCvopEi2
wXAAniDQvlyd5OhBzC5+upU/+FqvQR8f
=gDOc
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
