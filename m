Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 31E40731E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:01:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so1663044pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=cUk0MvUnDD5BNycErFcInIgd5YwWBrY8ChkUwLpcd2k=;
	b=mJsbtQGvRThZBd2u7JWavM44h+piGzWn9WA5geagGPsp0QIz2H2cNi+0BtnHXd+hix
	EN3n/za3HRj8of2qvhFGZfwDM1yU0aiNldT+iVBEk9EyekJjVSj3jcIq1Xkf/eivxIi+
	Gf/aBAp+7j4kUfv+ZklpIcVORa7aIfJth7A9M57iI8+z2Yr034/o6H7xiPvnqj9Z0a0c
	MIMwv382SBCAXuvH5VfT2xHHFwz3263X/imF3mwmkcyghPgLQaRdiZYekmemYC2X4HRq
	d2R96zRS4KPwiHGrOSynvdFW0uW/JfbROILRSOlSxgUFLVS/rAjkNzjS/49d5ocm8TyN
	ovnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=cUk0MvUnDD5BNycErFcInIgd5YwWBrY8ChkUwLpcd2k=;
	b=Uj+i3kBaGmr9IueQpaxijZpgnThqJsdtb6IydveJEBsqCqiwZp3unR8grFjKLWtGkU
	4nEnbPSgv3CIjxBd19/6VN58DzADQu07rM2u8fEmyI1QcCAz1jXuHdRQn0pb/glEFed3
	WIBLckPtwvEE91RKQJ3I/JPHP1V5ws6QHX9Gni20DXWnLnI8gaznUWlsKQ6M45d0x58+
	Zzpjqb7JhL7rC7JAKA6WbqGdy5FZ+CtNqNaOrblClOMOmDJgs4P2Nrpgdphkzq3hCJqV
	iSR3u908Nez6mXgol/XGXsUxcispxF8nIpHlboiUPfUNMBgkeX+US7rK8DdYF8xtLuXr
	gBAA==
X-Gm-Message-State: AEkoouvS5x6bvaWRtvyunplVmyfjcKOGhJu7bou2u5B4mDfc5pgqMsuCXj52yBIgLo6sKg==
X-Received: by 10.98.130.137 with SMTP id w131mr15506924pfd.5.1471622515421;
	Fri, 19 Aug 2016 09:01:55 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	i137sm7601948pfe.64.2016.08.19.09.01.54
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 09:01:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <34192b46-68b3-98ba-58f2-d416b9fa2596@mlbassoc.com>
Date: Fri, 19 Aug 2016 09:01:52 -0700
Message-Id: <70318F10-8EFC-4724-9437-38C08B38D153@gmail.com>
References: <888B09F3-F9A2-49C1-86E8-E33FA1FE6521@gmail.com>
	<1471601644.16712.23.camel@linuxfoundation.org>
	<D00F6189-93E5-47F1-B2CB-E07F1F0C2B50@gmail.com>
	<57474cfd-86fc-be7b-f73f-27c1948dd116@mlbassoc.com>
	<ce173fb7-93f8-79bb-7aa0-8fa9b4c103d9@mlbassoc.com>
	<CAMKF1souM0vyia11_+J7QJrRz6ansi4vZ6cx1teWL78eXtnGFw@mail.gmail.com>
	<34192b46-68b3-98ba-58f2-d416b9fa2596@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc 6.2 RC1 update
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
X-List-Received-Date: Fri, 19 Aug 2016 16:01:55 -0000
X-Groupsio-MsgNum: 85985
Content-Type: multipart/signed;
	boundary="Apple-Mail=_85E53FD5-9C32-4E70-85D8-34501B80C07B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_85E53FD5-9C32-4E70-85D8-34501B80C07B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 19, 2016, at 8:05 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>=20
> On 2016-08-19 16:59, Khem Raj wrote:
>> This is a long standing assembler error. Which I never get to bottom =
of. Rwboorinf the build machine helps
>                                                                        =
   ^^^^^^^^^
>=20
> What does this mean?  As I mentioned, it worked fine before you =
updated to 6.2

=E2=80=98rebooting=E2=80=99, ( blame the phone keyboard) this is a =
memory block that returns wrong string and somehow related to =
allocations in assembler, if its the same error as I know of. It does =
not have to do with
gcc.

>=20
>>=20
>>=20
>> On Aug 19, 2016 7:06 AM, "Gary Thomas" <gary@mlbassoc.com =
<mailto:gary@mlbassoc.com>> wrote:
>>=20
>>    On 2016-08-19 16:04, Gary Thomas wrote:
>>=20
>>        On 2016-08-19 15:40, Khem Raj wrote:
>>=20
>>=20
>>                On Aug 19, 2016, at 3:14 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org
>>                <mailto:richard.purdie@linuxfoundation.org>> wrote:
>>=20
>>                On Tue, 2016-08-16 at 11:55 -0700, Khem Raj wrote:
>>=20
>>                    Hi All
>>=20
>>                    I have put together recipe upgrade for upcoming =
gcc 6.2 release now
>>                    that it entered RC phase. With gcc 6.2 the recipes =
are using tarballs
>>                    instead of git fetcher as promised :)
>>                    Please help testing it out in your setups and =
report any issues you
>>                    see.
>>=20
>>                    The commit you need to cherry-pick for OE-core is =
this one
>>=20
>>                    =
https://github.com/kraj/openembedded-core/commit/0319b603761a16e65d70
>>                    =
<https://github.com/kraj/openembedded-core/commit/0319b603761a16e65d70>
>>                    4336112c3709a8bf771c
>>=20
>>                    Thank you for your help
>>=20
>>=20
>>                I put this through the autobuilder and it passed so =
I've merged it. I
>>                did this quickly as we're putting a "pre M3" build =
through a QA cycle
>>                and I wanted to get some of the more invasive changes =
into that build
>>                so we don't have a stampeding herd of patches breaking =
everything
>>                coming up to the final feature freeze for 2.2.
>>=20
>>                In other news, we are now also testing musl world =
builds on the
>>                autobuilder as part of regular testing.
>>=20
>>=20
>>            Fantastic !
>>=20
>>=20
>>        Problem using this to build meta-fsl-arm:u-boot-fslc for =
i.MX6:
>>            CC      lib/asm-offsets.s
>>            lib/asm-offsets.c:1:0: error: bad value (armv5) for =
-march=3D switch
>>=20
>>        This worked fine with GCC/6.1 (git)
>>=20
>>        Ideas?
>>=20
>>=20
>>    Also, the bitbake "do_compile log" didn't show me this at all,
>>    I had to get it by running 'bitbake u-boot-fslc -c devshell' and
>>    then 'make' to see the error :-(
>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------


--Apple-Mail=_85E53FD5-9C32-4E70-85D8-34501B80C07B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle3LXUACgkQuwUzVZGdMxRIxgCeOANlgoOuZ3ghEHmH4BSi/Up5
0DIAn3YUdCrH38ZA/ggFoGzKEHJRGgg1
=XOgq
-----END PGP SIGNATURE-----

--Apple-Mail=_85E53FD5-9C32-4E70-85D8-34501B80C07B--
