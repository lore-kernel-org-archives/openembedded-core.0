Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7490.1792574903378543364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=cxuWKpx8;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=JF4BU02q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jinwang.li@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5irPi3018345
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMFVyvpar1c71tmjixjh4iqnPnt5j/WsE1vf0vG7CD8=; b=cxuWKpx8SqUv+3U5
	5682k4e2r62YrpGDpU5f90fjZqkGgfVnIxk1sSwBuhTVFSCOdmolM4UoAA35PNFQ
	2TqKXZ/pX2S3GxCCayslmaEgV5/HBiY4nrxQEg/pv+P/GspDELThzMJ2AJEIi/Uu
	6EKs8cJ2ywMN3Yt3pytcmeT3H4KohNj+3I+MKV9mxTtLvcAk8ude7j7FlvpkG8eU
	8RwLyf/xJgoF0ijQZERiwZ5On0phBJpOSiBM154QgxUnYolKh4ytCg3FGabuXAnk
	YObFMtbpcZ+RhxNYOaF7SScWX+LVYsW7gPW61vYC++50hVZjOePAnzelXirESspG
	vwYAvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3nkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:28:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c01778cefso13903126d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 02:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574902; x=1793179702; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMFVyvpar1c71tmjixjh4iqnPnt5j/WsE1vf0vG7CD8=;
        b=JF4BU02qE+n60RWxO+dw/BB3+OoC7TJYwizb61RKRX867o0Pf5tDknaecEQBAVPDDN
         zyrmqZ5laF3rvh61TmHy6o9fXoTvzFNG+ZLbZWKmkKAm+7W24hq8dMh3vKkG0XrX4tRR
         7aUDliPbHVP+rsu1y6QlUPmtpKYDUGxLww3LFHiPKI2EYvgP/60EkTWlb6fnqKbgUtsi
         m7ei9xOgv7TNxbcijDV+DAIpp/qaxRWuTNHj+D4Jb+tFZfBNetD7zsvSeEdd1zPnQtZ2
         lMHJAsG23rgGaayfENSa3A/TJhu7IGcCa7Dh9pjg2KNwtFN7b3radtA0qBAesu8401uB
         ZxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574902; x=1793179702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMFVyvpar1c71tmjixjh4iqnPnt5j/WsE1vf0vG7CD8=;
        b=DwzUvQxAtGy4yXHKgSLrDQUqPxcn53gbNaaUWW+//KN6VLxW3bXE5umgjZuYWuqFQd
         UEgVZXnWHlVh07T/DIKBcamFo6XOxcue//YXqp9HwI5sUuRC5TAZnsOSb1Zn+UrMfuB4
         EWhUi7lbwBIKDLsvs3mVK0M1gViRtOSJAoybkZpms6Jk/buiRdr1H3YOpeUjHaz2xkqt
         lKU5XpPMCQ2WrpqvnjMzFLjBkliKgxa7cNgsKNOWFYYzG7p5q3zptq9a25FiPOw6yljg
         uc0I6oruqx1HbLl0NaBedpuPbLvpPK27jVLjzOAjQH2BlH5aQkfivrYlYYDPJrTIcW8F
         xt4w==
X-Forwarded-Encrypted: i=1; AKwUvBy/sK+XmsHMxsTRV/Owvc+5xUmaEKYJndLXDcgScLfBemR110CoCLPgPSknarqjHuUvG1I5k8ri7xesyb60Ra3kAw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI7ZNvmFgOlvz2oLrBfjpSDv7viro31QMWH6G5ii4F2q7YZff8N
	s84n77MwIHuaQ92tzsykXE/eoM1/9Zp2ZQOQQfO3DwyhlSJehWHn3D63Sf5URPHc0QJ5/kXtrxX
	i7s9kip5zayZYL2UrvpxanX2Kmk8BdI6JTN0tX2ZcMYvyahp3ddR/ZAljZwOUYymf3Av9I+96QV
	RCRi7Kkgg=
X-Gm-Gg: AYBFou3disoE/qeTKCepHlq0Z883kJeIoJ4a7l8O1MSsMXcw3hCkoH7NO4VeOR/xRYt
	MA3lSdIGhSA+omsgrnQf/dOTyyloS8oy+lAxKTCD+alJd3kYC3nJwMgYJcZI9p2fh5L7KEvLhre
	/qHt6/XRBBwSAHAbcBQUquJbs1edhEMVa29Wc5+B5arcj6SEk740ba9RRrOk82jDL2RHNTbwfqQ
	gM7x03Ss8KondOmHB+kmRZZ8WUuVjiPcb53Bg+wnN9Wxwe2C8WAJwSc+Xm6f5GcnCY/+I6u5a0g
	FFGiEyIusMEjNLf/E0EICF9wb3j4CWshGg2gTQ1HstOj5DZmbnLVrE19mX44qrmpc4HvrcLZnMl
	QUU1lGSc57wWLIOPoTR9uPZSEJLoXAxHiqT+zZ6kPVOkA5iAFBtCdrjxVZYA=
