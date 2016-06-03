Return-Path: <alejandro.delcastillo@ni.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0131.outbound.protection.outlook.com [157.56.110.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2495C774B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 21:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SZ0vOHyREvmDnXn5dAaQICueYo/M7CKQuD2aPwvcWow=;
	b=eO3r5NGe+NVk4wcYp85N8w0iI2k9UWs/3X5My214lIwxGn6Q/fw3siU6K11RSlukiDIa05YFOocAz5+Xgk4dzeZWV1UlsLnZJ4Q7iHqtXvmm8vKhRAHKE0Bme6Tt6EMT5MeJVdzct9VhoAxQJUPT0Oq31luoXsVYqq80z0EA8fs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=ni.com;
Received: from [10.2.33.36] (130.164.62.82) by
	BLUPR04MB837.namprd04.prod.outlook.com (10.255.188.11) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Fri, 3 Jun 2016 21:54:49 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1464892387-696-1-git-send-email-alejandro.delcastillo@ni.com>
	<1464899019-2487-1-git-send-email-alejandro.delcastillo@ni.com>
	<1464936479.13979.10.camel@linuxfoundation.org>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <5751FCA2.6020005@ni.com>
Date: Fri, 3 Jun 2016 16:54:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464936479.13979.10.camel@linuxfoundation.org>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: SN2PR17CA0013.namprd17.prod.outlook.com (10.169.188.151) To
	BLUPR04MB837.namprd04.prod.outlook.com (10.255.188.11)
X-MS-Office365-Filtering-Correlation-Id: 55c948ab-ec5e-44d1-fe19-08d38bf9afcc
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB837;
	2:qKUuFexUQeDaWbV+DCtPW2C/qNPcod4QSQ5uampc8cuvxmQDo9YnLpadX7GYkR9inrOQSYMnvxVJGumHy1BMj5lfw46RvkG8OZRu7QOyh0rO4d2ZwrPn4R8Fjbj81vwZPDr7eaTVMXDBRNCXGR+pg9Z5l8J2ISI6LPP7vJ2BFasktrr8Z+eZ/LVHG0wCcS4H;
	3:aSuRwZV3Es1n6qu9gm0tm6x72gQdZkPHg+VNv0VWJ2VgDTYrCfTxfGnAXOUzoNd0LDVrmTi4TVMDwo6paFkiFpAxOhJ3aLW+1D/DiZRi+JoJPsrpkhCzDl/8mxCHApo2;
	25:fT0eoMOm5VshVlFhcNCbxBXnaIwGULjS0N5DzQhN+zlh90Wzx6/IE8OP82T3T8iEu9HvErfgcx6pJu/a1JB65WoduNz+xmH5wqequm2QpkqsXWgbukxLMeiG0xuKxngINhUjk4FZzLvULUVVXVySQvf1tTvuvrEuohVVwN+5u1QqGQwQzUnE/OLhCLqtPUop9sWhqe+DKs71xog2RJVCmuljz5SyweFy5xf6tvbgoMAXvWBpoB9SmzFnHQNvpNc7o6iSJH9T7LzXOJ7aFJpKdPS0iZZ+RjPqryF1nUMLtFW1xHEQ2xV93rTEtwWFVTw2qhGYKo91c2QX6KUjSUPFTrkNturtoG06yr6K5Ltwnq3pQK045IfLcyloEg2qN1JuGZVnsJ+krMIOOIxsshLOM/GP2cVumrvh+6666IrYqEs=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR04MB837;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB837;
	20:aFXi8ZEwuavTgDS1u4aSe5+H9/96ezFXzKwxN9O8lfdeRlDouH+5ok9ldXRczIijTYK5riiVdTJdZzYNtr+4Ap1bplXJb3cCuZDZ8bWFgMU20ZAKQl1+1AiTvFDDPzBmq/O+UXOxcia69xp93E1ne/4lay0J5lCIdkz9X+ZiLBHvYKjo/cZ/jbEDHoGORU3nK6PdR8EchyXepxaMU3lklrw+JinHLogcHbp1HUA8YDMh+lcQsloQKQ9gM7AO6t2f/iCS4TLh5r7ERzdln2ONrj6PflS84f3rV6PSI00r7rfPBCobKr4TCtLeHux7X9IpNqx2bYvQn8Y1TFloqclFHKyVhbpXi9XebbmRlIF8ZwoRH9k5dQFSOu7F7HwYwnZkQb4+cz0qwe/tldeVOPprDmVSr5eTF/XvWb7ES2qf/Z2ce9/Hth4OLdb0RzJjin3xZjx7WEXjEyAPEdQhe3wiJAD9O1NsVfOJH5sAKICN5FWxa61oXu8zobAYZMgvmYu7FiUy4rngP9tV6KOO0or0+TSok+mFiYYMMs4h6XTw+Y5PU4/D7bYG7s6yDC5Q5qeFbg6V4gyAO2LhKAST6hjxFqu5dIU1dTt++SoCLePqzO4=
X-Microsoft-Antispam-PRVS: <BLUPR04MB837CF98398350E5CAD3974B86590@BLUPR04MB837.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR04MB837; BCL:0; PCL:0; RULEID:; SRVR:BLUPR04MB837; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB837;
	4:wRJu11SqgjmxcNDvL+lyZXY7XDJjvCuUVv9xjnMoNGyG5XviahDpCd1201dg0XLFBWScVP0g0Z/SJOszEdcwz1KrFLQetad4veZ/U4cIUpdt4PpGbtaf+Ff0STiN7zciBByzPzh5xXXt71SvBu45ztDrBOwCnZaSwelB3tZNVKEQVfS2JFQend/zCHnDMH1V619t2gDguDHOsgQ1i4flUQ1DSi+m+J1nWwGZl/6vDfBqYquIALx82WEh1odoOOIAYDkX0OdAEzlgdh62ITHgmxIloK3QWeRvK++iJsJ8/0YBk5FKdzqQShL/XR/x+1w+NCNDO9yb7+CkTw3jYCmfgKokYlI4YkqUBDXDU5bZ/P5nPcLNr2SJST6P7Y4+cVdU2UPKxneoFKOSf/7kx/jyP44T/X/Hvahmil1iTD+9VMI=
X-Forefront-PRVS: 0962D394D2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(377454003)(24454002)(377424004)(50986999)(77096005)(4001350100001)(50466002)(15975445007)(5001770100001)(107886002)(19580405001)(8676002)(15650500001)(65816999)(42186005)(19580395003)(6116002)(87266999)(92566002)(47776003)(33656002)(83506001)(5008740100001)(230700001)(76176999)(3846002)(189998001)(54356999)(5004730100002)(59896002)(36756003)(66066001)(86362001)(23676002)(80316001)(65806001)(81166006)(2906002)(65956001)(586003)(2950100001)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR04MB837; H:[10.2.33.36];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjA0TUI4Mzc7MjM6citpNGVDOHVzYnZDNnFjMVEzem42VnlpSUZr?=
	=?utf-8?B?THpGNW9iSFJqd3Z4eUJ5d0JXYlhNTG1idlhTT3gvaWhNTE1JR0E2WDBzTXV6?=
	=?utf-8?B?V3NvYW1zWWZDYWFvZmUzaGZxTUVvWGQxaHdEVXc3RzRaVmtZaXhSWGRLK3k3?=
	=?utf-8?B?eXlkVCtDRmtweGRWSXN3ejVjUTFLT1A3OUxYM0t2RlRtUEltcmZNN2M0TFZk?=
	=?utf-8?B?WEtGTUdMRUM0K3Z3U0tVQ1RwRkEyNk1lMVl2ZEN3SC9WeDhYeG93SkFoY0wr?=
	=?utf-8?B?eXFObjdXYkZyemkwWFoxSU5wM2F5Sm1OWE9MMVFGMGliTXdRemNTanVrdTNl?=
	=?utf-8?B?YjBGSENEa1Z4Y1UzNXJpTndQY0p0K2ZPSHAyWEowaTJPRXFGcjg0Y283ODZh?=
	=?utf-8?B?L3JVMHRDekNLaWpCd0FTUklRQTVaQnhFWXN5ZUh5UzhUd0ZWQWpjUDNaY1FQ?=
	=?utf-8?B?akJiQjgvU2JnTUZnV1QwOTU1ZWZ4SG1odmFzR1hid3lPemV2VzRRRmpzNVdE?=
	=?utf-8?B?MFo4UEhpd0hVckVwUi9lUWhMbWRPQ2xKNDJ0RlI1VXpBZzJQSlIzQ0J3OXVU?=
	=?utf-8?B?OXMyQ0dKYlpORjNqZ1dXbkYvR04xWW82L1V6TXV3d3JZNjh1VmJIUXprWVhy?=
	=?utf-8?B?a2ZoSWx3Rm9yYVpvNnA1UFVjT25hdlduNk51cnNDZitHTHg0bHNFMm9CMzIw?=
	=?utf-8?B?YTFpZFpCc2lHbGYxQmgwbFhWc3drK1dwa1h3aVNmMFU2Vk1XYzJDY1AyQXpG?=
	=?utf-8?B?Q3Y2dEpQaHFnaEVZWHRYbDZDcUxwQVpVQ0ZxN045Y0NwZmlUSUQ1cVFsamlK?=
	=?utf-8?B?TG9wNUtIdjB4NWFFQUNHdjVMVW9mN1E0eFMrNzlucmxsS3E0V3AvNDZPcllq?=
	=?utf-8?B?SGFCQUFuZDFGaDFkbXdaYTh3Ni9jeUxZdXBZZkRVVDQzdGE1Wk51WHJZb1ox?=
	=?utf-8?B?cTh5bDJ6cDJLaW5rU2kwN0RiTmV1Q1QyVnAwWE9aWS8yUFRvSHlIRGhFbE1P?=
	=?utf-8?B?MEhBOXRqY01ZNnNrWC9TQ1FwUjc2Zmh5NVJHWlMxek1kc2d2cDEvRk90cjdt?=
	=?utf-8?B?S3dydllGbkw2N05iMEx4L25wNDZKODVrSnhMMjQ4N3ZtMU4veEV6WXFNbVpt?=
	=?utf-8?B?c3VHV0ZDNWJ6LzdvNU1iRjRSVlM5Wm04L2dlcGtSSTlLOHYvUnVNMkZWVmt1?=
	=?utf-8?B?SjRLQnI0QWxUUUVOZjBRUXI5M2VjdGRHdGpRbGRVblZkdzJ2MmF3cmlWT25Z?=
	=?utf-8?B?bTJZaGZJaVdaL1lsTXQyMDQrSlRwY08rUHBMc0drYjRHeWtoRzJDZFpBWFNI?=
	=?utf-8?B?VVlLbVZmd3Jia0k4Z0VoQStEVWdmc3Z1cFh4WmREQkdpandYb0ZZZVpzSFdl?=
	=?utf-8?B?c0RDQWFSNHVqV2JzWEQrei85d3loQ1NLcWZPb2lSNGdDNjFYcHFNYUxScWZ4?=
	=?utf-8?B?R1prZlZlTzVPbUZhck9ZRE1sMDJKRmNId0F3YTFpcis0Z0x4SkJsL3ZlOUVV?=
	=?utf-8?B?WDdkaHFCcTZLQjhlZ3FEVlVVRE1ZWmFXeVArMUxVaWUxQkkxVzBPRElNSW5m?=
	=?utf-8?B?QVEzb3BOTXdudzlBYW5CajdqZEx3UUovcitKMFRvN1ltQWZlTmdOU2U1ckdM?=
	=?utf-8?Q?MDFo6ugkeFVSoSET0k/?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB837;
	5:T2bqWshCnkJLoUqJg7ecM+ac7m62UyN+jtrU5cbExdh/PPOdL9uUDsbG2m1T5rXT0BuUP+MY39m8H6x8cZyrwHoEOTydauhWiV3PeOA+3WlS4q8bNuxmcEHO2bwEihRSrFWNOX7vZ0eAvdot8UFDzw==;
	24:9eBsc03IE5DQkXrtiqViwU8r+696B+Yr0IzrOY6D9Fvb0vMTc1Pr9VQpnaWrsiFPPyBfH0j938gO3jsqlXhadJUMN4LD82Sm2F9AVozvm0g=;
	7:ulkQrMGi+p8REbowEABSk+bsJCr7FV6YqEcKZy+P3LcfWHAjAZzWMAjyLDZRlN7DmiDsVmkRAsR5LPNH3o+z87Q+CjAGP4APR0VPur1Uff194yefYQLN83+xWVgZz0dJwA47r0FUsnggCZUlQobhkOO9KZq+Ep4fQd82Z8Q5zELgUGQlD1wN7OzXhta18G5qtYuaO2h6nkg+/YqiUnBwdpdVFZH7i1MNDN6vRK3DRmY=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2016 21:54:49.9592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR04MB837
Subject: Re: [PATCH v2] opkg-utils: update SRCREV
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
X-List-Received-Date: Fri, 03 Jun 2016 21:54:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 06/03/2016 01:47 AM, Richard Purdie wrote:
> On Thu, 2016-06-02 at 15:23 -0500, Alejandro del Castillo wrote:
>> Drop patches now included in newer SRCREV. Update HOMEPAGE and PV
>> version to better align with opkg. Current revision include:
>>
>> * Python 3 compatibility
>> * Improved error handling
>>
>> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>> ---
>>  ...re-do-find-ls-code-to-not-fail-on-filenam.patch | 56 ------------
>> ----------
>>  .../opkg-build-Exit-when-fail-to-list-files.patch  | 45 ------------
>> -----
>>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 10 ++--
>>  3 files changed, 4 insertions(+), 107 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001
>> -opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch
>>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/opkg
>> -build-Exit-when-fail-to-list-files.patch
> 
> Sadly this failed on the autobuilder under testing:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/7
> 87/steps/BuildImages/logs/stdio
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib

My changes have a dependency on python-future, which is not really needed and
adds a requirement to what needs to be installed on the host system. I'll remove
it and post a v3 with the updated SRCREV.

-- 
Cheers,

Alejandro

