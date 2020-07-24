Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.63])
 by mx.groups.io with SMTP id smtpd.web12.1029.1595573231087846762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 23:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AKe20DSl;
 spf=pass (domain: arm.com, ip: 40.107.21.63, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mddspOM2A58Re6VTzZaz2QB6mzTC+fRJBw8jvuA1NJQ=;
 b=AKe20DSlgp+kYQa6+fNeBTS1GC6aIeqUyUDaZqV7XHZX8INoItktBiToSw56a0CFiz04/uoyYsbYxO3umBMdAK8d3GfCGqYfrSsor2lG6ZX2Vud13dChr7MDbtY3n4+v13gYdzZJiY8ddF9jnTz6kvKR2cIN6YKOlNdzjtSibTA=
Received: from DB7PR05CA0068.eurprd05.prod.outlook.com (2603:10a6:10:2e::45)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Fri, 24 Jul
 2020 06:47:08 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::bb) by DB7PR05CA0068.outlook.office365.com
 (2603:10a6:10:2e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24 via Frontend
 Transport; Fri, 24 Jul 2020 06:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Fri, 24 Jul 2020 06:47:08 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62"); Fri, 24 Jul 2020 06:47:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4c964498d09dee1e
X-CR-MTA-TID: 64aa7808
Received: from d66152e66f4d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4685CD15-0555-44B4-9E94-28C741832859.1;
	Fri, 24 Jul 2020 06:47:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d66152e66f4d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Jul 2020 06:47:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLRo4LZPy0EKaQ/Tc6MBMNNNVBsy5Kz8xn9QBsQ8ofx4XWEa1LqqvpVJ+LKAmF8CP8cPbFylqvW7L8iVSMXPU2KQ4sJzDQoSi2ykS9/lJHDFKAOHWlfN4waItj87O7pYGleYUh44aVC9HvlURsVmyFmvqyNaC9VrqgoON1UXuoRCMxa4nwGNftiXWG8TWUVMkHyle8dV+3anuLeIBgGp8wYyF/MLKJyar5ngde2d8164K4pCKMDLjsO7Napa9n98HQkH+G/u2P6t1An+G2V7FWCDu4/2KYLjyKZ4VfnML5yElog+HQ6K9RBmIVYfAC0aed7AkaDfe5PCXW2Bzh2UUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mddspOM2A58Re6VTzZaz2QB6mzTC+fRJBw8jvuA1NJQ=;
 b=RJj7Lw1VvzyfChJxzvyNX0N1ULfQiBlcpzUqZgEQsfj6caDjVUUKyjVae4rtXfFdmMSpk1lf7ihStEFgae3p2yLjF9sroIJyw3JlYAG4l1Eztqi8Q3P/Dn2388F8GSvkHnQb1Inc9hxITGw988d9izewWvxsq8opQMnrlb6ZFmEFItpQu4Xwql6KKvzBlXTXZbpBkMgI1btzaLF/rQLo5Cx38nvM4QNkqwvnxJA6j4DVmJRGUO4mu3wIYFaDYNU8EtrELdpEz6l897EtO0ldxozt6BzIBzoix2gPLzd9OlA56p1ghR6tmHe+9sbMDWegGY5bMhOWrPxbNdGAfF43PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mddspOM2A58Re6VTzZaz2QB6mzTC+fRJBw8jvuA1NJQ=;
 b=AKe20DSlgp+kYQa6+fNeBTS1GC6aIeqUyUDaZqV7XHZX8INoItktBiToSw56a0CFiz04/uoyYsbYxO3umBMdAK8d3GfCGqYfrSsor2lG6ZX2Vud13dChr7MDbtY3n4+v13gYdzZJiY8ddF9jnTz6kvKR2cIN6YKOlNdzjtSibTA=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB6PR0802MB2263.eurprd08.prod.outlook.com (2603:10a6:4:86::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 06:47:01 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.024; Fri, 24 Jul 2020
 06:47:01 +0000
Message-ID: <c346fa31f01d1a889f8054cec153c9d791721fb4.camel@arm.com>
Subject: Re: Fw: [OE-core] [PATCH] wic/bootimg-efi: Add support for IMAGE_BOOT_FILES
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2020 12:16:57 +0530
In-Reply-To: <DB8PR08MB4969882A75AE20A8E92E93BFFA770@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200723095150.18257-1-khasim.mohammed@arm.com>
	,<BN6PR11MB006610995289E54741817379B9770@BN6PR11MB0066.namprd11.prod.outlook.com>
	 <DB8PR08MB4969882A75AE20A8E92E93BFFA770@DB8PR08MB4969.eurprd08.prod.outlook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-ClientProxiedBy: LNXP265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::20) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.37.8.54] (217.140.96.140) by LNXP265CA0080.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23 via Frontend Transport; Fri, 24 Jul 2020 06:47:00 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b25b33e0-6253-4e0c-8f6a-08d82f9d62be
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2263:|AM7PR08MB5399:
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB53993F887096EA4A40959682FA770@AM7PR08MB5399.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:843;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ciMjcsU9bdstnPwu9pA2LpCF32ZatryNZR0CLcWlU7LO3Hv7hP9KiVxOwBWe+/Z4K8hfnSDpYCgkAYDyH+fgZvmd0akpBrbajlY5goVgWoQXpgjxbGtTA5x7cazA7zlLJYyojyBL1BhlXQkcqH668Ma9GiOynNLK3Xz2FabD2t+F0HKIv/nKMd4e9V7AvzVsuJyaE25j+OK9Id7Z8istk4ZKFtMC1GwthDfkWaZtkU4X5dn4GaAWjI+iYjLsP/WHVHDJdp6vFKkCFIGCEHOrEoQIs650jKiwa/LQVgrOTaQALDGFukywH1+iNIgROZRwRzp/TfALrZWwCGRWrFcDomwa5K5HSWxSaGnv0lOuuocMP+J5YkGNYbz2k7NBbMf1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(5660300002)(53546011)(8676002)(2906002)(186003)(8936002)(478600001)(16526019)(36756003)(16576012)(316002)(52116002)(86362001)(6666004)(26005)(6916009)(6486002)(44832011)(66556008)(83380400001)(66946007)(956004)(2616005)(66476007)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 KjshyAHIV1++Ada+Sj0g4S+kOlNlXSQSdJ+Vddju9gDbO2XDIl5501gNx+uhBhlyfqGpT3DJyeWIAWbS6eEV8ecFShbIhY+Qz93ab0n+nXEwQ/IWmNxsfjtbf2JUogqgBlNXpmIBygBGCSeuGRScoqzA+2WyvuJNvk6DI+Gxi6RiX+4U46QeVeTTwW+F7vFi2PAZ7bj6/+vstO9xErIhaEpVrrmhPA9IwsR+GGjAlcFV/Rr9QhWH1jTKMjZI9ztJU0muwW6vwApqYnAdHWMfObbNx1bNV74/Xu4XWXYYZ75Ti1lLuduLMwC5S1GpW95i9efHLDs/QLvPhhpkQf/Ewu4nuC9buJGLBa9Izr2WGJ5w5UgnRxeVrcZRGWXYldGeQbSOSVkQG6X39vn9N44V/W6sUZ9uhrQvRBSH9ZNCJInGFbh6QA/gYK/xMn4JesggqiAi+HAs6UmKfk9C2T2HS7DD6S67AS7jruT0gd0G5HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2263
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bdbc5e81-0ad7-4c2c-be83-08d82f9d5e97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	npUeELkI0cp6u/IittxAeS+Bj3vze+x1ZBFhrQDjVKuZUkSsqc7n1ZI031ktaw6UYY6wWyOr+HwvPI4NBe06F7/npFVJiA8RqEOFwYOHFGAuReUsSJrM5ItBKGEZktQxSTQBNEWVY0RXd3txG3cGrzIDObN34zhhRIsO0zkhHauXCyqYS94Y31HUpArQxYXfhVf2c4HCvvB1jP2zqWyu/1qY9/WLvxanm7uRtDlDq1W/T+NxnAQ3IYATwg70lkY7eYvW8Q78KC45sEs7uJzoMz+R8ee5uUMZ1ZhaSNuubYu9+Q5f+O0JdjE7drQQHki4fnmAp68F/1VEWR3xOVXpv0Tymw0Mk7mFqa9a3FsOe4ScJsXPUIPp3f2EqJGBK/UsvV2VJ+B79Qcl48NNM3GqzSZ0Eq/wj2Bz3jey+Tqv1iU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(47076004)(316002)(956004)(82740400003)(44832011)(2616005)(82310400002)(356005)(6666004)(16576012)(70206006)(478600001)(81166007)(5660300002)(2906002)(83380400001)(70586007)(186003)(86362001)(6916009)(53546011)(8676002)(8936002)(36756003)(16526019)(26005)(336012)(6486002)(99106002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 06:47:08.5891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25b33e0-6253-4e0c-8f6a-08d82f9d62be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Fri, 2020-07-24 at 12:12 +0530, Khasim Mohammed wrote:
>
> ________________________________________
> From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> on behalf of Lee Chee Yang
> via lists.openembedded.org <
> chee.yang.lee=3Dintel.com@lists.openembedded.org>
> Sent: Friday, July 24, 2020 6:28 AM
> To: Khasim Mohammed; openembedded-core@lists.openembedded.org
> Cc: nd
> Subject: Re: [OE-core] [PATCH] wic/bootimg-efi: Add support for
> IMAGE_BOOT_FILES
>
> Hi,
> I think currently IMAGE_BOOT_FILES test run on bootimg-partition
> only.
yes.

> Could you add test cases for bootimg-efi too?
>

I posted a separate patch to test IMAGE_BOOT_FILES for bootimg-efi.

Thanks.

Regards,
Khasim

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Khasim
> Mohammed
> Sent: Thursday, 23 July, 2020 5:52 PM
> To: openembedded-core@lists.openembedded.org
> Cc: nd@arm.com; Khasim Syed Mohammed <khasim.mohammed@arm.com>
> Subject: [OE-core] [PATCH] wic/bootimg-efi: Add support for
> IMAGE_BOOT_FILES
>
> List of files defined using IMAGE_BOOT_FILES are installed into the
> boot partition when preparing an image using the wic tool with the
> bootimg-efi source plugin.
>
> The code snippet introduced is taken as is from bootimg-partition.py
>
> Change-Id: I8dbb6b4e7c24870f587a6f31e6ae4a87d7033782
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 60
> +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py
> b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 2cfdc10ecd..14c1723577 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -13,6 +13,9 @@
>  import logging
>  import os
>  import shutil
> +import re
> +
> +from glob import glob
>
>  from wic import WicError
>  from wic.engine import get_custom_config @@ -209,6 +212,57 @@ class
> BootimgEFIPlugin(SourcePlugin):
>          except KeyError:
>              raise WicError("bootimg-efi requires a loader, none
> specified")
>
> +        if get_bitbake_var("IMAGE_BOOT_FILES") is None:
> +            logger.debug('No boot files defined in
> IMAGE_BOOT_FILES')
> +        else:
> +            boot_files =3D None
> +            for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s",
> part.label), (None, None)):
> +                if fmt:
> +                    var =3D fmt % id
> +                else:
> +                    var =3D ""
> +
> +                boot_files =3D get_bitbake_var("IMAGE_BOOT_FILES" +
> var)
> +                if boot_files:
> +                    break
> +
> +            logger.debug('Boot files: %s', boot_files)
> +
> +            # list of tuples (src_name, dst_name)
> +            deploy_files =3D []
> +            for src_entry in re.findall(r'[\w;\-\./\*]+',
> boot_files):
> +                if ';' in src_entry:
> +                    dst_entry =3D tuple(src_entry.split(';'))
> +                    if not dst_entry[0] or not dst_entry[1]:
> +                        raise WicError('Malformed boot file entry:
> %s' % src_entry)
> +                else:
> +                    dst_entry =3D (src_entry, src_entry)
> +
> +                logger.debug('Destination entry: %r', dst_entry)
> +                deploy_files.append(dst_entry)
> +
> +            cls.install_task =3D [];
> +            for deploy_entry in deploy_files:
> +                src, dst =3D deploy_entry
> +                if '*' in src:
> +                    # by default install files under their basename
> +                    entry_name_fn =3D os.path.basename
> +                    if dst !=3D src:
> +                        # unless a target name was given, then treat
> name
> +                        # as a directory and append a basename
> +                        entry_name_fn =3D lambda name: \
> +                                        os.path.join(dst,
> +
> + os.path.basename(name))
> +
> +                    srcs =3D glob(os.path.join(kernel_dir, src))
> +
> +                    logger.debug('Globbed sources: %s', ',
> '.join(srcs))
> +                    for entry in srcs:
> +                        src =3D os.path.relpath(entry, kernel_dir)
> +                        entry_dst_name =3D entry_name_fn(entry)
> +                        cls.install_task.append((src,
> entry_dst_name))
> +                else:
> +                    cls.install_task.append((src, dst))
>
>      @classmethod
>      def do_prepare_partition(cls, part, source_params, creator,
> cr_workdir, @@ -238,6 +292,12 @@ class
> BootimgEFIPlugin(SourcePlugin):
>              (staging_kernel_dir, kernel, hdddir, kernel)
>          exec_cmd(install_cmd)
>
> +        if get_bitbake_var("IMAGE_BOOT_FILES"):
> +            for src_path, dst_path in cls.install_task:
> +                install_cmd =3D "install -m 0644 -D %s %s" \
> +                              % (os.path.join(kernel_dir, src_path),
> +                                 os.path.join(hdddir, dst_path))
> +                exec_cmd(install_cmd)
>
>          try:
>              if source_params['loader'] =3D=3D 'grub-efi':
> --
> 2.17.1
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
