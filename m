Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7511.1792574816850761330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Enyji/R8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=McHEbVsH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jinwang.li@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j64a3356102
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LuauwcVfnixO9oZF+bV4uFnzcE2kn65bzy0vh7dSm0=; b=Enyji/R8kb/4+KrK
	cnAqrZ7U+mHEVwCtZ3GPCu0vlLLhtgZm2h4hwuduhyFamkhSHhE471Kboe9aQr33
	eTrTYeqyUpVXTzgyH0yjZJEg8W4aRzDSjkuBfvhHhsKJXc7X5IBYYnJ3B4WuL8sH
	YsHr+EUPVUyJl/vowNQy1fTEmCrIyRCytS5EJ6RZ3zlfhRMCIU/DfBY/GEJTGkCS
	veCO2qUJw2yaq9hXpi3AsnQYxPvslLTMlFk7bkK4/R4h+D5YuVFUhXtdjMs8IKw8
	lZRW0HeoV+wBpw49sjj6/q2lLJv9egdtxXOYQVNflL50aUgF4WnVQLwVixeCI9m0
	sF90Iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0k7wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:26:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso111768385a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 02:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574815; x=1793179615; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LuauwcVfnixO9oZF+bV4uFnzcE2kn65bzy0vh7dSm0=;
        b=McHEbVsHI7OFQDwcqb+7drZoHMmBhC5BPSF9xSXOCiGOyVoguYOV/pjdVvq6EFiAoK
         Qkh6haKBeJjFhQGczKNwM6fUBi28GsDbIysfH2GdjMbjU4lT83pge/eV0jT1lhSemEA2
         qntLZtmKFmS5AeKUXi4zyoUeWSArPdDG/IaUO8UKJ6EkvEKhJB+FgC+kk7rmNyPOXSe4
         mQQszAIKDB4Ycr2fifzTYD6BWpIwNxwMWdXGjjt7+a78YnQxoUATnHWy64Ygac4NeI5K
         s32Srxaid8lDxijuorlYIWzlEu9W5ZtBEjKdvqZ0fmD4deKAikSrLucyGHnHfIk1Hmog
         gm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574815; x=1793179615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LuauwcVfnixO9oZF+bV4uFnzcE2kn65bzy0vh7dSm0=;
        b=g2DNIZlyBuHkqW8Lta4hTEYUs4m9GYfXu5vBGapmyJgISjIv/+F6YWIzk/CduPNaye
         pR585JiwNDYW0A8YWuNG6wswj+CdXAk6WZdyALfUMQcY1Ql+lh1MHvHjeU5Kj4AhUTP9
         sl1s8UtDMwQ6ICUMCQB6a0pMiXKj+sB6h3wNy4M+GrwOVM4dzXlrKHW4uOQee+0904pB
         8G6GbCmRuuj4P6oe41FP/bEQGsIG7eNyWT0183hH/vK3kORuj9zl+/UB0QqXLDSM6+76
         rTZDS3/Pkc13WXus1p77Hmbla1LkGM0Fjzs3JYJrPEDjgSe+8icSIVI52b+1CII3lmV6
         SeeA==
X-Forwarded-Encrypted: i=1; AKwUvBwcGzEWa7BnAoWcMciuuQrmkqYKHwBQRLtSZAZbYdrkHvUwMkJHPVKdhuqf8jh7jNMABjyOsgcmh1xqP4cY/SAIdQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKJeM9q4YcKu8W/Xm4HuYbD6rgmSGmRZbHS2XvuO6I0QbSprbKO
	4hSp3JAXf98ORdL+tGyh7XovaiZY586b/kzvGs+64LGX5J1jFX8AEmp1E1Wblr7MNogWuV22QPj
	q7FqhCXHMV0NBwek98DWgnGmFq/XrcTumiMZAb+pwCyDBvYmdz7QjI7mzL4N5XVYfng58fc5bDX
	Ls1cuK3/Q=
X-Gm-Gg: AYBFou1KZGRziE/7r2S2pcw6ZIUlN9QhqGHi893gyUwqc1ljepR2EAjpCgX+yJjsHyj
	EsbzK2/JdkDVM1sipe6+/As8ZbEVblfyio8rL6KfpzcqOaASwuHpkyaQ5BZDbNjcYOF6KVNxIpM
	/unwvv5SYJhgP7Mqg6i7AJV//4TAP1WE0IuLkp2PYMvQ0//7S63nNVXnpu3p81OEE9kjjBAwc5y
	uIz39c1PTttSn8gWHqW8bGEt+R1JCz1EWmlqSbWd/k/2a7Mw9unPIDyUPfUpmh7HI+gB84SIHP8
	Hi1zAfTyz5RPlv2D7WeMMPElllv6WqjqN148pui636ZUHr3Pju7nIitPu0fmetg7cJwXtlRn99t
	c7idD47DQd9dbR+WcRoREc4OVcPUwtr6yYBiYnNXMwxfiFHjtSMEX5ZaFTg==
