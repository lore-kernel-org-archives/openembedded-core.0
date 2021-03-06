Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.98])
 by mx.groups.io with SMTP id smtpd.web10.13134.1615065033832880103
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 13:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=pS8QtWK3;
 spf=pass (domain: outlook.com, ip: 40.92.74.98, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9nuPfOu/LBuXpc1AUa0Nyb/rrqJsJ36bJ58LuhHqk8PoPLHtWIayXsNjsFARiEVGku5NCtS02sJ2Byi+PWVSZI68U5TIyDQMizicCYokL4KE/DP+7RXRSyVZPf2XwCI+aK7ynmmJoEI/+hRy3RNxji73IRPI8lQpQkZlkISTJ9aPQGBF2ghCV0+r9/1xwbwiFpnABEzYBKY7Ss0GkRzrYgM/ppUWWsMwzq/jn53zHLa413orzDdo46r4DKB24L9jvkEKnpJ3sy6M6eOkZybQ9hQpbK7ApyE1TVsHMXsxUQTj1ee9bV8JYiawUCVbHIKY0xnSDepOVrtGBA92ukjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szyY4ePKXKVzA0ixbMFQ0db4Kqy3XFoNAGkY/t7NgPc=;
 b=WxGpuMezGS1tcNEAZwa4q63mt1pPdfus1DKhDkzazkRjPC2Y6i0iEE8BzsBMoNqkbakZNqkSag/TnWqQyljh3gTaHzUfkNA0VqJYJcqsUHt/8rcaO2PpToKtnEE1Ny4q1rcJfdK7U0ZQc7kRoZAKN/loYqm0YF2wGCdI/Jk1uw6M+/TDqoympYVn77k8M2OsmJe7NEmjQT40MTrMceZK2Nf6iAae9OfVpcqgjcUj/EDn/bif+I/kjyHQNyq5Mu1/0AwmLNOyt2f3NBmc0llllGL8LbawO+wQduUEMufdC9kj0k0hZXUuVZsY9JH/lhISgupN19PNG2Irbyb1kvZOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szyY4ePKXKVzA0ixbMFQ0db4Kqy3XFoNAGkY/t7NgPc=;
 b=pS8QtWK3wV/103Am/KQuGdDHdr28Ak1pj6/WIqrtij3rWABsWbcO7pTGAte02mb1dLnfCXQvwESIEoyx4YYuC6gyEugSEZwa89xN5TfoLyratvCB0dNnKlom7NNwbhv2eM5vcauk6CD5RfcDZ9hD6dGtNnB2KhUCKnOOkeFQ5C5u1QyHJ0rBQ7vQ/x9+d3oL5CHpLIz6ZdTO9+gvNuO50cSMhnuDSox4WlUeeXBU8u1VgZRT2vtwqWkqoVHHUdGpoxQyNVFD0/n916fkBK66E6mSwEJUktZufkHrYqRGQhCMkgRxD+GGhyji/cw+UjrigiGZMiCDT1Lxq690592ptw==
Received: from VI1EUR04FT041.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4b) by
 VI1EUR04HT043.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::443)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Sat, 6 Mar
 2021 21:10:31 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0e::4e) by VI1EUR04FT041.mail.protection.outlook.com
 (2a01:111:e400:7e0e::346) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Sat, 6 Mar 2021 21:10:31 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:B37ABD6D8E26AB6E8CB9C68C4F17F02D549AFF206BC0769FE80D7ED0ADC0AF74;UpperCasedChecksum:10A4E19CD6F786D3EDCE78D502BD778E1191966AE317FCC5ABD3A2FEFB34CE11;SizeAsReceived:8687;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4%4]) with mapi id 15.20.3912.026; Sat, 6 Mar 2021
 21:10:31 +0000
