Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFA8731C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 17:10:57 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id vy10so3689414pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=I6hBzgGENmvPZMd9+Xn+MintsZsF8laUp1Z+jG6CMYE=;
	b=lw6GYxTn/C1ConahlIrVsQlB74y+ZzSfkw2xkDca8doLjDYhrCUvRnaIP+9gIm30Ob
	WD5QsiCK/acKD9jIKY0cVoZc216/MMZfBy8A7V1x6TACn1ceTbIoe4mnWXadw84+3CLR
	KsZzzhxdicKybxM9kswpE0YiNA90XvA1nQeb33toZSrZ2kEZUmkmTShbAE5jLAetwOwA
	DU5ruprc/6pCLsORPDZnc2q2Jj9WAYVRYLIiApT0FOGvYjhwF/vSsqriZmZ5HNSox65C
	fA883zd4SyrwrDVRgF/A8oGbsDVUn3yCwiekhLF3tELyM91tAuWsYyGSKpx3/VRPaQiV
	m94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=I6hBzgGENmvPZMd9+Xn+MintsZsF8laUp1Z+jG6CMYE=;
	b=Kb3WwPVlUH0u3mbleodKP4a0dDJlvCJOc7j0+4sNzTAAnyc1wB1z3QfM+d9Ju1erMR
	jMjCI7IVEwrVb1poFIs+GDxOOLupv66bYVyX0RFJosHBt7vPf+Ieq/oKznn3WZeXklTs
	TlBIa0NzwK0Z45UTfMMdAuO2APJJVQEou1VjK5saRcmPRtJTQQ7H34xXtL9gKVJGauYO
	0WS8UmA7OBI3Anpyfab74U0+A5/GRT3pf5vG95mak0/P4bgSv8FVZmallK7L9tIN1K9c
	ZqSyIZJMzwdHubGFCsq+BHabKyrArQ7pLLaResa4bg5H2V8FPM2aw06juE/wqGs8SYms
	yR2A==
X-Gm-Message-State: AEkoouvEIq6OeiI6Qixf1afYtRXjfqvonJX73CFH4HMaEyGJcuIsjkkowZ322+pYw0of9Q==
X-Received: by 10.66.237.10 with SMTP id uy10mr15696714pac.80.1471626658440;
	Fri, 19 Aug 2016 10:10:58 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	n10sm12937292pap.16.2016.08.19.10.10.57
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 10:10:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471622541.16712.52.camel@linuxfoundation.org>
Date: Fri, 19 Aug 2016 10:11:00 -0700
Message-Id: <3E96D261-8098-4FC3-9437-15613450DD05@gmail.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<6e71e3206845a8eda86168634053fd3d5334201b.1471620482.git.joshua.g.lock@intel.com>
	<1471622541.16712.52.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] security_flags: ensure changes to SHARED_OBJECTS cause recompile
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
X-List-Received-Date: Fri, 19 Aug 2016 17:10:58 -0000
X-Groupsio-MsgNum: 85992
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4D3982E8-2BC1-4A7E-8C3C-50B8CF8D5516";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4D3982E8-2BC1-4A7E-8C3C-50B8CF8D5516
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 19, 2016, at 9:02 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2016-08-19 at 16:34 +0100, Joshua Lock wrote:
>> Add the SHARED_OBJECTS variable to SECURITY_LDFLAGS vardeps so that
>> changing SHARED_OBJECTS causes do_compile to re-run.
>>=20
>> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>> ---
>> meta/conf/distro/include/security_flags.inc | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/conf/distro/include/security_flags.inc
>> b/meta/conf/distro/include/security_flags.inc
>> index 295c733..901c841 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -24,6 +24,7 @@ SECURITY_CFLAGS ?=3D "-fstack-protector-strong -
>> -param ssp-buffer-size=3D4 -pie -fpi
>> SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong --param ssp
>> -buffer-size=3D4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>>=20
>> SECURITY_LDFLAGS ?=3D "-Wl,-z,relro,-z,now${pie_ld}"
>> +SECURITY_LDFLAGS[vardeps] +=3D "SHARED_OBJECTS"
>=20
> Surely you want:
>=20
> pid_ld[vardeps] +=3D "SHARED_OBJECTS"
>=20
> ?
>=20
> Also, you mention SHARED_OBJECTS defaults to "0", where is that? I am =
a
> little worried the variable name is also a bit generic? Setting this =
in
> the following way:
>=20
> SECURITY_SHARED_OBJECTS =3D "-fpie"
> SECURITY_SHARED_OBJECTS_pn-XXX =3D ""
>=20
> may be more in keeping with the way the rest of the file is written =
and
> avoids games with base_conditional and vardeps?
>=20
> I am also worried about trying to maintain a large list like this, the
> idea was to reduce the number of exceptions, not build lists which =
will
> ever increase :(. I can't see this scaling.

I agree with you here. I am mulling over a proposal for architecture =
change in 2.3
where we harden the toolchain by default and then dont have to keep the =
securiry
band-aid. Opinion?

>=20
> Cheers,
>=20
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4D3982E8-2BC1-4A7E-8C3C-50B8CF8D5516
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAle3PaQACgkQuwUzVZGdMxT4rgCeOxlaJMV0f7ZBsboK944EIflD
74IAmLWFOaRAyAxkGBI5ThCUAyn/udM=
=hk5c
-----END PGP SIGNATURE-----

--Apple-Mail=_4D3982E8-2BC1-4A7E-8C3C-50B8CF8D5516--
