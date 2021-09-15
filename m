Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3755.1631685326262961302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 22:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Al2z0Q5k;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4892696ba5=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F5o1lI001724
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 22:55:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Ns3BnCPymTbtNVRhDAFqoXAj+I5+2MZk1ecKGoZrXCw=;
 b=Al2z0Q5kbGauOv45T6ronhtacdyWWz2zYuzN0GMOX0zHuN12FHFCmEobisVxqxvVZcq+
 OhgUMosF7PKj9QeIuIdwmDNuorw/zITb2HDthTSKQSqPfq4exv5dPGKoCMKUk3TBJXt0
 g1Rfr4iuXasriLTudw3xk92hxvRfuJ079Y612Hq7gXw1Wm2SYN1zU+Hq3l1Enyz1RSUe
 lOm7fSlhs9eCdKxPARy/+65WVNaLo96OvGMxQRFMrxV2fKMUGAfC083obEDsZGLZSfKr
 2a8oDchJ85P2YK2x3UsFcdY345qthILfm1nMPX2IuukJeSI3V9GXRtS3mqm6KATignnd sw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b3amyr0kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 22:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiHEuxK59i++fcJ/aILTAiY2/T4t8Vr818D6ENs+4P3Ycf+OAPSRbH6cB2ElRZ4WQ2WJZbQLpmZM/Hf8OenFbf66+r7FJO9J2J5QcCBC/CeyYKg3gSwW27+h3ACiHgHlEarmOqY0bqe2+1g8YoGcmJoC3OW0/LWGJVpjZ5kEMEQVUV8JoZEZFnUGw3IdkyTfMAG/TiJNb/Nj64lBJBP3EMIrQFU8OKoD6o1GRwfQf0d7qTVyDYRYKXfTkIpbhxx/cqmPy8ngcgoRtvJTSYpHIaH+HfFMXTUliKZa2kA4jLRpuvnqauxc1F+3skJxWG9Ex00ed0KwliSsnznagTBpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ns3BnCPymTbtNVRhDAFqoXAj+I5+2MZk1ecKGoZrXCw=;
 b=PykJ3cYF4BGIz0L8vR15Gk0W3kUt2Iz5YD2hC9HCp0Mrd/elrXVKLcMrJXhA4FKphm/zt8mMCc/pP7C/kiiTe1BTr9NPf2bpikJGzTelwFTk8qbvzW4oePqrX8lwu69emOmPTIEEvGc4OHhLit89jArhH3rhBAD37t301JPNIXvCZ/2Qes6tuT/SX8Um1jP5+sJW7SGgrG0NkajZMlmaGWd3firDLBWynGJBuvauwiB+/nJ5QQoU6byMez3jomW0Ki3ZboPyrlkV14BhKxkgFca9U/iQJpcpa8uXYbRWZSdByc/aNVKFJRV3Hwg81k9LaW+CG+bCbuTb1GJlDGu65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 05:55:22 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%4]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 05:55:22 +0000
