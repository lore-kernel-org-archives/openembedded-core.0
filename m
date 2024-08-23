Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948C1C531DF
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:53:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7545.1724378000888566454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N1OEri012446
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 18:53:20 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q545w2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 18:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5f/KT5El5oOJQlyM23DeYEJGHlgtzIuG4zJZeLwgTRxj1OwlentwN7z7ubMJPiaagmJjfH0iERN2mLBK4bF9szGMJt6Jtv9xfN13g9DBYy0cXWk5Z03ellGQY2TAVe2fhoEFk0ki5AVz+QKllVWESEiOsclNzFTPiQZ33lmZFKwSVq9sVArFzyY5p6igQvAeGpPQ02PZyhEp5tMEY4zbGUaSfJ78dLbPo04gUeYWyWPCtU+OMo2T8y4kQ8QO2MC0CmtwaYr2tItGNo5/BM/8iPID6lEiQwWRsiVefKxn2rn6NnpWL0qF6ri7eNIDAlrBzRb7fJXu+j41OryaThbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaCMuoRVbHhf4hwyk9TWBkeb+8Y/Ta2T/z6379VOJPo=;
 b=bsExyOjkDLO9ZSlcpCXKNucZxvPj6lIL7HUUa1czMtvczm13N2rt40m3qMdEI5n3WWrMVzlARVN9RYwZx/6N+tXsT3os5gph3oV2FMX12bGz6jKCLhE/FyX+ZDzFB4KCY2NsjDQw4fYYIQpSHxxzTqkEwwyyBc7kS/HzXZA9uAIOeAeP0dW91PlhykaDxkc5fv9tYB2ytflfuIOpIuE99IrFcD1HzWA9DCDHuTlPP+IJA/4hhuBVR54584vPS2D3KI/RkEuzwhlBoFxThbjIzyhvnlpDIz3RZzTemjnNmThWQsOef0Qcb14/xF9V+rw/HInfFYu279wqcU6BfJInJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:53:18 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:53:17 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: "Jia, Hongxu" <Hongxu.Jia@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][PATCH 5/9] rpcbind: 1.2.6 -> 1.2.7
Thread-Topic: [OE-core] [poky][PATCH 5/9] rpcbind: 1.2.6 -> 1.2.7
Thread-Index: AQHa9P7LLulLHPcQVUWnnRtSvDWKArI0FC7D
Date: Fri, 23 Aug 2024 01:53:17 +0000
Message-ID: 
 <MW3PR11MB463370999CFA369CBA032CB294882@MW3PR11MB4633.namprd11.prod.outlook.com>
References: <20240823014806.4154590-1-hongxu.jia@windriver.com>
 <17EE3862DD24C4E6.18748@lists.openembedded.org>
