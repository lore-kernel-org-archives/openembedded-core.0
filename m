Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.54])
 by mx.groups.io with SMTP id smtpd.web11.15450.1591948021681234818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 00:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mbOTCWj9;
 spf=pass (domain: windriver.com, ip: 40.107.243.54, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C54VIrjPQnE1Z66CcMQEEvgEfVAnoQ5ZhhHFcHLJ2HSFQxEUD6jyjbZQuuMnxITC+3LG1Qs8mIkCljjsszNm95WqbAsVOw0AVOTnaqLJLsXR7c7h3uyOc+GnAg9tcx4PKfcnNzSH+TQIouwuzozsSmkHOwxolAUlUY+bIvJ5F+2JamY1o65fuiVg7+Q0Wb3SLxEcYJNo86KOi41OFZ/Ha0K71o28WzHX5tUA3IKss3mOF9l7kQmCRnHHg7RDUNOdYb517n/WILWrQhw/zJAkRqOWsKWn8Yx4uWyAX2gjMnrnO6naLmq3V71OICS6rp/6hdkuvv3zLER8boh3USlJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p44NtpwdV3t0q2uUfp8cxcFgI+q3FUIQrVdBMXHzRMc=;
 b=b2PoV32hlP7b+Nqp2xJTLTIs+znm2cyvDpkrZRCY0rTxJmV3qA77Ql6pKG+4JXCJLfJM7v74QtbduC5ju4FgvUh5uFmgLMtLgy9a3ZvE5GS1fnMzWu5Uej3oE0fkfR5FDXfyYgZA8Uu37oDJC2iIVMEvER1vrb4bxzZenXbd8uISP3r9rTOB2F6ZixUgfeIT3nXVvq5FHSb1ne/H31CniK2g+vn+X0Q5X7DpDBlh7ShXtPay7TR8vgbomSb/OmA2pwxKnZo+8ZIhRKkkVblAeP3C3K3NhsNQum5pgC0BScyCBuwvj46yufyR/L278iY5Z/uMHTGrbobxHatNtc6o4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p44NtpwdV3t0q2uUfp8cxcFgI+q3FUIQrVdBMXHzRMc=;
 b=mbOTCWj9saHIxCvY+qEk6iX4WvvwsYU7KG8/dl52KCEfZPlGpkP53eIBvNMVq5NwNEyXd1Qrfmp0p+fDzzdVPkVpJtBfIcr5BpgnXfO04rM0qQ7HRiYvQRVc/h++nbPo1hHkFLGP1TGcJIepeVPBZ0Hh68ZfNXgOMm0FKSLHiTc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Fri, 12 Jun
 2020 07:46:59 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3088.019; Fri, 12 Jun 2020
 07:46:59 +0000
Subject: Re: [OE-core] kernel: update rpm failed for the vfat
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
References: <1616D997B5533366.13968@lists.openembedded.org>
Message-ID: <cbb726f7-954b-bdca-66fa-6ab9996eaa1c@windriver.com>
Date: Fri, 12 Jun 2020 15:46:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1616D997B5533366.13968@lists.openembedded.org>
X-ClientProxiedBy: BYAPR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::14) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by BYAPR06CA0037.namprd06.prod.outlook.com (2603:10b6:a03:14b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 07:46:58 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba557dc7-cfc7-4eae-b1ff-08d80ea4c97e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4007:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4007094F571F1D252C6165B5E4810@BY5PR11MB4007.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C/GXIj8FIrR4Rkx30Gya17EX5Mc05o3ySri1L7FuSOCCgSYRI0xtwE19v61WJmLZAMxMAJUjvrqfX4Z2RufqvlEg74lFe5BP+hgzLedt7eo8/1Qgq+9sVuiNhmFDr/Pl1ORmmkhQ1QLEb79oT9+OZO2oSaqVSzeomfMLS6pFpi1HVLixkApbj5TSSFhXKhfwsjGLzFo39LU/+KLEF4YoRknnDgovDg78MPKy50yNbxmGvW34f4LGV3BeKC01e/xRY++3jp063Q8jzazDV//AyMmeBCsxn0s+Px7blL+YSn900SNStTSlY5FKfQ34IKVDuzizR5fKAjHDfzTc8cKrKMiSxXiNsuErMwRA45CNZstpA9G6csFFkjUYolRZQfOk2s5Co9E52RueYhYMSexTLau05Ap0HoPmip9YM9GDc6r3cmi5Fh7rju7kKhGDxXRaZqG34EquaIU0egQrCwqFMDWCvOGRc75B0ymiqachOvSQzxl9Oju9T02N5xDSmaBhtsbpQvDqCq3oDon/pjkT7Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(346002)(39850400004)(366004)(396003)(83380400001)(16576012)(956004)(86362001)(6486002)(2616005)(31696002)(316002)(966005)(478600001)(6916009)(6706004)(6666004)(66556008)(2906002)(66476007)(66946007)(8676002)(8936002)(52116002)(53546011)(5660300002)(26005)(16526019)(15650500001)(186003)(36756003)(4326008)(31686004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kvMlKbAWTXIQFfoQlJ3AcoH3AX+UrzlIicruV1UtUcf/qnUQtyacu+qmg8WHE1fdtjw+B2uc355FZPtmkyEsxSbiHwxwmBolIYcGMJCgWJHx78/eQfVkIxYU5wYt2P6mp1lpll+Qhjo4l5gl9gvMPnnhG3kXXIoOpg7b8gXwgCwJeO4f57WKznsOaf8NhlMgSstkBHvwRhe4OgaFrf+t5U52CahpqcQWHTOmb57P5QO7fWBMBU1NLA33ZwYVATUF7o7Gcm7IFF18Fh11dqPKKAVhiZIAJoxpToiODaOK0gMgH3vyc1zFKi+OkRS/cGGcbdov7VXkBd7PLqpvkNMn9ETsjEU4SCG0+N+q+wsJ1nuRrBD5yAIQ6AHyFmYuaQz6Q8Ypm/QS0LSLqlbMjMtOeRmcKNQlPFlkvpSA4QAc9kqIXNfdwIVUu1+UYKCFtzuzDtV3wkMC7MHt4itOTB+CRTozlTMoMYvbYDrgaDjpniE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba557dc7-cfc7-4eae-b1ff-08d80ea4c97e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 07:46:59.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IV9B7bOnznliwbqLBsyqTy1186GboxoG3lIOyzu/Dfh5YE4gsrwzhGkIsj9+tveJO5QlybU71KF/9zprkFGig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4007
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping Bruce.

On 6/9/20 6:32 PM, Xu, Yanfei wrote:
> Hi Bruce,
> 
> I encountered an issue that updating kernel rpm package will fail when 
> the /boot dir was mount with vfat filesystem. The root cause is vfat 
> don't support symlink.
> --------cut here----------
> error: unpacking of archive failed on file /boot/Image;5eda8385: cpio: 
> symlink failed - Resource temporarily unavailable
> error: 
> kernel-image-image-5.4.43-yocto-standard-5.4.x+git0+f8c88c4331_9961cc8b79-r0.bcm_2xxx_rpi4: 
> install failed
> root@bcm-2xxx-rpi4:/boot#
> 
> Currently I have two ideas to fix it:
> 1. we use 'install' cmd instead of 'ln -sf' in kernel_do_install to 
> avoid generating symlink in kernel-image-image*.rpm. And then add an 
> postinstall to this rpm. It will check if the /boot dir is vfat, if not, 
> we remove the copy image* and make a softlink for the image.
> 2. we specially add an package type which doesn't contain symlink for 
> the vfat filesystem.
> 
> For the first idea, I met an problem when I try to add 
> pkg_postinst_packagename function in kernel.bbclass file. Due to there 
> are not package name variables defined for the kernel-image-image.gz 
> kernel-image-image or other type kernel images. So I can not add 
> postinst functions statically why that how many packages and packages' 
> name are not certainly.
> 
> Do you have any opinions about these?
> 
> 
> Regards,
> Yanfei
> 
> 
> 
