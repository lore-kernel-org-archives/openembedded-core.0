Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
 by mx.groups.io with SMTP id smtpd.web11.1334.1593029854171758530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 13:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: herbrechtsmeier.net, ip: 85.13.157.12, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.42] (i5E8667C9.versanet.de [94.134.103.201])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id A75D111A03F6;
	Wed, 24 Jun 2020 22:17:31 +0200 (CEST)
Subject: Re: [OE-core] Status of Go support
To: Khem Raj <raj.khem@gmail.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
 <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com>
From: "Stefan Herbrechtsmeier" <stefan@herbrechtsmeier.net>
Message-ID: <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
Date: Wed, 24 Jun 2020 22:17:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 23.06.20 um 21:56 schrieb Khem Raj:
> On 6/23/20 11:35 AM, Stefan Herbrechtsmeier wrote:
>> Am 23.06.20 um 20:16 schrieb Khem Raj:
>>> On Tue, Jun 23, 2020 at 9:47 AM Otavio Salvador=20
>>> <otavio.salvador@ossystems.com.br=20
>>> <mailto:otavio.salvador@ossystems.com.br>> wrote:
>>>
>>> =C2=A0=C2=A0=C2=A0 Hello Stefan,
>>>
>>> =C2=A0=C2=A0=C2=A0 Em ter., 23 de jun. de 2020 =C3=A0s 13:37, Stefan =
Herbrechtsmeier
>>> =C2=A0=C2=A0=C2=A0 <stefan@herbrechtsmeier.net <mailto:stefan@herbrec=
htsmeier.net>>
>>> =C2=A0=C2=A0=C2=A0 escreveu:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 > because of the changes to the 'GO111MODULE=
' variable in go-dep=20
>>> and
>>> =C2=A0=C2=A0=C2=A0=C2=A0 > glide, I wonder if Go is ready for use. I =
would have expected the
>>> =C2=A0=C2=A0=C2=A0=C2=A0 > variable GO111MODULE to be set to 'off' wi=
thin the go.bbclass
>>> =C2=A0=C2=A0=C2=A0 because go
>>> =C2=A0=C2=A0=C2=A0=C2=A0 > could bypass the fetch task unobserved oth=
erwise.
>>>
>>> =C2=A0=C2=A0=C2=A0 Is there any known issue?
>>>
>>> =C2=A0=C2=A0=C2=A0 For me, with those fixes, it is working fine.
>>>
>>>
>>> Yes it=E2=80=99s working ok with go-module for me but not sure of go-=
dep has=20
>>> regresse
>>
>> What is the expected behavior of go-module and go-dep? Does they work=20
>> without network connection after a bitbake -c fetch?
>=20
> I think so. Its perhaps after first build unless you clean the build tr=
ee.

The go-mod.bbclass download data from the internet during do_compile. If=20
you cut the internet connection after a do_fetch the do_compile failed:

| DEBUG: Executing shell function do_compile
| go: github.com/nats-io/jwt@v0.3.2: Get=20
"https://proxy.golang.org/github.com/nats-io/jwt/@v/v0.3.2.mod": dial=20
tcp: lookup proxy.golang.org on 127.0.0.53:53: server misbehaving
| go: github.com/nats-io/jwt@v0.3.2: Get=20
"https://proxy.golang.org/github.com/nats-io/jwt/@v/v0.3.2.mod": dial=20
tcp: lookup proxy.golang.org on 127.0.0.53:53: server misbehaving



