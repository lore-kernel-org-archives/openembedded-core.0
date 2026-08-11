Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35471C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:13:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50382.1786439574049907070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 02:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=TKZokBvp;
 spf=pass (domain: cherry.de, ip: 40.107.130.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qz1Tqh8tDaNL30QrxQk2wwNsOJR7f3PGJnGvBqAGX1a8aTYYIofjbipfYrQ5g3tPCDHnTMnbkBAKXJtJsT5cHerBK9eMNU31Hat14YLtmNikfZAs2B+aDY0Uuajc7Va+vgfmBQh6vinAtcSzNvpCbwP7mhDA0HFboKToGWCo49c0j1sGIlLtdn/M/u6O4yX8ZEV1+JCPMoEz7JJ4yWssxEVx2oNhU3hD0zpe+2pa2SsmLBalWBXbJJiZQW9lTDiLUk34h7QbVDSKDTK9lfmHKJ2KGD1mM1yAJQ+6/qwBs4b5mJ7dGpk4UGTakikxeyime0OZtCDV1wey5JFWv/BYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhMZem5Ht2wkUE437aKQmxvnK9d0R6fAwWO/1f8MDSA=;
 b=oPAN4sEFks2Wvc9cCmpal3vIkAuu/1zqCH6mCJUYl8LstRtfb2Or7T57NUOk9NgGZQWAJuXo7ZxM07WOURqun1D+9aNXI0iMTIIEXwZafn+4AiqtRzUqWeF1t8Pre9oheUrwcAPt1qOko8eTgWjGoKK/kM+wijtmM3HYTbHybCwwABZs5jKlESHdVEb+6OMwl47EExfL/TdfxMiB24qdE0FUArz3LcpXJOpz0izRH1R7l97x/HxpKwtttdHNi9T9GSw0eEv3tV42pbnGJKB+hapQymhcAt/yPNMMweSjVp6S+RZB6Gq99bBsjLe88YICTqNWayRUvg0o0YtsOIZF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhMZem5Ht2wkUE437aKQmxvnK9d0R6fAwWO/1f8MDSA=;
 b=TKZokBvpu71Anne44iU1IQ5ItPxVsV2EwqS/t8QPc6H3lYowENkHT0/AR3s7W1I+pppRmy/bbCCBm4CP6ZSdGgH2gli6O/kS6X9edwHsIokJP7teqB3PyiXEs7fAyeD1uQFDu6LloaUyRZRbQeuEx9qEKHO8dQ6r8S4rLt21SWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DBBPR04MB7913.eurprd04.prod.outlook.com (2603:10a6:10:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Tue, 11 Aug
 2026 09:12:48 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 09:12:48 +0000
Message-ID: <03cf8e4e-72d2-4d55-b23e-209f50ced994@cherry.de>
Date: Tue, 11 Aug 2026 11:12:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] AGENTS.md: Add file
To: peter.marko@siemens.com, "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260810161132.614235-1-JPEWhacker@gmail.com>
 <AS8PR10MB5073A8A1830344344A974B7EFDDD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <AS8PR10MB5073A8A1830344344A974B7EFDDD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VIVP296CA0003.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::7) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DBBPR04MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: c26d5538-7937-4cf6-5b3e-08def788b633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|5023799004|4143699003|3023799007|4133799003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	BiPMIxEs6ET6MB8ySZ/Er4tm0ESG7eClbmV/lE0bReO0jVBztrjSqSXsggCYYj4GagY/43zGinHRzQ8cDixArloywlRNFiqVkGcp2bU6Vw9YR1OVbGZ3RahFtIM6dYRZxFYAA9vkLnQgtGXYRsMNRel5B+IgePERS0GOC67GXxuGviL5JWytUOydK35G+Vt1CwqcP50mFOZ72Rv4cLvGwAYjHuwLgWXpI5go88nvaZMYa3Xc6CJovvuqDrLtfqOFMSL1JghW3NKf3NzPjTKiMq8I87Y3ICcZAR+mqYZNeEd+rYC9lAtTeeGasslOV8EmZLu/FcA8gKb1VeCb0BP7gyT0pPCkEksV8NjCzyYShPIiBaOciRcbZBatcUy7BZTVcRVN9onEOJloWDtVMkp0q/M/F4FhJHkSZA51UnYIeAymsHy4Z/+8MtiiKVvwnRTRjlE5jDTLpBMF+DCJrWPUbiiDXMNBQ6Q8WxLYF1zwolfl/auHBIz7ylyRQxMGLJdwgPBqF56mhrYSaZMpiwiRkxuR7c/n8NARPlDvAzpLQ9IJxCyxVbILEkeHOBd7MzeG1n4yK0zE7zO7v9XSPiaXQBLi0vH7mZaWJbh86nvx+TBIjd/uzBubuZ7AUGuLr3lPwfSmHseWj9hUlDedkodRux2cMU5oXPWQ8rHdhVv/gj8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(4143699003)(3023799007)(4133799003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HoUSQZOMOyaDy1UP9IPw7vA2fH0Bo4YtCWr9GdKDeDrK4z6xcQ4VcDRiR++o?=
 =?us-ascii?Q?5if1PVJL5TuK5GLhucnIal5b9CtQkU7fc8WZWvlywp+XrVhv1J/eBHQcEcsB?=
 =?us-ascii?Q?OBAYJUWbuNGAXXjiE3yn89G2S/p+0eB/pkK6iRPxeGX6flNs/T8InbjzSwRe?=
 =?us-ascii?Q?9y+eI18hRG4fEPnmwRJX0vrc9ZEzbHEnVysOjEoV8tZe688b/qAHdCWLFuPC?=
 =?us-ascii?Q?mtDFM9/V1XKMPSln5hqxQkNAGCBCfZ8KZbfzg6eesGkhLFzA+bMIa9cf39eo?=
 =?us-ascii?Q?4SgKxjtFKtHrAhgerr7gh9uVao9+CuoFE5K/fPKbwx6XD0dm2NEDsDLX6Hp2?=
 =?us-ascii?Q?RzHbYQHqGBPDTWuB4suRIX+mLykXz0etKZlCw2l76333lyfNRCh59jJfdzOk?=
 =?us-ascii?Q?zG+MJYXxZad7T8s1GE669PfCosZImLkOK1gEzI+vlo/UHJdDJzZO6gP2ekNR?=
 =?us-ascii?Q?JfTwYUP5MlG1xpdPiM4PyaiPYMNgQvSXpeOOAylmheEX+L3OLwm6ssct3RWD?=
 =?us-ascii?Q?DswhlghmA+4M8ROri9/p7A1CyTk0Wyn82reNN3pORdI3MKEyzFjpgBxUXCn0?=
 =?us-ascii?Q?8437KaIy+HYOeQaqSFeGR8YgUYjMI4kWtcouu9RW2AKJBmv24Nex/JDDbBmx?=
 =?us-ascii?Q?eiK8iN0HGb7WytY2YsALeMZPMMMfqJZ8r/oN9qo1RCJ8ubXle1Ry/oVwlz7c?=
 =?us-ascii?Q?jQrc+kqNLK9d7XCYDJ3JWtcvq2FXdIbffLncTNRiiiKlMRwXCoS4J5kQoWuq?=
 =?us-ascii?Q?sKi11nQ79NG4DldK2gk1V63p9lkUgGP8ptztde86hd3GD5atgF7IxxdeqYQn?=
 =?us-ascii?Q?f5lrOE8TZJgefZvMFjSZNyw2nQJxaG8NDFBQR4LiKt7CNattJpNJGA6zlJPr?=
 =?us-ascii?Q?16isbN+R525M4ajqfGABvyIJ25BQXXkoXkTXZdAdpbaZPYSidfSWfAXDTbrA?=
 =?us-ascii?Q?kxTU6GB4rg7Zkm0um0bd0pilFYdaVHavRbQLbHqfBW0wP0tf6M32bPPa/egp?=
 =?us-ascii?Q?0KhSuOcKKc0JH/of8DLk2EX+QjXsCFIldF/50WysdzF6FRHTP2C5jnStjaDb?=
 =?us-ascii?Q?g+RDy/OFk6mAGRXwob6420bfAc92twox+9oHoUIy7nTVGmSYgCnYIP+Mz3KE?=
 =?us-ascii?Q?CLbE0+iLzaewJv3yh3Gbd8sC17SzUyfVYSll32LxOtO4m+P8Z5s9V6PDioWn?=
 =?us-ascii?Q?XRicQAv4wvIL3fRucQsvnsgUroItCd4q1lYIWM3SSuMoOVlYJe1rSyJ5ualS?=
 =?us-ascii?Q?XwsFwUk9WBxwV3PiqQ8UkL18pba6e9gSMvot1WvMUBt3T9pFr5PbkctRruvf?=
 =?us-ascii?Q?plSWwk4xmqcFAQlcH6xm9C7+DhVFjyN6va8UE27w+Xp2e/DnWIaJb8uJutvR?=
 =?us-ascii?Q?WtdWsxQMlDFVj9eRp+sX9DqAElIyhR86zDtJWyognjB58vJ7mDsiaubyPCOx?=
 =?us-ascii?Q?pvuqTCYNCm81i2V07jRi+FNKwEBvXhvlm50UzPim7tzVTrvar3gjVhCsyQum?=
 =?us-ascii?Q?2Aui2O9uJn+/iGtH5G2IzyBpK0CogDzeftvOmaidwfjP5TdXFU275rLMaXRT?=
 =?us-ascii?Q?jeVkvKDjtOZUwYDRGS0K2ZeQLYKw2RpAZW+CbzNrrnpx28hFnV8srTO3dDTl?=
 =?us-ascii?Q?OusOgbhZItUFRV0ZXEYJMsvZ8G3hMnTmMkYwSmKyfT8ToEucAXYxppF+ycVQ?=
 =?us-ascii?Q?+X5seuTSy1vtQCyDT1QBd8k8fl1OuYzwHNUwe7k91ryN66ha6FHh2ZKfZtqX?=
 =?us-ascii?Q?w3q++wOofdVnJGW+r2MVJRAQozY+7LLJsDePUMEfrzVSm2tK0jAW1Ufe4H75?=
X-MS-Exchange-AntiSpam-MessageData-1: 357WWEXqhqImsA==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c26d5538-7937-4cf6-5b3e-08def788b633
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:12:47.9417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUjyTFLax78i60hZ0nDuoVHuFCfk6rdo9/WGFdnJbZTSzndTJFobaWW2+TICpQd294/t/ElfMwefqRqeLIEPOF+1osoywiUxacFNZcLGwR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 09:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243174



On 8/11/26 10:22 AM, Peter Marko via lists.openembedded.org wrote:
>=20
>=20
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Joshua Watt via
>> lists.openembedded.org
>> Sent: Monday, August 10, 2026 6:12 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Joshua Watt <JPEWhacker@gmail.com>
>> Subject: [OE-core][PATCH] AGENTS.md: Add file
>>
>> Adds an AGENTS.md file to direct agents about better commit practices.
>> This is specifically *not* attempting to improve or direct agents about
>> the code that they generate. It has been noted that when AI is used to
>> write code and commit code, the commit messages that it generates can be
>> long and draw out (e.g. a "wall of text") which affects maintainer
>> ability to review the patches. Therefore, this AGENTS.md text file is
>> only focused on instructing the agents to produce commits that are more
>> suitable for our review process.
>>
>> This file is intended to help agents comply with the existing project
>> document (and specifically, the AI Policy[1]), and does not constitute a
>> new policy. Any subsequent changes to this file should derive and comply
>> with the project documentation and policies.
>>
>> It what can only be described as the most bizarre interaction with a
>> computer I've ever experienced, the best way to get an AGENTS.md file
>> that AI agents actually respect as intended is to instruct one to write
>> it for you (as opposed to writing one by hand). Future edits to this
>> file will likely be most effective if written by an Agent.
>>
>> [1]: https://docs.yoctoproject.org/contributor-guide/submit-
>> changes.html#acceptance-of-ai-generated-code
>> AI-Generated: Uses Claude Sonnet 5
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   AGENTS.md | 55
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>   create mode 100644 AGENTS.md
>>
>> diff --git a/AGENTS.md b/AGENTS.md
>> new file mode 100644
>> index 0000000000..ce4d6d9e6e
>> --- /dev/null
>> +++ b/AGENTS.md
>> @@ -0,0 +1,55 @@
>> +# AGENTS.md =E2=80=94 OpenEmbedded-Core & BitBake
>> +
>> +Guidance for AI agents working in the `openembedded-core` repository.
>> +
>> +## Making changes
>> +
>> +- No web PR workflow. The project use **patches on mailing lists**
>> +  (openembedded-core@lists.openembedded.org) tracked via patchwork. Don=
't
>> +  assume GitHub PR conventions apply.
>> +- One Git commit per logical change (e.g., one commit per recipe
>> added/upgraded).
>> +- Commit message format:
>> +  - Summary line prefixed with the recipe name or short file path,
>> +    e.g. `openssl: upgrade to 3.2.1` or `classes/rootfs-postcommands: f=
ix typo`.
>=20
> Current standard for upgrade commit message is "openssl: upgrade 3.2.0 ->=
 3.2.1"
>=20
>> +    Check `git log --oneline <path>` for the prefix convention already =
in use.
>> +  - Body explains what/why/how, and how it was tested.
>> +  - Prefer explaining *why* a change was made over restating what's
>> +    already visible in the diff, unless the diff is long/hard to follow
>> +    or the reason for the change isn't known =E2=80=94 in those cases, =
summarize
>> +    what changed instead.
>> +  - Be succinct: use as few sentences and lines as possible while still
>> +    covering what/why/how. Cut restatements, filler, and any detail a
>> +    reviewer wouldn't need (e.g. exact test-run counts, step-by-step
>> +    narration). One short paragraph is usually enough; only add a secon=
d
>> +    if a distinct point (e.g. testing) needs it.
>> +  - The most relevant information about the change should be presented =
first.
>> +  - Reference bugs as `Fixes [YOCTO #1234]` when applicable.
>> +  - Use `Reported-by`, `Suggested-by`, `Tested-by`, `Reviewed-by`, `Cc`=
 tags
