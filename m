Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [91.207.212.93])
 by mx.groups.io with SMTP id smtpd.web12.4779.1622018551009140716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 01:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@foss.st.com header.s=selector1 header.b=SYwNGPOZ;
 spf=pass (domain: foss.st.com, ip: 91.207.212.93, mailfrom: christophe.priouzeau@foss.st.com)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14Q8WqBX010632;
	Wed, 26 May 2021 10:42:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WSIjOuHYS0GC30tvqqUhDUNrsHRtq71rxsI+qAPtMIc=;
 b=SYwNGPOZi0+wZv9dFG/lqL42RWnf016xn3mFTEX/2Jq+kJdRXr0lOWgTWZlWwebbo5LY
 lzoXuK3RcVIGu4p7ZsWL52m/INS2u3RRKYesTJ/yRJIOW6+FlJTFH2xaP1zMhmTo3VFQ
 q1uvqw3fKwKW/4dNRUgfkoFfnyBNbpcDpt2Jd43RHishqQShuCpVeifNNxd7SoSEb+9O
 JiPoLH26YLsSMid2L64rRgfiyAD0/KmL3Y3WhaZrIqKjxNar4OWiKl7V7ooADc3LIwE2
 vJlUtPvoMC0WtJn1Hg9Ubqh49tAOrYiww2Fts/bBTN2UvnMyPGSXVznnAcscxPdPbMZR cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 38sgprgxn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 May 2021 10:42:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EFC2100034;
	Wed, 26 May 2021 10:42:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 548B321CA8E;
	Wed, 26 May 2021 10:42:28 +0200 (CEST)
Received: from lmecxl0909.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 26 May
 2021 10:42:27 +0200
Subject: Re: [OE-core] [hardknott][PATCH 1/2] glib-2.0: use python3targetconfig
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
References: <20210525151709.522795-1-christophe.priouzeau@foss.st.com>
 <CANNYZj_uvYkm5Ld_dyD_xMKO-CACy-c-oiSowZUM8qNHsav2fQ@mail.gmail.com>
From: "cpriouzeau" <christophe.priouzeau@foss.st.com>
Message-ID: <cf833f4e-e729-4c39-dc37-76bbba406918@foss.st.com>
Date: Wed, 26 May 2021 10:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_uvYkm5Ld_dyD_xMKO-CACy-c-oiSowZUM8qNHsav2fQ@mail.gmail.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-26_06:2021-05-25,2021-05-26 signatures=0
X-MIME-Autoconverted: from 8bit to quoted-printable by mx07-00178001.pphosted.com id 14Q8WqBX010632
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, after a veirification, I have seen the my issue=20
come from an append on python configuration made on others layers.
Please don't take into account this patch
Sorry for the inconvenience

Regards
Christophe priouzeau

On 5/25/21 7:56 PM, Alexander Kanavin wrote:
> Same here: this needs to go to master first, and better explained, as we=
=
=20
> are not seeing those issues.
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
>      =C2=A0meta/recipes-core/glib-2.0/glib.inc | 1 +
>      =C2=A01 file changed, 1 insertion(+)
>=20
>     diff --git a/meta/recipes-core/glib-2.0/glib.inc
>     b/meta/recipes-core/glib-2.0/glib.inc
>     index 71777bc459..1b513654d8 100644
>     --- a/meta/recipes-core/glib-2.0/glib.inc
>     +++ b/meta/recipes-core/glib-2.0/glib.inc
>     @@ -29,6 +29,7 @@ PACKAGES +=3D "${PN}-codegen ${PN}-utils"
>      =C2=A0LEAD_SONAME =3D "libglib-2.0.*"
>=20
>      =C2=A0inherit meson gettext gtk-doc pkgconfig ptest-gnome
>     upstream-version-is-even bash-completion gio-module-cache manpages
>     +inherit python3targetconfig
>=20
>      =C2=A0DEPENDS_append_class-target =3D "${@' gtk-doc' if
>     d.getVar('GTKDOC_ENABLED') =3D=3D 'True' else ''}"
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
