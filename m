Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03E1571CA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 19:07:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 194so17346897pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=I0W/qDSpE2Oj5PuovHhfgoywmvZQf0RXcpxzgOpjHiU=;
	b=fAHDQQqTGg+jhGDOkxIg0pc6oFVYreffxRab8NVtn92IEC/1qOxi3QDXaR7oXyMqDO
	Ja6T4rJaHNuYWZSN4cg7vUKTpLQXNCSjqdaEKhIAbB8Csg9bOcSASMD++2BBgKMMhQh8
	M6WvX8c8kr7DQ20A3dbYOt9KlHP5RoKlUS2cGBSZMczBJ22pjK14bWYc52A5PXRbdvaY
	X6UV54kZ2L7CaWE47CEczDC8GHJ4QHrz7uSEL3md4/63Uf0hdneNb2W3SURbA13wdbDv
	Oq+tEvksfekaMp2X+jwYytkstAUK0SGvfvat+PqRMOmxSxKLaO3Tqu1JHWkygwXyr45B
	tCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=I0W/qDSpE2Oj5PuovHhfgoywmvZQf0RXcpxzgOpjHiU=;
	b=dCTKa0xQSrav2YvR3BFbRcSXU4X4G+IhAR1pN18tmFOnZjKqU7uB82ShrkVrJq+DQ6
	94Y81weNL4jzKBwpb0mA+ZvB8gCuM5rK7hch8yPwamID+vlHBsEkUoEdV70SgHHw14C+
	MfIG2gBWesx5srtmPNukBTG39zBvtDDN8eEUCcmSePRsYogUK6b0wCkTgC11LUgRf1+I
	gYRvLB9dCZkbO5gGB29+YdqF4+yH2C5XL4lxxBMDFyufAaUTmWtiXQvmFLslnQ5bjeTA
	IARXBwpVW0k/4LeX81qcj2CAizAjKRpjKr44FsaExAXsebt/NZCDt+aPOSQ01Y6TagJ6
	vJBg==
X-Gm-Message-State: AIkVDXIB0jqHqJBGniMOLwRj3WbKQDjFHoP7HqLq5POaKyz+VV0CORmVtUqiMlhMts8hiA==
X-Received: by 10.99.232.5 with SMTP id s5mr40855900pgh.66.1485284845513;
	Tue, 24 Jan 2017 11:07:25 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:c8b8:641d:6d81:476d])
	by smtp.gmail.com with ESMTPSA id
	y184sm46535624pfg.86.2017.01.24.11.07.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jan 2017 11:07:24 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<20170124090715.11646-1-freesilicon@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8ea809ad-d2bd-e575-3447-51cadcb338c2@gmail.com>
Date: Tue, 24 Jan 2017 11:07:18 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170124090715.11646-1-freesilicon@gmail.com>
Subject: Re: [PATCH v2 0/3] openssh: Make sshd-config a package
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
X-List-Received-Date: Tue, 24 Jan 2017 19:07:26 -0000
X-Groupsio-MsgNum: 92301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="1bFbh34W6PGrP4LgF6Tc87F6uU9WxXuqf"

--1bFbh34W6PGrP4LgF6Tc87F6uU9WxXuqf
Content-Type: multipart/mixed; boundary="GutD5ffMX4A1lXxBKvUKiCO7PVP3TDWa2";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <8ea809ad-d2bd-e575-3447-51cadcb338c2@gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/3] openssh: Make sshd-config a package
References: <20170123145508.9252-1-freesilicon@gmail.com>
 <20170124090715.11646-1-freesilicon@gmail.com>
In-Reply-To: <20170124090715.11646-1-freesilicon@gmail.com>

--GutD5ffMX4A1lXxBKvUKiCO7PVP3TDWa2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 1/24/17 1:07 AM, David Vincent wrote:
> This series of patch introduces a new way of modifying OpenSSH sshd
> configuration. Instead of modifying the files and launching the server =
with
> custom options, a package which RPROVIDES sshd-config must be installed=
=2E
>=20
> The package to use is selected using a new variable called SSHD_CONFIG =
which is
> used exclusively when selecting ssh-server-openssh in IMAGE_FEATURES.
>=20

How does this work with dropbear. Since we can use dropbear as a ssh
server alternative.

> Changes since v1:
>   Remove documentation
>=20
> David Vincent (3):
>   openssh: Package server configuration
>   core-image: Set default sshd configuration
>   rootfs-postcommands: Modify ssh-related commands
>=20
>  meta/classes/core-image.bbclass                    |  3 +-
>  meta/classes/rootfs-postcommands.bbclass           | 28 ++++---------
>  meta/recipes-connectivity/openssh/openssh_7.3p1.bb | 47 ++++++++++++++=
++++----
>  3 files changed, 49 insertions(+), 29 deletions(-)
>=20


--GutD5ffMX4A1lXxBKvUKiCO7PVP3TDWa2--

--1bFbh34W6PGrP4LgF6Tc87F6uU9WxXuqf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAliHpesACgkQuwUzVZGdMxSd5gCgkCvO/NGdwIZy54yKR7+LLdF+
gocAnijWHUgEYLchvoujHQ0WwOfs1kTY
=7wQP
-----END PGP SIGNATURE-----

--1bFbh34W6PGrP4LgF6Tc87F6uU9WxXuqf--
