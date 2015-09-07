Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 128F260017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 21:15:57 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so107131694pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 14:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GaFpjQGxyoHBye2+5jjeUQIsmUT/Y9rPtAoxDJ0b/HA=;
	b=gz2M5EcwVO4GW07dJQGmXK8QDqeL1IrsuKemm38IaRHlgyO77kAyd7adNBK+i1mCKS
	FYGsdfjurLbI+REaXs0j5O96gzf1JFrCcE1X3OD1P8/5vqK6rVM65IYyLkLdIB5FkoHw
	mL+Ci2UJal0e3St77hB/LIPd5GhLyVXcNHK+7JS11cbLtfFuIybgsligJe0hopZU4peI
	XDJdSx5Wc5rqbjXcxas0cUWcN6/HBkgf/QOnY6ZPBbjfzYkef9vMh3634gwO3zqEPsUK
	U9RwsVdIsAg+oyWo9kAjO7uWwsX9U4c8AZwMTmEyUABo0X4qoOkEJdKq361bjfObiKp2
	0/KQ==
X-Received: by 10.68.100.36 with SMTP id ev4mr49347441pbb.119.1441660557806;
	Mon, 07 Sep 2015 14:15:57 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:497b:74fa:5383:6ca2?
	([2601:646:8601:4580:497b:74fa:5383:6ca2])
	by smtp.gmail.com with ESMTPSA id ev2sm818889pbb.37.2015.09.07.14.15.57
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Sep 2015 14:15:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441654609.1680.79.camel@pbcl.net>
Date: Mon, 7 Sep 2015 14:15:56 -0700
Message-Id: <EC219B31-F312-41D6-81C9-D13213CB2759@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
	<a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
	<1441654609.1680.79.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] rootfs: Do not uninstall update-rc.d
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
X-List-Received-Date: Mon, 07 Sep 2015 21:16:03 -0000
X-Groupsio-MsgNum: 70772
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9C4504E0-DE0C-49DB-B31F-A6474065BFEA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9C4504E0-DE0C-49DB-B31F-A6474065BFEA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 7, 2015, at 12:36 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
>> update-rc.d is now needed by systemd to interact with sysv
>> scripts, so if we have a mixed system, then we can not uninstall
>> update-rc.d as it is going to break systemd functionality
>=20
> The description above implies that you will only uninstall update-rc.d
> if systemd is present, but that doesn't seem to be what the patch =
does.

I meant to not say its only for systemd. but that systemd now needs it.
so update-rc.d is no longer forcefully removed from image depchain.

>=20
> Also, if the rootfs is read-only then you might as well go ahead and
> uninstall it irrespective of systemd because it isn't going to work.  =
If
> systemd will fail catastrophically in this situation then I guess it
> should be an error to have both systemd and sysv scripts in a =
read-only
> filesystem.

That is valid problem, but its not changing that behavior. Code needs to =
be
added to check for ro-rootfs check and then uninstall it. In ro-rootfs =
case this
disable/enable of script might still be needed and useful since there =
might overlayfs in use


>=20
> p.
>=20
>=20


--Apple-Mail=_9C4504E0-DE0C-49DB-B31F-A6474065BFEA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXt/owACgkQuwUzVZGdMxRnQQCfSGIH27jc1/hfPGHxr6j/23UA
4m4AnjEYpGrh1zUTmveLO5CfTK7BVZKS
=W1uw
-----END PGP SIGNATURE-----

--Apple-Mail=_9C4504E0-DE0C-49DB-B31F-A6474065BFEA--
