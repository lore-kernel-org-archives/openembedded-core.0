Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.46])
 by mx.groups.io with SMTP id smtpd.web11.1425.1615585738724963151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 13:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BOQMHzB7;
 spf=pass (domain: windriver.com, ip: 40.107.68.46, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHCd0neLxluWRE0uzEIotvAytpq6lN2+1mvDqQNsit+nu1TmOrrWMavaF4aVlu8yMGALYgNIpaD2BL2Rzu3FW8PFJAeShgvy82B9BrMQoPUqVWH9OoP7gcSoNw+RA2e2KHiMTjAD67X+JaDJee5xx7RtK66xp6O7Anj71EEZNnxkGYubLD/o1qXROQo5G6xl8xXw5jKXzn6aEQn0CsZGWgtCVfJuZH97ppQTHsymSo64pOr5BPc0A/3bOxHFm0i2on1G+l6Yi1OvujQX0MdWHnvozXQhUBrhwHLfPySKBL0FBEBYCdc1vBDTd+COuJgRXFK6/wJKMrqjNElGgNteQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU+TDkta/XRnXfChZSPXRkYFmguRXNtUEW5eT1JCMOA=;
 b=UjWPCt3hdo9El2VyU+c9DovOCn3W+tpvVCY/jCTZQbw0RHK75gBc3iNmTFw9NBeB4nlAAv1wDkVpnReaxNuA1PFmAtjK3Cqs09hYmmiiHfPfaeC7oHUgnC36EfO6G2J6dy0XPGj/dlUa4+gzNzdpfosU66+4J8qe3Ve9Y23qzl3goSvZc/sl9f483KOnky0eHlLOdYo12caeFvTyokLg+RWuMNRPJpzNtu0eVpJfsdjUX4jAq9BbVuQsJSsMAecpkXCiNI2DjIhz8kvQ2sK2LSoo3jPibWsCl6EBLXEuBhx9CBBA1MVamYjnxSO8kCdbFbJTdDsm37KAQ6GNyXcajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU+TDkta/XRnXfChZSPXRkYFmguRXNtUEW5eT1JCMOA=;
 b=BOQMHzB7pbj4+aHp6buZa/OzpxrcN3wRa6iSl1a7hMMeQIo8SmW/q8pRdkwVMpIDnS+fwpV1vV7KNbxdUdbCnewLlrQI+cC90cBOj3oCUCMLTdAtKVDdJI8AdsPtB1kGgg0dxlbF6172aisKFW9gwKlEp7rSGzj56UK7JKWuz9U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 21:48:56 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::f503:3124:d48:ccb1]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::f503:3124:d48:ccb1%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 21:48:55 +0000
Subject: Re: [OE-core][PATCH] linux-dummy: add empty dependent packages
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1615542770-26280-1-git-send-email-li.wang@windriver.com>
 <7f61a68faa2e2d14eb41770f7e4973c38abb409d.camel@linuxfoundation.org>