X-Received: by 2002:a05:620a:444b:b0:93a:1b82:4962 with SMTP id af79cd13be357-93f57f6767dmr321287585a.47.1792574814741;
        Wed, 21 Oct 2026 02:26:54 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93a:1b82:4962 with SMTP id af79cd13be357-93f57f6767dmr321284985a.47.1792574814245;
        Wed, 21 Oct 2026 02:26:54 -0700 (PDT)
Received: from [10.111.174.166] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56df222dsm205906285a.26.2026.10.21.02.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:26:53 -0700 (PDT)
Message-ID: <7d5eb0cf-6559-4598-affd-f8c7f8058329@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:26:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH 4/5] bluez5: Fix ABORT response being
 discarded
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-5-jinwang.li@oss.qualcomm.com>
 <DM9I7SSWHOKE.TOUEIMFGVMET@smile.fr>
Content-Language: en-US
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
In-Reply-To: <DM9I7SSWHOKE.TOUEIMFGVMET@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX9hN1RioEBD61
 um3zwTE3yKIoNJV7LhnryAwu5ZvHS1fmL6grtYZBDVzUaqplaLaPcg0zz1WZ+I17rjZJn80SLaq
 reWFHLW80hPiXLs3OPb0tLij/HlkxlpT/nsbDEx6SXQTH/ANcVsq4Qe6giiCLO5ZxSuj40KHhsF
 95Jgt3+5nD5Og1B2odYywUX/WcXt7wV37VjbMQhX+0dmIKf/UYlycNMWt+b1Lusb5uJtlbTxJ8n
 9LuSTaB8KrEPQ7nQI5oeXGykXhizf9x/VGW2CVrHr/DwjJn9X7W3N2bU6YB+Lg/s+JCCnjR1AoQ
 678zNSodUJKqePS2R+TlIbsx0c6Dha+lVtUpMqws92vqBw1dnnKuX1G6aBPicA0xPEloWmskWZr
 bTTuE2i65IzpLRc+KCOh6EqOfcAqo/Z4jrf1HrmEbAlmdzDl3CLjxpdijCW45ASSfAglOb6jIO6
 MvTyE9ZJi3/nlrM1Dog==
X-Proofpoint-ORIG-GUID: d83aeaow591ofMtd-x_JyYk53Z0qx3Lo
X-Proofpoint-GUID: d83aeaow591ofMtd-x_JyYk53Z0qx3Lo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX3iLFa/XDUBY6
 1CMczf/zsQM46jK2OuznWT4GHSmbbwqcemPWwtfUiV3UI7Wm/tuNzqF7RTTD+CFjeccmgAwTasH
 3lHvzYi7LaoG87z8VZhV5R78QRlBL50=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8855f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=2ElInBvYMDjajuD_gh0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248378



On 10/20/2026 3:57 PM, Yoann Congal wrote:
> On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.org wrote:
>> Send the ABORT response after transfer_complete(), since it clears
>> the pending tx queue and was discarding the response first.
>>
>> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
>> ---
>>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>>   ...x-Fix-ABORT-response-being-discarded.patch | 44 +++++++++++++++++++
>>   2 files changed, 45 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index de9835e5a7..db650acdd0 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -79,6 +79,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>>              file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
>>              file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
>>              file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
>> +           file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
>>              "
>>   S = "${UNPACKDIR}/bluez-${PV}"
>>   
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
>> new file mode 100644
>> index 0000000000..5c0d7414ee
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
>> @@ -0,0 +1,44 @@
>> +From 38a88cc433e0bc3cccb6dab126e484fc06ccd8bb Mon Sep 17 00:00:00 2001
>> +From: Jinwang Li <jinwang.li@oss.qualcomm.com>
>> +Date: Thu, 27 Aug 2026 16:36:51 +0800
>> +Subject: [PATCH] gobex: Fix ABORT response being discarded
>> +
>> +g_obex_drop_tx_queue() in transfer_complete() clears any pending tx,
>> +so the ABORT success response should be enqueued after transfer_complete().
>> +
>> +Fixes the following PTS test cases:
>> +- OPP/SR/OPH/BV-27-I
>> +- FTP/SR/OTR/BV-02-C
>> +- PBAP/PSE/PDF/BV-06-I
>> +- PBAP/PSE/PBF/BV-03-I
>> +
>> +Fixes: 7a35c12a6ceb ("gobex: Fix segfault caused by interrupted transfer")
>> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/d094be10ff0cc9d48714d35557e0fd297f36f907]
>> +Assisted-by: Claude:claude-sonnet-5
>> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> 
> Hello,
> 
> Is that commit included in master and blacksail? If not, can you send
> the needed upgrades/backports so I can merge this here?
> 
> Thanks!
This commit is already merged into the OE-Core master and blacksail.

Thanks,
Jinwang
