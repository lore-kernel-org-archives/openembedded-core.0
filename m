Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.86])
 by mx.groups.io with SMTP id smtpd.web12.1057.1588831815217394103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 23:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qE/1nMiZ;
 spf=pass (domain: windriver.com, ip: 40.107.243.86, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8diCTLJwBqgAPwn5+xGVLLFT2ZITc9Y8QPBt8LEo1K7GVCJ1oIlUkfHqy6Q3AHh/inpyaPXe5ZYtqen9z44ApNz9fFLa0LTA03BqOCK5x6zmYq/Myqg44Uq7yfuRfYH15qVTZqCaOFIrS1loX5ZnQVUGBfqi/iDBDxb0G1bHwomLJ75fpdgAhEoolLV3ZUdJ+lw7/YIjqz5HqAN+HjP4flwy7N3tUzSpEsdww0PoDWGGrmclGGFwU8O4jKs48f26aFqw1eK4LTHEI6H+d8XD28lT25DFtmR5S1dSTsWnqNQOTp5yVXxm/cp7Nd0jkUmbB4TywzchOr/TSJGLmWIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx3zRgSlGZL5BJedeL4b8mATSQXY6t9FPwrF4wWBsXw=;
 b=bXtelLX8swEgy425txouesXL9jyWeZZvSA4i16zMGXXGTHXAKTLljEwTTQUrP5EcPk1fb1lyKIIhpwfHhM5BzOEHdeck4zFB3fG3WAmdXG4TwdwTiRb+omWFfQNT5VT6Bz6GmFjTdSdIHlJy2eLtU/Z11Dc+TjPyPZ3Q35mwuUQ60scIykIXJE/hJnJARIemkMowcJMSdQRZbtfLrqKI1+r9oa9vo2GG3kYviAEbpCfJgO2ZFruzykY/0obSmRX+biI6FOMSdjWcECIaw6qYyY5h6jaK67pd9Sb8/UnZ9dprgnqL4Lv0IAYxC+AlPDjhFoKpMru/fH9AUiesdyITzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx3zRgSlGZL5BJedeL4b8mATSQXY6t9FPwrF4wWBsXw=;
 b=qE/1nMiZ0TigptbfUvHhC27QacznIN7XUw1YKFXkiS5bqkavivxRH2mmpZP5hoOO2ppZgBnHe33sQzwcO9+HV3jidX0QLJQtT1Q8khOkR6fMZJDe2NwpNfgChd+y8/kFoL3U95hEiQCLBMIl0JfHSneq0z4XFoOoSCRk07ve2IE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2669.namprd11.prod.outlook.com (2603:10b6:805:56::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Thu, 7 May
 2020 06:10:13 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d%6]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 06:10:13 +0000
Subject: Re: [OE-core] [PATCH] iproute2.inc: clean .o before do_configure
To: Jacob Kroon <jacob.kroon@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <1588817159-434433-1-git-send-email-changqing.li@windriver.com>
 <015c4b93-6ca1-0668-0c1d-2a3150c65a38@gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <f27cfb11-458a-510f-c696-eee661e4c109@windriver.com>
Date: Thu, 7 May 2020 14:10:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
In-Reply-To: <015c4b93-6ca1-0668-0c1d-2a3150c65a38@gmail.com>
X-ClientProxiedBy: YT1PR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::10) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by YT1PR01CA0131.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29 via Frontend Transport; Thu, 7 May 2020 06:10:11 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56aa1987-3b6a-42f3-5168-08d7f24d4e08
X-MS-TrafficTypeDiagnostic: SN6PR11MB2669:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB26699EAA6CE998911102C8CF82A50@SN6PR11MB2669.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5i7zHNhBAP3N3iiTPCi+DvqSR+hRKmbM0kQTuoap61h8PTlwDVcgYD6imzsBaN+lLxxTs188nY4RSGCdmWTMf90vwohgFQRCt/hC9XNDj9GOJ4opgPwzM0KnMwYYlT6BepfC4uCQc/UvytL0k57Nbi27nhYypvUzvJxDHhza7sv+uVSz92wSV/xU8Sjzfjv6ITe0oCTv56gEDaZh0rJcsPuhfMVyzdRUwKdaajf+/AOkyy6XN39+LF1VwZZ1LlgLnc4KS1IznQT/agUhRe7xk3ZMEfN49PBoNsZPgi0bJNNgQT+52iTExRXlA3BKiEtOLHvtOLfLS05Oeyz/bLW4WXi+TlDLV7zNaLcFIzxUmocWDBJFIcgEMrYzecMsVHfWntdX4yq1aB7/ESV+TpoxZCwcxWWdNUzZ/xsdmjppJ9WsdgtHV7OqScpdq4Le3ZwpF7UvIjcAo9MhVfe+TuayZD2zaBmyxcWPG6xPds5r541B9MO6j5L3X+c9OoUBZ8AnZTOD8NVAap+VsVe2nLjm1r8GhKXvJZt9qzolBFEM3tlUklk1zpVIh65O1L0vl3Ir3k8pI/b2CkYXIUfx53N86D0W3YoovmoXYnzl8aHVclbG5shN8MdNN1SC7Rsk0a6M4RG7maJ7rIpH4eGJH8uGSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(396003)(376002)(346002)(33430700001)(31696002)(956004)(316002)(6706004)(44832011)(16576012)(6486002)(86362001)(6666004)(66946007)(2616005)(8676002)(36756003)(31686004)(66556008)(66476007)(5660300002)(52116002)(8936002)(16526019)(33440700001)(53546011)(478600001)(186003)(2906002)(26005)(83320400001)(83280400001)(83300400001)(83310400001)(83290400001)(78286006)(142923001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5rXIsxIVKqUmkt0dwFvY3TBr+UlF1NeIhUvqm9A+4YkdEacLfPQSmDsOXGXdvZMINtU5ifGZ5WNE5qmzC9WUkBQaoDoIZNXtGypAdECQVujwflSGTsJ/iuuACf90og62GWwYulGPJ3X84PXDInVYJQiOL12TXgZTpR5SxTYOoYLAox3HuF0BQULGylQU944EWEU6W/22DPwRGLPTqgbpYcZE9flOukJTTWxPXyw2UCDQdS1XIKeStUajK6/JSYxDZXwTvWjrrEDFSZHrFTbsryD3v/KBxkVMorzTvyKLKfUT2ZCfCoaeHTgrGSJX0fiVL3/gVr2g/lOf70BfCP0OMdtcjmZs3Sc+01V0vIV1Q8bblgS5fmT+uRBactDsagfaqyG28KtM9dHSa5f0TOGcxxkNK3/+PpgGU3SPusbwjdC+qrcCZzaMcB45+BR/+LWOO/op6VGOjaAWj3xigPhFR2V7uzGugqC7K6ABtLk3jvyQ3BVnd35Uc6kHWZihYAUsC1Ouj6yDM04B/SCi60HJ93iBAaXeH/V3QQQpUkeIVbNScS+ZIiHD30TaFPE8UxLn4InFA2LmjCyPhSHmVll8q28EXMv/LturQHCkOGfGJXofs3V8pkWQAhA51yH+EWb50a4b4OGvDN2Xs9VNqA5tFbcIT+gYgxfQRUUinh1aZdngI8wQ9Bz2O4Y/JSlbbXz90fKfo/3rPV6dL1Yuozrhqm2svkCyY5BV+F1L74d8bkTrZt+1S8nTmngKQeZ4Eqh2FFmenwZrLEmWb5z2eXs/L/1I0wOmcWwRD/YnBrNUrVQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56aa1987-3b6a-42f3-5168-08d7f24d4e08
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 06:10:13.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImUgN+AzsiPvrTLkL2rftDoQzXfWbKLJl3YtbMtT4P71MGYsco9z5dotsDng5nZBusYHsts5xMWtacW6CE6cfyg1e6XFsLh2sZpUHhVhTps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2669
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 5/7/20 1:56 PM, Jacob Kroon wrote:
> On 5/7/20 4:05 AM, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Reproduce steps:
>> 1. add 'DISTRO_FEATURES_append =3D ' usrmerge'' in local.conf
>> 2. bitbake iproute2
>> 3. remove 'DISTRO_FEATURES_append =3D ' usrmerge'' from local.conf
>> 4. bitbake iproute2
>>
>> In step4, since CLEANBROKEN is set, files generated in step2 is not
>> cleaned and rebuilded. Check after step4:
>>
>> file /sbin/ip.iproute2
>> /sbin/ip.iproute2: ELF 64-bit LSB pie executable, x86-64, version 1
>> (SYSV), dynamically linked, interpreter /usr/lib64/ld-linux-x86-64.so.2,
>>
>> interpreter path is wrong, it should be /lib64/ld-linux-x86-64.so.2
>>
>> This will make run ip.iproute2 report error:
>> -sh: /sbin/ip.iproute2: No such file or directory
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>> =C2=A0 meta/recipes-connectivity/iproute2/iproute2.inc | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>
> Isn't this a general problem, and not specific to just iproute2 ?

For=C2=A0 those recipe ${B} !=3D ${S} ,=C2=A0 ${B} will be cleaned,=C2=A0 w=
ill not have=20
this problem.

and by default, CLEANBROKEN is not set,=C2=A0 make clean will be executed.

but for this specific recipe,=C2=A0 both condition not matched.


