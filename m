Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC85D0C5EF
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 09:12:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7874.1729847565648138018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 02:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=pHg4LZQU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P7Rmwv019971;
	Fri, 25 Oct 2024 09:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6U7eNAX8i0QOWUGxhCNgRhFzvgg1PS4RgUYMaHPKY8k=; b=pHg4LZQUhzcFdIZP
	J3xAcaHAB2QROuLGFziUeOAHeHhMetlXUntASgP3blS8jlpu8Bz1xiDcZNAGDQ5W
	T8xzVspy1XW2PZx8uybQckqmagj9O7wGCUYPiHupA75kyg+QAMnVXXMBdzjLbdGt
	GTmDnwsQb43HMam24T8E71niGzzpzZwp7WoRILaxq1cYn/Skyk6nlLddAAHrkOM5
	vRwp0QkgI1FGrpByTcg3L3W5LtmUE0h8c2d2oDNeEYbUwBOOdb5W6VCfJ7+KB74V
	6pDx5XlNl8LK64XYTHt7whj3aMkLKkIlOjtDy1seRq9NUUthAt8PhwUqslXpEPqc
	HY0jIA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g6y908vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 09:12:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P9CbPQ022788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 09:12:37 GMT
Received: from [10.214.230.128] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 02:12:35 -0700
Message-ID: <ae5bd3ea-1a13-46f6-86ce-becff60179ce@quicinc.com>
Date: Fri, 25 Oct 2024 14:42:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: Add
 qcom-qcm6490-{audio,compute} firmware packages
To: Quentin Schulz <quentin.schulz@cherry.de>,
        <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>
References: <1800D628AEFC88B9.4900@lists.openembedded.org>
 <de14a6e6-6f61-46bc-84fe-c8c198cbc857@quicinc.com>
 <e496e639-2061-499f-966f-eaff6421d62f@cherry.de>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <e496e639-2061-499f-966f-eaff6421d62f@cherry.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3_rRNq0i0-2n4Y3nvJ9F1KZ14BffE5dk
X-Proofpoint-ORIG-GUID: 3_rRNq0i0-2n4Y3nvJ9F1KZ14BffE5dk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=949 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206342

Hi Quentin,

Thank you for the response, I understand this and will keep in mind next 
time.

On 10/25/2024 2:17 PM, Quentin Schulz wrote:
> Hi Vivek,
>
> On 10/25/24 8:20 AM, Vivek Puar via lists.openembedded.org wrote:
>> Hi Richard,
>>
>> Can you please review this?
>>
>
> Please be patient, you literally gave the community one working day 
> (on European timezone) to review this. It's a bit fast to ping people, 
> especially on non-critical pieces of code like this one (non-critical 
> because this could be done in your own layer via a bbappend until it 
> gets merged upstream).
>
> Cheers,
> Quentin
Regards,
Vivek

