Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 02E666067D
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 21:39:16 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so2064333pfg.2
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=QsquqtHJa5VQ3tluORH3HykddsYC+eQIXLscS+a9z1o=;
	b=BXW62guLKuuk+BixhlA1e7IvOS75A1keXgxoRZOsxcPX4uCbUfMItk74YWWX/M03LW
	265HozdKTtw3Bbrwwnw9/QXyE1aR0HuFuNwxNCQ5CNkZaI4hyZxtEWK8+fF8+NQQHLVV
	xKjPlNgsMPFBgxY3Jp+wQ5iKsdIpoNI63sxF1Eg/BrQvRYu9La8H2UHhCWpZg2yQDrBs
	JDSccN9JbHrx3zH8hKOuG/N9MokOBwUE5bjpf4TlQ8TpEP7FR2yP7hjuE2og5lvjxtuy
	qTVm5c7wlubnTbdaKPQ8iSsO461Qu84HTgsSPpAqrQGnMkSLn/UwvQwjCyJKEmU75FXl
	1wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QsquqtHJa5VQ3tluORH3HykddsYC+eQIXLscS+a9z1o=;
	b=C9aSkKwXIZXao/HRw9AepeWM2Jwg7CjyU8B7SoYBlLAo5+kgkeUrPImPAFFf1WllOv
	7c0SEaH8gjJxic746gMDP+6eX/9sgNcscEdGTaorvCFhw6RL2yQOgX0+E60p2XSxKcHd
	fUOAs2bnAy+Tg/BtZHk2NyQ0Mpcew6NadOeH4l4qSLsuZHQyfvec1TxaYfmIHgIrYYpn
	AdH0l4UX04OukVzZDw5Rkq+30yHy8yXRf86Qm6bKpdeMfj8xITvu0MoPeqW+1szzcvjP
	ImPckqcZ6OFOsxC9eEqI+MaJ+do7AQGCapPP226mpqlf8kPXwym1bEtcNGxn8qZ5ykN+
	1Kug==
X-Gm-Message-State: ALyK8tJAERgBbz29DJGUmhk3KHT64UwLfvwIIfcfoUrVD9iPaqtJethxygzZu6mfRwtsCA==
X-Received: by 10.98.7.200 with SMTP id 69mr6410090pfh.33.1468964357345;
	Tue, 19 Jul 2016 14:39:17 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:7175:eb57:3b53:9c48?
	([2601:646:8882:b8c:7175:eb57:3b53:9c48])
	by smtp.gmail.com with ESMTPSA id
	m128sm7542494pfm.42.2016.07.19.14.39.16
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jul 2016 14:39:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <578E10E8.9070003@mender.io>
Date: Tue, 19 Jul 2016 14:39:15 -0700
Message-Id: <CF96AE35-E069-4240-B2A6-D77EE3EF0919@gmail.com>
References: <578E10E8.9070003@mender.io>
To: Kristian Amlie <kristian.amlie@mender.io>
X-Mailer: Apple Mail (2.3124)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: Patch: Krogoth systemd network service fails to start on boot
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
X-List-Received-Date: Tue, 19 Jul 2016 21:39:17 -0000
X-Groupsio-MsgNum: 84696
Content-Type: multipart/signed;
	boundary="Apple-Mail=_451788B0-A769-4EE7-9F84-C3623CFEC6E2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_451788B0-A769-4EE7-9F84-C3623CFEC6E2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

thats fine. Post the patches using git-format patch and have [krogoth] =
in the subject header

> On Jul 19, 2016, at 4:37 AM, Kristian Amlie <kristian.amlie@mender.io> =
wrote:
>=20
> Hey,
>=20
> on our krogoth build the systemd network service does not start, and =
it
> seems to be because of missing users, which has already been fixed on
> master. I've cherry-picked the two patches that fixed the problem for
> us. Note that they are not written by me, but by other people on this
> list. I hope they can be applied to krogoth.
>=20
> Regards
> Kristian Amlie
> =
<0001-systemd-Create-missing-sysusers-offline.patch><0002-systemd-allow-ad=
d-users-as-a-rootfs-postprocess-cmd.patch>--
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_451788B0-A769-4EE7-9F84-C3623CFEC6E2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleOngQACgkQuwUzVZGdMxTrJACfVwMcbPqKq/TKXmoa9bbBaHwa
eM4An1RAi70SdiWRjYDhnu/b/m6hebT8
=plin
-----END PGP SIGNATURE-----

--Apple-Mail=_451788B0-A769-4EE7-9F84-C3623CFEC6E2--
