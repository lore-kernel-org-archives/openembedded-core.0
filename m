Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0137.outbound.protection.outlook.com [104.47.2.137])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABE974A02
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 13:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3yi3gSi05XuT6PsVPoc0m4zBlPi/Va3UE9+ewqylvY8=;
	b=LJh0NYM/9oDxg9IAzvYU6zweyZ9zIJIst8u6QfjzSen2gQis9l9ihoN8g2W86EyNYHZYVUA3p+qhAsFmK9NwqN8GUvm8oEKOckOm3Jelh8wV2iDbeDFhWZ4Qb/n1CvXLbuJ9S1Vzt5edq6uc4qCYv8Je5gRPRscmBLCsCS4+JNk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.16.11.2] (81.216.59.226) by
	VI1PR1001MB1438.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e6::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.776.11;
	Tue, 22 May 2018 06:36:28 +0000
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
References: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com>
Message-ID: <e3d6d697-0e24-dcc6-0adf-97b52bf0bc3d@prevas.dk>
Date: Tue, 22 May 2018 08:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: HE1PR0901CA0056.eurprd09.prod.outlook.com
	(2603:10a6:3:45::24) To VI1PR1001MB1438.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:800:e6::19)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR1001MB1438; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1438;
	3:9/EYRQz+60Q3h3fHFlPdIwCsmbJh0hkrAGGBs6whgfrqrA6jkmqyoP6YCQox/xdbb1vZd0CZGsQYUAfDAKP2TNRPmjKt2wX4ZoI2utCzfEaqjpEXktbXpiSwZwrBx6q/JfyM6zKx4i5pSoXmS7rvnef0e1IFpnMZKmbg4ZMKtzKTct58CkUj7fZ/uDXkTrvlR6f3BbOiSN7HTDFGfv7uv3HAj6WrivAwaI18IPJzeDgncygL6mJV334ETI8OFZYS;
	25:NuzzSCEe8AI3FO7nXEgAGgyysPpRJVttR4VzonLLA7ekxmdVBsudx7scjYtXqt+k9hvyWbvnKaZox+cwsntywi+8rqaCTj5RFwZtZeIK9hNLCPOOpARHMXPG9UZWSLCPjlag3UhZu8KVkPgAfQrYFE6ztdPTM4yV9omgM0nqpTZjKZBsY+iBUgXZ3Kq/ipa4dMJt2WJXPKeqe/HPkXCdZSJneLk/sUJNwHfsf5xhVzTR+ovZ/0JVc0m845VmX1jKWDUghWBpRT3Xx66d/SmENCzGCWWoYaFGJ7oNTtd3fQTmFPGG1Sj53KoKhTIdKLAdWP+edC1GFRoA7DkNTm+jMA==;
	31:krP+vt30BkIDOJH5hWl73A4JLh6unCK92ZJSN0HqlRcA6ppuDEcEVY9fJS1vJUcGmAozS98UI6B/QkfWC2VPdmSGIZDSqjeERy9qKa94AigW70RjMSfUwbcKljU1V2poadUeMmp75mBary4NhWurgZ/6hBAM/EX5g9jc9ofTC6FrLHGHvceOJW+UOhowNyRQzj7DeYmmUwVgPHevmMK3R2mQ4ygX0/0nEFK4kQztH/A=
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1438:
X-Microsoft-Antispam-PRVS: <VI1PR1001MB14381DE3534CD2E49A67AE169D940@VI1PR1001MB1438.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(264703809997249);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231254)(944501410)(52105095)(93006095)(149027)(150027)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR1001MB1438; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR1001MB1438; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1438;
	4:XdRqWUDAb0pui0kQkaLtsXgaha2ScKtV93XMwmV211TclLaYo34A1+mY1tONN0bVJhD/FPcIxxOETaj/ygjrnuVt5/zwwoNun3utKSE6Jyzea3YdTslkoFVZWBzQcQaouEt1OaItIMAuXN83TzMKNbhmq3PqGJrqCbghAKhe3S2ixUY/CpDvAv9pfp9YQ7SbWiHy6mDW1JJzccdKY20J1Ajo2oiEv41tzSZ93BvLd12xkkkz1m/59OR1EG0ZNgT2/vohwJytTSIZn60G5lN/J/LF7k/5IcKioq4erJBcAwkZWtOfAQXDhXFO0DVxtXoZA9az0tykQwchrTKaM4nF9aOV09u1PqvYY1E4K9CZyaA=
