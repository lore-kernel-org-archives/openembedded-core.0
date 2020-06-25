Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
 by mx.groups.io with SMTP id smtpd.web10.1703.1593111533254732379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: herbrechtsmeier.net, ip: 85.13.157.12, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.42] (i5E866743.versanet.de [94.134.103.67])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id A7FEB11A03F6;
	Thu, 25 Jun 2020 20:58:50 +0200 (CEST)
Subject: Re: [OE-core] Status of Go support
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
 <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com>
 <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
 <CAP9ODKpQ+ZgNqoZvWtHRF_RyrvpXan4v-ZM=U9fiHXj8o8Daww@mail.gmail.com>
 <6c1c02b9-842a-1d33-2727-932d7a46f702@herbrechtsmeier.net>
 <CAP9ODKo=41yAPeMvLU4uX=0fj+x3rv5DiAHMCFu_BwYWWm3uQQ@mail.gmail.com>
 <6a604026-37d1-eeef-3a2a-99471640409a@herbrechtsmeier.net>
 <CAP9ODKo16+MpqyDMwidkLaRS2vO5GKiN=UbA43yU9o0m3pFzqw@mail.gmail.com>
From: "Stefan Herbrechtsmeier" <stefan@herbrechtsmeier.net>
Message-ID: <efcd57c9-207f-4d1c-e6e4-3d83de8dd160@herbrechtsmeier.net>
Date: Thu, 25 Jun 2020 20:58:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo16+MpqyDMwidkLaRS2vO5GKiN=UbA43yU9o0m3pFzqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 25.06.20 um 20:40 schrieb Otavio Salvador:
> Em qui., 25 de jun. de 2020 =C3=A0s 15:35, Stefan Herbrechtsmeier
> <stefan@herbrechtsmeier.net> escreveu:
>>
>> Am 25.06.20 um 18:43 schrieb Otavio Salvador:
>>> Offline build, using go mod, I can only envision if we somehow provid=
e
>>> a local server which uses the bitbake cache as source. This by itself
>>> is not a small project.
>>
>> What do you mean by 'provide a local server'? Do you mean a registry
>> server for go-mod and cargo?
>=20
> Yes, this is how imagine it'd work for long term and with a more
> maintainable way. That said, it is not a small project, for sure.

But this means you have to provide a specific serer for every package=20
manager.
