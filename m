Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.1674.1608319132993609911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 11:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kernel.org header.s=k20201202 header.b=mViS45xG;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [PATCH 4/4] initscripts: Use initctl on sysvinit only
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608319132;
	bh=l3ZC9vAmjfbgUmTWvDMlOoXh5/ZDEwaVN+Ke4Nt2a/w=;
	h=To:Cc:References:From:Date:In-Reply-To:From;
	b=mViS45xGY867lmwaV68xECEp782weUA+9w5ZewKlFxw1poS0yDaAIguIC6NuKS7rX
	 iR4IWdnSV5r4mkRsPLj4JwQ51f8vKrSUIWaI5Jt8CYGVBDwpSMLbYjOHU/FZJMhqq/
	 u9SuaN8mBc71XRZZOf9nOCVyg7sKsXEfJ5OHCGh+634Hj2m1ONQLGDSJXeWQ68Xq9+
	 KlatrvI0c3jTKJsmEA/ACHu39fhz/IuHq6Os5klS3aqS/n7DwHv3VKBFHv0sBQBCKw
	 SgHfwq5Ul8ZRyssaF5EI85ytaR5xenBqgNoHdbXuGhKsL9lfRRWOXu6YiyRNhM/7Ac
	 8p7wIUyP1NSmw==
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20201217225440.2633474-1-raj.khem@gmail.com>
 <20201217225440.2633474-4-raj.khem@gmail.com>
 <f888a821-9dd9-fd5c-5372-2e7e777adcb7@kernel.org>
 <CAMKF1sqyB+ow5uNd5LDLZt=rNZc_PqdkCkYASHxZyPkHJ0qZgw@mail.gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <f11cda3f-80c0-ecab-3efe-aaff5fe4c36c@kernel.org>
Date: Fri, 18 Dec 2020 14:18:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqyB+ow5uNd5LDLZt=rNZc_PqdkCkYASHxZyPkHJ0qZgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/18/2020 1:46 PM, Khem Raj wrote:
> On Fri, Dec 18, 2020 at 10:29 AM Sinan Kaya <okaya@kernel.org
> <mailto:okaya@kernel.org>> wrote:
>=20
>     On 12/17/2020 5:54 PM, Khem Raj wrote:
>     > +if [ ! -p "$INITCTL" ] && [ "$(readlink -- "/sbin/init")" =3D
>     "/sbin/init.sysvinit" ]; then
>=20
>     Can this be done at build time for targets using sysvinit only?
>=20
>=20
> Yes however It will be lot more obscure=C2=A0
> Hard to read and harder to maintain=C2=A0

I see your point. I think having a flag in the /etc/default/rcS file and
using that for comparison seems more plausible here as opposed to
init.sysvinit check. (this looked very fragile to me for some reason)
