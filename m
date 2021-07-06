Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web12.12302.1625604405153890422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 13:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com header.s=pps11062020 header.b=cTduUH3m;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=2821817216=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166KY713017842;
	Tue, 6 Jul 2021 15:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : references :
 message-id : date : in-reply-to : content-type : content-transfer-encoding
 : mime-version : subject; s=PPS11062020;
 bh=+FDIXQaSoLnvblK9ceqQ8tE2ttgwO/Sp1Cf7GYuRcR0=;
 b=cTduUH3m0yehRPtcgsJziUDVueI8ivngZZoWDXAcXr4Mfuldez9yZLUxvfqFM3yadUNm
 dPtON5EC5P8aHQ7JAZLCJmkr7udSEMCLJOl+FvpGr0E43HeLDLUa/XDfbMQet9E8Z/JD
 V5WA4GJ6sODQCzqZ+Gj/WPPYkv3AfXGKs1gKmWrZZJoK9O0kbCVa1jZZ5UWw7CtVvalg
 /q1GDuQsvaIcoApclj26KDL0ByYMgqijKYK+PxgQCjiOubl5/QFlmpJzp2hpFjnMBKz7
 e8f3Ssf4j+qj/0RM1lGsPmuypRaXQ1jerSzLmnYzkbhLvTzvKa1oXNGg9M6fJRqhZMct dQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0b-00010702.pphosted.com with ESMTP id 39m0kr2dn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jul 2021 15:46:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtVPrdbzLmg3k0O8cz47Up3jLpWnFDtBa2tXgDMKBL/gEvpy2ZKZnShUUSjioPDWyNlA9vYt/KWhVI6y+XWS/J5h+Xf95pwRtSpuyWWEcQ22ORHft4PRAIm4YUHqa9FuM4kuMF4+PlzhS6b6Lbkk6GPt3A38L7Ybs6mgYCsvlDeE4mEPINVGj1HoCdkxlATrPlTAtmv0YI79PFYUfQjn1rOPUB97K1D5ognQD448v8Pz8Vdoa2fce+gn4YXJ4mRFqOTejavvIAP//6NRCL4/PI5llqIB4XyDINZN6XkHfAiM2oD5M93i8JLXCsq6YYmH+R70nwm8QzRB+G5UF89SsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FDIXQaSoLnvblK9ceqQ8tE2ttgwO/Sp1Cf7GYuRcR0=;
 b=U30I1q4smTNMOZGHfW6i1Oo3Dk2QUN+BjmV7+MuAq7lk/YU4WuVuXNrarQrX90sywbmO4qWTYvmFw21TRsB/2D7F15wE9GypToND+6MG/nZ48xKf9GO8vpvdX7AoUlNAw8HaEjsdVyE56IFQKBIkA+2D8d33B1UtaYPnt+hht0i1oc7OcV2JL3VgNt/T/PX+Tlhb2QavZFD3QbN5T3RpvsOmUPTPEGRuYxYv2FkeTGtZqB5u0apDbJVou8zYcxPadYLXQIJEoQSxxuj5XvSiousIEXuTllt3FAQgSEnUcCefd0aGko20CtkoNmGkq5zsgFQWy2QdO30XY7s0MFVn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FDIXQaSoLnvblK9ceqQ8tE2ttgwO/Sp1Cf7GYuRcR0=;
 b=fmMtCe9bBJbbNrHra2rTGuwGlhsTh8eMJU1RSiShN2ZVOjxnypQrIopLrQTi3CmeZaxW6Dj1gj4xDHChehJotD9P82HokrZdR6ZRedQHu6RGLhb000afqNRh9V2650rhh5eS4TChLauh2uAg8Aiyt30IP6tQY2ibC2+hBC+9YSs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB4302.namprd04.prod.outlook.com (2603:10b6:805:31::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 20:46:40 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 20:46:40 +0000
From: "Alex Stewart" <alex.stewart@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
 <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
 <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
 <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
 <2d520cb4-2af1-fa63-1ea2-141f72a7bd80@ni.com>
 <fc14cde762af386d38735e97dccb14457b1a044a.camel@linuxfoundation.org>
Organization: National Instruments Corp.
Message-ID: <8d649238-9647-4e56-8c49-0f3ccf1be4a0@ni.com>
Date: Tue, 6 Jul 2021 15:46:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <fc14cde762af386d38735e97dccb14457b1a044a.camel@linuxfoundation.org>
X-ClientProxiedBy: SN4PR0501CA0108.namprd05.prod.outlook.com
 (2603:10b6:803:42::25) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (65.36.69.14) by SN4PR0501CA0108.namprd05.prod.outlook.com (2603:10b6:803:42::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Tue, 6 Jul 2021 20:46:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd89f77f-d95c-48b5-876b-08d940bf27e9
X-MS-TrafficTypeDiagnostic: SN6PR04MB4302:
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB43023470C9AD9B34239823B5FE1B9@SN6PR04MB4302.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8BZB7LRxC6AtEYCURoSNNQFP30K18A1O/7Hq29I1KXF9GFRDGoyVNQC8/Guzg1AO/+5247/hZ36fBLuxabLyPNROYbkRSC59Yb9L4gJJf+fGaxe43pPO9wp5eTEBEqHuRzFz/9JiUqZi3neM+3dmVDjwapOd8DhHxpNf13tB2JK8oZFuVL0+y9qkTxtNR3K1rbg6dZ+qlOabaez+nAd8HTVRxNU/pcDwaGsCVQKuettOh/rgQlgpu15Z9RL2w/QOg4KqOfksC2aUN+bx44CEwE4fncEmTr/dtyts4yV/mc8Ln/4AIsytx4M2celEzjGhhP4vv/kh6ojfVtCUWIiAMtnTXTdU8UKMtonvUsU37N9zyEBdXgC2iWmoHk68nhfXHoE1Ki89vd3YxyQxdNGIrUefGpKo9eG5MO+AVnzXrK98Bi0mpht9yDVAHKSpXgTFCqb4NyCEjMrpowX9u5mq7ZUADO/qzHhBp0TXye/0VOpu7eRyG6eSxMR5I9GZwM5Uuo3Al/8ZG/ipvBmke9YOJfSevPjzlu3OYoaWVlEgUHIoxSJLlje+UhGQRcKWTBT6z+VtBs8rjBOmH7WF18fMgINYCm+x8OLczoD2PKuyiH1YkRAUrco8b+gIA0kT5+GC89y3eoo/fJ8cgcgC8kas7M4HrVdyUUnhRyBvT9bv4seTUG0uh1B3TkVpLqbUoW6JbRnamRzAI/e6WFKMbc0BxAAyiiGwRUF75LmsrhVt3nbhSc2nM9xBtObE7veGKHVTwFEiBfSQowEUpWtxoUbCLup2b9MjFa9yM58j7NjL0SCcnGrMe8srwCJPZm5XWGCbr4UREzklL9mniMdem3p6/0NyY1Rb4TxA76S9YrpEpNdcbVTKHzuz1ApAOM+yU1h9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(31696002)(8936002)(38100700002)(316002)(86362001)(110136005)(38350700002)(478600001)(16576012)(2906002)(26005)(2616005)(5660300002)(956004)(186003)(66476007)(8676002)(66556008)(6486002)(31686004)(44832011)(53546011)(966005)(36916002)(52116002)(36756003)(66946007)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2lkWmF5MmFaT2xYMk1tenFlTUkxSEtyZlQrNlAzZXRxTS9aNWxIWmg2MmRa?=
 =?utf-8?B?b1lVRjRYMjE5TURxK0lMUGhENUk4Uk1nREo4bk1oL2dLSDAzTXJ1TXVtTXJQ?=
 =?utf-8?B?UWVVaERlVzY5NXp1K2Q0R2NmRWZleXJabzRNbHI2ZDRNQWJnSjU2dXQvRVRL?=
 =?utf-8?B?WXJTVUxiV1ZpcGZsdUN1TUozeTRhQTByUUo3YWVhcDVYTTFpYmtVRWZ2a1VV?=
 =?utf-8?B?bGh6YkR2MjVHT1Z5b0psN3VCNGk3OGxzRUNxZFVVdkpmd0Fwdi91a2Nmb09Z?=
 =?utf-8?B?dWpJMktYSG5UWjR4Y1VFdWhrWnpaNlNld3c0UlZUemdwcEI4VmYvNDlrcTc3?=
 =?utf-8?B?c0k1ZmVlUURlTTc3V1U2RzBaOHBQVVdPMGs0QVdTQ1o3MWpHY2FCZnBoUGhM?=
 =?utf-8?B?aXRpNE1PeVVnc2VsV1dxQzVFYXBlQzJ6ZTlMSHIvRk9FWWtQR2FIem9BN0N4?=
 =?utf-8?B?amdCTldZN3paa0pqSXUrUndJZzI1NVN5UVBDaXBvMk0vcmRSSGNyd1RiWGF5?=
 =?utf-8?B?ZmtNWGZZUG4rS0VZSnBxV3dvVEEyRmVVL1lLS2lZWjB1Z090U0FPK3hZT2g1?=
 =?utf-8?B?bGZTK2FxY1EzbmtaVC9YUkxaQWl4RGZPeG9HREkxdzFuWnZaNXVLQktSQjhj?=
 =?utf-8?B?dGdSQmJSZ2lzNHBOUEx6SEs3SERmMWd4ZEwzVzFJNm1IZzN4S2Y4QkZLZzBm?=
 =?utf-8?B?QVE1UHFIdGVuR2F3d2VoTy9uMU5FcHhXa3UxTVlNSHJ1NVhPbHI0S1dzUW9H?=
 =?utf-8?B?cWdoeXBzYnM5Nkt1a0loZGZuTHlXRXRqbE9XeFN1SGEwZnBJdkxwZEM2SG5q?=
 =?utf-8?B?QkVKUUFuV2hHUWpMNVEwSTFFamovTHUxdEE1dFA1Z0xsU0FSSHZOdHVKcWc0?=
 =?utf-8?B?ZlhibVcrbEJ2MWlmTUJjU2pHVnNYWUVGWVZaNTVxdzFnS0tNbmtYQ2p3S1ds?=
 =?utf-8?B?Z2NDazB5bjU5ODlFVjNNYUVUSG9hM0pDTXRkWlhjMElZVmpNWlVTWExTekJI?=
 =?utf-8?B?cHl3c0xqT0hGQ0svaklidC91MlhTbUNCdHBlUUVYQys5Rm90RGF4OXVuWmlD?=
 =?utf-8?B?TGRtaHBlTERXeDRaQjlEMmsweE4wcjU3NHpJendtMGdjendqbWZDTWNUcEdh?=
 =?utf-8?B?djFPS0dMcWsrdS92WmVJUVBQaFhvdlZzaEpuVFovcE9vckQyTmVud05Ta3Jz?=
 =?utf-8?B?VXlEc0xmblBYODFNUE9sYVc3T1RpYjBvYTZwZUFFN1g0dVloZS85MHF3SlN1?=
 =?utf-8?B?eXlkY2FJT2VmdDI1bnpOcElkUTFzY2xFdnlwRE5lOFNsVjFOUWFjQzNyOVNn?=
 =?utf-8?B?OUpwbEdRNy9lTGJqNEZDUkNyYUJpYkZvVEVsLy9jbmFYRUxtWlM4QjBEV29u?=
 =?utf-8?B?SXUrVHJ0dmhMNW14M0pmM0FMRk9NYkVGdzU4eGNXRDRYZHlWa29WUlF6K2hx?=
 =?utf-8?B?ZSt4MGFmSFQzTndQNmRLSTBrblUxelMrTndFTm5TeCtkbndjQVF2cGpsUnBy?=
 =?utf-8?B?MWhCelMwbitaQWx5T0NBOE8xcHVwNmtWTkE1cDZwY1AwdWFRbVRiWlFOZ0Nt?=
 =?utf-8?B?SWFldUUzblVzeVZsb3B5ZC9IZS9Xa29rU1FJU1lTSS96dFlGTXowQTg4Ty91?=
 =?utf-8?B?VGExNVMwR25TZGloazlPTkkvdDdXMjIzcUhjMDI2Z0NCYTR6RXh6eTlsWGRO?=
 =?utf-8?B?Y0lrZjByL0RWUGJjZUJWZ1pqZk5vMmh5QmpRdnFPZUp0TXlXQzNKeThOenlY?=
 =?utf-8?Q?XtYYsoLdMAl1Mxv0qxLkgdGBO+GYYSMc5aENMJo?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd89f77f-d95c-48b5-876b-08d940bf27e9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 20:46:40.3790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zH4aBwYKS4QQVnCAmGQs6cmMPItvvYwlK/H8rPC/ZxHgrN0uEAW1SACBnMOX4XTQmFmXT/v8wG2nOigA9/5v0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4302
X-Proofpoint-GUID: eHhUtIwZx-4OmcybizRathqsEPileJVj
X-Proofpoint-ORIG-GUID: eHhUtIwZx-4OmcybizRathqsEPileJVj
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_11:2021-07-06,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060097
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-00010702.pphosted.com id 166KY713017842
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/6/21 3:12 PM, Richard Purdie wrote:
> Kernel modules can be:
>
> a) not built at all
> b) built into the kernel3
> c) built as separate packages
>
> For OE, where something needs a kernel module, we suggest people:
>
> RRECOMMEND_XXX +=3D "kernel-module-xxx"
>
> and the kernel recipe has PACKAGES_DYNAMIC =3D "kernel-module-*".
>
>  From bitbake's perspective, it builds the kernel (since the PACKAGES_D=
YNAMIC
> covers kernel-modules-xxx) and then hands off to=C2=A0the package manag=
er.
>
> In the case it was built in, the Recommends will be passed over by the
> package manager since it is just a suggestion. If the module is present=
,
> it would be included in the image.
>
> The issue as described is that if someone has IMAGE_INSTALL containing
> kernel-module-xxx *and* some other package in the image RRECOMMENDS tha=
t
> module, it doesn't error if the package doesn't exist.
>
> I have to admit I don't remember how IMAGE_INSTALL is being passed into
> opkg but the change in behaviour due to the addition of a RRECOMMENDS d=
oes
> not sound right to me. The rpm backend does not do that but errors
> consistently.

Yep; I understand all of that and agree. My goal here is just to make=20
sure that the bug is filed to the correct location. As it stands, the=20
only description of the error is from OE's perspective, and I'd like to=20
get some understanding of the interface between OE and opkg, for this=20
special case.

> It sounds like the "Depends" from IMAGE_INSTALL is somehow being overru=
led
> by the Recommends from some sub package dependency.

I know that IMAGE_INSTALL gets consumed into PACKAGE_INSTALL, which gets=20
pass off to the PM modules (iirc.) And I also recall there being a=20
PACKAGE_INSTALL_ATTEMPTONLY variable[1]. I wonder if RRECOMMENDS are=20
being ATTEMPTed (either through that variable, or a similar one), and=20
the failed attempt is pre-empting the mandatory install attempt. Worth=20
looking into.

[1]=20
https://git.openembedded.org/openembedded-core/tree/meta/classes/image.bb=
class#n79

> If we're driving opkg incorrectly, we should fix that but I'm not sure
> where the issue is, I suspect opkg...

Why do you suspect opkg? The situation from its perspective is only that=20
`kernel-module-xxx` is recommended by another package, but not available=20
in the feeds. There's nothing invalid about that state that would cause=20
opkg to throw an error.

Thanks,

--=20
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com