In-Reply-To: <17EE3862DD24C4E6.18748@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4633:EE_|DS0PR11MB8114:EE_
x-ms-office365-filtering-correlation-id: 6e725cbf-02c8-4740-e302-08dcc3165bf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?wcvAJVZE7VbcIGbhQmvQm6je7UtZf+kFbll0hwPb3ZcprTbNJZe0Jeg+Rkct?=
 =?us-ascii?Q?/l+FRJGPk7JKKCZ0srDS0nWEKhctUF5G74U8DMrG8vXMJ60J628LEBlwz92R?=
 =?us-ascii?Q?WFdc/z8UUU//ZoUaqTYU98X5v6RkDhq3DKf0kjM9q5TfLjuatk2c/rlrh8Tx?=
 =?us-ascii?Q?yGwyb0jztBTymKI76uO7x018M2OOd1+52jNfMr1mxK3AdtcZvfQKTQ/cbr3z?=
 =?us-ascii?Q?7TOsVMVEQcnBMLGcrliJeN7/K4vzeZZkEZUcZIINRj/phh8lPT2Kg6sOx8Ra?=
 =?us-ascii?Q?YeWWgYYUO5NZerMSwVoUtp44z4/u8sc7F5MBZvn/aq/4Ba1n1atKNpa+Gglf?=
 =?us-ascii?Q?ZzTJM4S9+1+kw4jfSHfBwSJHxb96Q1qfEIcvfV05NI5cQBWWx0xmUIJcNqvF?=
 =?us-ascii?Q?eGY+QIDXrp1WlA+yKP6wH8wqhqcIyLZ43trQwo8TYP777zzVea5Efw9gi9iI?=
 =?us-ascii?Q?Pvk59ur8vPu0PHbcQ3opIqt2+bc6WSdAqqeu6Q8YOHNpBr/cV7+YZ+EY/5pj?=
 =?us-ascii?Q?ultjGqrTOcPcBdzj08rss2im/ZuOXSV1Ja+A5V8temsI9BbLrcxkBl8/5osV?=
 =?us-ascii?Q?csddcCYuKsDzWey/83NUmEzkeQK1YTFjl6G1yp+sEbQGUKpF9C8Az6MUJUh4?=
 =?us-ascii?Q?Mrsgmw/Wp1IAqLN8wCKskMa0QAcq1DJkCMSBn/5fgmOO2RwXE+p85VzHjOZZ?=
 =?us-ascii?Q?3eLK7x2Mae+TxPeBQ/k7vzfDUCEpJGQhPycB+HFDdmA7zOTYbM3Wq5esUd34?=
 =?us-ascii?Q?a19z/SkzSWnEKzH13EgujT3Eq4ZrEy4iYR1SENyXHH1097Y/hgqUlK8rht75?=
 =?us-ascii?Q?eBqESN0xrjCtUd9m9HCGf8u44RObvjsOdNaIp+9Lze1Qgi6WF6V3oyerPqbh?=
 =?us-ascii?Q?rp0jUh+9+rRLG54Ne2SNeRJcziMF+/jkJD9cazRioVYhq//UC9iuiE94iOPa?=
 =?us-ascii?Q?98VLA2G+yjW/DEBYZ+dHl/oOTEk361xT7NcKQU2p4NRkTK2t5sRsnHxuvg7B?=
 =?us-ascii?Q?DBxf4GXUFRNKtlIt02SbBAYOqki2PAHwgGMP7ila1PzbArvRcWe9G0gGRr2t?=
 =?us-ascii?Q?09uZvzL0//wFRIpuJFljFDX/DN0Na8sUvZRf1zIjjRW0l1cSGDeR3Oi5tfNd?=
 =?us-ascii?Q?rsDOETyKuiCdotpn4gPjhSjaii8d9DLnuhBGMEP3UpuXCa7dqrgJJz0S+/gH?=
 =?us-ascii?Q?w8yZ8ZeyUNumJTM647EXbRpAb4VRoA6JZ18ZRwtHsHYk1V7Rp6EytdeeavoY?=
 =?us-ascii?Q?4qM9cLeskblDaOfbdU/QzQf8sSODjSFyqGeopbMPH05c5VFfA+O/UeHuQsCd?=
 =?us-ascii?Q?HpfOUX6qa7Cy1BkVPUk3cj6+ezDq+6+JQNuvUCUWX/r2ycwJPh9KYeVInkCe?=
 =?us-ascii?Q?bPor6LY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Z6fORmBWGn+orLPs8ZRFIIzGfP2vXgRm5CRnAi1GF7EF1nevd6kmE3EpHXZ3?=
 =?us-ascii?Q?YRDLZcQfnrfyGa6jV5+5k1BQLHNm4grwKOxKqS00PyDHiaWVxKr88vy+6zpt?=
 =?us-ascii?Q?8eP3qdgc1Buyaopj9BRziI2+n/923m9WchyK7RU3M+9O78Q9hApWIEB7pMv4?=
 =?us-ascii?Q?yUu2UI6Et40IdSZ/s1kFyRgbWZN17MTEOBbgKy9f7I22LW9y5BEF8r022iXE?=
 =?us-ascii?Q?EWux5BmLAJjweRMc/OYajzj5WqTvY3/6tYwcHc3zOHilvI080Q87eRvWZ7pv?=
 =?us-ascii?Q?UYlrv3aZzBZZS65anv0O27uZWz5CV3KRhI2V0Hp2EMijXFKyoxCTHVF/lGQB?=
 =?us-ascii?Q?c64HxKS6xp7B1xI4cyBnDpCQXjf6AeoTzKgGBDfL/82ASSultRox+FKwO3mc?=
 =?us-ascii?Q?7N0QqD86ZiUbjbXqO+fqK6kcrEk1FrP51f27LANIDgwMLrHLK6TWArL3Fnem?=
 =?us-ascii?Q?H+Z+QKfbRaIVe4P0gaFUe4Yp7xMv1g12pdslifryRNP67aF/F6hoDgcAJ7zu?=
 =?us-ascii?Q?+O+4yTTcDsXWs1HDMoF8+NZJCe/5cme2e0LpV1sIEWGieAdtSEY5FVV58W3x?=
 =?us-ascii?Q?ZuhiDh1CvlfRczIEihQ0PZrc9HWgluS+jotEOZzbtoj8Y18SEzz25DBUUEaa?=
 =?us-ascii?Q?0teGh3+2tavge9ok76fU4wzmC0Du6cKIsjn2Lf6Guq7UMdtyn4eiV15eO3un?=
 =?us-ascii?Q?7CyWUZvxHDuP2iQNG3WxtqT0XJZJpGpGZ/WIUkIT4mGoK0mVQ9Dm9CPgImRT?=
 =?us-ascii?Q?r1+5EJZp1h5PSXJfCEtJq361kLKdLzAGnx5VXDzJJ1MFsT4Xf45X/bGh02mp?=
 =?us-ascii?Q?plphoFsl8+hNAALOSIAq0W7fVyi3jRP+q+0NDh+lMQGP1VXAlPTul8H99S0J?=
 =?us-ascii?Q?zGzyq+QKMerQHZacsa4ChaVl5btnITSyqoHLDkeynGqZgZOt2mEn/NQirTdd?=
 =?us-ascii?Q?FE13BbViVp0dbfkIZZnlnV7CffS7+ooE0Ngtv7IjgQWBjj+dTtRou67OAXua?=
 =?us-ascii?Q?3/Yi3j77WxAOH2Aqi3K1UGLmCo/Pe3VzPFPW0lTkpSLQqv4Qy5QA3JM5tyhM?=
 =?us-ascii?Q?roDj1oqCM2PdlOsBvQWwf2H3AakTpWDrpkLU0Gt3G+9uxB83Kuvn3qADLRGT?=
 =?us-ascii?Q?25GO49DFKca443tL2gmBGg2sxtyhrBEoMsqM2C5uH5zv0PlflRnntr/8g437?=
 =?us-ascii?Q?3o8n5JSO19GjQkmqZnQmTlNuxWf60ZO6BT5ZxC+o+sbUffNAdX5KJPiYHz3S?=
 =?us-ascii?Q?NQH5ndgMydAHrJ/5CyxkUHrC05j3aXzM830QPsmj1iRnxXsRSiMazy7tauSz?=
 =?us-ascii?Q?XNhbQMkYM7hxmH4dtXnIQLT/gKzB2TsdnRYn7rD2Fj3h7O49auVsST4yps7C?=
 =?us-ascii?Q?QPJQMUd9OqiF7z1STQkD6R7ks8tAq7Qmi34/gtv2MowQ6dyB+7/0uc47Scp5?=
 =?us-ascii?Q?fjF2eQb/MsBxYd3iQwqjspw4lrVVGU9nw4NNhse046Jxk24e79psbLgcLT/t?=
 =?us-ascii?Q?6CJoweu+ZRlOuzhGAmNQHfN2HB7O3pEeV4MFps3sqcrvJLxz2vtX9IehRKDK?=
 =?us-ascii?Q?mxpYG/iboV8ZOJeGJQZSkri83jR44MQgAxDdvhKK?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR11MB463370999CFA369CBA032CB294882MW3PR11MB4633namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e725cbf-02c8-4740-e302-08dcc3165bf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 01:53:17.8831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TtMSVvZPtXck3CgPVK6yBQHYKChgycmTjL7Fbfc6p2ZBNq/xOWw1sfGyKS9y0NmK12hAdZ012oFhCXkdk+z2XOxtMYh1k7PhrM6qXX9Azv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Proofpoint-GUID: hykg1gC41dSK-518nOVUviq5o0cBuDP5
