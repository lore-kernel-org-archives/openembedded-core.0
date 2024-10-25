Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90454D11701
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 06:20:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.5943.1729837209194805488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 23:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=ojC7hqxR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OL3VXo027195;
	Fri, 25 Oct 2024 06:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcL57u/bZyS22MP4bUaWE6nPRn7Krb3FdDNr1S2awKM=; b=ojC7hqxRwArJ6Q9n
	HQHwJFoHgCCF/NAkZkxwgWfPnMzkpY1yPuG1Inh+K88H5K20S9Fbyg09Cg+kyiVO
	drrUlg6ACogfB8eAGy+IJV+GsfEGNkYGQWy0dwps7R3rzCaP084M0mmreqIBXtQg
	pNkXhOm8igtmd5jAQH5cgNqsHr7+u3/v+JXrqgkEhKpqqC19NI7h4oANMaQE1VVj
	Gc+mu6IJYR5lPfj4wxHGsxJsBKCUEYRWxbtqdkupKCU3V87z9RhUIBUKuaaGnXxo
	Yw8wByZSCrdWlZG5jXHOVRuT7/UwarVynmou22MARNoBCJX3P2dKh0QtYpjQ81Ke
	8yweyw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wqxs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 06:20:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P6K6jh017136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 06:20:06 GMT
Received: from [10.214.230.128] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 23:20:05 -0700
Message-ID: <de14a6e6-6f61-46bc-84fe-c8c198cbc857@quicinc.com>
Date: Fri, 25 Oct 2024 11:50:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: Add
 qcom-qcm6490-{audio,compute} firmware packages
To: <openembedded-core@lists.openembedded.org>
References: <1800D628AEFC88B9.4900@lists.openembedded.org>
Content-Language: en-US
CC: <richard.purdie@linuxfoundation.org>
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <1800D628AEFC88B9.4900@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RdfmTdzCIl1fEwyf8_jcWnZc8uGv9hxJ
X-Proofpoint-ORIG-GUID: RdfmTdzCIl1fEwyf8_jcWnZc8uGv9hxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 06:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206337

Hi Richard,

Can you please review this?

On 10/22/2024 10:51 PM, Vivek Puar wrote:
> linux-firmware-qcom-qcm6490-{audio,compute} contains
> ADSP and CDSP firmware for qcom QCM6490 variant
>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>   .../linux-firmware/linux-firmware_20241017.bb          | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> index d18e7414db..60d24efca4 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> @@ -408,8 +408,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>                ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
>                ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
>                ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
> -             ${PN}-qcom-qrb4210-adreno ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute \
> -             ${PN}-qcom-qrb4210-modem \
> +             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
> +             ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
>                ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
>                ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
>                ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
> @@ -1442,6 +1442,8 @@ LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
>   LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
>   LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
>   LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
>   LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
>   LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
>   LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
> @@ -1494,6 +1496,8 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
>   FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
>   FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
>   FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
> +FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.*"
> +FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
>   FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
>   FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
>   FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
> @@ -1542,6 +1546,8 @@ RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
>   RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206170): https://lists.openembedded.org/g/openembedded-core/message/206170
> Mute This Topic: https://lists.openembedded.org/mt/109156111/8903276
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quic_vpuar@quicinc.com]
> -=-=-=-=-=-=-=-=-=-=-=-

Regards,

Vivek


