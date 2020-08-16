Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.59])
 by mx.groups.io with SMTP id smtpd.web12.27725.1597600714350626918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 10:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zLIscoM4;
 spf=pass (domain: arm.com, ip: 40.107.15.59, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXV9+yVmEpE1o+H9udb6Q0OnizBdn0ubIxPFlYD7XJY=;
 b=zLIscoM4Xioue2JGoJB27fKrlys6LeKUdkkfFtiCuyB2ndKQzJ0+PZW2v4iSqnXrpriiZUcRz5WuZtp/N0+b1+u9kfKxmCVaHsb8JaWsALI1Lqyo9uuAErrN469Es0WgfuyUggCHsbRhWo7fP3LIZ+A1EN83Nc1MNebcNCPZ5qc=
Received: from DBBPR09CA0012.eurprd09.prod.outlook.com (2603:10a6:10:c0::24)
 by VI1PR08MB2656.eurprd08.prod.outlook.com (2603:10a6:802:23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Sun, 16 Aug
 2020 17:58:29 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::7e) by DBBPR09CA0012.outlook.office365.com
 (2603:10a6:10:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Sun, 16 Aug 2020 17:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Sun, 16 Aug 2020 17:58:28 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Sun, 16 Aug 2020 17:58:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2961c4d04652532e
X-CR-MTA-TID: 64aa7808
Received: from daf3b1673c62.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8A08511F-EF5C-46DF-8673-E792B4E1456C.1;
	Sun, 16 Aug 2020 17:58:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id daf3b1673c62.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 16 Aug 2020 17:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZX326i/WdhROvuzIAvDNseDU2DCgI0NEHJl+xIglh/wia1rAMS6fM1q8/rpP1IyjvrHSILU3oyPpCXgu23mrRa1De+Gf9vRyBfYivNIP2HTc/FVLWKaBMcNU335lcvhUmfFP2dsp3kiNH2/9sQJGNM9zIRERfrJAwxeZXlqx0T8M2VzqgjcnhWddqMkS4w51dwqHOHewQ9uqBhuz3EHgZKu1I+y/Qzd0dgEfkFqa/l2gqXyHEkraBSMxpLEgrApzENR2CxaRmJ6B1RRMpRqAt1CSo3t4mcwvFFNTEOXQB5s3aWgnit6LrzwKacYc3dgPLl5MLJL7D42bPIYNULwBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXV9+yVmEpE1o+H9udb6Q0OnizBdn0ubIxPFlYD7XJY=;
 b=KKBZL26w9zEYL5K8pe3OPcKWvmqM4dmZnKKsIndD+tDj7swt7PO9tksvXNanDtbu26HQ1ammPEZ6evCf6J7uJ9g4JFOJEZVpfMqXSiedzGz0edqIw9PjnBdjvf/rVLl54YUAnuBK0nSU/QmI6JU7nGG/JEeF2yuSP03WEAeO1uRggejbjnICbeuzQ9VuWGaPuT697iwaonCY32qnJve/X9b8Ud4BibJSpMXE1mqMvVxopRZzfb1wFaFcTdqXVyvp0ZHiwQCkJkBaj4bg3oZVFfgliJ3WM2cDrCJrf/X71edpKLc8S8ocK0TIO8b0EVwVMybEW30w2vDpEYcGpaFbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXV9+yVmEpE1o+H9udb6Q0OnizBdn0ubIxPFlYD7XJY=;
 b=zLIscoM4Xioue2JGoJB27fKrlys6LeKUdkkfFtiCuyB2ndKQzJ0+PZW2v4iSqnXrpriiZUcRz5WuZtp/N0+b1+u9kfKxmCVaHsb8JaWsALI1Lqyo9uuAErrN469Es0WgfuyUggCHsbRhWo7fP3LIZ+A1EN83Nc1MNebcNCPZ5qc=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB6PR0801MB1893.eurprd08.prod.outlook.com (2603:10a6:4:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Sun, 16 Aug
 2020 17:58:17 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 17:58:17 +0000
Message-ID: <9af49dc75730768973a7fdd1b00002353dfe9fd8.camel@arm.com>
Subject: Re: [PATCH] wic/bootimg-efi: Add support for IMAGE_BOOT_FILES
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Sun, 16 Aug 2020 23:28:12 +0530
In-Reply-To: <20200723095150.18257-1-khasim.mohammed@arm.com>
References: <20200723095150.18257-1-khasim.mohammed@arm.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-ClientProxiedBy: LO2P265CA0377.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::29) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.37.8.28] (217.140.96.140) by LO2P265CA0377.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Sun, 16 Aug 2020 17:58:16 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b2ed6e0-238d-4fa1-e4af-08d8420dfb2d
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1893:|VI1PR08MB2656:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB265628A301B25DA90B3CFF18FA5E0@VI1PR08MB2656.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:538;OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qF5SHdR8T3kX9klpOQHef0Xu7XUlf3x6lTMHx0vyXstw5hxVT23PIvLBAARH4EHFrBk4eeZVLReUthh4BTEMVo8cIUH/yl2Vn2ehlK09YfhmjvShGWzwxYzyjTls+IjEwZjcbEBR3ghwUuqjZZXSCW14K4ggzN0AsuYeBoGSpg/drspAW9kBardfvzjmX5U4S2ppFPaRA7X2PaX5Hu8jn5NTPgdTaAjTp+ExzH9swUb4o7JLSgGM228kvJiA8DGXwmR3xt4XlwF96nkr2xiu6hljx5tzeizhyxkh7Ihp5rKmTjqXKlog15cYDUDnzvbYbKxu3vZ9SXFj3VOsRWcNIAkUkAiXifREsFgnJ24900oiVbP+mA4AxmP5rPd8dSegEZV9qEy0VeG2kfw+R0HldWVa9JV432cczWCSLFNE02A4bRuslr8JxCUHa0pCh3HNq6qxewngCKDGvpQ8czvGag==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(366004)(136003)(966005)(86362001)(2906002)(16576012)(6486002)(478600001)(16526019)(956004)(36756003)(26005)(2616005)(44832011)(52116002)(186003)(83380400001)(316002)(5660300002)(66476007)(66556008)(8936002)(4326008)(8676002)(6916009)(66946007)(6666004)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 OTxPRiH2ZkpPgdONcKSoX/jS58aBGE7VkkB7145olBb/6PrCU7hZybpoM/mEoI7qFNMXZsKxtU9kkX6iYFAo+tiIrFdKlJm7ObK+k+99XOpRnP1ok1ueiSpuwwsfpkf9lYThiagrgvTB4Fz/7xm4KWoBe4sLbn/a/soaIRq7Q+hvY8XCpgd44OfyQ5auryQ0IgBT7i78+NEX+apv1i0h5vAV/1e3WKfwuPSeeXO5iwfH3hcVzAb0Ji+ZhgH7Dt1OWkpwN8VhSi13oYYeKdfRyPB3QMYJ1deeE2S5hvs70T87WpULvix3dyNO9BiFPeCSbPvx7J0jNLQshKUQjS1NyF0OxMFITLlojRo+4cH9dvGxUpAygmjtGy61TmdhABkVPppXGq1vDRgoqf4jnLUlh2VkhpMETxawAPL0bT55mNTQqk+Kyhyr8ZdDqQRAIhQW1VvFdgh8mdXub9xFELIUVaonZ5Lg5gZyCo8D3XhGHeeXhSN64BrsXsqLrdoEtzo6IzcoKSDiv4D7Qu30Gt1Gn8hHbWze4ue9Wwox9419h5XYfA1HLq+8UFbBtIPsJNoTzb6TMTPr7jWTVp6tqjDmZjaYILkyXO+hv+GPOHcTLGLIU6z2SCr0Z/qTDOOaR8cJBT+6FcEPU5/6lEaq5mChgQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1893
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2a41927c-5823-4084-1465-08d8420df40b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PKqxD7cYj7VnFbKCg4vnio06IRQIcU+CmG4nn0lADmy2wB+81fsVvgTCPK2Oo3j6M1H6NeDmrZbCR+J1edZ+0+PgQ1ov6htj6WKBfq5PWwMd2L7yBniR2zSWbLKxsA/+JgBAZtnlKme0PreXQJIEyziXD9lO/u5z3UpUjXwSoHcmZuuBY41la2zMIDwXT5/iI1LSWpo+X4PMzpJhO/MAPQV4JjIcNkrdXwfTcZqXVmz127pscIax7hlE0LFj1W4N2m6km7BrYTYRfNDUJvIBImOZO3UH3afMmT3qacMcFs1oc5OkvY9IgoSA83mZ/udyOVal3pXAwzkUk43gbe4mQSJ1lIY5pRQUlRTt5PrKwjwwY5RiGHe/UGti990czFSlsuEK/YnHOR9Jroc9AzNgBiJ66cE/Lo/94SDtCiPCpY5OT6lfKzQPeOkbghLfAgrL19XfAfSrVI6ZnMEGKD1Ca13edQQyZ8zgB21h2B6qup0tlBoYCZF6Q9x1+USIHuSH
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(46966005)(336012)(6916009)(16576012)(86362001)(82740400003)(16526019)(81166007)(83380400001)(8676002)(316002)(47076004)(356005)(186003)(82310400002)(70586007)(5660300002)(2906002)(26005)(4326008)(8936002)(6486002)(44832011)(478600001)(6666004)(36756003)(2616005)(956004)(70206006)(966005)(99106002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 17:58:28.8892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2ed6e0-238d-4fa1-e4af-08d8420dfb2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2656
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2020-07-23 at 15:21 +0530, Khasim Syed Mohammed wrote:
> List of files defined using IMAGE_BOOT_FILES are installed into
> the boot partition when preparing an image using the wic tool with
> the bootimg-efi source plugin.
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
>  from wic.engine import get_custom_config
> @@ -209,6 +212,57 @@ class BootimgEFIPlugin(SourcePlugin):
>          except KeyError:
>              raise WicError("bootimg-efi requires a loader, none
> specified")
>  
> +        if get_bitbake_var("IMAGE_BOOT_FILES") is None:
> +            logger.debug('No boot files defined in
> IMAGE_BOOT_FILES')
> +        else:
> +            boot_files = None
> +            for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", 
> part.label), (None, None)):
> +                if fmt:
> +                    var = fmt % id
> +                else:
> +                    var = ""
> +
> +                boot_files = get_bitbake_var("IMAGE_BOOT_FILES" +
> var)
> +                if boot_files:
> +                    break
> +
> +            logger.debug('Boot files: %s', boot_files)
> +
> +            # list of tuples (src_name, dst_name)
> +            deploy_files = []
> +            for src_entry in re.findall(r'[\w;\-\./\*]+',
> boot_files):
> +                if ';' in src_entry:
> +                    dst_entry = tuple(src_entry.split(';'))
> +                    if not dst_entry[0] or not dst_entry[1]:
> +                        raise WicError('Malformed boot file entry:
> %s' % src_entry)
> +                else:
> +                    dst_entry = (src_entry, src_entry)
> +
> +                logger.debug('Destination entry: %r', dst_entry)
> +                deploy_files.append(dst_entry)
> +
> +            cls.install_task = [];
> +            for deploy_entry in deploy_files:
> +                src, dst = deploy_entry
> +                if '*' in src:
> +                    # by default install files under their basename
> +                    entry_name_fn = os.path.basename
> +                    if dst != src:
> +                        # unless a target name was given, then treat
> name
> +                        # as a directory and append a basename
> +                        entry_name_fn = lambda name: \
> +                                        os.path.join(dst,
> +                                                     os.path.basenam
> e(name))
> +
> +                    srcs = glob(os.path.join(kernel_dir, src))
> +
> +                    logger.debug('Globbed sources: %s', ',
> '.join(srcs))
> +                    for entry in srcs:
> +                        src = os.path.relpath(entry, kernel_dir)
> +                        entry_dst_name = entry_name_fn(entry)
> +                        cls.install_task.append((src,
> entry_dst_name))
> +                else:
> +                    cls.install_task.append((src, dst))
>  
>      @classmethod
>      def do_prepare_partition(cls, part, source_params, creator,
> cr_workdir,
> @@ -238,6 +292,12 @@ class BootimgEFIPlugin(SourcePlugin):
>              (staging_kernel_dir, kernel, hdddir, kernel)
>          exec_cmd(install_cmd)
>  
> +        if get_bitbake_var("IMAGE_BOOT_FILES"):
> +            for src_path, dst_path in cls.install_task:
> +                install_cmd = "install -m 0644 -D %s %s" \
> +                              % (os.path.join(kernel_dir, src_path),
> +                                 os.path.join(hdddir, dst_path))
> +                exec_cmd(install_cmd)
>  
>          try:
>              if source_params['loader'] == 'grub-efi':

This patch was recently merged to master 
https://git.openembedded.org/openembedded-core/commit/scripts/lib/wic/plugins/source/bootimg-efi.py?id=a44ab3a4ee5b3c57812909c6194456f299d6ba7f

The IMAGE_BOOT_FILES feature is important for N1SDP ARM Platform and
it's used to copy few DTBs to boot partition. Without this feature the
wic image for N1SDP will support only ACPI boot and it will be broken
for DTB based booting, as this feature is working on master its only
missing on dunfell branch.

I hereby request to consider this patch for dunfell branch as well. It
will help ARM partners to use WIC image for both ACPI and DTBs based
booting and avoid customizing the build for N1SDP.

Let me know if you find any issues in merging this patch to dunfell
branch.

Thanks

Regards,
Khasim

