Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.88])
 by mx.groups.io with SMTP id smtpd.web08.10177.1611765011894016717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 08:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZrXzpsX7;
 spf=pass (domain: windriver.com, ip: 40.107.92.88, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSv1mH7Oglt1rrvQ48gokbTNyVZFQZoARahLgJ0eV75gL0HTJR8JWv2RJ4nGCrVGCLCcPeCwU1phXCAE8/l5oPHB73m9e6z/gDIt8XGWxW8tyGQhFLTDmtgl4NCfFUDhOzJ3yU5Wddd6sHLLB2mtQ2Bn0e3TcP46fl23n4BqOSmyvOJfe8s6jty4ahuHXUVKRpKBr73lWOYHhLDWdKA6HJw7I+iQYt2AhavgnkVY3/OkHDu7ScxTYUAxS4hzLWgYhsk3mw4oDK5/Xb0Kt/uA2U9DdLPX/z9cIBMAUHIOsHHmoQ3K+IOLNx3ikb2paiX4oBPul6f66cGSsU+MQTmsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRqG/O18KjNpAKajZrt4mXkh9qVYHiyeZeTXeYwy1WE=;
 b=So/CjE2y3B9bCR93ADgq4z2tJ7s1LKnZErOiL3nAoW7RWNCAQy8SYPgGzNd29C68kEgoCJQgEydrINWmVoML0FQxo706m8yDlc9fuYaZD5dcteJlefl6uPoHjAzk6rZPej1xrCgYkusz/2sF96mv4c8X74C+139FZQVoOW98dRBlQShFuHASZ5MdgkooSENoo2Yql//AhNlp30Yr8n2WpO6Jz4kHGyokwXEOWeyfa6yRyebktVA7m0J8ShtVRXrzSGo/QtUC/G3RG/8X+lsSHw9LLxaEbTgtDuOFmGu8oLElycBChG3vvH4TKAW/8I6+438guU+uxkFA3ceYDsmxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRqG/O18KjNpAKajZrt4mXkh9qVYHiyeZeTXeYwy1WE=;
 b=ZrXzpsX7to1vSOybGzRSZyZ70fjshTNpqfNLYDZs+OR8AWOkyWZ5C0MorVFP/Akzw+lyLB0qFoEBlHxC5/Zdh7Pl+q6ZSm15KFsOdV8Cv3S+rhIvJ7ZaMgBe+9EelPYhips2752Y7VJaOVdIAbRxNmq6Yf+NMQ00A4nhJUYU1DA=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB0047.namprd11.prod.outlook.com (2603:10b6:301:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Wed, 27 Jan
 2021 16:30:08 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 16:30:08 +0000
Subject: Re: [OE-core] [PATCH 0/2] Enable QMP Dumping for testimage
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210126173107.2204111-1-saul.wold@windriver.com>
 <7ae582bd8a678a8bd443c9a78e395fc3796f4131.camel@linuxfoundation.org>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <c1e5a969-4709-d215-5dda-cd5dd6e17359@windriver.com>
Date: Wed, 27 Jan 2021 08:30:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <7ae582bd8a678a8bd443c9a78e395fc3796f4131.camel@linuxfoundation.org>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: CO2PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:102:1::12) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.213] (71.238.119.71) by CO2PR04CA0002.namprd04.prod.outlook.com (2603:10b6:102:1::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 16:30:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0d1337b-14c7-4a5e-ecb1-08d8c2e0cf74
X-MS-TrafficTypeDiagnostic: MWHPR11MB0047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0047EA9590097A2761E88968EEBB9@MWHPR11MB0047.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D/qMIjXq1jxxsyEByEWuDKTBIpNvaPqaksWee3m06bZUmnThzHKFezZrGl7womxuNry+cvQINsCY+4flO4jGFusnQ74qkNmKAPjl0Ag6e00vzBuQfwdJ4VYdgBYDvi9+ubADps6SDoIUbG1JWtVSa5+5z3TfB8mqpilopB0YbvxL4negVf7/Uk7+jm/jjjz2AZof87LbDZzenl487HfHPOCXFT1lI/o3HFYiZDrQuiavFLkEO6a/RKycpD12hsPF6/ZtoWPLJbbYOw0NfcSQlWlVEagdcmtLxHfs8IsRV4OEJ7coqsgGxGaj1Qf9fBPt+LfJchKJdDy9HAzBaWxWoLqaurJw0x6D2VVTyv/MbFKoYeqZ/cC7VmPbuHf8HJSYxgplvE2baFB9k9GDOoCFrC3Oa2e3HDh0ew6sfidezmYHQstfyGla1QdfoaQO6nRZPwqC+JVg0zV2Yk5DogyA1xUIwtBY5174dl5PAIDDOkmdACGDPh0Qhqm1i3JUjOyTUycxJOGmXChrC3/K4Rov9uWK5Nhwfm/MNwzeYRWluPVoyJoirYzczW84zia87ctGILAJESzuYtm4JU3UC2x2Taf8wjWuho0uUZHowHIW/0wnTKP4beoIFch/ZyY/LdRc+ZhtZ8v+Xgq/ToIl/4W9rBHf4qyJz8lEjQxzUg1FdtsWdA71vcFuDP6CfRL0DtS/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(956004)(2616005)(26005)(53546011)(316002)(186003)(478600001)(36756003)(966005)(2906002)(31686004)(66476007)(52116002)(66946007)(5660300002)(86362001)(16576012)(16526019)(8936002)(6486002)(31696002)(6916009)(66556008)(83380400001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DFyM4qxAEg1YP6qI+rjDFpUvTJhRtRulzAtbbCjFM0ZEKXic34jFw6DXs7O9?=
 =?us-ascii?Q?39gbtomTXePq6WsDdrKSvhn0399OyGBPc1PHo/1ozsv9NbHEYA6BXnICaXqr?=
 =?us-ascii?Q?xT1FoVEJgpriWb3NAOZMRJj/aD5dfF61xDHCQxiOwko/smGUBj135JQUHg8g?=
 =?us-ascii?Q?GfX9E6cERg4v9f/iBHf/eDlByBhF8k+K6hCY7hvGyp1dNxdu27qhXGNngfre?=
 =?us-ascii?Q?IfZxD3lE+9fL7nO4uHlvtnKJk35Y27kU5UIYrqGPilyHOSPgNfzjbLFzAMrI?=
 =?us-ascii?Q?NzEnm+FtsGqfNgkBS5FI8CGbeJY/mOjMceJYjwkh0tknK7cHMYbhQHbr7S2a?=
 =?us-ascii?Q?YIbf49qrvb5cKioRuKhGLPaiCayJcZpCwORbNmP4XjLaKuKiAUqSQzlkQ5CU?=
 =?us-ascii?Q?3VKohyb968FgcvLIk2GOrRDpBDr/LQGPUAbcFRXFupziDmoItsmfwKXRtz9o?=
 =?us-ascii?Q?nwTLcV3y7qJokBZwwMB5myUrbm92LAuIaIVl41yxZk333bNcJVBeTEs4wGqL?=
 =?us-ascii?Q?NwbMO3ZnPqc39U25dBxZ0jMMNGQ3Y0/lYm/IbkCaNlt+X5SBQmcnWjq+ne87?=
 =?us-ascii?Q?UYpgPVQ1xuDZ4+IRzzIEM6RsGAlXwOrwGat/IKieVM4BEX64iyEvi9XRsdcy?=
 =?us-ascii?Q?gzdV7SiO1M8EVRknZmW/OlzJ9RN1HY1ijgng0NcKoIoAWZhyPzz/lTsfFzHb?=
 =?us-ascii?Q?dGv9vNlTlRykFS1D+ylDUQzlX3Cp0aeBIiGUvnEO5uQ28M+9Tl5klI9c2TFU?=
 =?us-ascii?Q?iI0/tX6p+XCWjkhenuHuULRVG0VyTQCq+KlMe4CjFl98klZ3HnuVw96kfGdF?=
 =?us-ascii?Q?nl6Sic4GgvccOynJv1pegSVswJNoErrgMyf9gf7dJnh+0H/xUWVIqDFTLFsy?=
 =?us-ascii?Q?Tt8qmSzoP4+Tq7xTcTfrHWsmV/kTzD5PpCR6BNozmpUrdlV2OxGYphw+uVnm?=
 =?us-ascii?Q?qUHcYERmLnyBUNZDjof4sbR+dcCOCacdebjrVCUFPQh4B/el8Q6AlAZuKQ/K?=
 =?us-ascii?Q?1rimnAloOb4LkhKZ44M+4fHVsH7sPq6rjPLhAvfVEtu5IGNGQzlDX5+SkX9P?=
 =?us-ascii?Q?ALARX5g4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d1337b-14c7-4a5e-ecb1-08d8c2e0cf74
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 16:30:08.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWETV+RVjyY/nqrlVDkcdX+Ur7PyO1Ba/JphI/yIWbUygStSgGO/ebgoOeQq9Uo33yG817G3PLTga8PxaOjYYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0047
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 1/27/21 12:25 AM, Richard Purdie wrote:
> On Tue, 2021-01-26 at 09:31 -0800, Saul Wold wrote:
>> I hope that this is the final pass!
>>
>> This patch set enables getting debug information from QEMU via the
>> Qemu Machine Protocol interface. The Qemu source provides a qmp.py
>> module which is instaled in the recipe-sysroot-native and loaded
>> via python's importlib during runtime.
>>
>> The initial commands that I issue to qmp with a failure is detected
>> is: query-status and query-block. The output goes into formated json
>> files as follows:
>>
>> tmp/log/runtime-hostdump/202101061054_qmp
>> =E2=94=9C=E2=94=80=E2=94=80 qmp_00_query-block
>> =E2=94=9C=E2=94=80=E2=94=80 qmp_00_query-status
>> =E2=94=9C=E2=94=80=E2=94=80 qmp_01_query-block
>> =E2=94=94=E2=94=80=E2=94=80 qmp_01_query-status
>>
>> Comments welcome, I tested this by calling the monitor_dump code
>> directly in the target/ssh.py code instead of waiting for a given
>> failure.
>>
>> This has been tested with both testimage and oe-selftest as they
>> take different code paths to the qemurunner code with different
>> parameters.  I also tested oe-selftest with and without the -j option.
>> I saw 1 failure which I think is due to my setup and not the code in
>> question, runtime_test.TestImage.test_testimage_virgl_gtk_sdl failed
>=20
> I ran this through the autobuilder and it looks better but we're not
> quite there. We did reproduce the
> runtime_test.TestImage.test_testimage_virgl_gtk_sdl failure:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1758/s=
teps/14/logs/stdio
>=20
> and given its giving a traceback here:
>=20
>       0275:        try:
>       0276:            self.qmp =3D qmp.QEMUMonitorProtocol(qmp_port)
>       0277:            self.qmp.connect()
>       0278:        except socket.error as msg:
>   *** 0279:            self.logger.error("Failed to connect qemu monitor=
 socket: %s" % msg[1])
>       0280:            return False
>       0281:
>       0282:        # Release the qemu porcess to continue running
>       0283:        self.run_monitor('cont')
> Exception: TypeError: 'FileNotFoundError' object is not subscriptable
>=20
> I'd say that is an issue with this patch, it needs to more gracefully
> handle that. It could be its attempting the test and expecting a
> failure elsewhere in the stack as I think you're right that not every
> vrtigl test runs on every system. You could check older logs to see if
> this is expected to pass or skip.
>=20
I tested with my same machine and master and got a Runtime error, so=20
this is an issue on my machine.

> Besides that we are seeing a lot of warnings:
>=20
I will dig into this.

> stdio: WARNING: core-image-minimal-1.0-r0 do_testimage: Qemu ended unexp=
ectedly, dump data from host is in /home/pokybuild/yocto-worker/pkgman-non-=
rpm/build/build/tmp/log/runtime-hostdump/202101270227_qemu
> stdio: WARNING: core-image-sato-1.0-r0 do_testimage: Qemu ended unexpect=
edly, dump data from host is in /home/pokybuild/yocto-worker/pkgman-non-rpm=
/build/build/tmp/log/runtime-hostdump/202101270227_qemu
> stdio: WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Qemu ended unex=
pectedly, dump data from host is in /home/pokybuild/yocto-worker/pkgman-non=
-rpm/build/build/tmp/log/runtime-hostdump/202101270227_qemu
>=20
> The build is a lovely toaster orange:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1787
>=20
> so I suspect there is some other side effect we also need to fix.
>=20
I will throw it against the autobuilder next time.

> Sounds like we're getting there though!
>=20
Slowly unfortunately.

Sau!

> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
>=20
>=20

--=20
Sau!
