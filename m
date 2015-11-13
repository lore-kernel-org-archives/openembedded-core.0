Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAA3772D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 21:50:44 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so111981695pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=cqwq/kLlqyLzXKmMeNah0EHjxeAIvM3OGeHE0fT7kyE=;
	b=pcBGLc19cZXtve/QdQ7heU0BleoxMn0sMMHJEUyK2UGrexwqwfbBLxojqERTdEPqL5
	Nr8avpGSBPkqiYB2dywTrwbS3HId0BIVlqrNpacvvycUcLTVq8DnjyJtFA+Y60zc+H4O
	TvQa3uqYu1D2//22waxjV7N6/2xxov/yPKnq95uMRz5K9IP8WsZ1mI53IrgjruHXtkrk
	Ysq4hCrvqj5XnBnMxahrr3ZJWo7cj9KyXf8L5zddjS+c8SxAb0EuvI6yX2cgTz4plIE0
	HHajdS3oUP4KXlFRkIsZf4Zh1ZihKd5K2CKw+wnp1rFL4a07BlLwRzEocKfc/ozrbbjD
	Adyg==
X-Received: by 10.68.217.2 with SMTP id ou2mr34751989pbc.81.1447451444697;
	Fri, 13 Nov 2015 13:50:44 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:75e8:34a4:b27c:d575?
	([2601:646:8802:5d5c:75e8:34a4:b27c:d575])
	by smtp.gmail.com with ESMTPSA id
	rs5sm21654039pbb.61.2015.11.13.13.50.43
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 13:50:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3111\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <564659EF.8070606@yoctoproject.org>
Date: Fri, 13 Nov 2015 13:50:38 -0800
Message-Id: <447B01D9-C528-4B24-9B45-812CA1C6685D@gmail.com>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
	<DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
	<564659EF.8070606@yoctoproject.org>
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
X-List-Received-Date: Fri, 13 Nov 2015 21:50:47 -0000
X-Groupsio-MsgNum: 73429
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7C300EBB-64D0-462C-9623-0BF4B07B207D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7C300EBB-64D0-462C-9623-0BF4B07B207D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Nov 13, 2015, at 1:45 PM, Michael Halstead =
<michael@yoctoproject.org> wrote:
>=20
> Bitbake is disabled with the note:
>=20
> # interferes with patchwork sice it sends emails after the patches are
> closed
> # we could re-enable it if the mails went to someother ml may be
> bitbake-commits
>=20
> This happens because it was mailing =
bitbake-devel@lists.openembedded.org
>=20
> We can mail openembedded-commits@lists.openembedded.org which would =
work
> fine. Or I can create a bitbake-commits@lists.openembedded.org. Which =
is
> better?

I think mailing to openembedded-commits@lists.openembedded.org might be =
ok. with [bitbake] in message subject for filtering help.

>=20
> Michael Halstead
> Yocto Project / SysAdmin
>=20
> On 11/13/2015 01:41 PM, Khem Raj wrote:
>>> On Nov 13, 2015, at 1:39 PM, Michael Halstead =
<michael@yoctoproject.org> wrote:
>>>=20
>>> It seems git-notify was sending mail as "cia@cia.navi.cx" and that =
was
>>> causing the mail server to get added to blacklists so it was =
disabled.
>>> I've changed the script and re-enabled it for:
>>>=20
>>> openembedded-core
>>> meta-openembedded
>>> OpenEmbedded (but I don't know if we need it)
>> bitbake too plz.
>>=20
>>> Michael Halstead
>>> Yocto Project / SysAdmin
>>>=20
>>> On 11/13/2015 12:47 PM, Khem Raj wrote:
>>>>> On Nov 13, 2015, at 3:59 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>>>>=20
>>>>> On Thu, Nov 12, 2015 at 06:14:14PM -0500, Trevor Woerner wrote:
>>>>>> It seems I missed some announcement. At first I thought I had =
been
>>>>>> unsubscribed from the openembedded-commits mailing list (since I =
haven't
>>>>>> received any emails on that list since about the end of =
September). So I
>>>>>> looked up =
http://lists.openembedded.org/pipermail/openembedded-commits/
>>>>>> and it seems to have gone quiet about that time too.
>>>>> I've already asked Paul and Michael few times on IRC in last few =
weeks.
>>>>>=20
>>>>> I haven't received any reply from Michael, adding him to To, now.
>>>> I see that git-notify hooks have been disabled explicitly for all =
repos in update.secondary file. thats why the messages are not being
>>>> sent. We can enable them but I would like to know the reason they =
were disabled in first place. Since we do not have this under some
>>>> sort of revision history, I can not find information for them as =
well. So we need this info before we enable them back.
>>>>=20
>>>>>> I liked being able to watch the commits to see what was going in, =
and to
>>>>>> check if my patches were added (before sending "ping"s, without =
having
>>>>>> to "git pull" and search). Is there a new workflow for seeing =
what's
>>>>>> going in?
>>>>> Yes, I find them useful too (e.g. to report issue with commit =
which was
>>>>> recently merged) or in general to know that it's worth doing "git =
pull".
>>>>>=20
>>>>> --
>>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>=20
>=20
>=20


--Apple-Mail=_7C300EBB-64D0-462C-9623-0BF4B07B207D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZGWzgACgkQuwUzVZGdMxSaGgCgjO8qAQnnjySpir8rRdyuJZxd
5T0Ani6plxlYENTd3/Sy38/Qn56XyrT2
=2I77
-----END PGP SIGNATURE-----

--Apple-Mail=_7C300EBB-64D0-462C-9623-0BF4B07B207D--
