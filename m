Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.10435.1589537701668107963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 03:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04FAExc7008187
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 15 May 2020 03:15:00 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 03:14:40 -0700
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Fix for do_populate_sdk
To: Paul Barker <pbarker@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
References: <cover.1589535009.git.liezhi.yang@windriver.com>
 <ab5e6c612d362589fa88a49fd36c4a0b1ecc1a37.1589535009.git.liezhi.yang@windriver.com>
 <CAM9ZRVtq0OLUR0GUjVPpTYqJ49PcxqoFjRcX2TpHrtsgk8CMVg@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <2c00aa7d-c4f1-a978-186b-18329f73a639@windriver.com>
Date: Fri, 15 May 2020 18:13:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVtq0OLUR0GUjVPpTYqJ49PcxqoFjRcX2TpHrtsgk8CMVg@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 04FAExc7008187
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/15/20 6:00 PM, Paul Barker wrote:
> Robert,
>=20
> I recommend we use the following patch instead as it's simpler:=20
> https://lists.openembedded.org/g/openembedded-core/message/136168

Yes, that looks better, then please ignore my patch.

// Robert

>=20
> Thanks,
> Paul
>=20
> On Fri, 15 May 2020 at 10:31, Robert Yang <liezhi.yang@windriver.com=20
> <mailto:liezhi.yang@windriver.com>> wrote:
>=20
>     Fixed:
>     $ bitbake core-image-minimal -cpopulate_sdk
>=20
>     Check tmp-glibc/deploy/sources, no source is archived, this patch fi=
xes the
>     problem.
>=20
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>      =C2=A0meta/classes/archiver.bbclass | 4 ++++
>      =C2=A01 file changed, 4 insertions(+)
>=20
>     diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.b=
bclass
>     index 48b4913a9f..49f96bdce6 100644
>     --- a/meta/classes/archiver.bbclass
>     +++ b/meta/classes/archiver.bbclass
>     @@ -592,4 +592,8 @@ python () {
>      =C2=A0 =C2=A0 =C2=A0# gets added or removed (by adding or removing =
archiver.bbclass).
>      =C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class('kernel-yocto', d):
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.addtask('do_kernel_confi=
gme', 'do_configure',
>     'do_unpack_and_patch', d)
>     +
>     +=C2=A0 =C2=A0 # For populate_sdk
>     +=C2=A0 =C2=A0 if bb.data.inherits_class('image', d):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag('do_populate_sdk', 'rec=
rdeptask', '
>     do_deploy_archives')
>      =C2=A0}
>     --=20
>     2.21.0
>=20
>    =20
>=20
