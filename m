Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 3560 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Dec 2016 21:34:07 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0105.outbound.protection.outlook.com [104.47.38.105])
	by mail.openembedded.org (Postfix) with ESMTP id 2581871A51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IIRc34K0UbQtCz7XdcZrzCwABCCJO8k+X/42K9U7Yvo=;
	b=Vtr1vcEptTsacy+sHe2jfIvLUC/OxhP34asBtZMuIkjJpDknaFKBE3hcnyIlRKgtsCrmeZT/oVw7GOY/QIbLnEfys6eYeAXXBjBWEg31aODLpsKUEfMU8ZWTTOVyKzegz2GyXP9+k93RkTP1Gk2tMtFlqAzXakUUf34m8VDUPOI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=haris.okanovic@ni.com; 
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	MWHPR04MB0705.namprd04.prod.outlook.com (10.172.167.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.761.9; Tue, 6 Dec 2016 19:01:50 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161205214818.13342-1-haris.okanovic@ni.com>
	<CAJTo0La+W7qJikWqjHh6f90M_Cr_v2EUwegE+CGRLYCR5D6K8A@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <a451efe2-f5fe-ca22-28ef-06571ab8ac09@ni.com>
Date: Tue, 6 Dec 2016 13:01:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La+W7qJikWqjHh6f90M_Cr_v2EUwegE+CGRLYCR5D6K8A@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: MWHPR09CA0006.namprd09.prod.outlook.com (10.173.97.16) To
	MWHPR04MB0705.namprd04.prod.outlook.com (10.172.167.142)
X-MS-Office365-Filtering-Correlation-Id: 24e05c75-8632-432c-e27a-08d41e0a55b5
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:MWHPR04MB0705;
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	3:Vpljus4lEdkBP2QAMu57g05Psu/ae2/EcR1DjixGVs4Gia9BcQAEnmeohTrbbg2uxrO31GN0K4gVQAkMOJdIkkHrl8Lw831GMaXbs+7j80XGCA4HJ2ME5RPqHpKBzNj/2scIxPPyoCKZ9BJGD0xsi4aOHKtsqPTT7aakNPGX5F2vquXtEuUymzZO4hqDJIoaI8UVdBcObOCIJX/WudGD62rPPbO4Zw42wJHB4s7B4K08uI3hnA7dOMUNdjYXWfkH2/qAj87Mebtbooi+Tb1EmA==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	25:pswKjlPzftGbM3ugB23u0Vlz7dl66osH7JLQKwVpz+vgi6VNtRvwwc1b31AR1l1hPJr4qs7BQgp+PUR3q7uabdTvnaCihSMSTiAesReIyBwrRHVAzHR4dX/W6KjQ/GDNwCNecuGaQ6ubHOthW8yylXclun1oO0e46l64gt7kW7OSTdg7/Tq7s00o7oY6J51wm9pnTpSdEMoNMNDForLtsnUDnda6XV+3EVp7dHh8k4dHCar6E2NFY1OPy4qevvet0ImbDYoB5XFCLQUS1Mdj9bpCP1wz1zBgrZhJxhCjjFqnMMul5yHJyjtt4zwMX1WPxxtIt/FCtNodlSnj5Srmj8HvAhvkxuRPa44Pyw4KkW7SU4LTjRILM3rPs6yikDhP1Cz9jawuqlxfbh+qvZWV0adB67kxHdm9ZT4ItSkd+FRBwI00OghFlY/xYl3vvIp/tWjgo2kjokvR9o3K1Zpcol3tX6YJZg7FyWI/PuQxhpJtKqWC/yoTzNY4UiXBsmzpSu7Qg/LjR++1dqxGBUdO9uUIloOF3mWClWLtfTGIBQqdhshcUUMwWz70+XS/DUlIZKQW/5+s0VLn4f20y9EVCyZGNV9j9egjN9jtyobx4wxxlUVCm/3g+Ke+J2fJzNc8XW/ZBncik2lh9D64zHt6SULe3eNtJMsV/THw3hsR/L0BAUgPwTF3Om0kUXDga7gvfzSzDU0wq6dTbaJ41MXoqfqZyqbW8N/qkvBt1mHi6oovzTrrDwwq+5JPjKuy4PAeiCY6FeZ1UL7TgJ2FipEYaV0Y9gwARV6EHGUFDj8/OFJhFrFaeyf/RCtJiYVBg4p8
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	31:MPMoUJ5SmH5k3NGfRNaKgC3iaOY41T7KLJ6s0o+aNq7sbZv9Aj6/YNPafG8aQRm46UkouXGHqU6NlDbeFlnSsdabjVZHW3iADrvSReKk5ksRL/d5dtgvxmf+gke4tuPwRkWYgOBHa0mwQuVC/4C3omUttztHgFZ1cwgdlx5pjykH1ssMfdJojYLpAgiQSYOdfXUOzJRUj8+tFAo3aEqV8INHkUjiXjx3je+/n0v82Zc/uQhHrWnIkePoNgBYpsxNA55VlmQMHG+Oczl90/dPtA==;
	20:gHRjddrnaPz+LwTndBUThy4tg/7otV+SoLgZ5hEeiQUZj/gSQU0FZtS5EcfAFSZyzZn+/1ka+mPqfc6OU6bDP8zhLdCY62CnjZLQSPawjCjC4G7GAXPlvmCMPVYui2xXIMSgpcTDvUeQT1CZaZWljSaV723TQph464cb2zuXBM9TPah5hKISUIE+E4FQkRVJBbCG8ZWsgl/w5FvJMQ4B1s3zrF31w8kJ6P26Kd35rWSVizMQ0KbQnavHklS+gB1U+xjwQYUY9O/jeGf6QuqUBfYhQFlLIaNZ5vuyoxiVP2qYnDdZQw1u3SfHqfPCZOANyNWmTIqS/LffRFkEJDHe+CRoHRom7w2jSrIAwX20CBFnv8HG8c3DZh+Ez6EmiY50Wo4Q74LSBDK6H9YaTwyyGSIDxP+ApDi9RmS2nbeQFlF4Vv+1wESLCTmCAONMCX/dZLP2RazkFPtrlicmPr4EG1tRUW5QQURpeHa0wQjhra3ogRIjW9A7agieecvTq1r2C7RNztLN1SxL4viIzBJSAp4SgjlToeoW54pJUVkoGmQUhs3APw+Tmu1eTg3kSKEbma9fwgYXrpvROcGkzbZ3AKugurZcEJtITpPOn7+Rp3s=
X-Microsoft-Antispam-PRVS: <MWHPR04MB0705433258B0CEFDBD4C18FAE5820@MWHPR04MB0705.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123560025)(20161123562025)(20161123564025)(20161123555025)(6072148);
	SRVR:MWHPR04MB0705; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0705; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	4:31d9TNuyD+L2yGBdOMrXG49si9vXiqVbFsFv1bBIK97yopf4ymgF0qoHmtRL0dVcsbL6kjONs6hlkn3AJa4AsDNiC2+udHmSfRIeKS6X4h9xum/WGqAYqOIYRtSqzVqhGleHWOuxPn8xJ5Omse2+Z794Oob5Cf0nDYzAOO37sZq3t3Gr6slp4Tlo9UO9sAOLlzhhEu4s1+usZOS11JaY4Toql4g/E05naJ7BwfKLe+ldjqBfB3GiWVIalqIo874DAke12+dRF5jUBg1woKYiWZ2IRimC+kxlNYm0geDu6yP/76Hpjg0Zw7PXP/GHv6/85O40a40HOJWD9oyFOkUcjgKdRmv0dPDo8B5RyjgCu8agiKBGDfKBcMZS959FvpZg4FyDoriDpkUHwPl3v34EMFWyhWl7hQkoyuDGG1Fi4RuSUyNy7mexryuY30Udennw2aODmfrAdaHEty1qJHkG/8GWzvMqDA6Bol2yoy9/M4QVJO2ce2jfbAJq4KYOeH2vIVFIhObhc+tAb4d5XUtvdp5ofxzWYnwLzbVv5i+hf7DEhjUrRsOFkYdqBdAjZsm+tZRxsQ5ZgsNM77ckk7kDCvfnDK83pYiexHNlX098LHO6lISPYL9B1pBPsOJZljUU
