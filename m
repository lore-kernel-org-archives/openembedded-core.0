Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.515.1624393632702221354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 13:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WR53Ubls;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1807ab70cc=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MKQXtI023105
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 20:27:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39avpms1t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 20:27:11 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15MKRBZU025867
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 20:27:11 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 39avpms1t5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jun 2021 20:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7jZsFJu8bGBFkHnqBvm/WnwjBQwNThlSY04ZJVki1mXEvMjZ9D61v7VBZtzK9a1WkNWI5Ul1ZVafPT27JNsrxni0aYqH0DqSWN0ATL5DvzOmoLXzU01wRTY77yG4eVK+67L3aJ5lAtyszb8kV/077yU/Lf9r/sQZPDKPPVTXRb29H1jZKnIR3RHTfTj5lctqjdbL0/wBqz6mQpS5rbD1XKfpk+f57c4DsxjwiFyTSECVb2YMmG7PxYV3Zn0HtMnmKelVhgaXbZRvECmS9//uYtz9gew+gyeKn5LhFkaoBees0N647t0iWFp05WBoxV7VNqWerVIERChafgwdqBndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVYjcNY8XPa9oBAb1F2z/o/Qv34Sz6s/20M28shA/W8=;
 b=H/W+7fZy46Q488no3pGENEo6UnPjfTgpjXlgub1UvjlmjAqNjEyP6Tw3lz43YIrmgwcCjWljejM5+8lOcVqfagq1NLtt5vRaZv0FNbw9b6tHp8bjrWjffL7Ou1fUBTF53wh74+mP5o+k14proJ/ImLVuzVBoPJe3xZ6ITUVg5AEcRfiLi5UZ/2RO7T6VhCnF7UweGkdYBJwG7U9dXiPg75fbmQnMtLRXxlEJF+jKf6hduio7mCpGo9zIY63lDjjvcsHD8uiq1FzGXuf8mQj9Knob6IAaEZctsqUnqCtn/K2Z8++Fs/LRc1gULEQIwcKpG9lWAjJbAJbrbnjA15MCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVYjcNY8XPa9oBAb1F2z/o/Qv34Sz6s/20M28shA/W8=;
 b=WR53UblswjPWYmDH4hLY2cSDd2sYCNvPWEt4jYZx8uC1y6o4yYlsPkZO6UQD0t+4Xc5NwEeQOIN/p6uvRucYp8XV+yY/qUGgSpCRujyVVd8GPEQDIqx3Kxv8vG3MRBi9rwOyp9bj5LD/SiEVHMsw3IUeTCdgCn8OqOrKMI+FqWw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4181.namprd11.prod.outlook.com (2603:10b6:a03:18c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 20:27:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 20:27:05 +0000
Subject: Re: [OE-core][PATCH 1/2] python3-pip: upgrade 20.0.2 -> 21.1.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        "timothy.t.orling@intel.com" <timothy.t.orling@intel.com>
References: <20210622173743.1231362-1-trevor.gamblin@windriver.com>
 <168AFBC4AA915097.26331@lists.openembedded.org>
 <CANNYZj9vsQVv--NmAGoHtwn6NbR18E9vb7GQJOx_iJ72e3r0rQ@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a42d85d3-80b1-6c30-3a37-548d54185249@windriver.com>
Date: Tue, 22 Jun 2021 16:27:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CANNYZj9vsQVv--NmAGoHtwn6NbR18E9vb7GQJOx_iJ72e3r0rQ@mail.gmail.com>
X-Originating-IP: [2607:fea8:c29d:d7c0::6e79]
X-ClientProxiedBy: MN2PR15CA0065.namprd15.prod.outlook.com
 (2603:10b6:208:237::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::6e79] (2607:fea8:c29d:d7c0::6e79) by MN2PR15CA0065.namprd15.prod.outlook.com (2603:10b6:208:237::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 20:27:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f2551c3-5ea9-4fbe-b098-08d935bc19cc
X-MS-TrafficTypeDiagnostic: BY5PR11MB4181:
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-Microsoft-Antispam-PRVS: 
 <BY5PR11MB4181D16AF6BFA2C19808102D9F099@BY5PR11MB4181.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 acZH/GtVos1D4WsJorreU0aP1CBwhBw03Sc2VXqDnJ3dBCsu9jqyjE31y69lJLcjpuEPaKKn/gC8qrsKIeasw7pwiObsAQyQKdLz5mTas2aaYRYloYjBFOOrZHda88GsOPj8c4PtozDM6nRW9XqFVGumYz9g0ckxg6kLFV5whbmvONd499XJn1qQl0E9T5yq7KznYoorpTcSgqtYAwM9HnINuwEREctNCCxJ6MErTEmwaAR9Z4PUg0nbGLT7itZlcbgBq+yxtkMO+a2Tj2iPmMiO5HwqsMDXNaT35KP1wY8CyKDkRNRFpIq+G8xxU+QbLKp1GHt8yDtvEjtZyDEHO9z83D5h6jiV56nlrILq4PWnzOyfekcmbGrVaLL3b42ABDcMGRkpqQ9J1IN1bctrI609ecA3pWcVbfeEg6Xnjr0AGmNJDZBal8mFgXHd8E7oxJ1ER+NAabvCLFvprbyALp2JN0uC1oVcNxgzBXxnz133KVanVmeu45MDPN3tDTp+m+ogvh+7jEBB9iI4JjRhb9pWneAfNk31dUH/8ldUp61M45jmxGMXd9yEWLhadQgBgtLtLhYjfnyt+Urh5JxkArspbChg0rILprDPvc7EcjND4PSUkO5HhDxktwDdUC/pnhitxBhCf8vxMvVz6k8cvVPzlsrFwCXCxsvtrS1F9xlSgnJ2SToJDXtsYYDC7PrxUB1pDOzcH5W9c8QpKpMBhAKeIQJYBtj8fC5RTbLlypmEGV2+FKBcXFSg89/GGAdyfiyYrEAnl7D8kAOTjF1wBTVWVKJyVJJsfu+ZsfW016QjN99KbXRdlhjJBltTLYtzS2TPE0ufDzMHe7o2pRtIuA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(136003)(396003)(376002)(478600001)(2906002)(38100700002)(6486002)(31696002)(86362001)(33964004)(66946007)(966005)(186003)(16526019)(2616005)(166002)(36756003)(4326008)(30864003)(316002)(5660300002)(8676002)(83380400001)(66574015)(54906003)(31686004)(66556008)(6916009)(53546011)(66476007)(8936002)(44832011)(45980500001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?MnJTd3Y1V0EvMmkrSTNwSm96ZjZ0Rlk1bFlFN1BNY2cySWdoM3dINEoyZU1X?=
 =?utf-8?B?dU5UT2FOY0tKdnVmdkpONGd5NzIwaHJBSk5NNVdlNFUxTmVWVGJFdHlERjQ4?=
 =?utf-8?B?b0tqbGxJZTJoTUNQdDhTZTZzS1ZCZmpXV3NTaC9jV3ExQXFBc29GWDcwYXRK?=
 =?utf-8?B?TllRU0pwdG1HRGF5WUxNU1ZGbzcrNFdtbEVMMTRydTcxWmdUWU1qMHc1K2l3?=
 =?utf-8?B?cStmSFhxRVBCeEZBS1VManpWeWV2eEVpNzVjU2RJOEZMVWZNR291bTMxenZO?=
 =?utf-8?B?N04wTndTSzdlUE1Db212eEhINzdkT3R3ZGIyWFRhUThRU0I4RlY3ZEZSU3lq?=
 =?utf-8?B?Z1NuVnRBZ1JKeHhyVDFvNi81N2xoaW1KTm01K3FVZTVibTd1WTdDUGh2a0hm?=
 =?utf-8?B?NUJQdGlMaHc4cG56ZWhQRUdXM21IaVZNYm1NQkVvMkJWNWtuNHREMWVGSEZo?=
 =?utf-8?B?VWRXSXRVYlAxQ2JQK1FFRzQ0K1hFSUZheDhIcVpScDI2cGQ4bnpWeEpJQTgx?=
 =?utf-8?B?K2wvYmhwaWVZOGZNejhVT2g3dDNma0puelFvaFJhelZVTzdYb20wakRDano1?=
 =?utf-8?B?Z1ZIV0dGSS9BanpQK0pPUDF5Sm90ekhNcGhoU29vSUh5UWhiR0JVNkJZZ2p6?=
 =?utf-8?B?VUl6VU9zOHJmcGQxczA5TS8vZkpORm82cW15ME9LM2VCSWpwOVpJM2FiR0xl?=
 =?utf-8?B?VlVQUkdGeVpONlZXbUFOWTBmMngyTzhwcExXcUNhVlI5SzF1V3NDMEE5dVQx?=
 =?utf-8?B?V3BkUUtXUndWN2VjNldsbFVHb1BFOEdOdEN3blpobWpJYWZwRVZoWTdjd0d1?=
 =?utf-8?B?ZWM0TnVTWlFVczBNYVQ5TVJqb0ZFYzI2NnRVOWtPWWZqS2NlcE53bUh6NTli?=
 =?utf-8?B?bzFiK3FOWlpzQjlEVk1LdE5wTG5VOVlGRXhyOTNHWkRiYklnRy91OTRiOFp2?=
 =?utf-8?B?NUF0ekFWc2N2WHdYSEozMGdBQXJHNVErbmVDdFl0ZXVxL3c0c0xhU1JZZStG?=
 =?utf-8?B?ZnJpTkhHejg3ditjbWh2eDNMVTR5MVpCenlJd0taeHR3MTJiNWRyNm1KdXBD?=
 =?utf-8?B?SUtmL2wvTmg1VklSOEFpeEZESkhFaGpQNjFpd29DVmI4dlloQng3dUVaM1BI?=
 =?utf-8?B?ZmE4a0lBazFCNWVRRWhhK3loV2E3b29YbTR5UVgyTFlJMk9PT085UWsxOUta?=
 =?utf-8?B?NTVWeEdzSjQ1WldzbUovUWNyZ1lHaVVFYmpPR3ZIcURmL1VEWE5jd1ZjTjM3?=
 =?utf-8?B?cFhGK2RIM1c3a1dPd0RlNzJ5WHhPb0JUcjl2c0o1UkpxRXF3Z0FINDF1RjRU?=
 =?utf-8?B?REtJeTZoL3dINmFQdHpqak5mSUNnckVuanN0ZTE3eVRUeWZjMHh6S2Jsc2VZ?=
 =?utf-8?B?TlZmOHlSVHFuTFlmczNnc0EvRytTNG1Iam42ZytNcGxlZmVRVVRjYzBZeUdW?=
 =?utf-8?B?dHB0MjU4OFpoVnp2c1h3Y2ZrU0ErM0laVHdqVkFpSVZXZnY0N0hCeElIMjFq?=
 =?utf-8?B?OERNcGJxbWZJQVlMaFlCemxPWENDZGRpSHhMaHlHenY1R2xUa1djRUFaNXRw?=
 =?utf-8?B?S1ZXY0t4citDQ25Da2s0aENVMzdDQnBGZVAvWC95dGd4WTBYaTQ2WnhFQ1dD?=
 =?utf-8?B?S25iR1dTWWFyMHFYVXlwUUtYU1NUbElRN0svd1NNK2lRWmJidWtoajJXdzlT?=
 =?utf-8?B?Q2RMU1dzZnp2MEdtcFIwLzdxOFVkdmZyOXFKNDF4cDhCS2EzeXZ3U2JWVytp?=
 =?utf-8?B?dlRoWVRmM1R2bE5OWUdQS3JHNEZONG9NWjJDVkdDOEJCd1huNGdvVkltMWNI?=
 =?utf-8?Q?VnPI8tL4XokBZN/JAgPTeWi8+nPtE1Tzat0Ts=3D?=
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2551c3-5ea9-4fbe-b098-08d935bc19cc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 20:27:05.5372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuDr/FAcUR0yOZvvnq8pEOILpVSPD86X70GU1cNiDPletu+2sD164quqvUagBE+mxBa/3Q99R1PXYOHckJd8uhoG9wx8ogQKTARohow1qOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4181
X-Proofpoint-GUID: gvV306bRSgJ4pIUjwZgMNFYNeUKKSH58
X-Proofpoint-ORIG-GUID: weN54Tlvq74mVpAsX36D3ZfLSXAH2_Xy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_13:2021-06-22,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220122
Content-Type: multipart/alternative;
 boundary="------------9031CBE8B92B4ED228453620"
Content-Language: en-US

--------------9031CBE8B92B4ED228453620
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15MKQXtI023105


On 2021-06-22 2:47 p.m., Alexander Kanavin wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Ah, because pypi.bbclass sets SRC_URI +=3D instead of =3D. I'll queue a=
=20
> patch to fix the class.

Right, Tim noticed this too and I re-submitted a v2 of this patch to fix=
=20
the ordering of the inherit and SRC_URI lines in the recipe. Thanks for=20
looking at the bbclass!

- Trevor

>
> Alex
>
> On Tue, 22 Jun 2021 at 20:44, Alexander Kanavin via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEISK6-AA$>=
=
=20
> <alex.kanavin=3Dgmail.com@lists.openembedded.org=20
> <mailto:gmail.com@lists.openembedded.org>> wrote:
>
>     Can you please check why 'devtool check-upgrade-status' wasn't
>     able to report that all these new versions have been available?
>
>     Alex
>
>     On Tue, 22 Jun 2021 at 19:37, Trevor Gamblin
>     <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>> wrote:
>
>         21.1.2 contains a fix for CVE-2021-3572
>         (https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175ba=
e6db847cb30b
>         <https://urldefense.com/v3/__https://github.com/pypa/pip/commit/=
e46bdda9711392fec0c45c1175bae6db847cb30b__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXE6_DCCNA$>)
>
>         The LICENSE.txt signature changed due to an update to the
>         copyright
>         dates, but the terms are the same.
>
>         Also update 0001-change-shebang-to-python3.patch to cover all
>         files in
>         pip's src directory, since we need to ensure compatibility.
>
>         Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>         <mailto:trevor.gamblin@windriver.com>>
>         ---
>         =C2=A0.../0001-change-shebang-to-python3.patch=C2=A0 =C2=A0 =C2=
=A0 | 128
>         ++++++++++++++----
>         =C2=A0...n3-pip_20.0.2.bb
>         <https://urldefense.com/v3/__http://n3-pip_20.0.2.bb__;!!AjveYdw=
8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEMfxdA4w=
$>
>         =3D> python3-pip_21.1.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_21.1.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEfA=
t_Dfg$>}
>         |=C2=A0 =C2=A06 +-
>         =C2=A02 files changed, 101 insertions(+), 33 deletions(-)
>         =C2=A0rename meta/recipes-devtools/python/{python3-pip_20.0.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_20.0.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFLv=
QTN5g$>
>         =3D> python3-pip_21.1.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_21.1.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEfA=
t_Dfg$>}
>         (73%)
>
>         diff --git
>         a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-t=
o-python3.patch
>         b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-t=
o-python3.patch
>         index 00cffe169b..0187001168 100644
>         ---
>         a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-t=
o-python3.patch
>         +++
>         b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-t=
o-python3.patch
>         @@ -1,32 +1,30 @@
>         -From e7a00e9b5104ae2fbcea32a35c85760b77fae7e5 Mon Sep 17
>         00:00:00 2001
>         -From: Changqing Li <changqing.li@windriver.com
>         <mailto:changqing.li@windriver.com>>
>         -Date: Thu, 23 Apr 2020 09:42:10 +0000
>         +From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep 17
>         00:00:00 2001
>         +From: Trevor Gamblin <trevor.gamblin@windriver.com
>         <mailto:trevor.gamblin@windriver.com>>
>         +Date: Tue, 22 Jun 2021 12:31:46 -0400
>         =C2=A0Subject: [PATCH] change shebang to python3
>
>         -Upstream-Status: Pending
>         +Upstream-Status: Inappropriate (OE-specific)
>
>         -pip will drop support of python2 from 21.0
>         +Despite no longer supporting python2, some files in the pip
>         source refer
>         +to "python" instead of "python3", so patch them as needed to
>         ensure that
>         +they correctly reference the python3 binary.
>
>         -Signed-off-by: Changqing Li <changqing.li@windriver.com
>         <mailto:changqing.li@windriver.com>>
>         +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>         <mailto:trevor.gamblin@windriver.com>>
>         =C2=A0---
>         - src/pip/_internal/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-
>         - src/pip/_vendor/appdirs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-
>         - src/pip/_vendor/chardet/cli/chardetect.py
>         <https://urldefense.com/v3/__http://chardetect.py__;!!AjveYdw8Ev=
Q!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$>
>         | 2 +-
>         - src/pip/_vendor/requests/certs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-
>         - 4 files changed, 4 insertions(+), 4 deletions(-)
>         + src/pip/_vendor/appdirs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-
>         + src/pip/_vendor/chardet/langbulgarianmodel.py
>         <https://urldefense.com/v3/__http://langbulgarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK=
07ePQ$>
>         | 2 +-
>         + src/pip/_vendor/chardet/langgreekmodel.py=C2=A0 =C2=A0 =C2=A0|=
 2 +-
>         + src/pip/_vendor/chardet/langhebrewmodel.py=C2=A0 =C2=A0 | 2 +-
>         + src/pip/_vendor/chardet/langhungarianmodel.py
>         <https://urldefense.com/v3/__http://langhungarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0=
q6gyA$>
>         | 2 +-
>         + src/pip/_vendor/chardet/langrussianmodel.py=C2=A0 =C2=A0| 2 +-
>         + src/pip/_vendor/chardet/langthaimodel.py=C2=A0 =C2=A0 =C2=A0 |=
 2 +-
>         + src/pip/_vendor/chardet/langturkishmodel.py=C2=A0 =C2=A0| 2 +-
>         + src/pip/_vendor/chardet/metadata/languages.py
>         <https://urldefense.com/v3/__http://languages.py__;!!AjveYdw8EvQ=
!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$>
>         | 2 +-
>         + src/pip/_vendor/requests/certs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-
>         + 10 files changed, 10 insertions(+), 10 deletions(-)
>
>         -diff --git a/src/pip/_internal/__init__.py
>         <https://urldefense.com/v3/__http://__init__.py__;!!AjveYdw8EvQ!=
KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFPaRIkpQ$>
>         b/src/pip/_internal/__init__.py
>         <https://urldefense.com/v3/__http://__init__.py__;!!AjveYdw8EvQ!=
KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFPaRIkpQ$>
>         -index 3aa8a46..e1ad179 100755
>         ---- a/src/pip/_internal/__init__.py
>         <https://urldefense.com/v3/__http://__init__.py__;!!AjveYdw8EvQ!=
KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFPaRIkpQ$>
>         -+++ b/src/pip/_internal/__init__.py
>         <https://urldefense.com/v3/__http://__init__.py__;!!AjveYdw8EvQ!=
KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFPaRIkpQ$>
>         -@@ -1,4 +1,4 @@
>         --#!/usr/bin/env python
>         -+#!/usr/bin/env python3
>         - import pip._internal.utils.inject_securetransport=C2=A0 # noqa
>         - from pip._internal.utils.typing import MYPY_CHECK_RUNNING
>         -
>         =C2=A0diff --git a/src/pip/_vendor/appdirs.py
>         <https://urldefense.com/v3/__http://appdirs.py__;!!AjveYdw8EvQ!K=
TM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGIyyzB_A$>
>         b/src/pip/_vendor/appdirs.py
>         <https://urldefense.com/v3/__http://appdirs.py__;!!AjveYdw8EvQ!K=
TM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGIyyzB_A$>
>         -index 3a52b75..ad3f81d 100644
>         +index 33a3b7741..60b9ef5f7 100644
>         =C2=A0--- a/src/pip/_vendor/appdirs.py
>         <https://urldefense.com/v3/__http://appdirs.py__;!!AjveYdw8EvQ!K=
TM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGIyyzB_A$>
>         =C2=A0+++ b/src/pip/_vendor/appdirs.py
>         <https://urldefense.com/v3/__http://appdirs.py__;!!AjveYdw8EvQ!K=
TM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGIyyzB_A$>
>         =C2=A0@@ -1,4 +1,4 @@
>         @@ -35,18 +33,88 @@ index 3a52b75..ad3f81d 100644
>         =C2=A0 # -*- coding: utf-8 -*-
>         =C2=A0 # Copyright (c) 2005-2010 ActiveState Software Inc.
>         =C2=A0 # Copyright (c) 2013 Eddy Petri=C8=99or
>         -diff --git a/src/pip/_vendor/chardet/cli/chardetect.py
>         <https://urldefense.com/v3/__http://chardetect.py__;!!AjveYdw8Ev=
Q!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$>
>         b/src/pip/_vendor/chardet/cli/chardetect.py
>         <https://urldefense.com/v3/__http://chardetect.py__;!!AjveYdw8Ev=
Q!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$>
>         -index c61136b..a497e98 100644
>         ---- a/src/pip/_vendor/chardet/cli/chardetect.py
>         <https://urldefense.com/v3/__http://chardetect.py__;!!AjveYdw8Ev=
Q!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$>
>         -+++ b/src/pip/_vendor/chardet/cli/chardetect.py
>         <https://urldefense.com/v3/__http://chardetect.py__;!!AjveYdw8Ev=
Q!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$>
>         +diff --git a/src/pip/_vendor/chardet/langbulgarianmodel.py
>         <https://urldefense.com/v3/__http://langbulgarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK=
07ePQ$>
>         b/src/pip/_vendor/chardet/langbulgarianmodel.py
>         <https://urldefense.com/v3/__http://langbulgarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK=
07ePQ$>
>         +index e963a5097..97ea6cea8 100644
>         +--- a/src/pip/_vendor/chardet/langbulgarianmodel.py
>         <https://urldefense.com/v3/__http://langbulgarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK=
07ePQ$>
>         ++++ b/src/pip/_vendor/chardet/langbulgarianmodel.py
>         <https://urldefense.com/v3/__http://langbulgarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK=
07ePQ$>
>         +@@ -1,4 +1,4 @@
>         +-#!/usr/bin/env python
>         ++#!/usr/bin/env python3
>         + # -*- coding: utf-8 -*-
>         +
>         + from pip._vendor.chardet.sbcharsetprober import
>         SingleByteCharSetModel
>         +diff --git a/src/pip/_vendor/chardet/langgreekmodel.py
>         <https://urldefense.com/v3/__http://langgreekmodel.py__;!!AjveYd=
w8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGyKPuYc=
Q$>
>         b/src/pip/_vendor/chardet/langgreekmodel.py
>         <https://urldefense.com/v3/__http://langgreekmodel.py__;!!AjveYd=
w8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGyKPuYc=
Q$>
>         +index d99528ede..4a127ea83 100644
>         +--- a/src/pip/_vendor/chardet/langgreekmodel.py
>         <https://urldefense.com/v3/__http://langgreekmodel.py__;!!AjveYd=
w8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGyKPuYc=
Q$>
>         ++++ b/src/pip/_vendor/chardet/langgreekmodel.py
>         <https://urldefense.com/v3/__http://langgreekmodel.py__;!!AjveYd=
w8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGyKPuYc=
Q$>
>         +@@ -1,4 +1,4 @@
>         +-#!/usr/bin/env python
>         ++#!/usr/bin/env python3
>         + # -*- coding: utf-8 -*-
>         +
>         + from pip._vendor.chardet.sbcharsetprober import
>         SingleByteCharSetModel
>         +diff --git a/src/pip/_vendor/chardet/langhebrewmodel.py
>         <https://urldefense.com/v3/__http://langhebrewmodel.py__;!!AjveY=
dw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFZBNVh=
Rg$>
>         b/src/pip/_vendor/chardet/langhebrewmodel.py
>         <https://urldefense.com/v3/__http://langhebrewmodel.py__;!!AjveY=
dw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFZBNVh=
Rg$>
>         +index 484c652a4..676c1a711 100644
>         +--- a/src/pip/_vendor/chardet/langhebrewmodel.py
>         <https://urldefense.com/v3/__http://langhebrewmodel.py__;!!AjveY=
dw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFZBNVh=
Rg$>
>         ++++ b/src/pip/_vendor/chardet/langhebrewmodel.py
>         <https://urldefense.com/v3/__http://langhebrewmodel.py__;!!AjveY=
dw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFZBNVh=
Rg$>
>         +@@ -1,4 +1,4 @@
>         +-#!/usr/bin/env python
>         ++#!/usr/bin/env python3
>         + # -*- coding: utf-8 -*-
>         +
>         + from pip._vendor.chardet.sbcharsetprober import
>         SingleByteCharSetModel
>         +diff --git a/src/pip/_vendor/chardet/langhungarianmodel.py
>         <https://urldefense.com/v3/__http://langhungarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0=
q6gyA$>
>         b/src/pip/_vendor/chardet/langhungarianmodel.py
>         <https://urldefense.com/v3/__http://langhungarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0=
q6gyA$>
>         +index bbc5cda64..042eae70a 100644
>         +--- a/src/pip/_vendor/chardet/langhungarianmodel.py
>         <https://urldefense.com/v3/__http://langhungarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0=
q6gyA$>
>         ++++ b/src/pip/_vendor/chardet/langhungarianmodel.py
>         <https://urldefense.com/v3/__http://langhungarianmodel.py__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0=
q6gyA$>
>         +@@ -1,4 +1,4 @@
>         +-#!/usr/bin/env python
>         ++#!/usr/bin/env python3
>         + # -*- coding: utf-8 -*-
>         +
>         + from pip._vendor.chardet.sbcharsetprober import
>         SingleByteCharSetModel
>         +diff --git a/src/pip/_vendor/chardet/langrussianmodel.py
>         <https://urldefense.com/v3/__http://langrussianmodel.py__;!!Ajve=
Ydw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEJwAn=
J7Q$>
>         b/src/pip/_vendor/chardet/langrussianmodel.py
>         <https://urldefense.com/v3/__http://langrussianmodel.py__;!!Ajve=
Ydw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEJwAn=
J7Q$>
>         +index 5594452b5..564b02e58 100644
>         +--- a/src/pip/_vendor/chardet/langrussianmodel.py
>         <https://urldefense.com/v3/__http://langrussianmodel.py__;!!Ajve=
Ydw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEJwAn=
J7Q$>
>         ++++ b/src/pip/_vendor/chardet/langrussianmodel.py
>         <https://urldefense.com/v3/__http://langrussianmodel.py__;!!Ajve=
Ydw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEJwAn=
J7Q$>
>         +@@ -1,4 +1,4 @@
>         +-#!/usr/bin/env python
>         ++#!/usr/bin/env python3
>         + # -*- coding: utf-8 -*-
>         +
>         + from pip._vendor.chardet.sbcharsetprober import
>         SingleByteCharSetModel
>         +diff --git a/src/pip/_vendor/chardet/langthaimodel.py
>         <https://urldefense.com/v3/__http://langthaimodel.py__;!!AjveYdw=
8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFC7vWkYw=
$>
>         b/src/pip/_vendor/chardet/langthaimodel.py
>         <https://urldefense.com/v3/__http://langthaimodel.py__;!!AjveYdw=
8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFC7vWkYw=
$>
>         +index 9a37db573..c97487959 100644
>         +--- a/src/pip/_vendor/chardet/langthaimodel.py
>         <https://urldefense.com/v3/__http://langthaimodel.py__;!!AjveYdw=
8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFC7vWkYw=
$>
>         ++++ b/src/pip/_vendor/chardet/langthaimodel.py
>         <https://urldefense.com/v3/__http://langthaimodel.py__;!!AjveYdw=
8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFC7vWkYw=
$>
>         +@@ -1,4 +1,4 @@
>         +-#!/usr/bin/env python
>         ++#!/usr/bin/env python3
>         + # -*- coding: utf-8 -*-
>         +
>         + from pip._vendor.chardet.sbcharsetprober import
>         SingleByteCharSetModel
>         +diff --git a/src/pip/_vendor/chardet/langturkishmodel.py
>         <https://urldefense.com/v3/__http://langturkishmodel.py__;!!Ajve=
Ydw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHWo0S=
FzQ$>
>         b/src/pip/_vendor/chardet/langturkishmodel.py
>         <https://urldefense.com/v3/__http://langturkishmodel.py__;!!Ajve=
Ydw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHWo0S=
FzQ$>
>         +index 43f4230ae..7e710c371 100644
>         +--- a/src/pip/_vendor/chardet/langturkishmodel.py
>         <https://urldefense.com/v3/__http://langturkishmodel.py__;!!Ajve=
Ydw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHWo0S=
FzQ$>
>         ++++ b/src/pip/_vendor/chardet/langturkishmodel.py
>         <https://urldefense.com/v3/__http://langturkishmodel.py__;!!Ajve=
Ydw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHWo0S=
FzQ$>
>         +@@ -1,4 +1,4 @@
>         +-#!/usr/bin/env python
>         ++#!/usr/bin/env python3
>         + # -*- coding: utf-8 -*-
>         +
>         + from pip._vendor.chardet.sbcharsetprober import
>         SingleByteCharSetModel
>         +diff --git a/src/pip/_vendor/chardet/metadata/languages.py
>         <https://urldefense.com/v3/__http://languages.py__;!!AjveYdw8EvQ=
!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$>
>         b/src/pip/_vendor/chardet/metadata/languages.py
>         <https://urldefense.com/v3/__http://languages.py__;!!AjveYdw8EvQ=
!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$>
>         +index 3237d5abf..aa2ec7c35 100644
>         +--- a/src/pip/_vendor/chardet/metadata/languages.py
>         <https://urldefense.com/v3/__http://languages.py__;!!AjveYdw8EvQ=
!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$>
>         ++++ b/src/pip/_vendor/chardet/metadata/languages.py
>         <https://urldefense.com/v3/__http://languages.py__;!!AjveYdw8EvQ=
!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$>
>         =C2=A0@@ -1,4 +1,4 @@
>         =C2=A0-#!/usr/bin/env python
>         =C2=A0+#!/usr/bin/env python3
>         + # -*- coding: utf-8 -*-
>         =C2=A0 """
>         - Script which takes one or more file paths and reports on
>         their detected
>         - encodings
>         + Metadata about languages used by our model training code for o=
ur
>         =C2=A0diff --git a/src/pip/_vendor/requests/certs.py
>         <https://urldefense.com/v3/__http://certs.py__;!!AjveYdw8EvQ!KTM=
5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXH2cXPF3A$>
>         b/src/pip/_vendor/requests/certs.py
>         <https://urldefense.com/v3/__http://certs.py__;!!AjveYdw8EvQ!KTM=
5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXH2cXPF3A$>
>         -index 06a594e..bfa7839 100644
>         +index 06a594e58..bfa7839a4 100644
>         =C2=A0--- a/src/pip/_vendor/requests/certs.py
>         <https://urldefense.com/v3/__http://certs.py__;!!AjveYdw8EvQ!KTM=
5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXH2cXPF3A$>
>         =C2=A0+++ b/src/pip/_vendor/requests/certs.py
>         <https://urldefense.com/v3/__http://certs.py__;!!AjveYdw8EvQ!KTM=
5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXH2cXPF3A$>
>         =C2=A0@@ -1,4 +1,4 @@
>         @@ -56,5 +124,5 @@ index 06a594e..bfa7839 100644
>
>         =C2=A0 """
>         =C2=A0--
>         -2.24.1
>         +2.31.1
>
>         diff --git
>         a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_20.0.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFLv=
QTN5g$>
>         b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_21.1.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEfA=
t_Dfg$>
>         similarity index 73%
>         rename from meta/recipes-devtools/python/python3-pip_20.0.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_20.0.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFLv=
QTN5g$>
>         rename to meta/recipes-devtools/python/python3-pip_21.1.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_21.1.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEfA=
t_Dfg$>
>         index 99eeea2edf..fd7a145205 100644
>         --- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_20.0.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFLv=
QTN5g$>
>         +++ b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
>         <https://urldefense.com/v3/__http://python3-pip_21.1.2.bb__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEfA=
t_Dfg$>
>         @@ -2,14 +2,14 @@ SUMMARY =3D "The PyPA recommended tool for
>         installing Python packages"
>         =C2=A0HOMEPAGE =3D "https://pypi.org/project/pip
>         <https://urldefense.com/v3/__https://pypi.org/project/pip__;!!Aj=
veYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHB7=
VK9eg$>"
>         =C2=A0SECTION =3D "devel/python"
>         =C2=A0LICENSE =3D "MIT"
>         -LIC_FILES_CHKSUM =3D
>         "file://LICENSE.txt;md5=3D8ba06d529c955048e5ddd7c45459eb2e"
>         +LIC_FILES_CHKSUM =3D
>         "file://LICENSE.txt;md5=3Dc4fa2b50f55649f43060fa04b0919b9b"
>
>         =C2=A0DEPENDS +=3D "python3 python3-setuptools-native"
>
>         =C2=A0SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
>
>         -SRC_URI[md5sum] =3D "7d42ba49b809604f0df3d55df1c3fd86"
>         -SRC_URI[sha256sum] =3D
>         "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967=
f"
>         +SRC_URI[md5sum] =3D "a867fd51eacfd5293f5b7e0c2e7867a7"
>         +SRC_URI[sha256sum] =3D
>         "eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff7497357b9ebd19f79=
b"
>
>         =C2=A0inherit pypi distutils3
>
>         --=20
>         2.31.1
>
>
>
>
>
>    =20
>

--------------9031CBE8B92B4ED228453620
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15MKQXtI023105

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2021-06-22 2:47 p.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj9vsQVv--NmAGoHtwn6NbR18E9=
vb7GQJOx_iJ72e3r0rQ@mail.gmail.com">
      
      <div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class=3D"MsoNormal" style=3D"line-height:12.0pt;background:#FFE=
B9C"><b><span style=3D"font-size:10.0pt;color:#9C6500"></span></b><span sty=
le=3D"font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir=3D"ltr">
          <div>Ah, because pypi.bbclass sets SRC_URI +=3D instead of =3D.
            I'll queue a patch to fix the class.</div>
        </div>
      </div>
    </blockquote>
    <p>Right, Tim noticed this too and I re-submitted a v2 of this patch
      to fix the ordering of the inherit and SRC_URI lines in the
      recipe. Thanks for looking at the bbclass!</p>
    <p>- Trevor<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj9vsQVv--NmAGoHtwn6NbR18E9=
vb7GQJOx_iJ72e3r0rQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, 22 Jun 2021 at
            20:44, Alexander Kanavin via
            <a href=3D"https://urldefense.com/v3/__http://lists.openembedd=
ed.org__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK=
6A6Aa3oADXEISK6-AA$" moz-do-not-send=3D"true">
              lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org" moz-do-not-send=3D"true">gmail.com@li=
sts.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div>Can you please check why 'devtool
                check-upgrade-status' wasn't able to report that all
                these new versions have been available?</div>
              <div><br>
              </div>
              <div>Alex<br>
              </div>
            </div>
            <br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">On Tue, 22 Jun 2021 at
                19:37, Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin=
@windriver.com" target=3D"_blank" moz-do-not-send=3D"true">trevor.gamblin@w=
indriver.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">
                21.1.2 contains a fix for CVE-2021-3572<br>
                (<a href=3D"https://urldefense.com/v3/__https://github.com=
/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b__;!!AjveYdw8EvQ!K=
TM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXE6_DCCNA$" rel=
=
=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://github.=
com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b</a>)<br>
                <br>
                The LICENSE.txt signature changed due to an update to
                the copyright<br>
                dates, but the terms are the same.<br>
                <br>
                Also update 0001-change-shebang-to-python3.patch to
                cover all files in<br>
                pip's src directory, since we need to ensure
                compatibility.<br>
                <br>
                Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor=
.gamblin@windriver.com" target=3D"_blank" moz-do-not-send=3D"true">trevor.g=
amblin@windriver.com</a>&gt;<br>
                ---<br>
                &nbsp;.../0001-change-shebang-to-python3.patch&nbsp; &nbsp=
; &nbsp; | 128
                ++++++++++++++----<br>
                &nbsp;...<a href=3D"https://urldefense.com/v3/__http://n3-=
pip_20.0.2.bb__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FG=
a0RE8rK6A6Aa3oADXEMfxdA4w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">n3-pip_20.0.2.bb</a> =3D&gt;
                <a href=3D"https://urldefense.com/v3/__http://python3-pip_=
21.1.2.bb__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE=
8rK6A6Aa3oADXEfAt_Dfg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">
                  python3-pip_21.1.2.bb</a>} |&nbsp; &nbsp;6 +-<br>
                &nbsp;2 files changed, 101 insertions(+), 33 deletions(-)<=
br>
                &nbsp;rename meta/recipes-devtools/python/{<a href=3D"http=
s://urldefense.com/v3/__http://python3-pip_20.0.2.bb__;!!AjveYdw8EvQ!KTM5dt=
e-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFLvQTN5g$" rel=3D"n=
oreferrer" target=3D"_blank" moz-do-not-send=3D"true">python3-pip_20.0.2.bb=
</a> =3D&gt;
                <a href=3D"https://urldefense.com/v3/__http://python3-pip_=
21.1.2.bb__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE=
8rK6A6Aa3oADXEfAt_Dfg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">
                  python3-pip_21.1.2.bb</a>} (73%)<br>
                <br>
                diff --git
a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.=
patch
b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.=
patch<br>
                index 00cffe169b..0187001168 100644<br>
                ---
a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.=
patch<br>
                +++
b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python3.=
patch<br>
                @@ -1,32 +1,30 @@<br>
                -From e7a00e9b5104ae2fbcea32a35c85760b77fae7e5 Mon Sep
                17 00:00:00 2001<br>
                -From: Changqing Li &lt;<a href=3D"mailto:changqing.li@win=
driver.com" target=3D"_blank" moz-do-not-send=3D"true">changqing.li@windriv=
er.com</a>&gt;<br>
                -Date: Thu, 23 Apr 2020 09:42:10 +0000<br>
                +From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep
                17 00:00:00 2001<br>
                +From: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin=
@windriver.com" target=3D"_blank" moz-do-not-send=3D"true">trevor.gamblin@w=
indriver.com</a>&gt;<br>
                +Date: Tue, 22 Jun 2021 12:31:46 -0400<br>
                &nbsp;Subject: [PATCH] change shebang to python3<br>
                <br>
                -Upstream-Status: Pending<br>
                +Upstream-Status: Inappropriate (OE-specific)<br>
                <br>
                -pip will drop support of python2 from 21.0<br>
                +Despite no longer supporting python2, some files in the
                pip source refer<br>
                +to &quot;python&quot; instead of &quot;python3&quot;, so =
patch them as
                needed to ensure that<br>
                +they correctly reference the python3 binary.<br>
                <br>
                -Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqi=
ng.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true">changqing.l=
i@windriver.com</a>&gt;<br>
                +Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevo=
r.gamblin@windriver.com" target=3D"_blank" moz-do-not-send=3D"true">trevor.=
gamblin@windriver.com</a>&gt;<br>
                &nbsp;---<br>
                - src/pip/_internal/__init__.py&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| 2 +-<br>
                - src/pip/_vendor/appdirs.py&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; | 2 +-<br>
                - src/pip/_vendor/chardet/cli/<a href=3D"https://urldefens=
e.com/v3/__http://chardetect.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8=
lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$" moz-do-not-send=3D"true">char=
detect.py</a> | 2 +-<br>
                - src/pip/_vendor/requests/certs.py&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| 2 +-<br>
                - 4 files changed, 4 insertions(+), 4 deletions(-)<br>
                + src/pip/_vendor/appdirs.py&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-<br>
                + src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langbulgarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZr=
ppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK07ePQ$" moz-do-not-send=3D"true">=
langbulgarianmodel.py</a> | 2
                +-<br>
                + src/pip/_vendor/chardet/langgreekmodel.py&nbsp; &nbsp; &=
nbsp;| 2 +-<br>
                + src/pip/_vendor/chardet/langhebrewmodel.py&nbsp; &nbsp; =
| 2 +-<br>
                + src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langhungarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZr=
ppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0q6gyA$" moz-do-not-send=3D"true">=
langhungarianmodel.py</a> | 2
                +-<br>
                + src/pip/_vendor/chardet/langrussianmodel.py&nbsp; &nbsp;=
| 2 +-<br>
                + src/pip/_vendor/chardet/langthaimodel.py&nbsp; &nbsp; &n=
bsp; | 2 +-<br>
                + src/pip/_vendor/chardet/langturkishmodel.py&nbsp; &nbsp;=
| 2 +-<br>
                + src/pip/_vendor/chardet/metadata/<a href=3D"https://urld=
efense.com/v3/__http://languages.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZr=
ppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$" moz-do-not-send=3D"true">=
languages.py</a> | 2 +-<br>
                + src/pip/_vendor/requests/certs.py&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;| 2 +-<br>
                + 10 files changed, 10 insertions(+), 10 deletions(-)<br>
                <br>
                -diff --git a/src/pip/_internal/<a href=3D"https://urldefe=
nse.com/v3/__http://__init__.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8=
lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFPaRIkpQ$" moz-do-not-send=3D"true">__in=
it__.py</a>
                b/src/pip/_internal/<a href=3D"https://urldefense.com/v3/_=
_http://__init__.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTv=
DKO4FGa0RE8rK6A6Aa3oADXFPaRIkpQ$" moz-do-not-send=3D"true">__init__.py</a><=
br>
                -index 3aa8a46..e1ad179 100755<br>
                ---- a/src/pip/_internal/<a href=3D"https://urldefense.com=
/v3/__http://__init__.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo=
7ynTvDKO4FGa0RE8rK6A6Aa3oADXFPaRIkpQ$" moz-do-not-send=3D"true">__init__.py=
</a><br>
                -+++ b/src/pip/_internal/<a href=3D"https://urldefense.com=
/v3/__http://__init__.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo=
7ynTvDKO4FGa0RE8rK6A6Aa3oADXFPaRIkpQ$" moz-do-not-send=3D"true">__init__.py=
</a><br>
                -@@ -1,4 +1,4 @@<br>
                --#!/usr/bin/env python<br>
                -+#!/usr/bin/env python3<br>
                - import pip._internal.utils.inject_securetransport&nbsp; =
#
                noqa<br>
                - from pip._internal.utils.typing import
                MYPY_CHECK_RUNNING<br>
                - <br>
                &nbsp;diff --git a/src/pip/_vendor/<a href=3D"https://urld=
efense.com/v3/__http://appdirs.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrpp=
D8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGIyyzB_A$" moz-do-not-send=3D"true">ap=
pdirs.py</a>
                b/src/pip/_vendor/<a href=3D"https://urldefense.com/v3/__h=
ttp://appdirs.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO=
4FGa0RE8rK6A6Aa3oADXGIyyzB_A$" moz-do-not-send=3D"true">appdirs.py</a><br>
                -index 3a52b75..ad3f81d 100644<br>
                +index 33a3b7741..60b9ef5f7 100644<br>
                &nbsp;--- a/src/pip/_vendor/<a href=3D"https://urldefense.=
com/v3/__http://appdirs.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4=
Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGIyyzB_A$" moz-do-not-send=3D"true">appdirs.p=
y</a><br>
                &nbsp;+++ b/src/pip/_vendor/<a href=3D"https://urldefense.=
com/v3/__http://appdirs.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4=
Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGIyyzB_A$" moz-do-not-send=3D"true">appdirs.p=
y</a><br>
                &nbsp;@@ -1,4 +1,4 @@<br>
                @@ -35,18 +33,88 @@ index 3a52b75..ad3f81d 100644<br>
                &nbsp; # -*- coding: utf-8 -*-<br>
                &nbsp; # Copyright (c) 2005-2010 ActiveState Software Inc.=
<br>
                &nbsp; # Copyright (c) 2013 Eddy Petri=C8=99or<br>
                -diff --git a/src/pip/_vendor/chardet/cli/<a href=3D"https=
://urldefense.com/v3/__http://chardetect.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9=
K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$" moz-do-not-send=
=3D"true">chardetect.py</a>
                b/src/pip/_vendor/chardet/cli/<a href=3D"https://urldefens=
e.com/v3/__http://chardetect.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8=
lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$" moz-do-not-send=3D"true">char=
detect.py</a><br>
                -index c61136b..a497e98 100644<br>
                ---- a/src/pip/_vendor/chardet/cli/<a href=3D"https://urld=
efense.com/v3/__http://chardetect.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZ=
rppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$" moz-do-not-send=3D"true"=
>chardetect.py</a><br>
                -+++ b/src/pip/_vendor/chardet/cli/<a href=3D"https://urld=
efense.com/v3/__http://chardetect.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZ=
rppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFqJhUBzw$" moz-do-not-send=3D"true"=
>chardetect.py</a><br>
                +diff --git a/src/pip/_vendor/chardet/<a href=3D"https://u=
rldefense.com/v3/__http://langbulgarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-Tbo=
JLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK07ePQ$" moz-do-not-se=
nd=3D"true">langbulgarianmodel.py</a>
                b/src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langbulgarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZr=
ppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK07ePQ$" moz-do-not-send=3D"true">=
langbulgarianmodel.py</a><br>
                +index e963a5097..97ea6cea8 100644<br>
                +--- a/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langbulgarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK07ePQ$" moz-do-not-send=3D"t=
rue">langbulgarianmodel.py</a><br>
                ++++ b/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langbulgarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEtK07ePQ$" moz-do-not-send=3D"t=
rue">langbulgarianmodel.py</a><br>
                +@@ -1,4 +1,4 @@<br>
                +-#!/usr/bin/env python<br>
                ++#!/usr/bin/env python3<br>
                + # -*- coding: utf-8 -*-<br>
                + <br>
                + from pip._vendor.chardet.sbcharsetprober import
                SingleByteCharSetModel<br>
                +diff --git a/src/pip/_vendor/chardet/<a href=3D"https://u=
rldefense.com/v3/__http://langgreekmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9=
K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGyKPuYcQ$" moz-do-not-send=
=3D"true">langgreekmodel.py</a>
                b/src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langgreekmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8=
lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGyKPuYcQ$" moz-do-not-send=3D"true">lang=
greekmodel.py</a><br>
                +index d99528ede..4a127ea83 100644<br>
                +--- a/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langgreekmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZ=
rppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGyKPuYcQ$" moz-do-not-send=3D"true"=
>langgreekmodel.py</a><br>
                ++++ b/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langgreekmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZ=
rppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGyKPuYcQ$" moz-do-not-send=3D"true"=
>langgreekmodel.py</a><br>
                +@@ -1,4 +1,4 @@<br>
                +-#!/usr/bin/env python<br>
                ++#!/usr/bin/env python3<br>
                + # -*- coding: utf-8 -*-<br>
                + <br>
                + from pip._vendor.chardet.sbcharsetprober import
                SingleByteCharSetModel<br>
                +diff --git a/src/pip/_vendor/chardet/<a href=3D"https://u=
rldefense.com/v3/__http://langhebrewmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS=
9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFZBNVhRg$" moz-do-not-send=
=3D"true">langhebrewmodel.py</a>
                b/src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langhebrewmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD=
8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFZBNVhRg$" moz-do-not-send=3D"true">lan=
ghebrewmodel.py</a><br>
                +index 484c652a4..676c1a711 100644<br>
                +--- a/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langhebrewmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7O=
ZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFZBNVhRg$" moz-do-not-send=3D"true=
">langhebrewmodel.py</a><br>
                ++++ b/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langhebrewmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7O=
ZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFZBNVhRg$" moz-do-not-send=3D"true=
">langhebrewmodel.py</a><br>
                +@@ -1,4 +1,4 @@<br>
                +-#!/usr/bin/env python<br>
                ++#!/usr/bin/env python3<br>
                + # -*- coding: utf-8 -*-<br>
                + <br>
                + from pip._vendor.chardet.sbcharsetprober import
                SingleByteCharSetModel<br>
                +diff --git a/src/pip/_vendor/chardet/<a href=3D"https://u=
rldefense.com/v3/__http://langhungarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-Tbo=
JLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0q6gyA$" moz-do-not-se=
nd=3D"true">langhungarianmodel.py</a>
                b/src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langhungarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZr=
ppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0q6gyA$" moz-do-not-send=3D"true">=
langhungarianmodel.py</a><br>
                +index bbc5cda64..042eae70a 100644<br>
                +--- a/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langhungarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0q6gyA$" moz-do-not-send=3D"t=
rue">langhungarianmodel.py</a><br>
                ++++ b/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langhungarianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEn0q6gyA$" moz-do-not-send=3D"t=
rue">langhungarianmodel.py</a><br>
                +@@ -1,4 +1,4 @@<br>
                +-#!/usr/bin/env python<br>
                ++#!/usr/bin/env python3<br>
                + # -*- coding: utf-8 -*-<br>
                + <br>
                + from pip._vendor.chardet.sbcharsetprober import
                SingleByteCharSetModel<br>
                +diff --git a/src/pip/_vendor/chardet/<a href=3D"https://u=
rldefense.com/v3/__http://langrussianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJL=
S9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEJwAnJ7Q$" moz-do-not-send=
=
=3D"true">langrussianmodel.py</a>
                b/src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langrussianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrpp=
D8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEJwAnJ7Q$" moz-do-not-send=3D"true">la=
ngrussianmodel.py</a><br>
                +index 5594452b5..564b02e58 100644<br>
                +--- a/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langrussianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7=
OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEJwAnJ7Q$" moz-do-not-send=3D"tru=
e">langrussianmodel.py</a><br>
                ++++ b/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langrussianmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7=
OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEJwAnJ7Q$" moz-do-not-send=3D"tru=
e">langrussianmodel.py</a><br>
                +@@ -1,4 +1,4 @@<br>
                +-#!/usr/bin/env python<br>
                ++#!/usr/bin/env python3<br>
                + # -*- coding: utf-8 -*-<br>
                + <br>
                + from pip._vendor.chardet.sbcharsetprober import
                SingleByteCharSetModel<br>
                +diff --git a/src/pip/_vendor/chardet/<a href=3D"https://u=
rldefense.com/v3/__http://langthaimodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K=
0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFC7vWkYw$" moz-do-not-send=3D=
"true">langthaimodel.py</a>
                b/src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langthaimodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8l=
mjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFC7vWkYw$" moz-do-not-send=3D"true">langt=
haimodel.py</a><br>
                +index 9a37db573..c97487959 100644<br>
                +--- a/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langthaimodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZr=
ppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFC7vWkYw$" moz-do-not-send=3D"true">=
langthaimodel.py</a><br>
                ++++ b/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langthaimodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZr=
ppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFC7vWkYw$" moz-do-not-send=3D"true">=
langthaimodel.py</a><br>
                +@@ -1,4 +1,4 @@<br>
                +-#!/usr/bin/env python<br>
                ++#!/usr/bin/env python3<br>
                + # -*- coding: utf-8 -*-<br>
                + <br>
                + from pip._vendor.chardet.sbcharsetprober import
                SingleByteCharSetModel<br>
                +diff --git a/src/pip/_vendor/chardet/<a href=3D"https://u=
rldefense.com/v3/__http://langturkishmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJL=
S9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHWo0SFzQ$" moz-do-not-send=
=
=3D"true">langturkishmodel.py</a>
                b/src/pip/_vendor/chardet/<a href=3D"https://urldefense.co=
m/v3/__http://langturkishmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrpp=
D8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHWo0SFzQ$" moz-do-not-send=3D"true">la=
ngturkishmodel.py</a><br>
                +index 43f4230ae..7e710c371 100644<br>
                +--- a/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langturkishmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7=
OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHWo0SFzQ$" moz-do-not-send=3D"tru=
e">langturkishmodel.py</a><br>
                ++++ b/src/pip/_vendor/chardet/<a href=3D"https://urldefen=
se.com/v3/__http://langturkishmodel.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7=
OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHWo0SFzQ$" moz-do-not-send=3D"tru=
e">langturkishmodel.py</a><br>
                +@@ -1,4 +1,4 @@<br>
                +-#!/usr/bin/env python<br>
                ++#!/usr/bin/env python3<br>
                + # -*- coding: utf-8 -*-<br>
                + <br>
                + from pip._vendor.chardet.sbcharsetprober import
                SingleByteCharSetModel<br>
                +diff --git a/src/pip/_vendor/chardet/metadata/<a href=3D"=
https://urldefense.com/v3/__http://languages.py__;!!AjveYdw8EvQ!KTM5dte-Tbo=
JLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$" moz-do-not-se=
nd=3D"true">languages.py</a>
                b/src/pip/_vendor/chardet/metadata/<a href=3D"https://urld=
efense.com/v3/__http://languages.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZr=
ppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$" moz-do-not-send=3D"true">=
languages.py</a><br>
                +index 3237d5abf..aa2ec7c35 100644<br>
                +--- a/src/pip/_vendor/chardet/metadata/<a href=3D"https:/=
/urldefense.com/v3/__http://languages.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$" moz-do-not-send=3D"t=
rue">languages.py</a><br>
                ++++ b/src/pip/_vendor/chardet/metadata/<a href=3D"https:/=
/urldefense.com/v3/__http://languages.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXGPj_LLsw$" moz-do-not-send=3D"t=
rue">languages.py</a><br>
                &nbsp;@@ -1,4 +1,4 @@<br>
                &nbsp;-#!/usr/bin/env python<br>
                &nbsp;+#!/usr/bin/env python3<br>
                + # -*- coding: utf-8 -*-<br>
                &nbsp; &quot;&quot;&quot;<br>
                - Script which takes one or more file paths and reports
                on their detected<br>
                - encodings<br>
                + Metadata about languages used by our model training
                code for our<br>
                &nbsp;diff --git a/src/pip/_vendor/requests/<a href=3D"htt=
ps://urldefense.com/v3/__http://certs.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXH2cXPF3A$" moz-do-not-send=3D"t=
rue">certs.py</a>
                b/src/pip/_vendor/requests/<a href=3D"https://urldefense.c=
om/v3/__http://certs.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrppD8lmjf4Eo7=
ynTvDKO4FGa0RE8rK6A6Aa3oADXH2cXPF3A$" moz-do-not-send=3D"true">certs.py</a>=
<br>
                -index 06a594e..bfa7839 100644<br>
                +index 06a594e58..bfa7839a4 100644<br>
                &nbsp;--- a/src/pip/_vendor/requests/<a href=3D"https://ur=
ldefense.com/v3/__http://certs.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrpp=
D8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXH2cXPF3A$" moz-do-not-send=3D"true">ce=
rts.py</a><br>
                &nbsp;+++ b/src/pip/_vendor/requests/<a href=3D"https://ur=
ldefense.com/v3/__http://certs.py__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrpp=
D8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXH2cXPF3A$" moz-do-not-send=3D"true">ce=
rts.py</a><br>
                &nbsp;@@ -1,4 +1,4 @@<br>
                @@ -56,5 +124,5 @@ index 06a594e..bfa7839 100644<br>
                <br>
                &nbsp; &quot;&quot;&quot;<br>
                &nbsp;-- <br>
                -2.24.1<br>
                +2.31.1<br>
                <br>
                diff --git a/meta/recipes-devtools/python/<a href=3D"https=
://urldefense.com/v3/__http://python3-pip_20.0.2.bb__;!!AjveYdw8EvQ!KTM5dte=
-TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFLvQTN5g$" rel=3D"no=
referrer" target=3D"_blank" moz-do-not-send=3D"true">python3-pip_20.0.2.bb<=
/a>
                b/meta/recipes-devtools/python/<a href=3D"https://urldefen=
se.com/v3/__http://python3-pip_21.1.2.bb__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0b=
F7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEfAt_Dfg$" rel=3D"noreferrer" t=
arget=3D"_blank" moz-do-not-send=3D"true">python3-pip_21.1.2.bb</a><br>
                similarity index 73%<br>
                rename from meta/recipes-devtools/python/<a href=3D"https:=
//urldefense.com/v3/__http://python3-pip_20.0.2.bb__;!!AjveYdw8EvQ!KTM5dte-=
TboJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFLvQTN5g$" rel=3D"nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">python3-pip_20.0.2.bb</=
a><br>
                rename to meta/recipes-devtools/python/<a href=3D"https://=
urldefense.com/v3/__http://python3-pip_21.1.2.bb__;!!AjveYdw8EvQ!KTM5dte-Tb=
oJLS9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEfAt_Dfg$" rel=3D"noref=
errer" target=3D"_blank" moz-do-not-send=3D"true">python3-pip_21.1.2.bb</a>=
<br>
                index 99eeea2edf..fd7a145205 100644<br>
                --- a/meta/recipes-devtools/python/<a href=3D"https://urld=
efense.com/v3/__http://python3-pip_20.0.2.bb__;!!AjveYdw8EvQ!KTM5dte-TboJLS=
9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXFLvQTN5g$" rel=3D"noreferre=
r" target=3D"_blank" moz-do-not-send=3D"true">python3-pip_20.0.2.bb</a><br>
                +++ b/meta/recipes-devtools/python/<a href=3D"https://urld=
efense.com/v3/__http://python3-pip_21.1.2.bb__;!!AjveYdw8EvQ!KTM5dte-TboJLS=
9K0bF7OZrppD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXEfAt_Dfg$" rel=3D"noreferre=
r" target=3D"_blank" moz-do-not-send=3D"true">python3-pip_21.1.2.bb</a><br>
                @@ -2,14 +2,14 @@ SUMMARY =3D &quot;The PyPA recommended t=
ool
                for installing Python packages&quot;<br>
                &nbsp;HOMEPAGE =3D &quot;<a href=3D"https://urldefense.com=
/v3/__https://pypi.org/project/pip__;!!AjveYdw8EvQ!KTM5dte-TboJLS9K0bF7OZrp=
pD8lmjf4Eo7ynTvDKO4FGa0RE8rK6A6Aa3oADXHB7VK9eg$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">https://pypi.org/project/pip</a>&quot=
;<br>
                &nbsp;SECTION =3D &quot;devel/python&quot;<br>
                &nbsp;LICENSE =3D &quot;MIT&quot;<br>
                -LIC_FILES_CHKSUM =3D
                <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE.=
txt;md5=3D8ba06d529c955048e5ddd7c45459eb2e">&quot;file://LICENSE.txt;md5=3D=
8ba06d529c955048e5ddd7c45459eb2e&quot;</a><br>
                +LIC_FILES_CHKSUM =3D
                <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE.=
txt;md5=3Dc4fa2b50f55649f43060fa04b0919b9b">&quot;file://LICENSE.txt;md5=3D=
c4fa2b50f55649f43060fa04b0919b9b&quot;</a><br>
                <br>
                &nbsp;DEPENDS +=3D &quot;python3 python3-setuptools-native=
&quot;<br>
                <br>
                &nbsp;SRC_URI +=3D
                <a class=3D"moz-txt-link-rfc2396E" href=3D"file://0001-cha=
nge-shebang-to-python3.patch">&quot;file://0001-change-shebang-to-python3.p=
atch&quot;</a><br>
                <br>
                -SRC_URI[md5sum] =3D &quot;7d42ba49b809604f0df3d55df1c3fd8=
6&quot;<br>
                -SRC_URI[sha256sum] =3D
                &quot;7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa494992067=
5563a5a6967f&quot;<br>
                +SRC_URI[md5sum] =3D &quot;a867fd51eacfd5293f5b7e0c2e7867a=
7&quot;<br>
                +SRC_URI[sha256sum] =3D
                &quot;eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff749735=
7b9ebd19f79b&quot;<br>
                <br>
                &nbsp;inherit pypi distutils3<br>
                <br>
                -- <br>
                2.31.1<br>
                <br>
                <br>
                <br>
                <br>
              </blockquote>
            </div>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------9031CBE8B92B4ED228453620--