X-Forefront-PRVS: 0680FADD48
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(366004)(376002)(39850400004)(346002)(396003)(39380400002)(377424004)(189003)(199004)(36756003)(109986005)(72206003)(16526019)(2870700001)(15650500001)(50466002)(53936002)(106356001)(31686004)(31696002)(105586002)(446003)(16576012)(1720100001)(58126008)(386003)(53546011)(2420400007)(59450400001)(6246003)(186003)(4326008)(478600001)(1671002)(316002)(59246006)(229853002)(77096007)(26005)(42882007)(966005)(6486002)(64126003)(68736007)(76176011)(15974865002)(8676002)(81166006)(2486003)(81156014)(74482002)(52146003)(6666003)(8936002)(67846002)(7110500001)(6306002)(305945005)(11346002)(5660300001)(65826007)(52116002)(486006)(3846002)(8976002)(476003)(47776003)(66066001)(65806001)(65956001)(956004)(2906002)(2616005)(6116002)(25786009)(97736004)(23676004)(7736002)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR1001MB1438; H:[172.16.11.2];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjEwMDFNQjE0Mzg7MjM6RWNwWElxMTRncjZnNGl5T202eTlPenAy?=
	=?utf-8?B?alAxb0NqUzduTjBHbmtDWG5WMTBVaVo0aThVakZCY0JTYjFFKzliS1RRenpQ?=
	=?utf-8?B?Y0JnbkNJNVFDVEdZeGk0Sm5ucEREN3FzZDhueWdnNnZzdktWWk1RWEV1dW1R?=
	=?utf-8?B?UXRlMkhOSXZFVGFUMENpNnhSd2w5ckVrRDJTYnN6WEoybFVsMWRRdzJWbito?=
	=?utf-8?B?WVU5QzJseGVkR00xZm9BWjFCVStVZHMyd0k4RUQ2MERpQTlXSUZSdzBjTkZt?=
	=?utf-8?B?M1JyMmllOUx6S0tLZFoydlNVZU5XY3htUWRyWW91dDdzR3dqeUgyVHc1eU1a?=
	=?utf-8?B?MTdpcGxDYTVDMHBndVJCTGxtMHh4aFVQQVF1UHhmZ05CSVorcVFjckgvdE1v?=
	=?utf-8?B?aWxzeWlBNlFwVXhJVDhQVG5TWjRWK2d1aVNySWhQTFBPUFBmSWdpbjBKT2VB?=
	=?utf-8?B?eHV4VVFLUXNJRzZGRnF4VEFFUGNhNWRPQ3dlNEhkR3RPdFZGZERyQmRqcTZr?=
	=?utf-8?B?Z0lRcGZVTll6SGlDdDFTY2FxNXEyWFZpckJrZUpqUkNyRTkzaEwyd09ESndX?=
	=?utf-8?B?NVh5UU9iZnpVc0R1R2dIUS9uV1NCZG1EVkQxMGY5b2x6eS9QWDd6ODhSRFhh?=
	=?utf-8?B?Wmd3aklZVlhUeDJiY25VVS9QRDBwc054SlNrSlF1bmwvblJFS1hoM2hidnpB?=
	=?utf-8?B?VGxiQkF6S3ZUbnhySkc1S29xYWJQL1ROdngxWU1pcVN1MWI5ZUVCRysvbVRs?=
	=?utf-8?B?aVZja3hadU1QTFJBSW5XTnM1TTREc2VsUDZSY2lCK2NoL2s2UVArbS9waW9G?=
	=?utf-8?B?TUxuZDVDSjl2M1R4V2I2VDIwN0pYaW9KNE94d3hJd0JNb05pTjlQYWs1N0JM?=
	=?utf-8?B?YXEwUzZNazNaRVRvMFozbzRJVnA3cmlTc0JxS3FrdkZ3Sk1RQzVzQ3BPNmR3?=
	=?utf-8?B?cUdzWEhPL1RNQjREeU5uV0N0ZE96WXN0SHFCZE5abEkvK2Ftb2srOGRjM0NO?=
	=?utf-8?B?SGx1OTFzWlNvWUNKWmhRRnJrMEtLNHZ4eVdBVy9VZitQNEhjMGo5OFo2M01n?=
	=?utf-8?B?MWpQeW5CWGFXdjJxVlZudUJkSE5HeityOW9WTnZIMjZtVWJQTkQ0bFBQbzRn?=
	=?utf-8?B?dS9UM0tJNkp0WjRHdmhrTzFxZlZJRHFHWnNXQVptdlZXU2tHUU5jOVRsL2F4?=
	=?utf-8?B?a0RGd1ZHZkYxaXpNdWI2VWhidVduVXVMQVhuTy9WRTBuckxWK25PM2pEZW1S?=
	=?utf-8?B?VFUxUlY1MW81eHNldm1kWlo0dS81Y3hLRS9YWHBsbFN5OWZuOXJwK1NERGoy?=
	=?utf-8?B?QUQyV0pLSkZEakphT25SUVIrUVdRU0hTV3lZMFVrVDVHNVorcnVxT0R2bG1h?=
	=?utf-8?B?WmhqYUZPcjE5TDJOdHJSclhFSTlZV3Q0eUVqZEFnU1hNU1pDbS9NR3o0RmNW?=
	=?utf-8?B?U0tkZ1NvK1dRajNZNG1YbS9ac0Z6OUs4Kzhmd3BmdDVQbVYycUtvNWUrZTBN?=
	=?utf-8?B?Qm9YNEtDY2dtcjdvTFk5UXJvSUFxZGx2dzgvTkNVRHdOM0JzOGR4VXhWdEFk?=
	=?utf-8?B?a3JsZVVKc3puQm16dURZRytxTkRYSHNHazQ5MS9JdjZOQ0xZNWVCUHJmb3hp?=
	=?utf-8?B?VzhNYjJ6dHdBaWhlWVVwRlJtRzVYTWlabHdSd0l2VVUwR0I4eDArNDBaYUxp?=
	=?utf-8?B?S3pReWJ3QTl6ZGJqMDJQYnY4TkFONEt3UHVLUG1GZnFLZVNhZE5Qdk5ObVk4?=
	=?utf-8?B?L0phMktNQlJ3QktZWUZxRzRibEJXdUJxZlc1K1l1OEtyV2JLd09oRjhwcjJX?=
	=?utf-8?B?Tkgvc0c5YVZRdzBERFE1MFVDV0g4akZEY1RkdllQeDFYU3JTTEtsMVdXU2RU?=
	=?utf-8?B?WmJiWk1RbGJnWlNHUVA4UWpFMlU5cWRBcVBtVGxHRHNIMGZiTlJCS2NieVRy?=
	=?utf-8?B?N0hTOCtVd3IxK1hybi9Ra2kxbTFjNTNwWDFoQ2VlTzNKdVY0Q2g4cE1YTGZj?=
	=?utf-8?B?Qk5SNkl1NHowMi8ydVJxU2tVQTFWNWtsZXhaWHk0K3VWZHVpb2tyM0FNZzFJ?=
	=?utf-8?B?cGpPOXJMT1JVc0kzTEh5TEp1NS9UbFNhTzVQdEhiMnRGTTQ5aUlvbkoyOVpX?=
	=?utf-8?B?aS9XNU1JK09KSUppWWhTOW5vQUdReXJMRWd4UFkrTUo1K0c4OUlmQzI4MStr?=
	=?utf-8?B?Tk1JVTFSNHVGa3lyK2RWUnlLVk82WXl4NUdZZnBZd296ZkRyUHhpRUR1VXV0?=
	=?utf-8?B?L214Y2tRbzgvZWtmY3d6Qnl4eTlCaFpzcjZhNlFzUlpyaXZjUXpaL1oxdkdC?=
	=?utf-8?B?WXk0UnB3QUdDQVhYak02YkhaS2Q5Q2xJYkpJZnF3VU14YkMwZUlLMEk0MnpZ?=
	=?utf-8?B?LzJoaUtzeTRVQnBKUVZFQzhacENlTmJScnhVNkJHKzJHNEtXN1BuQUF2UFBN?=
	=?utf-8?Q?y2BHNyaRYXqWr?=