X-Forefront-PRVS: 01480965DA
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(377454003)(189002)(199003)(24454002)(23676002)(7846002)(305945005)(92566002)(7736002)(65826007)(5660300001)(76176999)(54356999)(6916009)(50986999)(8676002)(6666003)(2950100002)(15650500001)(4326007)(101416001)(36756003)(33646002)(105586002)(4001350100001)(31686004)(110136003)(3846002)(42186005)(68736007)(64126003)(6116002)(106356001)(189998001)(97736004)(81156014)(81166006)(230700001)(50466002)(83506001)(39450400002)(39850400001)(6486002)(31696002)(229853002)(47776003)(86362001)(65806001)(65956001)(39410400001)(38730400001)(39840400001)(39860400001)(2906002)(6512006)(6506006)(733004)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0705;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzIzOi9XVlAvdk1uUHE4UnBUQ0JDYjRIWTl1OEh0?=
	=?utf-8?B?WHNSbHFMc3RsZnNZNG85UEcrc0R5QytlRlBLVzZWQXFINGxZNDR1QmZ5M0Rw?=
	=?utf-8?B?V1NUVzV2Qkw5RnRuL0E3V1l4UUlTYjd3bExIVVlsQ3VIK1BpQlUzUmpWb3Zr?=
	=?utf-8?B?UFNDeE9uTGNuZHdJbUwyTnRVUVZRYWJoU0czNEY2dFJPcE84T1FpRTBuS0JB?=
	=?utf-8?B?U080eW5rRmNYdUZqRUQxQjBqK1BPSnRkUUxzUzROZUhqaE9PUFhBSDM4QU43?=
	=?utf-8?B?YTBNU1RkdHpvQ0o2ZDhjZ2x3cUFxd25KN2t5VlFVNGRNcTFpMWZqWEZFWjJ2?=
	=?utf-8?B?K3Y3U0RpM0hOVzNzdUNQRCtKRFprMUxDdWhuZWFLaVRlSG5XOFRtbjE0Mm9X?=
	=?utf-8?B?UjZOWWNDejZZcUxQZmErbFhPZFg5elhSWjc3akJSNmI5VmFqVmF3MGNWRWVB?=
	=?utf-8?B?NzNjdnV4aHd6ZEhneS9HUXhkbDEwV2kxZmZTd0RLSnpLT1h2TGRIRStrak83?=
	=?utf-8?B?T0VQaW9nYTJ3WE5UREQvTGtZVWpqeVFsSmpwTERpK0hBUVBEOXVpUWx4OVVN?=
	=?utf-8?B?TDFjUkVaT05wTVAwYjZaWXN5MnpuU1g1VFgwSkNiYm1qblVoUFUyL3p5N2th?=
	=?utf-8?B?bWtJUDBWaDF1dkxrdng1dUJpdFR3UVVZNWNWL0tjSURIaVNqenhENUp5QW9R?=
	=?utf-8?B?VFRpTDBnaTZJTlVtRXZNbkJ3OWwyeHN6UDlVVlZhV0dTTjUzVEZwY2p2ejdT?=
	=?utf-8?B?WGFwYlE0eU9VUmwwSFp6NGx0TmlUM3JtMHNaQUxERU1aS1VIQnlYdTBjSm1G?=
	=?utf-8?B?c0pFZzFhK04vRHU3NUpPZVlxOERJWE1JNGJiVzlSMUhlS3dxN2Fzc3ZJVVBD?=
	=?utf-8?B?RHZjZGpKdlBzdWdYYlNKUk1kTDdzdGYvQVdoWUcrK0xKaDlKcjdHNkQ0aS9C?=
	=?utf-8?B?UWZrdnFWLzNMZzdiU2ovOU5USDhDNWtDUVV0L3Y1WDN3QlpPNFBYWnc2aVlp?=
	=?utf-8?B?SENYSDNHM2JUdGpaUDcxd3JVWWk2bFl6VzJrQnZXam13MUp1T3RFeXFIRmRL?=
	=?utf-8?B?K0RUMFJnNU9RcTV1MjRIb1N5WFhzVXlwNDI1cVZEcER6S3U3Tjl4RWZjQk1R?=
	=?utf-8?B?VXJmSXNoeHkrclFWbVdXSWpYWTNUM3licXA2UCt6U2V3MTRPL3l3bG1oN2lI?=
	=?utf-8?B?Ym1oSFRhM0hNWnFTVm9MRFNudmxzRmlxVm9zS0RGY3Bvd2tqenRnREh3S1JK?=
	=?utf-8?B?WjZ3aHpVdTlGU3JjcVRudzNuSGN3VnB3b3NwMXJWVkVxYlJTdUJKQkZtZENa?=
	=?utf-8?B?Vk9HZGhLOE5tbklWdzVWMUFKUE1RellnZkgxK2N0eS9pNHZzUUNiZGsreWsz?=
	=?utf-8?B?dm05emRvbzY1MVFzUnJKRmZkNEpqY2pYa3BNbFFvd3l3Q2tacUJFSzhldFVS?=
	=?utf-8?B?NlczbEJkVEp5UjluYkcrOXp2OENJS1BIZEMwUVREQytxZXc5MThpQ1Qrb0N6?=
	=?utf-8?B?QXBlWjdwRktlaDV4OXdwN3dwbGlOemtLR2xxQm5qY2t1WkNYOWplMmU3UGY3?=
	=?utf-8?B?WVRVMW9aeWVNRUxzcUp1Znd3eXpkWXFVTVA4c2NWQlFhYWwvV3VFbDdZaSsz?=
	=?utf-8?B?WGcwdWpsbDRxUk04VUo3aUNRZUQyNEJRT1pVMmRGN2thcWZNb2xvazZTZlp5?=
	=?utf-8?B?c3R0eEU0dzNXRkY2Ym5QUkszNVVPZGlXbHBMNEFsWGphUDdZb1h2MzVOL2pZ?=
	=?utf-8?B?Z2J1dzZLOFV6dVlYMWNuVlp4TTdiM00zWFVGeVNpREVqRTNaK2tib05KNktK?=
	=?utf-8?B?TjVadlhieHMrenVyYnVTN1MvQ3lvaG9xK3htbWNscTdCNEJhNGpFeEdZREQx?=
	=?utf-8?B?ckdiZUVGY21acEc3dGFYai9laDF3UWVvSmwrYjF4Um93TXZyR3QvRzlrTThl?=
	=?utf-8?B?TFEyS3lQWHJuU2ZWcmJ3Y0orRVhiTytPbSsxMWhSdXRvSVY2YTRrS0V5TGVz?=
	=?utf-8?Q?zfG5ml?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	6:l9gk8jcVY143PDCQOhoqxI4/FPtoH+ZW+hFJksyBR7/AFNVAPuPMW9BOF0M7eKbaVVyxmRjNUmrb8u2OeA6OjoV1o5hmB+4RKWwhtGjdNu55CbmCF1C/MD6Cp22QzTIG2Y0Z3qqGMiueIgd71e6nQ4TjEJ8nXcJD4MMrgMAo8zPr9qEaicDbxhfZNmqC8pK0YUO6zYKtiKSLdL6x+xnsJY3zi1RN2TZRO3rbTHUTcOP4qbMest+NhQRIoiwNWwqVHi3T3j0qvGdafF8g6zv1PV0l1GG0euP5JHOQD+1HawZv0CfZ1kWCDfdmjI/DUtiKpDOJ5Cqj/CtVrdDqM5rl+GaaaubJ4SaAKmAC1BO3F91T7j+pkR+5Y/V068vmWW33/gYy2OMW3jzYrOzG95CZ6hoyR6B4/ZcGF5V6cqrewLI=;
	5:3yj0muH0s+djBnLcYcm4pWDnfPJNLWkxnpBaqPeXeVO9wUyAR4N2YnlQ02v8FwtYKl+t5YIhfDh7aTcyCpUGsoO/Bt3/0tDm5NXLsbfYCvf19b4+URkhWmAF16bByyqN63h7lGN+LGBNAjrSHT+jJw==;
	24:LN8//DL9UkNmdZ74eOGGmZZ7uNKBFcY/Ey5U1BpzkT7LgAM4FXwF7sZyyuWqaogvcbd+UPu3raqbgmD0Yy1wsD6+ZkJnkAEjUtKU0XahKcU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	7:YCQjoYR4hYTbaPxC5fB4Dei8e7JJ0cBU25DlIsg0SdJCyIqNIOg3DnBW3MvSqRjozaZPCexntCJo14X2vFDQyOT4NfwVS4zi0MG2AkrNRaOQZ9v5c1LruPyHtLFqQ89lHfjvZcJFwXnxaqtC9wBWNPubvT1FmR6Zsm4k1kJ6fg7BGZxy0ThkF+ZBSggzSQt8GIYtem6xTAA/CjJ0GB2fjdgvy97bFRVqgUQCjhsvVH10ssDxQnoSRDVfjWU96wRg28BNQbIzwwIvo+xydNgK9xAvjTyjEo5ux6seJAumEWTjqmtnkoomM5FZw9aU78HkIJ1aebsPb8Rei3nJh8Wnv4TrUe9MXQFj8myThYWQ8r/jGqbSKY2mAxShUy1M4miKZcPZfQFwWrLPl9uHLZ0Q77GDKVA7gLLc7wouSmATE4EhdNYIMxeVZzrl9pkq+GpMC/XYDH4KEDS3zKDsLOmM4Q==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2016 19:01:50.0260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0705
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] run-postinsts: Print message before running deferred postinst scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2016 21:34:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/05/2016 04:51 PM, Burton, Ross wrote:
>
> On 5 December 2016 at 21:48, Haris Okanovic <haris.okanovic@ni.com
> <mailto:haris.okanovic@ni.com>> wrote:
>
>     Opkg can defer running postinst scripts to first boot, which can take
>     a while on some systems. The output of `opkg configure` (or whatever pm
>     is used) is redirected to a file when logging is enabled
>     (I.e. $POSTINST_LOGGING == 1), making the machine appear hung during
>     this process. This change simply prints a wait message on the console
>     to inform the user of this potentially long and silent operation so
>     that they do not mistakenly reboot their machine.
>
>
> This isn't opkg specific, all backends can do it.

I wrote a more generic commit message in V2.

>
>
>     Why not simply `tee` the output instead?
>     Tee might be provided by BusyBox in some distros, which may need to run
>     update-alternatives in the very postinst scripts being executed by this
>     process. It's therefore not safe to assume Tee (or any other packaged
>     util) is available until the configure process finishes.
>
>
> Are the alternatives not configured at rootfs time, so it should be fine
> to run tee?  (as if tee isn't safe, then neither is sed).

`tee` wasn't configured in Fido builds of NI Linux RT -- I.e. 
Busybox.postinst got deferred. I'm not sure if that's the OE default or 
the result of some distro-specific tweaks we made, but I decided not to 
rely on it for that reason. It's possible tee might work on some 
configurations.

I'm not sure why sed is significant. The only non-builtins in 
run-postinsts are update-rc.d, rm, and $pm.

>
> Ross

