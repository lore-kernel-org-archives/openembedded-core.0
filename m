Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web09.15900.1609379172245556724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 17:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.10.145] (unknown [183.129.223.42])
	by kozue.soulik.info (Postfix) with ESMTPSA id BE5E9100792;
	Thu, 31 Dec 2020 10:45:52 +0900 (JST)
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH v2 0/2] meson: fixup nativesdk sysroot
From: "Randy Li" <ayaka@soulik.info>
X-Mailer: iPad Mail (16D57)
In-Reply-To: <0caca27102d49a9897438734f3f0d955ecf17656.camel@linuxfoundation.org>
Date: Thu, 31 Dec 2020 09:46:06 +0800
Cc: openembedded-core@lists.openembedded.org
Message-Id: <E4DB717E-1AD6-4B7D-8A6B-91217F3C5769@soulik.info>
References: <20201229035550.226617-1-ayaka@soulik.info> <0caca27102d49a9897438734f3f0d955ecf17656.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 30, 2020, at 10:05 PM, Richard Purdie <richard.purdie@linuxfoundati=
on.org> wrote:
>=20
>> On Tue, 2020-12-29 at 11:55 +0800, Randy Li wrote:
>> I still saw the request for this patch from Gstreamer users
>> sometimes. I have verified this version would work fine.
>>=20
>> Only the exported SDK would need this patch.
>=20
> Thanks for the patches, is there something we should add to the
> automated tests (e.g. in meta/lib/oeqa/sdk/cases) to test this?
>=20
The original case is that when I was compiling the Gstreamer plugins bad for=
 Intel Media SDK, the include path from the pkg-config would be one without s=
ysroot. Most of packages won=E2=80=99t meet such problem, they can just ordi=
nary includedir, which is not from meson but compiler I think, then prepend a=
 package name when its code include thems.

I think this case only fix those package using meson and need to get somethi=
ng likes path information from the pkg-config.

I have not read the QA part, so I don=E2=80=99t know what is necessary for s=
uch case. Maybe a check for the environment variables from all those auto bu=
ild tools ? I need to read and make the right comment as well as I welcome t=
he idea from the others.
> Cheers,
>=20
> Richard
>=20
Sincerely=20
Randy=

