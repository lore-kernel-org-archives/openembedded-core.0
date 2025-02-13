Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9393AC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:08:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7721.1739441300559319493
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 02:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=IImfSR4h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D05d3U002191;
	Thu, 13 Feb 2025 10:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2h6S0uGj48MAUhW3nUSR31zEYmN5jGqgwjd7jPCGvLI=; b=IImfSR4h6Z6jhz0z
	6LrIC3Ubo6Q7ku+JzioctrCtdMVyJQ/uh1XiLeFDVv7Q6EPltsVAfsL9sCT423sU
	uYp3DsPYn1/uKnesX2k6w3WEtHdNxNFEnapX4m5WbquZ1A6fQs1yd5Ty9XhmWa0A
	j1wZNrG8HLIjjjxeOu2Gbf/sTTlfXHhJ5pDqg6ncBH4QuhejrIzWHs3DDSBtpBe/
	aHorKV8YJnSW4ua316r5Ex6E00KhIkxz2W1vsm+GROgslG/Z22vj5zcjRJUDykvp
	Dk4h+Az2/W3D6CTaC/MbnqBlyrf+sne2VAcJMjF+lmYxbsl2KrKyhag/sfANVaBj
	gW8H9w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w49ayr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 10:08:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DA8IQo019424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 10:08:18 GMT
Received: from [10.216.15.50] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 02:08:17 -0800
Message-ID: <69ce9ddf-2c14-4857-919c-3ec4b23a0751@quicinc.com>
Date: Thu, 13 Feb 2025 15:38:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] linux-firmware: upgrade 20250109 -> 20250211
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <openembedded-core@lists.openembedded.org>
References: <20250213064618.1907931-1-quic_vpuar@quicinc.com>
 <brzznd6fgfndbawy75ylrpzbqwpuc5rg24v4xyc3fbdcrkiuzz@vx3ovob66wxn>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <brzznd6fgfndbawy75ylrpzbqwpuc5rg24v4xyc3fbdcrkiuzz@vx3ovob66wxn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _PWGIkH3bKGMdv3RI9CQT7FzagEpmv5n
X-Proofpoint-ORIG-GUID: _PWGIkH3bKGMdv3RI9CQT7FzagEpmv5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=887 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 10:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211317

On 2/13/2025 3:29 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 13, 2025 at 12:16:18PM +0530, Vivek Puar wrote:
>> Add DSP firmware for Qualcomm SA8775P / QCS9100
>> platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
>> packages, and updating it with correct license information.
>>
>> Add QCA6698AQ package ${PN}-ath11k-qca6698aq
>> to ath11k firmware.
>>
>> Add bluetooth WCN3950 package ${PN}-qca-wcn3950,
>> bluetooth QCA6698 package ${PN}-qca-qca6698
>> to qca firmware.
>>
>> Add two more WCN3950 1.3 NVM files to
>> ${PN}-qca-wcn3950 package.
>>
>> Add device specific ath11k firmware to QCM6490
>> boards in ${PN}-qcom-qcm6490-wifi package.
>>
>> Add Firmware files for Lenovo T14s G6 Qualcomm platform
>> to ${PN}-qcom-x1e80100-lenovo-t14s-g6-{adreno, audio, compute}
>> packages.
>>
>> License-Update: additional files
>>
>> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   ...20250109.bb => linux-firmware_20250211.bb} | 68 +++++++++++++++++--
>>   1 file changed, 63 insertions(+), 5 deletions(-)
>>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (96%)
>>
>> @@ -1861,6 +1904,10 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
>>   FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
>>   FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
>>   FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
>> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat = "${nonarch_base_libdir}/firmware/qcom/21N1"
> Nit: this is unused and not required for T14. The rest LGTM.
Should "FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat" be removed or 
${PN}-qcom-x1e80100-lenovo-t14s-g6-compat is not required for T14sand 
only keep${PN}-qcom-x1e80100-lenovo-t14s-g6-{adreno, audio, compute} 
packages?
>> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
>> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn*"
>> +FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
>>   
>>   RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
>>   RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"
Regards,
Vivek

