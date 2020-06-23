Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
 by mx.groups.io with SMTP id smtpd.web11.13885.1592937347080035130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 11:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: herbrechtsmeier.net, ip: 85.13.157.12, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.42] (i59F77E0E.versanet.de [89.247.126.14])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id DC7D911A0766;
	Tue, 23 Jun 2020 20:35:44 +0200 (CEST)
Subject: Re: [OE-core] Status of Go support
To: Khem Raj <raj.khem@gmail.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
From: "Stefan Herbrechtsmeier" <stefan@herbrechtsmeier.net>
Message-ID: <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
Date: Tue, 23 Jun 2020 20:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

Am 23.06.20 um 20:16 schrieb Khem Raj:
> On Tue, Jun 23, 2020 at 9:47 AM Otavio Salvador=20
> <otavio.salvador@ossystems.com.br=20
> <mailto:otavio.salvador@ossystems.com.br>> wrote:
>=20
>     Hello Stefan,
>=20
>     Em ter., 23 de jun. de 2020 =C3=A0s 13:37, Stefan Herbrechtsmeier
>     <stefan@herbrechtsmeier.net <mailto:stefan@herbrechtsmeier.net>>
>     escreveu:
>      > because of the changes to the 'GO111MODULE' variable in go-dep a=
nd
>      > glide, I wonder if Go is ready for use. I would have expected th=
e
>      > variable GO111MODULE to be set to 'off' within the go.bbclass
>     because go
>      > could bypass the fetch task unobserved otherwise.
>=20
>     Is there any known issue?
>=20
>     For me, with those fixes, it is working fine.
>=20
>=20
> Yes it=E2=80=99s working ok with go-module for me but not sure of go-de=
p has=20
> regresse

What is the expected behavior of go-module and go-dep? Does they work=20
without network connection after a bitbake -c fetch?
