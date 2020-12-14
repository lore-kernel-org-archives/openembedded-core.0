Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.32960.1607942835636169298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 0BEAl3G9001387
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 14 Dec 2020 04:47:11 -0600
Subject: Re: [OE-core] [PATCH] file /etc/ethertypes conflicts between netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Outback Dingo <outbackdingo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20201214103248.2227-1-outbackdingo@gmail.com>
 <CANNYZj_EoiG+MXJ-fjsZ8YsxwRhD6SSwv9xXLTzw3PMTvBqXdA@mail.gmail.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <cba48cc8-d0dd-1865-63a3-43aa9f04243d@kernel.crashing.org>
Date: Mon, 14 Dec 2020 04:47:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_EoiG+MXJ-fjsZ8YsxwRhD6SSwv9xXLTzw3PMTvBqXdA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by kernel.crashing.org id 0BEAl3G9001387
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I agree.  Netbase is the required for all installs.  ebtables is only used =
in
some installs.

So unless ebtables has a more up-to-date version of the file, it seems lik=
e the
bug is that ebtables needs to either remove the file or sync to the netbas=
e version.

(You won't get a conflict if both files are identical, md5sum/shasum)

--Mark

On 12/14/20 4:39 AM, Alexander Kanavin wrote:
> Sorry, but you need to explain why the file from from ebtables (an optio=
nal
> package from a 3rd party layer) takes precedence over file from netbase =
(which
> is a core item).
>=20
> Alex
>=20
> On Mon, 14 Dec 2020 at 11:33, Outback Dingo <outbackdingo@gmail.com
> <mailto:outbackdingo@gmail.com>> wrote:
>=20
>     ---
>     =C2=A0meta/recipes-core/netbase/netbase_6.2.bb <http://netbase_6.2.b=
b> | 1 -
>     =C2=A01 file changed, 1 deletion(-)
>=20
>     diff --git a/meta/recipes-core/netbase/netbase_6.2.bb
>     <http://netbase_6.2.bb> b/meta/recipes-core/netbase/netbase_6.2.bb
>     <http://netbase_6.2.bb>
>     index a54d2e7764..262b2cf1bc 100644
>     --- a/meta/recipes-core/netbase/netbase_6.2.bb <http://netbase_6.2.b=
b>
>     +++ b/meta/recipes-core/netbase/netbase_6.2.bb <http://netbase_6.2.b=
b>
>     @@ -19,5 +19,4 @@ do_install () {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/etc/rpc ${D}${sysco=
nfdir}/rpc
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/etc/protocols ${D}$=
{sysconfdir}/protocols
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/etc/services ${D}${=
sysconfdir}/services
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/etc/ethertypes ${D}=
${sysconfdir}/ethertypes
>     =C2=A0}
>     --=20
>     2.20.1
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
