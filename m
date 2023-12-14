Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AAFC4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 14:35:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.23752.1702564557154059744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 06:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@quicinc.com header.s=qcppdkim1 header.b=kyXCkgvr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE8IKIU029887;
	Thu, 14 Dec 2023 14:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=R6MeeHOwHd1HMDrebeyAE6tpVG9RxZaza7bbLYPLnxc=; b=ky
	XCkgvrFjXgDnALG0fqGVg+Nq6MEg6jDzgPs84PXoXB+3oqu7tc6kfbEuGXOSIiZE
	k5t2AasJ7fvUgurB5vAhn7Kg/mkltCmw4F6+h1l7Wh3oH9ayIlY3P1qtsGlIyASp
	hEt+jNGyURj8ok52kSUL0I7wFXLcE/q/DjlhifoKGKFSHoJggvwKtUmuu3946EDc
	UU5Qxv1u5N6GW0x1Cegj7M0ruycsmIiaI07gQcAUqALY+3NT0u+TCpyxDPRpost6
	fx6hqaaTu+XxRPfWzCRkEGnHYtpa/Agqb09H/Xn9dv41w9D6I+QI2qtCQDlukFzh
	Pd09/+CfECIPBM2iCwKw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uynja9q2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 14:35:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BEEZsIq011689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 14:35:54 GMT
Received: from [10.214.226.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Dec
 2023 06:35:53 -0800
Message-ID: <662259f3-8dd2-42b8-bb10-1f37462a1db4@quicinc.com>
Date: Thu, 14 Dec 2023 20:05:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/2] systemd-boot: Add recipe to compile
 native
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20231213115748.487216-1-quic_vkraleti@quicinc.com>
 <CAMKF1sq=oxDTJzznUOC3aakX3tS+wP5+_JZjXpmadat1j+FA_Q@mail.gmail.com>
Content-Language: en-US
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAMKF1sq=oxDTJzznUOC3aakX3tS+wP5+_JZjXpmadat1j+FA_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FgL_tiL93xBfboTICMX5_M2vrOWI6L8a
X-Proofpoint-ORIG-GUID: FgL_tiL93xBfboTICMX5_M2vrOWI6L8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312140102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 3BE8IKIU029887
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192385



On 12/14/2023 2:22 AM, Khem Raj wrote:
> On Wed, Dec 13, 2023 at 3:58=E2=80=AFAM Viswanath Kraleti
> <quic_vkraleti@quicinc.com> wrote:
>>
>> systemd-boot native recipe provides ukify tool to build
>> UKI images for systemd-boot
>>
>> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
>> ---
>>   .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++=
++
>>   1 file changed, 15 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254=
.4.bb
>>
>> diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/=
meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>> new file mode 100644
>> index 0000000000..0cdd7e7045
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>> @@ -0,0 +1,15 @@
>> +require systemd.inc
>> +
>> +inherit native
>> +
>> +RRECOMMENDS:${PN} +=3D "python3-pefile-native"
>> +
>> +COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
>=20
> this is a native recipe, so I wonder why do we need COMPATIBLE_HOST
>=20
Removed it.
>> +
>> +do_configure[noexec] =3D "1"
>> +do_compile[noexec] =3D "1"
>=20
> should these tasks be simply deleted using deltask
>=20
Used noexec to let default task dependencies to remain as is so that=20
install can find source under ${S}. I'll explicitly add 'addtask install=20
after do_unpack'.
>> +
>> +do_install () {
>> +       install -d ${D}${bindir}
>> +       install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
>=20
> you can make it one liner
>=20
> install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
>
Thanks for the input.

>> +}
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192289): https://lists.openembedded.org/g/openembe=
dded-core/message/192289
>> Mute This Topic: https://lists.openembedded.org/mt/103147679/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

