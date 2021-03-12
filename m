Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.44])
 by mx.groups.io with SMTP id smtpd.web09.2806.1615515108926537750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 18:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YxUtSH+l;
 spf=pass (domain: windriver.com, ip: 40.107.237.44, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKhND4FYxmqr5ujHtw68+rXRA3fIsXePqwGGxUw/vUN6T/tgu20kE3c6T68ZtXaHdbQIWLZr4Rnv3tMTW6Lf8v6Y/iU2s6UIq+zYea0QPruv74+nHbjNk4rsfyqQhymGEat0tOea63Dk0oo0CT0uiVbb1KRiQ5SEFFzEO8ulS77WH0MEMGSh4+44/mG33NUZbQCZwsojxffjMU82dxVS6bDKM/Idcb+XV6RRjdkZ/iYI8lbOAiTaVUyZErg5aDeTtU22ZaMMs6nht6EPYsY4cJAzAr8eNia2iA0FADlAzTovpBRbJin00B7J27GrPSgsJwAbrbP63qDHtHoG9y2WWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1Iq9v6YYFq5znNPT6jrmnlFMOY8jUr8Z9NvDl2u1i8=;
 b=j88VChvKY+F13RZnXF/PN0XaIdrmbEoyROYoqQ6NogIPS+sQ4+7chw9fR6oMAu8wsZ715yfzGn14fRwHlFLZ7KRRqY/2nUEelvaXlaD4M27lzA+PeKd+9/nJjzIvVxbuX66/atojK0N3WoaYJcA9ldzEd0tQLAE6HSBddpNFHKul+lkdtGO7LZ0QOGenErPmIGkLbxIllQTXHl5wfWKtXMZ+czhy4fCYK7AGsUbuYUO3eOmqf/QDmpc/EnicEopPaDEDcEjOv/UCV/Ok7v0nTQwfYqyUpLEksKPkishg3Od+VBF1NbjhDLeC0sF/2RKR3zgmCMi9xeSKi3kuioRQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1Iq9v6YYFq5znNPT6jrmnlFMOY8jUr8Z9NvDl2u1i8=;
 b=YxUtSH+lB6dUkUI3brzLDODO3Lapy2nyEVCrhl0sc+XQ9KP3fVXswns4l9NLaA5W7fYtZUi1AHs9l2TghfGSMxa1Suy7QKwZ7sHD5LYgwrMpFsa0WNNFmIb0285orMbM1NZAgIGWvugTfRKX4Vc1vzgDiHRodLcn3lRt893BE8w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2186.namprd11.prod.outlook.com (2603:10b6:4:52::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 02:11:47 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 02:11:47 +0000
Subject: Re: [OE-core] [PATCH v2][RFC] distrodata.py: Test to track recipes without HOMEPAGE or DESCRIPTION
To: Dorinda <dorindabassey@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210308211207.6853-1-dorindabassey@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <c9021472-59ad-9511-d9bf-fd9b6d71e109@windriver.com>
Date: Thu, 11 Mar 2021 21:11:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210308211207.6853-1-dorindabassey@gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR04CA0033.namprd04.prod.outlook.com (2603:10b6:a03:40::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 02:11:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 180ef0cf-330c-4646-356c-08d8e4fc30a0
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2186:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB21863BD41415389CB0218194F86F9@DM5PR1101MB2186.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dUZip9F8rot2D2ax+NFQq7ZKiEuYYNTRJMZo4ROqLqmlt0CdCLxprBAgMLqiNthPvu+novyo61gZtVzzQm1QXA27rlS65KkfSx26WeNXB5ZhXwgYZXSknq9dZWYyCA/pE7fCz2bbhTcg09MSfywYLQr1WLp9W5cOTiVUxtBriwamJilsfC4PqMFa/2wQQFzy8ANzTcedOLUjUblbh++iowEIH3WgXhepKAT0/gj5bF2mR18Z5HWi6tlwWQeOSBqBzTWWfywlZse5SY3T3Sa6NfNutqQgzniA8M/DGZAL5a5rbVju0CugQXpaDr6oaKt8yFPMCp9EEFwEbqEZcP5MaGSFDT0AmxQ57eR4RpjfliocTGnx+2D2BrvF71VPLI79X8uDkH8MQXkMHf3HxHaTQledzb0KLYAa2ouLbc7ljKKedNcBDdQcSvsnLvqz8rL4M1z11Aq+qG6mw/Ugj1Vx/25l6So90AnkYGeXw9RWMLmg9jgBTKz9Qf1jIHa5vNWJGerzpmPSLSe7u6dS8iyXPnvbcm43GIsNKY1MWOF8gmucHUu58auFn/oLr69AvXuNhQOP5RVweqGTrcsn8MSycxmxbJx3IZk7jKBSdZea6/HRQ5qvYO629d8bPu9ptmMSEKIEFDWZTYr7vXiHYKs1oUPvDsBowx1VFA9Xf8dI4g4oR7yKkynvTck6RNLJC1YW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(376002)(366004)(346002)(956004)(8676002)(8936002)(16576012)(86362001)(66946007)(6666004)(2906002)(5660300002)(966005)(316002)(478600001)(83380400001)(53546011)(31686004)(52116002)(36756003)(66556008)(16526019)(26005)(186003)(2616005)(66476007)(6486002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eG5Qc2ZjTDdDWFlOcVlLZmpZK1RuVFhxbFNxZnlvS2ZTNVdiSkpHOFMvM01S?=
 =?utf-8?B?K1VxWlhqVG4vZGRBR3d1a2c5bU9DTGw1UXkxalZkWnBsYXE1MmhOUEVQZy81?=
 =?utf-8?B?RStRRzBXRmdJZGlWbXorcy9nYUllUml6UG5yMjJGUGJaWkw0bjM4eU9EU1NU?=
 =?utf-8?B?RXBpazJxYXlXclNQWE5YSFB1Y2xraGNtRGU1SGtrelI2TFZ2UEhMd1FZN0RC?=
 =?utf-8?B?aFB1bUxRZ2NGOFFQNHRSMEFyOGlBTTUxdVcrMy9kTmo5a3NUUHBmQ3cxSnR3?=
 =?utf-8?B?eUt3cnp4TWp0d0hkUGZUMkU5UXhGOHA5dUJTaWwzb0YxUWV5WHRqTDUwN3BJ?=
 =?utf-8?B?d2Q2OC8yak5iMC9HaExYRW5Gc1lZa052UVdXaUlwWHhpYTVnaHFuN1lGeEsv?=
 =?utf-8?B?SGFXUnJpZEJZdTFzS3Y2cEJsOGR4YkVBajVOU055K0NFMmczRERya0lFWWc3?=
 =?utf-8?B?VXNQVzZtRi9vT1ZNY0JmdmlGS3VmUkhpUENXejYzMkxzK3Y5MnVmeFM3amhK?=
 =?utf-8?B?cy9KWkRNS2k4UktWN2VxU3lJeFpYTldIYW1ldTBKQ1N1dFhMMmFLcUo2QlNj?=
 =?utf-8?B?dHRSdUVKREhrTktlRG5yWnFwUXBnRkdJQWhPY3RkL0ZxcjFkUUJwMEhYOUpo?=
 =?utf-8?B?eUlmUzZVQURTK2NTMXpaM2d2YUxlK3NGSGxobXoyOUdOcVIyZE9zNG1rT09Y?=
 =?utf-8?B?QUJuR3FLNWs4UjVmZEhUbWtOMm1oTXhrMnlZU05yZzZncnY2cUhueG9pMWtO?=
 =?utf-8?B?eE9LVTA1V2QyV3EveUtHU2J4dTVvT3VVeGJiS3Nna2Vpc0VsSnRSWjVRS3lM?=
 =?utf-8?B?Z09WU2xjUk1QdjVzT05pUjFSd1djRTZFQWtQb3VCUmp4UkR2eUs5RGhROFd2?=
 =?utf-8?B?dHdLVGg3NEhCcDFIQjlSTHZSYnJ1MkF0YXNBZ005cFJUOGN0bHNFNlVSN3pt?=
 =?utf-8?B?bE8xV2MvdUFOcWFPY003dXB5dHdId2lhcnlDYlZxVjR4RzFZdjJjY0FyWmxQ?=
 =?utf-8?B?aUdPRkdnNXhLM1FWd1FhQ1BiU3dvWVIvL29XWjhLVEhpTXhpSHdmaTNSWGcz?=
 =?utf-8?B?U2pERFArdVRydmxTQ1N0VTU3dUVpMHo1My9zYXpIOXdHQnExL2F5TEJ5T21l?=
 =?utf-8?B?ZUx3VTNna2taQjVSY0xNTzdDbzBWTVNUYUNHY2lYYnN5czhRYUoyT0RNdy9J?=
 =?utf-8?B?VUIvM0JKd0V4RkE0QUdHa2tqWExqRlMvaE9LZHY2Q083QWhUN2hhd2lIbzRo?=
 =?utf-8?B?OEVHd2h5NDh5TzMvMUhUTEh6MGxzYzRTOXIvcHpQQXhNTklaTllwNEtwWDJJ?=
 =?utf-8?B?ZmtMQW1DYitkdCtlOXJEWUV0aTNnY3pRZTFNSHhCVzJXUEZVdUxEbU4zb3Qw?=
 =?utf-8?B?UUx0ZVdVYkxDa2Y0U2ZTQm1MeDNJdFRTTmNSNVd4NWluWkpDY2N0SFlLa1NW?=
 =?utf-8?B?R21XRVZkVlRQYnZJbW8rQWpUbHdxTFFrdXpQeEpETm04MUdHMU5BcWVaUmRq?=
 =?utf-8?B?cUdjREwvaXNsTDRRZXNQVGcyRGtaOEZ3ZjRRY21zekRyZlpBNVFVMFRjKzRn?=
 =?utf-8?B?ckMwaWM5VE1BZytaODdxTXJ3STVray9KSE5YWVI3SjB6Y3JqVG5ob3VGY2l2?=
 =?utf-8?B?Zy9FSE5EQy9CZ2VaUDBKYjVsUXMyTGVuWFJMZzZTd3hsb1YzR1Q1b2VtbGpm?=
 =?utf-8?B?b0ZDZnNLVkVab2hlNmZpTmxjSnBmMSszVWJETksyeW5iRzJoZG1nR2Y1MjZ2?=
 =?utf-8?Q?SA21CW+7p9C30R+C3oaVJo37GhUMGnOPSxf1QC9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180ef0cf-330c-4646-356c-08d8e4fc30a0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 02:11:47.2831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KodXJoO2UmXHJBpTRF7z8HThHZTNQskGq666SoKNubzWCKqUe+PwROjGWlhom5a9Z6nu4D3fCApw+DaXABv8b3Y+buO5KJ55doMAbubzLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2186
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-03-08 4:12 p.m., Dorinda wrote:
> This test is to keep track of recipes that do not have a HOMEPAGE or DESCRIPTION,
> with exceptions to recipes whose SRC_URI are not linked to external sources.
> 
> [YOCTO #13471]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v2:
> -Changed PN to BPN
> -Used set() instead of lists
> -Changed condition for checking recipes with missing DESCRIPTION
> 
>   meta/lib/oeqa/selftest/cases/distrodata.py | 36 ++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
> index e1cfc3b621..633bf25dc7 100644
> --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> @@ -40,6 +40,42 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
>   """ + "\n".join(regressed_successes)
>           self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
>   
> +    def test_missing_homepg(self):
> +        """
> +        Summary:     Test for oe-core recipes that don't have a HOMEPAGE or DESCRIPTION
> +        Expected:    All oe-core recipes should have a DESCRIPTION entry
> +        Expected:    All oe-core recipes should have a HOMEPAGE entry except for recipes that are not fetched from external sources.
> +        Product:     oe-core
> +        """
> +        with bb.tinfoil.Tinfoil() as tinfoil:
> +            tinfoil.prepare(config_only=False)
> +            no_description = set()
> +            no_homepage = set()

Since the other tests in this file such as:
     def test_maintainers(self):
uses lists rather than set()s:
             with_maintainer_list = []
             no_maintainer_list = []

             missing_recipes = []
             recipes = []

Maybe pick one data structure to be consistent.

If you decide that set() is better then make a separate commit to
change that. Apparently sets are faster for some operations:
    https://stackoverflow.com/questions/2831212/python-sets-vs-lists
it would be nice if you checked and documented what you find in the
commit log since these tests do take a few minutes on a lowly laptop.

The rest looks good to me. Drop the RFC if you send a v3.

Thanks!
../Randy


> +            for fn in tinfoil.all_recipe_files(variants=False):
> +                if not '/meta/recipes-' in fn:
> +                    # We are only interested in OE-Core
> +                    continue
> +                rd = tinfoil.parse_recipe_file(fn, appends=False)
> +                pn = rd.getVar('BPN')
> +                srcfile = rd.getVar('SRC_URI').split()
> +                #Since DESCRIPTION defaults to SUMMARY if not set, we are only interested in recipes without DESCRIPTION or SUMMARY
> +                if not (rd.getVar('SUMMARY') or rd.getVar('DESCRIPTION')):
> +                    no_description.add((pn, fn))
> +                if not rd.getVar('HOMEPAGE'):
> +                    if srcfile and srcfile[0].startswith('file') or not rd.getVar('SRC_URI'):
> +                        # We are only interested in recipes SRC_URI fetched from external sources
> +                        continue
> +                    no_homepage.add((pn, fn))
> +        if no_homepage:
> +            self.fail("""
> +The following recipes do not have a HOMEPAGE. Please add an entry for HOMEPAGE in the recipe.
> +""" + "\n".join(['%s (%s)' % i for i in no_homepage]))
> +
> +        if no_description:
> +            self.fail("""
> +The following recipes do not have a DESCRIPTION. Please add an entry for DESCRIPTION in the recipe.
> +""" + "\n".join(['%s (%s)' % i for i in no_description]))
> +
>       def test_maintainers(self):
>           """
>           Summary:     Test that oe-core recipes have a maintainer and entries in maintainers list have a recipe
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
