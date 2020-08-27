Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.63])
 by mx.groups.io with SMTP id smtpd.web10.14647.1598518099374032152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 01:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YeEvgr6F;
 spf=pass (domain: windriver.com, ip: 40.107.102.63, mailfrom: li.zhou@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZkqyWE/xi9gMmlaMkZY7filb8C8TJLAdXUryPh3JVL8C/UTwyVMR37mYiGtXgp4ZgkMqDZzQ/XXkEcQB6YrYc+MrxDV1Cpj7nzRhM/bc+2YYAbaoupxl4DjZdBxWXny/Q+gw5kxIMVPTPksuwoWhNL3JJ8Ud6INPQtlG7dweiiMbF78LqQec5vmjnzQ/9TfAhm/1AbrmnuKoRQ1W/PIlYpAlsvePQWf0DSQdJ3vkSRoVNmV7eNwjvWt2VV4ERR0dHsxyZuFb9DD3JlNiGE62hYT9XbTGscA8bVi3oj9F5X7zrIUVuftFC8EBYvHFAnjzaU+UJhLTVHL7cL2BToqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkyzVXfgn8SSofuE+k4Br8Z1K9WmfkFdWuFhK84YSPE=;
 b=cFFyJwmxFPWhpQ/JJ3/bKvL/ToKSPlzlSmMoAd1q1QthJf/TZAIkW9JaAIRfgkG1DkUuCXPxYfVEwbnNM6JmjVw0eoB0KI3HG6qbFitofDRd1E3a9CO/6bHCvlpROCO/VaeUzBaI6FP5kw5HXwLxrWbiSJxrZM1Vgxbe/PJAxUAj63Dt20z/IgAEDvb+UrouyZ1ozs3EAI4Oag3v/l3NQSuqKPPdAWdgUzCvoRyaKQUHLvglG+0CVhkfq8uDaC0tgvwcrY6V6oObnHD4JGzD96n13L+eY+vCtNWxMcBs2jjTcNqfuEGSt1FNP6ca64yNrqD/uzASLetbeZeABbXltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkyzVXfgn8SSofuE+k4Br8Z1K9WmfkFdWuFhK84YSPE=;
 b=YeEvgr6FcVjI8yDjhtq8/KjRGBJZM+v2q2rgGboDUNHy5F6jkTcn+gvJETqdtjU3gD16u0gr1UrrnJ3EMFIZf0Z7Nl6rSHhzxmCBzHUyIJarBwdPI0/+ojdiJiyc/bYqS/MnjKy6i0n8ORft1JYd69wqWALYEyxcMFOpTEkkevw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14) by MW3PR11MB4618.namprd11.prod.outlook.com
 (2603:10b6:303:5f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 27 Aug
 2020 08:48:18 +0000
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::f44f:12f4:ecff:1400]) by MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::f44f:12f4:ecff:1400%12]) with mapi id 15.20.3326.021; Thu, 27 Aug
 2020 08:48:18 +0000
Subject: Re: [OE-core][PATCH V2] connman-conf: make connman-conf only available for qemuall
To: Ross Burton <ross@burtonini.com>, Martin Jansa <Martin.Jansa@gmail.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1597978383-189322-1-git-send-email-li.zhou@windriver.com>
 <CA+chaQfKoniG=ErQ9iN34xa5GvtQgrzpANnGG_1CfhC3_gCQ_w@mail.gmail.com>
 <CAAnfSTt8c=fiQkXCDqMKZ4ibbKCBSFCmxPenH+CFhLJoyu_0iQ@mail.gmail.com>
