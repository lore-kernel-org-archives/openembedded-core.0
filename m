Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4715.1631694485273379408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 01:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZRYF9J0j;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=489277713f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F7jwWv031407
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 01:28:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=Bzz65nqupqwf0ftbhPYhg+RsrgVCKtHMYA1Ji6e3rio=;
 b=ZRYF9J0js+3cVQZTjJfyqKiubURX4qs1sW+BF7Yy1lXP2ftDbKDYZqtTPf+IxesQCCoT
 Tsi5kiSd8odTSR/LhueMlBT9gW+JfKrk74o82uhElQ1Fz3KJoZpVIUgMzWdmyregtxoZ
 tRDeObe9EzEMzPsfQwaOwO/oZxhr2m6QJWbHOb/lUzV1Xn1eyxeww9gCBZbEjpM8peIJ
 jyB1q2DvqK39LuP8lBNu8xEw97liG98qZ7ACrU2Za2PavhnYJsQi5eMNV3OaNDk1u1p2
 8668ougLGTYK163pZRQmKYs4RGYNbKIsdXjLZHPQwoTL7WnK2qjLW4a6WMNS2foxSVSm Rg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b2jswsa26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 01:28:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlFuM/3BeQcq3B3IFTm1seOuTzFpWJ2EAsfT3lGeFlxvGWe1GB66vSkAIoBlBbxu9fsrawJBK1R/Y6mY2XxnMCCkUqQXl3+REoqfMjZKmPOx1cK9srIx18S3YRc+8YzW0NE1rO9K/uixJWH8Y9A2mnY0xWzxSOGmQLDfcd/dtRTk6nF2GN1KSHeUxQMrVTn/2jydAh1S/b/fzEfOspVpcoAipgOAdQU87Tm6m8726SymhcvKYo5jwbwbF+cQvx8NsbMXFPHhouJ2IZh1qVAOocV21o/BeGDdNrSBcxmA65pmnLZwjRxQTfp69JZh3M5Hs9nF7CtCsJAsekBY05uRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Bzz65nqupqwf0ftbhPYhg+RsrgVCKtHMYA1Ji6e3rio=;
 b=UOQEBbywPZurEPz1hq6guwNuzeXdPeUHwEIrtdgE7lrKMQVFf9EOpfH+gPUeQ5Vh4DXm8VymrHn704LqdaEBY1hfY5STg98C8HVHGySwGm69Yn8KmG9r/Lrpj4+6sWsl6TrF+MX5gi7Su6QLnD7yV4QBjqgUaW8QqrKfJyES+ifzfHu6T40J/NGl5R4/1vvlvj5v5vLaGwNB2Lf0I3qdGaAxGaHp+1af1dF4RlpajKZY+K7gCmUsYHug5AkSvIQ/psbJaHju5Q/qGLGv94v3Krjkm2/Vc6wGTBOBQScyMr47Ria3MOBHY52pNnY7FfhqQsName5da3LMQzozNbycRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 08:28:01 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9d20:68ca:19c3:803f]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9d20:68ca:19c3:803f%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:28:00 +0000
