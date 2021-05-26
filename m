Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web08.4765.1622018538688328799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 01:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@foss.st.com header.s=selector1 header.b=uJna3Fj+;
 spf=pass (domain: foss.st.com, ip: 185.132.182.106, mailfrom: christophe.priouzeau@foss.st.com)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14Q8awXH017251;
	Wed, 26 May 2021 10:42:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Opct0F0F7eaZWEwTboEYkrzqHICTLFbwr1AyISsqjSw=;
 b=uJna3Fj+XFxSBsGOJpN1DsYUUiVEqz2qY1pqxsavzzokmcvsPveNK429URhasb2al1rt
 mZFiNay2uHzmfRPQfLrcezFXcfUepUHAuGdIqNCqzBv6O5qoR5a/Q5GdJsOAVtiyH51A
 2EIYdhk1rBhPrN0vZtv8cR/VCba/6IYuWGn9eDw+RXlw7vaRbwto0GGXUwuAdNF/TN7s
 IOiG8aFsz8jXQ6YR3YAisHUZb00wRQA5buxzakrDcHgZXL4245ZG812XXd+YhI19HIzI
 qk9RtzpWxRl9UTsWfA589R3J2b/lR8FqTml2mn6BcnfmrDXbzxeuO6b7w/I9nQmjtq3X hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 38rppp94d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 May 2021 10:42:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1513910002A;
	Wed, 26 May 2021 10:42:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 089DB21CA8E;
	Wed, 26 May 2021 10:42:15 +0200 (CEST)
Received: from lmecxl0909.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 26 May
 2021 10:42:14 +0200
Subject: Re: [OE-core] [hardknott][PATCH 2/2] mesa: use python3targetconfig
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
References: <20210525151709.522795-1-christophe.priouzeau@foss.st.com>
 <20210525151709.522795-2-christophe.priouzeau@foss.st.com>
 <CANNYZj9PnhZDcz7cuHDR3PjZ=JbimkYhTEQHN2Hm8r0qSHZj0w@mail.gmail.com>
From: "cpriouzeau" <christophe.priouzeau@foss.st.com>
Message-ID: <cf96263d-92c1-332f-aaaa-eae0abf57f4e@foss.st.com>
Date: Wed, 26 May 2021 10:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9PnhZDcz7cuHDR3PjZ=JbimkYhTEQHN2Hm8r0qSHZj0w@mail.gmail.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-26_06:2021-05-25,2021-05-26 signatures=0
X-MIME-Autoconverted: from 8bit to quoted-printable by mx07-00178001.pphosted.com id 14Q8awXH017251
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, after a veirification, I have seen the my issue=20
come from an append on python configuration made on others layers.
Please don't take into account this patch
Sorry for the inconvenience

Regards
Christophe priouzeau
On 5/25/21 7:55 PM, Alexander Kanavin wrote:
> This needs to go to master first, and better explained, as we are not=20
> seeing those issues.
>=20
> Alex
>=20
> On Tue, 25 May 2021 at 17:17, cpriouzeau=20
> <christophe.priouzeau@foss.st.com=20
> <mailto:christophe.priouzeau@foss.st.com>> wrote:
>=20
>     Meson request to have a valid python, meson-log indicate that
>     issue come from:
>     ModuleNotFoundError: No module named '_sysconfigdata'
>=20
>     Signed-off-by: Christophe Priouzeau
>     <christophe.priouzeau@foss.st.com
>     <mailto:christophe.priouzeau@foss.st.com>>
>     ---
>      =C2=A0meta/recipes-graphics/mesa/mesa.inc | 2 +-
>      =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/meta/recipes-graphics/mesa/mesa.inc
>     b/meta/recipes-graphics/mesa/mesa.inc
>     index a85f94c75e..de39dc34e4 100644
>     --- a/meta/recipes-graphics/mesa/mesa.inc
>     +++ b/meta/recipes-graphics/mesa/mesa.inc
>     @@ -43,7 +43,7 @@ PROVIDES =3D " \
>      =C2=A0 =C2=A0 =C2=A0virtual/mesa \
>      =C2=A0 =C2=A0 =C2=A0"
>=20
>     -inherit meson pkgconfig python3native gettext features_check
>     +inherit meson pkgconfig python3native gettext features_check
>     python3targetconfig
>=20
>      =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>=20
>     --=20
>     2.25.1
>=20
>=20
>    =20
>=20


--=20
Best regards / Cordialement,

Christophe Priouzeau | Tel: +33 244027320
STMicroelectronics
ST online: www.st.com<http://www.st.com/>