X-Proofpoint-ORIG-GUID: hykg1gC41dSK-518nOVUviq5o0cBuDP5
X-Authority-Analysis: v=2.4 cv=b+3g4cGx c=1 sm=1 tr=0 ts=66c7eb90 cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=m8ToADvmAAAA:8
 a=0ibhm-HuDi_CSY2Ck8kA:9 a=CjuIK1q_8ugA:10 a=0F8E_x0qTGVQJaKm:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203677

--_000_MW3PR11MB463370999CFA369CBA032CB294882MW3PR11MB4633namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please drop this patch which has been upgraded in master recently

//Hongxu
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of hongxu <hongxu.jia@eng.windriver.com>
Sent: Friday, August 23, 2024 9:48 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [poky][PATCH 5/9] rpcbind: 1.2.6 -> 1.2.7

Rebase 0001-systemd-use-EnvironmentFile.patch to 1.2.7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-systemd-use-EnvironmentFile.patch    | 30 ++++++++++---------
 .../{rpcbind_1.2.6.bb =3D> rpcbind_1.2.7.bb}    |  2 +-
 2 files changed, 17 insertions(+), 15 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.6.bb =3D> rpcbind_1.2.7.=
bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-Environ=
mentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-Env=
ironmentFile.patch
index 79dc96050e..87f6133879 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFil=
e.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFil=
e.patch
@@ -1,42 +1,44 @@
-From da528d5d60137f13202102b53cf178aba45849a5 Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan.agner@toradex.com>
-Date: Sun, 6 Oct 2019 00:05:54 +0200
+From aca8799a29c2a94ab596b5629a4d16f4e6d5692c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 22 Aug 2024 12:55:52 +0800
 Subject: [PATCH] systemd: use EnvironmentFile

 Use OE specific environment file.

 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+
