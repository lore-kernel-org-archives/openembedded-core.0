Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7522.1792574858605345166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=m/r8j8TY;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UYAn17/L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jinwang.li@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8mcLx671192
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c14C3FZ+2lFeMU8OXQUDcMeFcm3gLd90X0wSSBL1EmQ=; b=m/r8j8TYlPJx8lZw
	DMt0Ux62cxnlJ7J+rip7uoXgORLgfKJoOGotF9Lz+OgbfxK4o/4Y7WAG6LbGXLzW
	9oR8d/k7YHnnrmBW2Eh82WCkOD6it/RACKc2h/0xQcCfupgbx6SKvvCGBn8EfBru
	SOWO3ROzAu6F5akuaR2xWeeEVrRWiZGiWa+2FE01loPasaPmH749L1j1WClVjRcK
	ps54XyMC4N7JstKLvqX2pKHoD/RGeoAibQShgAvjOWBWVprW89zHiFdfdoWy3dfz
	7wirT4iiy4tFlnVDIQfUQBza51Ep3c7fxI6mJNbq3v/nbwzkkNLRBBWkj5MiH1sl
	Ky6Mzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk8h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:27:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f54f15b9eso124116085a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574856; x=1793179656; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c14C3FZ+2lFeMU8OXQUDcMeFcm3gLd90X0wSSBL1EmQ=;
        b=UYAn17/LL8QmUSBfLKgyUiW+4CtXTUfW7k6vs8BArzBruslS5gKEXVHLHjbF6QlRaZ
         Ok96mSw7UfE+nLJkp+wGgujLZBqSTJXIdZNhF102fE9pqjujGIoaCUTzOld5oEwM9qDQ
         BZyMTKtKr1SpsziVNBDvGtL04eixE6k+ALGi+gS4Cgg7vkaCC8IUNzPu6DsN1JsN8vkB
         BXGv0CtYUbtY6ofl16CtVeNIlX8faNJBBtv8vDWjOz6gO/KBUMkvlbxK3vpWL8PLPQHw
         8vIZk4nILX5ggjjzULI8vfCejgFBl5NJVPFrkHgfbD1Hcd0KVIVpd0WZ9WJu+VWKlgfr
         qqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574856; x=1793179656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c14C3FZ+2lFeMU8OXQUDcMeFcm3gLd90X0wSSBL1EmQ=;
        b=wjhXAerOyuCpceFO4GaHDB0zzYbuiaaBM4r0uxneqTLMEa9mIV/r5eeXZ1vEhpYQ5n
         rI5e7DM1nBrHNMo4R2dW8WmLmtuSVLEsW5k1iIkGwJep2hwU4wpDoFXk5qUF0ZF+eA9T
         3cIRv92VH+r0BiabvgSnuSYawe/GJiO2UgJBurW9nnj0gmxAM7Abhq64YJBC17UzQucZ
         O1EETgvu5GW3A86SfzDuYEMiOWEtdiQkyp0eoqGjrBhJJ/SKb7wqHSdu+fYp+FoJJukx
         evceCLNFv+PHIS6tWPlO6GGwFBhJ0yx3ETyjx5IC+fZYicpT2P2bWvHdXC97QobiZjDo
         Np1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlF6UneDg5zN/lR1aNeVUnfP9go2On+r3cuY7P2QPKZH/tD/dc81zigk6FpusIJziQN2ilz4yzzsNcf/+3WZYt4A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIga4qhJpTH+sRc2FzECYgu3/R3Uj2UM0o3yZUhDCeQBrI6IKym
	Ft+C1aGylL2oboOHzquI9Zi8EnWOIBrhqoCjQTepDqAu5VRTg7DdWGTbgladIdI3O7Q2t7hzKTL
	K9t5KTuGa19+GcQrDsLRExx1aLWLeipImylWafm7vDCxtbMsZTRSad70d6HOuywVH989tT/BytL
	HijPCwQlI=
X-Gm-Gg: AYBFou2OlVhhUF/WVXOxM2yx6RWrVdyOXJfd8klBQUR/FkTXcJJsbHmMUpjTiY9A9LI
	2ddqJZFR2M3NxQhgySndf/kD8R9ozvxNtuwYjGjgEbTI578LqlUgEPBrOqhuOpUbEcySOMUPu6P
	Tvn9SyUsABnzs6ZB7d8HojNGo5Rru4J6ASnK4IuXYZXMYkd+yenKIcxQLu3DJjRun2c1cP+oua3
	vnn2RLukkVNYLrBrsVpFHxC8TtZ0mr5PdbPk69ZmhnwFQYTuT4MhxAO+RjBgP9YmMSzHHpoJqHl
	Syv12YrZm49d4y0jF9zkD7mecyz9PomQ8l2KQsSDVtNE3fdrwJo4sUMwBI7r1Va8GSu3Ix4Enlm
	clU1uPuzjOJw5cyldGYSq/OkIm9zWfTVrRoU5/Ii8HUDczZFh+6u0Cr8WnA==