Subject: Re: [OE-core] OE systemd RemainAfterExit does not work
To: openembedded-core@lists.openembedded.org
References: <CAA=hcWSnctuvZNc=vcAn7-u6W3DHRiLLk2chhgNSyr4s=zNuqw@mail.gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <d7158686-8c8f-e7e0-70c7-db2d433a1c6a@windriver.com>
Date: Wed, 15 Sep 2021 16:40:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CAA=hcWSnctuvZNc=vcAn7-u6W3DHRiLLk2chhgNSyr4s=zNuqw@mail.gmail.com>
X-ClientProxiedBy: HK2P15301CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::26) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
Received: from [128.224.162.141] (60.247.85.82) by HK2P15301CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4544.0 via Frontend Transport; Wed, 15 Sep 2021 08:27:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5487041-3110-4355-a975-08d97822b738
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB56090B9D8703531D62EA4926EDDB9@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mgnt3AGwd5vkIbjuAJ5bkOL7zM/i2ZatszN5ij7y29T+Y8thSDogPuazt0RRTTmZaFgdIOiUdHo5htXKuOy4IoMNmuFDaW3tU9RYvA7L695cgXlCc3wzx5TyiamiwhALvI8r2e1nbir0f7cvg5OP2nC52HojC176o7c7Uilh2QtYeVNdL/PwiCiczKIoOCuhfh684kPu+LmNe/wUPdMYXAFGJo8HBJzwQl0TiRrhiJv9YHfI94UPU/vhCv0RwPVrkZN5G507FWUzYeASPg3/ID8FXMwxcu0E7i74NN9brqFQfzlb9BnpfW5Q+l2rTMsRU0NbIBaMTrEp1qakb9s2HZKIuPmXSFpGvHMMGr16mW7tHWCVMO8pRt1wk25nVDjAO+sayjCvP83kvfLjhcR4Eg9xxW4XQ1bsX3TT8A5yEql+Ko8sEzbVQb8okYkY9X+V9A/64iFbVIWITbmYR940S9Dh2cQqypKePQfiKB5Zl4j+7bfYuiQMS3LuZgjb4KltiSfnjsRcF2UMEVgkuPQZ70QRWvpZGX7iTBzBnf0BE4bfoy8msz/8AT4idimc/G0VpEejwIfr+UB96Wpy5FOAiz4C0lI/TgCED9NEaDxveJMnwdaqmr4S4fnq+h4eJJAWaXNgw0lui4YOxMxcff5/zHujROYYJV5kZfqW84rMnof9NmkgHNXdoxZGEoPFbf+yXf0ZRBp8TT/ddkQT2k2ueRCuqMDf5eiKlU/2HQjKt3dTMvhOI9OugeFCEUymT/JIjwlX+y67sOCBeexCzXu4b0qowNHj465WghJkLeu5saMmZuMopDqAtcx588YEIl0lq9F4Ph0qlho7LoDe5MaLNMzPDclK2+tcXiN3PlnZa0UjZOwMDFSBHu0DL9nQfA+AyYZoyjbFWY/TvRcx8rMwYbatGVrLpZCoj7sDO2zoTeM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(2906002)(6666004)(26005)(38100700002)(2616005)(33964004)(8676002)(166002)(38350700002)(66946007)(508600001)(956004)(66476007)(16576012)(186003)(66556008)(316002)(8936002)(966005)(36756003)(5660300002)(52116002)(31696002)(6916009)(31686004)(83380400001)(6706004)(86362001)(53546011)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1VWS3Arak5wOHFvdTlEbkp6MzI1M0JHd2cwdlFseTFsMldNelJxK2pFV1hZ?=
 =?utf-8?B?VWVGT05hQ0VWcGJzZ0JsNzNHenAwdkNMOEV1aDd4L1loNG9EckpWNzZqK2dO?=
 =?utf-8?B?NVVZVktld1A1MU9JNzdBTXRMUGdhSkRJUzRreFFiUHlnUE1jenVMeW5vb1BV?=
 =?utf-8?B?MlZKL2ViYVNyY1dGa2dtYWhIcGMwT1grRWlpS29KOEloRVNwVWtIV1Jhdks0?=
 =?utf-8?B?YzdPM3E5SWh4Tzgwakt3bkZsTFoxYWpZcEJaMTB2SDVxMjNhQmxwRkU1Q0Jr?=
 =?utf-8?B?Rm02VFpUcmROZ2syLzlhaGJhNlNXaGdWZnlpak1LeW14emQwNFhxcXFYdkgy?=
 =?utf-8?B?STQzVTdHaXUyMUMvVjc1akgvMmVoc0NCazhqS1NFOFdlMjdtdnJCaTlEeVd6?=
 =?utf-8?B?Y3V2YzFZSVVVZzA5Z3BYZmFSNXRyaWdCM3Q1MlF2U1hXMjJXZms3TVpPMHk1?=
 =?utf-8?B?SEN6MkhGaEFDN2l0YUJWMVFuUVlVMjZJVVRwQTl1QjFTakc0WnVROTh6UGVj?=
 =?utf-8?B?YU1DekVhRjgxZnpxUFB3VVB1U1c0UEJ5M1ZWR2p4RVA0a2VJSWV2WW1TM0Fv?=
 =?utf-8?B?SGJlQWJWUnJjakRnR3FFdmlSTVlRR2RDY3Ntd3Z5cGp0NSsyMlltand1VXpH?=
 =?utf-8?B?SmZjdnFJSml5VnpCOVRCSG1ydnZGanZ4blpPZnFRaldlcGJwb2JmWWhrTk51?=
 =?utf-8?B?UisrVlhONzE4aTJ0eTZGVVJjTHhNMGdINlpwUHhJSmRXSkE1bG1vK00wNnE5?=
 =?utf-8?B?RGFIV2ZOdkVaRzB5c0Z0U2c5TG5zZmQ0dndmVTJ1NUY5YVBZSElXWTRsamxM?=
 =?utf-8?B?eFV2SmRrSGVlWkVHdnR6NWp1U2p2eEpmREFRZnJPUzc4VFFHWGRYb3p2R2tD?=
 =?utf-8?B?QjcrSU1Fa3NvNFNRd3FsRGtmTXRMeWpvYXorN1ZidHRhR1ZjVERoSWoyS1Yv?=
 =?utf-8?B?elRORWRjaC9nRnRyYzM2R25pcVR0bGcxaWdQMUVsekIzMTlaTkdwaUl2b3ZV?=
 =?utf-8?B?MGpINFN1R2hQU2Y5NHVaemloQXltYVVQMUsvVnRuT3hPWU5zMTlJME95WWV5?=
 =?utf-8?B?MnFDcmxXSi9ELzVhY09KbUNDWU5qY2VlZjdqVWE0OHB1K1NpK1hIeTIwb2ZD?=
 =?utf-8?B?U2ZYaGRndllpK0dveW9aMnB4NVRFbWo3OVlQNFljNXBnODhCKy85T2ZrN0pU?=
 =?utf-8?B?ditMbWIzVHFEMDNOSHVSVy8zdlFWTFZocjRSOUp1TUsvOEtiZmVOaVoxTzNu?=
 =?utf-8?B?WmpteGg1TVNmZHp4bjZUbWNEY3E5cGdPV2E3LzI0T1RxVk1DMVY4N2J0MEov?=
 =?utf-8?B?WW5qUENNNVZab0YrRUFsWkE4djJxUWJVTFV4OEp6d01ZcDF1YVQ4MklQWEZX?=
 =?utf-8?B?UVZWYUZJeE1yZTRNWTV3bXBYdHB2bUsrZGplUThsNUZucGhsV1N6YnlxUWFW?=
 =?utf-8?B?WWRVRk45ck9BWkFDS1psYldMZnE4b0ZqU1NyczRvcVFCS0t4MFlWMFhMT1h6?=
 =?utf-8?B?YUY3Q1BkeTgvbm9NUUt0SEFOS2kwWVFrdFJGY2FMcGFRZWZKUVgvVWd0QzUv?=
 =?utf-8?B?K3V5aFlUS2tpaWdRa2o2YXBuTkt6ZXpmR0c5UEdPNDgxRTVRVExRdEdlYUt6?=
 =?utf-8?B?amw5dTl4YzNpY2ExZmNtaGtnUzJvbXc4bC9yQmFCcldBZHo5bk1QMWc5dnlN?=
 =?utf-8?B?VzBPdTNZbm5UQkVRYm05dCtQNFpldjhicTBaYkNXRUlRb3g0NExPL29ZMkNx?=
 =?utf-8?Q?dy0PF9DlK7wHgX9Ap6OVtRUaPjf2UdrsWJ3NXgz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5487041-3110-4355-a975-08d97822b738
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:28:00.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJuVY9kcG5f2B0o9Qh9TaRylJ/Il8r7kQyzg+hU2aWCoWOxLJVTT1B5OdDeUNfm8JWk9BcKUzPJ5EOtKNdKSBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
X-Proofpoint-ORIG-GUID: T6e4uOB0rJioUrVJbmrTgcGJVXCLrtcp
X-Proofpoint-GUID: T6e4uOB0rJioUrVJbmrTgcGJVXCLrtcp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_01,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 mlxlogscore=618
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150053
Content-Type: multipart/alternative;
 boundary="------------1D86B12F2B5B677C2CE26915"

