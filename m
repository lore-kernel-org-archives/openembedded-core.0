Return-Path: <hannu.lounento@vaisala.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0060.outbound.protection.outlook.com [104.47.2.60])
	by mail.openembedded.org (Postfix) with ESMTP id E63EE6093B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RY1Ra7tjwwqVZvSmu1BX/L5T3BWix2hzCqW2BeYCLJQ=;
	b=Nhstbto5vaN4jimR1qiEp4WrYllBSQiApGx+REvSA5fX8uJzPy0BJlKI1Nr0gJt9BcaXjt1ST/tOjWMx3fhQ8eKVyo7Hm9rwOZc80Rq6LsGFTvcmhTIUUGA+8zBaywqit706hjYtuFyGo1UQobztsoV76z+upf9Ugft32lR9+8Y=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=hannu.lounento@vaisala.com; 
Received: from localhost.localdomain (193.143.230.131) by
	HE1PR0602MB3498.eurprd06.prod.outlook.com (2603:10a6:7:89::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Mon, 28 May 2018 08:55:11 +0000
To: Christopher Larson <kergoth@gmail.com>
References: <20180525123739.73219-1-niko.mauno@vaisala.com>
	<CABcZANnPjLCrjSksPCDkN0it1jwBS6_MtJjOkCT=NG=Wf-zR6A@mail.gmail.com>
From: Hannu Lounento <hannu.lounento@vaisala.com>
Message-ID: <0980e127-6744-378f-479a-e841f0a0d20e@vaisala.com>
Date: Mon, 28 May 2018 11:55:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CABcZANnPjLCrjSksPCDkN0it1jwBS6_MtJjOkCT=NG=Wf-zR6A@mail.gmail.com>
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM6PR06CA0016.eurprd06.prod.outlook.com
	(2603:10a6:20b:14::29) To HE1PR0602MB3498.eurprd06.prod.outlook.com
	(2603:10a6:7:89::29)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0602MB3498; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0602MB3498;
	3:rzVuMhNgHtZclwYjeUxzUIKyXVYK4Hd3jMsD2IjG2tkJnUDZ0ObXwPPu2NwvWO7EBsSSb037RZ8Tlfw8XLcYMGVQE8XrwNwcLN/A/xZDlx1nXCKv8tU8/q47aMT0r+c1Jv8D8+jKM16O16WHOFBsB91/DOX0hVyCVp06WaKyZlJ0raG0afk+UZcg4o9MLNkDn4ea/WDFPB9sNtrEU/JLKREIgz9MdwL3i7ZWlq/DY9lOuNSrbbr6B30mz+kij2hZ;
	25:lvNmsGbOuO25wdF8QSdysA9MkyAcETwRdTa31cda52A0IFZQLAPnaMhko7+RN9FJRZtaS8WNTU5EKEwjyxO8cIsk+1/UetOQGqYPJSr+hlFBGWj8dOJ2lQufLj5/PuIjhayapVZzui5gONFo2bLIc15+MM4J5CK4g5f2tQ3R5wkSZmtex/lrEG5h6o+9GALVhfZARGL2U2BmFnfkDNVtakZj/rP55JdRrE/ZD1qBwW9zCXam/U3PNKOYUsenH8LH0WgY7AlJhQvmjkRO2TwKdaz9Z347Vio1Rqb0czADhS4tPGQARF10c8IVKbo2lHxFEnzrG2vI0paDDcvl9mxMsw==;
	31:M39IUPsWaY4xqlHoS8F+qzByooRA+VVm6xtZEJJhS7JAgcMA8cNBTudranS4270itok8resp4CpSX9FhNS3/KOpOJm7xEdZgPvF31XhFmR1C6UUi5V7JysQ9Xun1qZIKfGnzHmg7rUEWfCXKJZ+waXti0mXSuIIxuxZQt/O9KmFUSpFtZ80o5Yu2SKkZRzs0fbpLX23BExgirLIjzrlKkWzkJj7ek9sZBT3OJ3MBQYQ=
X-MS-TrafficTypeDiagnostic: HE1PR0602MB3498:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0602MB3498;
	20:b/xq0f4YtHFtyOIgDlSki0AfOsK/aiyOXbjaP3C/XgRP73EQQjYfKLtK51f166PSRajzN0/JdblukAKt0B5zfFS6hXSm/1zo3R4J/3glECpGCKN/VRY+5PpCB9P2mtHZYhxxshFpUji0+IGndvQ+SeVaayWvj+MFSZUnon8Riqc=;
	4:jz6vNcd9QIXoSCzOwMz7jLV9xr4zMhk9L8d9Fo5mVxawuS64kkbAZyF87etN+BsSZ7E8qgMUNIhaWT0XR5fuDk7rfO/WK3PqjV2rxLiBkcHitr+4AJTVj/Sm9CyJy0Auk0do1ueDvr9L9nL9U0HyIQTNTMq/kIFfFAg3JtH9w4Bvj8X9j34pwBFXLGba2WaRKhMuA8ur6HsT/2MBBPXjLopRJc237tk5hFwjlPV61iE/tywslht9jrmjjJoFVSB8/HNnPxtaBOl+aDrE3IoEHFD1vzTddJCJJH29IeLC8tI9cXWmzueOP1CHFcRSKPyJzcD155eIPfR9GyKEYvtUGCZmhzkaiQPo6eo2dxjrYbG9q81gfh/ys2qHBesS4UUK1CD0snATWH8VJ9Gg2SriEe0hyKDzzWW9v1HyoHJK3vk=
X-Microsoft-Antispam-PRVS: <HE1PR0602MB3498BB49E2D1CC1927FCEEFB8E6E0@HE1PR0602MB3498.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(111885846020525)(264703809997249)(5213294742642);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231254)(944501410)(52105095)(3002001)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:HE1PR0602MB3498; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0602MB3498; 
X-Forefront-PRVS: 06860EDC7B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6069001)(39850400004)(396003)(376002)(346002)(366004)(39380400002)(189003)(199004)(305945005)(966005)(6666003)(956004)(6916009)(39060400002)(58126008)(476003)(44832011)(68736007)(316002)(6306002)(486006)(6512007)(7736002)(97736004)(6246003)(5660300001)(53936002)(386003)(65826007)(53546011)(81166006)(6486002)(1720100001)(186003)(31686004)(26005)(8936002)(6506007)(16526019)(4326008)(106356001)(105586002)(36756003)(81156014)(8676002)(229853002)(3846002)(86362001)(6116002)(2870700001)(25786009)(23676004)(52116002)(2486003)(52146003)(64126003)(76176011)(2906002)(31696002)(50466002)(1411001)(65806001)(66066001)(59450400001)(67846002)(47776003)(446003)(11346002)(2616005)(65956001)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0602MB3498;
	H:localhost.localdomain; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjA2MDJNQjM0OTg7MjM6aWIzZEt0Y25uNCtwMVBNV3h5MDBGcjRX?=
	=?utf-8?B?WGZkcXMxWHF6T0N4eGQ2MmFyZE9xTVRJeVZIb1d3SWlIazhRbVp4R0RoY1hr?=
	=?utf-8?B?RXBXN0c0MWJNd3BjaThXRjdUZ2F3dWJYc2tWUWdKdnQ0NFVvZkFzeDRjZW44?=
	=?utf-8?B?T0N3YnJUNW1saWNZWlNpTlRvc09WN1N3ZjdUeVZWSFBGUjc2UktyWUZ4NEhu?=
	=?utf-8?B?a2syL1R5dWdvRnpEcUkrbmhKL2Q4QTRmcTUzOHZWMzVXdDlNOUUrdFJnT0hP?=
	=?utf-8?B?VU0wVlpxcnAwS01tZk5TSjJCOC9jek1FT0JKZjdXUkxWZm4rOWFNWDg1RU9M?=
	=?utf-8?B?YU04QzA1NVkrSk0vN3M1aHNKT3NHZ1oyNlZUNE9LZU9GYlZCOGJTNG5WOGdB?=
	=?utf-8?B?djBiQmJ5SWJCVjkvTlRkeUFPWHhhVmR4bDlJOEZsd2k3YjRHdWV6cEI3Z0ly?=
	=?utf-8?B?TjlZdDI0WE1iUmRUM3Q0cHhhNFdPdWJSQW9OS2RCUFZqdWtlSERyQmtOdUlE?=
	=?utf-8?B?enpYdzlMam5oZTdZQUZBb0VpcWgzWkpLdWNFUzYyOWlDdUlIV3cwajNRWmhp?=
	=?utf-8?B?NzhGY1FCS1dMVVQ2bWxXOFZSNGlBL3FNd2F2d1QrRWdmQVYwMkRxKzR3Wm10?=
	=?utf-8?B?TnVMTGh6eFZMK3I4ckRQWjRqSXhDNUFlK3FpQ3JqaHR2Mk9aZEJLNjFQWGNq?=
	=?utf-8?B?MW5hclhtUk5mVXBSN1hlY0d2ZVhLRzFXSUw0VkZpblh2VXp6RmpRRllqNkZt?=
	=?utf-8?B?K3owSEZjcWcvQSs2QjdBWWJUVWhNVW4vbFhxNXpXVTJJVHZpa3loNUoxLzdz?=
	=?utf-8?B?aE80WVlpOSszd2xlUXdOOHNNRUx0NzVuNm1vQmt4RkRjVkhBKy9XeVVvUWR3?=
	=?utf-8?B?TThkaWMzNXNGbnJHQ3pmQWovZG9DMnpTTVZCdFBSM1BMTUJQbUR6bDdPeEVi?=
	=?utf-8?B?Rm1GdFJjdzMrbEF4UXpQQXpQbXdKelVDaTZwcGQ3aWhFWVg5Z0RZUFV3aGg5?=
	=?utf-8?B?MHpHNDBZMnhFNUhaL0VPV2J6NEI5RjUvWWh5Nk1KaXBOY2pXREdKRDlhTG9H?=
	=?utf-8?B?L0I5ZGN0ZHQ1Y2paYUR1bGp6VUlOcVZFRmdHNzA5OFlhNDh1Vm9jd3lPOSsx?=
	=?utf-8?B?RWwwdE82TFJmMUh2dEsxRm5QdkpRVWMwVnZ4c280emdYZ1lBcG03a2VQQW1n?=
	=?utf-8?B?N2g4alJGZlVraTFmWVNSY2gwR3BMVFBjNjgxdGhHK0lQcjl5NUZwbkN6Vkhw?=
	=?utf-8?B?M09STU1TbnovTFlIUE1YUFNWZWdxODJHdytXc1VRcUpDL3VVaW1SQzZtVU41?=
	=?utf-8?B?NUxwK0h2RnpSOVorb254ZTJzUTdWVU5FeVZoSm9GVTFoZHZ4VEs0TUxVdjBZ?=
	=?utf-8?B?cGNzUDZ6KzVFNndTVFVmeFZGc1VzVEpPZkF1M3J2U1MzcE0wOTUvRWt5M1hB?=
	=?utf-8?B?NTgvdjRybHVVaUtwdDh5cEd1NDFEa1RXKzFrZHdrd2VMUHpqYmZtcHh3VjEz?=
	=?utf-8?B?NG9QNzJqYlA1cWx0ZE0xMmJUVzIvcHRnSTRnQ0JoNGhPVWxZRnNmQTBVcFRB?=
	=?utf-8?B?REI2SWluSExKZ1dlajIzUCtrdWM4WXRVTEtVdSs0MDJKZHJBczhNVlA0MUUr?=
	=?utf-8?B?eUo1aTMzd1JuYklyL0F2RnZKV21ncjBBbms5aytyS09WY0Rub1dsaG1rU1VT?=
	=?utf-8?B?ZkVFTGFZeDA3NGtGYklVZGUwcVA3K09PVHlvS200Ylgvb0E0dGZyNTg3WDBs?=
	=?utf-8?B?SVpnMmVKM2tBbStkbTNRYzdhQjJ4bm9DODVvSk9IMWNQeXRNVUpOcUpPYWdt?=
	=?utf-8?B?TTdMWDJBdDRhUGp3VTJtQ21UU2tzN3VTN2VReGxmanZKWUJQNnQrNXVGc3Nu?=
	=?utf-8?B?NnkzUmVQOUY3RGlIWko5V2ZMQ2ZIZGlIVVJEL1EwTGo4SWd1VUVsQzQ5Tzd6?=
	=?utf-8?B?TnNmZVVzVDJQeWVhY2ZYeFlYdFBXb0d0c1RGSWplU1RuN1dGN2hZUHp2dHpv?=
	=?utf-8?B?QmRrUm4rUERnR1kyVXMrcnhrb0VVUXlJUFgvOVFucUw3TzY3SUtPeVlXT2gy?=
	=?utf-8?B?WlZOMEt1c0htWktHU1RGSzFqc3NWd2cvUm1hRnpGYkJuNGZvM2ZPZXBtTFpD?=
	=?utf-8?Q?17OAWI/6lG4w21/VuQWa/cZSFeLiXXdDqowQHaIvBaiT2C?=
