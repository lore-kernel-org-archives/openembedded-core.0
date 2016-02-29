Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3719177026
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:13:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n186so9236998wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 02:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=WgS4iodx4qXysk/GM2QfF4bwrzgyu8kIAddvrbqMCaE=;
	b=AEhgfaM1eKOOra1aFnlejxeO3jnIwlW7Dt/QdioBrNph+qyj5Zpmjq5IZh2pzbFdCZ
	P3m46d22TYW6v9PK8EfnlnPsfnJfwhSXmuFhq9v/w1IVltig8HoIbfO3rAwhseUXMZ8v
	NZ6mKtnqkC8Y5zKi9/+wXiIS4FwG33zbSRwWBz4taZM67SZpDPRYU7dKldw2dn3JXm8t
	84BV+kKwVVv8II3wInMK/QsmCWKZ0HrxZgDWgbYz18afg0Rx2gO35IVBnVaplpcFgiQj
	+yFKj2vm+fbzA6csuGto334RUzorZ4HlHgePxLag97LQaVE5AsomkMIy7jFoIPv+eDc8
	xk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=WgS4iodx4qXysk/GM2QfF4bwrzgyu8kIAddvrbqMCaE=;
	b=SlkCe1RJ/QuSE82fQGhtacY/9uOd5OVwOysnLfbTopf+qEksxkdwNoVPN4VICotTlT
	un9p8t7aynnTk881H7QVYvBGqcvF3Z/1kjQce9hjBraM07X8scD8wua7dcMCZXquU0+0
	TTA58bi7RCKPjjMiq6waM+UCXKxjlU7VZz1RbcqyIldFOdcXXglnyL+VIwAZNeTlVlZe
	gclzNrcJo1zAsa5ynvvwvflPUZ6+72EWjgsEbpGbsSDBU4x9lbm3ARftQxKmnUpX1GbZ
	VMZfJ735sTLChbC/4v8R98P+AfS1t39BK+BFNNz9Y0/HbQpmjPqM8UdJAeIXWYvE0PlY
	c/xQ==
X-Gm-Message-State: AD7BkJLurkBD6P7Q/n7FAfljbo6RKaWWkLjDl6oyqhBcLbEncS/y4PfWV1QWkbwiYuS97A==
X-Received: by 10.28.188.138 with SMTP id m132mr10893071wmf.29.1456740810067; 
	Mon, 29 Feb 2016 02:13:30 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	et11sm25137985wjc.30.2016.02.29.02.13.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 02:13:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0LbmQi76WuT7A7hmmJfPFGmsQDgK2_yNiX72Ap=YQcTvPw@mail.gmail.com>
Date: Mon, 29 Feb 2016 11:13:27 +0100
Message-Id: <D8CD8A4C-FD2D-4B1B-8094-EBFB7615AD5A@gmail.com>
References: <898F5FB0-0062-4647-8A7A-1DE402384A75@gmail.com>
	<CAJTo0LYt_SVFavOCtZmdcXcgZBarR+RMArwA_MJn7Amiy4iZuw@mail.gmail.com>
	<062AD77D-2CDB-4D36-89AA-7F8072A8283A@gmail.com>
	<CAJTo0LbmQi76WuT7A7hmmJfPFGmsQDgK2_yNiX72Ap=YQcTvPw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] avahi: make dbus optional but default
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
X-List-Received-Date: Mon, 29 Feb 2016 10:13:31 -0000
X-Groupsio-MsgNum: 78872
Content-Type: multipart/signed;
	boundary="Apple-Mail=_184BF77B-F2E5-45ED-A0ED-00E165B9B0E4";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_184BF77B-F2E5-45ED-A0ED-00E165B9B0E4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 29.02.2016 um 11:06 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 29 February 2016 at 08:00, Jens Rehsack <rehsack@gmail.com> wrote:
> Especially that one fails when no dbus support is added. So, nope - it =
should not always executed.
>=20
> Just testing the existance with shell logic is more bulletproof.

So you suggest to do "test -d ${D}${datadir}/dbus-1 && rmdir =
--ignore-fail-on-non-empty ${D}${datadir}/dbus-1" instead of running it =
conditionally when dbus support is enabled?

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_184BF77B-F2E5-45ED-A0ED-00E165B9B0E4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW1BnIAAoJEESZlq7c5QqdWfIP/292llZ3r6W5RuhBaAnW8ik7
uiMyP5ajQ3Tod1k5QSb5+9YlKKelVoflpY7aP3NQ742iNPy1E+ofog6FfjEyZKUP
R9qTJNwHdfL8xDjfB3y8YHYBaaxxuSSPD3SiNhjBIu9frCxhMxMaOLzNeFrgnMqV
Uq1IV1Q+b+P17cPJvRgxAh+0zCTA80n4cepPOAuE4dLvtxuSqlZakh8dC1lttQOJ
vZJlOKUNvhpzyJXwGMJ2Fmy0ZqWu5pT1QMKgBMFVxK3TIQTYSgSuxoEXnpwAU4GS
1nPaI2stzs174egEkNRvjSzYL+3pC2MxKnscvQvqtylwi00ck7qh84ituURoZGht
S9R16+KGAcbYvg2xqRH02ObYIDlIRW6NNJQtsrbnOa9DlvXLweZEu5hCU+Om5itj
NznKbGeOQgfmnEi7vg7P1nmZz1GUvQyH+pWS/5Wq1najkJVTq5CQPxwNYBpiWt2H
MJaQbSh/CGh37VENscmql5w+OBasrGrgYYTkPwjoJJgHajstuvzMgdUXADgvJVlU
Ousu7yAdyA/nGE/7eS1ai6cXxzR6NNSgCLHO8GwRLf4aEJF4+W5Drf+3kc6tD/F1
2n8cOnFzIqNBweDvfQuwxY+WJIOekGSbMEKh4EisoQcCqfFVaZsuVRJWuZJHLuuf
Emp/fR1PdGfkDE4BSA3/
=g2eR
-----END PGP SIGNATURE-----

--Apple-Mail=_184BF77B-F2E5-45ED-A0ED-00E165B9B0E4--
