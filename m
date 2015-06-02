Return-Path: <soren.brinkmann@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0093.outbound.protection.outlook.com [157.56.111.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8F277756F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 17:09:16 +0000 (UTC)
Received: from BY2FFO11FD020.protection.gbl (10.1.14.34) by
	BY2FFO11HUB019.protection.gbl (10.1.14.178) with Microsoft SMTP Server
	(TLS) id 15.1.184.11; Tue, 2 Jun 2015 16:36:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BY2FFO11FD020.mail.protection.outlook.com (10.1.14.137) with Microsoft
	SMTP Server (TLS) id 15.1.184.11 via Frontend Transport;
	Tue, 2 Jun 2015 16:36:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54803
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzpAi-0006gK-DV; Tue, 02 Jun 2015 09:36:12 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzpAi-0005TG-7x; Tue, 02 Jun 2015 09:36:12 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t52GZlpa025105; Tue, 2 Jun 2015 09:35:47 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzpAh-0005St-3k; Tue, 02 Jun 2015 09:36:11 -0700
Date: Tue, 2 Jun 2015 09:36:11 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150602163611.GI31081@xsjsorenbubuntu>
References: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
	<CAJTo0LYwXZ2KsGay0Q0sRKbUUZXdCendjTXkCYdH5ycdkAtSYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYwXZ2KsGay0Q0sRKbUUZXdCendjTXkCYdH5ycdkAtSYA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21584.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD020;
	1:rMNpWJ2J1TREKQgKQ8p6YtRYpvLzcm6XetxrGTq+JwmZriXe30fNuJF7RBu7rX6YL37Qjmn49ZQNRd1Fr3Q9Hpv7QC2eLa/VgRDFKBc8n+ZNOFpC1vyKQbZox+s/JsOOA3aTdtIch9o0DE9gYSmHGOp2HiF0ERPGVnORE4LEqNdTMvAdWqJgICQc6MaLg5gxqrJvC5vOIfN3EE/okWU1L48DoYT9zXEtCLEkedcD2cOnJVLsf49U1ZyzoK2AhvEGT7vwkN0WNEn66xiwRnKYheh4yVfonTq7CZMmR5TTPp1WmZzB/n1ZCWR2qnQ+TnLcNpNuy1WlePA4/F1EmQB/BQ==
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(377424004)(51704005)(24454002)(189002)(189998001)(85182001)(86362001)(33716001)(23676002)(76506005)(19580405001)(19580395003)(92566002)(85202003)(6806004)(47776003)(64706001)(87936001)(54356999)(33656002)(106466001)(76176999)(83506001)(5001860100001)(50466002)(50986999)(57986006)(2950100001)(62966003)(77156002)(77096005)(46102003)(4001350100001)(81156007)(63266004)(5001830100001)(110136002)(5001960100002)(4001540100001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB019;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11HUB019;
	2:I1zDX6A0jzFunwM4Yi2+GhnZCLhmwMKQfQC2KPfXUv6J5OzSF7B4AgkunuiORezh;
	2:zJvrJE7qkX4wyGwJ7V2stGoBkOnuVp4a1FxW4k/QHpUKSuRAg2z3bvRJ150MhNrf+MG53Xp9rj+smhxfPsF0/9xmsVeteo4NrQg0xbIGBGvlBijezwUvCZV5tjHBgFyrdVE6R5TuJ+JE+UOPDxGSpyJ4cSsLJn81YH/AyXqCVv1krwJxf5Q3HEdfEXaQ0PaBUFFUXFdpJBlf0VF9ucpYOf5pZgWmsZ2SGieoBl0YpFxzHMItD0uMh+BeYRr6RQ+p;
	6:mZYGIQpq03zVBRKOqFinCkYEjZ5NiyrHkWBDT11fsxXjPWdrEbxTDXBZrZam18AItEk7XqUqWnl6yawCkfX5x5fPI9qKWUhL4O8QOrDFwRxI6EGsf5/OAz1dUymSN2VWMNW9VOoR/jrjQnotTlb405Lv6aXDfhMZdLcfyCsponYsYX1fZKivM7uR/wc78rc8+iRaHGjNdYfEyJYomtr5PPiDAAVwx1zQrlRzkmINFgFqXz5F4cCjJTBFXMXfsQBe4OExnA+3CPd000NRbXsikJKU4pBJ2R7oOSM2NBJrFpLL4KpkDCTzOFeVhuEEoUr9OQAzhJJnqwtqxAJxdSwyLNzqHmUiD+zRZBEhef/LvLcuASMw9wu+hGa1w+iszG+EDTM0b8no1ToMeC1+2iTmaQ8rYZGy3kAb3LBBbdGv5gstnIjD9hhGucma34T5b3IRyCZsdUuyUh9dph9Cpk1rs40Q4dyD6eM8y5fSxNDejO/XGljFxQmtrEGab0jhyT/s
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB019;
X-Microsoft-Antispam-PRVS: <BY2FFO11HUB0193DD4EB3A684B1A915EF38CB50@BY2FFO11HUB019.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(520003)(5005006)(3002001); SRVR:BY2FFO11HUB019;
	BCL:0; PCL:0; RULEID:; SRVR:BY2FFO11HUB019; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11HUB019;
	3:6QnpMZm+JlUb2TJBdUtdqrkjZJmEIO0z7IGUoN6hYEfNaO0L3AHfsQr9ZLB8jJ5IZjskqpj8htPSzcTHPSrEcT5ZQjlvzpfeuU345hBhyWH+E4HzLn2gk01qaz3VGPRIJh+T8Ea+Q7v4TSPEasguut/ya3INpgISnHqJ4xx2cM5uI1ogMBGdfnq3AnOdrUy9mhdXGafQWpOkLKp2AmV1r31wx+bJUC2OpIKMxBdEnpdEq5eUvTInEYN3m+GPFSA7F2yhOQnCq+zrekPeIYpt9Cd2sOZe1L2B3H/+tJ6HdGqQW7bpBOP/7gz8XBR76/Af
X-Forefront-PRVS: 05954A7C45
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJGRk8xMUhVQjAxOTs5OkkrMzdkMXdJcXRGam1JQWlIR3RRT09WcW4y?=
	=?utf-8?B?ZEcrMGNCaFFhVVozZzdvSkNHVU5FWkpSZmcxUnhZcjNRbkdvaWowaThvRHcy?=
	=?utf-8?B?MEJtend5aGV5dVdpb1BMNXUwcmkwdkE1c2YvN0JoMmJqYkRFSzVjVVFDbk84?=
	=?utf-8?B?Q1p0d25uNkRaRGYrZExNN3ZoMUNlWnh4VW1VMk1nUEVITEdLVGNMWlZ3SWcz?=
	=?utf-8?B?Q05EcDZ1YkhOdmJycllIa3ZKMTVRRXN1aTFIVmI0d0FadXFYVitUMFAzV0ZZ?=
	=?utf-8?B?V05GVnUvR2NMb0Z5T3YzeWVxRXQ0aTROMy9xWlJZWWhTcGNaSUV4akNqT0sy?=
	=?utf-8?B?dXhhMjRXNktoMnRucitpWE5DR0Q2clhPUzRKckdtTXlyWk14MXRqSklwMGJB?=
	=?utf-8?B?OU9GaVZESEcvcFlQcHRyajEvaGtXSEViM2RDYTRQT3pwVkhqd0l1U1k3cW1F?=
	=?utf-8?B?RGVTWCtDaFlNM1FpeEptRGVKOHVzZ3VWdFJ0QXNpNzRBN0IvVTJoZWxSMDVJ?=
	=?utf-8?B?Z1FDdXZJdE5NdDJEWGNyVytleXdCdm84bUhDRmt0WDRqYTg0US9sMWUzR0Ry?=
	=?utf-8?B?VXVCb1BDc3ZFWWhnUHBjU0l3RlF6V2FqL0NXUncweWsxOVU1Ni85bGMrMmc3?=
	=?utf-8?B?V3R4YzN4aVpRMHNad1FHLzcwd0o5TzQ2dW9VVEorWGYycUIyQS9FMklHZ09n?=
	=?utf-8?B?endKTXNyK0NJZkJrMnlxd29MNGlyTVVhVWV6dS8wMHJrN2ZCSEFQekpMdjhB?=
	=?utf-8?B?QkNEUFNMVFd3WWF1QUVKNjdkZ1pzUXQ4czJxZWw1YzRmUGNEZkpYU3hXMm1S?=
	=?utf-8?B?RUN5L0lNV3hrcFpPZmdpV2d5NnRJbnZtdkdaZndWbENHNWx1d2JUQ3Y2S09u?=
	=?utf-8?B?RDZOUk0wN3JBOUFHSnVIZ3BnZlVGZnJJcldWRjRpaTh4WWUybUNaSWdhSzBw?=
	=?utf-8?B?ZlR2UTVrTmF5Q1BUbFdpbXVIQlhFU01JazRWZGxYSXNQQXM0OSt6Q2NqNk5Y?=
	=?utf-8?B?elFGb2hPRnlqSXBlbGNOcE5XUFJieWlJUFF3aGJlR0d0R3RBU2RjdGZkUHZ1?=
	=?utf-8?B?NGVobHl2SzdTUWpVUnRuaTd4eUwzZmVlV3hUSzBGdVJFendEOXBHYlBvc1kz?=
	=?utf-8?B?a2VNelg5N3BodG40NG1rZFNHMVg1cTBIZEEvL0RYL28rUXhURHRZUmFKVFJ0?=
	=?utf-8?B?VENyeENkcEVSby9IOGx3NDhlakxQQXM0bW1jQjdUVUwxNmJRWU03aHBJemtE?=
	=?utf-8?B?bzlENUlwNFdzck1peEN4UGtqUzdZWGRvcTRSQnJuWENpM1IvbWVXNWo0dklu?=
	=?utf-8?B?aTBVYVl0S1hQdUEwV3JZZGJZM1gxT2YvMTR3eHRpOEtIRTlaaU0xay9aZjBN?=
	=?utf-8?B?eDZGNGxYay9NdmhXckQ1M2k1SHpOYVl5L012LzlJUXFvQ0tqL1FGYmloL2Nq?=
	=?utf-8?B?QnVvYzVmYVdJanhBRW9KczBzRlB3UE5DdTc1R01CS0t5Z2l3NlVXWXp4OUo1?=
	=?utf-8?B?RlJoYmxqMS9pTnhKY2JVbGtDT1BoU2UwQ2RxNFU3T2lsZFZiTkNMdFVESVJx?=
	=?utf-8?B?aDRCSkZzRGdBQW1aNTRGVnBXYTVpbHc9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11HUB019;
	3:rHihHoIF3KR2bu+Vncw6LeMK+8RGP/7YhhnQl9yDA3vUAz0Xq+R4/p8VlO/wFCWkeZAU7S1A3yXiT3S0PqgWkI5A5ZdmtEevsprxYsK6Zn1fGU5y4OxOsiBJXYmdLX6AIwKjT6JZbgwL/9SaIQ+hzQ==;
	10:olx2S0KqVlLkTnzHcgFL/p12FYwi3gU+CbAdjbkcb9M0/eE6dumKG+9nCEv/2vY1suFWb/aQ8hiaYlZXGT8qiLLDG62gwRt8mkXAwdlZqNw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2015 16:36:12.4466 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2FFO11HUB019
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] dosfstools: Add recipe for v3.0.28
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
X-List-Received-Date: Tue, 02 Jun 2015 17:09:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, 2015-06-02 at 05:22PM +0100, Burton, Ross wrote:
>    On 25 May 2015 at 23:29, Soren Brinkmann <[1]soren.brinkmann@xilinx.com>
>    wrote:
> 
>      +++ b/meta/recipes-devtools/dosfstools/dosfstools.inc
>      @@ -0,0 +1,8 @@
>      +# dosfstools OE build file
>      +# Copyright (C) 2015, Sören Brinkmann <soeren.brinkmann@gmail>  All
>      Rights Reserved
>      +# Released under the MIT license (see packages/COPYING)
>      +
>      +SUMMARY = "DOS FAT Filesystem Utilities"
>      +SECTION = "base"
>      +
>      +BBCLASSEXTEND = "native"
> 
>    Is it really worth having a .inc file for three lines?  Also, the makefile
>    still respects MANDIR so we should continue passing it in as dosfstools
>    2.x does.

The MANDIR is automatically correct with the parameters passed, I
believe.

If you prefer duplication over the inc file, that's easily accomplished.

	Sören

