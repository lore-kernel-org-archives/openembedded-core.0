Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A38C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 07:10:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.9690.1739344251936056292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 23:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@quicinc.com header.s=qcppdkim1 header.b=iALk25ot;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C34Oef010521;
	Wed, 12 Feb 2025 07:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k9agXgHhYnDkYnya9GQ7zjrZ
	0xADvCdaDN38uIoSfbM=; b=iALk25otzTz9A0uru6sdjEB1PKmF5a8DqnRfDhZU
	Q5u/ul3ul2I1S6IiwbwN12eWb23dJopnHM8jxXgIz3dVjSclLDdMceiSP4jIEQjY
	BZRj/0d9VrXDnGlGIbVUxtqs+KRtXWLsdmSF2ts/syK80iAGtvGa0InhcEofOw8P
	kz0d6+FGfC/4a0dy+IcQ5pihH+FHytnRhCiUQ0VxEbsvlpJrcp5HCoIK+McLG9Tz
	R42/blSLngr58HCthS7dpyXJpT1TnkS7TufwyjUBKV5JSSHL702+q55Ehav4l8MD
	B8elT5WqeP40kDxScpLU7TsQmbLDOtXXhhotvO1WBLkKVA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5exrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 07:10:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C7AncX023937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 07:10:49 GMT
Received: from [10.216.34.210] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 23:10:47 -0800
Content-Type: multipart/alternative;
	boundary="------------a3fwDWloaJ5IilHgsSOWYvWq"
Message-ID: <a998340b-25e0-4459-a9a7-8e864f6f62c5@quicinc.com>
Date: Wed, 12 Feb 2025 12:40:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: upgrade 20250109 -> 20250211
To: <dbaryshkov@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20250211185151.995828-1-quic_vpuar@quicinc.com>
 <CAA8EJpr+ffQvF0DaA5YHS43=_goPtheRE8y9mLCDUfgFH9MiZg@mail.gmail.com>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <CAA8EJpr+ffQvF0DaA5YHS43=_goPtheRE8y9mLCDUfgFH9MiZg@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xSm50z280RkHMEEjQnn-yDeaTaLNH9yz
X-Proofpoint-GUID: xSm50z280RkHMEEjQnn-yDeaTaLNH9yz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211208

--------------a3fwDWloaJ5IilHgsSOWYvWq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 51C34Oef010521


On 2/12/2025 2:53 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> On Tue, 11 Feb 2025 at 20:52, Vivek Puar<quic_vpuar@quicinc.com> wrote:
>
>> License-Update: additional files
> Not only "additional files", there is a new Qualcomm licence, which is
> not caught by this patch, NAK
>
> While taking care of the new Qualcomm licence, please also note new
> ath*, qca and qcom/ firmware. Please extend corresponding split
> packages.

1) Now as qca firmware for WCN3950 chips comes from the RB1 firmware=20
release through Linaro,

 =C2=A0=C2=A0=C2=A0 a) so does it mean we will be adding "Firmware-qcom" =
to=20
"*LICENSE:${PN}-qca*"?
 =C2=A0=C2=A0=C2=A0 b) or do we need to split=C2=A0 ${PN}-qca into multip=
le packages?
 =C2=A0=C2=A0=C2=A0 c) or the firmware needs to be added as separate pack=
age, for=20
example: ${PN}-qca-wcn3950, but in this case how to exclude the firmware=20
from ${PN}-qca?

2) ath11k depends on "*ath10k-license*", so is there any split or change=20
required for the new QCA6698AQ firmware?

>> Signed-off-by: Vivek Puar<quic_vpuar@quicinc.com>
>> Cc: Dmitry Baryshkov<dmitry.baryshkov@linaro.org>
>> ---
>>   ...{linux-firmware_20250109.bb =3D> linux-firmware_20250211.bb} | 4 =
++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.b=
b =3D> linux-firmware_20250211.bb} (99%)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_2025010=
9.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
>> similarity index 99%
>> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109=
.bb
>> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.b=
b
>> index b932300742..6cadf99d47 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
>> @@ -158,7 +158,7 @@ LIC_FILES_CHKSUM =3D"file://LICENCE.Abilis;md5=3Db=
5ee3f410780e56711ad48eadc22b8bc \ "
>>   # WHENCE checksum is defined separately to ease overriding it if
>>   # class-devupstream is selected.
>> -WHENCE_CHKSUM  =3D "c90a25ccbd027eb8d61b2943ab68447c"
>> +WHENCE_CHKSUM  =3D "65c2919e6511a0d348a009ac419375b7"
>>
>>   # These are not common licenses, set NO_GENERIC_LICENSE for them
>>   # so that the license files will be copied from fetched source
>> @@ -247,7 +247,7 @@ SRC_URI:class-devupstream =3D "git://git.kernel.or=
g/pub/scm/linux/kernel/git/firmw
>>   # Pin this to the 20220509 release, override this in local.conf
>>   SRCREV:class-devupstream ?=3D "b19cbdca78ab2adfd210c91be15a22568e8b8=
cae"
>>
>> -SRC_URI[sha256sum] =3D "a12cb38f4793394bf56c6702be29b6e4f09deca071494=
3bba98a492030651570"
>> +SRC_URI[sha256sum] =3D "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb2=
1971582597abb45297d"
>>
>>   inherit allarch
Regards,
Vivek
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211186):https://lists.openembedded.org/g/openembedd=
ed-core/message/211186
> Mute This Topic:https://lists.openembedded.org/mt/111128390/8903276
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [q=
uic_vpuar@quicinc.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------a3fwDWloaJ5IilHgsSOWYvWq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 51C34Oef010521

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/12/2025 2:53 AM, Dmitry Baryshkov
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAA8EJpr+ffQvF0DaA5YHS43=3D_goPtheRE8y9mLCDUfgFH9MiZg@mail.gm=
ail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Tue, 11 Feb 2025 at 20:52=
, Vivek Puar <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:quic_vpuar=
@quicinc.com">&lt;quic_vpuar@quicinc.com&gt;</a> wrote:

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">License-Update: additional=
 files
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Not only "additional files", there is a new Qualcomm licence, which is
not caught by this patch, NAK

While taking care of the new Qualcomm licence, please also note new
ath*, qca and qcom/ firmware. Please extend corresponding split
packages.
</pre>
    </blockquote>
    <p>1) Now as qca firmware for <span