From: "Li Wang" <li.wang@windriver.com>
Message-ID: <4b5d450d-94b8-9c95-d236-87a6995e3014@windriver.com>
Date: Sat, 13 Mar 2021 05:48:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7f61a68faa2e2d14eb41770f7e4973c38abb409d.camel@linuxfoundation.org>
X-Originating-IP: [120.244.140.160]
X-ClientProxiedBy: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.117] (120.244.140.160) by HK2PR02CA0186.apcprd02.prod.outlook.com (2603:1096:201:21::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 21:48:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3190457c-35c9-4ea3-27d8-08d8e5a0a207
X-MS-TrafficTypeDiagnostic: DM6PR11MB4723:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB47231DB34374E641648E7223EF6F9@DM6PR11MB4723.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QPA+cN1QGjZNeqFL4GJgPZpVOMj+PF64sETPr6jxODkh4qudsr89LzcTfx9vUKS3qTm9JB7PyidoimAbh2tkDDpxB9ON6+h+9J9ZJHp9LrPupxqpiNWEXWVWDXAay9iYEl27pXmqTpaPxeAQYEb6YxgP3JM80zED7JUQQICJVCygwek2pIrj2BWlvizAJZyavj5Xj4Z2Mcv4bYDdpeLdskKsysc8KeyszeQEMdhp8ZAXqh4TiiEp+jN5PhPiCb6qqlFWCJtYsR0Igrbc6dZjXdqj8GavVrFa9sbxJmybF2jUF/wRseftwwtrflbDHHvrkHYydBmC+el+7y2VK3Pd8LPqEJwKEdGDcGwFdyaiPASssYCYPMrf4Et0jp7jddmmsyYViAkze1VRbWkovY1od4ZxJlId91EZgV/fCjOtHSxtI6jg9TX514UsOlFOCoz72XRyHBQFoIBGM8Oxvtzs0sxzDVv2TsVpDqsuYsO5ksWevbwcGmmObWzox/J+6eF3jrplfX8m/GoRjHnPF6lC4gdNO4b4S2jrWC2Ei3rCVTu0FKBhIOYxGEsArWi80ctWmeRszakU4HOWQk1QwRjvtzWD7aD12/OfE1vEEoG6ArzjM+EflRWvnyPqJGVBVFty8UHRylKMnl12p/o6OxGSBg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(376002)(136003)(396003)(83380400001)(31686004)(31696002)(6486002)(53546011)(52116002)(86362001)(8936002)(26005)(6666004)(478600001)(8676002)(66946007)(2616005)(186003)(956004)(36756003)(5660300002)(316002)(66476007)(16576012)(2906002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Fbn6l7+nnxU7+ecZqkbV95u+Av+Mc3YFx1z4NrR3ijGhPhVbvKg+SEmaABfm?=
 =?us-ascii?Q?bZrwyh/tuwSsxBOZECF0WgH5U3M69h8P0iBlRj6Mk9bKpWNRkYhrGN6mvsX8?=
 =?us-ascii?Q?htHQyrYVlO4aIPhb6HUu7GaqRwyZ0+R1psFTO/RKCRhLSBoRXqE2lcucAaFb?=
 =?us-ascii?Q?UESoNiJZ7VLyzL1jc6vp/CsvrIs6Np9svDSkgZxqvPulJMFCJtAfsvnytkm0?=
 =?us-ascii?Q?+8hewdZm9uoKKvHES/LrX7/ELXeuzBc0mQUbJk1xY5xaN6jt4w7KJj/eRNPe?=
 =?us-ascii?Q?oITtvsAAibWmC5FPB21Ig5M83GxFJk52wIDp38sxsVprR2sR+vBMmQgaooaZ?=
 =?us-ascii?Q?U1z0xp/45B3BDihIvHxZaTlVArb0z7YuJOB+vR5vSMgyExH0E6e6xSB9W0rR?=
 =?us-ascii?Q?fxlKkkMJXckp4mMlLzGTX9DgiHE7QAo9daCUIs33NVemfIpql0E7oUx+kbxW?=
 =?us-ascii?Q?Wj8CBSnOfVjmhnxNkEOILuUXhCR4GuIPKtUvQ2smDzNsj+R0uFDcyMeEDBYy?=
 =?us-ascii?Q?TRS3UvFn6etWOc4gUv3RA+bPkAJC7+XzIinA5M4vUkMbwrLDlMsF/+7aEezJ?=
 =?us-ascii?Q?Y0YLZPSIrQGfx9vW3VYmwk5JMYfsuuIcxw6i1qYgSzxdlYT7Oh6sNNnShtQP?=
 =?us-ascii?Q?vcHqKqXoyU2ewEUZB7beC6F0tUUwtQSOehRceToRf/iVmGKyTWksF87o+Vnd?=
 =?us-ascii?Q?PY392Bz95BowvlSpnkp0KXG1gdz0GN5Rz9JHpSItuFd6dpC195X/+iJpRN4k?=
 =?us-ascii?Q?0BwvDxVYNCdFocTrmJdNPBDBJ0gBRvvRcAbzWXknqL4qMqD98XVxKt0VXBxK?=
 =?us-ascii?Q?GZrJiU74nzU5QUtgirikF93pVFLXpgMkyWPcnAXhmpW9xPsaB5nERIjYon5S?=
 =?us-ascii?Q?rND2ysNiMy0bUcPCUeeab57/umuTdri2OnmqBZEMQZ6cS9z0w3zpjeV+TuHd?=
 =?us-ascii?Q?OEMtOBsnV6s84hYQwjp+aaKFqHhlA1+Wq2vzx7n8IW2/PCwDzp1XLfmZrMVC?=
 =?us-ascii?Q?MHU1+xWp/rsiZywa89TBa4xPBpUFVh7FQdYfKNJaJoEoeooWHDrgar5hSx6V?=
 =?us-ascii?Q?KNJq7kDhxBdcBethcvbo7tZl2kbjXqc91kap64RPmCZMFOCMouKGTRh25yXE?=
 =?us-ascii?Q?CHv47aby5FOFPH47Mb02SI9DA9X150MkptjQMxDyplNFc3jALa8ROHDIYkZp?=
 =?us-ascii?Q?05aRl3nlxoFpmInx5D+30dcq4DzVnaIerP+vwWOeUVHu9fbG1Kx5nBZoeXQK?=
 =?us-ascii?Q?6Z+Ml7uC6Ingftmaq0+p9MtJiWC9+cQjF+pC7CiaEfOlEPhE9m1Q7a9yvmHn?=
 =?us-ascii?Q?DLPRcBLzxSad8vguflQyPHNd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3190457c-35c9-4ea3-27d8-08d8e5a0a207
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 21:48:55.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGeeRtrlQwgACLe4rg2behr58W2jKPUohYCR3mrF11j2bgzIWuEczAGL/KXhMF1FKHBIHFqKRIin21Rkmp+8XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 3/12/2021 20:44, Richard Purdie wrote:
> On Fri, 2021-03-12 at 17:52 +0800, Li Wang wrote:
>> some kernel includes kernel-image-image and kernel-devicetree packages.
>> these patckages are defined in kernel.bbclass
>> but, when use linux-dummy, these packages are not defined.
>> so, define them as empty packages for avoiding compile error:
>>
>> ERROR: Nothing RPROVIDES 'kernel-devicetree'
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> ---
>>  =C2=A0meta/classes/linux-dummy.bbclass         | 26 +++++++++++++++++++=
+++++++
>>  =C2=A0meta/recipes-kernel/linux/linux-dummy.bb |  2 +-
>>  =C2=A02 files changed, 27 insertions(+), 1 deletion(-)
>>  =C2=A0create mode 100644 meta/classes/linux-dummy.bbclass
>>
>> diff --git a/meta/classes/linux-dummy.bbclass b/meta/classes/linux-dummy=
.bbclass
>> new file mode 100644
>> index 0000000..cd87915
>> --- /dev/null
>> +++ b/meta/classes/linux-dummy.bbclass
>> @@ -0,0 +1,26 @@
>> +
>> +python __anonymous () {
>> +    if d.getVar('PREFERRED_PROVIDER_virtual/kernel') =3D=3D 'linux-dumm=
y':
>> +        # copy part codes from kernel.bbclass
>> +        kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>> +
>> +        # set an empty package of kernel-devicetree
>> +        d.appendVar('PACKAGES', ' %s-devicetree' % kname)
>> +        d.setVar('ALLOW_EMPTY_%s-devicetree' % kname, '1')
>> +
>> +        # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_I=
MAGETYPES
>> +        type =3D d.getVar('KERNEL_IMAGETYPE') or ""
>> +        alttype =3D d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>> +        types =3D d.getVar('KERNEL_IMAGETYPES') or ""
>> +        if type not in types.split():
>> +            types =3D (type + ' ' + types).strip()
>> +        if alttype not in types.split():
>> +            types =3D (alttype + ' ' + types).strip()
>> +
>> +        # set empty packages of kernel-image-*
>> +        for type in types.split():
>> +            typelower =3D type.lower()
>> +            d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower)=
)
>> +            d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1=
')
>> +}
>> +
> Rather than generating broken empty packages, why not just set RPROVIDES_=
${PN}
> with the appropriate things?

linux-dummy is just an empty package, what does it PROVIDE the=20
appropriate things?

linux-dummy has the similar codes:

=3D=3D=3D=3D=3D

oe-core/meta/recipes-kernel/linux/linux-dummy.bb

PACKAGES +=3D "kernel-modules kernel-vmlinux"
FILES_kernel-modules =3D ""
ALLOW_EMPTY_kernel-modules =3D "1"
DESCRIPTION_kernel-modules =3D "Kernel modules meta package"
FILES_kernel-vmlinux =3D ""
ALLOW_EMPTY_kernel-vmlinux =3D "1"
DESCRIPTION_kernel-vmlinux =3D "Kernel vmlinux meta package"

=3D=3D=3D=3D=3D

I can offer a more complete empty package as above sample.(FILES_*=20
DESCRIPTION_*)

please give me some suggest about it.

Thanks,
LiWang.

>
> Cheers,
>
> Richard
>
