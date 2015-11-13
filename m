Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE337734D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 20:47:21 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so3645133pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7bRrMWEozxqBg4bfOnoO/4QAIoLndJBKx0oMDQXC844=;
	b=KSLCJDDiXcEcYm9ovOx4e1qzXKBdUaOFgxvG7K6SqyqRRkPtvzSO4nJL4bKE8xK5XF
	+POLdczXov/SJdR1QxLPP/ce+rhGzpZqFeNj+AhknMJi3iz22EpyZeYHzL9YyvkBXnFH
	8K/hphHalPWLTeAznqfm8fQ9ZePS2BJ1tCNhwL6kbjULDSzZDGAF26QsasqM4A6lU5So
	jX/pg7INMgIhVWvsVsuUk8UQJXXevudplRfm4++22WIinBrWFSFeG4yFqA5+az0FtQT1
	1KpTr0gEBp9qU7TCXyKBviIo+y+ymw7v3loJRJ4pSVGhGWqHT6xpjxtcjKYKLuWS7DFx
	J9RA==
X-Received: by 10.66.155.74 with SMTP id vu10mr2838933pab.80.1447447642252;
	Fri, 13 Nov 2015 12:47:22 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:75e8:34a4:b27c:d575?
	([2601:646:8802:5d5c:75e8:34a4:b27c:d575])
	by smtp.gmail.com with ESMTPSA id
	sg4sm22143290pac.48.2015.11.13.12.47.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Nov 2015 12:47:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3111\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20151113115958.GD2567@jama>
Date: Fri, 13 Nov 2015 12:47:17 -0800
Message-Id: <056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3111)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
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
X-List-Received-Date: Fri, 13 Nov 2015 20:47:22 -0000
X-Groupsio-MsgNum: 73424
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9681E97D-644B-40C3-8174-BF56B5914CB7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9681E97D-644B-40C3-8174-BF56B5914CB7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 13, 2015, at 3:59 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Thu, Nov 12, 2015 at 06:14:14PM -0500, Trevor Woerner wrote:
>> It seems I missed some announcement. At first I thought I had been
>> unsubscribed from the openembedded-commits mailing list (since I =
haven't
>> received any emails on that list since about the end of September). =
So I
>> looked up =
http://lists.openembedded.org/pipermail/openembedded-commits/
>> and it seems to have gone quiet about that time too.
>=20
> I've already asked Paul and Michael few times on IRC in last few =
weeks.
>=20
> I haven't received any reply from Michael, adding him to To, now.


I see that git-notify hooks have been disabled explicitly for all repos =
in update.secondary file. thats why the messages are not being
sent. We can enable them but I would like to know the reason they were =
disabled in first place. Since we do not have this under some
sort of revision history, I can not find information for them as well. =
So we need this info before we enable them back.

>=20
>> I liked being able to watch the commits to see what was going in, and =
to
>> check if my patches were added (before sending "ping"s, without =
having
>> to "git pull" and search). Is there a new workflow for seeing what's
>> going in?
>=20
> Yes, I find them useful too (e.g. to report issue with commit which =
was
> recently merged) or in general to know that it's worth doing "git =
pull".
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9681E97D-644B-40C3-8174-BF56B5914CB7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZGTF0ACgkQuwUzVZGdMxQh7QCfcGRgHZpMvKMl9nqOrd3PpQTT
l1YAn2ZTbw/PJIv8o3kDouNlvRgmQMe7
=5j+q
-----END PGP SIGNATURE-----

--Apple-Mail=_9681E97D-644B-40C3-8174-BF56B5914CB7--