Subject: Re: [OE-core] Review request 0/1: python3-awscrt: Fix build with usrmerge [LIN1021-1466]
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org, qi.chen@windriver.com
References: <16A4E3F4AD2FD9BF.26939@lists.openembedded.org>
Message-ID: <be6cd137-9b52-e484-97ac-05deaf129a64@windriver.com>
Date: Wed, 15 Sep 2021 13:55:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <16A4E3F4AD2FD9BF.26939@lists.openembedded.org>
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by HK2PR02CA0212.apcprd02.prod.outlook.com (2603:1096:201:20::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 05:55:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7976d17-a4b1-4847-9a93-08d9780d67bd
X-MS-TrafficTypeDiagnostic: DM4PR11MB5469:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5469952A560C5DA688FFB832FFDB9@DM4PR11MB5469.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OTW+gpctUcNwDAdeLOeh1hGa4fI2mpl6oCEiQvC4T2C9yq82GV0qk3MLSjyWxdyZoMRej/lwjL2njWqMOLJPA1yCoSyV4e7RF+emMrNfwhMIQWxgosOKRQr2DwJJeDd2lQS2Cft4+WlZ+WrRj4PoFUOo3ulWzb2VZuzLq6F2K8Js9U2nfwIxqR8/5i/JnMWoXjSUBOf1I2NThNGsEZ/qtpAmHOFBdU2MMHmWKZxaR1sbaxPMxez8k9URbtDZ5D/0hKPLu8PTTnQNISq92N8fdr3IQBihwssWrHo/ZxCdnyeBdrrOHPEnbByhvvmqDH6gQxQK2e7aDBNtPxgiYl1++lx+3XCdvMGJE9bXYXcnnuDSIc8a6pwfVzeGnUp4LNtgUnBwfjpmM4+B7sjKvdIlG07EpDzFnB4TuRdT4MGr9dlFKxW/heE+QBOJjuCcuJC8waXYJm/RIHFY1sGVDmuUxTMOse4IL7TXCwRnnmAy2lDzPiueskMVaT+vX3GnBDtGTgv7bVj9gU54b0TG9airLHF54sReehfIzj9VxYBVSsnCHZ2jrwe04hmYLt13bnHUEfO9sEo7eDnzdGPcFs4cR9PeYF9CXIA8RfVDDXERhXtjrqO5j8ytIHtfBSeQ+HVQEDCriC6XEg3h7Yk0+BG+wfD0tk36gbjy7tCtDY3Nfhd0KuOIkwuGdUB7XnpjfRAU7P4tMxpwsgur5irU9h4+9W0vMnHAp/RAnyHX7zdF4eJv1GuoAGopHQEDkYegfQpEDyLNFKMR2u0CSN65/j0jmScm8qDzAg73cCs/XW4mcs9Pav7b8KndfVezp/X3Fnhmb3Z/hvUGJNJ7E5Qfa5iGzErpetPKoeNgRFs17x8d84vX3Xk4C6zZowKkWVPJlm0ryQpW3cdFYVFG+MoqClRlmcNN5lG+ntAKe9ENTP9U9rY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(16576012)(6706004)(31686004)(36756003)(508600001)(31696002)(86362001)(5660300002)(53546011)(6666004)(2906002)(83380400001)(6636002)(66476007)(966005)(66946007)(66556008)(6486002)(8676002)(956004)(26005)(2616005)(186003)(52116002)(8936002)(38350700002)(38100700002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVBsczdndk9zM21DalI4b1FkUDRPOU1weTdzcEtaVnk5bVMzd0F0eTVCakx2?=
 =?utf-8?B?MDZyZEV2elFmVTE0OExqdUdKbUxsRWNmZW10ZjhTTTNRTzJ5U3RUWmtpbVNy?=
 =?utf-8?B?K3dCaUsxb09lVWJsd1IyZ1A1QXdzY0VRMXpyTHJhMEN3Sm1pRzdHbDZMTXV0?=
 =?utf-8?B?ZjZDQXJKZjJmc1N2c1R0aXlNRzQvZ0U0d2twQzg3OHdwZGRXRlhDVXVIWEU1?=
 =?utf-8?B?N3lML2g4R3F2SmdJeFJYc1A2UEZhN1QzeDYwckhGSFh5eWRrMW5kRERXdGZ3?=
 =?utf-8?B?TngxaEx1RUhPdEVycUozV3dNckFNeFFveWtTdXFmbEQ3eE9UTXBEMWRsOTVV?=
 =?utf-8?B?aks0QVhycWlScTJ6UXNJd0xLUDI1NGY3cDlyN0FxYmI2Tjg2YmxoZnFMaEx1?=
 =?utf-8?B?d1YzeEtHTlBMSjkzRHBLckJMN2xES2lFWTc1ZWpLNVlYKzUzTnJ0MGU1Znp3?=
 =?utf-8?B?K1d4K1RHN1RPQW5zcmpXaW83QlBBMlNHYldiUUw1ZDVaTnBPMnVFR05rNVA1?=
 =?utf-8?B?RXVuVjVqSHZoOWFRYkErWTF0Y0VhNkIvaFoxTDkxOVdJS0FpYXpMMTR2ZGVR?=
 =?utf-8?B?Y04renFUS21TTlprVjJoQUcxajRBc2hPZFMzQ1pFM2VKbkFQck53RXI0elNl?=
 =?utf-8?B?N2h2SUtzT2dZajFlSS9LQXJ0aGFSNVhpc1ZlOUFRSWNYb0k2NjJGMkdSVzVN?=
 =?utf-8?B?dUMyS29CcG5ETHdPa2JtMFVOc2FCczZiYlA5RlliaDUxMjB5YXEvRkRmK0I1?=
 =?utf-8?B?U1BRbllweS8xMlBHVUd0TmVFSVlVaytkZkVTQlNvRVJVOUx4dkFxWFNNWGF6?=
 =?utf-8?B?K0syR1pVQ3U2YlBya1Y4QTB0N2VTUEw0bkJmZkRtR0FYbWRVdTFPU0pPM0xs?=
 =?utf-8?B?aEtlN0ZqbWx5SU02c0V3OHJMNE00aU50Uk16QURFcU1qejlBQ1hQY3N6U3c3?=
 =?utf-8?B?RTBrdzd6RGkzZnJBRHJoZm5wSUVYem9obk5mQkd5L3lGSnVRWGVJbjNKdWs0?=
 =?utf-8?B?MjE5ckpaRDZ0WEpPSFRncGMralYxcDFpSWt6VGR1c1Fmdk5SVjhIR2FxUk91?=
 =?utf-8?B?Q0dKSnZXQ1Z1YndmSDhWN3VKQzdyb1ZoU1dhZ1BTL0hTOEt1V3JxcXRxMXJr?=
 =?utf-8?B?d3lRekFDWEhDbE9mZXoyOWFBY3BZSWJ5aDJxQ0wzUStuVnBncmNScWJFYXVQ?=
 =?utf-8?B?UFBnR3JlT3NZb0pDeCtsQ2Vzc2l2cVIwWnZnY2xwMDE2eDdGanY5QWdpRHpZ?=
 =?utf-8?B?UDF1UEZIUVYzZHhXZTJVRFNyK2NHaEl4UG9RMDlyTEdGVzdUakV5Zzl1Q1pz?=
 =?utf-8?B?WjB4bmVzaGpjdTJLNDZUZXVJZWs0UWNORHY3ODY2UmxBdkF0cjBISG1TclJn?=
 =?utf-8?B?NU12UEVsMkxqVVlROFlJMHN0Ylp3T0dXTEV0aktYc2RrcmxDNzhjdm8rNTRC?=
 =?utf-8?B?N1RlQ3hzcFoxUVlFUks0aHArdmRQTXZUamRlS3lRRU9USjdDOTI3b1FCcEh1?=
 =?utf-8?B?K1QySWg4T2RhbWMyd0ZLSC9SYXo5YjcvVHlXZmdKcHg2WmQ2bkdjY2VURFpL?=
 =?utf-8?B?ZWF1ankzRnVZbG11U2dGOS9YWFJ2WEJOL3Frbmh5MkN0WFU2cktKWitDRGNR?=
 =?utf-8?B?RVZva0VaMDRUYVQ5K3BralNkT1NhUXV2LzlFUGxCUkVLUWhxUVQwUnBVK0Mx?=
 =?utf-8?B?S0lQdFNlck1iZzEvYXdTNkt2aVNpdUE4ZjB1ZlljUExpVDlXaWpna0JvWkFy?=
 =?utf-8?Q?r17q0NjlKjGRmxkRSTSeegBRSEK2VaBw/V+7vtR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7976d17-a4b1-4847-9a93-08d9780d67bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 05:55:22.3557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tknHIOWL98vvtZMOXMkt+0pTj6LgZhjIaPwYWt3TEi7Xji35CUuaR1GowyuJQdCLrpLEdBohHxjPMn39mAykTDnH4Q6jPM/5j3IcmG7iLM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5469
X-Proofpoint-ORIG-GUID: BLiaKU4BxXh8ORfHP5a5rMF-Zq8icyMu
X-Proofpoint-GUID: BLiaKU4BxXh8ORfHP5a5rMF-Zq8icyMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_10,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150035
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sorry, please ignore this, send to wrong mailing list.

// Robert

On 9/15/21 12:19 PM, Robert Yang wrote:
> Summary: python3-awscrt: Fix build with usrmerge
> Tech Review: Qi
> Gatekeeper: Hongxu
> Lockdown Approval (if needed):
> Branch Tag: WRLINUX_10_21_LTS
> 
> IP Statement (form link or license statement, usually automated):
> Crypto URL(s) (if needed): see https://jive.windriver.com/docs/DOC-80428
> Parent Template (where applicable):
> 
> 
> ====== Sanity Issues: (DO NOT EDIT this section) ======
> 
> 
> 
> ====== Impacted area             Impact y/n ======
> docs/tech-pubs                      n
> tests                               n
> build system                        n
> host dependencies                   n
> RPM/packaging                       n
> toolchain                           n
> kernel code                         n
> user code                           n
> configuration files                 n
> target configuration                n
> Applicable to Yocto/upstream        n
> New Kernel Warnings                 n
> Other                               n
> 
> 
> ====== Comments (indicate scope for each "y" above) ======
> * Conditions of submission
> 
> * Documentation Changes/Release Notes
>    = Doc changes
> 
>    = Release notes
> 
> * Git logs
> [meta-iot-cloud]
> commit 2990cda923526dd2745f7ef576f7b11d1ea3156b
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Mon Aug 23 04:08:23 2021 -0700
> 
>      python3-awscrt: Fix build with usrmerge
>      
>      Issue: LIN1021-1466
>      
>      Fixed:
>      DISTRO_FEATURES_append = ' usrmerge'
>      $ bitbake python3-awscrt
>      
>      CMake Error at CMakeLists.txt:191 (add_library):
>        Target "s2n" links to target "LibCrypto::Crypto" but the target was not
>        found.  Perhaps a find_package() call is missing for an IMPORTED target, or
>        an ALIAS target is missing?
>      
>      (LOCAL REV: NOT UPSTREAM) - Send to upstream on 20210914
>      
>      Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> 
> 
> ====== Testing ======
> * Commands
> WRTEMPLATE = "feature/usrmerge feature/aws"
> $ bitbake python3-awscrt
> 
> * Expected Results
> Works well
> 
> * Applicable to
> 
> * Tested configurations
> 
>    Arch    built      boot     boardname
>    -------------------------------------
>    MIPS      n         n
>    MIPS64    n         n
>    MIPS64n32 n         n
>    ARM32     n         n
>    ARM64     n         n
>    x86       n         n
>    x86_64    n         n
>    PPC       n         n
>    PPC64     n         n
>    SPARC64   n         n
> 
> 
> ====== Reviewer Checklist ======
> [Submitters: make sure that your review doesn't trigger any checkmarks!]
> http://lxgit.wrs.com/cgit/bin.git/tree/etc/review.txt
> 
> 
> ====== PULLs ======
> * PULLs
> 
> 
> * WRH-PULLs ("wrh -m" can merge it):
> 
> 
> 
> 
> 
