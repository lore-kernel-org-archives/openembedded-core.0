Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F32D116FE
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 06:19:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.5959.1729837159507570249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 23:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Vzxs86KE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ONIkXh031244;
	Fri, 25 Oct 2024 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNx7bQmpKt0TjzBxs+Qt5iSbruLShh1CUYaQ2kBNp0I=; b=Vzxs86KELxij1OD3
	lgKpmsKQdxLW2QZ1JnI1rCtxAk2NGf5DgsmiRMzRPAqVZSbIYu2aCZSvmvkHugqJ
	FDZiiA2lw3Dnd5cL1s+BDf7LRKtAOSmGlnQHyKk1pbUE9J6a/he9KiVYmpATUTq1
	1zUCMh39dH9yQFVzxX7EJREafH9DU6tk16CytYSTDXgBg+gWxqCMBlttpU/mpjOR
	927wRR7vV3ptodUmAgD4m5zAupCugMZ4E6xer/cI+dMIyXrFLTWmWG/Lu5gR75PI
	EgSQ4DLHT2eLhBUWrXMWlGkE+CQe9oP27wFXC8CdLHAoufBTMYbrhre6w+umCeZK
	q3MZOg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xqy2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 06:19:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P6JGop015351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 06:19:16 GMT
Received: from [10.214.230.128] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 23:19:15 -0700
Message-ID: <aff3ee2d-47c2-4c2e-98f6-341633e15017@quicinc.com>
Date: Fri, 25 Oct 2024 11:49:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: add new fw file to
 ${PN}-qcom-adreno-a660
To: <openembedded-core@lists.openembedded.org>
References: <1800D621E53B4940.29859@lists.openembedded.org>
Content-Language: en-US
CC: <richard.purdie@linuxfoundation.org>
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <1800D621E53B4940.29859@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i1tizkzHNpRWF7wNCbU68EegSuyaa9OW
X-Proofpoint-ORIG-GUID: i1tizkzHNpRWF7wNCbU68EegSuyaa9OW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 06:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206336

Hi Richard,

Can you please review this?

On 10/22/2024 10:51 PM, Vivek Puar wrote:
> Extend the linux-firmware-qcom-adreno-a660 package
> with gpu firmware file for qcom QCM6490 variant
>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>   meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> index f40723cbca..d18e7414db 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> @@ -1482,7 +1482,7 @@ FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
>   FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
>   FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
>   FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
> -FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
> +FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
>   FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
>   FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
>   FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206169): https://lists.openembedded.org/g/openembedded-core/message/206169
> Mute This Topic: https://lists.openembedded.org/mt/109156102/8903276
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quic_vpuar@quicinc.com]
> -=-=-=-=-=-=-=-=-=-=-=-

Regards,

Vivek


