Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0E4C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 04:14:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.7695.1739333639487192632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 20:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=peuw/LFj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BGed5d006184;
	Wed, 12 Feb 2025 04:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T57nxood88ZmS9MCkDL65Y422WLWAh0qJ72s54aoS0o=; b=peuw/LFjpa4pgY1N
	mVoD7B0r5jY3sVcHuIGqEqBuSeC3SGsNqaGTLimmjTgtqgsiTA+SZSRhGt9F6MRF
	ejHF0ni5Jhz9VQF359r1qRHZW+KmiYPH3qaBwrUNgGF3GyJAKSoeTLLi7mkvThMQ
	nEoH27p07xoKFQlHmBMaNyaY18uR4Ze0JpNtOvXjyWa1I2uixvMPV2eIN6vaSom3
	qSmTmae/PzMkIcwboZr10w8L5aBGtyvcjsEVcPgqLZN+KD7JMtEMaFE5d7ehbxEp
	z+zB1wJ2DzqZQXYomKcwlxPtcbBPM2nyNmq4OrDno3oACHMoWT4+mUyjeGkUX+aI
	loDVpw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mx7hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 04:13:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C4DuDl019257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 04:13:56 GMT
Received: from [10.216.34.210] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 20:13:54 -0800
Message-ID: <939d34c0-9c5a-4339-a74c-013263240dc1@quicinc.com>
Date: Wed, 12 Feb 2025 09:43:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: upgrade 20250109 -> 20250211
To: <dbaryshkov@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20250211185151.995828-1-quic_vpuar@quicinc.com>
 <CAA8EJpr+ffQvF0DaA5YHS43=_goPtheRE8y9mLCDUfgFH9MiZg@mail.gmail.com>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <CAA8EJpr+ffQvF0DaA5YHS43=_goPtheRE8y9mLCDUfgFH9MiZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NrG3g5td0lyqGHYkr2spNDab2zJ-bjIz
X-Proofpoint-ORIG-GUID: NrG3g5td0lyqGHYkr2spNDab2zJ-bjIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_01,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 04:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211201

Sure will cover all and send the patch.
I was going to upload a new patch covering them.


On 2/12/2025 2:53 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> On Tue, 11 Feb 2025 at 20:52, Vivek Puar <quic_vpuar@quicinc.com> wrote:
>
>> License-Update: additional files
> Not only "additional files", there is a new Qualcomm licence, which is
> not caught by this patch, NAK
>
> While taking care of the new Qualcomm licence, please also note new
> ath*, qca and qcom/ firmware. Please extend corresponding split
> packages.
>
>> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   ...{linux-firmware_20250109.bb => linux-firmware_20250211.bb} | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (99%)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
>> similarity index 99%
>> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
>> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
>> index b932300742..6cadf99d47 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
>> @@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>>                       "
>>   # WHENCE checksum is defined separately to ease overriding it if
>>   # class-devupstream is selected.
>> -WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
>> +WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
>>
>>   # These are not common licenses, set NO_GENERIC_LICENSE for them
>>   # so that the license files will be copied from fetched source
>> @@ -247,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>>   # Pin this to the 20220509 release, override this in local.conf
>>   SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>>
>> -SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
>> +SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
>>
>>   inherit allarch
Regards,
Vivek
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211186): https://lists.openembedded.org/g/openembedded-core/message/211186
> Mute This Topic: https://lists.openembedded.org/mt/111128390/8903276
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quic_vpuar@quicinc.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