Subject: Re: [OE-core] [RFC] distrodata.py: Test to track recipes without HOMEPAGE or DESCRIPTION
To: openembedded-core@lists.openembedded.org
References: <20210306205320.28581-1-dorindabassey@gmail.com>
Cc: dorindabassey@gmail.com
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464269F1F1334AFA87C645B6A8959@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sat, 6 Mar 2021 22:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210306205320.28581-1-dorindabassey@gmail.com>
X-TMN: [V/to4OvWOg7FZI4pBjD2qAR1z8f53e/Y]
X-ClientProxiedBy: AM6PR0502CA0053.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::30) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <b37aad1a-e6ed-f33e-8abe-9e19cdd32577@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (79.215.0.70) by AM6PR0502CA0053.eurprd05.prod.outlook.com (2603:10a6:20b:56::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 21:10:30 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5e071e9e-88d5-4d07-2784-08d8e0e44645
X-MS-TrafficTypeDiagnostic: VI1EUR04HT043:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bPR2ufF3lubDyzYdvmdKcAoisgMPagtueXE0dJ5QRMv5jSVPIzCvbgRvFr4YgdNdUA1Qhut8DXN5LAM+Mr6IdBpMF0aYDHGRCwXncG31mS3Vmq9sk3gElAq/Tggk8E7BY5kjrOLJZ73SRUfhB0COu4RUagqWDsxZweddHWasDhncjCzrf3ANxl9GdvXtWgRJ1w9nKveJcQr2AJjSGTvm/QgbCwkT6H9l8epUpmILWFIzcWZuF1QY+1nUNWmjrfbT7EkiZO3DsG/csv7Er1YMZO6uWuMsYTXZE6h8n7/BBoBvPitwBy6df0nm1TYzHPZbwxoiAnXElNUk+xvKNlYn40yTsfM5VyEP90wUcszcA9bpWhhSeu4AR79WCA6mxNuP8C0ArCJ3GsLv8Yuu+7mCaLFoisTBG+Yseu6I4e9Y5rkY9Uq33P+504ordMpkvfy8
X-MS-Exchange-AntiSpam-MessageData: 
	s2JY0ROShBnRaZ8boRHMdaOGS/Om7yLvNFxndVTITb0unkBSfNUoT8CgWl0iOitPcXEKrQvh0QCtkyHWKDZTZe4VaBbDK2JEH7c4TIFEmAcepYDfWva2xm6KEqYzkJZKBMJm5guJhlCm43WnMn8a7A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e071e9e-88d5-4d07-2784-08d8e0e44645
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 21:10:31.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT041.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT043
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

some nitpick below

On 06.03.21 21:53, Dorinda wrote:
> [YOCTO #13471]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>   meta/lib/oeqa/selftest/cases/distrodata.py | 34 ++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
> index e1cfc3b621..d8df0b530c 100644
> --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> @@ -40,6 +40,40 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
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
> +            no_description = []
> +            no_homepage = []
> +            for fn in tinfoil.all_recipe_files(variants=False):
> +                if not '/meta/recipes-' in fn:
> +                    # We are only interested in OE-Core
> +                    continue
> +                rd = tinfoil.parse_recipe_file(fn, appends=False)
> +                pn = rd.getVar('PN')

shouldn't it be BPN, otherwise we would get the same warning for 
native/cross/nativesdk and target configuration.
Also I would advise to used set() instead of lists for `no_description` 
and `no_homepage`, just to rule out any double postings

> +                srcfile = rd.getVar('SRC_URI').split()
> +                if not rd.getVar('DESCRIPTION'):
> +                    no_description.append((pn, fn))
> +                if not rd.getVar('HOMEPAGE'):
> +                    if len(srcfile) > 0 and srcfile[0].startswith('file') or not rd.getVar('SRC_URI'):

`if len(x) > 0` is a bad pattern - a pythonic way would be `if x:`

> +                        # We are only interested in recipes SRC_URI fetched from external sources
> +                        continue
> +                    no_homepage.append((pn, fn))
> +        if no_homepage:
> +            self.fail("""
> +The following recipes do not have a HOMEPAGE. Please add an entry for HOMEPAGE in the recipe.
> +""" + "\n".join(['%s (%s)' % i for i in no_homepage]))
> +        if no_description:
> +            self.fail("""
> +The following recipes do not have a DESCRIPTION. Please add an entry for DESCRIPTION in the recipe.
> +""" + "\n".join(['%s (%s)' % i for i in no_description]))

the currently valid edition 
(https://www.openembedded.org/wiki/Styleguide) of the the style guide 
claims that DESCRIPTION defaults to SUMMARY. So I personally would 
rather check that SUMMARY != DESCRIPTION in case DESCRIPTION is set - by 
default DESCRIPTION isn't mandatory IMO (or the styleguide needs to be 
updated)

> +
>       def test_maintainers(self):
>           """
>           Summary:     Test that oe-core recipes have a maintainer and entries in maintainers list have a recipe
> 
> 
> 
> 
> 