From: "Li Zhou" <li.zhou@windriver.com>
Message-ID: <69e18a93-e2f6-f17c-4624-a51693e0c279@windriver.com>
Date: Thu, 27 Aug 2020 16:48:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
In-Reply-To: <CAAnfSTt8c=fiQkXCDqMKZ4ibbKCBSFCmxPenH+CFhLJoyu_0iQ@mail.gmail.com>
X-ClientProxiedBy: HK2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:202:2e::23) To MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14)
Return-Path: li.zhou@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by HK2PR06CA0011.apcprd06.prod.outlook.com (2603:1096:202:2e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 08:48:14 +0000
X-Originating-IP: [147.11.103.217]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fbaf7aa-fec9-4efb-889e-08d84a65f18b
X-MS-TrafficTypeDiagnostic: MW3PR11MB4618:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB46181C6F4611EAE724D9F8F3F8550@MW3PR11MB4618.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UEi3E6SHg1yVnGzmTn17muJsHmibeZYKd95NvkVTOY7O5XpTboI7FEEEO7E0Agy3eFajti8DFOl/Aga5+RjTDScRLOUQLGsW/G+afEFXPHU0GbmS5EvMPsNGbucZFc+UHYQyhTY4EpA6ke6keDU7EN7/0EkHQPA/hYOf/r4RKv3qUDxIS9gTILkgwRcohAvFw4L87qWK3jn/d+Tu2jT33RTzi4sB/8U5XZ5Ylc01dgTsh6HJiPFJ5jRjnBPQGVZWEYX2ZbJXw03BQCO7lP2FooO7qICjl4O0LjCNSR/W+VyjvjLbdFScy74brN/r1cS9WnjvXtqcGhKJx459LFiZ/YvQzfs5p77qwSr06VTSOeQ/iam2Nc6eZ0c+mYYcWAq2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(31696002)(36756003)(86362001)(2616005)(956004)(83380400001)(66476007)(66556008)(5660300002)(66946007)(4326008)(6666004)(478600001)(8936002)(2906002)(26005)(316002)(16576012)(110136005)(186003)(31686004)(6486002)(53546011)(52116002)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pvb7AkMSIZYXBYRdfqos01NQ1OB96a9u8sY0ZGorZCt4SGalR1t05GZ8RezfQBdb/oamZIzC/UnDHnmkjPQIILUvyZ3YYCt4MLDohCobFHvivDc0m04SockDLZhUOitkYJMs4w4EkFDX51XYWJbCNC+/C31n+3lAiLfQg2z9XowhuW26z1EejxR//9JTPPI4daPY0FZB9jsHlpWiWqF4NuSGTJi7a03f/UYguTPDzT8h7Ijz6aR/sHM3LMqnm0wPJ4V3HkCEQcvlYp0CV56iwsyYz6tCIADnSgJ9fNwpuU8fWv3B+FhDc65X6sAif7iDy+qaraqgq18lCwsgdyrhf3bMZcsxRHGSDaoeC4rcBxu/6rVdwsRytT0bsdJojxfsZU7BV/L+patlXAioGCFa1zGVtkrekC+fWWtFYT70NXvKmtlVYqZwyI5pjzDwtQmQt764+uA/AwWHs3/oKXRMKJ2WWfeyxE9uvx3YLM7RzT7Yfgx+maczWz0bsMFIZF9e/YbJz2d/+21k4EE1VYbHgDZo3CZxLpujjuEwZd2Ik7fbnrkrobRzfNSyPX5XPU7gsvQIn6RV0aNEXb7U3SGjII03sOX4NjPC3kSz5lR0JIvMQBZc9CiA7oGyXa7dHmzANzAabv/JCZiIDU+dOjPWVA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbaf7aa-fec9-4efb-889e-08d84a65f18b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 08:48:17.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0LdsrvnnwQk4sH5KZsfKdohl9dthb93t5dzGvd8Fi9QyliqrqvLvIXROgb3IJPNyempI7mzWYiNRsAkTnQcUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 8/26/20 9:06 PM, Ross Burton wrote:
> On Fri, 21 Aug 2020 at 09:07, Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>> We're using connman-conf to configure networking on various target machi=
nes - not only on qemu*. If this is merged I'll just undo this in our layer=
 - and that's fine, but if there are more people using connman-conf like th=
is, then we should re-consider this commit (or at least better explain why =
it's needed in commit message).
> Same here, please don't do this.
>
> Concrete use-case: building for a real machine (say, intel-corei7-64)
> that is supported by runqemu.  If you want testimage to work, you need
> the networking configuration from connman-conf.
>
> Ross


Hi, Ross:


 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have a question here:
building for a real machine (say, intel-corei7-64): MACHINE ?=3D=20
intel-corei7-64

While in connman-conf.bb:
SRC_URI_append_qemuall =3D " file://wired.config \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 file://wired-setup \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 file://wired-connection.service \

So there is no connman-conf package generated by default because it's null.
Building error occurs if want to install connman-conf to rootfs.
So how to make things work?

If I misunderstand anything, please let me know. Thanks.


--=20
Best Regards!
Zhou Li
Phone number: 86-10-84778511

