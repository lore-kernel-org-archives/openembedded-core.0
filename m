Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0071.outbound.protection.outlook.com [104.47.32.71])
	by mail.openembedded.org (Postfix) with ESMTP id 3B78F70100
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 00:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4TZbaf0dINuZd6H7Hh+aMhfm6hSqCHrY2rw2mYgDKPY=;
	b=0ELKWJsIoPWb2U9Jj+jge75a7t8P59XaV+3TUek0k3FnFPjv947hOPztJ2Ljc9ToYYMVBiuTbm2ZSKHN4V0AbKWzPVqpu9FSE6t3qpLnhZ+tE0tgaVQOqpGLzkNSA3g/jPxGEc3y6GRftjYyuinWcMDv5VEBkaw9ikYJ7GrWk6M=
Authentication-Results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.10.63.161] (210.131.143.241) by
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Thu, 1 Jun 2017 00:18:15 +0000
To: Jan Kiszka <jan.kiszka@web.de>, <openembedded-core@lists.openembedded.org>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
Date: Thu, 1 Jun 2017 09:17:56 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
X-Originating-IP: [210.131.143.241]
X-ClientProxiedBy: SG2PR0199CA0027.apcprd01.prod.exchangelabs.com
	(10.162.195.37) To MWHPR0101MB2942.prod.exchangelabs.com
	(10.174.170.13)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2942:
