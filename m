Return-Path: <Martin.Hundeboll@prevas.se>
X-Greylist: delayed 113975 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 May 2018 14:48:38 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0119.outbound.protection.outlook.com [104.47.0.119])
	by mail.openembedded.org (Postfix) with ESMTP id D444A7470D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 14:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CyJsciAZ/5Oyrg2tOE8bxJNnA7jChiYwJ3OcNt0qEKw=;
	b=rRMIrko33NARx7q9efHZrueWDFrjzNej/fCuSnS0K7ETzWeVhPueOngMBgfJCnvtTpqK5Jm9mJmHhqUoZl11/2kJTb8HH+2rDI6dugJAdImpR6O9EGSHMVOHdSwlLiyQU1GIyxXt0IXXrAqKbT/Px0rkhqwXMsT/UU0rXZA/zr4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.16.11.2] (81.216.59.226) by
	HE1PR1001MB1435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f2::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.776.11;
	Wed, 23 May 2018 08:13:45 +0000
To: Armin Kuster <akuster808@gmail.com>
References: <1527044864-31212-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <77266f0b-6eb1-416e-be18-29a94a2b5381@prevas.dk>
Date: Wed, 23 May 2018 10:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527044864-31212-1-git-send-email-akuster808@gmail.com>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: HE1PR0202CA0045.eurprd02.prod.outlook.com
	(2603:10a6:3:e4::31) To HE1PR1001MB1435.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:3:f2::13)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR1001MB1435; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR1001MB1435;
	3:eAAWtr+AKYEGX/YGe8o+0ZgGfoe2e3B9Y5cUAofoIqVBNuBbNCstWxOwdrQ//GPJ0FGgovG9fk3w18BnBwC0AOE1JdhGYu/NccWpVQE+VvbFPgIKmbQFfeBDbAIGit9SbMiX4VithwWyL3ySG8YThavdW2IEvp9jj8jiTf567gZuNHrqHMeOQAR9Wnr3NlTgRmvY5CPurenOEP1mt/Ss97eXfk7Ry19HyHR7CK/ogV3MnlKSa/yJhh1HHMYxzgLZ;
	25:B97gk+47QpG3GjbeUgxW/SQhQGk3breE0FOUwp034CL0aMlnJN2/mQuyED4lxMiFfXdzaPg9XwDBx3KRLRN5weFkUmTuI6zlRMBHTSiIeU34ERNaevWMTA2T4QZxG3IYxhTSYBwkuYqm1PfJhCL6qeKYGRcK0rbXmWNRMCnIZreNnNnBk2oelCPSebdmmRXSTL4WuHgY6145k83pZLFv4jMqOcrrq+teSF0YsfvgmhMS7svuOyu0ERRmwqKgnOhFwlNKLBOG37ex/UCIdy7K98RjOtjjkZxuFGxLvPE7rW/Xsg1FOriELzyQZICWjglHqFqy8foOQ8uPvIBSmH/D8Q==;
	31:iIEfIZ2Wg9SwTZBbu1AzG66clT37fpOecPOJDz+4sF9uJVTINJBJMx9TJlENC9paff9GNn8o8hlQDWCM37HJvIMRsrskr3jH6VeKFy2I+9JQSnTpXtXiUtXDxpEDOk9wZpQG2Fme6umCskMVC8oom0BkSOG1x3ZRFoEX2MNV7mEal2fkwpMbSx1cbN+DeevQRKFGAxJs4f650r0t+/YzrR1ZoWH0Caw/HVY9e5zkJfY=
X-MS-TrafficTypeDiagnostic: HE1PR1001MB1435:
X-Microsoft-Antispam-PRVS: <HE1PR1001MB1435B233C60F0CB271978ABF9D6B0@HE1PR1001MB1435.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(3002001)(3231254)(944501410)(52105095)(10201501046)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:HE1PR1001MB1435; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR1001MB1435; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR1001MB1435;
	4:XuIg9Jb+HdU+ikUFEBXeMl0B+jpnMat1UwGM9wOUwqjEuf5TxyMnc+D+eH4Pi5g0NoGFcL6eK8IxjXupQS33odc2z/R34q7hTVtSnIVEXYCX2mwklum/+kcwzBfBLgkP/flAGjuCzfuSM8en4l1IRZF/ESyH0JU/YUuwozQKaV22P811Q3ZBeAbaDmV/vFUxDefWZMakTyCjWw6YN2kiQqFV8c5sxGXve1rqGSTXRnsyUKD8367K8zOvvd80x8U1xCIOt/PZ35BVvEFhYNSuoXzBZaUnvE8mA+4qu5ZaOb+Z4FN3BM7iUw9+WkMuFicq
