Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.96])
 by mx.groups.io with SMTP id smtpd.web12.6773.1620369900932827885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 23:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=PEhRjh+x;
 spf=pass (domain: outlook.com, ip: 40.92.65.96, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUCCknMIeiX4fg+soNjTGfiRf9O/qco79pNk5DHzKbTuoVndT6swpBU1bvrDaO4+H5udYm92sf0ECzESDIQwfBOh8Gyklc8nAn6NfjkJDWjbcbXcJEpjB847N8DoeRsx67fWu7Kh+1PxY3sZIwCOIP+bT7MS0IrLubysU0wd+SDwt5YWPEi1oCujAku0saR/xT8QQolcqcDxMEXbo1rdGYPcpUdiEySKiD0qPfwmbIKZCDxEyU0OPHbcDLbUNATE/WLIQ/8HyxttmGz3G4yL/4yCJgbNjbxGrRazgE9y8FJGdadwQdQvDFqyeShVXtzzU3810LdQ48TBjy32H/FXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJVlzQJeBWqi6jrMit88OmE6X0yKBR58eUlykJBDqi4=;
 b=KEuuaj+jSopQPONFUa82TQdHJrs+JLYn1dgPF4hjgvdarfKeirNUi8xdnW9RSz8aPEnxZ+PDx4IqhvmbW5da7dA9931c+jh6xF6QLlhMj+KB4D88XLCPLGWaDVeesK4cpZa677PaHnO6v3E+mBwUn3wziCBmDlDqkH97bGOCSkIMrMXtNujAEPOtkqlu+8vrFiVKwoqvGRmQqv6PhDiMNF6qodMpgcuk3tVA2oZESYnbccMNgDJyOqWqI1xaUYmyRXcgeCYjp80w1Xe6DVnD4fa+kJJq3j3s7alDqbRYy7kAScrU7AZs+hd9842Sl4kC+bVu5IOqRLTS4bYnWSeqfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJVlzQJeBWqi6jrMit88OmE6X0yKBR58eUlykJBDqi4=;
 b=PEhRjh+xG74dJejwIi/LBSrUIqZ2vxyvrZU5pE/Gqnntx0/DQuIobY4T6XDjq4O7rMtuwpG+c6gMXB+1JtL+cM6VQ4IyesmT/iSWYgWQKWj5obw6HPz9kmSOqqG2Ijl/lK38v3MQLH3g6qv7DtVGtj+8hCnNQyejyeEbo2d1OpcGgbulxnO/9meeE1U+YZjepml33Khiiida5aZx96UAIfTjeafP8tSl+o764yPYO6kJZ6uWIKrtzyxIfOv8u/+dP+X1JHQRVSDpZvX62bo3s0RdfYjQfU6Ok+tYEwpsv05gW2acs/1bFc9Z3FZ7f5IWa4b9YlNxwkUg7rzwkbor8g==
Received: from HE1EUR01FT045.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e18::44) by
 HE1EUR01HT072.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e18::355)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 06:44:58 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e18::4c) by HE1EUR01FT045.mail.protection.outlook.com
 (2a01:111:e400:7e18::239) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 7 May 2021 06:44:58 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:45AFA2E5A050F1E63C4255EB7F66E30CA74DDF58414E6E44917D4DC7C8364E44;UpperCasedChecksum:9B0EA1B5F3AFC934339FD7046FBB876D389EF118685D491BF6B410815EE8582C;SizeAsReceived:7872;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 06:44:58 +0000
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
To: Mikko Rapeli <mikko.rapeli@bmw.de>, steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
References: <20210506171232.2832063-1-steve@sakoman.com>
 <YJTYCgxanqxIZvIw@korppu>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642A80CE0C4DC6562D8DA86A8579@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 7 May 2021 08:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YJTYCgxanqxIZvIw@korppu>
