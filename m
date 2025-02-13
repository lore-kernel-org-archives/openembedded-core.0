Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E0AC02198
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 02:41:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.2669.1739414474767710471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 18:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=X+PB+tVf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D05gO6002731;
	Thu, 13 Feb 2025 02:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DHyCnslXGu55Bs1lctEn67eL
	/NALmDpmXwnOpq9216Q=; b=X+PB+tVfQ8ljaH3j2co6ONgl/LStPgcSyN2ayKTC
	qq/aL3yAnHu4y/pJ4ebac+0/RhhrH5WTBsWhLcgMfEXoJ7rvXREGeGABmfsfTGCM
	h+A6UYV1XhhKJg4kgHNQ1M/9KYTGoEeyI9wB27xSbCzqISQY7WeX7kXwLKBrOGJf
	iLfscK6v9c15bCmweCWJxt4ZK0/cH9Phd2eSj02tDTyvBjcDFmXJL7XiwAc+Mv77
	nRza9D1klW+wJCpd+xDbRhc7wxcRCAqreA9NVhYtjf+iqaiVo2MzjY4dO1NQs5s8
	+JhdBQmzizVV1RpvUNUS4yA4enoFfvYOE9H513XLdgsFdw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w48a7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 02:41:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D2fC0R005913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 02:41:12 GMT
Received: from [10.216.15.50] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 18:41:10 -0800
Content-Type: multipart/alternative;
	boundary="------------O6RgB0dKvMPIzBLFIss0zW69"
Message-ID: <52ed2610-bd10-4f3b-999d-7d6afe08b772@quicinc.com>
Date: Thu, 13 Feb 2025 08:11:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] linux-firmware: upgrade 20250109 -> 20250211
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <openembedded-core@lists.openembedded.org>
References: <20250212174726.1533501-1-quic_vpuar@quicinc.com>
 <3euq5c44kceeu4uowy3xoom6mp7bfameofky24u5fecpsvj7jh@p4dbwfnpctci>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <3euq5c44kceeu4uowy3xoom6mp7bfameofky24u5fecpsvj7jh@p4dbwfnpctci>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x2IQbwABVNTEd3Hx5URus2sO9kIY-LkC
X-Proofpoint-ORIG-GUID: x2IQbwABVNTEd3Hx5URus2sO9kIY-LkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 02:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211286

--------------O6RgB0dKvMPIzBLFIss0zW69
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/2025 1:53 AM, Dmitry Baryshkov wrote:

