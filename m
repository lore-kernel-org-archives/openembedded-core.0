Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.41])
 by mx.groups.io with SMTP id smtpd.web11.5853.1599102921705832065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 20:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PVVwOO/M;
 spf=pass (domain: windriver.com, ip: 40.107.223.41, mailfrom: li.zhou@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+q0v12J3gZB/ZYqzHSmN/g3MqOLDpAV8lx5sgOslSl4G0Jesq2RidWoWg2S3uAIWwyqp8Oaugfes2x7T5mghr4pnLs9dpTOYwfu4KQ9wzxgAoQj+2wfeNznMQBrB415kPyB0SMGiUvTK7o29cRdB+xUpjQ/Lfj5r7XTIqH/JiUWtYOX7fYrZCVMbgRfB3yGA33AetDkW9rxll23iaCugq/oLaBzeOlgMq+DrJjsu12+oKF/M+/LW3n5xpd9QIZHXiKiUmy5liHAkL8nYRaTrLuqVC+Mkg5C5hVrG28eQpBVoAj/nP9WK2OHlzgrPyfqen2q1pRTxTGVvABsyw408Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CS8gdEI57apdGW1AGumENPUoo77g07aZgi91QxTeD/w=;
 b=ZDWHw9ToKwOa2/pK2eVElPwZepRSenfqVVq9uMnRdkcc/C54WovyENTK+iFYTs6B4WtrMC6kGkTUNHFPYLo4mZ6IKfC0XANt7xsllh1cvHDEPxv2VXWpRukeI4ywLqDxcJwpykb6lPPEAaLelx5tuxaZQK1uxnOB7XKyu5b+RREEqiBaOIAk6nJGs7MbcTtUY4FnG9BEJiT9pzgteYOwfJaPPcV+kZbfZbocFSLrNnCS5+zj29BUHxPfsE41BuHC0e/Oe4iPDBqsB6RX5NP2gWVCVRnVafvnAkpJfMfmlWwn7mXvSCWjUYot5P4yaJHtVdHMha+jOSDeyBjASvqJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CS8gdEI57apdGW1AGumENPUoo77g07aZgi91QxTeD/w=;
 b=PVVwOO/MLT2MiR5Q5cNv0Lq+swr2cu8YRpyrK9JbRaTuZaF0KEzkNK0fnJtSwkNkbrdU8MbgsERt6v1PSCg2rTdms4b89YJXx0eYetDpMWGYA0dv8DFS2wJcnnQZEngC5mv1qtsjEw6vt7eJljxqltNAszLzW1GFwSWQ8DpAEEU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14) by MWHPR11MB1488.namprd11.prod.outlook.com
 (2603:10b6:301:c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Thu, 3 Sep
 2020 03:15:20 +0000
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::f44f:12f4:ecff:1400]) by MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::f44f:12f4:ecff:1400%12]) with mapi id 15.20.3326.025; Thu, 3 Sep 2020
 03:15:20 +0000
Subject: Re: [OE-core][PATCH V2] connman-conf: make connman-conf only available for qemuall
To: Ross Burton <ross@burtonini.com>
CC: Martin Jansa <Martin.Jansa@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1597978383-189322-1-git-send-email-li.zhou@windriver.com>
 <CA+chaQfKoniG=ErQ9iN34xa5GvtQgrzpANnGG_1CfhC3_gCQ_w@mail.gmail.com>
 <CAAnfSTt8c=fiQkXCDqMKZ4ibbKCBSFCmxPenH+CFhLJoyu_0iQ@mail.gmail.com>
 <69e18a93-e2f6-f17c-4624-a51693e0c279@windriver.com>
 <CAAnfSTv-w9Hyno+GK30gtnFORBQJGciWx+6J=0ReMswcBuXG5w@mail.gmail.com>