X-Microsoft-Antispam-Message-Info: blUWc2uVf2ODI7BCHwlaEOP1SQ10aAlbJ2vf4T3Qz4d2SJhQvPmxMQCJiA1CEqJsaFbu/LSGBEJito6yzYpY/bBUPgojCfGwiUkCvfSko8m4zYNTXUezgZv/DCB0eZUTRYFFvhHRdOKwP46RSjnJWHay81gdN3EEVksnBcraivyf4pncpN9O0eGSpJ8peEKL
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1438;
	6:zJNHzR+Xrv7IvYYcJIBfBgnKyJrum214jOELrFVElhU82yfL9hCposUjDUjsaokcG+LVzUJhtYXnGSeo2DwjSlsHjAVJpLyAuBZswEQNPGow39PhgdUoYKU+eQM6tWKgQi2PfRzuZEMZv4Jmoq3Nt92UW8I83tu0zJmAIkKndMjzCFwewXnKAoKpUNktMpx9UHbT6eJJPdQJo9JCqgHieIswmSfPLGHfC7C78Gc7m14TslSN0zaAbm/LnC8aT0IRXg5EIsUOvRuEhbtOhEIcC3CA3rDt2CjCM4CsSceofRYUYf2yBPOfV2OCy4RbbIkZPwOMYL2FFuBvhg5byuLnB+jH/z5H5yd11W4lW8+J6Hl3jWr6URu/Zh1AaYxhh97zK4bXGSDze3NzoyhYPY2xdQtaIpp6ozmefQJEeT2NDeqMwBQXOfnn3jdVtPtLRdEn8Mu+2Vo6EL1o3axO+G17zQ==;
	5:oDL1VvXoYSPaEuJt8IycPK4YSB0bCYXdDdPuuYyGlkljxaAayKx4yQ790Pl3hA7V0c9S40UU6f3jxWtdZeLdoWpFg6ZpRgb0anrNzFxHOZfEVQtt3ID9LzXXX3iTKJ7DM2aVhAxUvlfgWOHi7xJ8msxQHutn1F+N54Su39uO4t4=;
	24:8yNKjHvuvkvwgLInrwMnPREh3vKOSIClMC/y4anxPg1ziII5QKlDbKFfZqYmmsEk2ofqdmvp7GDN1Haxt8feXbxuyY3bByUnvlUM5sY+nes=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1438;
	7:AdbGrPkuFuTfnKOppaFLkLzP+g1EqdOPlyxzb7PToEbt0JVRgiMAvqTURfd1rcBbpjsSxIwx/N1nFiX6mk8qWdxnL57tqDjfPupjNi0QahCQjO+SVywBQQFIskDYhZAfuXCvEzTrk4l9k91fxJLpwLRNpDuSDXtEjbme40aFcaIDk7Qn98iHZJR2TzStsFYEKxLxuuOA9vyKAEh+c2xHIQEdpSu68uSxRhXQG2sspRy6wsqTDlNxb6F58xZKwZRP