X-TMN: [jgdlELRCEkUKji27knspmZW9qVicoH6t]
X-ClientProxiedBy: AM4PR0902CA0003.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::13) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <3bca1f30-3d0e-4717-4922-6c90a8cf3fbd@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.86.4) by AM4PR0902CA0003.eurprd09.prod.outlook.com (2603:10a6:200:9b::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 06:44:57 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9af3d810-ffeb-44ce-1881-08d91123a175
X-MS-TrafficTypeDiagnostic: HE1EUR01HT072:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7MhzJwdiE4BjRpAoyH9kTS368LKSqliVrFOcQcUQlQ7B6ZVvbzz2PmfwrurAadPbjm2olhHJRMM1Kr+dduCjyH4ndPQzlOCdW8nLDSyGyTkM31nF6uA34ulZH1MB6yu6vt3+UzYqvyUyP8Yq2yC4EcDEfIrtqKL7RsWp2hODNsiotdRWpY9Luu4BHzjIvJqRjH9MJLkOtwc5wxPIVMO9TBAXUvk6XISTas+DUjFOjy8GqmaYm9bqP+KsI2MF71pebYSD3N9+P/05/uSD12kqSIQ4RmziGwTPvZsEMJpHXotL9R6uXlL0BHJK5wF8ZXxOEQ2cGRuLNljVL/nAr835Y8/73HC4SkiNhe3LoNIqgCjzYH9SZDKSk1Yqmth5N+dx5DHgi2P1qCH6Qk2iSPTzNPJ81CN7Mws2TqIv+CShvXlVRiLVdiK0Q1r0y3gMxKh1JizNvvq0zOI6FB+twd4QC+5pVO5Me+0unOBkeUJq91w=
X-MS-Exchange-AntiSpam-MessageData: 
	n7sQ3wxK2rHXIt1Ec/jQJo+BA7NiAU6sWR/fuAvxIgOOFi64RuWjEAwjJANdh0LQ8sseNuB4H1GKvGy22yCoYmHevgvPg7eeWqzp76rufC7ueaczMnMxOTbH0n0dM4YdQdQHBb5Z1s1I14BQFVbQLQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af3d810-ffeb-44ce-1881-08d91123a175
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 06:44:58.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT045.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT072
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07.05.21 08:02, Mikko Rapeli wrote:
> Hi,
> 
> On Thu, May 06, 2021 at 07:12:32AM -1000, Steve Sakoman wrote:
>> The preferred methods for CVE resolution are:
>>
>> 1. Version upgrades where possible
>> 2. Patches where not possible
>> 3. Database updates where version info is incorrect
>> 4. Exclusion from checking where it is determined that the CVE
>>     does not apply to our environment
>>
>> In some cases none of these methods are possible. For example the
>> CVE may be decades old with no apparent resolution, and with broken
>> links that make further research impractical.
>>
>> This patch creates a mechanism for users to remove this type of
>> CVE from the cve-check results via an optional include file.
>>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>   .../distro/include/cve-extra-exclusions.inc    | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>   create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
>>
>> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
>> new file mode 100644
>> index 0000000000..956b3a9a3c
>> --- /dev/null
>> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
>> @@ -0,0 +1,18 @@
>> +# This file contains a list of CVE's where resolution has proven to be impractical.
>> +# It contains all the information we are aware of about an issue and analysis about
>> +# why we believe it can't be fixed/handled. Additional information is welcome through
>> +# patches to the file.
>> +#
>> +# Include this file in your local.conf or distro.conf to exclude these CVE's
>> +# from the cve-check results
>> +
>> +# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
>> +# CVE is more than 20 years old with no resolution evident
>> +# broken links in CVE database references make resolution impractical
>> +CVE_CHECK_WHITELIST += "CVE-2000-0006"
> 
> Could this be specific to a recipe?
> 
> It may be that CVE data changes and adds new CPEs and the same CVE could still
> be valid for another recipe. I think the analysis also applies to a single
> recipe.

My understanding of this file is, that it targets CVEs that will never 
be fixed - so it just reduces the noise from a scan - the same settings 
can still be applied to any kind of recipe.

But what I'd like to see is a proper documentation of this inc file so 
it gets some visibility - or alternatively it's included by default.

or it might be even okay to include these settings into the 
cvecheck.bbclass as an opt-out feature - simply any place but an 
undocumented inc-file

> 
> Cheers,
> 
> -Mikko
> 
> 
> 
> 
> 