> On Wed, Feb 12, 2025 at 11:17:26PM +0530, Vivek Puar wrote:
>> Add DSP firmware for Qualcomm SA8775P / QCS9100
>> platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
>> packages, and updating it with correct license information.
>>
>> Add QCA6698AQ package ${PN}-ath11k-qca6698aq
>> to ath11k firmware.
>>
>> Add bluetooth WCN3950 package ${PN}-qca-wcn3950
>> to qca firmware.
> You've missed several other files:
>
> $ dpkg-deb -c tmp-rpb/deploy/ipk/all/linux-firmware_20250211-r0_all.ipk | grep qcom
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcm6490/
> lrwxrwxrwx root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcm6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcs6490/
> lrwxrwxrwx root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcs6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/
> -rw-r--r-- root/root     73528 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf
> -rw-r--r-- root/root       697 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspr.jsn
> -rw-r--r-- root/root       536 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsps.jsn
> -rw-r--r-- root/root       731 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspua.jsn
> -rw-r--r-- root/root       537 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn
> -rw-r--r-- root/root     40760 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf
> -rw-r--r-- root/root       534 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdspr.jsn
> -rw-r--r-- root/root  22043064 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn
> -rw-r--r-- root/root   3072424 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn
> -rw-r--r-- root/root     12088 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn
>
> $ dpkg-deb -c tmp-rpb/deploy/ipk/all/linux-firmware-qca-misc_20250211-r0_all.ipk
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qca/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/
> -rw-r--r-- root/root    161716 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpbtfw21.tlv
> -rw-r--r-- root/root      6614 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.b206
> -rw-r--r-- root/root      6702 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.b207
> -rw-r--r-- root/root      6614 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.bin
> -rw-r--r-- root/root      1641 2025-02-10 14:55 ./usr/lib/firmware/qca/cmnv13s.bin
> -rw-r--r-- root/root      1641 2025-02-10 14:55 ./usr/lib/firmware/qca/cmnv13t.bin
Will add these files.
>> License-Update: additional files
>>
>> Signed-off-by: Vivek Puar<quic_vpuar@quicinc.com>
>> Cc: Dmitry Baryshkov<dmitry.baryshkov@linaro.org>
>> ---
>>   ...20250109.bb => linux-firmware_20250211.bb} | 36 ++++++++++++++++---
>>   1 file changed, 32 insertions(+), 4 deletions(-)
>>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (98%)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
>> similarity index 98%
>> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
>> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
>> index b932300742..e3a29a284f 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
>> @@ -55,6 +55,7 @@ LICENSE = "\
>>       & Firmware-powervr \
>>       & Firmware-qat \
>>       & Firmware-qcom \
>> +    & Firmware-qcom-2 \
>>       & Firmware-qcom-yamato \
>>       & Firmware-qla1280 \
>>       & Firmware-qla2xxx \
>> @@ -132,6 +133,7 @@ LIC_FILES_CHKSUM ="file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \ 
>> file://LICENSE.powervr;md5=83045ed2a2cda15b4eaff682c98c9533 \ 
>> file://LICENCE.qat_firmware;md5=72de83dfd9b87be7685ed099a39fbea4 \ 
>> file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \ + 
>> file://LICENSE.qcom-2;md5=165287851294f2fb8ac8cbc5e24b02b0 \ 
>> file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \ 
>> file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \ 
>> file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \ @@ 
>> -158,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>>                       "
>>   # WHENCE checksum is defined separately to ease overriding it if
>>   # class-devupstream is selected.
>> -WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
>> +WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
>>   
>>   # These are not common licenses, set NO_GENERIC_LICENSE for them
>>   # so that the license files will be copied from fetched source
>> @@ -212,6 +214,7 @@ NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
>>   NO_GENERIC_LICENSE[Firmware-powervr] = "LICENSE.powervr"
>>   NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
>>   NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
>> +NO_GENERIC_LICENSE[Firmware-qcom-2] = "LICENSE.qcom-2"
>>   NO_GENERIC_LICENSE[Firmware-qcom-yamato] = "LICENSE.qcom_yamato"
>>   NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
>>   NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
>> @@ -247,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>>   # Pin this to the 20220509 release, override this in local.conf
>>   SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>>   
>> -SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
>> +SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
> Applying: linux-firmware: upgrade 20250109 -> 20250211
> <PATH>/layers/openembedded-core/.git/rebase-apply/patch:51: trailing whitespace.
> SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
Will remove these whitespace warning.
>>   
>>   inherit allarch
>>   
Regards,
Vivek
--------------O6RgB0dKvMPIzBLFIss0zW69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 2/13/2025 1:53 AM, Dmitry Baryshkov wrote:</p>
    <blockquote type="cite"
cite="mid:3euq5c44kceeu4uowy3xoom6mp7bfameofky24u5fecpsvj7jh@p4dbwfnpctci">
      <pre wrap="" class="moz-quote-pre">On Wed, Feb 12, 2025 at 11:17:26PM +0530, Vivek Puar wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add DSP firmware for Qualcomm SA8775P / QCS9100
platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
packages, and updating it with correct license information.

Add QCA6698AQ package ${PN}-ath11k-qca6698aq
to ath11k firmware.

Add bluetooth WCN3950 package ${PN}-qca-wcn3950
to qca firmware.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You've missed several other files:

$ dpkg-deb -c tmp-rpb/deploy/ipk/all/linux-firmware_20250211-r0_all.ipk | grep qcom
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcm6490/
lrwxrwxrwx root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcm6490/wpss.mbn -&gt; ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcs6490/
lrwxrwxrwx root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcs6490/wpss.mbn -&gt; ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/
-rw-r--r-- root/root     73528 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf
-rw-r--r-- root/root       697 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspr.jsn
-rw-r--r-- root/root       536 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsps.jsn
-rw-r--r-- root/root       731 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspua.jsn
-rw-r--r-- root/root       537 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn
-rw-r--r-- root/root     40760 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf
-rw-r--r-- root/root       534 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdspr.jsn
-rw-r--r-- root/root  22043064 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn
-rw-r--r-- root/root   3072424 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn
-rw-r--r-- root/root     12088 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn

