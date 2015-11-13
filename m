Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 08AFC77300
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 21:41:24 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so111383693pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=OcyuAeXsHV5vK3LeBv8HGAg27y86uGg3REV7CI3zXf8=;
	b=reFY1QlxltezXNS88h/Vjc3XkW/wj9kX708QZNKUo4R/jzksOoaKMByTdrKOW5oe65
	rxiQpHWpDr//beCP1y3NXrqT8EzY8hghUDwJBKulRbEh7rdPRALFjhwvhFIGDfMpNVg4
	zDC8NQhotQeaQv0SlhTn0KoTwsvL7Gy+wrPgBHXCwmkgsjsFkqaJ2ZckDIXQqUJ2VAtD
	z8Rrvjy83I7vwr+DK94zk+XlbHRnY+zNIFong9Md9PEHMdchJwuOoREsDVkUhVAtAuXd
	hB5MLRRYuoR2AsSa+nYQ+mspG2E9HjY3EBoX+s4kKg3Zdm82NMamZOZRVvcTUV1zkI+H
	qeAQ==
X-Received: by 10.66.251.39 with SMTP id zh7mr35828445pac.6.1447450884892;
	Fri, 13 Nov 2015 13:41:24 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:75e8:34a4:b27c:d575?
	([2601:646:8802:5d5c:75e8:34a4:b27c:d575])
	by smtp.gmail.com with ESMTPSA id
	kj3sm22173965pbc.59.2015.11.13.13.41.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 13:41:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3111\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <564658A0.60609@yoctoproject.org>
Date: Fri, 13 Nov 2015 13:41:25 -0800
Message-Id: <DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
To: Michael Halstead <michael@yoctoproject.org>
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
X-List-Received-Date: Fri, 13 Nov 2015 21:41:25 -0000
X-Groupsio-MsgNum: 73427
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EC8F3DBE-CCF2-4820-8262-50AB2FB61B8E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EC8F3DBE-CCF2-4820-8262-50AB2FB61B8E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Nov 13, 2015, at 1:39 PM, Michael Halstead =
<michael@yoctoproject.org> wrote:
>=20
> It seems git-notify was sending mail as "cia@cia.navi.cx" and that was
> causing the mail server to get added to blacklists so it was disabled.
> I've changed the script and re-enabled it for:
>=20
> openembedded-core
> meta-openembedded
> OpenEmbedded (but I don't know if we need it)

bitbake too plz.

>=20
> Michael Halstead
> Yocto Project / SysAdmin
>=20
> On 11/13/2015 12:47 PM, Khem Raj wrote:
>>> On Nov 13, 2015, at 3:59 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>>=20
>>> On Thu, Nov 12, 2015 at 06:14:14PM -0500, Trevor Woerner wrote:
>>>> It seems I missed some announcement. At first I thought I had been
>>>> unsubscribed from the openembedded-commits mailing list (since I =
haven't
>>>> received any emails on that list since about the end of September). =
So I
>>>> looked up =
http://lists.openembedded.org/pipermail/openembedded-commits/
>>>> and it seems to have gone quiet about that time too.
>>> I've already asked Paul and Michael few times on IRC in last few =
weeks.
>>>=20
>>> I haven't received any reply from Michael, adding him to To, now.
>>=20
>> I see that git-notify hooks have been disabled explicitly for all =
repos in update.secondary file. thats why the messages are not being
>> sent. We can enable them but I would like to know the reason they =
were disabled in first place. Since we do not have this under some
>> sort of revision history, I can not find information for them as =
well. So we need this info before we enable them back.
>>=20
>>>> I liked being able to watch the commits to see what was going in, =
and to
>>>> check if my patches were added (before sending "ping"s, without =
having
>>>> to "git pull" and search). Is there a new workflow for seeing =
what's
>>>> going in?
>>> Yes, I find them useful too (e.g. to report issue with commit which =
was
>>> recently merged) or in general to know that it's worth doing "git =
pull".
>>>=20
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20


--Apple-Mail=_EC8F3DBE-CCF2-4820-8262-50AB2FB61B8E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZGWQgACgkQuwUzVZGdMxRJNgCffNZONsQ0aU6IRz3PN5SmN7UG
M2sAn3jue9nd4rjpeDLzZ3XNOMEOENtI
=Br11
-----END PGP SIGNATURE-----

--Apple-Mail=_EC8F3DBE-CCF2-4820-8262-50AB2FB61B8E--