X-Microsoft-Antispam-Message-Info: lzhePcGzpZYoLmupgfVQsjnv59vcYtejVhXtA+w/7XvQXMjHuPWyK6RIIW72t2UBE9lSeCHAKCpqq7nrLO+n+XjIFwEgMlrmteGhW6xGH3UgtXfTKgkNHwwAfzkmNBhCcB0UXBHA4rKOAAwrWmYc1d/BzDIOhfMt+HQELmOo9wQ6iEwyd1qNMveKXEh7Jgx5
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0602MB3498;
	6:XZ6TgMBA/sGnRWEC6kaxgtIKdUtA4vzZhwChk1D565ku2cJxESstT4YgBiA2zBDIQxUa1XUJzOUQY0BeCHv2AxYjTyo0cXO/PHinCSQUreBf9qqtZDO2Ek81DCUpykD3zMWdiDJsuW3wdpuU3txUS0pLQP0wXAJt/AoPtyY+EB+tLwqtq8J7YxwGaujQ9ptOD8B4dHZrTHB5SoJmxTIJmCXrjWknd4ASQYRyWWJuhL3mqyJVZdUYw+qDIwMA468/pReFZXxwCWxTV9k7IU3ZGUXR87RfmjvkUAqbCZFtj5kRbpALyg9NB+WLv+hAqB1l84BHw3oH6Oa6QKaJaESsRaBewQDuFZoFgvqhR7QNlop5Kgn0oqGqqzVgo9kDhVaVtbhTqFAluRgQGlL+KtHMBm1A745jc3RRhpK5NiWhko+nVnLzL97xIoRb99A/Xh4vbH5cYC4fY710RewWDKQa6w==;
	5:io2ONr6dLAf+b1Abgpf2W967TkEko1hC0xH0di1o7TVERxbm00j+KL4l0voHnJMqsDUsoR6NIJFmCyfUBfRaz8avWa/8RolpC+FoRiG16B3jzNmD2MB3gYAtfYXL4HdYJp1wmh9ugXJgBC1sMVkcHgIt1fM0fTQlzwtLdN1YYjI=;
	24:/GeNdmS7KpAHzDwPkbWDweGYaNBvzKzllI9gqgnkTPs/SJ24UGDA0Vs5LEREfx6xHtUuR5xP/2WrKKyKXgVGl+YAs5yXS/dWdOgNedbRxmc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0602MB3498;
	7:w788WnOt18rzv8Nx4Gt8zlWtwbb9Qjm5tMDsO+YGWPK5CY2vxtuyCuDIt+18xRb4HbekAa1o9yBdp7YLzUAkcRDRaZeERiEIT4z3UzxLhMLJzC+kFZrMZ3Aiyi8FIeg7BKUl2Hd65vN9NdKOIz2gq30XX5Uq1wY9hkWripVGP5X+UtrDhwIooNgYpb6AjxS6y2pZVcZD9dyXJS5afWyvrMUC0J+1woaYzzWpMjpczAEQvcSmtit5e17fTKEelE2w
