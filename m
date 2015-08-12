Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7C3766B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 01:48:52 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so1474769pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 18:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=/ULRdbIlAyOIQ9yHC16qHAlBO9t+JSQIckuiOBq6ecQ=;
	b=jGgjmB4JUg80yxtQiABMQyQrARY1xTBR4V88R7BXYbnga1/jsWkW0rPATB4MZ/bNo1
	kQZhBBDzwV+Mvi0Ktbu4zawIcWQGEyS02EYZ7THN52ep77vhOiikiQnH4EaDB8kL6x9d
	6sg6Iz5bvOZB7NsKQUPU74S10fMm7JIne2CiV8lbt4mX49lzum+rRWXV7kQOvZm7274y
	34yNg0kt1G8I77dKdo9TxWPG6lIdy0MuOweJQrtFyXtH2TpqRIw2JoKI+HmEoMOhZiW3
	yFYrxhWfl9Pivx5NKAS+ETWFCd0ZxWSbn0OlQWhAql62ozKNTYhq//Nsy/nx2bnyP/pP
	EJ2Q==
X-Received: by 10.70.140.238 with SMTP id rj14mr63158226pdb.38.1439344132807; 
	Tue, 11 Aug 2015 18:48:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:157:79f9:ef5c:d3d0?
	([2601:646:8601:4580:157:79f9:ef5c:d3d0])
	by smtp.gmail.com with ESMTPSA id
	fc3sm4245103pab.16.2015.08.11.18.48.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Aug 2015 18:48:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKpJbDehW=UJ1=DgO8404v7XurYEPAFAOt0NzqVhwwPR5g@mail.gmail.com>
Date: Tue, 11 Aug 2015 18:48:50 -0700
Message-Id: <579D5BAF-474D-45EF-AAA1-46179C640689@gmail.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
	<bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
	<CAJTo0LZPwjPuxgnnjvAyqhBWoK8JWJdMOO2G6MGGgj1An6FxUg@mail.gmail.com>
	<CAJ86T=X3H8irDHCkohwFCdqou_-BuZLqHz7CYiAA9dqD5LruDw@mail.gmail.com>
	<CAJTo0La5e49wG7u4FquPpmRz-dBP4o4yH1kb3B_K0R4VaEFdNQ@mail.gmail.com>
	<CAP9ODKpJbDehW=UJ1=DgO8404v7XurYEPAFAOt0NzqVhwwPR5g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] screen: Add version 4.3.1
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
X-List-Received-Date: Wed, 12 Aug 2015 01:48:53 -0000
X-Groupsio-MsgNum: 69324
Content-Type: multipart/signed;
	boundary="Apple-Mail=_914AC0B2-F1E6-4A29-BD1A-B7D4CB83D0AE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_914AC0B2-F1E6-4A29-BD1A-B7D4CB83D0AE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 11, 2015, at 1:37 PM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Tue, Aug 11, 2015 at 5:28 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>>=20
>> On 11 August 2015 at 20:54, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>>> Is screen considered sufficiently core that we should maintain both
>>>> GPLv2
>>>> and v3 recipes?  I'm not convinced it is.
>>>=20
>>> Is it sufficiently "core" to be in oe-core at all?
>>>=20
>>> Or maybe it's time to replace screen with tmux?
>>=20
>>=20
>> screen or tmux is a separate debate, but I believe that something =
like this
>> is good for oe-core as it's so useful when all you have is a serial =
line to
>> your board.
>>=20
>> I don't believe that's enough to keep two versions of screen in =
oe-core
>> though.
>=20
> I vote it to go for meta-oe. If it was core, it would have been sent
> long time ago so lets add it for meta-oe and see how many people will
> ask for it to be promted.

yes this seems sensible to me.

--Apple-Mail=_914AC0B2-F1E6-4A29-BD1A-B7D4CB83D0AE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXKpgMACgkQuwUzVZGdMxTG3ACeJULybNH5uwq9XDD2H8RMiJE2
RO0AnR0gFFiuANSL5hUhWV8pDj9+Whzm
=oua+
-----END PGP SIGNATURE-----

--Apple-Mail=_914AC0B2-F1E6-4A29-BD1A-B7D4CB83D0AE--
