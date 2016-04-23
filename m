Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 874 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 23 Apr 2016 20:59:36 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0113.outbound.protection.outlook.com [207.46.100.113])
	by mail.openembedded.org (Postfix) with ESMTP id 87CD16FEE0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Apr 2016 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zlwUGvgzCRepL0Z9Y9OtdVqCsk1WN+RGq553pE++C+U=;
	b=efbq9JARGZyQQfhWrHXw0p0rI2UW50yG11IM5LdI7VUSqwzjEDS7k0cLC69mf4kEWYMzlf9rz1drD9+Sh+3/PB/4BVNG5nANgfj50YpxNzTrSIQayjSqsU3QJlAD2KnlqCbVo3ZZXAFv/Kk9jd60gJpsS2wqat7LEM4m4rDxhG4=
Authentication-Results: toradex.com; dkim=none (message not signed)
	header.d=none;toradex.com; dmarc=none action=none header.from=ni.com;
Received: from [192.168.1.76] (23.119.29.149) by
	BLUPR04MB838.namprd04.prod.outlook.com (10.255.188.150) with Microsoft
	SMTP Server (TLS) id 15.1.466.19; Sat, 23 Apr 2016 20:45:02 +0000
To: Stefan Agner <stefan@agner.ch>, <openembedded-core@lists.openembedded.org>
References: <1461269276-23269-1-git-send-email-stefan@agner.ch>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <571BDEB6.3010906@ni.com>
Date: Sat, 23 Apr 2016 15:44:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1461269276-23269-1-git-send-email-stefan@agner.ch>
X-Originating-IP: [23.119.29.149]
X-ClientProxiedBy: SN1PR17CA0022.namprd17.prod.outlook.com (10.169.33.160) To
	BLUPR04MB838.namprd04.prod.outlook.com (10.255.188.150)
X-MS-Office365-Filtering-Correlation-Id: 3f7766fe-6ffc-42c8-fba7-08d36bb824c0
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB838;
	2:n+zJI2bV2wuM7fPyvmev+zePNV9Sudj+lYE90zc1EXtZyHxGddT7B7kr3+1EDyLXq0m+c6xZ2aAa4YxGH46cIKvCsArkALO4nZGaEBvCUa2zLswaBNmLmjdTmM5WldinMwcng00tC+VUmMIkEP59SAaZdZJGZR0wCxDOrTxuAAlqZ+s7zPbTDfak3tPZJjta;
	3:UkxJXVjsaDwOB5OLzkjyeSLXDxP2ARoOnUb9Ge7qnwOyWmzKgdVuppyMVxUfyRwpsr8CAROauhjdy0FTtzao50CP3tIXave2ptA9b+I2BqFvWjbTB9hNoFrYvYSXmEpV
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR04MB838;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB838;
	25:MRlWx/4cABvZCTy5iJG7aBKQfJPHNvKtLQDZIuPY1yWglP/sS1eIXKFzapir5LE2S2Fqa+Z5zht7NAIHJ8tPmqhC5TzpER3RyjRh3DYVZ+uDCCFQdb/XS2nT+FwTTHBLeqgu/aVm0O42qHokpMORJxhUOzLsXFGjoAugGVgOVAJInKXCNU3RTFcEyi4ayGWkDcyb+vAJDMOQAJX3kRW1+q54IRYcfbGzQbLgzYuRwhN42+SRTe8MBz8tKeGn8JVwPKCJw3pQ79aSzUzYihupOseHKS50RUGZel58qt1PLAPyDYSl3Kr8CqoOpHWxbFE95qz0DylGIt4/EcJb2zkT0PPJt3/IxmZ0dmCIxTlaYzcCPAfo/BryvQZBlCi5lywDgl8JPZEN0+++Ni8oYQiuMUdIirWz0uxDPxU/92Zi7agOvllRQroD68isiYST4+KpnyPL0v79mmd445LhqPJHaYf+vR2OsA8nyoH7lMmEORJ8qlgsPUU/oZjOJNyZzhQs17QuwMdgaCk7EwzSWojNrltzIGueNY9hZpdzSeuAdbRQ33mu9fqrXaFCA8Mo8XOpkozD/UsQJGk38sFqa+nGiIxVsiIBlsS7S5vfW2PlletAwCgRqAImlfOPN7rLKUkqgDvW45meJgjePtJKjYsNEw==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB838;
	20:gbrs3hkkOMB8XXHrqCUZOdyHyaj4jmlVZk/PnIU2BF1P3f15aWIjO5xMwFD7t7Hen/CfIkiwntRENvn40mynOaDoqPc0rakYnaSw85Tsw3M7VEQAJmJq9t9yTMKnEP1Ve43iddMVcE9tg0unGraJzd1x4hr4dE4ZHMpm32jLZHb/jQW5sDk9oUcbfQkBADBlkU/zFTey0E5ke07HeMJrgDJwgkk/0X7A46c5lHyq+9XtdV7CX9FtUvvMkKbO8XQrNIJiElFhhX7J+TlLp23aiLIBrb4SUYbs1dxDgEFQBkNNmibJ+F2Bbku1Iy/pICOJJy7bqkH6u/6tlMV/AdgIaJFDjAXNHcV8I07aE6Ff5tVMl2XtboJscOtyjFXR6sfLpaTr8OhY8VlTW/K6/WbWV66adIxzgVSvwMoSQYPYmdUAtsKkVwmPXU5oi7bQQ6sMjtOg2+xrU9sOqeb1ERnH/5QOIVYWZg+/fHC0k+Fy+Q3TaqRUitNT2OJJrTlAwCrVz6ny9cTWLOqecqQtWvqUNZIC4L2KZqshpFMHcugmn2ohLoKwhENBfCHrtMh3gF5cXCrHuLuGrpWWP/pqICroeWzCImKs+ITrsNkafMvIewI=
