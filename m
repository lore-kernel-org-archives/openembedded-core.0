Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3492F607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 23:29:40 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fe3so51741891pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 16:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=KDMYV9ITODxNJOju1ASE7eaPYylrnS65cRBrut4MRoU=;
	b=Vv1HSjihx/+8DWjtwCGl6c21OUntwC6pBf9LycfktX1i0uJV7acqDzy640OqfBOafy
	Cf5APZl7s/sWbcgsx0HmsVTfJx5bmdXorO0ZjIH523ZhJB7z5gk1yw1+qCz9I+4NLQzv
	B73ukwEKfsfginnw8rTX+T5JlCkf+1RLkX3F2gsNrJGHLJtkBFR28fIJKL81S9CqtabH
	mT+o8ApSM9KGEfkXddYXfvcG2BySYFTkJXKU2IDHtGWh5tYkdTKuxy+tV4yetMd8Ea8J
	vtc7VtR3DHGvrCUUdDPNVOQkd4oBposG6IHnsLMmnFPOu24pvCP8+9JA9C/q/WVse+pt
	gwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=KDMYV9ITODxNJOju1ASE7eaPYylrnS65cRBrut4MRoU=;
	b=X5ERYPDTjkO+Oc6KLmuzAX92laFwUtAFA5vuN/M5EW9eiED0Oj1Do4KuhupSpibhXb
	WdA4C/wvqWM+py1NtYVJTTbXhmAeMsQQkQzYKFPv+NfOh+9bTXu3GgxJaSng1fBVsFmi
	c0eEt5LgTyi9lS1T/r9u0iT5chXA6qtYQoy7M8t/3h+vJIYs5pYuri1DMAqYyVGotU6H
	fbdkgTDk1kqcaLi5BQ1Dsi4tEFWG8QlEF7eNcbxOQymB3SPTm3Wp2nbxtUxNnfDYExVa
	CSygHJU/tTC/1xk+U4aa8DNfIrq8O1bjlcd/2Anh+vPkvGFspYiNQM+CTHc3X4sGCBC2
	/47Q==
X-Gm-Message-State: AD7BkJIxkw1Y4MdnQdZlqr/mroGXNfdlfzU981xzneAEg4USxrTbyVgpe6WZV8DDjOWZPQ==
X-Received: by 10.66.192.195 with SMTP id hi3mr17170075pac.149.1459380581574; 
	Wed, 30 Mar 2016 16:29:41 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5948:2b5c:b7c0:30b8?
	([2601:646:8800:5a9a:5948:2b5c:b7c0:30b8])
	by smtp.gmail.com with ESMTPSA id
	fa3sm8370344pab.45.2016.03.30.16.29.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2016 16:29:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1459378408.2322.63.camel@pbcl.net>
Date: Wed, 30 Mar 2016 16:29:32 -0700
Message-Id: <83C93289-2B99-4EC8-A966-4BE4E6F57F23@gmail.com>
References: <1459360607-25880-1-git-send-email-raj.khem@gmail.com>
	<1459378408.2322.63.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] psmisc: Remove including sys/user.h and __WORDSIZE
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
X-List-Received-Date: Wed, 30 Mar 2016 23:29:43 -0000
X-Groupsio-MsgNum: 80323
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F4C1DD5A-8BB3-4581-8183-DF6C8BEADD16";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F4C1DD5A-8BB3-4581-8183-DF6C8BEADD16
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 30, 2016, at 3:53 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Wed, 2016-03-30 at 17:56 +0000, Khem Raj wrote:
>> +Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
>> +
>> +Do not include sys/user.h since it conflicts with
>> +pt_regs struct from kernel APIs in asm/ptrace.h
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> This description (and the subject line of the commit) implies that you
> are removing the include unconditionally.  But actually, you are only
> removing it for non-glibc platforms.

OK.

>=20
> Also, the change itself seems slightly backwards since the ptrace
> manpage suggests that <sys/user.h> is actually the right header to be
> using for these definitions and possibly it's <asm/ptrace.h> that =
should
> be eliminated.  Maybe that's not feasible here but it would be nice if
> the patch header explained why.  And=E2=80=A6

The linux ptrace(2) manpage is written with glibc as the only reference. =
Unfortunately, its not a POSIX API
so there is no standard per se. The motivation for this patch to look =
for a middle ground, between
different libc implementaitons.

musl=E2=80=99s sys/user.h defines elements that conflict with =
asm/ptrace.h especially on ppc, may be musl community
should take a closer look at what can be done since many tracing =
utilities e.g. strace gdb etc. rely on
this, may be its worth a libc item there.

>=20
>> -SRC_URI +=3D =
"file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
>> -            file://0002-Include-limits.h-for-PATH_MAX.patch \
>> -            "
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
>> +           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
>> +           file://0002-Include-limits.h-for-PATH_MAX.patch \
>> +           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
>> +           "
>=20
> ... this change is not mentioned in the commit message.  Why have you
> added the tarball to SRC_URI directly (rather than letting the .inc do
> that as it did before)?
>=20
> p.
>=20
>=20


--Apple-Mail=_F4C1DD5A-8BB3-4581-8183-DF6C8BEADD16
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb8YWQACgkQuwUzVZGdMxQnzQCdFfCmJQ0vEjx/H4ULmc/CKA11
T+8AniZGvfdFQP6F6Stz2+z5J5xrvEUk
=gils
-----END PGP SIGNATURE-----

--Apple-Mail=_F4C1DD5A-8BB3-4581-8183-DF6C8BEADD16--
