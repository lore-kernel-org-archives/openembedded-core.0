Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5133D13575
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 17:10:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.33623.1730049050557268001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 10:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Cbedkzcm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RH0I9V011839
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 17:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MX8iul3Q+K4sFcAxuT1RK+I1k7qehxDpe4kQ9QnouH4=; b=CbedkzcmM/vSUL0n
	YmHkTi64mzbjsQka4DNrMbj+f8Kegn+QyKQ0OWmkb9asB8zaMiJPkq268ZHbMFa/
	JF9v6QC1Uq2EK3j3VbzeEHtmrRadmQO4cxffEoDQZeJOJMkndWD4f88od2KZ79A9
	7XKOQuzTLbyDbi24KJfCAkBQsYSb/RLKVMDr31UUdm+qkOWDTE1SrkMO2aaY3cf6
	2pnNhBYaK02t6HlSokpUkNR4R2fuijQGPAwGam8sqOKedBeRgZLtTciqt37lp1lo
	wyO0sb2ZCi8SVSYAbBRSlOOJvokg0SIa6SsZEPYVT1+nSA/RKruAUvXrafn4ZC6P
	lXDrYg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgjp7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 17:10:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49RHAmoC013182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 17:10:48 GMT
Received: from [10.216.54.246] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 10:10:47 -0700
Message-ID: <2b9ba297-b61a-4e19-b2e2-011539eb7c16@quicinc.com>
Date: Sun, 27 Oct 2024 22:40:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: Add qcom-adreno-a663 package
To: <openembedded-core@lists.openembedded.org>
References: <18025E4B7CED4C8A.20159@lists.openembedded.org>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <18025E4B7CED4C8A.20159@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vI7yterXQP1iud8skUuPUL6JsL6jgNt4
X-Proofpoint-GUID: vI7yterXQP1iud8skUuPUL6JsL6jgNt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410270150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 17:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206409

Updating typo in commit message from A633 to A663.

On 10/27/2024 10:37 PM, Vivek Puar wrote:
> Adding new package containing firmware for Adreno
> A663 GPU
>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>   .../linux-firmware/linux-firmware_20241017.bb              | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> index 60d24efca4..9dcb0313a9 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> @@ -403,8 +403,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>                ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
>                ${PN}-qcom-vpu \
>                ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
> -             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
> -             ${PN}-qcom-adreno-g750 \
> +             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
> +             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
>                ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
>                ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
>                ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
> @@ -1431,6 +1431,7 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
> +LICENSE:${PN}-qcom-adreno-a663 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-adreno-g750 = "Firmware-qcom"
>   LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
> @@ -1485,6 +1486,7 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
>   FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
>   FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
>   FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
> +FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.* ${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
>   FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
>   FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
>   FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
> @@ -1535,6 +1537,7 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-adreno-g750 = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206408): https://lists.openembedded.org/g/openembedded-core/message/206408
> Mute This Topic: https://lists.openembedded.org/mt/109242791/8903276
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quic_vpuar@quicinc.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