X-MS-Office365-Filtering-Correlation-Id: 2659a416-1146-4c58-fefa-08d4a883b345
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	3:1qrStouAb+NZBgbCZ03LScmh+q2BLaNIxu0IU/CU5P4tH7j0GFjyF7TRy3Yg6TCcNnL9FAz/URAYKBJ8dX7beDSl30uYctN5Nu7fqmZzwgKBI+hqULIypoh5uyRXxrJxvY5jscRr6kCGv5IiNtwUQIEzVwWRmxThFqe9q4ctgZOBBTREITRteGxSYJPIKwn82p2onhg1A92FeqpU5z1n7o4cIcH9ggD/vg2TaWHoQ6dVOmq+59fbNXWBO8//CWOIMphBoAMZpsnWoz0mnKfLH9sZd7kb8AEldUUU6ELpDT689kQ6LlTbGnTgjTPt+L+nglmbGGMZpTR/1IZS2vShCA==;
	25:JHUMyBKwH2I1eC9MGakNFKJfzw+zyIQuxkgAB7F8fTnSc5I3Go6DIOovDjXSH/6SBT6RU+6R1el0f1uct+Se3FCRJ4Z5NorUCLs5XioIk8a4f3M/G86iQPfSMaczsM6Mkz7j/gvSdQsJcw8mS4TFGktEyupJ1QzXnngeVOioZ4ymvXpMpq687GDRIlHlX2rKk8VWWQx+1kMUPXC5Mjv88avRTCA4u89oUheE3pGMdFDqCWx7KPUT9BsmSPrmN17Pi219VcxZSlmAEg34YyVP7H7J2ZyTmgCZaynfuKDxWLkJjgl5dlk9iJG0wxIrHZ4OirpWdURbyleOcwF9jvQrhHy6pqRW+3+CLuCj3m/yqnyOrCrNYyrm/6UkT949IbwOQ3+d56kMiYzrXVbLoDtmnKAvMmUvPL+KhBiQnsF2k/PbbKqxCK2hN5XkW1DU2qADylMIXF4BAhpaC4yFgu/LpSxMfDgtj7cobPkvCOj8QoQ=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	31:+VTeFNjlW7qT/KVIPmDmtiXm+NCSxIoqAcOsRywX+1U7p3eBnO2ThHtvZkXnejdCTj7BaLzc5078BIsh7YfqxZyzhQn4w4AQJFskevq+iv+k8m7hFPagMY6uycPNuK8yzJLTocOuTsZyGXwXmyQ6t+zNTTBICPMYRKwKzGkoAwzMJNChCFv43CClWBS5FTU3bCQT9jeuTVYQM7CTP80BdJ7Lm2kYslJVPpjdZcIh7SjVBJdv04pDus2DFKFRVRqEuLOLnt2eKEA2D3wxqLeVpQ==;
	20:oqXIKl3fWl5Mxe9xRO5JTAkwdkYe9mkBFWKFrjtjhL7U8bJDrW34XAnhurUJ5Ejab0vD+gVBeDd4V9gYMdhkSOJ2lzEgjjgcPs+EljP1s9ythn+HGOhsOekPMTiDAU3lV+nTm8/58Ns+gs1zqmS6XR8jCHYS0YpWSGQDSbBt6FDqST/VeS7GHTC3eFiCOL4/Nojuu21UdVxiXAqdq/NM40W/N+k3FMXlYZuZpvvz41pDi6DRrIjZoLA2UXbFwnZ/Dz0D5MzWWOtjuwQwFKfQW+yyJyHY6nPo2DbZfH/16MxGIfCUg8yNWZgn9/cwTGBnaB8O45n36v2Ixu48mZANDw==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB294278B02D7E04EE138BDB2FABF60@MWHPR0101MB2942.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(126837547833334);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700073)(100105000095)(100000701073)(100105300095)(100000702073)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703073)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704073)(100105200095)(100000705073)(100105500095);
	SRVR:MWHPR0101MB2942; BCL:0; PCL:0;
	RULEID:(100000800073)(100110000095)(100000801073)(100110300095)(100000802073)(100110100095)(100000803073)(100110400095)(100000804073)(100110200095)(100000805073)(100110500095);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; MWHPR0101MB2942;
	4:uzPLAJiV009jW1bFEe2l+zBMnVQDCscu1DIv?=
	=?Windows-1252?Q?FQcYWCWTkA7zg8lEe3xdl23tz1/YfaIB4FztmLbWTo4AOq6S3h5qsEMw?=
	=?Windows-1252?Q?0LrPmxhbfIiNeZlCB12tWtVNA/HRXfVnw/Dk38xFVnGaGAO6XsfImtnQ?=
	=?Windows-1252?Q?R9sR6ak4qPdNlPon+XYZ6I+CrGWS72HhmjtAeToPUySBRXBCoLgXqa9d?=
	=?Windows-1252?Q?VTlaQpK6kpckJdPOLt8kSjHYl6VRKE3XyPUYS5kpq0m0pnSdEay4cGxf?=
	=?Windows-1252?Q?GF8HkOJ2494xZKIZcTVQUPbue9xQVsotjwX3oCG1mnA8UDfytCCqdww+?=
	=?Windows-1252?Q?bq1eogoV3TsFUgHmub30aAmSPLQYoWNzGzt8C9DF73h4uPkYhuO2lmEo?=
	=?Windows-1252?Q?P3vFpM1QskHjreWBMta91S68jBa54tS3SmKzvIWWv4Im1Nva7Hpg804p?=
	=?Windows-1252?Q?ZfPAvuNej6wPssH3jthoe4YUaL3cBMaJoFq5HIuJOHtXncgF/LeuRsNa?=
	=?Windows-1252?Q?HaeTgIHOqorejahCBLtee35xe+zvCu77NYpSvAL7uLGrl4IMSzhvOpz/?=
	=?Windows-1252?Q?EpZzHqa5HbFPenSYIXrNnemDATjwsJm8FZUULRTxvDhJarAvMXamDL3e?=
	=?Windows-1252?Q?I0NRoGykt0LYKap2TeIrWfr6nNaDQ2bPMfhIvv6XI+v1tOAIREfoyHSI?=
	=?Windows-1252?Q?5SMR3p+pxGwASfAFIlgD+zKFQyLYAFH5SHBDjxIhw0GbFtlQXQ6f7MFj?=
	=?Windows-1252?Q?cweavFceofGBwSCriKYI3G7xAOAlGtQoSW8EMI9WeKTMaR4/qIapig7s?=
	=?Windows-1252?Q?tUXzxYZ7kPL4bNutpVTWbOeTDzpw279elS5KUlBBHCLyUMmmbXuVvoea?=
	=?Windows-1252?Q?rUsb0/SqUsV4ajfplMNgCBwNvt7zi+QyM8UH5q8N1W6JZq6gw33x2IxF?=
	=?Windows-1252?Q?MKwQ+dy27dYi09hZy8P6mfD0vx0uo0xQqGAAYtwHrBvka7NqoSUQiesk?=
	=?Windows-1252?Q?+kIL61cdsTQZH4DDsOt8ciH3sKjnafWptWV3ItEEpzROk9FAiZ6RTuIB?=
	=?Windows-1252?Q?swvwu8Uk6tOfFXaLA8XvAR2kEzDqp7Um3M4JHG01F+sDbh8b8Y3H2Oja?=
	=?Windows-1252?Q?LVVTT28Mh3IZHP+o5rcLmBlpwi389FD4ExQZn/uerPxk3kXvqACDjiyS?=
	=?Windows-1252?Q?no8w1dBcbxJXq1YZHI52xRtlkSZpNFP1UT+oZOYL4YFUuOpB2vIjzttq?=
	=?Windows-1252?Q?ybVeEtX/wHoa2WKEwz4Ou/RLGV+xOQpCRZ5ygKI=3D?=
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39450400003)(39830400002)(24454002)(377454003)(478600001)(53936002)(38730400002)(33646002)(65956001)(7736002)(86362001)(305945005)(6116002)(65806001)(66066001)(3846002)(81166006)(230700001)(6486002)(31686004)(25786009)(53546009)(77096006)(47776003)(8676002)(4001350100001)(31696002)(42186005)(229853002)(50986999)(50466002)(2906002)(5660300001)(76176999)(36756003)(6666003)(189998001)(23746002)(4326008)(54356999)(83506001)(64126003)(2950100002)(6246003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2942; H:[10.10.63.161];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; MWHPR0101MB2942;
	23:fKhGWdTRymMrqybxn7cG22FEvbB+m6ECqy0?=
	=?Windows-1252?Q?twibrACOlrNiYuOdspAP3lEnXGu/8M2muQqHOFb0dIZxbOZeqTKnh3es?=
	=?Windows-1252?Q?ELvTy5AAvDFJkzU0UtaH2PlQ2D46Et/XeF9EHV+3OKcfZL1Lxg/meKTN?=
	=?Windows-1252?Q?c/kzEKUck6PjFOsHEQUU6iQhCfY/3491RyjaOgGLtP+NJ/+fipL39Ovh?=
	=?Windows-1252?Q?+1GESB4rWR741iq2Cwe8eZ5Z9hcFb+yqSxVaasizFdJuNYrtHfMvi6Ez?=
	=?Windows-1252?Q?Ajyg/y4rjOl0ExCfwcye6StO1AdC63I1P8R2hw4JQCWqCEw4aiVklZdN?=
	=?Windows-1252?Q?c14Cg7FtMk+FSyQJDniB8IAWs5iQVU15xTSLEowVd9W0YePD3EuJlmAO?=
	=?Windows-1252?Q?p14LzIrOTV5YZ7tASfkQOwje2W8+EwzrDwstoAtpRw7xXxI9viMgwRoo?=
	=?Windows-1252?Q?sRXzb/ogDwGqs+wAhR/YFafJiHykzrj2O90dvn0w4hCXuUdjCJORYoSY?=
	=?Windows-1252?Q?FT6dAoRS3zn/4KKRuQGlUq8d78jTRNx/6mOCXeztWGkexYq2fsMInUAA?=
	=?Windows-1252?Q?cSkdLMz4CSrFKAM6Pnlhr412mcKbN+BQVErOAWKczZL/hRekbsP10AKq?=
	=?Windows-1252?Q?HjIjCvQ8aa21IW0OiGHgtD4lPczYIu/gZTqr/z4BJiIniSao4yS6f/8l?=
	=?Windows-1252?Q?ocJWZrtFz4SjZMinnw8scMgBKXftwSchGgpPNj5x9fRq5LhPJQYcKZ0M?=
	=?Windows-1252?Q?t7rI+qLvVk4ErAQxBW7EPxsBdPP68s6Rdtlxm6fQsVGJszq3M7mNBGgb?=
	=?Windows-1252?Q?5tLUlsKiJad1ktBBF0DkBu1/q6VQSPlz1yu0JUSzE5Rg0XyBFJncTwnX?=
	=?Windows-1252?Q?/9Fjml3SOLv+UWRrfNi3WgdkNjBG6pk7CamgWbqLmO5tYabtZqLM4TZh?=
	=?Windows-1252?Q?QWO48E+VJt7BjPi+7saGhj5+RtHlDwW5hMEcArPYo0YV7VBARg14lN9R?=
	=?Windows-1252?Q?wjlk7glOroNV/SFd//bKJHW29L31JiAcuAt7xHNWLWMMxjzAGqjaMGWU?=
	=?Windows-1252?Q?pGT7eg2B8LGhS7TuwO5tyz+KZmpEXzIu8gNPo6c9LBlSHV0Q1K0hN1T1?=
	=?Windows-1252?Q?cd8GZakD6X9nM5Sr3mX7ceac/viMA6OaGVI/yYr4QRzkyVO8N+9fV0kV?=
	=?Windows-1252?Q?0IqQuKARbU5bn2YzQTjcNWX9zpcKLK/b2G68I7I+qetdpo1l3u8kzdlD?=
	=?Windows-1252?Q?q7XvX21bxRyTUlGVlQOtqd1K9y9BYsHkP05HiXfA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	6:MTvLgBxdGf1Hjl9fg/3ykzpdnDM0zsUb+/Emlpt1anvzM7YGYipjglLX4XPHg7NOzPrPmrP6M0rkNzD92KTaHIZx0G5MMI9qSmey7/Jsp7UXvke27ySJBAbzFRTEFK9HprvxS4JreFa2ucZxGN5Wk/lakKUwFxjIJQiSeLjSzF3hMx+YzB5mbLg52MrhuM7c5u3Ecmmr4k2jHbs6qAqqMTOizckuyEIVNOd2Kz/rfas/SG4Onk/9nBRDWclROGm1eVMQlzNNebXQIW/byVA2fWS3OG2KmCz5Ank52DmlO0XcKp5GGTDMtLGd/qqZpUpMrIVO80KsFEJCTJoXvl3ZuzjmhwymJId3fYJqXC+3MmhHl4SPbSHWgAgPQ/I2EXog/FXLzd2f/EYG6sCvfKPYxB+3px5ckasAyuCc4BhpBbSBj0DqcR60Kd878Q2AIKW1dhu3RNavOJh8M739Q69zG6ZIHep4yHPKmM7TxMGFsnNScbRQ5L9xyI+p1PfahuZCxcQ+KXXiT3STfGkcL/cTbQ==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	5:5bTY00/8x1y6K1Fx9Bxmofr1qRymSXCmuw+7T0P423fK10M7F/5Npb4iplsnuN2zwtLQkKzj367whEnDOs9pR/5UMIBpBzZ5WRbGZKnj3CyjxN9q1WcwbJXYammqX66RCZy3yQVYmstvgA3cFWhio0K2VCcJV+mWbDl8C44Nfc39cBk7XLCJxJvc3D4Wq/UpsWTbF4dnfeOh3XUUTJ8mG5wYHqMe8zz6Rufzrjx8XQeyufaJsgbsBwMXEM0Jo7/L6t0qAisI3wUdAj+WdNp4nGFmGeOcWVJlMLrL39Fc31dsNCzt1yXMQDE3tSYHiL76Nooy+PDVASnrWKbhdOZsXv/wgjDOb4/07Ed+awUE39f1pG0nkNA9UNu8VInT2DuW9ltptILx9NG9U2FWW6c4MHc690A38dVdHImDyGfqXXXry3M0k5ZNgPbaTBvFvnn+ineonglpqBs7SJfpE7oAjJQdiVhzdffxe718lqWjc+zD7aRjQ8IOZOZLfUpVtVuo;
	24:cHpwPzwqn4SL9Z9+SrNfwcFxyD396tRfm1f39UZhKrNwsPm336h4Ul5kKoWSr98lR/bqdy5dLIFudsyzcztWvUbj1je9kP0appUEHKu2afs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	7:ZGZ9ZKoOuFil7f9h4XiU9rNH9EOEm+QYRc+5oW7ViQEsWQg9IAppbbD5JhVHH27d4rQcMWo5AfqkkT1Eer6hmnM6eRfZjey4GqRdLng6Z/YMOZvW6DoNo0dGb5kDIwpPZSKRg4PZwsg7WMdrCRcP33IP8rYbohY/ucqG/oNzke3HZauwTZOtn6/MYvLYCR4sV+9AUsKy7vdLwv5EwrcpdFbjNTreMk+5iRMZQiXvGwsuKr9ygs+sQs1iZ4kkyPqxomi7sjqyrcVO8deOwVC0nwX6O9dm10kKrHaABk1jXhnRGtecPVLtzqxZsIobM9NjS4NcWiOOKwLtx5xO4G7eqg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2017 00:18:15.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2942
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Thu, 01 Jun 2017 00:49:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2017 01:41 AM, Martin Kelly wrote:
> On 04/30/2017 08:28 AM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> The upstream init script uses SIGUSR2 to terminate that daemon because
>> SIGTERM is ignored. As the killproc function does not support specifying
>> a signal, switch to start-stop-daemon. Drop the retry loop because
>> SIGUSR2 is lethal for agent.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>
> Thanks! I noticed this bug and was planning to look into it, but it
> looks like you found the issue first! This was bringing shutdowns to a
> crawl for me.

I just noticed, I think we need to fix the same bug in the systemd 
service script too.

