Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 56B9660017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 18:49:45 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id q63so47694676pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ptKno+TQGmoJMVe7T+KZ1kiCAN5coSk9ZVJ//y5vFHA=;
	b=0kaihYfKDwwAx0wHB0ss7Xd361tuz/uRAwj5zvU/Q9yjg3601+CLOeJBPxvglgfKi0
	9leYBINDIzwgqt68R+wHsQvr6CRF6ze1JEhqpoWshbc9gARLdF+mewkomt8UIEZdQk0/
	kooeQc8mwCzYUWqeVw+a5jMYM13PWws++DDRV0LlO2cihq4Wt8Aw+BMXVQxusVHL9RqY
	1+c/oRET4d17FcK81EqEjvjd9OAMysX7GQjLRUDmqfLpITpnnLGKpjwsxcKV0cKIuIDh
	h7RgXxI9vz0JXhyFlp0oZNHYiKsd8qXAQyHF8aYNzo/p/xWfKwnq43fIQnLo0eJIz9Yf
	l6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=ptKno+TQGmoJMVe7T+KZ1kiCAN5coSk9ZVJ//y5vFHA=;
	b=i/boptpJPR/UAP/oWmWs0UHokwV8YceHz3ClXUddw0uF42DVNDDZS5p5D0gmokqyBv
	yGYYK+nUwL0L9vEnA5iCnV9RYcCLCWjMjcvE7EWRDS/jU2tAz6DAV01weXM89ZH989Z3
	tgQWxFMWer4QdoqstuQzu7ikUYPOq3buKJYG8CeGD2kOh6pqTwo0vwdWoxdoOaMl0Kkh
	mA0KUnfXnUmpUHzAE9ZqR37x5H2bMgwDOlSxMVu2x1S/cP69K8cLLtQ3G40qXkMhYva9
	n9XmlFCm33HySHe8ux+nQcvf4T6104C8fhuMFcO+8AklyHgOyGA2W64xIbWyM4j5QRvH
	McCA==
X-Gm-Message-State: AG10YOTkcSgnutPwXb84nHfxNr/l+U3oI0c/h4gPTEwBN//mxQVUqwpV4UCh/+JXcbBzIg==
X-Received: by 10.98.16.27 with SMTP id y27mr6701556pfi.33.1453488586199;
	Fri, 22 Jan 2016 10:49:46 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:45dc:9958:3c4b:e7c7?
	([2601:646:8802:5d5c:45dc:9958:3c4b:e7c7])
	by smtp.gmail.com with ESMTPSA id
	o67sm11323806pfa.58.2016.01.22.10.49.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jan 2016 10:49:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
X-Priority: 3 (Normal)
In-Reply-To: <61461.10.252.10.201.1453489831.squirrel@linux.intel.com>
Date: Fri, 22 Jan 2016 10:49:44 -0800
Message-Id: <855A5CD7-3AD7-45F7-972F-E25D5F23EEA0@gmail.com>
References: <56A22767.7050000@linux.intel.com>
	<56A24CE8.8010501@opendreambox.org>
	<CAJTo0LaAY=Bru-JzaNMQe5KNuAH3+A0VW_mQ6sNy4GvDU7nk6w@mail.gmail.com>
	<56A26F89.8080505@opendreambox.org>
	<61461.10.252.10.201.1453489831.squirrel@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Fri, 22 Jan 2016 18:49:45 -0000
X-Groupsio-MsgNum: 76718
Content-Type: multipart/signed;
	boundary="Apple-Mail=_37B36373-D96E-4F28-B23A-0DFF9FEF4598";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_37B36373-D96E-4F28-B23A-0DFF9FEF4598
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 22, 2016, at 11:10 AM, alexander.kanavin@linux.intel.com wrote:
>=20
>>> I guess the thing missing is an indication that the repo on github =
is
>>> official and maintained.  Specifically the deniskropp repo has been
>>> recently touched but you have to admit
>>> that https://github.com/DirectFB/directfb looks more official.
>>=20
>> Denis Oliver Kropp is the main developer of DirectFB and the =
description
>> of https://github.com/deniskropp/DirectFB says "Official DirectFB =
GitHub
>> Repository".
>=20
> Why did he make a new account on github then? Commits to the old =
directfb
> repo were done from a different account (https://github.com/dfbdok). =
Also,
> there has been no activity whatsoever since October, and no =
announcement
> anywhere, and no response to my request or the other open issue in =
that
> repo. I wouldn't trust that directfb is still alive; we need to wait =
and
> see.
>=20
> To me, it looks likely that the funding was cut, Denis Kropp has tried =
to
> keep the project alive but then just abandoned it.

Lets just wait and point our recipes to new github repo,
There are users of directfb in OE,moreover October 2015 wasn=E2=80=99t =
long
ago. Its too early to consider it dead.

>=20
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_37B36373-D96E-4F28-B23A-0DFF9FEF4598
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaiecgACgkQuwUzVZGdMxRaPgCeMo3/cpXHdH0D/HWycstTzRde
CykAnjdWwImFMl5LVqnG8GqrMdAMgi7K
=2VHr
-----END PGP SIGNATURE-----

--Apple-Mail=_37B36373-D96E-4F28-B23A-0DFF9FEF4598--
