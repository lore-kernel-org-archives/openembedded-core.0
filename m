Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD72D111AD
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 05:54:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.51478.1730699655867314232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 21:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=AH5i/ZUl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3NoxBC032391;
	Mon, 4 Nov 2024 05:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7aXdJImHn5fQRxtZtsru6IuS
	/RKqFklsO4UpIVNyb1g=; b=AH5i/ZUlif5qBWnGOgUuz6fHpIRPzYM53bWuqNER
	/ApEWH9v7lkEexhgzv5hL4a8L5Hl14rM45MMnGMgLAohVC4ugRedLYY1cnNduIUt
	baYwxpXsiMaPJfnoCUNnCc8GbiXfCp/b3qcEyzFzBWwjddnMA/RlaczjnLLuxg8N
	I1H8Y9SRpQtJVEVbTp/SsRwZyd/y31WFlcbGZRKVlv040lEqq1JLjy49VHpiMmy4
	jU01LcppQ6dq47tJ9z5V4JpOD5bwJQm1Afkf/wO+5wyrpOmU3kxenA/b0MneM6x5
	nlgZFm5FjoF80MDqQ3fOFpzfwK7Kse5Nw5lqgmnNcY4Tgw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxu6ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 05:54:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A45sD4R028960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 05:54:13 GMT
Received: from [10.214.230.128] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 3 Nov 2024
 21:54:09 -0800
Content-Type: multipart/alternative;
	boundary="------------c3pse2hVTUgRyxqiL109bAGX"
Message-ID: <82858962-3722-4785-bc18-58e633b65b4b@quicinc.com>
Date: Mon, 4 Nov 2024 11:24:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: add new fw file to
 ${PN}-qcom-adreno-a660
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
        <nicolas.dechesne@oss.qualcomm.com>, <rsalveti@quicinc.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20241022172111.539206-1-quic_vpuar@quicinc.com>
 <CALT56yN9ySnEHEAXkGDmBOEFO3k2g9eA_J_4L9_bmFjJ8uss5Q@mail.gmail.com>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <CALT56yN9ySnEHEAXkGDmBOEFO3k2g9eA_J_4L9_bmFjJ8uss5Q@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JbJ8qwjxS6h6Y2lGxxxeZn2_SftAAv-g
X-Proofpoint-GUID: JbJ8qwjxS6h6Y2lGxxxeZn2_SftAAv-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206672

--------------c3pse2hVTUgRyxqiL109bAGX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

This will be taken care of in the future and such mistakes won't be 
repeated.

On 11/2/2024 2:46 AM, Dmitry Baryshkov wrote:
> On Tue, 22 Oct 2024 at 20:21, Vivek Puar via lists.openembedded.org
> <quic_vpuar=quicinc.com@lists.openembedded.org> wrote:
>> Extend the linux-firmware-qcom-adreno-a660 package
>> with gpu firmware file for qcom QCM6490 variant
> Could you please explain one thing: why can't you look around and copy
> the existing approach? MBN files are platform-dependent, so they
> should not go to the platform-independent qcom-adreno-aNNN packages.
> That's how all the rest of the platforms are handled, but for some
> reason you don't copy that design.
>
> Nico, Ricardo, could you please make sure that future linux-firmware
> recipe changes from the Qualcomm side getdmitry.baryshkov@linaro.org
> in CC list? I usually don't follow the mailing list closely, so I
> missed this.  I'll send a series to fix the issues with QCM6490 /
> QCS6490  but I'd really like to be able to prevent such invalid or
> half-baked solutions from hitting the repository in the future.
>
>> Signed-off-by: Vivek Puar<quic_vpuar@quicinc.com>
>> ---
>>   meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
>> index f40723cbca..d18e7414db 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
>> @@ -1482,7 +1482,7 @@ FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
>>   FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
>>   FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
>>   FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
>> -FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
>> +FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
>>   FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
>>   FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
>>   FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
>> --
>> 2.34.1

Regards,

Vivek

--------------c3pse2hVTUgRyxqiL109bAGX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Dmitry,</p>
    <p>This will be taken care of in the future and such mistakes won't
      be repeated.<br>
    </p>
    <div class="moz-cite-prefix">On 11/2/2024 2:46 AM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CALT56yN9ySnEHEAXkGDmBOEFO3k2g9eA_J_4L9_bmFjJ8uss5Q@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Tue, 22 Oct 2024 at 20:21, Vivek Puar via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:quic_vpuar=quicinc.com@lists.openembedded.org">&lt;quic_vpuar=quicinc.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Extend the linux-firmware-qcom-adreno-a660 package
with gpu firmware file for qcom QCM6490 variant
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Could you please explain one thing: why can't you look around and copy
the existing approach? MBN files are platform-dependent, so they
should not go to the platform-independent qcom-adreno-aNNN packages.
That's how all the rest of the platforms are handled, but for some
reason you don't copy that design.

Nico, Ricardo, could you please make sure that future linux-firmware
recipe changes from the Qualcomm side get <a class="moz-txt-link-abbreviated" href="mailto:dmitry.baryshkov@linaro.org">dmitry.baryshkov@linaro.org</a>
in CC list? I usually don't follow the mailing list closely, so I
missed this.  I'll send a series to fix the issues with QCM6490 /
QCS6490  but I'd really like to be able to prevent such invalid or
half-baked solutions from hitting the repository in the future.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Vivek Puar <a class="moz-txt-link-rfc2396E" href="mailto:quic_vpuar@quicinc.com">&lt;quic_vpuar@quicinc.com&gt;</a>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index f40723cbca..d18e7414db 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -1482,7 +1482,7 @@ FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
-FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
--
2.34.1
</pre>
      </blockquote>
    </blockquote>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Vivek
</span></p>
  </body>
</html>

--------------c3pse2hVTUgRyxqiL109bAGX--

