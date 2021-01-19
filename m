Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by mx.groups.io with SMTP id smtpd.web12.10783.1611060657712535374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 04:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: huawei.com, ip: 45.249.212.32, mailfrom: zhengjunling@huawei.com)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DKpQb6QlZzj7ld;
	Tue, 19 Jan 2021 20:49:59 +0800 (CST)
Received: from [10.108.148.36] (10.108.148.36) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 19 Jan 2021 20:50:48 +0800
Subject: Re: [OE-core] [PATCH 2/2] libxml2: Update checksum for testtar
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20210119062545.625-1-zhengjunling@huawei.com>
 <20210119062545.625-2-zhengjunling@huawei.com>
 <d36f56ea7d0ad862d7ed8fe3aafe64b680aead56.camel@linuxfoundation.org>
From: "Junling Zheng" <zhengjunling@huawei.com>
Message-ID: <57d1d915-6979-f42b-a4f4-8a4572ebfce1@huawei.com>
Date: Tue, 19 Jan 2021 20:50:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d36f56ea7d0ad862d7ed8fe3aafe64b680aead56.camel@linuxfoundation.org>
X-Originating-IP: [10.108.148.36]
X-CFilter-Loop: Reflected
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2021/1/19 20:39, Richard Purdie =E5=86=99=E9=81=93:
> On Tue, 2021-01-19 at 14:25 +0800, Junling Zheng via
> lists.openembedded.org wrote:
>> For some unknown factor, the checksum of testtar(xmlts20080827.tar.gz)
>> is mismatch with that of remote. Let's fix it.
>>
>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>> ---
>> =C2=A0meta/recipes-core/libxml/libxml2_2.9.10.bb | 4 ++--
>> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes=
-core/libxml/libxml2_2.9.10.bb
>> index 07ae68610c..cab234f9b7 100644
>> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
>> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
>> @@ -28,8 +28,8 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-=
${PV}.tar.gz;name=3Dlibtar \
>> =C2=A0
>>
>>
>>
>> =C2=A0SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
>> =C2=A0SRC_URI[libtar.sha256sum] =3D "aafee193ffb8fe0c82d4afef6ef91972c=
baf5feea100edc2f262750611b4be1f"
>> -SRC_URI[testtar.md5sum] =3D "ae3d1ebe000a3972afa104ca7f0e1b4a"
>> -SRC_URI[testtar.sha256sum] =3D "96151685cec997e1f9f3387e3626d61e6284d=
4d6e66e0e440c209286c03e9cc7"
>> +SRC_URI[testtar.md5sum] =3D "3a944b972f2da90b97d8a57c6f939fa8"
>> +SRC_URI[testtar.sha256sum] =3D "9b2c865aba66c6429ca301a7ef048d7eca2cd=
b7a9106184416710853c7b37d0d"
>=20
> $ wget http://www.w3.org/XML/Test/xmlts20080827.tar.gz
> --2021-01-19 12:38:58--  http://www.w3.org/XML/Test/xmlts20080827.tar.g=
z
> Resolving www.w3.org (www.w3.org)... 128.30.52.100
> Connecting to www.w3.org (www.w3.org)|128.30.52.100|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 638940 (624K) [application/gzip]
> Saving to: =E2=80=98xmlts20080827.tar.gz=E2=80=99
>=20
> xmlts20080827.tar.gz                  100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>] 623.96K  1.27MB/s    in 0.5s   =20
>=20
> 2021-01-19 12:38:59 (1.27 MB/s) - =E2=80=98xmlts20080827.tar.gz=E2=80=99=
 saved [638940/638940]
>=20
> $ md5sum xmlts20080827.tar.gz=20
> ae3d1ebe000a3972afa104ca7f0e1b4a  xmlts20080827.tar.gz
>=20
> So seems ok to me?
>=20

Sorry, it seems to be a problem with my host env, and the downloaded pack=
ages
cannot be unpacked successfully. Please ignore these two patches. I'm so =
sorry :(

Cheers,

Junling

> Cheers,
>=20
> Richard
>=20
>=20
> .
>=20

