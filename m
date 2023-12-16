Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6FCC46CA2
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 11:49:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.13838.1702727359681268887
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 03:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@quicinc.com header.s=qcppdkim1 header.b=LurPKwxr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BGBgn2c010359;
	Sat, 16 Dec 2023 11:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aPgji0CXC6EItjuEkaw2c+0RA5MawSPLwoza5zfTjcQ=; b=Lu
	rPKwxr87fRwTZdZvGy5k2XwwmdtNZs3swmKNwZrORbHWVlRF12lvb4IvkShle5hA
	+6jfg45R5nuhoxIqpLvVYUx/pfLOEM16G133tK+u1hUEBblLFb6al9IGSARVVS9l
	wctm5k1yEHf/so5xBQREY4TkZCpwB2C0cv8+f1MoUshihetAyWvUjJvsL7bzBpp7
	u1NIbiN36uNoFi2wJcX55uLDvKgx5bc2TexrV+VRknvk8/0vSX2ELjQnq64y1Esv
	t7Vsa3L1UG67ZWaE1kyVLdpgOETRsoLGoq3szlKvzyip0Wb1zqkl7VTOKl9856Bw
	PVPyGyNvGrG5C05OWxvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v152w0fnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 11:49:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BGBnH7L026579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 11:49:17 GMT
Received: from [10.216.44.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 16 Dec
 2023 03:49:15 -0800
Message-ID: <8c195517-1b30-4449-ac09-491e6adea677@quicinc.com>
Date: Sat, 16 Dec 2023 17:19:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] systemd-boot: Add recipe to compile native
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20231216002503.3681891-1-quic_vkraleti@quicinc.com>
 <CANNYZj8GSbSGGDGWSchn5G=mqv7z99g2p_KVgnDcwO=LSJXALg@mail.gmail.com>
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CANNYZj8GSbSGGDGWSchn5G=mqv7z99g2p_KVgnDcwO=LSJXALg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PdfEhwZGyns4PK9jZlRVQCr2JkAskUuG
X-Proofpoint-GUID: PdfEhwZGyns4PK9jZlRVQCr2JkAskUuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=789 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312160091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 3BGBgn2c010359
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 11:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192557

Initial patch is for the same. However got a feedback to use a separate=20
recipe as extending systemd-boot recipe made is messy with a bunch of=20
overrides for almost all tasks.

check: https://lists.openembedded.org/g/openembedded-core/message/191307

//Viswanath

On 12/16/2023 5:04 PM, Alexander Kanavin wrote:
> Can we rather fold it into systemd-boot with bbassextend?
>=20
> Alex
>=20
> On Sat 16. Dec 2023 at 1.26, Viswanath Kraleti=20
> <quic_vkraleti@quicinc.com <mailto:quic_vkraleti@quicinc.com>> wrote:
>=20
>     systemd-boot native recipe provides ukify tool to build
>     UKI images for systemd-boot
>=20
>     Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com
>     <mailto:quic_vkraleti@quicinc.com>>
>     ---
>      =C2=A0.../systemd/systemd-boot-native_254.4.bb
>     <http://systemd-boot-native_254.4.bb>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 15 +++++++++++++++
>      =C2=A01 file changed, 15 insertions(+)
>      =C2=A0create mode 100644
>     meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>     <http://systemd-boot-native_254.4.bb>
>=20
>     diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>     <http://systemd-boot-native_254.4.bb>
>     b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>     <http://systemd-boot-native_254.4.bb>
>     new file mode 100644
>     index 0000000000..73db59b14e
>     --- /dev/null
>     +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>     <http://systemd-boot-native_254.4.bb>
>     @@ -0,0 +1,15 @@
>     +require systemd.inc
>     +
>     +inherit native
>     +
>     +deltask do_configure
>     +deltask do_compile
>     +
>     +do_install () {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm 0755 ${S}/src/ukify/ukify.p=
y ${D}${bindir}/ukify
>     +}
>     +addtask install after do_unpack
>     +
>     +PACKAGES =3D "${PN}"
>     +
>     +FILES:${PN} =3D "${bindir}/ukify"
>     --=20
>     2.25.1
>=20
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192556): https://lists.openembedded.org/g/openembed=
ded-core/message/192556
> Mute This Topic: https://lists.openembedded.org/mt/103202155/5192326
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
quic_vkraleti@quicinc.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

