Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75ADCC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 10:48:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.29978.1701168524828075566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 02:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=NFpdptcB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASAc78s014253;
	Tue, 28 Nov 2023 10:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YZszArH+RywE0RjuxEZ5FdqK5xOBxS1F5uRI3kb5ytE=;
 b=NFpdptcBaZ18LG/crQAZMXDtqcwzW6PdY5JkH2MA7MoQR1ZKForLkb4BZl3f2XB1KGKf
 rC2f+FKmfSaW7hzM3/pM8Nd08Iuf8/Nlij/G5iAq2L5x52LW+URFDKvJq+ypoM2Ictbh
 Aqdb6Dr9U95ub1n2RdslI0HKtuS9bYbHY+++FpZ45R/OaT//eeqgOWkQn0u6icReOv59
 h3bCMjD3aR3OVQknZPOFbWzNd2wl2MfAPqBvSPd6yf/rf/9F+Sx9ZweXQ0QkE6XYuYJi
 OGBS5nVs6GR+4Tildh8FAanOR7jL425FerKGN2a7yf+0bXScRrrh2Mfx5Sp6hjh4tmeX GA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unekyg0p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 10:48:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASAmgOB019953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 10:48:42 GMT
Received: from [10.214.226.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 02:48:40 -0800
Message-ID: <41999db7-47e3-4ba7-b184-dadad299c368@quicinc.com>
Date: Tue, 28 Nov 2023 16:18:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH v2] systemd-boot: fix
 build issues on armv7a-linux
Content-Language: en-US
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
        Patchtest
	<patchtest@automation.yoctoproject.org>
CC: <openembedded-core@lists.openembedded.org>
References: <0101018c10fc33e6-6df3ff32-13c7-48ff-aac3-24978e69be2a-000000@us-west-2.amazonses.com>
 <CALT56yOkiWRvEh1nJOXrZ+JRLc+L2CO5rqxUe6o7q2yanU41=A@mail.gmail.com>
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CALT56yOkiWRvEh1nJOXrZ+JRLc+L2CO5rqxUe6o7q2yanU41=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QEUlJsNQdVWvU3fnfx-hOIY38jg8XQSe
X-Proofpoint-ORIG-GUID: QEUlJsNQdVWvU3fnfx-hOIY38jg8XQSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_10,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=859
 mlxscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 10:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191358

I figured it by running patchtest. S-o-B trailer missing in .patch. I am 
updating it.

On 11/28/2023 4:15 PM, Dmitry Baryshkov wrote:
> not know, which tests have failed, there
> is no way to fix the issue.