X-Received: by 2002:a05:6214:4689:b0:912:517b:40e7 with SMTP id 6a1803df08f44-91c12f01f80mr24588266d6.46.1792574901681;
        Wed, 21 Oct 2026 02:28:21 -0700 (PDT)
X-Received: by 2002:a05:6214:4689:b0:912:517b:40e7 with SMTP id 6a1803df08f44-91c12f01f80mr24587806d6.46.1792574901134;
        Wed, 21 Oct 2026 02:28:21 -0700 (PDT)
Received: from [10.111.174.166] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c42b17sm20144146d6.40.2026.10.21.02.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:28:20 -0700 (PDT)
Message-ID: <4babee4a-78d5-4872-98d8-6af8b9f4dbc5@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:28:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH 1/5] bluez5: Fix error handling for
 AVDTP_OPEN cmd
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-2-jinwang.li@oss.qualcomm.com>
 <DM9I5TPPZ27Z.1EJTKC86N46B0@smile.fr>
Content-Language: en-US
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
In-Reply-To: <DM9I5TPPZ27Z.1EJTKC86N46B0@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXy6OfR8ZDFBW3
 VPhDRCMfthIFK/JWqW05cBvB86/+yFURZBXQ3dPoEjQJE0Ia7g5hx5apjJ59PXm39bNQWRQSRRQ
 AyoFQAv8zbxulWBZ91nDwj/sK9qXiECiIHkcO0ilbg9wrehHT8kZWLLVS63s+sJTdkar0QvGHID
 FDZNhfjxJmCny1iL1IM+c08uHp/fsadinXWTLSaivT8VEbYEJ5Fq6LXkBnAofh3dua9Vs0CmwuK
 +ERwR5wkUkhbQ9zVHRLpUjhfwJN5z1fzjrvDPJY0/XxfVTuMz+mmjBxk0HxTJJHOiElAIZqItFP
 HAhISpEmT5hF5iG8pc6tIho1+NqlFSMigqdyc1VGRCmBsGPwLvOrBE8DNpv9nVLy6SJ1bw7P0E7
 otezi61y6w+Yo1J8Pz2xHcp1gfWYb1gbJdQJ+dHoUFRIVrlZRO0oGnKaIhzHHByis32NhhuAtpk
 p15+Ig89uUroH2HeP2Q==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad885b6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=4qbnzcR-HP6_F6JSLQMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-ORIG-GUID: hLgcUDm-d_PBHCdImJMufcTNp3dl1hs0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX2+Yp9W85YJpB
 uW3E0ORVnUrKSrJID7q3lOInxPwwR3IEItQRsZB8/jtQAdQLulA7ALvc7lowANmAlGuo2T8oR63
 Da9x6rN9I9t/KwOMVKMWckZqFSpW6ow=
X-Proofpoint-GUID: hLgcUDm-d_PBHCdImJMufcTNp3dl1hs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 69L5irPi3018345
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248380



On 10/20/2026 3:55 PM, Yoann Congal wrote:
> On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded=
.org wrote:
>> Return BAD_STATE instead of BAD_ACP_SEID when the SEID maps to a
>> valid local SEP.
>>
>> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
>> ---
>>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>>   ...ix-error-handling-for-AVDTP_OPEN-cmd.patch | 49 +++++++++++++++++=
++
>>   2 files changed, 50 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdt=
p-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipe=
s-connectivity/bluez5/bluez5.inc
>> index d857c23a57..169269d377 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -76,6 +76,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/blu=
ez-${PV}.tar.xz \
>>              file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-valu=
e-no.patch    \
>>              file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-liste=
ners.patch \
>>              file://0001-adapter-restrict-delta-0-RSSI-to-proximity-fi=
lters.patch \
>> +           file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.pa=
tch \
>>              "
>>   S =3D "${UNPACKDIR}/bluez-${PV}"
>>  =20
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-er=
ror-handling-for-AVDTP_OPEN-cmd.patch b/meta/recipes-connectivity/bluez5/=
bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
>> new file mode 100644
>> index 0000000000..0d346a2258
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-han=
dling-for-AVDTP_OPEN-cmd.patch
>> @@ -0,0 +1,49 @@
>> +From 4e0aba5a8ebd969b68cd3442e9f8066a4b15a366 Mon Sep 17 00:00:00 200=
1
>> +From: Simon Mikuda <simon.mikuda@streamunlimited.com>
>> +Date: Mon, 8 Jun 2026 13:29:23 +0200
>> +Subject: [PATCH] avdtp: Fix error handling for AVDTP_OPEN cmd
>> +
>> +We have to return BAD_STATE when local SEP is available instead of
>> +BAD_ACP_SEID.
>> +
>> +This fixes: AVDTP/SNK/ACP/SIG/SMG/BI-26-C
>> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/7c1c=
90f7b6d0f653c581878a039e2d02362f33f5]
>> +Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
>> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
>=20
> Hello,
>=20
> Simon Mikuda's SoB is not in the upstream commit.
> Please remove it.
>=20
> Regards,
I=E2=80=99ll remove it and send a V2 patch.

Thanks,
Jinwang
