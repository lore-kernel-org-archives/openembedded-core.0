Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8F4C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 16:00:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.60.1724428828395833178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 09:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@quicinc.com header.s=qcppdkim1 header.b=BS6HzS5o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NDlEt4014793;
	Fri, 23 Aug 2024 16:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VS3S58wMjDOdYoGqLUSdBPyIdz7+YQPa032VGlbFfPk=; b=BS6HzS5o2Mke/HXc
	Ee3FiUdGImtv6E15yy92zG4MsyRFUC6Tr+XNVuzZWSdJH6lyK4BIE9K+gMTh7ATF
	qlAK33MRD5DCobcRnZIwXfg45HDR7qZ3W+Ne+IhZ6EnjBJpXaZWijLIFeucODhiG
	xVEQ+kVPayyG+y4TzU+KSsXBeC0HMZCDh8zDdHjF2nB4gEs20gSVCduJ6b2C6fcU
	ZNUVNPogZzhyBYPK+r8dAxIEih1zNWnUBsMSIhA6CEU5AnbcFK2ajS74DyJFnEXx
	QLFazl0zKiDu+TMOPztxK9eedQQ7jNLRK3DumVIESUJHYC5XKO0NC05gHOYEEzQX
	qbUVvw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 416ukygd01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 16:00:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NG0QwB030346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 16:00:26 GMT
Received: from [10.216.39.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 Aug
 2024 09:00:24 -0700
Message-ID: <7e155c03-a9fc-4611-8452-42983f18ab69@quicinc.com>
Date: Fri, 23 Aug 2024 21:29:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][scarthgap][PATCH] wpa-supplicant: Upgrade 2.10
 -> 2.11
To: <randy.macleod@windriver.com>, <sdoshi@mvista.com>,
        <openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com"
	<steve@sakoman.com>
References: <20240822161721.6699-1-sdoshi@mvista.com>
 <9d603884-968b-4439-b88b-2bf8f6aebb9c@windriver.com>
Content-Language: en-US
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Organization: Qualcomm
In-Reply-To: <9d603884-968b-4439-b88b-2bf8f6aebb9c@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u36EIreSJamJhlCJsWqFmPjG-EJFzjOQ
X-Proofpoint-GUID: u36EIreSJamJhlCJsWqFmPjG-EJFzjOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_12,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230118
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 47NDlEt4014793
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 16:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203696

Hello Randy,

2.11 version of wpa-supplicant/hostapd are released almost after 2.5 Year=
s. 2-10 released on 2022-01-16. A lot of people are eagerly waiting for t=
his release since a long time. 2.11 has crucial HE/IEEE 802.11ax/Wi-Fi 6 =
support and preliminary support for EHT/IEEE 802.11be/Wi-Fi 7. This also =
supports WPA3 which is a mandatory certification for Wi-Fi CERTIFIED=E2=84=
=A2 devices. =20

I do accept this release missed the Sacrthgap cutoff of Yocto community. =
But considering the longevity of Scarthgap (a good 3.5 years from now) & =
number of people interested in Scarthgap, it is best if wpa-supplicant/ho=
stapd are switched to 2.11.=20

// Viswanath

On 8/23/2024 6:26 AM, Randy MacLeod via lists.openembedded.org wrote:
> For scarthgap, it's good but not mandatory to have Steve on the To/CC l=
ist.
>=20
> On 2024-08-22 12:17 p.m., Siddharth Doshi via lists.openembedded.org wr=
ote:
>> From: Siddharth Doshi<sdoshi@mvista.com>
>>
>> License-Update:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> - README: Change in copyright years as perhttps://w1.fi/cgit/hostap/co=
mmit/README?id=3Dd945ddd368085f255e68328f2d3b020ceea359af
>> - wpa_supplicant/wpa_supplicant.c: Change in copyright years as perhtt=
ps://w1.fi/cgit/hostap/commit/wpa_supplicant/wpa_supplicant.c?id=3Dd945dd=
d368085f255e68328f2d3b020ceea359af
>>
>> CVE's Fixed:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> - CVE-2024-5290 wpa_supplicant: wpa_supplicant loading arbitrary share=
d objects allowing privilege escalation
>> - CVE-2023-52160 wpa_supplicant: potential authorization bypass
>>
>> Changes between 2.10 -> 2.11:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> https://w1.fi/cgit/hostap/commit/wpa_supplicant/ChangeLog?id=3Dd945ddd=
368085f255e68328f2d3b020ceea359af
>=20
>=20
> Hello Siddharth,
>=20
>=20
> This update make sense for the master brnanch but likely not for scarth=
gap unless you can show that
> this is a bug fix only release.