X-Forefront-PRVS: 06818431B9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(376002)(366004)(39380400002)(346002)(39850400004)(396003)(189003)(199004)(377424004)(11346002)(7736002)(67846002)(66066001)(97736004)(476003)(2870700001)(36756003)(1411001)(7110500001)(478600001)(956004)(6246003)(2420400007)(6666003)(52116002)(31686004)(6116002)(3846002)(6916009)(64126003)(6486002)(2616005)(23676004)(2486003)(31696002)(76176011)(52146003)(59450400001)(446003)(10710500007)(575784001)(25786009)(486006)(305945005)(16526019)(316002)(58126008)(966005)(42882007)(186003)(65826007)(386003)(53546011)(72206003)(65806001)(81166006)(4326008)(74482002)(5660300001)(81156014)(2906002)(8976002)(8936002)(16576012)(106356001)(68736007)(229853002)(77096007)(15650500001)(50466002)(47776003)(26005)(65956001)(39060400002)(105586002)(53936002)(8676002)(6306002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR1001MB1435; H:[172.16.11.2];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjEwMDFNQjE0MzU7MjM6YjRzdTJjQ3ZTVjN0QVA3aURicU0zb3gy?=
	=?utf-8?B?VlFSeTAwYmpjZnFjRXZEY09NaG9OT09mcU9ybXE0OXpEMVg1c3BkcjZFS3lP?=
	=?utf-8?B?YzZOd2hjQ0JkdEVUOG9mSExiQ3lQRVdIVXF6QjdCRjNvMSswd3YzMHhZNS9V?=
	=?utf-8?B?S2dTbTMzQlRtbmZiMFczc0p1RUlTL0g4WTloNjFGZytKaThQUjNxUEc2Q3Nx?=
	=?utf-8?B?N1FudXRlbUZKR2ZSeUUvYnUvQWV0RzVFK2N0ZS82d0xTTVBwZjlBY3ZhTHBs?=
	=?utf-8?B?N0hvamJsUklwUGNvZ0g5VUNjYzFkTkV5WnNFSHZWOGlOQ2Uvb0o0T3lkblF4?=
	=?utf-8?B?N2tWYzEzZnV0SDVmOXovRitLdC9RRnFVaHcwcFBIYWlGRmRKNk1OSEJ2b0hL?=
	=?utf-8?B?bG9GeUpkQ25oWnJlaE1uZUo2RmxHektES0ZKaDJkbDYzL0JkTmhSZnB4eThP?=
	=?utf-8?B?RTdnaGMrdVZ6MExEcTBlRkVsVVFQbXAwT1JEeXhxSmFMVCsxZ0lURlc4U0c4?=
	=?utf-8?B?cFVCVlZqbnlPU3I5dFA1RFJIWHFDcGVWckVwaWpkazcvdENSSGdCMFhhYTNj?=
	=?utf-8?B?b20rMmExbkJIaWpXeWt4VHUyVDdkdE55QUh2SzJSeFVHK21VcTZyaFVScllJ?=
	=?utf-8?B?SGlocG5lOCtjaEtVOHBXR3dxKzc5akFHYU9oWTB6RTVWRG9pSUJ3RWwzSnh4?=
	=?utf-8?B?dEZMRmZJUlM4NUV4NGRzNEJCREEwQkZRZTBjRUN1R21ybHBRY2FhakpUM0xO?=
	=?utf-8?B?ZVpxNE9EenFqWUhMeThJVzRVZ1hwRExTd1NyMGpENjJOMUl1Mm9IY0J4L0FZ?=
	=?utf-8?B?eGdJTm4ya1J2T1J5eFhYNzBnT3FoME01aXAzOUhrMDEyQkNoYVFEdHNTem5x?=
	=?utf-8?B?MzJSeTcvbHVzTENUQ1Z1R2tPM1FBanhSdmIxWkJPeGtuK2pVdzZFS2ZUMyt2?=
	=?utf-8?B?U2FJekhvakQzamdqNU5pVncvZTlaNStjdWo4d3p3SUtoSXhWR3c4eW5nZU1K?=
	=?utf-8?B?RWZDWjFWZThIN3dneU45NjhyTUFaNitDdndJdU5WQTJhN2YyMFBtZytTL0FY?=
	=?utf-8?B?dmRKelIzTTJsR25PNEFLRmlyZkRtbGJEY2wxbFNFMHUwbW5sM2UzL0dkWUdx?=
	=?utf-8?B?dmlodERkeW5uaHdpbkF3NFREcTh0TkEvZGxvcXZ1UHNEQUtvbzU2d2hVNmc5?=
	=?utf-8?B?OFNCY0ZJMlZpenU1QnhoTytnYXZJYytycko1ZnNrZ3B2MU5sOVdDZVZ4ODE0?=
	=?utf-8?B?R1hRdDBhRmZQSkxSL1dNWVdWaWN4RC83bXVQZWdaN1c2VzVicVBPWEVCMFhD?=
	=?utf-8?B?bmc1Wmx3Qkowd0VOTFpKd1JoSUFMbFo0M0ptSVdvakN3bXN0RmwrWmhkMjFk?=
	=?utf-8?B?eE5nd1ZEeXU1ci9aNlVGaGJuSEdzbk5rMCs5Rkp5WHBxaUU5TndyVXJKK0Uy?=
	=?utf-8?B?aHplY3Rwci8rZjcyeFUrejQvZ3pQcTlIeDRNaVBxRkh6UTV4RUNYTUhOQXRX?=
	=?utf-8?B?RnhNcEdLRDlhT0gxZVc5dE45SldxK3lRQkp5dWtPYWtIc1o3UVpiSkppK1lY?=
	=?utf-8?B?ZGdYM1RpRHpUbHJPOHRxQVpNaEF2M04yQ0dsOHl3clpDay9mWFphbWpUU2xO?=
	=?utf-8?B?SW4vNXlnOU1RRUpYK3gxd2lHcWdBdDJxbEMyOG1GRXQyUUZTdFNWcFZUdk5Z?=
	=?utf-8?B?U3J3ZXVzNlFOUkg0RUtVUVdONytCcW1VUy80SmFpQmNaNE1BTVFBTURxbElq?=
	=?utf-8?B?K0JTNFRYMjVqSVVEa3MrM210N1lZSFlMdVJHQVVUaGpkaGRrWkpMQ1lQRGE5?=
	=?utf-8?B?cVpkSU90akhTWEUxZ3MveUZLblJ6Y0tmaEtyYU5STmk4b1FGeFZBZk5VRWdP?=
	=?utf-8?B?VzRUaWNHQlk1ZEd3RU9tYmpiMWlwMFlkemJYSmFxWjl4U3pHY0NGTnlCR1lE?=
	=?utf-8?B?aExZaDlWMlB4QkI1MnUrNGptaDBmcklVa3A5UWduby9JTDZVTXBPM3JVWThB?=
	=?utf-8?B?M0hnZVhESWNERDNHNm1YR3hRalV3dVV4WTdTUlhDL0hoR25BSmZhUTJlVDc1?=
	=?utf-8?B?SHRSM3pXaW1FNmF1cWNRT0t4MldEY3lRbWNnWTVwaDJVWFlYK3h6NEN2SnZK?=
	=?utf-8?B?VFEwY3B6dThPZEd3Rk4zUldMRjh0b1E2RmthcGF6ekRxYW56eDk3RytzcExO?=
	=?utf-8?B?WUJPU2lMMzVJTWV1U2hIN09GSGdNS0l6eVhWNlhibmlFbVlsM0hKVDlmOFpG?=
	=?utf-8?B?Q0crVEVPYk5EYlZuRWM2TC93QldHYTBneGpRYU5UUURWV1RVM0lWTDV3NndB?=
	=?utf-8?B?NnJ1WFgxNTF2bHl3NFVHRllDM2R6L1M4VldsL3FqZTdWdHl4aHM3Nk9PR3p6?=
	=?utf-8?Q?zhXEUjtR4UVCTUzEVfmAVLuVRysxN39ifcCkI=3D?=
X-Microsoft-Antispam-Message-Info: DYWVcEEcW/RQ+V/CLROs81TCPKfNd44QSpTJSdgkqe5yo8+MjPm55JkGWJOuQg+hy+Pr5B76OxzLMU6BMC9E1OvHQO9Tb0qcWh/U80NpVp1EKVNJmVwQjwgH8FHXOvIQKiYQcIqHtbkH8MgTaPDm1gbKqObF9VmVEwqmjsHoeaQHwFJUlE+XwBW6IdaohY/p
X-Microsoft-Exchange-Diagnostics: 1; HE1PR1001MB1435;
	6:l/M5B0Mh1qNgVnClmRn++mFIc0v3JK2MMRgmkBa37/etcJyCvyKhgh+j4p+wAr0mWjn+VSoKw3zQ/hsS38th6pOFIY1jjSVNVWEbgQodbE/yXa3C3HCBiSrzK98g/DF1rJ63PVz4n5PJN4d2h+SjEBFKkR6YFCC/AMashlE2pMSGnB83WEsCnx82WidehzJOOT393XhRGbqkTa5dgrY+sohkYkF55ErAVwVO4Ts7oCvj7VNhiN3x7b0ic3bQqrsEBbvqiP/7SN/7FOiZBtKxf++0aGn/+PLKc8QPYHkPgWrkySQZSHRwe2Y29RqM7DHc6F7xo8CLk8W/vtxdLv5mSramCv6AVU7GDx7kCK3WXVWBlXv4IWjW15n9ziMlmbLEDTGFqK/FcZE9CsTlvc6PW6pJRmd93q7IWyK+x+fHuD/xvXmSE1QcLL5ywNjR282biQPnyQQVNFqjq60TkPlqGA==;
	5:1/tidDIAjdZZLoijVCLi9Fvza6+vrKUQSD50DueDrINXdoJsh0BR0wxA25mgPwnF8pvuqG/qRWyKzNbNc3IFl7y5fdKU89coda3qngr7Gxqp27eutfinnXyyzY3MdfL+KvWcPUR9OBD0qCvbN85GuzKdHpLvxF/THXd0O/mfCMc=;
	24:1FWcgGD7jlraTy9OukM8XNVJrXEyXgjfwB8uQquxTlUOIBv7MdU4CPRmDgftgFJeNX7qpK7VUvbyX/qWzLk1j0XjmjHzxabMOK6ZmKShiVY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR1001MB1435;
	7:KzrOBYsba2mJON8zEP98REGjbD5YMY+TIoPLiVJatLJy73Xhz/0gAacXq45IV9QyDysQPOtUeJVoULm0HR5sOj0H+zGQfymrO8MDASJmeZN8KKvD1i9Uqt2clSvzogRoIICbKsfWiKy8v6eU1CqRFUKtUJHuD2+Ki3MB8sVKlttt3AbS2k2OqVWE+XKGYhCCemythucNpYmu7W33050Rm0gDX/7Q9UzgZ7diJwOEaixlTtrT1FAceNWUeqbPDwEt
X-MS-Office365-Filtering-Correlation-Id: d8187486-c8c1-49fb-e95e-08d5c0851ac6
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 08:13:45.3657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8187486-c8c1-49fb-e95e-08d5c0851ac6
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR1001MB1435
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Wed, 23 May 2018 14:48:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Armin,

Thanks for picking this up.

On 2018-05-23 05:07, Armin Kuster wrote:
> [v2]
> Remove python3 in default PACKACKECONFIG
> include https://patchwork.openembedded.org/patch/148257/
> Break the hard runtime dependency on python3-core by adding a
> (default-on) packageconfig option for python.

Because of the newly added dependency on meta-python, the python(3) 
packageconfig is no longer "default-on".

> 
> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
> 
> LIC_FILES_CHKSUM changed do to updated year
> Requires python-ply package in core
> 
> removed:
> dont-test-on-host.patch, no longer impliemented
> drop use-python3-and-fix-install-lib-path.patch, they added the ability to pass in lib dir loctions
> drop bind-confgen-build-unix.o-once.patch, fix included in update
> 
> Refresh other patches:
> add python3 flag for PACKAGECONFIG to pull in python
> add new config option --with-eddsa=
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
>   ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
>   .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
>   .../bind/bind/bind-confgen-build-unix.o-once.patch | 48 ----------------------
>   ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
>   .../bind/bind/dont-test-on-host.patch              | 17 --------
>   .../use-python3-and-fix-install-lib-path.patch     | 36 ----------------
>   .../bind/{bind_9.10.6.bb => bind_9.12.1.bb}        | 31 ++++++++------
>   8 files changed, 39 insertions(+), 145 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>   rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.12.1.bb} (79%)
> 