X-Microsoft-Antispam-PRVS: <BLUPR04MB838BF50333AE014B9C802D886600@BLUPR04MB838.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(9101521026)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR04MB838; BCL:0; PCL:0; RULEID:; SRVR:BLUPR04MB838; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB838;
	4:pnxTGSNOCf+GVjUeL9UC/zR4XvC5bsLM5tC7IO81pPlzXAEd6DcrUdesyJirLeXEewk3E5taF0P7SE22X/P0xrnzwlViMpk9yVCGGhmdF2aaanUwq9mELysMSCHase1wzzzVQ+SY9iLCfv4hSJ6+8MWQL/rGlmj/GXO86wgAA/d91rH9Vce8O/sburOfzMkuMZWkp4ajA4JGpAx61r4wP6zQ57a0DhOVn2azq3UXFX+COtpKhrFl+GRg37/Rvzyx3iyGKejvw/RFjW3LRXKEEeMqxapd4pORoy4row8vqy0tFCaTT+S4QvTvkXExGfEDaB2AokFCFUoLFpWk42v7W1H13kXyl37uo1FHl9hXOD/1g+8NBgj1w49B607ZLfF8j2cA+zr044gVbkeATr/etA==
X-Forefront-PRVS: 0921D55E4F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(377454003)(24454002)(81166005)(586003)(5001770100001)(64126003)(117156001)(4001350100001)(3846002)(6116002)(83506001)(33656002)(5004730100002)(2950100001)(42186005)(77096005)(59896002)(87266999)(65816999)(76176999)(50986999)(54356999)(50466002)(4326007)(230700001)(1096002)(86362001)(189998001)(65956001)(19580405001)(66066001)(36756003)(23746002)(47776003)(19580395003)(92566002)(2906002)(65806001)(5008740100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR04MB838; H:[192.168.1.76];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BLUPR04MB838;
	23:O0KEl2QtoNPZGCUYYVSsn+K0ONV+sxvAVzDCO2?=
	=?Windows-1252?Q?A4UPR6oKP5YrS+NOrsPj6o2Uf8DB9rsvX0/GZrqbhfRwaAe8l027aOwq?=
	=?Windows-1252?Q?7jGTgry6u6GQVyPiox8Dlg4CRxSfpjLXGmkkC6AAhmN+Zyf3NhqRwmfs?=
	=?Windows-1252?Q?jKe5duhue4SA1FOPr63ryXeWTNTWC7CAQ52N5VBAzPTdR8dD/OXpSthv?=
	=?Windows-1252?Q?na1+qqFFpeaqy90dkzcTWTtm346OBqnaz/kn33m1U0yXmsnE4evBKJFL?=
	=?Windows-1252?Q?mm/tYThTE2K1TGFSz/VgXLEGJjY526+RBKFQCFBmz63mRJQC/munrDfK?=
	=?Windows-1252?Q?ut1yeSGbSvj3JjKHmd9A13qvPU4dJ8weqT1uXiAc8JA20IHAG/AEcJ6k?=
	=?Windows-1252?Q?CN+/v3vBI31SgYjBbzhwTpuev7ne5FZp3F52Cu4mqO5xtDreQaOcXAgR?=
	=?Windows-1252?Q?pD5ajOXjZuiTgvxvMNaVwKK+7SNxaGaqCnIjFZWGWo08OGIoJ8wIEqE7?=
	=?Windows-1252?Q?P012LOi19JmzKPk/fOXDh45MksOIqAK8NqzjOTYiUweQXP8RxjY4qRzb?=
	=?Windows-1252?Q?jYsqXUwmAFkAZpt1RnFIRTwgtDGQ2TAT+3UmgoN8PfUCKX+pZ7gH5G/l?=
	=?Windows-1252?Q?SVxw6+jFagzd4M+3/3VuOA3uBGFB5c1xYhyUfAUFluTAD0sm6jJp6FjX?=
	=?Windows-1252?Q?+LBSgLx1wuA6n3FBjuPtNuluS3Eypua6iXpu3xPmXp9oZqTxEmDO9mfh?=
	=?Windows-1252?Q?UgExC/+Lj5tZRSWSxZk+PhHnRzlRk2tDmAsIVYZnArkRry1BJK7ynkQ+?=
	=?Windows-1252?Q?qW205zNwdB1Y0Osnx3ZEwnv1qz9pKQhpoqzAie7/okF/PuqkMqb6ifVZ?=
	=?Windows-1252?Q?Xz9vzns1oh0q+5U2kSwWmhNJJ40We5hhwza9CPAVOoPNhiorIJvnuaaZ?=
	=?Windows-1252?Q?FUpx6J+Qn5VOQd5jZLgYvZi7AWsA8FVcvhNgZvXKlh6Lt/nvR+enkQSa?=
	=?Windows-1252?Q?+uoTe3bEWwN4NnZSrmn6qpL8/YgUGAGm69sdzMIzZ7Idv3DDeAASPaZV?=
	=?Windows-1252?Q?GkC0tSljZplRnV+hi60EWgUn6zuqVjKkkaMMijC2osusxft59Ssq8wZj?=
	=?Windows-1252?Q?i6YELDW/+k5Lu12NDdLGHCb4zdMLvaFlwGTBnFZdcN1YYhmN888S+V98?=
	=?Windows-1252?Q?BZdojXMQFdqyFTFY2q9f1ATS3H2yo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB838;
	5:kbtnc2X2EhFaQMlw6c18eNP3osrclQaBV3QbEQUgJqWO3mPfNapM9y6LFJQ737CXN1RWbKGNb/H+WbPbM1L1Y2myr4Fzwa+rpFgjM7whDmwolHEjCx+eaQfFBxdZzwJqsEXYLwdHL/HMARV7x2OS7XqZjrb7simFE1dRrgQwkqySivTTcrDFMpg3VPOvybu3;
	24:rgvkxuxM8/mZRPr+IIPl5Jt3CWgoW9lTet5DuAJCDFR7HFYiGFvBtXauyrnU0Vgm5jmJ/cAIOCKqx4iT31vg1hvr3Rvux5u6LWBVWROvyI0=;
	7:coWB4ZJ+oTMq/r6NV2t1XErd/la/bRvLFuEJ/ZQV1RFl7CJ8sw9vWmRL/nWksZEbtpWajPNQBqmRIzgZRMVfgOyXMFowI2v7Qh0uU6W9558f8j6os6CR+qixJpJwQfakmlRK2vrAQTufRzLq3sESVaTtmuw+vu163qJvRtNsVGZZ1N/MRAZihi+LQV44eV/DSR5I306g7IKUKfpovSbnm1GGMtky3704zeSIkU9e0ZU=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2016 20:45:02.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR04MB838
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH][jethro] opkg: backport fix for double remove of packges
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
X-List-Received-Date: Sat, 23 Apr 2016 20:59:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/21/2016 03:07 PM, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Backport the fix 7885da3974 ("pkg_get_provider_replacees: do not
> add installed pkg to replacee list"). This avoids opkg trying to
> remove a package twice e.g. when upgrading.
>
> Suggested-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---

this bug also affects opkg 0.3.1 (included in krogoth)...can it be 
applied to krogoth too?

-- 
Cheers,

Alejandro