>=20
>=20
> It certainly does not look like a small bug fix only update based on:
>=20
> =E2=9D=AF git diff hostap_2_10 hostap_2_11 | diffstat | tail -1
> =C2=A0534 files changed, 85965 insertions(+), 16847 deletions(-)
>=20
> =E2=9D=AF git log --oneline hostap_2_10..hostap_2_11 | wc -l
> 2295
>=20
> and the hostap and wpa-supplicant ChangeLogs which mention adding featu=
res below (1).
>=20
>=20
> Since the repo ( git://w1.fi/srv/git/hostap.git ) doesn't have a stable=
 branch for 2.10:
>=20
> =E2=9D=AF git branch -a
> * master
> =C2=A0 remotes/origin/HEAD -> origin/master
> =C2=A0 remotes/origin/android-jb
> =C2=A0 remotes/origin/android-kk
> =C2=A0 remotes/origin/android-l
> =C2=A0 remotes/origin/android-m
> =C2=A0 remotes/origin/aosp-jb
> =C2=A0 remotes/origin/aosp-kk
> =C2=A0 remotes/origin/main
> =C2=A0 remotes/origin/master
> =C2=A0 remotes/origin/pending
>=20
>=20
> you'll have to backport any CVE fixes that you're interested in unless
> someone explains why this is a sensible update for scarthgap.
>=20
> Thanks,
>=20
> ../Randy
>=20
>=20
> 1)
>=20
>=20
> =E2=9D=AF git diff hostap_2_10 hostap_2_11 hostapd/ChangeLog | cat
> diff --git a/hostapd/ChangeLog b/hostapd/ChangeLog
> index 279298e4d..1c8240d33 100644
> --- a/hostapd/ChangeLog
> +++ b/hostapd/ChangeLog
> @@ -1,5 +1,42 @@
> =C2=A0ChangeLog for hostapd
>=20
> +2024-07-20 - v2.11
> +=C2=A0=C2=A0=C2=A0 * Wi-Fi Easy Connect
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add support for DPP release 3
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - allow Configurator parameters to be p=
rovided during config exchange
> +=C2=A0=C2=A0=C2=A0 * HE/IEEE 802.11ax/Wi-Fi 6
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - various fixes
> +=C2=A0=C2=A0=C2=A0 * EHT/IEEE 802.11be/Wi-Fi 7
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add preliminary support
> +=C2=A0=C2=A0=C2=A0 * SAE: add support for fetching the password from a=
 RADIUS server
> +=C2=A0=C2=A0=C2=A0 * support OpenSSL 3.0 API changes
> +=C2=A0=C2=A0=C2=A0 * support background radar detection and CAC with s=
ome additional
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers
> +=C2=A0=C2=A0=C2=A0 * support RADIUS ACL/PSK check during 4-way handsha=
ke (wpa_psk_radius=3D3)
> +=C2=A0=C2=A0=C2=A0 * EAP-SIM/AKA: support IMSI privacy
> +=C2=A0=C2=A0=C2=A0 * improve 4-way handshake operations
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - use Secure=3D1 in message 3 during PT=
K rekeying
> +=C2=A0=C2=A0=C2=A0 * OCV: do not check Frequency Segment 1 Channel Num=
ber for 160 MHz cases
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to avoid interoperability issues
> +=C2=A0=C2=A0=C2=A0 * support new SAE AKM suites with variable length k=
eys
> +=C2=A0=C2=A0=C2=A0 * support new AKM for 802.1X/EAP with SHA384
> +=C2=A0=C2=A0=C2=A0 * extend PASN support for secure ranging
> +=C2=A0=C2=A0=C2=A0 * FT: Use SHA256 to derive PMKID for AKM 00-0F-AC:3=
 (FT-EAP)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - this is based on additional details b=
eing added in the IEEE 802.11
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 standard
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - the new implementation is not backwar=
ds compatible
> +=C2=A0=C2=A0=C2=A0 * improved ACS to cover additional channel types/ba=
ndwidths
> +=C2=A0=C2=A0=C2=A0 * extended Multiple BSSID support
> +=C2=A0=C2=A0=C2=A0 * fix beacon protection with FT protocol (incorrect=
 BIGTK was provided)
> +=C2=A0=C2=A0=C2=A0 * support unsynchronized service discovery (USD)
> +=C2=A0=C2=A0=C2=A0 * add preliminary support for RADIUS/TLS
> +=C2=A0=C2=A0=C2=A0 * add support for explicit SSID protection in 4-way=
 handshake
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (a mitigation for CVE-2023-52424; disab=
led by default for now, can be
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled with ssid_protection=3D1)
> +=C2=A0=C2=A0=C2=A0 * fix SAE H2E rejected groups validation to avoid d=
owngrade attacks
> +=C2=A0=C2=A0=C2=A0 * use stricter validation for some RADIUS messages
> +=C2=A0=C2=A0=C2=A0 * a large number of other fixes, cleanup, and exten=
sions
> +
> =C2=A02022-01-16 - v2.10
> =C2=A0=C2=A0=C2=A0=C2=A0 * SAE changes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - improved protection against side=
 channel attacks
