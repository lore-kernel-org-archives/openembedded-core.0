Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.77])
 by mx.groups.io with SMTP id smtpd.web11.17006.1599724915938044452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 01:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bGbk1EMe;
 spf=pass (domain: windriver.com, ip: 40.107.236.77, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V41JRrwpBeJ64y24Q3op71bXv8FUgCTlYtf22xD/3Ip3puoQSlK/2qEuQ6hBuriqy+k6MitdDToDDRSVsWziYqzS01xkTs9xfQ51D382C6+rhvxZpX+6R2xS7SGEa4qsTfbJpq9COx+2vTOvLSscTfqWVbQavkRV1MUy7ksbiAvk4zRTIpG/sq8qH7DJJYyFZIWo99wui5uNnS5Q+IGREhNCa8bPUEb6OhcjA4ZXaalm/HLWjfyQDmNZa8C7MBtL5vdnHNkMHgM+mdWzxPNPnLjNg2DcUP8+/EqcNKrQiGB2CbRi5xB/kJeLa6xOkbS37evcS6Jn6wEKqdcqcDK3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVrNoB+AmSpGcYSL5qlphTYbeNtp6p4sSH+3oEC9/VE=;
 b=JGMW8fPCmPKHx9sH4jIQpyoLt3wmOU4plqwp+LKMYFdz/oGztUrqq7JjI+9mN4TbCNGVp8p+y6YVxwWsVj02eo9bQvvoznLzX0lv5O83we0w+nr075OZmv1Wi0wD9y7bEs6neovWhTMLFvFmCfpQ6Voboe7KC5iKNLzbX4ph9R6Mn+gatdImPS0V72Mp8L7wQAf0/zBntcaKOAYpBYrA8aG5zPjnPqenxe0QX7YRVGeKsZdrmhNdEIgzlzPPO+5qJs0WzklrypaXscN1b/mYg+dCh2oUf1bPioSfhV2HAS+pbONNndCp2n1nXVNbgfQ1qkLrdLlM8sWoE5XOfTZwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVrNoB+AmSpGcYSL5qlphTYbeNtp6p4sSH+3oEC9/VE=;
 b=bGbk1EMenuJTzJBB02voRGUU91csmZqiNUkqB/gAIWYM+28gKrjvh5oAitgWHjkPbRBvxq0e1bBPPO9iuJ+dlppWOEe1zwuPiPCo0B0Blw42NVli8StRhnnDcHXHZfuPDx76DcIPwyXKmNMFnWqImd6XgMRZg/g57mZJfiQT7ts=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by BL0PR11MB3106.namprd11.prod.outlook.com (2603:10b6:208:7a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 08:01:54 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::a464:f45d:2dc9:f8df]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::a464:f45d:2dc9:f8df%5]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 08:01:54 +0000
Subject: Re: [OE-core] [PATCH] libxml2: Fix CVE-2020-24977
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200909081153.5022-1-ovidiu.panait@windriver.com>
 <004c88be-3a4f-9e06-8987-3a4d862f643d@gmail.com>
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
Message-ID: <e5fd5b06-fcbc-b40a-2128-6ba9d1210e6d@windriver.com>
Date: Thu, 10 Sep 2020 11:01:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <004c88be-3a4f-9e06-8987-3a4d862f643d@gmail.com>
X-ClientProxiedBy: VI1PR10CA0102.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::31) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:2f0e:c00e:d800:796e:7d0d:69ba:8fe6] (2a02:2f0e:c00e:d800:796e:7d0d:69ba:8fe6) by VI1PR10CA0102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:28::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 08:01:53 +0000
X-Originating-IP: [2a02:2f0e:c00e:d800:796e:7d0d:69ba:8fe6]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c82dfb28-ae6c-4932-9981-08d8555fc81a
X-MS-TrafficTypeDiagnostic: BL0PR11MB3106:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3106D4D5F3492266F7CBD580FE270@BL0PR11MB3106.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TyPpa0sdok8ClvqH3ue7W6MBhdZ1s9B7biPdgAfqLZhfqHS+2lAqu8j4sgOuLnGkVydMWVJuNJr4aCa5lCaDzmNR0Cw/UZCt2LOL4qAZ0ky4Y0FJ8ylw0weyEOOQYHsKCXicr3AUpoE8u9q3DPanjRrN5RuGA8NQDnBTjvQasiDSxe0CbDkj0lOUH1fbxmQjU61ss9GTwtaiNceXAVf/yIBfuxOPcBMOP7P3uL2X05s735gC+zND2W5snXeqfbZv9kmhu5UAgR/LjNJphLVzdu4NIdhK/52DUVPvC7WY9fO+OxIfcnq5/NpS13txXfUtLdhrQqWVI8DbmLnkK1R2zGk9FPwy6U5jUNRxn6G0QwVGcF08tVuUv+Ez25eisW3OuEciiyboAnI0Fv2hPnZ0yj2tbP6j0Guae4gAk7EL84p+DWfhJl5XnVBzPrAP3+xppYgDUi+qsSDmbVcPjl3yLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(366004)(66476007)(316002)(83380400001)(966005)(2906002)(2616005)(53546011)(52116002)(6666004)(478600001)(31696002)(86362001)(66946007)(5660300002)(8936002)(44832011)(66556008)(31686004)(36756003)(8676002)(16526019)(186003)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nw+FA9V0quQCogrLJQHUcSbnOZf8nWfhKWebMLGO6USqLqhiQ+OIMllK0XqTOdcnw6+L7UABxnEKRrC1inFVy8nQU6QZLuQhvddRO8O4LRXpcV/VEPM0bYDR5ciTrm7Jh2hCdyjiXb15UFoBnFFTXjExTgpPLPPCh2ynsa2okdvdjLdFkZ8vltRyTD+nv34Q+Q+Mo9Oh9rG9kiE0jzL8H0gL8xvCzZwvVzEGUcMg/1Mu1H+oAdz7+w6+219qZpCVq5kHr2f8XtIOuwjnbuaQtYz/1hIl9nJeoQc8u70J/DTCg2BxmUeRRO0MUZ7D+gl0qxeaUCx9PtRUs3m5JTFc/KbVNSYL9L9mAc+mVf4+wLfip9R7DhV5lvqEZqVeFsD8jbf21actaghw5cuOmFLiIhhmGWgk5MqzYTZNa793caVQjU6EMW292m5QBQWCvWrutlK8SZuQ3aAclMH0Za0koJDA8XbuQawtY20kg1kjs4c0GfTk3jKZIGBRP5QC6445f8fLS6w3J4Lu4azK0uejUDFh3UXp0RlwgPNLKlWxwklhsoRmiLiR9eIASeyt0MABSW1cD6OeXLwGtfUANlVms8TzbCWNxB83jK4WkJCcGzhYcJZ1GpHeSApp742pBgM7mncK3tHDej41G84RhOvwZ0Iz4MWyB8ryun/aVElzlWgCeo6L24UNboR/IvyDUz1OBUIa69zpGU9vZmx7kdfB0A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82dfb28-ae6c-4932-9981-08d8555fc81a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 08:01:54.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jE450siT/ZHUCnLgyvmUsTeEqGHSxTrwK5XiT8yOjoSs2h7ig7GhfxaQskaV9k23+wHO7/yXAeodUiw1AbqdaLTT0LJ3TDuOyv57DpUEIYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3106
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10.09.2020 03:07, Khem Raj wrote:

