Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8926EDF9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:42:31 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ma3so9389694pbc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 23:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JrWm03jRW+FJe8KRnxTvfkqZEtBnxYR6dgf+UpjI5D0=;
	b=ykXQznd4L0NcJSXPvaFMB629Zm1Le/cmvp6ZHD52HrnFyXlwuNsN2LwBe+x+qTWMdJ
	AAtjKEDePVKnTijN8gfHvu3w/DUtn4Zop/VA9QQGWTidlwKESY4GkJlUdaGs5DM+lWBu
	FgaFkQ50s9MuQ1nEMTDZoEMDB/wYeJ4JOcXHdSN5X3pBzRe0HmSDbXqoMNq4L3GVcihB
	TMJWSRtJLXREg7uzgT17Ive5j+aEsJu/NO2AxNIKSnWqS9BwGt6gGW6BPYLOpsw1jmpB
	XBpstvHjnWYx5FNFbwzeAKDTT7rtaOn0tqSeY54RbynYy65KR9IYN9As4ESiI9dtm+K9
	/UEw==
X-Received: by 10.66.141.231 with SMTP id rr7mr29290725pab.41.1396334552081;
	Mon, 31 Mar 2014 23:42:32 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	el14sm51329071pac.31.2014.03.31.23.42.30 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 23:42:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5339C6FD.1070506@windriver.com>
Date: Mon, 31 Mar 2014 23:42:29 -0700
Message-Id: <A5D0F3B0-A739-4D0D-A9C5-926BBEB9CD35@gmail.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>	<e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>	<CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>	<5339C30B.1060005@windriver.com>
	<CAMKF1srfDpeGkQMnHkK_AFPy6N7pujtLwMRsgbsDeHem82_5nA@mail.gmail.com>
	<5339C6FD.1070506@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1874)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libc-headers: set TC default to 3.14
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
X-List-Received-Date: Tue, 01 Apr 2014 06:42:32 -0000
X-Groupsio-MsgNum: 51983
Content-Type: multipart/signed;
	boundary="Apple-Mail=_56CB5E9C-6582-4009-AD9E-E8D881C47411";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_56CB5E9C-6582-4009-AD9E-E8D881C47411
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Mar 31, 2014, at 12:50 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

>> i dont believe you tested all layer combinations
>=20
> I've tested everything I can, as has the autobuilder. I can't offer
> any more than this.
>=20
>> >
>> >
>> >> at this point. 3.10 being LTS
>> >> I would assume its a better option to keep at 3.10
>> >
>> >
>> > I disagree, this is consistent with other releases and the =
documented
>> > plan of action. I'd rather not have a massive version jump in the =
fall.
>>=20
>> its probably not a bad option to stick to LTS version for kernel =
headers
>> after all
>=20
> Again, I disagree.
>=20
> We can maybe keep the 3.10 recipe around,

Thats ugly too. We decided to stick to one version of headers last time.

> but the default should
> be 3.14, we need a matched kernel and libc-headers to get the best =
integration
> and leveraging of the latest features.
>=20
> If we pull the headers, pull the kernel.

this all is understood, however we have to get better with timings =
especially
changing something like kernel headers whose impact is far reaching then
 just updating kernel proper. =20

--Apple-Mail=_56CB5E9C-6582-4009-AD9E-E8D881C47411
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlM6X9UACgkQuwUzVZGdMxRNPwCfXMMavQ6/VZEDpGZemuxh7BXC
mgIAn32S4mTFxld3Gk6EKo6gRII9/IvQ
=8+92
-----END PGP SIGNATURE-----

--Apple-Mail=_56CB5E9C-6582-4009-AD9E-E8D881C47411--