>=20
>=20
> =E2=9D=AF=C2=A0 git diff hostap_2_10 hostap_2_11 wpa_supplicant/ChangeL=
og | cat
> diff --git a/wpa_supplicant/ChangeLog b/wpa_supplicant/ChangeLog
> index efcc6cd9c..3f4162eb0 100644
> --- a/wpa_supplicant/ChangeLog
> +++ b/wpa_supplicant/ChangeLog
> @@ -1,5 +1,55 @@
> =C2=A0ChangeLog for wpa_supplicant
>=20
> +2024-07-20 - v2.11
> +=C2=A0=C2=A0=C2=A0 * Wi-Fi Easy Connect
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add support for DPP release 3
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - allow Configurator parameters to be p=
rovided during config exchange
> +=C2=A0=C2=A0=C2=A0 * MACsec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add support for GCM-AES-256 cipher su=
ite
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - remove incorrect EAP Session-Id lengt=
h constraint
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add hardware offload support for addi=
tional drivers
> +=C2=A0=C2=A0=C2=A0 * HE/IEEE 802.11ax/Wi-Fi 6
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - support BSS color updates
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - various fixes
> +=C2=A0=C2=A0=C2=A0 * EHT/IEEE 802.11be/Wi-Fi 7
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add preliminary support
> +=C2=A0=C2=A0=C2=A0 * support OpenSSL 3.0 API changes
> +=C2=A0=C2=A0=C2=A0 * improve EAP-TLS support for TLSv1.3
> +=C2=A0=C2=A0=C2=A0 * EAP-SIM/AKA: support IMSI privacy
> +=C2=A0=C2=A0=C2=A0 * improve mitigation against DoS attacks when PMF i=
s used
> +=C2=A0=C2=A0=C2=A0 * improve 4-way handshake operations
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - discard unencrypted EAPOL frames in a=
dditional cases
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - use Secure=3D1 in message 2 during PT=
K rekeying
> +=C2=A0=C2=A0=C2=A0 * OCV: do not check Frequency Segment 1 Channel Num=
ber for 160 MHz cases
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to avoid interoperability issues
> +=C2=A0=C2=A0=C2=A0 * support new SAE AKM suites with variable length k=
eys
> +=C2=A0=C2=A0=C2=A0 * support new AKM for 802.1X/EAP with SHA384
> +=C2=A0=C2=A0=C2=A0 * improve cross-AKM roaming with driver-based SME/B=
SS selection
> +=C2=A0=C2=A0=C2=A0 * PASN
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - extend support for secure ranging
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - allow PASN implementation to be used =
with external programs for
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Wi-Fi Aware
> +=C2=A0=C2=A0=C2=A0 * FT: Use SHA256 to derive PMKID for AKM 00-0F-AC:3=
 (FT-EAP)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - this is based on additional details b=
eing added in the IEEE 802.11
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 standard
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - the new implementation is not backwar=
ds compatible, but PMKSA
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 caching with FT-EAP was, an=
d still is, disabled by default
> +=C2=A0=C2=A0=C2=A0 * support a pregenerated MAC (mac_addr=3D3) as an a=
lternative mechanism
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for using per-network random MAC addres=
ses
> +=C2=A0=C2=A0=C2=A0 * EAP-PEAP: require Phase 2 authentication by defau=
lt (phase2_auth=3D1)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to improve security for still unfortuna=
tely common invalid
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configurations that do not set ca_cert
> +=C2=A0=C2=A0=C2=A0 * extend SCS support for QoS Characteristics
> +=C2=A0=C2=A0=C2=A0 * extend MSCS support
> +=C2=A0=C2=A0=C2=A0 * support unsynchronized service discovery (USD)
> +=C2=A0=C2=A0=C2=A0 * add support for explicit SSID protection in 4-way=
 handshake
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (a mitigation for CVE-2023-52424; disab=
led by default for now, can be
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled with ssid_protection=3D1)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - in addition, verify SSID after key se=
tup when beacon protection is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 used
> +=C2=A0=C2=A0=C2=A0 * fix SAE H2E rejected groups validation to avoid d=
owngrade attacks
> +=C2=A0=C2=A0=C2=A0 * a large number of other fixes, cleanup, and exten=
sions
> +
> =C2=A02022-01-16 - v2.10
> =C2=A0=C2=A0=C2=A0=C2=A0 * SAE changes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - improved protection against side=
 channel attacks