X-MS-Office365-Filtering-Correlation-Id: 282357f8-1c30-4a29-25b0-08d5c478b8e8
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2018 08:55:11.6697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 282357f8-1c30-4a29-25b0-08d5c478b8e8
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3498
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Export SSH_AUTH_SOCK for cmake at configure
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
X-List-Received-Date: Mon, 28 May 2018 11:26:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25/05/18 18:34, Christopher Larson wrote:
> We should probably investigate if it's possible to shift those into 
> do_fetch eventually. Contacting upstream during do_configure is not kosher.

The reason for fetching during configure is that the CMake build system 
in the git repository in question (later referred to as the "parent 
project") uses the ExternalProject keyword [1], which "creates a custom 
target to drive download, update/patch, configure, build, install and 
test steps of an external project" [1].

The external project that the aforementioned CMake build system uses is 
gtest (later referred to as the "child project"), which is many times 
built as part of a parent project. Usually git submodule is used to 
clone child projects, which works nicely with Bitbake with the gitsm 
fetcher. In this particular case the parent project uses the 
ExternalProject keyword instead, which is one of the options suggested 
in gtest's documentation [2]. While the parent project is not a public 
open source project, it is not in our direct control either and hence we 
cannot just change it to use git submodule instead.

Another option _might_ be to run CMake in two phases: the first pass 
would just run the ExternalProject keyword and the second the real 
configure step. We are not aware of a way to run CMake in multiple 
phases though. Also cmake.bbclass (currently) doesn't have anything 
related to the do_fetch step. Thirdly, I assume that running the 
ExternalProject keyword as the first pass during do_fetch would also 
configure and build the child project, which would then again conflict 
with Bitbake's later build steps such as do_configure and do_compile.

I think it would be a valid use case to support fetching by the 
ExternalProject keyword even during do_configure because a recipe 
maintainer does not necessarily have direct control over the upstream 
project.

If it is possible to resolve the issue e.g. by changing cmake.bbclass to 
call CMake differently or other means, any guidance is appreciated.

[1] https://cmake.org/cmake/help/latest/module/ExternalProject.html
[2] 
https://github.com/google/googletest/blob/master/googletest/README.md#incorporating-into-an-existing-cmake-project


Thanks,
-- 
Hannu Lounento
hannu.lounento@vaisala.com

> 
> On Fri, May 25, 2018 at 5:52 AM Niko Mauno <niko.mauno@vaisala.com 
> <mailto:niko.mauno@vaisala.com>> wrote:
> 
>     Update cmake_do_configure() to export a set SSH_AUTH_SOCK variable
>     before calling cmake.
> 
>     Otherwise, if cmake call during cmake_do_configure() resorts to
>     ExternalProject directive containing a GIT_REPOSITORY entry, and git
>     authentication scheme is based on SSH agent forwarding, it fails
>     followingly
> 
>        | Cloning into 'foo'...
>        | Permission denied (publickey).
>        | fatal: Could not read from remote repository.
>        |
>        | Please make sure you have the correct access rights
>        | and the repository exists.
>        |
>        | ...
>        |
>        | CMake Error at .../tmp/foo-gitclone.cmake:66 (message):
>        |   Failed to clone repository: 'ssh://...
> 
>     Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
>     <mailto:niko.mauno@vaisala.com>>
>     ---
>       meta/classes/cmake.bbclass | 5 +++++
>       1 file changed, 5 insertions(+)
> 
>     diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>     index fcfd5dda4f..82d36be8ff 100644
>     --- a/meta/classes/cmake.bbclass
>     +++ b/meta/classes/cmake.bbclass
>     @@ -137,6 +137,11 @@ cmake_do_configure() {
>                      oecmake_sitefile=
>              fi
> 
>     +       # Allow cmake to perform eg. git clone in context where
>     authentication relies on SSH agent forwarding
>     +       if [ "${SSH_AUTH_SOCK}" ] ; then
>     +               export SSH_AUTH_SOCK=${SSH_AUTH_SOCK}
>     +       fi
>     +
>              cmake \
>                ${OECMAKE_GENERATOR_ARGS} \
>                $oecmake_sitefile \
>     -- 
>     2.11.0
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
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
> 
> 

