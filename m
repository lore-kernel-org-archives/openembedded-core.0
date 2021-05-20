Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1803.1621549905237484445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 15:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C5xGNIKp;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077456f0b7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14KMSJRV029668;
	Thu, 20 May 2021 15:31:35 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 38nwrpr4y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 May 2021 15:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncIpIbGVXlf6B+mUG+nI1/yRBkXPsE8mzJqAHuifLyRC30Hoo6j5GIJVz0C7Q7XHm++hzcUMIhs1bAY7rZ78m82MsXhpeINIZ/bL9QM+Vzm9W9uYadUA9qd+DJJQH8D6p6XZZd4iKvJxvjZWI4c0nQApKZEYurbtTG1FZMmTWKtGGcC9Yyx90n54Julqc0LJdmjb80hZTjlkapPhyziwz9SUjcAgQ2JbxRCtzkr+ilY1mTrCL4tyxWIrI+76UPeZwattRIMusflc2uAwgb4zCw7YU3T366euvjNb44vk6/+IxDR3+o19GUavfxsO4MTa8yL70nd+xofzxIPvNqDiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAHxBiq85NmlouGJCUiIlpSVCvAfnbVnIpuntMzwkOs=;
 b=ReQnIcA7AvlbJrxMm00vSyob2fyKTjY4eXNh/a5LNmOe4fmTiXgzSVL7RNhGEIhk+IxJLRCdgWZB7bj1YeSfXEAQSOQgaoC93U7W/dxuTHIwGQb1RCFgmrVgdyljITNom1lSVifXpE+URHSZwbbOTJGbwxtEH5tykkDVPkPYpIu5xG/hR21OqDkn6fWW+j8f9sNFKwXjGfY+EedO8BPM2yn/V4PZMOyX61v81vTTHaFOzP4gzpPBiQP1Z0N9szaYuYtnoFxV05M73WsKd6oWkXa6lnTim5Rmm6vQMOWFYu1mV3m39CpTKE64a5aRGE2ef3nXp6BTb7iOaMw1pUiFrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAHxBiq85NmlouGJCUiIlpSVCvAfnbVnIpuntMzwkOs=;
 b=C5xGNIKpwL9BBaV4Lj1kaMcY5XuP6Mk81e1ihTluxole6ctb3aW8+JeFT4ZqWAlNU8+k08x3YzF0RFq+vltBEsMrYU49u7kHUDCMEx4n0gf7S/NJ1+bKcpLAiEmpEFcTt5pgyKjMjIFZcSDgaUogj3R/JgPwWxmzqRpLYa6bkV4=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4722.namprd11.prod.outlook.com (2603:10b6:5:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 22:31:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 22:31:34 +0000
Subject: Re: [OE-core] [PATCH] libxml2: upgrade 2.9.10 -> 2.9.12
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org,
        "Tascioglu, Tony" <Tony.Tascioglu@windriver.com>
Cc: Jon Mason <Jon.Mason@arm.com>
References: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
 <1621468435-21509-5-git-send-email-wangmy@fujitsu.com>
 <8a5d37690356e7c9e063ca098e2ed532d9702da2.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <e856de39-d194-7926-8963-b316a45c90e3@windriver.com>
Date: Thu, 20 May 2021 18:31:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <8a5d37690356e7c9e063ca098e2ed532d9702da2.camel@linuxfoundation.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::36) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.3] (198.48.226.187) by BYAPR05CA0095.namprd05.prod.outlook.com (2603:10b6:a03:e0::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend Transport; Thu, 20 May 2021 22:31:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f11c3a98-7cea-4748-ff6c-08d91bdf05be
X-MS-TrafficTypeDiagnostic: DM6PR11MB4722:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4722C763468C0ECB650C4784F82A9@DM6PR11MB4722.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uwSE9nZGf2eFwTR0z6PD5RgC82LEeb9XMUrwpby2RwmvUx3HnZS+tkqVw+Iy5wZ5DP4nn5ukoPA/3aTlIKRrK6yWM9RULr+6L+iDRjQrJi0OukR/fT8jxa4pl3/afC1k5L7fvBFBgU8AVY+zrM7dCouRoMAw8ol0LfiZJQqjtReh/1Om3i24G87iwDCij3DsYYfs/MEFfW+ZDjn4NBWgmjpxywKJbAu6sClmBMhZu1OWCJp3Q0VhRvRZPaParkB5g0vV7PkX/XKzKji65c46OS795+cGthHqNQYgOc9uqzTUMrxFRlLenJBlI8eArJszIe09txfuWcsN4HDKsDvHwL1CK8SSlhOo9s9WsNpt3RDWcYWXSUUuUsEZdDR6Td/RvoMx42JaAVlHnFg2AyAESw/teE9rQYBh8FKJL1wAJFxxdhfClqUfglW2EPyIlIcyLOcuKAOng0sJnmFhxeMA1NBVSWEEKquo98Oggp2jAsXw9/8AItum+CFIgK44HmjePb6NEPE2n816T+qQlg8BxwV+vEZ2QAIiARjRhXUxROTv+VSAPRZtn+RJxP8igQr49u2LPkN6wN0lnSYMWP695HYBCCKjPVkyo0vBvKd5FqETgonyq4K6RUcJZeDVumVZzx5+i+kAMGBFu1dUl4BO4WYgtb9AznXxZM024YNXnaAi5JgP8sC4r/QdoEx8qqu1mdAYPOkb5hu+sdUet0/vxR5G5NGoZsQJV8yob9TwFqATnXYi0eB5Gh9anfvK3uRgz5qfuGKzaPiFZJ02L2szlXSxXlNiIwqTFQdiT4vKaTb344JVdJN2Q4ojHSAB5/MlVRX2Zwi/qanht5GXHdrlLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(366004)(136003)(376002)(36756003)(53546011)(8676002)(478600001)(83380400001)(966005)(31696002)(5660300002)(31686004)(186003)(6636002)(16526019)(4326008)(110136005)(8936002)(2616005)(38350700002)(956004)(66556008)(6486002)(2906002)(66476007)(26005)(52116002)(38100700002)(16576012)(86362001)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QUVZbkRHbEVKeFVvM3VLRE5UQ21EbGNIZmFSUjdwY2Y0SW5MWklaRUhhMVZ4?=
 =?utf-8?B?bEhwbm5URTlXTXhpeEtJNXVxMWYxR25yQ2V3L0pwTVVRWDFBTUV4Zmx0eklR?=
 =?utf-8?B?R3Q1QzFkSTlxTkVrOXRoS0tQdVBkSmlkNmt3VmVsdGdkc0tZc0RwcFJObzU5?=
 =?utf-8?B?V1haWXRRYlg4d2dXckdudmhkZlpDeDVCVncra0xRZWQrVnRwUStiV3hPYTho?=
 =?utf-8?B?UG9UUWxTQm9LMkFvUE0vM3g4YVVaSlltMnNSeDczQ2cxMnh5SldzeVJFd2JS?=
 =?utf-8?B?MmtJUitGREhGSThYY2t6c0s5QTNYS3hpZ1NkVkdYZHl6RHBQeXBScGQzYTh6?=
 =?utf-8?B?cVY4VmZNMlFaOEVZa3VqaC82U2NZTE4vWFZKc2pjTWYvYitQSHJyeFd0TTd4?=
 =?utf-8?B?QUJqTGVoeDVLeUNES2NZcTBZQ2hTV2VEQ25mZk9odE05MzJSTVVVQlpDVXZY?=
 =?utf-8?B?L1c3czFsK1ZOK2dEZUpFNnUzWUFQRGVPS2YxZHkzaTY5QnVadzdJelREOVJO?=
 =?utf-8?B?Tys2N0tmWWo0V1NhQmhBTjB3NkR2Q0RkTHN6S2txM2tSVndLL2Z6U05mZjR1?=
 =?utf-8?B?SDYyNDBCcUVXUWZJVVF0Q2I3c0hVV1VzcHphT1d4c3BYWURMMkJBc0FJZldY?=
 =?utf-8?B?cG4xT0FmeDFYTkJQU2lnMzFDWnQxM2VGSVhubGpJVElKMy9UNUNhcWFlN3R2?=
 =?utf-8?B?UnV3NThibHd1SllmZFhqbTVTWEhIV2pHNEJtamtveDhqcXNuRFh3U2QrRnBF?=
 =?utf-8?B?SUpjS29ocUtQM3RCMDh4WkRqRjhYR0FmMWxvM016cHo1eElmdjNxWVVSQkto?=
 =?utf-8?B?QWFncUh3Y0NML2l4T2dFekhneFQ3elkxb3lrNnIwem1EZTdEM3NEOXVGVDBu?=
 =?utf-8?B?VlBqZDd4MW51a1p2R1piZVgwcWRWbXVKR2tMZTBHeFlWUmVTekRtNkRRaEtW?=
 =?utf-8?B?Zmx1WVl3cXJPSWRKOGJLSDJTV3hjbE82ZlRLbW5ndUtSeU1qS0tRdmptd0JC?=
 =?utf-8?B?VkdPUDVpdkNXekwzV0M2SEZ4TW1zdnhNN2QvaXphYXpmNkFoZW4zWDc1anVR?=
 =?utf-8?B?ek9TdVhjT2ordCs4Y3Q2RDE0U29KMkh4SHFlZVVHaEkrbDZBaVJjSGJ0U0tS?=
 =?utf-8?B?QmFvd2xOT3J5c1lDb0NzenBxdjhFQk84dXBSRTlMaVEzckl3UnhXQ0xVTWEv?=
 =?utf-8?B?U25PYWpMMnRJMTNkN1dsODRrSWZObXdLdlhTYVZCaTNpZkoxa24raE9xZWVp?=
 =?utf-8?B?UjhSUklCbVYzY3A5SythM3huRGFpZERsYVR5RU5yVTJLSWMwNS9zNzY4NFhy?=
 =?utf-8?B?blBURHgwRmUzd0tWckt5SGdzS3NRN2VWWTRZaHIweGhUZUwyTzJORThxRTk5?=
 =?utf-8?B?aVc5eXhTQTd4RXU2QUZ0MlRreUh3SU5DU2M3NC9vMmtDS2JnVEFnaVJNYXF2?=
 =?utf-8?B?VGZEMGFjUnYvVnJVTmVuMktZRjk2MjFlM1JCdHorcTNxYmMrUHdKSWNVN085?=
 =?utf-8?B?Wm5ObE1DN1dBUmNvN3c0a0lhZGRBN2IxM3hLczdaK1I5VkovN2p1R29talJU?=
 =?utf-8?B?WkR0aHRSOFROcUJ6K09QQzF5WUtjVmp0RFlUUENuMXRnQjY1QkZIZkRZd2Vk?=
 =?utf-8?B?Q3B0N2N5UzlhNW5vWWVLbFV3WW1qbGJ5WGR2M0JmSzFSRFc0MUZSVWNCb01F?=
 =?utf-8?B?U3BoREZBRTVlVk9UVmNMZVkzN2dFeGhad2REdkZZbDliK0h3UVRSSDdCcG9S?=
 =?utf-8?Q?3EMjP1aH26JS0GqJLtyqH+UX/5IgRH1QkIt1Db6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11c3a98-7cea-4748-ff6c-08d91bdf05be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 22:31:34.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSQZORBO+2ptxTss5SOHUNDSnOEZUZgXqa3kkfIU6JCDuSDUD+YytqIScdjq8rkH4VIsh7ohSOgFm2lgDPf3UC8fGvUGvvfGT2UKT4wCPoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4722
X-Proofpoint-GUID: s7Ov1LFPZ4WKEJn2B7CZCFIdKbCv9OpR
X-Proofpoint-ORIG-GUID: s7Ov1LFPZ4WKEJn2B7CZCFIdKbCv9OpR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-20_07:2021-05-20,2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200142
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 14KMSJRV029668
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-05-20 2:09 p.m., Richard Purdie wrote:
> On Thu, 2021-05-20 at 07:53 +0800, wangmy wrote:
>> CVE-2019-20388.patch
>> CVE-2020-24977.patch
>> CVE-2020-7595.patch
>> fix-python39.patch
>> removed since they are included in 2.9.12
>>
>> refresh 0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
>> and libxml-m4-use-pkgconfig.patch
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>  =C2=A0...he-python-tests-if-python-is-enabled.patch | 33 +++----
>>  =C2=A0.../libxml/libxml2/CVE-2019-20388.patch       | 37 --------
>>  =C2=A0.../libxml/libxml2/CVE-2020-24977.patch       | 41 --------
>>  =C2=A0.../libxml/libxml2/CVE-2020-7595.patch        | 36 -------
>>  =C2=A0.../libxml/libxml2/fix-python39.patch         | 94 -------------=
------
>>  =C2=A0.../libxml2/libxml-m4-use-pkgconfig.patch     | 29 +++---
>>  =C2=A0.../{https://urldefense.com/v3/__http://libxml2_2.9.10.bb__;!!Aj=
veYdw8EvQ!Of4iuguok63khz0zIh3LZNnCREuU7PA88OAqhb483O5j1FEeMdOan87_qMjFCD9ea=
ZRqvQ$  =3D> https://urldefense.com/v3/__http://libxml2_2.9.12.bb__;!!AjveY=
dw8EvQ!Of4iuguok63khz0zIh3LZNnCREuU7PA88OAqhb483O5j1FEeMdOan87_qMjFCD-5d7NW=
hQ$ }  | 14 +--
>>  =C2=A07 files changed, 35 insertions(+), 249 deletions(-)
>>  =C2=A0delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-203=
88.patch
>>  =C2=A0delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-249=
77.patch
>>  =C2=A0delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-759=
5.patch
>>  =C2=A0delete mode 100644 meta/recipes-core/libxml/libxml2/fix-python39=
.patch
>>  =C2=A0rename meta/recipes-core/libxml/{https://urldefense.com/v3/__htt=
p://libxml2_2.9.10.bb__;!!AjveYdw8EvQ!Of4iuguok63khz0zIh3LZNnCREuU7PA88OAqh=
b483O5j1FEeMdOan87_qMjFCD9eaZRqvQ$  =3D> https://urldefense.com/v3/__http:/=
/libxml2_2.9.12.bb__;!!AjveYdw8EvQ!Of4iuguok63khz0zIh3LZNnCREuU7PA88OAqhb48=
3O5j1FEeMdOan87_qMjFCD-5d7NWhQ$ } (88%)
>=20
> Fails on the autobuilder in testing in ptest:
>=20
> https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/typhoon=
/*/builders/82/builds/1815/steps/12/logs/stdio__;Iw!!AjveYdw8EvQ!Of4iuguok6=
3khz0zIh3LZNnCREuU7PA88OAqhb483O5j1FEeMdOan87_qMjFCD-v3s3gNw$
> https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/typhoon=
/*/builders/81/builds/2104/steps/12/logs/stdio__;Iw!!AjveYdw8EvQ!Of4iuguok6=
3khz0zIh3LZNnCREuU7PA88OAqhb483O5j1FEeMdOan87_qMjFCD-kXlczAw$
>=20
> Cheers,
>=20
> Richard

Tony has an update posted to the list:
   [PATCH] libxml2: Update to 2.9.12
that passes ptests at least locally
and I know that we fixed the 'fuzz' problem
and even explained in the commit log! ;-)

../Randy

>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