$ dpkg-deb -c tmp-rpb/deploy/ipk/all/linux-firmware-qca-misc_20250211-r0_all.ipk
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qca/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/
-rw-r--r-- root/root    161716 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpbtfw21.tlv
-rw-r--r-- root/root      6614 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.b206
-rw-r--r-- root/root      6702 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.b207
-rw-r--r-- root/root      6614 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.bin
-rw-r--r-- root/root      1641 2025-02-10 14:55 ./usr/lib/firmware/qca/cmnv13s.bin
-rw-r--r-- root/root      1641 2025-02-10 14:55 ./usr/lib/firmware/qca/cmnv13t.bin
</pre>
    </blockquote>
    Will add these files.<br>
    <blockquote type="cite"
cite="mid:3euq5c44kceeu4uowy3xoom6mp7bfameofky24u5fecpsvj7jh@p4dbwfnpctci">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
License-Update: additional files

Signed-off-by: Vivek Puar <a class="moz-txt-link-rfc2396E" href="mailto:quic_vpuar@quicinc.com">&lt;quic_vpuar@quicinc.com&gt;</a>
Cc: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@linaro.org">&lt;dmitry.baryshkov@linaro.org&gt;</a>
---
 ...20250109.bb =&gt; linux-firmware_20250211.bb} | 36 ++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb =&gt; linux-firmware_20250211.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index b932300742..e3a29a284f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -55,6 +55,7 @@ LICENSE = "\
     &amp; Firmware-powervr \
     &amp; Firmware-qat \
     &amp; Firmware-qcom \
+    &amp; Firmware-qcom-2 \
     &amp; Firmware-qcom-yamato \
     &amp; Firmware-qla1280 \
     &amp; Firmware-qla2xxx \
@@ -132,6 +133,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc\file://LICENSE.powervr;md5=83045ed2a2cda15b4eaff682c98c9533\file://LICENCE.qat_firmware;md5=72de83dfd9b87be7685ed099a39fbea4\file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b\+file://LICENSE.qcom-2;md5=165287851294f2fb8ac8cbc5e24b02b0\file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c\file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d\file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0\@@-158,7+160,7@@LIC_FILES_CHKSUM=">"file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.powervr;md5=83045ed2a2cda15b4eaff682c98c9533 \
                     file://LICENCE.qat_firmware;md5=72de83dfd9b87be7685ed099a39fbea4 \
                     file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
+                    file://LICENSE.qcom-2;md5=165287851294f2fb8ac8cbc5e24b02b0 \
                     file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \
                     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
                     file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
@@ -158,7 +160,7 @@ LIC_FILES_CHKSUM = "</a>file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
+WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,6 +214,7 @@ NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
 NO_GENERIC_LICENSE[Firmware-powervr] = "LICENSE.powervr"
 NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
 NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
+NO_GENERIC_LICENSE[Firmware-qcom-2] = "LICENSE.qcom-2"
 NO_GENERIC_LICENSE[Firmware-qcom-yamato] = "LICENSE.qcom_yamato"
 NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
 NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
@@ -247,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
+SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d" 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Applying: linux-firmware: upgrade 20250109 -&gt; 20250211
&lt;PATH&gt;/layers/openembedded-core/.git/rebase-apply/patch:51: trailing whitespace.
SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
</pre>
    </blockquote>
    Will remove these whitespace warning.<br>
    <blockquote type="cite"
cite="mid:3euq5c44kceeu4uowy3xoom6mp7bfameofky24u5fecpsvj7jh@p4dbwfnpctci">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 inherit allarch
 
</pre>
      </blockquote>
    </blockquote>
    <span style="white-space: pre-wrap">Regards,</span><br>
    <span style="white-space: pre-wrap">Vivek
</span>
  </body>
</html>

--------------O6RgB0dKvMPIzBLFIss0zW69--

