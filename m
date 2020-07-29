Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web10.7635.1596034073992648602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 07:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Q9PghEI3;
 spf=pass (domain: arm.com, ip: 40.107.20.41, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLQYCufIYdJCcVv0ipP04i1+rDxwrpVvs8OfzJMYckA=;
 b=Q9PghEI3CauxCNOmUl4FMrJExMS1DOF72vknZJdEZr2wGOkEimG7ISP6eMHWDgB3gsJNa+JpATHJCR94hujJW3HEWgkfRSudgSzxHDmo10PK48jHswa7b43rKA1hl0Dm7KdeXPs+DQ4X9mxDqAnbbT4bq/SIBPjVA/7cbeqtf8o=
Received: from AM5PR0601CA0054.eurprd06.prod.outlook.com (2603:10a6:206::19)
 by AM5PR0801MB2081.eurprd08.prod.outlook.com (2603:10a6:203:4c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Wed, 29 Jul
 2020 14:47:51 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::c) by AM5PR0601CA0054.outlook.office365.com
 (2603:10a6:206::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Wed, 29 Jul 2020 14:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 14:47:51 +0000
Received: ("Tessian outbound 73b502bf693a:v62"); Wed, 29 Jul 2020 14:47:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1a63141b3064bcf
X-CR-MTA-TID: 64aa7808
Received: from 8130f00f0656.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6D56C5B7-FC02-4832-8AEA-D64975B097D4.1;
	Wed, 29 Jul 2020 14:47:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8130f00f0656.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Jul 2020 14:47:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eI3sJKbdyqYe8OdN3s28ZjrYpEOI7ZZ/1t2UauQyXzDs+op326jZydiDsuQrZt0e9YepA7V1/ofEBA2IPfDnu2GZkp7pLTEbH8M0dlgr9nTXppXRcHUlmcMvkK3QjMoZ4MMW8a0N0vWSE0LudDkMtnJFzH+nRKJEhTsuezFgmO+ufxl/oyLlBLS1BApLHz2tltlCIpl5jRCS9FETbRNtZx7PwHqhCFnMR5DT0neeWBRoA01eVFKzLolS62OvTyaURvTlfrX3oHaBJUqhiyoTLwEj1+IwzOuIYgyrPOCycpsWCMAh2/6FAlRhsLIY6PCXCOPdIuL2o78ytLJ6khHPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLQYCufIYdJCcVv0ipP04i1+rDxwrpVvs8OfzJMYckA=;
 b=N0flfU0UlwttfbW47+0UygfVYmkj0gugJ5AxR5E9nxURBWx5hROrJThnxqvPITsjaTI3D73BJ6FK9gH/KTjQ05RDOpeTh8jrU957zOXMZQni90MCAKtBNbR5aKzy9pdDPFx4Pem4tGChPJ+2qomHSpqbwStT3iotHwpr6Eg7Rg+WnM8WqkGUoQVHCB1zdaqVFYu8OOJh3Zee+So/QTt7VW86ekRAhxpq0e4WHRdwhMLl6ty9jOiOJoIYx7hHLLSmMHjMPYjoeb+BhFdnmdiOBxruAQ8b/CdrjcvuHM5UmSq/c/20Z/ddW5JZGhSyjBrGHVuN+N/q78Yle+M9s9PL4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLQYCufIYdJCcVv0ipP04i1+rDxwrpVvs8OfzJMYckA=;
 b=Q9PghEI3CauxCNOmUl4FMrJExMS1DOF72vknZJdEZr2wGOkEimG7ISP6eMHWDgB3gsJNa+JpATHJCR94hujJW3HEWgkfRSudgSzxHDmo10PK48jHswa7b43rKA1hl0Dm7KdeXPs+DQ4X9mxDqAnbbT4bq/SIBPjVA/7cbeqtf8o=
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB8PR08MB5388.eurprd08.prod.outlook.com (2603:10a6:10:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 14:47:45 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.017; Wed, 29 Jul 2020
 14:47:45 +0000
Subject: Re: [PATCH] oeqa/selftest/imagefeatures: Add testcase for fitImage
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com, Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200729144118.21411-1-usama.arif@arm.com>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <c5e2f0fb-6353-77e6-3cca-37fd9cc84d54@arm.com>
Date: Wed, 29 Jul 2020 15:47:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200729144118.21411-1-usama.arif@arm.com>
X-ClientProxiedBy: LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::32) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.52) by LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26 via Frontend Transport; Wed, 29 Jul 2020 14:47:44 +0000
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6256147-588a-494a-6c52-08d833ce5e70
X-MS-TrafficTypeDiagnostic: DB8PR08MB5388:|AM5PR0801MB2081:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB20818327455EA45480BB6CF692700@AM5PR0801MB2081.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:446;OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JEVnw1zVu1YGcmOojPSo0lYNPLsWIkrc9INZ2rREo2bT2WYdepnLCSgBFZ16O9JwED9MctFu2vAkpar21kzbrQqOuDNBPm1kaHr79xiWRXpzzFS3GpLU95VBjkMv+CBbwbI+ygnSq378qJQMcbb4k1hOUpd/3iElo6iADX1pJEpPqVLHMXvVKO2tX0g2WExaBpXpBWrJb97InuIDN/pvhZU0zihbtcgahD+pIQMersN4PbmXHm2EDC6MQTLA6eDj/HSTWBMpCsHvZn5JWtd3nlFU2leuVRs6Y+2Mp3eHggHgfWqV/jzQJYz2z4tGXLoDZLKA9SYLJPNuJrkNBvEipPVnqbKLOKrzeC4Q5JEAWAq/FL+zBY/1F8hCyDD/0O84PxS24TvIlaHkgcR9HN698OWMG+CK9jDSnagZeUwjdU1R2d+wdC9HIQEh0nGDtJySpmtCzQ+/Ib0DQBi02JkPow==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(31686004)(6486002)(16526019)(478600001)(5660300002)(36756003)(83380400001)(4326008)(2906002)(186003)(8936002)(52116002)(44832011)(966005)(16576012)(2616005)(31696002)(86362001)(6916009)(956004)(66946007)(316002)(66556008)(53546011)(66476007)(26005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 eRD4EjkV7wVU22Um/jnAnpBb2/QAxJawBmoD8ebc0mSfL0LrOAJd4cOQWmKuFYtjA4CqCvI0NSkJi6ThmHPne/4X9Q3w8tFWc+QN1RyhYkxwl41JMgRNyRYE63zCv1tx2pw0MCbEKbypmnpeicX9UoichyLTLHKtOl24qXY5vG6puA1VVR4EkDiu6gzzTXWvmI7YOzVIoNiSDHuV/ADr8q+s1TlD5yB6xhotAkLcNAdyDGbIH3Px7ba0dfHOsjXgqfzzFgdNXXWKPREtOEo1LEVdk7s34ARg8tgjrf0ZhNks+OuMUNkVu83WVAcwZT0m5RQZ25YsiutmpOPkZMkQQd+EX/QV8qYn/eZkcKHwTQD9x2vkjjPmSutvpJZUrdCBQbdr7mDfH/I2Y+5DuI4CPNu0PSKYG9calq0HrtmX7woK39q7rZ7h+QPfeisxb24kPiC8jq5tp72/HoqdmOOIB3fWHer9FEG9GZR03GWUxKfcrEnetwk5LVWOMfyc7/xN
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5388
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a047e37-888d-46ed-20f4-08d833ce5a8a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XUR9gmKwq7O8X33Wgpdf5ZSNBVFSHdqJ/QYtB867WVdfXk/MVPYoRIvzilYGkLi5qnCv2JRwGAXNEB+6pM2exSAubmpr79sDjM6mQ9taUN3z8lBMiu/R0/rKVuDoCnmtduFR56szAYJb9aI6zpCp6DOIFM/gof5Fa/HpB9c5coxXsUfM38QabHxRTraQHD1rdIw6/MeEfZnIiRfYg2e7gKXaBoL2pGX1o/CRGhHG0P2CLZz57muI8wuHJWCmNNmG5pubV+YW2ecxpWdrQLyPZDXt8E/pXacljtx0fpA2WczTlDGtlVJfiLmT/L6iuH/UZvmpU6aDUZo9SvBzKhkzc/Hr0msUP+XLsX08Fo4Lzkp90rEi2pEtoblXKSUYIhiPlP2DidaIYHDYfjKaTgDGW2Wp76WuyXzSL2qpZV9UxRsac1pTPGvDHzj4/7UqaqGOAq4XFl3FiwPfc30rRWs042XVvLJUyo8YdC840ySFjdmNnYiNgyRR4L2Zy17NSm3V
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(46966005)(2616005)(47076004)(336012)(107886003)(8676002)(44832011)(83380400001)(82310400002)(36756003)(5660300002)(31696002)(82740400003)(16526019)(53546011)(186003)(86362001)(956004)(81166007)(356005)(16576012)(316002)(36906005)(26005)(6486002)(2906002)(8936002)(31686004)(966005)(70206006)(70586007)(478600001)(4326008)(6916009)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 14:47:51.3041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6256147-588a-494a-6c52-08d833ce5e70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2081
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 29/07/2020 15:41, Usama Arif wrote:
> This testcase generates the Image Tree Source and
> the corresponding fitImage containing a kernel and
> a ramdisk. It then checks if the these files exist
> and if the right fields are present in the right
> order in the Image Tree Source.
> 
> Tested with: oe-selftest -r  imagefeatures.ImageFeatures.test_fit_image
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/lib/oeqa/selftest/cases/imagefeatures.py | 74 +++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
> index dea519e6df..f7a2533746 100644
> --- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
> +++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
> @@ -263,6 +263,80 @@ PNBLACKLIST[busybox] = "Don't build this"
>   
>           bitbake("--graphviz core-image-sato")
>   
> +    def test_fit_image(self):
> +        """
> +        Summary:     Check if FIT image and Image Tree Source (its) are built
> +                     and the Image Tree Source has the correct fields.
> +        Expected:    1. fitImage and fitImage-its can be built
> +                     2. The type, load address, entrypoint address and
> +                     default values of kernel and ramdisk are as expected
> +                     in the Image Tree Source. Not all the fields are tested,
> +                     only the key fields that wont vary between different
> +                     architectures.
> +        Product:     oe-core
> +        Author:      Usama Arif <usama.arif@arm.com>
> +        """
> +        config = """
> +# Enable creation of fitImage
> +KERNEL_IMAGETYPE = "Image"
> +KERNEL_IMAGETYPES += " fitImage "
> +KERNEL_CLASSES = " kernel-fitimage "
> +
> +# RAM disk variables including load address and entrypoint for kernel and RAM disk
> +IMAGE_FSTYPES += "cpio.gz"
> +INITRAMFS_IMAGE = "core-image-minimal"
> +UBOOT_RD_LOADADDRESS = "0x88000000"
> +UBOOT_RD_ENTRYPOINT = "0x88000000"
> +UBOOT_LOADADDRESS = "0x80080000"
> +UBOOT_ENTRYPOINT = "0x80080000"
> +"""
> +        self.write_config(config)
> +
> +        # fitImage is created as part of linux recipe
> +        bitbake("virtual/kernel")
> +
> +        image_type = "core-image-minimal"
> +        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
> +        machine = get_bb_var('MACHINE')
> +        fitimage_its_path = os.path.join(deploy_dir_image,
> +            "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
> +        fitimage_path = os.path.join(deploy_dir_image,
> +            "fitImage-%s-%s-%s" % (image_type, machine, machine))
> +
> +        self.assertTrue(os.path.exists(fitimage_its_path),
> +            "%s image tree source doesn't exist" % (fitimage_its_path))
> +        self.assertTrue(os.path.exists(fitimage_path),
> +            "%s FIT image doesn't exist" % (fitimage_path))
> +
> +        # Check that the type, load address, entrypoint address and default
> +        # values for kernel and ramdisk in Image Tree Source are as expected.
> +        # The order of fields in the below array is important. Not all the
> +        # fields are tested, only the key fields that wont vary between
> +        # different architectures.
> +        its_field_check = ['type = "kernel";',
> +            'load = <0x80080000>;',
> +            'entry = <0x80080000>;',
> +            'type = "ramdisk";',
> +            'load = <0x88000000>;',
> +            'entry = <0x88000000>;',
> +            'default = "conf@1";',
> +            'kernel = "kernel@1";',
> +            'ramdisk = "ramdisk@1";'
> +            ]
> +
> +        with open(fitimage_its_path) as its_file:
> +            field_index = 0
> +            for line in its_file:
> +                if field_index == len(its_field_check):
> +                    break
> +                if its_field_check[field_index] in line:
> +                    field_index +=1
> +
> +        if field_index != len(its_field_check): # if its equal, the test passed
> +            self.assertTrue(field_index == len(its_field_check),
> +                "Fields in Image Tree Source File %s did not match, error in finding %s"
> +                % (fitimage_its_path, its_field_check[field_index]))
> +
>       def test_image_gen_debugfs(self):
>           """
>           Summary:     Check debugfs generation
> 


Hi

This test assumes that the case for a single kernel and single
RAM disk with no dtb is supported by kernel-fitimage.bbclass.
https://lists.openembedded.org/g/openembedded-core/message/140810 adds
support for this combination of usecase and the test wont pass without 
the usecase being supported.

Thanks,
Usama
