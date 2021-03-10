Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.44])
 by mx.groups.io with SMTP id smtpd.web10.3097.1615406851680386401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 12:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i+74dbfL;
 spf=pass (domain: windriver.com, ip: 40.107.70.44, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cpl9TNfjaddaDKL3lZG77MKBXI3WAzdv84nMP+5hQ2gZuN+/BJZNSCTfBNZZez/G/9j8DZvXqTdH0NBcAsSfQSMd1SwS/MHl/2BWSOCtqlBuszOsJFOZGoN5oBHoPYvs8TQ/yNJ/JyZAWFrNRB8R/xQ44TrI0L+zNqv7CGNkDQ2wA/qtROQWBi9DxtrYgtKiFoFwbFGnhk2qhB8FYrT9NisSwa4LQS7/cWF++WEIRF5rE4AARZ2K+9IZuUciAb7iGd/Y59OtUx0HFm5beDFxNuNhLflI8WVG1AYwND8ByfOhwcAYkbpBeaQ1qeQOjySP6lAAT7G1nZnZUSrteDR1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiSm2brrqMlvqfBMmqpi505PtaxVvwGJ4DK8RVfTCxQ=;
 b=mdFIo8hFSdxC/rgYV8kMB1cXuZ/xCLAYtndIFJIGLpRTWaNF4yDBKC+U2xCID4l0uW9xGg3PF2PqWOxTtZjk7fOW2qvIW99PJ/9G/Ge8QEx7LonwJG1LQ1uWbEm9egUf1exid1bXXmedcAfnuApig/SccNqtwSVoVtrfCQfJY6OMdwIdtIZ3hLGrDfYcevl9mfhbklQ2M7ENTLjy93Pxvz6CjCPkOFfoxJvx4y/fWibuHxMQCzzb2feELDpoAvjhlImkww0uJjL1uifBdrr98Ck1nsdiVC6xBFDWVVE/s6OST+4A+v7MuMQpQeUaDj1DOAf67wRLdZhnT3c4wgQQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiSm2brrqMlvqfBMmqpi505PtaxVvwGJ4DK8RVfTCxQ=;
 b=i+74dbfLsY5i9YiAE56H91qwKLIIyouEofQ2MmGbid68q8pTo4vNvgRv5j6yaKO07+bw3kDtWxTnE/nvCDADn2d+GIkW08r9uMaipcqNMGS4GzfdSxgGFkTPLMBUKltcqNMWFF6mPOzELk5SKbVQql/cPz66C6zD5YhbOT+mAkw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4331.namprd11.prod.outlook.com (2603:10b6:5:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Wed, 10 Mar
 2021 20:07:28 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 20:07:28 +0000
Subject: Re: [OE-core] [PATCH] ffmpeg: upgrade 4.3.1 -> 4.3.2
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <166B100407F28F66.2275@lists.openembedded.org>
Message-ID: <a656175b-532c-42fe-9c33-0fc54b256d03@windriver.com>
Date: Wed, 10 Mar 2021 15:06:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <166B100407F28F66.2275@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:a03:114::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR21CA0007.namprd21.prod.outlook.com (2603:10b6:a03:114::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.3 via Frontend Transport; Wed, 10 Mar 2021 20:07:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1936ee5-b736-44fd-ed1a-08d8e400216c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4331:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4331B3CA76F59DB42EF14188F8919@DM6PR11MB4331.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bBolnyDu/P5sWVfADDN7riT5ntMWouJqGcMbKcmrb1GilMtGvZoHC1HtkXl2m4sp0AKgpsuoqjGLAMNEG3OmNUiiw1A64xBivdglO5srbK1Au9F/5s5AQYTxcAdHeqzTsQ+aEXv+KnbWv/PJkNdrm3hKa/cTPiy8+vIYNbCa7CWSsSLXHUvF/6BfWcwW/CwpuYukZ2zwdVC3FI1oMoN/J6dvXVLJkZHFmkVrGfhPsiDM5yLqt4gLs07nLZu8od65xOm0fZ+Omsk/KxO1zi7afrtd4FT403lZK4gEzdoExJ03CAxQMxi0GOsuuPbTQqQauxjBPlUJ6CAaPxT3Bpo7bOj0hzGIB4O8kb/2MRZODAH9Fu0RAuOV1+s8cmEm+6pi9zj0/Wotn2sYlX3k33vO5+mwvbgkudTqtP9lja5RC4oFCzm7X4lu+ImfKUmON4xpdzy9OInhQwDTA+RbVznYiWJsiUURFkz0hNVghBguJuRJxdfqcsFzYBr4Fr7kX/u/SEHWKXYJMtOUD7xtkstHPdC++jWfhJQd37mVSvM1FLVD/tgZoyvfzw7DV9ffgc+tlTIJkhtGyIBTnlQKuIFNxszcN8sBLHL5xzk6FaAkP/s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(6916009)(66556008)(66476007)(186003)(6666004)(5660300002)(86362001)(956004)(2616005)(83380400001)(16526019)(8676002)(52116002)(36756003)(66946007)(4744005)(2906002)(6486002)(26005)(31696002)(478600001)(31686004)(16576012)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VmZvYVY5c2MvR25VSm8xWDg1R3U4dXJtVmN4TklzSTJTNzR2Z1VpUTNxZG9y?=
 =?utf-8?B?bC94dDh3ZnYwVVpFMSs5OVVPMC9GU2IxeW1Uc1A0dzBkaEE1V0ZQN081T3U0?=
 =?utf-8?B?dy9jUTUvb3pUYjkvODYzdjFIaVhQNTQ0ZUxTU2xoenlybXZpanFiMVpRS3pW?=
 =?utf-8?B?YVlBdGRVY3pSbHpsa3FyZy9nSnZUdFZFUjgyOXAzQTkraklkYnZteGphQWpa?=
 =?utf-8?B?TmJzdUoxeEc5Y21seXZTb3lFaytmcUVYOHVFUXgvRHFtK2NIWThHOEFPSnNz?=
 =?utf-8?B?ZEF2ZFNBd3h4bmx6Wlh4UjI2WncwYW12Nk5NUUdyQXBlbWdnQ0w4YlNGQS93?=
 =?utf-8?B?UFJVWmY5NklNMGI2S2d1OGtiVm50YXdiNXVaeVNCVVgwYVdodVFtSFAyTlZp?=
 =?utf-8?B?YzJVOWl3Z2NQWE84Tk1HcnEzZTRodGRIWmNNdnFSNUlDNkpLV2lyQmw0MGFY?=
 =?utf-8?B?NmpibDU0b0xScGZPR0o2N2Q4dUI5NUJvRGxUUWkxSHdncW0xZTJERzlZVnUr?=
 =?utf-8?B?VTc3NDNTcDhpSXhGKzRUWjlvYXc4dURPTU5tZWRpT290TFl0S21DdjNFRlJE?=
 =?utf-8?B?ZHF6Y2VOSng4dEFGYVNKTUl2L1RnVFVQUUNZYzhtQmh2TGk1MU9VcHlJQUc4?=
 =?utf-8?B?RWViRlZ1cDNWZjlwUjFyN094eHFlY21rYXd5ODNxT29sSnZkaEVtWjNnMWZZ?=
 =?utf-8?B?WEw2Y3pjaXFTd3B2MEp1S0Fpam1WM1JCU1crTW1ZdStGdUxvR1pVUlRWSXRH?=
 =?utf-8?B?N1dUM2ZaMDlaVXhLVlRvWXFxa3ZLWGFTM2ZsaTZqb3grOUg0bUN4REYrZ01Y?=
 =?utf-8?B?VWdmeUd5NkZvZExtMTk1L2htY2k5THk4VENONXFQY0RnQktiYkdhVHNkdTdw?=
 =?utf-8?B?bEVVT2RPa1l4Y2c1a0kycUNiRWptNlp5TVZOSzlmRnVUNlVYRzQ1WUhCTXh3?=
 =?utf-8?B?YjUyYkJoQ29aRXpvSkIzOVFxR2Y4azJkQ1g4TTJDOUNjUkIwSUl5RkRGdS9Z?=
 =?utf-8?B?dUFwQ3IwRFZYRWxWUWh5RHdvRjNBclZ5ek9DNVFGVS9aY0xLbU1PR0lTTW8x?=
 =?utf-8?B?NFZPTE1lZnBMZG96YWVTTzNoZ0plRk5lOEFUYTlXRmhTMlFkSTdwL0VSUm9F?=
 =?utf-8?B?VlErdjJ0UnY2dHFOOXN2VU9VM1pDSURyME1wSkNZNXZUb3hieURRNFBSbVhz?=
 =?utf-8?B?RTM0WHJQNHYzbTVBNTVrRkV3Qml5eWdMMmdTN2pqZ2wvemg4cnM4RWF1UU85?=
 =?utf-8?B?aHd6K1g2MnpvNFR6cTBNU1RzNWRSeGhoWnljalhaRkw0YVYyMHJiWi9IUFVL?=
 =?utf-8?B?czF5WHprNW1UUjlBelRXUnlUMDQvSmQyYyswSUlXWWZFQlROdWRtN2w3UU9q?=
 =?utf-8?B?dGFKOWFOMjZsZlhicVVIVXgvLzAybFJvcmdkOHNZaTBYSmloQko2OG1Tb3h6?=
 =?utf-8?B?RGQzNWZZL3luVUpENG1TOE1IYUJxL1hkMHE5SmJjSU1KRGNCUlpmSldZV0tq?=
 =?utf-8?B?em9oR2RabGp6dDA4OFFsV1FGSTFRbEZ6L3JsOEdiZFhBRHQ0Y3VHdlpSMXdT?=
 =?utf-8?B?UDh2UE50K2pEQkY1K3JpK2lNUnVteE40K3RzRnF5YkprdzUvYnlvT3lNZUtC?=
 =?utf-8?B?am0zYWVwTm5ZRFRHZUljMnJPVGQ5NkRTdTB5dzZKb1ZBUTJzZ05DM21jbjFv?=
 =?utf-8?B?R0lvUTZscDdYTVhVQnlGSVBZcHh3MzUvaWFVWUsyY2VjSkxkQThvTnhwTUJS?=
 =?utf-8?Q?+vZCVT1C7Sgfu7zqK3r3f7yr27VsI7Tl6MaG7be?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1936ee5-b736-44fd-ed1a-08d8e400216c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 20:07:28.6174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwiM8JOEXwgCth4dlg6lQPro45m2RkKt99g9t5ujFNGp13i8xKZpX9r15LlXgLCuGS9qbr10dkvzioQYSCe0FoN+Ts+xXBtyr9PBXQHPKiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4331
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA

FYI. As expected for a minor update.

BUILDALL-QEMU LOG FOR ffmpeg
START TIME: 2021-03-10_07:33:43
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-62-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86
[musl]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86
===============
PASSED: 18
FAILED: 0

../Randy

