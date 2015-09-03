Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 544A477027
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:46:15 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so2508703pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6cHtuHHxeM/Ekj3mNQ5t9Frjjmum/s368Yp2N7wFOAg=;
	b=PC4+UGzNqBCTl/4rI+z2Hmie4WzJeLSKdxz0+/qlvyjfpIktav68Ps6Wouzrt6kg+B
	P4l3HuKPbGmBT2nuJIwcktpXh586Ugt+MXUj7EvsNs93W3MFavfJ+11Rr+Y/yI1g7HJv
	kUdYWfxaSSPXeCYrFtRBKkoIMewiNKuyQS12b6Nl8MhHtU86Pp5Xa6N8m5F1UHJA94Sj
	dk6aox1MP7QnBFIQK3VvppdPvxVRVuCHHbfGnj6NUcrxqRciYIPibmRga1Le4NxxJneY
	O2Xe21OlU9KyAT8JKFRgWNuJXi0htTx/eec5Yx6tfHUZr7f3D88u3xITWTWMLY+FvF4W
	nA3A==
X-Received: by 10.66.142.166 with SMTP id rx6mr211796pab.25.1441316775753;
	Thu, 03 Sep 2015 14:46:15 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:5d8c:8e6c:621a:cbb3?
	([2601:646:8601:4580:5d8c:8e6c:621a:cbb3])
	by smtp.gmail.com with ESMTPSA id v5sm88071pdo.87.2015.09.03.14.46.14
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Sep 2015 14:46:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441315717.1680.75.camel@pbcl.net>
Date: Thu, 3 Sep 2015 14:46:06 -0700
Message-Id: <DA2C1CDC-38FA-4EDC-8625-DDF06F45E804@gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
	<1441315717.1680.75.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 21:46:19 -0000
X-Groupsio-MsgNum: 70619
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2E9E6634-F88A-40A9-9EC3-5A61F18B30CE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2E9E6634-F88A-40A9-9EC3-5A61F18B30CE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 3, 2015, at 2:28 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
>> irrespective of this change. I see yet another configuration with =
this
>> into OE-core, overall OE-Core should get smaller
>> and case does not sound convincing to me. You dont want to use =
busybox
>> in a fairly large image which has other GPLv2 software in
>> it. Thats fine but doesnt look like a common usecase to me
>=20
> In general, I don't think it is a good idea for oe-core to be entirely
> beholden to busybox or any other package, and I would be all in favour
> of including an alternative implementation for everything that we =
depend
> on busybox for.

thats a fine idea,

>=20
> In the specific case of ifupdown, the whole thing seems a little bit
> 1990s and it's hard to avoid the sense that there are better ways to
> solve that particular problem nowadays.  But oe-core does already
> include net-tools, which is if anything even more retro (and is in a
> similar position vis-a-vis busybox) so there is precedent for =
including
> this kind of thing.

Yes although replacing net-tools with iproute2 would have been a better =
one.

>=20
> It's also not as if ifupdown is a large piece of software with a =
complex
> web of ABI dependencies that will introduce some huge maintenance =
burden
> in the future.  So I can't see any real downside to adding it to
> oe-core.

It needs maintenance, and if maintainers are fine carrying it
is fine too. Added price is future contributions to other areas/packages
which have to keep working with this, and there will be patches rejected =
because
they don=E2=80=99t work with this so there is some burden dispersed on =
development community

>=20
> p.
>=20
>=20


--Apple-Mail=_2E9E6634-F88A-40A9-9EC3-5A61F18B30CE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXov6UACgkQuwUzVZGdMxQZpgCgkeZeTH+Z01TsPLtgAUqNSXMM
GuQAn1eMKDYiAZDWX1dWU7yUxQP+gQ99
=67KS
-----END PGP SIGNATURE-----

--Apple-Mail=_2E9E6634-F88A-40A9-9EC3-5A61F18B30CE--