X-Received: by 2002:a05:620a:6084:b0:93f:2eaf:64d6 with SMTP id af79cd13be357-93f57f3c248mr314838685a.48.1792574856546;
        Wed, 21 Oct 2026 02:27:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:2eaf:64d6 with SMTP id af79cd13be357-93f57f3c248mr314832685a.48.1792574855404;
        Wed, 21 Oct 2026 02:27:35 -0700 (PDT)
Received: from [10.111.174.166] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d98577sm205155985a.9.2026.10.21.02.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:27:34 -0700 (PDT)
Message-ID: <6f8cb2bb-93bc-48d1-93b8-cf62b7e44322@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:27:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH 5/5] bluez5: Fix u128_to_string
 skipping data[4]
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-6-jinwang.li@oss.qualcomm.com>
 <DM9I7ZIVXXOH.17QJPV8LCW8QO@smile.fr>
Content-Language: en-US
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
In-Reply-To: <DM9I7ZIVXXOH.17QJPV8LCW8QO@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX9paTXIiF+d53
 3WMCl/dPvGisgHNwIay5HCRctvq5wN/QQcgtvAon9cY0hwrS+jAGQ7jgJodLXQh7Bfym541kqdy
 PAlZea7Cq7Oa5WeqCjJ2xV9UEgrVIK490yOZQsEUltRipr6aeowSrsreJ4hkaREwnDUSv+hrV4m
 HRyGhYZS7RDkYVErrDUk1OkuQ3Cnh/PpTSzxyX3buPQIy/SOw5qBTnXwXLw8257Fr4azk3wNnwe
 xlibPzWucProP7tt8APrzkDlLDZSUPDnpasFRTsLKYZvEO1cfZidM0GmQOsiqWX355oW7lIkTPV
 8Jb+MwjyHhJdcqoMiKV4ykQ4PBXCm8L278yxYJ6+eV0ksqZKLI3KcG1572ty3PEdnXCKNvYmNl/
 fyRkafm+oS5QEDRAAeLu3jbitobcCZdqVW7S3Pv0WAzN2v27OSSsCphIk0K5wVjGz4ioq8qSN0Y
 3KKEsVqeKuO4b+RpneQ==
X-Proofpoint-GUID: phQzcSWRd2J2ZkJsuXNeyGQqzGmEgwec
X-Proofpoint-ORIG-GUID: phQzcSWRd2J2ZkJsuXNeyGQqzGmEgwec
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX2R+hHVP9BpXC
 d0piAjCIi4s3YuHhssBlHIo7TV5N5seiZXswUL1yRSYvjAQMdjWbAzL8eNWd1ght0kSHC1rduNh
 dVrvn1h8NyEwFW0nHecJILOPSy3Hn9A=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad88589 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=2ElInBvYMDjajuD_gh0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248379



On 10/20/2026 3:58 PM, Yoann Congal wrote:
> On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.org wrote:
>> data[3] was used twice, skipping data[4] in the output string.
>>
>> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
>> ---
>>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>>   ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++++++++
>>   2 files changed, 34 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index db650acdd0..75d76cf96d 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -80,6 +80,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>>              file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
>>              file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
>>              file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
>> +           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
>>              "
>>   S = "${UNPACKDIR}/bluez-${PV}"
>>   
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
>> new file mode 100644
>> index 0000000000..338bc228c1
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
>> @@ -0,0 +1,33 @@
>> +From 198f4e0785644cea2b2154b383fc4ad354707947 Mon Sep 17 00:00:00 2001
>> +From: Jinwang Li <jinwang.li@oss.qualcomm.com>
>> +Date: Wed, 23 Sep 2026 11:29:57 +0800
>> +Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
>> +
>> +u128_to_string uses data[3] twice causing data[4] to be skipped and
>> +DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
>> +be printed with wrong values.
>> +
>> +Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
>> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/8b4a4176063831476bc9244d20f43b552e4b5554]
>> +Assisted-by: opencode:claude-sonnet-5
>> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> Hello,
> 
> Is that commit included in master and blacksail? If not, can you send
> the needed upgrades/backports so I can merge this here?
> 
> Thanks!
This commit is already merged into the OE-Core master and blacksail.

Thanks,
Jinwang