--------------1D86B12F2B5B677C2CE26915
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/15/2021 04:16 PM, JH wrote:
> Hi,
>
> I am running a logout systemd service to clean up in shutdown, the
> service was called in boot but was not called in the shutdown process,
> I double checked the mlogout.sh script which was not executed.
>
> I tried RemainAfterExit=yes, it did not work either, what could I be missing?
>
> # cat /lib/systemd/system/mlogout.service
>
> [Unit]
> Description=Logout clean job
> After=syslog.target
> DefaultDependencies=no
>
> [Service]
> Type=oneshot
How about adding 'ExecStart=/bin/true' here?

Regards,
Qi
> ExecStop=/usr/bin/mlogout.sh
> RemainAfterExit=true
> # RemainAfterExit=yes
>
> [Install]
> WantedBy=multi-user.target
>
> Thank you.
>
> Kind regards,
>
> - jupiter
>
>
> 
>


--------------1D86B12F2B5B677C2CE26915
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/15/2021 04:16 PM, JH wrote:<br>
    </div>
    <blockquote cite="mid:CAA=hcWSnctuvZNc=vcAn7-u6W3DHRiLLk2chhgNSyr4s=zNuqw@mail.gmail.com" type="cite">
      <pre wrap="">Hi,

I am running a logout systemd service to clean up in shutdown, the
service was called in boot but was not called in the shutdown process,
I double checked the mlogout.sh script which was not executed.

I tried RemainAfterExit=yes, it did not work either, what could I be missing?

# cat /lib/systemd/system/mlogout.service

[Unit]
Description=Logout clean job
After=syslog.target
DefaultDependencies=no

[Service]
Type=oneshot</pre>
    </blockquote>
    How about adding 'ExecStart=/bin/true' here?<br>
    <br>
    Regards,<br>
    Qi<br>
    <blockquote cite="mid:CAA=hcWSnctuvZNc=vcAn7-u6W3DHRiLLk2chhgNSyr4s=zNuqw@mail.gmail.com" type="cite">
      <pre wrap="">
ExecStop=/usr/bin/mlogout.sh
RemainAfterExit=true
# RemainAfterExit=yes

[Install]
WantedBy=multi-user.target

Thank you.

Kind regards,

- jupiter
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1D86B12F2B5B677C2CE26915--