>=20
>=20
>>
>> Note:
>> =3D=3D=3D=3D=3D
>> Patches
>> 0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch,
>> 0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch,
>> 0001-Install-wpa_passphrase-when-not-disabled.patch,
>> 0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch (CVE-2=
023-52160)
>> are already fixed and hence removing them.
>>
>> Signed-off-by: Siddharth Doshi<sdoshi@mvista.com>
>> ---
>> =C2=A0 ...all-wpa_passphrase-when-not-disabled.patch |=C2=A0 33 ---
>> =C2=A0 ...te-Phase-2-authentication-requiremen.patch | 213 -----------=
-------
>> =C2=A0 ...options-for-libwpa_client.so-and-wpa.patch |=C2=A0 73 ------
>> =C2=A0 ...oval-of-wpa_passphrase-on-make-clean.patch |=C2=A0 26 ---
>> =C2=A0 ...plicant_2.10.bb =3D> wpa-supplicant_2.11.bb} |=C2=A0 10 +-
>> =C2=A0 5 files changed, 3 insertions(+), 352 deletions(-)
>> =C2=A0 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa=
-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch
>> =C2=A0 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa=
-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.pat=
ch
>> =C2=A0 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa=
-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.pat=
ch
>> =C2=A0 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa=
-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
>> =C2=A0 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant=
_2.10.bb =3D> wpa-supplicant_2.11.bb} (90%)
>>
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0=
001-Install-wpa_passphrase-when-not-disabled.patch b/meta/recipes-connect=
ivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-=
disabled.patch
>> deleted file mode 100644
>> index c04c608bde..0000000000
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Ins=
tall-wpa_passphrase-when-not-disabled.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From 57b12a1e43605f71239a21488cb9b541f0751dda Mon Sep 17 00:00:00 200=
1
>> -From: Alex Kiernan<alexk@zuma.ai>
>> -Date: Thu, 21 Apr 2022 10:15:29 +0100
>> -Subject: [PATCH] Install wpa_passphrase when not disabled
>> -
>> -As part of fixing CONFIG_NO_WPA_PASSPHRASE, whilst wpa_passphrase get=
s
>> -built, its not installed during `make install`.
>> -
>> -Fixes: cb41c214b78d ("build: Re-enable options for libwpa_client.so a=
nd wpa_passphrase")
>> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
>> -Signed-off-by: Alex Kiernan<alex.kiernan@gmail.com>
>> -Upstream-Status: Submitted [http://lists.infradead.org/pipermail/host=
ap/2022-April/040448.html]
>> ----
>> - wpa_supplicant/Makefile | 3 +++
>> - 1 file changed, 3 insertions(+)
>> -
>> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
>> -index 0bab313f2355..12787c0c7d0f 100644
>> ---- a/wpa_supplicant/Makefile
>> -+++ b/wpa_supplicant/Makefile
>> -@@ -73,6 +73,9 @@ $(DESTDIR)$(BINDIR)/%: %
>> -
>> - install: $(addprefix $(DESTDIR)$(BINDIR)/,$(BINALL))
>> -=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C ../src install
>> -+ifndef CONFIG_NO_WPA_PASSPHRASE
>> -+=C2=A0=C2=A0=C2=A0 install -D wpa_passphrase $(DESTDIR)/$(BINDIR)/wp=
a_passphrase
>> -+endif
>> - ifdef CONFIG_BUILD_WPA_CLIENT_SO
>> -=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 -D libwpa_client.so $(DESTDI=
R)/$(LIBDIR)/libwpa_client.so
>> -=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 -D ../src/common/wpa_ctrl.h =
$(DESTDIR)/$(INCDIR)/wpa_ctrl.h
>> ---
>> -2.35.1
>> -
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0=
001-PEAP-client-Update-Phase-2-authentication-requiremen.patch b/meta/rec=
ipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-P=
hase-2-authentication-requiremen.patch
>> deleted file mode 100644
>> index 620560d3c7..0000000000
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEA=
P-client-Update-Phase-2-authentication-requiremen.patch
>> +++ /dev/null
>> @@ -1,213 +0,0 @@
>> -From f6f7cead3661ceeef54b21f7e799c0afc98537ec Mon Sep 17 00:00:00 200=
1
>> -From: Jouni Malinen<j@w1.fi>
>> -Date: Sat, 8 Jul 2023 19:55:32 +0300
>> -Subject: [PATCH] PEAP client: Update Phase 2 authentication requireme=
nts
>> -
>> -The previous PEAP client behavior allowed the server to skip Phase 2
>> -authentication with the expectation that the server was authenticated
>> -during Phase 1 through TLS server certificate validation. Various PEA=
P
>> -specifications are not exactly clear on what the behavior on this fro=
nt
>> -is supposed to be and as such, this ended up being more flexible than
>> -the TTLS/FAST/TEAP cases. However, this is not really ideal when
>> -unfortunately common misconfiguration of PEAP is used in deployed
>> -devices where the server trust root (ca_cert) is not configured or th=
e
>> -user has an easy option for allowing this validation step to be skipp=
ed.
>> -
>> -Change the default PEAP client behavior to be to require Phase 2
>> -authentication to be successfully completed for cases where TLS sessi=
on
>> -resumption is not used and the client certificate has not been
>> -configured. Those two exceptions are the main cases where a deployed
>> -authentication server might skip Phase 2 and as such, where a more
>> -strict default behavior could result in undesired interoperability
>> -issues. Requiring Phase 2 authentication will end up disabling TLS
>> -session resumption automatically to avoid interoperability issues.
>> -
>> -Allow Phase 2 authentication behavior to be configured with a new pha=
se1
>> -configuration parameter option:
>> -'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
>> -tunnel) behavior for PEAP:
>> - * 0 =3D do not require Phase 2 authentication
>> - * 1 =3D require Phase 2 authentication when client certificate
>> -=C2=A0=C2=A0 (private_key/client_cert) is no used and TLS session res=
umption was
>> -=C2=A0=C2=A0 not used (default)
>> - * 2 =3D require Phase 2 authentication in all cases
>> -
>> -Signed-off-by: Jouni Malinen<j@w1.fi>
>> -
>> -CVE: CVE-2023-52160
>> -Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=3D8e6=
485a1bcb0baffdea9e55255a81270b768439c]
>> -
>> -Signed-off-by: Claus Stovgaard<claus.stovgaard@gmail.com>
>> -
>> ----
>> - src/eap_peer/eap_config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 ++++++
>> - src/eap_peer/eap_peap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 40 +++++++++++++++++++++++++++---
>> - src/eap_peer/eap_tls_common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
6 +++++
>> - src/eap_peer/eap_tls_common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
5 ++++
>> - wpa_supplicant/wpa_supplicant.conf |=C2=A0 7 ++++++
>> - 5 files changed, 63 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/src/eap_peer/eap_config.h b/src/eap_peer/eap_config.h
>> -index 3238f74..047eec2 100644
>> ---- a/src/eap_peer/eap_config.h
>> -+++ b/src/eap_peer/eap_config.h
>> -@@ -469,6 +469,14 @@ struct eap_peer_config {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 1 =3D use cryptobinding if server su=
pports it
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 2 =3D require cryptobinding
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 * phase2_auth option can be used to control=
 Phase 2 (i.e., within TLS
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 * tunnel) behavior for PEAP:
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 * 0 =3D do not require Phase 2 authenticati=
on
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 * 1 =3D require Phase 2 authentication when=
 client certificate
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 (private_key/client_cert) is no use=
d and TLS session resumption was
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 not used (default)
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 * 2 =3D require Phase 2 authentication in a=
ll cases
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 *
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * EAP-WSC (WPS) uses following options=
: pin=3DDevice_Password and
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * uuid=3DDevice_UUID
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>> -diff --git a/src/eap_peer/eap_peap.c b/src/eap_peer/eap_peap.c
>> -index 12e30df..6080697 100644
>> ---- a/src/eap_peer/eap_peap.c
>> -+++ b/src/eap_peer/eap_peap.c
>> -@@ -67,6 +67,7 @@ struct eap_peap_data {
>> -=C2=A0=C2=A0=C2=A0=C2=A0 u8 cmk[20];
>> -=C2=A0=C2=A0=C2=A0=C2=A0 int soh; /* Whether IF-TNCCS-SOH (Statement =
of Health; Microsoft NAP)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is ena=
bled. */
>> -+=C2=A0=C2=A0=C2=A0 enum { NO_AUTH, FOR_INITIAL, ALWAYS } phase2_auth=
;
>> - };
>> -
>> -
>> -@@ -114,6 +115,19 @@ static void eap_peap_parse_phase1(struct eap_pea=
p_data *data,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wpa_printf(MSG_DEBUG=
, "EAP-PEAP: Require cryptobinding");
>> -=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -
>> -+=C2=A0=C2=A0=C2=A0 if (os_strstr(phase1, "phase2_auth=3D0")) {
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->phase2_auth =3D NO_=
AUTH;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wpa_printf(MSG_DEBUG,
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "EAP-PEAP: Do not require Phase 2 authentication");
>> -+=C2=A0=C2=A0=C2=A0 } else if (os_strstr(phase1, "phase2_auth=3D1")) =
{
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->phase2_auth =3D FOR=
_INITIAL;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wpa_printf(MSG_DEBUG,
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "EAP-PEAP: Require Phase 2 authentication for initial con=
nection");
>> -+=C2=A0=C2=A0=C2=A0 } else if (os_strstr(phase1, "phase2_auth=3D2")) =
{
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->phase2_auth =3D ALW=
AYS;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wpa_printf(MSG_DEBUG,
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "EAP-PEAP: Require Phase 2 authentication for all cases")=
;
>> -+=C2=A0=C2=A0=C2=A0 }
>> - #ifdef EAP_TNC
>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (os_strstr(phase1, "tnc=3Dsoh2")) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->soh =3D 2;
>> -@@ -142,6 +156,7 @@ static void * eap_peap_init(struct eap_sm *sm)
>> -=C2=A0=C2=A0=C2=A0=C2=A0 data->force_peap_version =3D -1;
>> -=C2=A0=C2=A0=C2=A0=C2=A0 data->peap_outer_success =3D 2;
>> -=C2=A0=C2=A0=C2=A0=C2=A0 data->crypto_binding =3D OPTIONAL_BINDING;
>> -+=C2=A0=C2=A0=C2=A0 data->phase2_auth =3D FOR_INITIAL;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (config && config->phase1)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eap_peap_parse_phase=
1(data, config->phase1);
>> -@@ -454,6 +469,20 @@ static int eap_tlv_validate_cryptobinding(struct=
 eap_sm *sm,
>> - }
>> -
>> -
>> -+static bool peap_phase2_sufficient(struct eap_sm *sm,
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct eap_peap_data *data)
>> -+{
>> -+=C2=A0=C2=A0=C2=A0 if ((data->phase2_auth =3D=3D ALWAYS ||
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (data->phase2_auth =
=3D=3D FOR_INITIAL &&
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !tls_connecti=
on_resumed(sm->ssl_ctx, data->ssl.conn) &&
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !data->ssl.cl=
ient_cert_conf) ||
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->phase2_eap_st=
arted) &&
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !data->phase2_eap_success=
)
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> -+=C2=A0=C2=A0=C2=A0 return true;
>> -+}
>> -+
>> -+
>> - /**
>> -=C2=A0 * eap_tlv_process - Process a received EAP-TLV message and gen=
erate a response
>> -=C2=A0 * @sm: Pointer to EAP state machine allocated with eap_peer_sm=
_init()
>> -@@ -568,6 +597,11 @@ static int eap_tlv_process(struct eap_sm *sm, st=
ruct eap_peap_data *data,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -=
 force failed Phase 2");
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 resp_status =3D EAP_TLV_RESULT_FAILURE;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret->decision =3D DECISION_FAIL;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=
 else if (!peap_phase2_sufficient(sm, data)) {
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 wpa_printf(MSG_INFO,
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "EAP-PEAP=
: Server indicated Phase 2 success, but sufficient Phase 2 authentication=
 has not been completed");
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 resp_status =3D EAP_TLV_RESULT_FAILURE;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret->decision =3D DECISION_FAIL;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 } else {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 resp_status =3D EAP_TLV_RESULT_SUCCESS;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret->decision =3D DECISION_UNCOND_SUCC;
>> -@@ -887,8 +921,7 @@ continue_req:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* EAP-Success within TLS tunnel is used to indicate
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * shutdown of the TLS channel. The authentication has
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * been completed. */
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (data->phase2_eap_started &&
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 !data->phase2_eap_success) {
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (!peap_phase2_sufficient(sm, data)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 wpa_printf(MSG_DEBUG, "EAP-PEAP: Phase 2 "
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Su=
ccess used to indicate success, "
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "bu=
t Phase 2 EAP was not yet "
>> -@@ -1199,8 +1232,9 @@ static struct wpabuf * eap_peap_process(struct =
eap_sm *sm, void *priv,
>> - static bool eap_peap_has_reauth_data(struct eap_sm *sm, void *priv)
>> - {
>> -=C2=A0=C2=A0=C2=A0=C2=A0 struct eap_peap_data *data =3D priv;
>> -+
>> -=C2=A0=C2=A0=C2=A0=C2=A0 return tls_connection_established(sm->ssl_ct=
x, data->ssl.conn) &&
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->phase2_success;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->phase2_success && d=
ata->phase2_auth !=3D ALWAYS;
>> - }
>> -
>> -
>> -diff --git a/src/eap_peer/eap_tls_common.c b/src/eap_peer/eap_tls_com=
mon.c
>> -index c1837db..a53eeb1 100644
>> ---- a/src/eap_peer/eap_tls_common.c
>> -+++ b/src/eap_peer/eap_tls_common.c
>> -@@ -239,6 +239,12 @@ static int eap_tls_params_from_conf(struct eap_s=
m *sm,
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0 sm->ext_cert_check =3D !!(params->flags & TL=
S_CONN_EXT_CERT_CHECK);
>> -
>> -+=C2=A0=C2=A0=C2=A0 if (!phase2)
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->client_cert_conf =3D=
 params->client_cert ||
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
arams->client_cert_blob ||
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
arams->private_key ||
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
arams->private_key_blob;
>> -+
>> -=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> - }
>> -
>> -diff --git a/src/eap_peer/eap_tls_common.h b/src/eap_peer/eap_tls_com=
mon.h
>> -index 9ac0012..3348634 100644
>> ---- a/src/eap_peer/eap_tls_common.h
>> -+++ b/src/eap_peer/eap_tls_common.h
>> -@@ -79,6 +79,11 @@ struct eap_ssl_data {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * tls_v13 - Whether TLS v1.3 or newer =
is used
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0 int tls_v13;
>> -+
>> -+=C2=A0=C2=A0=C2=A0 /**
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 * client_cert_conf: Whether client certific=
ate has been configured
>> -+=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -+=C2=A0=C2=A0=C2=A0 bool client_cert_conf;
>> - };
>> -
>> -
>> -diff --git a/wpa_supplicant/wpa_supplicant.conf b/wpa_supplicant/wpa_=
supplicant.conf
>> -index 6619d6b..d63f73c 100644
>> ---- a/wpa_supplicant/wpa_supplicant.conf
>> -+++ b/wpa_supplicant/wpa_supplicant.conf
>> -@@ -1321,6 +1321,13 @@ fast_reauth=3D1
>> - #=C2=A0=C2=A0=C2=A0=C2=A0 * 0 =3D do not use cryptobinding (default)
>> - #=C2=A0=C2=A0=C2=A0=C2=A0 * 1 =3D use cryptobinding if server suppor=
ts it
>> - #=C2=A0=C2=A0=C2=A0=C2=A0 * 2 =3D require cryptobinding
>> -+#=C2=A0=C2=A0=C2=A0 'phase2_auth' option can be used to control Phas=
e 2 (i.e., within TLS
>> -+#=C2=A0=C2=A0=C2=A0 tunnel) behavior for PEAP:
>> -+#=C2=A0=C2=A0=C2=A0=C2=A0 * 0 =3D do not require Phase 2 authenticat=
ion
>> -+#=C2=A0=C2=A0=C2=A0=C2=A0 * 1 =3D require Phase 2 authentication whe=
n client certificate
>> -+#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (private_key/client_cert) is n=
o used and TLS session resumption was
>> -+#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not used (default)
>> -+#=C2=A0=C2=A0=C2=A0=C2=A0 * 2 =3D require Phase 2 authentication in =
all cases
>> - #=C2=A0=C2=A0=C2=A0 EAP-WSC (WPS) uses following options: pin=3D<Dev=
ice Password> or
>> - #=C2=A0=C2=A0=C2=A0 pbc=3D1.
>> - #
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0=
001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch b/meta/rec=
ipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-opti=
ons-for-libwpa_client.so-and-wpa.patch
>> deleted file mode 100644
>> index 6e930fc98d..0000000000
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-bui=
ld-Re-enable-options-for-libwpa_client.so-and-wpa.patch
>> +++ /dev/null
>> @@ -1,73 +0,0 @@
>> -From cb41c214b78d6df187a31950342e48a403dbd769 Mon Sep 17 00:00:00 200=
1
>> -From: Sergey Matyukevich<geomatsi@gmail.com>
>> -Date: Tue, 22 Feb 2022 11:52:19 +0300
>> -Subject: [PATCH 1/2] build: Re-enable options for libwpa_client.so an=
d
>> - wpa_passphrase
>> -
>> -Commit a41a29192e5d ("build: Pull common fragments into a build.rules
>> -file") introduced a regression into wpa_supplicant build process. The
>> -build target libwpa_client.so is not built regardless of whether the
>> -option CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because
>> -this config option is used before it is imported from the configurati=
on
>> -file. Moving its use after including build.rules does not help: the
>> -variable ALL is processed by build.rules and further changes are not
>> -applied. Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not wor=
k
>> -as expected: wpa_passphrase is always built regardless of whether the
>> -option is set or not.
>> -
>> -Re-enable these options by adding both build targets to _all
>> -dependencies.
>> -
>> -Fixes: a41a29192e5d ("build: Pull common fragments into a build.rules=
 file")
>> -Signed-off-by: Sergey Matyukevich<geomatsi@gmail.com>
>> -Upstream-Status: Backport
>> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
>> -Signed-off-by: Alex Kiernan<alexk@gmail.com>
>> ----
>> - wpa_supplicant/Makefile | 19 ++++++++++++-------
>> - 1 file changed, 12 insertions(+), 7 deletions(-)
>> -
>> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
>> -index cb66defac7c8..c456825ae75f 100644
>> ---- a/wpa_supplicant/Makefile
>> -+++ b/wpa_supplicant/Makefile
>> -@@ -1,24 +1,29 @@
>> - BINALL=3Dwpa_supplicant wpa_cli
>> -
>> --ifndef CONFIG_NO_WPA_PASSPHRASE
>> --BINALL +=3D wpa_passphrase
>> --endif
>> --=20
>> - ALL =3D $(BINALL)
>> - ALL +=3D systemd/wpa_supplicant.service
>> - ALL +=3Dsystemd/wpa_supplicant@.service
>> - ALL +=3Dsystemd/wpa_supplicant-nl80211@.service
>> - ALL +=3Dsystemd/wpa_supplicant-wired@.service
>> - ALL +=3D dbus/fi.w1.wpa_supplicant1.service
>> --ifdef CONFIG_BUILD_WPA_CLIENT_SO
>> --ALL +=3D libwpa_client.so
>> --endif
>> -
>> - EXTRA_TARGETS=3Ddynamic_eap_methods
>> -
>> - CONFIG_FILE=3D.config
>> - include ../src/build.rules
>> -
>> -+ifdef CONFIG_BUILD_WPA_CLIENT_SO
>> -+# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
>> -+# being set in the config which is read by build.rules
>> -+_all: libwpa_client.so
>> -+endif
>> -+
>> -+ifndef CONFIG_NO_WPA_PASSPHRASE
>> -+# add the dependency this way to allow CONFIG_NO_WPA_PASSPHRASE
>> -+# being set in the config which is read by build.rules
>> -+_all: wpa_passphrase
>> -+endif
>> -+
>> - ifdef LIBS
>> - # If LIBS is set with some global build system defaults, clone those=
 for
>> - # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
>> ---
>> -2.35.1
>> -
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0=
002-Fix-removal-of-wpa_passphrase-on-make-clean.patch b/meta/recipes-conn=
ectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase=
-on-make-clean.patch
>> deleted file mode 100644
>> index 53b0fcdf53..0000000000
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix=
-removal-of-wpa_passphrase-on-make-clean.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -From d001b301ba7987f4b39453a211631b85c48f2ff8 Mon Sep 17 00:00:00 200=
1
>> -From: Jouni Malinen<quic_jouni@quicinc.com>
>> -Date: Thu, 3 Mar 2022 13:26:42 +0200
>> -Subject: [PATCH 2/2] Fix removal of wpa_passphrase on 'make clean'
>> -
>> -Fixes: 0430bc8267b4 ("build: Add a common-clean target")
>> -Signed-off-by: Jouni Malinen<quic_jouni@quicinc.com>
>> -Upstream-Status: Backport
>> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
>> -Signed-off-by: Alex Kiernan<alexk@gmail.com>
>> ----
>> - wpa_supplicant/Makefile | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
>> -index c456825ae75f..4b4688931b1d 100644
>> ---- a/wpa_supplicant/Makefile
>> -+++ b/wpa_supplicant/Makefile
>> -@@ -2077,3 +2077,4 @@ clean: common-clean
>> -=C2=A0=C2=A0=C2=A0=C2=A0 rm -f libwpa_client.a
>> -=C2=A0=C2=A0=C2=A0=C2=A0 rm -f libwpa_client.so
>> -=C2=A0=C2=A0=C2=A0=C2=A0 rm -f libwpa_test1 libwpa_test2
>> -+=C2=A0=C2=A0=C2=A0 rm -f wpa_passphrase
>> ---
>> -2.35.1
>> -
>> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2=
.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
>> similarity index 90%
>> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.=
10.bb
>> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11=
.bb
>> index 8113bcab09..321dedc58a 100644
>> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
>> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
>> @@ -5,8 +5,8 @@ BUGTRACKER =3D"http://w1.fi/security/"
>> =C2=A0 SECTION =3D "network"
>> =C2=A0 LICENSE =3D "BSD-3-Clause"
>> =C2=A0 LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D5ebcb90236d1ad640558c=
3d3cd3035df \ - file://README;beginline=3D1;endline=3D56;md5=3De3d2f6c294=
8991e37c1ca4960de84747 \ - file://wpa_supplicant/wpa_supplicant.c;beginli=
ne=3D1;endline=3D12;md5=3D76306a95306fee9a976b0ac1be70f705"
>> +file://README;beginline=3D1;endline=3D56;md5=3D6e4b25e7d74bfc44a32ba3=
7bdf5210a6 \
>> +file://wpa_supplicant/wpa_supplicant.c;beginline=3D1;endline=3D12;md5=
=3Df5ccd57ea91e04800edb88267bf8eae4"
>> =C2=A0 =C2=A0 DEPENDS =3D "dbus libnl"
>> =C2=A0 @@ -15,12 +15,8 @@ SRC_URI =3D"http://w1.fi/releases/wpa_suppli=
cant-${PV}.tar.gz \ file://wpa_supplicant.conf \ file://wpa_supplicant.co=
nf-sane \ file://99_wpa_supplicant \ - file://0001-build-Re-enable-option=
s-for-libwpa_client.so-and-wpa.patch \ - file://0002-Fix-removal-of-wpa_p=
assphrase-on-make-clean.patch \ - file://0001-Install-wpa_passphrase-when=
-not-disabled.patch \ - file://0001-PEAP-client-Update-Phase-2-authentica=
tion-requiremen.patch \ "
>> -SRC_URI[sha256sum] =3D "20df7ae5154b3830355f8ab4269123a87affdea59fe74=
fe9292a91d0d7e17b2f"
>> +SRC_URI[sha256sum] =3D "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0f=
c5d75dee6c81ac7fc0a"
>> =C2=A0 =C2=A0 S =3D "${WORKDIR}/wpa_supplicant-${PV}"
>> =C2=A0
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203665): https://lists.openembedded.org/g/openembed=
ded-core/message/203665
> Mute This Topic: https://lists.openembedded.org/mt/108040776/5192326
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
quic_vkraleti@quicinc.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