From: "Li Zhou" <li.zhou@windriver.com>
Message-ID: <8599a83d-cf10-8848-689b-252c4058c296@windriver.com>
Date: Thu, 3 Sep 2020 11:15:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
In-Reply-To: <CAAnfSTv-w9Hyno+GK30gtnFORBQJGciWx+6J=0ReMswcBuXG5w@mail.gmail.com>
X-ClientProxiedBy: HK2P15301CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::22) To MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14)
Return-Path: li.zhou@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by HK2P15301CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.2 via Frontend Transport; Thu, 3 Sep 2020 03:15:17 +0000
X-Originating-IP: [147.11.103.217]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e3c2ef-51c7-468c-6e4f-08d84fb796e4
X-MS-TrafficTypeDiagnostic: MWHPR11MB1488:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1488E541F8EDF515715F309CF82C0@MWHPR11MB1488.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mC/XoIA+aKXZ8tV0jyXwfP97+QI5pPe19cqYIq9oPb5oFvB4KilIj644zGMM4O0hCpd7zCtRaubQNp9iUnprbIiwbwb1fMQ1FTeWDskumaQhRB0Ag50hZFAdpAhGeKqi7kcYUISNO6FF+xX7ORwwJV9B4iZKGCEPAhzHCR88NLwew4PAnmsHA4xLYZEmRH8ES64YjFQ2unj6GXX6HM+hrgtpt70Yvxtw790uPMPPSZlG/rPK2hSz92fIoUKjbSP7nC+9SYwerRrrV0bfxr6TU1mFbAWFQGt1GVl0KWEIrV/iGcYP1N12YhLC0WsEYYAwKWMa/s0ygETeiKDqjfLXJoKPy4mo9YfUsZQqnHWYRz/imrcLoELaF4U1KonrczRE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(366004)(346002)(136003)(396003)(2616005)(66946007)(53546011)(5660300002)(186003)(66476007)(36756003)(6916009)(66556008)(26005)(956004)(52116002)(316002)(54906003)(8936002)(4744005)(86362001)(6486002)(2906002)(8676002)(31696002)(83380400001)(31686004)(4326008)(478600001)(6666004)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2IBw7STfwFp4x07dEGW1eqdZ86Xy+QKsw49YRidL6E5cc5Dn+USlvJ7BmTcCYrqw+1iSuvRGbVxkeUIadLHtFpxeMGRYanG7YGLrUzW/GRkLjQBGu8kb5TBccVaG4rr9awUgVFgmqjoVkGWOzqeLlwOvJ1SWqQgIB4VUaEPedP3fOX1Wq4gdxB7WwPSfUTxYfkLsGkI1cR/8H6Qq7Ni6KOiBKrgomU4WsID86ZrqPhBu0mUp4uLKc/MKt54mRJOdtrHqpRchaBFv7mz+ODbrwWZvPEkB3iHy9oiW8Vz4ZAqpqfI1zsU0cp3PafHvwZ6NavVyRtm319V1uncE61Ew2HHZrn8NjP4jlurG2tMIwdGyk+G+TvYyHZb4hRReO9oLd/ADBELMTtWQ/Ps/+T9moobr33ReJLVDyeV2gOrRe44ibtOkn0jA114qUrD6GH3xhtjS6sEZfUdBHIsaQV9iDDu02H0fWQacbil8pA7tO9/y6GWfQAOwL1bw/y6eCT9rr7rRsThk/WGLj4xnVrwhvNc5iITyKCk9cx3s4dHxf3XWzoGB6JWQwTR9PN9HlnJyeG1lfaO92231c8yXviGB+Lw0KruwPyDAMLm9+UPHlTq7bzen9m3ePepgxNQy7jGl3WFWCzdOOsU2UDMdEt2DCw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e3c2ef-51c7-468c-6e4f-08d84fb796e4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 03:15:20.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAMInYOpu04EJ/3jNrV57SZalH+Vj0yr4hxpFVsAfb9EF1A+39i8qj1Mij75t3vdeeZQUwfQXZgSAcMOBfR++w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1488
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi, Ross:

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Do you have any plan to do this=
 patch?

I think my issue can disappear with your planned patch.

Thanks.


On 8/27/20 6:10 PM, Ross Burton wrote:
> On Thu, 27 Aug 2020 at 09:48, zhou li <li.zhou@windriver.com> wrote:
>>           I have a question here:
>> building for a real machine (say, intel-corei7-64): MACHINE ?=3D
>> intel-corei7-64
>>
>> While in connman-conf.bb:
>> SRC_URI_append_qemuall =3D " file://wired.config \
>>                              file://wired-setup \
>>                              file://wired-connection.service \
>>
>> So there is no connman-conf package generated by default because it's nu=
ll.
>> Building error occurs if want to install connman-conf to rootfs.
>> So how to make things work?
>>
>> If I misunderstand anything, please let me know. Thanks.
> I also have a patch to remove that _qemuall override that I've been
> meaning to post for a long time...
>
> Ross
>
--=20
Best Regards!
Zhou Li
Phone number: 86-10-84778511

