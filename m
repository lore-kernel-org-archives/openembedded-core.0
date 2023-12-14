Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF77CC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 14:41:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.23852.1702564883958748202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 06:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=OoTvMGuV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BEDBcov030687;
	Thu, 14 Dec 2023 14:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bX36KkwrFRlh85pC1MXt12ZiToB1lHWOeLSu0uvM0nQ=; b=Oo
	TvMGuVXoFLImIwUWumlPa5CwKSAoeGvRGVf+g9BZH+VOUOTCtwAVA+sFRDm1YuFc
	DD5fxOoES1f2GEgGQ59fNhXT1hJtJ7YR2NpXn0043FpMi6fYhXVeTl51u9Zjy2mB
	jLD6X/tg4xrl0muz3e05rU/9pPa8XLRZUzfOzFVR89YJh6JkvYhFXfNFeiJtOflm
	c/bpeh5vmNCmpILhQNruOzqMJ6WEzvcm3l2iLQuocfaKTjhz2/rJlP/rIZ8pP0KZ
	r7Ev/tzfY2FUCiHUlkZET/Ok6uoiAH/wcw7fM9J9vWnQ1V6/KI0c0Ev0S132dpI2
	LkhLkLQyDYKyn3y3vlhA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uyqgt1gsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 14:41:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BEEfL0O031369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 14:41:21 GMT
Received: from [10.214.226.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Dec
 2023 06:41:19 -0800
Message-ID: <944c0685-ef03-4e58-bed6-30f888cef0b9@quicinc.com>
Date: Thu, 14 Dec 2023 20:11:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/2] systemd-boot: Add recipe to compile
 native
Content-Language: en-US
To: <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20231213115748.487216-1-quic_vkraleti@quicinc.com>
 <20231214080209d1f89221@mail.local>
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Organization: Qualcomm
In-Reply-To: <20231214080209d1f89221@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 60SXoPAZfP4BdiyIGhSBqbpmCc_i58Cn
X-Proofpoint-ORIG-GUID: 60SXoPAZfP4BdiyIGhSBqbpmCc_i58Cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192387



On 12/14/2023 1:32 PM, Alexandre Belloni via lists.openembedded.org wrote:
> Hello, this causes:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8617/steps/11/logs/warnings
> 
> WARNING: Nothing RPROVIDES 'python3-pefile-native' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)
> WARNING: Nothing RPROVIDES 'systemd-boot-native-dev' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)
> WARNING: Nothing RPROVIDES 'systemd-boot-native' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)
> 

Thanks for pointing.Uploaded a new patch-set to address these.
https://lists.openembedded.org/g/openembedded-core/message/192384

Some how in local build no warnings seen. Is there a way to run auto 
builder locally before submitting patches to avoid this?

> and:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6133/steps/14/logs/stdio
> 
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> systemd-boot-native (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb)
>
For updating maintainer, can I submit a change post patch acceptance?

> On 13/12/2023 17:27:47+0530, Viswanath Kraleti wrote:
>> systemd-boot native recipe provides ukify tool to build
>> UKI images for systemd-boot
>>
>> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
>> ---
>>   .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>>
>> diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>> new file mode 100644
>> index 0000000000..0cdd7e7045
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>> @@ -0,0 +1,15 @@
>> +require systemd.inc
>> +
>> +inherit native
>> +
>> +RRECOMMENDS:${PN} += "python3-pefile-native"
>> +
>> +COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
>> +
>> +do_configure[noexec] = "1"
>> +do_compile[noexec] = "1"
>> +
>> +do_install () {
>> +       install -d ${D}${bindir}
>> +       install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
>> +}
>> -- 
>> 2.25.1
>>
> 
>>
>>
>>
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192337): https://lists.openembedded.org/g/openembedded-core/message/192337
> Mute This Topic: https://lists.openembedded.org/mt/103147679/5192326
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quic_vkraleti@quicinc.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