+Rebase to 1.2.7
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac               | 2 ++
- systemd/rpcbind.service.in | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
+ systemd/rpcbind.service.in | 1 +
+ 2 files changed, 3 insertions(+)

 diff --git a/configure.ac b/configure.ac
-index 2dd9471..47a46c0 100644
+index 8f4cef3..4705413 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -69,5 +69,7 @@ AC_CHECK_HEADERS([nss.h rpcsvc/mount.h])
+@@ -86,5 +86,7 @@ AC_CHECK_HEADERS([nss.h])
  # 2 "evals" needed to expand variable names
  AC_SUBST([_sbindir])
  AC_CONFIG_COMMANDS_PRE([eval eval _sbindir=3D$sbindir])
 +AC_SUBST([_sysconfdir])
 +AC_CONFIG_COMMANDS_PRE([eval eval _sysconfdir=3D$sysconfdir])

- AC_OUTPUT([Makefile systemd/rpcbind.service])
+ AC_OUTPUT([Makefile systemd/rpcbind.service systemd/rpcbind.socket])
 diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
-index 7b1c74b..f45ee1e 100644
+index c892ca8..e0511bd 100644
 --- a/systemd/rpcbind.service.in
 +++ b/systemd/rpcbind.service.in
-@@ -11,7 +11,7 @@ Wants=3Drpcbind.target
-
+@@ -12,6 +12,7 @@ Wants=3Drpcbind.target
  [Service]
  Type=3Dnotify
--# distro can provide a drop-in adding EnvironmentFile=3D-/??? if needed.
+ # distro can provide a drop-in adding EnvironmentFile=3D-/??? if needed.
 +EnvironmentFile=3D-@_sysconfdir@/rpcbind.conf
- ExecStart=3D@_sbindir@/rpcbind $RPCBIND_OPTIONS -w -f
+ ExecStart=3D@_sbindir@/rpcbind $RPCBIND_OPTIONS @warmstarts_opt@ -f

  [Install]
 --
-2.23.0
+2.27.0

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-=
extended/rpcbind/rpcbind_1.2.7.bb
similarity index 96%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
index aeca86e564..d308071d29 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.=
tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[sha256sum] =3D "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5=
e83b9defeee8de"
+SRC_URI[sha256sum] =3D "f6edf8cdf562aedd5d53b8bf93962d61623292bfc4d47eedd3=
f427d84d06f37e"

 inherit autotools update-rc.d systemd pkgconfig update-alternatives

--
2.27.0


