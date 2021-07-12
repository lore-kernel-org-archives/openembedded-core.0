Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.209.1626119276516057558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 12:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XJNVmzho;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2827e6ef37=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16CJXfQj019655
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 19:47:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39r5bq0srx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 19:47:55 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CJltC2012550
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 19:47:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 39r5bq0srw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jul 2021 19:47:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=decuw5du+gJuikZOVJ8AVUJf22asFrhER2LJ7Z0W/1dVQirefw8vkJFdmwCSopZbK7Edx5H+ZNuYqMXma0M7kdRDoKktfhaY5ls3sGR0YHaa4UEoDed5yJ1zTEan5GHMIiabU5Hg/TK7RLVcaS2l5YfuFJyw88h0A2z4qgC90T87nYhZKf7e/3hLQmps5qHYJxtfGWDf+fjxv2KHMpO30AN1BygEBW1PalJRkG1shxIefyuhpTsvHFq4RVZP89SabPJhdUqnLAectlGS2Uw0Ha2JKLr4tc9gHT31yS+ZEgOQeFHfWpWXPkTJc5R2ecIjU1SxvleUYvSg2XxncnUoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1RIXd0LKZZBrGpfP/tPNn1dQ/vNNdQ3BiQUq5RK6K8=;
 b=FTiiGatoZjujt/0bd6F6WAFXbfHHNwzOhwYBHPzS/tgS8LlTVW5Rz25Z7WEbSyJtvE8JwpjYQHXl7b3qkeo+KdinCj2lPzykKStd0R9GIriS5wx1ftnrS1Kc0L1AwHLrT94bnLBNUok5vwXUvMqj1lIP7OHlhbj1/uP79zOyS04BoeQHb29r5L6RfemCOL26yNl2HUOwJnYQJ61jJhYJH0aPkIma75r7ZHoyVOOmtfYJjMdSSaiLr7ZukX+9SHHSundGgtY2ulcwwlWDSznqpO74PGnVfCKWbxP5Y/P9MojLFESg+qujf7x4qO+JH02eL5FPBzvDMBNyu7b2iAq2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1RIXd0LKZZBrGpfP/tPNn1dQ/vNNdQ3BiQUq5RK6K8=;
 b=XJNVmzho4y8IpmEv9VjoMe8QqGRdkIp1Pjr0HlCrE3Dfins/nfscpQUMLn883HEkeTqy7gVa/K6oq0llIMknq0O+7hq0BP3REaKAe12X3Q71tCGKwRjPGbXTh/edKApb1OeCgRszaeLhM3bwCK8+2UsaMbx1p0v5vYszTLgKg+8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5472.namprd11.prod.outlook.com (2603:10b6:5:39e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 19:47:53 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 19:47:53 +0000
Subject: Re: [OE-core] Reminder: Yocto Project Technical Team Meeting @ Monthly from 8am on the first Tuesday (PDT)
To: openembedded-core@lists.openembedded.org
References: <100201d7773c$23a44430$6aeccc90$@gmail.com>
Cc: "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <e43fafbb-c3d5-1759-9dc9-c91c7d38a637@windriver.com>
Date: Mon, 12 Jul 2021 15:47:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <100201d7773c$23a44430$6aeccc90$@gmail.com>
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 19:47:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fa3137d-de94-4a4b-a927-08d9456df028
X-MS-TrafficTypeDiagnostic: DM4PR11MB5472:
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB54727B23E6EB193F29B45BA7F8159@DM4PR11MB5472.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+tuhPKNw5TRrn33+PRCoI70CIAkrkdDdC5PwuFljrDvuw1o4+wDx3JrAtyYw6udaCmQPxbu1qVSc/sqr+mSD43o0iFYy3hNZFvYg90mH9lSHzOTUpTOHmY4JsqOZa/zJ3xsooakaog+vJUTL7t91/u9s2WkEBnmVlhuxH/mkzNBFrFgoDuPrwWEBf5u6lnf6ZxV9IUpiCSuoSCzhc/U5NJnP1oVGvrAfOk4ytAQHAaXMUQGvulUMXFm6Db7wAlVUQ7OC8iFlYTrv1tGghzlroC33zFCc8l+TdnpW7DrYnWnF02ajDdU6Akn9KK+hVd6u4F/tc/YPwkUmwZEG9DNrMisdWI3IIAcjgoE/q7HM5+SmPjENwNjD9IiLP6d3pTOeHs3OGMibvGhd2uLEHGVg2d4EbRX7vRjxlQ0xzzLTQbmtzfolChkDaKPc1rLv1qt0qvg7HkJKaPMyHOg7WeaooLd0UTfFe3kaDmCtPgUAU8B8XCOL6oUirEcemjwA5OSMeGj6S7kQ/NbJ9XuMNzcYGm85CAPfwmjhQYZ7yRCdf9uOZc78EP35RcuCCh3E7cqvR7ppUeNPdzp/gVK0qxEc3/xAbcPsiQ7ndd+rl4hzqictbKwzcbJE1Pw7iT5YJ2JTHx1sAoD8CT0fyu4fxPlE1cKJ+EDnBtM51SEqAgzntiQcZHUxTH8/HJczapi8qQb0j0ZI3Q8S5M+mPP7t57W/TWp9UHfZr+n4GI+j0SqaeAigPZk21lh/k3eViFbamcs+iLi5kRcgA4pPFJezvaY9U8+ph7b9Y9wInKlMeTUWXti7F1ydxuTCVC2CuONWz6fyOPE3AW9IPeiAIkHJGg4rvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(39850400004)(346002)(5660300002)(66946007)(8676002)(2906002)(8936002)(6916009)(31686004)(6666004)(66476007)(36756003)(956004)(2616005)(66556008)(16576012)(316002)(4326008)(6486002)(52116002)(166002)(31696002)(86362001)(38100700002)(38350700002)(53546011)(26005)(478600001)(186003)(966005)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?Windows-1252?Q?fp9+/smQRp0oOHv5rnxR5MfCW/q84oNsbih14Jwu9sZuX4EtK+FZJU/u?=
 =?Windows-1252?Q?aALeBQuQMIJVROLIpbmxtbnvMuz8uraf/P6oIvdjNooNTfheINA0WERL?=
 =?Windows-1252?Q?84uH3xH0z13Ok4NDHfkGqFXrXb1PvZrQOq38VdFfVsgHXRhufQt9ITf2?=
 =?Windows-1252?Q?RUoSi/rUis5EXB2Iqj3Od/AiA1KnFLNb6yCbXRi4FBgT/cMSYjS3GeuG?=
 =?Windows-1252?Q?4S3hg1IqiI/jwILBIi7bEbSsH9j6Ib4Z6kTGzRgUGicf5ZHwQJrD+4qj?=
 =?Windows-1252?Q?KYchKBg3zuCTWFIMsQC5e1M8i03r/XIs9JcwrJUxE6FdxEwy6P/lsnGG?=
 =?Windows-1252?Q?gYTfkEJZuOu7GTfXsV9OUePdrLuvEVenwQpfCTKSGaFvhsX9rxposjCl?=
 =?Windows-1252?Q?pWc5OYJmvpnJSS7LFr1RQWWYGieJnVfUrJD74B16pVphC4bbHtnmqPn1?=
 =?Windows-1252?Q?pESBSbUqu8Q+KPIfQ/1ikQzBYUfuVrFndDoq/mTPqaP88XGXumufyD8+?=
 =?Windows-1252?Q?4+0P1nhnzM/vTH1Cbaq5JbI0gxY9teQaIQvUnGGRuujWMnloHjcci03k?=
 =?Windows-1252?Q?a/hn1dAAHxJCAskvXCmExhAc1SI8EXxeE8HpEYOq+Gogu+c05J4kfhZP?=
 =?Windows-1252?Q?FjpNHj6dG8iJHRyzL5EX85N13+bJ5qy+azQzYVZoBs1Of/eIYbd5q9Go?=
 =?Windows-1252?Q?RoplaaQwxM7JdRBSV8SeE4E5oUBauhHIEWOSxNRSWZroiqIXjwSx9yza?=
 =?Windows-1252?Q?CtDw/cBryRKpNq8pl5YMBvLU78p/kxChGf2XP5NS4g/waIPOMwNIuRXR?=
 =?Windows-1252?Q?pKldI1vS+tUJWP7a/HQ60CK9595+bt3WyL+1KsY5jA7iN0qSog9DokbO?=
 =?Windows-1252?Q?hGqXZe/ab6Ap2ocj4WGhKNUZi7e+SUwAzXvxYT1ShtFIfycYaN8OO56N?=
 =?Windows-1252?Q?4nAnuwR3mKl/aKGEVHAkgxszonkoKgkdGTtGfReYNB+T2mQWpzLkmJlQ?=
 =?Windows-1252?Q?sO9ZuAKe+P2sEyHx2+Oc1T0qsaGYdkYSNblSinNZJrV1ahJ6BEQhVj1C?=
 =?Windows-1252?Q?/qYRDlxka4ObON8TSTPkthCzLUOM7mn435KLx0EdqHrqdWtckhEJk3EZ?=
 =?Windows-1252?Q?LqOzN+qKH3yeVNB29PUeA/jRMfMvn/HGQ2AvzYpnORj61GH9bvhUFpj5?=
 =?Windows-1252?Q?nkHS6Ry8nBaDzYXFqCyPREzY9RC2llg0x3x6DMK+AE6roNFLfzB/LN4F?=
 =?Windows-1252?Q?J/CKPh0Q5qWA0ws/Z1AHv2z2cECpBye8D9BqVpbPBCx9jzPyeVmHSP4p?=
 =?Windows-1252?Q?p6SLE6U3u8tpXrZ4stn75JMiL+pX6t/LPeUrbONlrdi73NLAH3A7Wu+E?=
 =?Windows-1252?Q?LZd6Kw9QvjcTa2zZm4FcjQKz863jxit+v2y36nNQp6XwVmJuRnOlfi/9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa3137d-de94-4a4b-a927-08d9456df028
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:47:53.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8rT4cp781vbO3EtzgvoWU68py4XBMilkQ5FwubjBtLYMHQCg5TSRWuMjk8QSuX1exUcqCS2PkPZGQIgKCahrzCaASr3kxyXOFria30SN1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5472
X-Proofpoint-ORIG-GUID: AK9MFKv6QLgY2Ronv4tceZIsgYNE1r_b
X-Proofpoint-GUID: iOM62oJDGFN80u2wXwMiUTm3l2TYftk8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_11:2021-07-12,2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120138
Content-Type: multipart/alternative;
 boundary="------------ACE806F4378FB7E0D7CDA1EA"
Content-Language: en-CA

--------------ACE806F4378FB7E0D7CDA1EA
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16CJXfQj019655

On 2021-07-12 12:36 p.m., Stephen Jolley wrote:
>
> All,
>
> Just a reminder we will hold the monthly Yocto Project Technical=20
> Meeting at 8am PST tomorrow. (7/13)
>
> Yocto Project Technical Team Meeting: We encourage people attending=20
> the meeting to logon and announce themselves on the Yocto Project IRC=20
> chancel during the meeting (optional):
>
> Yocto IRC: http://webchat.freenode.net/?channels=3D#yocto=20
> <https://urldefense.com/v3/__http://webchat.freenode.net/?channels=3D*yo=
cto__;Iw!!AjveYdw8EvQ!Jh4d7ZGGRci5HwdlmdBdqSHHiBiNag3wx2OYkbhgu50o0bZRN7JJd=
aQ2R4ykzPvc4MIeHQ$>
>
This has been moved to 'libera' IRC now.

https://web.libera.chat/#yocto

../Randy


> Wiki: https://www.yoctoproject.org/public-virtual-meetings/=20
> <https://urldefense.com/v3/__https://www.yoctoproject.org/public-virtual=
-meetings/__;!!AjveYdw8EvQ!Jh4d7ZGGRci5HwdlmdBdqSHHiBiNag3wx2OYkbhgu50o0bZR=
N7JJdaQ2R4ykzPvkWowzSA$>
>
> When=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Monthly from 8am to 9am on the fir=
st Tuesday Pacific Time
>
> Where=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Zoom Meeting:=20
> https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09=20
> <https://urldefense.com/v3/__https://zoom.us/j/990892712?pwd=3DcHU1MjhoM=
2x6ck81bkcrYjRrcmJsUT09__;!!AjveYdw8EvQ!Jh4d7ZGGRci5HwdlmdBdqSHHiBiNag3wx2O=
Ykbhgu50o0bZRN7JJdaQ2R4ykzPutOX6p0w$>
>
> We are tracking the minutes at:=20
> https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANXW3ZT7QwKC5wWV=
Dg9dDH4/edit?pli=3D1=20
> <https://urldefense.com/v3/__https://docs.google.com/document/d/1ly8nyhO=
14kDNnFcW2QskANXW3ZT7QwKC5wWVDg9dDH4/edit?pli=3D1__;!!AjveYdw8EvQ!Jh4d7ZGGR=
ci5HwdlmdBdqSHHiBiNag3wx2OYkbhgu50o0bZRN7JJdaQ2R4ykzPsC4p0QpA$>Please=20
> request access if you want to assist in editing them.=A0 The world=20
> should have view access.
>
> Thanks,
>
> */Stephen K. Jolley/**//*
>
> *Yocto Project Program Manager*
>
> (*Cell*: (208) 244-4460
>
> * *Email*:_sjolley.yp.pm@gmail.com <mailto:sjolley.yp.pm@gmail.com>_
>
>
>=20
>

--=20
# Randy MacLeod
# Wind River Linux


--------------ACE806F4378FB7E0D7CDA1EA
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2021-07-12 12:36 p.m., Stephen
      Jolley wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:100201d7773c$23a44430$6aeccc90$@gmail.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}@font-face
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">All,</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">&nbsp;</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">Just a reminder we will hold the
            monthly Yocto Project Technical Meeting at 8am PST tomorrow.
            (7/13)&nbsp; <o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">Yocto Project Technical Team Meeting:
            We encourage people attending the meeting to logon and
            announce themselves on the Yocto Project IRC chancel during
            the meeting (optional):</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">Yocto IRC: </span><a href="https://urldefense.com/v3/__http://webchat.freenode.net/?channels=*yocto__;Iw!!AjveYdw8EvQ!Jh4d7ZGGRci5HwdlmdBdqSHHiBiNag3wx2OYkbhgu50o0bZRN7JJdaQ2R4ykzPvc4MIeHQ$" moz-do-not-send="true">http://webchat.freenode.net/?channels=#yocto</a></p>
      </div>
    </blockquote>
    <p>This has been moved to 'libera' IRC now.</p>
    <p><a class="moz-txt-link-freetext" href="https://web.libera.chat/#yocto">https://web.libera.chat/#yocto</a></p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:100201d7773c$23a44430$6aeccc90$@gmail.com">
      <div class="WordSection1">
        <p class="MsoNormal" style="text-autospace:none"><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">&nbsp;</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">Wiki: </span><a href="https://urldefense.com/v3/__https://www.yoctoproject.org/public-virtual-meetings/__;!!AjveYdw8EvQ!Jh4d7ZGGRci5HwdlmdBdqSHHiBiNag3wx2OYkbhgu50o0bZRN7JJdaQ2R4ykzPvkWowzSA$" moz-do-not-send="true">https://www.yoctoproject.org/public-virtual-meetings/</a><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">&nbsp;</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">When&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Monthly from 8am to
            9am on the first Tuesday Pacific Time</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">Where&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Zoom Meeting: <a href="https://urldefense.com/v3/__https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09__;!!AjveYdw8EvQ!Jh4d7ZGGRci5HwdlmdBdqSHHiBiNag3wx2OYkbhgu50o0bZRN7JJdaQ2R4ykzPutOX6p0w$" moz-do-not-send="true">https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</a><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">&nbsp;</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">We are tracking the minutes at: </span><a href="https://urldefense.com/v3/__https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANXW3ZT7QwKC5wWVDg9dDH4/edit?pli=1__;!!AjveYdw8EvQ!Jh4d7ZGGRci5HwdlmdBdqSHHiBiNag3wx2OYkbhgu50o0bZRN7JJdaQ2R4ykzPsC4p0QpA$" moz-do-not-send="true">https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANXW3ZT7QwKC5wWVDg9dDH4/edit?pli=1</a><span style="color:#1F497D"> Please request access if you want to
            assist in editing them.&nbsp; The world should have view access.
          </span><span style="font-size:12.0pt;font-family:&quot;Times
            New Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">&nbsp;</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><span style="color:#1F497D">Thanks,</span><span style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-autospace:none"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal" style="page-break-after:avoid;text-autospace:none"><b><i><span style="font-size:16.0pt;font-family:&quot;Times New
                Roman&quot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><i><span style="font-size:16.0pt;font-family:&quot;Tahoma&quot;,sans-serif;color:purple"><o:p></o:p></span></i></b></p>
        <p class="MsoNormal"><b><span style="font-size:8.0pt;font-family:&quot;Courier
              New&quot;;color:blue">Yocto Project Program Manager<o:p></o:p></span></b></p>
        <p class="MsoNormal"><span style="font-size:9.0pt;font-family:Wingdings;color:black">(</span><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal">&nbsp;&nbsp;&nbsp; </span><b><span style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal">Cell</span></b><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;">(208) 244-4460<span style="color:black"><o:p></o:p></span></span></p>
        <p class="MsoNormal"><span style="font-size:9.0pt;font-family:Wingdings">* </span><b><span style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal" lang="FR">Email</span></b><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal" lang="FR">:</span><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;" lang="FR">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u><span style="color:blue"><a href="mailto:sjolley.yp.pm@gmail.com" moz-do-not-send="true">sjolley.yp.pm@gmail.com</a></span></u></span><span style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif" lang="FR"><o:p></o:p></span></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ACE806F4378FB7E0D7CDA1EA--