<snip>

> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.12.1.bb
> similarity index 79%
> rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
> rename to meta/recipes-connectivity/bind/bind_9.12.1.bb
> index 20c8d7b..52480f4 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.12.1.bb
> @@ -3,42 +3,38 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
>   SECTION = "console/network"
>   
>   LICENSE = "ISC & BSD"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6ba7c9fe0c888a943c79c93e6de744fb"
>   
> -DEPENDS = "openssl libcap"
> +DEPENDS = "openssl libcap zlib"
>   
>   SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>              file://conf.patch \
>              file://make-etc-initd-bind-stop-work.patch \
> -           file://dont-test-on-host.patch \
>              file://generate-rndc-key.sh \
>              file://named.service \
>              file://bind9 \
>              file://init.d-add-support-for-read-only-rootfs.patch \
> -           file://bind-confgen-build-unix.o-once.patch \
>              file://0001-build-use-pkg-config-to-find-libxml2.patch \
>              file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
>              file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
>              file://0001-lib-dns-gen.c-fix-too-long-error.patch \
> -           file://use-python3-and-fix-install-lib-path.patch \
>              "
>   
> -SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
> -SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
> +SRC_URI[md5sum] = "ec20f2d6aff50651296fad962d19ccfa"
> +SRC_URI[sha256sum] = "16e446425c35e48b651ddf1171d2115ebf32b07670b652e1030a174038937510"
>   
>   UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>   UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>   
> -
>   ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
>   EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
>                    --disable-devpoll --enable-epoll --with-gost=no \
> -                 --with-gssapi=no --with-ecdsa=yes \
> +                 --with-gssapi=no --with-ecdsa=yes --with-eddsa=no\
>                    --sysconfdir=${sysconfdir}/bind \
>                    --with-openssl=${STAGING_DIR_HOST}${prefix} \
>                  "
>   
> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
> +inherit autotools update-rc.d systemd useradd pkgconfig
>   
>   export PYTHON_SITEPACKAGES_DIR
>   
> @@ -48,6 +44,13 @@ PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
>   PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>   PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>   PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
> +#
> +# If python3 is enabled you will need to inlcude the meta-python
> +# layer to include the dependancy package python-ply

We might as well fix the spelling of "dependancy" here :)

> +#
> +PACKAGECONFIG[python3] = "--with-python=${PYTHON}, --without-python, python3-native python3-ply-native, python3-core"
> +
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
>   
>   USERADD_PACKAGES = "${PN}"
>   USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
> @@ -60,7 +63,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
>   
>   PARALLEL_MAKE = ""
>   
> -RDEPENDS_${PN} = "python3-core"
>   RDEPENDS_${PN}-dev = ""
>   
>   PACKAGE_BEFORE_PN += "${PN}-utils"
> @@ -88,8 +90,13 @@ do_install_append() {
>   	install -d "${D}${sysconfdir}/init.d"
>   	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>   	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
> -	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
>   
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
> +	        sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
> +                ${D}${sbindir}/dnssec-coverage \
> +                ${D}${sbindir}/dnssec-checkds \
> +                ${D}${sbindir}/dnssec-keymgr
> +        fi

You have mixed tabs and spaces here. The surrounding lines use tabs, so 
do that too.

>   	# Install systemd related files
>   	install -d ${D}${sbindir}
>   	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
> 

With the requested changes fixed:

Acked-by: Martin Hundebøll <mnhu@prevas.dk>