--_000_MW3PR11MB463370999CFA369CBA032CB294882MW3PR11MB4633namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please drop this patch which has been upgraded in master recently</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
//Hongxu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of hongxu &lt;hongxu.jia@eng.windriver.com&gt;<br>
<b>Sent:</b> Friday, August 23, 2024 9:48 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core] [poky][PATCH 5/9] rpcbind: 1.2.6 -&gt; 1.2.7</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Rebase 0001-systemd-use-EnvironmentFile.patch to 1=
.2.7<br>
<br>
Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
---<br>
&nbsp;.../0001-systemd-use-EnvironmentFile.patch&nbsp;&nbsp;&nbsp; | 30 +++=
+++++++---------<br>
&nbsp;.../{rpcbind_1.2.6.bb =3D&gt; rpcbind_1.2.7.bb}&nbsp;&nbsp;&nbsp; |&n=
bsp; 2 +-<br>
&nbsp;2 files changed, 17 insertions(+), 15 deletions(-)<br>
&nbsp;rename meta/recipes-extended/rpcbind/{rpcbind_1.2.6.bb =3D&gt; rpcbin=
d_1.2.7.bb} (96%)<br>
<br>
diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-Environ=
mentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-Env=
ironmentFile.patch<br>
index 79dc96050e..87f6133879 100644<br>
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFil=
e.patch<br>
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFil=
e.patch<br>
@@ -1,42 +1,44 @@<br>
-From da528d5d60137f13202102b53cf178aba45849a5 Mon Sep 17 00:00:00 2001<br>
-From: Stefan Agner &lt;stefan.agner@toradex.com&gt;<br>
-Date: Sun, 6 Oct 2019 00:05:54 +0200<br>
+From aca8799a29c2a94ab596b5629a4d16f4e6d5692c Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
+Date: Thu, 22 Aug 2024 12:55:52 +0800<br>
&nbsp;Subject: [PATCH] systemd: use EnvironmentFile<br>
&nbsp;<br>
&nbsp;Use OE specific environment file.<br>
&nbsp;<br>
&nbsp;Upstream-Status: Inappropriate [OE specific]<br>
&nbsp;Signed-off-by: Stefan Agner &lt;stefan.agner@toradex.com&gt;<br>
+<br>
+Rebase to 1.2.7<br>
+Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
&nbsp;---<br>
&nbsp; configure.ac&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 ++<br>
- systemd/rpcbind.service.in | 2 +-<br>
- 2 files changed, 3 insertions(+), 1 deletion(-)<br>
+ systemd/rpcbind.service.in | 1 +<br>
+ 2 files changed, 3 insertions(+)<br>
&nbsp;<br>
&nbsp;diff --git a/configure.ac b/configure.ac<br>
-index 2dd9471..47a46c0 100644<br>
+index 8f4cef3..4705413 100644<br>
&nbsp;--- a/configure.ac<br>
&nbsp;+++ b/configure.ac<br>
-@@ -69,5 +69,7 @@ AC_CHECK_HEADERS([nss.h rpcsvc/mount.h])<br>
+@@ -86,5 +86,7 @@ AC_CHECK_HEADERS([nss.h])<br>
&nbsp; # 2 &quot;evals&quot; needed to expand variable names<br>
&nbsp; AC_SUBST([_sbindir])<br>
&nbsp; AC_CONFIG_COMMANDS_PRE([eval eval _sbindir=3D$sbindir])<br>
&nbsp;+AC_SUBST([_sysconfdir])<br>
&nbsp;+AC_CONFIG_COMMANDS_PRE([eval eval _sysconfdir=3D$sysconfdir])<br>
&nbsp; <br>
- AC_OUTPUT([Makefile systemd/rpcbind.service])<br>
+ AC_OUTPUT([Makefile systemd/rpcbind.service systemd/rpcbind.socket])<br>
&nbsp;diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in<=
br>
-index 7b1c74b..f45ee1e 100644<br>
+index c892ca8..e0511bd 100644<br>
&nbsp;--- a/systemd/rpcbind.service.in<br>
&nbsp;+++ b/systemd/rpcbind.service.in<br>
-@@ -11,7 +11,7 @@ Wants=3Drpcbind.target<br>
- <br>
+@@ -12,6 +12,7 @@ Wants=3Drpcbind.target<br>
&nbsp; [Service]<br>
&nbsp; Type=3Dnotify<br>
--# distro can provide a drop-in adding EnvironmentFile=3D-/??? if needed.<=
br>
+ # distro can provide a drop-in adding EnvironmentFile=3D-/??? if needed.<=
br>
&nbsp;+EnvironmentFile=3D-@_sysconfdir@/rpcbind.conf<br>
- ExecStart=3D@_sbindir@/rpcbind $RPCBIND_OPTIONS -w -f<br>
+ ExecStart=3D@_sbindir@/rpcbind $RPCBIND_OPTIONS @warmstarts_opt@ -f<br>
&nbsp; <br>
&nbsp; [Install]<br>
&nbsp;-- <br>
-2.23.0<br>
+2.27.0<br>
&nbsp;<br>
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-=
extended/rpcbind/rpcbind_1.2.7.bb<br>
similarity index 96%<br>
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb<br>
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb<br>
index aeca86e564..d308071d29 100644<br>
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb<br>
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb<br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-$=
{PV}.tar.bz2 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://rpcbind_add_option_to_fix_port_number.patch">file://rpcbind_add_=
option_to_fix_port_number.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-systemd-use-EnvironmentFile.patch">file://0001-systemd-use-=
EnvironmentFile.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
-SRC_URI[sha256sum] =3D &quot;5613746489cae5ae23a443bb85c05a11741a5f12c8f55=
d2bb5e83b9defeee8de&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f6edf8cdf562aedd5d53b8bf93962d61623292bfc4d47=
eedd3f427d84d06f37e&quot;<br>
&nbsp;<br>
&nbsp;inherit autotools update-rc.d systemd pkgconfig update-alternatives<b=
r>
&nbsp;<br>
-- <br>
2.27.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW3PR11MB463370999CFA369CBA032CB294882MW3PR11MB4633namp_--