>> +    where relevant.
>=20
> Where should the agent get yocto bugzilla ID or the personal tags from?
> This may lead to hallucinations.
> Maybe we can suggest to ask/remind user about those?
>=20
>> +
>> +### AI-generated code
>> +
>> +- **Mandatory**: any AI-generated code/commit must add an `AI-Generated=
:`
>> +  tag line in the commit message, placed *before* `Signed-off-by` (if p=
resent),
>> +  naming the tool used, e.g.:
>> +
>> +  ```
>> +  component: Add the ability to ...
>> +
>> +  AI-Generated: Uses GitHub Copilot
>> +  ```
>> +
>> +- Also add a code comment or other in-patch indication that the code is
>> +  AI-generated (recommended, not just the commit tag).
>> +- **Mandatory** Do not automatically add a `Signed-off-by`. This tag mu=
st
>> +  always be written by the human contributor, never by the AI tool =E2=
=80=94 the
>> +  DCO/Developer's Statement of Origin still applies in full.
>> +- Contributor is responsible for confirming the AI tool's terms don't
>> +  conflict with the project's open source license/IP policy, and that
>> +  any third-party copyrighted material in the AI output is properly
>> +  licensed before contributing it. See the Linux Foundation generative =
AI
>> +  guidance: https://www.linuxfoundation.org/legal/generative-ai.
>> +- `Co-authored-by` should be omitted in favor of the `AI-generated` tag=
.
>=20
> Do you have references about AI-generated git tags?
> I think that the AssistedBy is the current state-of-the-art way of annota=
ting this...
>=20

https://docs.yoctoproject.org/contributor-guide/submit-changes.html#accepta=
nce-of-ai-generated-code