X-MS-Office365-Filtering-Correlation-Id: eb30d38a-98ab-4122-9fb6-08d5bfae59a3
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2018 06:36:28.9715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb30d38a-98ab-4122-9fb6-08d5bfae59a3
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1438
Subject: Re: [PATCH 0/2] bind update req. new pkg in core
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
X-List-Received-Date: Tue, 22 May 2018 13:08:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2018-05-22 03:06, Khem Raj wrote:
> 
> On Mon, May 21, 2018 at 3:44 PM Armin Kuster <akuster808@gmail.com 
> <mailto:akuster808@gmail.com>> wrote:
> 
>     With this update, the python-ply package is required.
>     I copied the one from meta-python to core. Once this hits master,
>     I will send a patch to remove the same recipe from
>     meta-python.
> 
> 
> Can this be turned on/off using packageconfig ?
> If so then it would be ideal

I did send a patch for (some of) this some time ago:
https://patchwork.openembedded.org/patch/148257/

// Martin

> If not then please send the removal patches for meta-python regardless 
> so it can be tested together
> 
> 
> 
>     Armin Kuster (2):
>        bind: update to 9.12.1
>        python3-ply: add package needed by bind 9.12 update
> 
>       ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
>       ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
>       .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
>       .../bind/bind/bind-confgen-build-unix.o-once.patch | 48
>     ----------------------
>       ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
>       .../bind/bind/dont-test-on-host.patch              | 17 --------
>       .../use-python3-and-fix-install-lib-path.patch     | 36
>     ----------------
>       .../bind/{bind_9.10.6.bb <http://bind_9.10.6.bb> => bind_9.12.1.bb
>     <http://bind_9.12.1.bb>}        | 21 ++++------
>       meta/recipes-devtools/python/python-ply.inc        | 18 ++++++++
>       meta/recipes-devtools/python/python-ply_3.11.bb
>     <http://python-ply_3.11.bb>    |  2 +
>       10 files changed, 49 insertions(+), 145 deletions(-)
>       delete mode 100644
>     meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
>       delete mode 100644
>     meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>       delete mode 100644
>     meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>       rename meta/recipes-connectivity/bind/{bind_9.10.6.bb
>     <http://bind_9.10.6.bb> => bind_9.12.1.bb <http://bind_9.12.1.bb>} (86%)
>       create mode 100644 meta/recipes-devtools/python/python-ply.inc
>       create mode 100644 meta/recipes-devtools/python/python-ply_3.11.bb
>     <http://python-ply_3.11.bb>
> 
>     -- 
>     2.7.4
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 

-- 
MARTIN HUNDEBØLL, Prevas A/S
Software Developer

Hedeager 3, DK-8200 Aarhus N
Phone +45 87438070
Mobile +45 25562438
Martin.Hundeboll@prevas.dk
www.prevas.com