style=3D"color: rgb(51, 51, 51); font-family: sans-serif; font-size: 16.6=
667px; font-style: normal; font-variant-ligatures: normal; font-variant-c=
aps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-a=
lign: start; text-indent: 0px; text-transform: none; widows: 2; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background=
-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial; display: inline !i=
mportant; float: none;">WCN3950
        chips </span><span
style=3D"color: rgb(51, 51, 51); font-family: sans-serif; font-size: 16.6=
667px; font-style: normal; font-variant-ligatures: normal; font-variant-c=
aps: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: rgb(255, 255, 255); text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-co=
lor: initial; display: inline !important; float: none;">comes
        from the RB1 firmware release through Linaro</span>,=C2=A0</p>
    =C2=A0=C2=A0=C2=A0 a) so does it mean we will be adding "Firmware-qco=
m" to "<b>LICENSE:${PN}-qca</b>"?=C2=A0
    <br>
    =C2=A0=C2=A0=C2=A0 b) or do we need to split=C2=A0 ${PN}-qca into mul=
tiple packages?<br>
    =C2=A0=C2=A0=C2=A0 c) or the firmware needs to be added as separate p=
ackage, for
    example: ${PN}-qca-wcn3950, but in this case how to exclude the
    firmware from ${PN}-qca?<br>
    <p>2) ath11k depends on "<b>ath10k-license</b>", so is there any
      split or change required for the new <span
style=3D"color: rgb(0, 0, 0); font-family: &quot;Source Code Pro&quot;, &=
quot;Courier New&quot;, monospace; font-size: 13.3333px; font-style: norm=
al; font-variant-ligatures: normal; font-variant-caps: normal; font-weigh=
t: 700; letter-spacing: normal; orphans: 2; text-align: start; text-inden=
t: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255)=
; text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial; display: inline !important; float: none;">QC=
A6698AQ</span>
      firmware?</p>
    <blockquote type=3D"cite"
cite=3D"mid:CAA8EJpr+ffQvF0DaA5YHS43=3D_goPtheRE8y9mLCDUfgFH9MiZg@mail.gm=
ail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Signed-off-by: Vivek Puar <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:quic_vpuar@quicinc.com">&lt;quic_vpuar@quicinc.com&gt;</a>
Cc: Dmitry Baryshkov <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:dm=
itry.baryshkov@linaro.org">&lt;dmitry.baryshkov@linaro.org&gt;</a>
---
 ...{linux-firmware_20250109.bb =3D&gt; linux-firmware_20250211.bb} | 4 +=
+--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb =3D=
&gt; linux-firmware_20250211.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index b932300742..6cadf99d47 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396=
E" href=3D"file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc\"=
>"file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc \
                     "</a>
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  =3D "c90a25ccbd027eb8d61b2943ab68447c"
+WHENCE_CHKSUM  =3D "65c2919e6511a0d348a009ac419375b7"

 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -247,7 +247,7 @@ SRC_URI:class-devupstream =3D "git://git.kernel.org/p=
ub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?=3D "b19cbdca78ab2adfd210c91be15a22568e8b8cae"

-SRC_URI[sha256sum] =3D "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bb=
a98a492030651570"
+SRC_URI[sha256sum] =3D "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb2197=
1582597abb45297d"

 inherit allarch
</pre>
      </blockquote>
    </blockquote>
    Regards,<br>
    Vivek<br>
    <blockquote type=3D"cite"
cite=3D"mid:CAA8EJpr+ffQvF0DaA5YHS43=3D_goPtheRE8y9mLCDUfgFH9MiZg@mail.gm=
ail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#211186): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/211186">https:/=
/lists.openembedded.org/g/openembedded-core/message/211186</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/111128390/8903276">https://lists.openembedded.org/mt=
/111128390/8903276</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:quic_vpuar@quicinc.com">quic_vpuar@quicinc.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------a3fwDWloaJ5IilHgsSOWYvWq--

