Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31A4C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:31:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7883.1739442697606510375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 02:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=gmM6HsBc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA73If000335;
	Thu, 13 Feb 2025 10:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FovRjtB6KwrN//ORN/HBTUyWJY0THC6hap6oaV+kioU=; b=gmM6HsBcSMP2w8h4
	Y6Cv0PA+Q39BgugGnagVgnO7kty3NhS/LgZzJ8U9gme7veONbOoYsrJ7dPnCRnTx
	6BjcQTm1WqYuWoNoDUGpS1n7SKr5ju4gXT7r9z/rvVV7//JURbAB98Lj6sWL/qNC
	RRzuQZkYz1eBfvI2G0qOrtFxBQkoAV3zh4St325X6RCzFNV0I76vVwKCk6csbgpM
	MflYwVfh3jvUPYp74+wnHHF0372Ae9qaOCRzV1IwxUwyzlGvfbTO3tffWYmCwXUe
	g3ICjBhixm+ZjF35dnnUaB4AjiBF0YLJVSw6/SiwZxlP6d+5Dqo/ffyf2t7tlKaZ
	LAS/OA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq002at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 10:31:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DAVY17028913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 10:31:34 GMT
Received: from [10.216.15.50] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 02:31:33 -0800
Message-ID: <d625ebd0-d44f-43b6-a7ae-f67844aa5c5e@quicinc.com>
Date: Thu, 13 Feb 2025 16:01:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] linux-firmware: upgrade 20250109 -> 20250211
To: <dbaryshkov@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20250213064618.1907931-1-quic_vpuar@quicinc.com>
 <brzznd6fgfndbawy75ylrpzbqwpuc5rg24v4xyc3fbdcrkiuzz@vx3ovob66wxn>
 <69ce9ddf-2c14-4857-919c-3ec4b23a0751@quicinc.com>
 <ncraxnrtqpnxbv35hnpuggckf7tgzixs3bsdsfpjxavbjkiswb@5yhok7verjni>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <ncraxnrtqpnxbv35hnpuggckf7tgzixs3bsdsfpjxavbjkiswb@5yhok7verjni>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f1iDWS704GU6gcqZ1cIrOLmYV-pV9o72
X-Proofpoint-ORIG-GUID: f1iDWS704GU6gcqZ1cIrOLmYV-pV9o72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 10:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211320

On 2/13/2025 3:50 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> On Thu, Feb 13, 2025 at 03:38:14PM +0530, Vivek Puar wrote:
>> On 2/13/2025 3:29 PM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 13, 2025 at 12:16:18PM +0530, Vivek Puar wrote:
>>>> Add DSP firmware for Qualcomm SA8775P / QCS9100
>>>> platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
>>>> packages, and updating it with correct license information.
>>>>
>>>> Add QCA6698AQ package ${PN}-ath11k-qca6698aq
>>>> to ath11k firmware.
>>>>
>>>> Add bluetooth WCN3950 package ${PN}-qca-wcn3950,
>>>> bluetooth QCA6698 package ${PN}-qca-qca6698
>>>> to qca firmware.
>>>>
>>>> Add two more WCN3950 1.3 NVM files to
>>>> ${PN}-qca-wcn3950 package.
>>>>
>>>> Add device specific ath11k firmware to QCM6490
>>>> boards in ${PN}-qcom-qcm6490-wifi package.
>>>>
>>>> Add Firmware files for Lenovo T14s G6 Qualcomm platform
>>>> to ${PN}-qcom-x1e80100-lenovo-t14s-g6-{adreno, audio, compute}
>>>> packages.
>>>>
>>>> License-Update: additional files
>>>>
>>>> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    ...20250109.bb => linux-firmware_20250211.bb} | 68 +++++++++++++++++--
>>>>    1 file changed, 63 insertions(+), 5 deletions(-)
>>>>    rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (96%)
>>>>
>>>> @@ -1861,6 +1904,10 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
>>>>    FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
>>>>    FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
>>>>    FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
>>>> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat = "${nonarch_base_libdir}/firmware/qcom/21N1"
>>> Nit: this is unused and not required for T14. The rest LGTM.
>> Should "FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat" be removed or
> Yes. There is nothing to be compatible with.
>
> Nevertheless, this patch is in master-next. Unless RP drops it, I'd
> suggest sending a simple fixup on top of it.
Sure, will remove ${PN}-qcom-x1e80100-lenovo-t14s-g6-compat on top of 
the change.

Regards,
Vivek


