Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.44])
 by mx.groups.io with SMTP id smtpd.web08.3836.1604366305188225370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 17:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cmfT9xJs;
 spf=pass (domain: windriver.com, ip: 40.107.223.44, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaV3+nFf6gMfyQvPkLfVjnArtSeV4BhbZ7qNY+wfPx1DSCaY1VFYzvQCeUqruAJ7BMeLxLy7LW/ytc8hN29Y9+EM+ayktP7vDXFp9CDDoPnE4LnnAbxR6JuM58Lc857g4qKk4R8hOFZ52iy4K1wUgQoZqJeZY4W165VEcHORDBM3g2n44RJa6IfqcHygBIogh7tnvLYJWJm5rlAUc44VqwNfnflrGIniwf8ooJH/N0rWP2RJL/qSpsVnxwuhRYW68TJKxuLE4gquWLCAT/EjCQcuVGYfNhGvxp7H5j/9Btk+L5f/00OYJ+j0P6eiRxJUa+NNwyvVks3k7WCbOSt9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXNo0g02vjuryOalWtDAUv2/pwkly9pmxY4xKkoONfc=;
 b=WV/lArNVOV4NQ1qc3avUQmAitJeD2hiO6/7h5/Rtp7wEPK2TXv2aE/vDnxeoypTe1/3MmJiMT+8q1Ccw/TAdXXrn3EDyA/hIylN8bFK/zdSE+XZXMgvYMpWsOOoK4SCAih/mij6h3M9q70jbaeDk6fr3YHDfIjVkzylqhN1+d0MiQuavxHekZjFXuM2TJSPP3e3LNyHszChf33r5ENNPaepqHfR+7K9tUtWIZFXQXou8MTmdEA2+M3JGWiFIMXrORWavaQLW6Qn5CzA8cdrGW+j3/fyMGGy16qoYODKN2Dm4IfVVoANGVt/OnwR1undvdeY/T8yw7hcxrbWyONxMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXNo0g02vjuryOalWtDAUv2/pwkly9pmxY4xKkoONfc=;
 b=cmfT9xJsR9vy0/ZoZeAy6IURDVz35dC642QvrnRUzNEIuyUk1zPPbdeeJT+0wQI5my2/qUHHw9rNq75DFgFwj9iIvTcHczPVoCbjj7q4UMMDRXYsQy+LKaxwVoJFymcixejuybiK9iAK7v5wxn7v+qY8vOCD7cKJCAUmV9lbH74=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 01:18:21 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 01:18:18 +0000
Subject: Re: [OE-core] [PATCH 1/2] pulseaudio: unify volatiles file name
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201102092012.15968-1-yi.zhao@windriver.com>
 <bbc810895cce2a28cfb9449a69661c98a29324f8.camel@linuxfoundation.org>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <07b5842f-6771-ed1e-00c6-d4570f36c544@windriver.com>
Date: Tue, 3 Nov 2020 09:18:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <bbc810895cce2a28cfb9449a69661c98a29324f8.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0073.apcprd04.prod.outlook.com
 (2603:1096:202:15::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR04CA0073.apcprd04.prod.outlook.com (2603:1096:202:15::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Tue, 3 Nov 2020 01:18:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33ce6e3c-a26f-4483-455c-08d87f9658a4
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15848CE9E455B9D20B76C3CEF9110@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ark7DqS+m5iWpm9DGSOgwCt2646GgibAxwKk3Y2mmjb2xpLSTXAFUlu1S6P9JCLUJT3uRIRJcmrVz4SBBkFP+Wgc8A1uSCSDx621z8KF+7eL3ycoUG6sXg8yXIqYk+hfSRwdaVmTkLalPIRPCuBJuvDAyFGoyIj9rnVKxjIgo6v1KfQrK10K5ur5XvFvRoKMqgk3auWNLreFFViaKu5cr+HaUDnJstEFxgtk0rVJZueUzMLlG8MbvuIWmqWhLvNLtz+U8YVAhkWmkf9oUuDaSI73dHbR3KJKaNY1q7By9sB0IwWvpgy+QsFjtsGfgZKlqQAMnOR9TMxKTPZwlV60EZcosowEOpJH0xHXj17XsF/kKAutWSp4x9isU4o0ti6ZPXaz+eKUMu/rp/tJXIA3fg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(31696002)(2906002)(53546011)(66556008)(66946007)(478600001)(31686004)(4744005)(86362001)(44832011)(6666004)(26005)(16576012)(8676002)(6706004)(316002)(66476007)(8936002)(956004)(2616005)(16526019)(186003)(83380400001)(6486002)(36756003)(5660300002)(52116002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8hKmMHX4OiOQ6mJGInllDHzAp+Mz/yhSbQiiyxwwiqZBHaDf5GDXp3zqC6zcnF1AbKUZ5JnHuwNL4I/zDgJuBNqH3ozqbt8OAb5GXFLEU1Anw4XiJ9Ko0IRYrKTlAFxsp+6XScXZLLALnVlMm87pUdLgIwm1ejPGO0zE8mww5R4w4bKyMtHIE9oZKlZn9FfKIvqa0WuqypywIdUw5+2uAq/lyIBWk6sO4t4LACKdJ+9SFDTHNEQyndHjBYsEQaT6QuWDz2QuvhF49WyYKdZGtnegm5543keGPNI8igIqgMi5nzfrUfY5BADCiWwl/PXhqkEIvTSAWAnmhi2RwRWDLHJ6n3ptNcToFSS7qKJ/HPE2Ab33ZPDoMBNY22leGLghcAhsBWUqZTX7EvVMltB6LVMXPNChz/f00pStk7pc7DiAMrTwU8TLbFg3usFXH2eK1QRQHueboAMjpv6/6+DeFOqmzfKdaBiQdwfDWKNj3ZAVp/AfIEt34DaEPf9FnE4FvH6jqXNUl8vbSBMI4AvZ/T2szTfUmZtHEZpTtSERvKRWAJ22b2gZdWn+unnOj0gHPQZuNLIWAgXCE1cb1CGxvGr7cl2iuLMo0Fgn6nS6zeyUyiNpg7j7gKjkCKURSA6VZJO72mhZsmpVf6rjD43WPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ce6e3c-a26f-4483-455c-08d87f9658a4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 01:18:18.2913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKExc9wf9XwROAqq+600aBhqO16bHrD81WyFRHEziT4HuP99xFE+fEUs/2nCefyZiiL3KF1W583V74YtQE4A/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 11/2/20 7:40 PM, Richard Purdie wrote:
> On Mon, 2020-11-02 at 17:20 +0800, Yi Zhao wrote:
>> Make the volatiles file name starts with digital.
> I think you mean starts with a numeric value? Could you say why that is
> necessary in the commit message please?


Just want to make all volatiles file names uniform. Currently in=20
oe-core, only this volatile file name is not start with number value.

On a default sato-sdk image:
$ ls /etc/default/volatiles/
00_core=C2=A0 01_bootlogd=C2=A0 99_dbus=C2=A0 99_sshd=C2=A0=C2=A0 =C2=A099_=
wpa_supplicant=20
volatiles.04_pulse

If this makes sense, I will send v2 with more explanation.

//Yi



>
> Thanks,
>
> Richard
>
