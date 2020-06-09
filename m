Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5773.1591667339298697117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 18:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0591lvPL000968
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 8 Jun 2020 18:48:29 -0700
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 8 Jun 2020
 18:48:10 -0700
Subject: Re: [OE-core] [PATCH] encodings: rdepends on mkfontscale
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <20200607071851.24949-1-kai.kang@windriver.com>
 <cd5fb3ec7c52462d3669349cf8d6e373519f859f.camel@linuxfoundation.org>
From: "kai" <kai.kang@windriver.com>
Message-ID: <861e1e55-e8f8-988c-c29d-631c770b6e05@windriver.com>
Date: Tue, 9 Jun 2020 09:46:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cd5fb3ec7c52462d3669349cf8d6e373519f859f.camel@linuxfoundation.org>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 0591lvPL000968
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020/6/9 =E4=B8=8A=E5=8D=884:40, Richard Purdie wrote:
> On Sun, 2020-06-07 at 15:18 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It runs mkfontdir and mkfontdir during postinst script which are from
>> package mkfontscale. So make encodings rdepends on mkfontscale.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
>> b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
>> index 4d61aed183..a299bf2fb2 100644
>> --- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
>> +++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
>> @@ -10,7 +10,7 @@ PE =3D "1"
>>   PR =3D "r3"
>>  =20
>>   DEPENDS =3D "mkfontscale-native mkfontdir-native font-util-native"
>> -RDEPENDS_${PN} =3D ""
>> +RDEPENDS_${PN} =3D "mkfontscale"
> I suspect the correct fix is that it shouldn't have these postinsts?
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Db8f089512f65a4a1=
31c8096c281c4f3d9cf23718

OK. I'll send V2 to remove the postinsts.

Regards,
Kai


>
> Cheers,
>
> Richard
>

--=20
Kai Kang
Wind River Linux