>
> On 9/9/20 1:11 AM, Ovidiu Panait wrote:
>> GNOME project libxml2 v2.9.10 and earlier have a global Buffer Overflow
>> vulnerability in xmlEncodeEntitiesInternal at libxml2/entities.c. The issue has
>> been fixed in commit 8e7c20a1 (20910-GITv2.9.10-103-g8e7c20a1).
>>
>> Reference:
>> https://gitlab.gnome.org/GNOME/libxml2/-/issues/178
>>
>> Upstream patch:
>> https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2
>>
> Do we need this on dunfell too ?

Yes. I will prepare patches for dunfell and zeus as well.


Ovidiu

>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>   .../libxml/libxml2/CVE-2020-24977.patch       | 41 +++++++++++++++++++
>>   meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
>>   2 files changed, 42 insertions(+)
>>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
>>
>> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
>> new file mode 100644
>> index 0000000000..8224346660
>> --- /dev/null
>> +++ b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
>> @@ -0,0 +1,41 @@
>> +From 50f06b3efb638efb0abd95dc62dca05ae67882c2 Mon Sep 17 00:00:00 2001
>> +From: Nick Wellnhofer <wellnhofer@aevum.de>
>> +Date: Fri, 7 Aug 2020 21:54:27 +0200
>> +Subject: [PATCH] Fix out-of-bounds read with 'xmllint --htmlout'
>> +
>> +Make sure that truncated UTF-8 sequences don't cause an out-of-bounds
>> +array access.
>> +
>> +Thanks to @SuhwanSong and the Agency for Defense Development (ADD) for
>> +the report.
>> +
>> +Fixes #178.
>> +
>> +CVE: CVE-2020-24977
>> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2]
>> +
>> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> +---
>> + xmllint.c | 6 ++++++
>> + 1 file changed, 6 insertions(+)
>> +
>> +diff --git a/xmllint.c b/xmllint.c
>> +index f6a8e463..c647486f 100644
>> +--- a/xmllint.c
>> ++++ b/xmllint.c
>> +@@ -528,6 +528,12 @@ static void
>> + xmlHTMLEncodeSend(void) {
>> +     char *result;
>> +
>> ++    /*
>> ++     * xmlEncodeEntitiesReentrant assumes valid UTF-8, but the buffer might
>> ++     * end with a truncated UTF-8 sequence. This is a hack to at least avoid
>> ++     * an out-of-bounds read.
>> ++     */
>> ++    memset(&buffer[sizeof(buffer)-4], 0, 4);
>> +     result = (char *) xmlEncodeEntitiesReentrant(NULL, BAD_CAST buffer);
>> +     if (result) {
>> + 	xmlGenericError(xmlGenericErrorContext, "%s", result);
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
>> index d11b083e8b..90890ffaed 100644
>> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
>> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
>> @@ -22,6 +22,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
>>              file://fix-execution-of-ptests.patch \
>>              file://CVE-2020-7595.patch \
>>              file://CVE-2019-20388.patch \
>> +           file://CVE-2020-24977.patch \
>>              "
>>   
>>   SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
>>
>>
>> 
>>
