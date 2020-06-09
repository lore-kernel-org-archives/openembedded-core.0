Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.88])
 by mx.groups.io with SMTP id smtpd.web10.4296.1591698763113085268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 03:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ofhAXDXM;
 spf=pass (domain: windriver.com, ip: 40.107.75.88, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eov5aF2mT7UkhuJtNfSKw0UKZCuuJ15/ohEABbHS814O4Jizuc2edyB+jzxhToj8pG2+Z60rGd6I9l9w/A7EGZwRCRXXZKS19hCwXSWlv9dPRsVK+qG12usp8usq9dNSlQEda3sCDggxQZpAzXSTUdqMuAFz7rYvXMIR6pBIs1dDYghQZoAYahA2+f0MBdf1jLteXIgTVApxRx1fC0WWexz61//xLjcvzWLLp8dJ8gxQ2mk4GD6gBViUJTNO5s0ZHEM5vMgUyLvyDTEh/dIcJohouT8gfOXF8wTE/Ri5w/JQuaK17av4IhfC5AzbEDJk/ffmKzYdVhRbilnq5sCjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMK0tTvbloKgg7tV3Uw6FcRRGMCIOkfBriuJiFz6XmE=;
 b=i0AtBO6vC8g6Mi7KIBsh/kswbwossuT/UZv2M8Lwl4yIiWNw8w2UpmMJGeEmVpkhleNRMqY1JmhUpvruzeoxEHzmomDYcrYAKLY/7fJ9Ulx0ok8oCiCkduC7ghTFgAMQ8N9VUJgesJYKHrro1QQqdkEnqtjwC8gIdZkjvZNDfvR2obdJd9NhZp2rK4QX+bJvkVOed1ea3Li82ZFNHC2cM4Qvj2a61G59O6KCp8XLfgn/h359Wrlwzg7/ZqT7SycAD2pfnVc2N8XxT0wLFdflU2cRMCedNHoYoHbiH4Acaf8p1XMvKctFVI0ApSdGfmjvxbp37bI15Krkt6x/6S6rFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMK0tTvbloKgg7tV3Uw6FcRRGMCIOkfBriuJiFz6XmE=;
 b=ofhAXDXMXzTWEJieD7JB+hrCrICSQVx48UoPaS1Bn9VnEwfQPRFOes+Kj5hjgqZ7l4oywcpLepDP8csFq6bOsUZm96kgZ3c79GW3nlrVUbxC/xZSN4MG/djLEAp4l8DqI7Z/uQRf4e5ti3OdPZQhXYijPpSpjuk8LgKwo5fqLWI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Tue, 9 Jun
 2020 10:32:40 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 10:32:40 +0000
To: Bruce Ashfield <bruce.ashfield@gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Subject: [OE-core] kernel: update rpm failed for the vfat
Message-ID: <d384f6b7-dff7-ab38-7abc-348727f67d40@windriver.com>
Date: Tue, 9 Jun 2020 18:32:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-ClientProxiedBy: HK2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:202:16::12) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR02CA0128.apcprd02.prod.outlook.com (2603:1096:202:16::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Tue, 9 Jun 2020 10:32:39 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab0e846e-80f7-4f0e-755e-08d80c606fbc
X-MS-TrafficTypeDiagnostic: BY5PR11MB4307:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43077DAA375100E541BA8CB7E4820@BY5PR11MB4307.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	awobpx38wK8Jde0foBNLcA54ruuMbHo/vcuiNioMPQwL5GOlkwkIh6rT+XtKXjdsSwjacY0Dx5pS83YvCyNbT7Ui84Dbk7HDiVQec1AxjzlpxyVMNWs4rfE4mcpjV1Lnt/8UB5dgluMMwSiXPw6vjtZMLOXcoBvXxcp5Sx6LjEvG9IHcutmBJaHgihAG9tXzQ9JfM/q3kBTLc060dM5oj13pzRz1ttf46ONH0OLE/RnWkRXKlXcHA2/VGEM4T+vlkAf6aUtO6zrXyDpcq+5Anv5stEdsRnPghJMoSFQsu6LfoaFHc5FwBJEU0FoFSUHfCXBh2pZh+ZRgELIOEiwQ1BtLx7Oznxk7PCbWUvgaltssnkhpfGJ6UXt/+KQ5PZvh/58M13oFuNIYVOns8DZdPGQQNl00xHZtSjIT3au5342EUly4v+RbSXptXQY1ndCI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(366004)(376002)(39850400004)(396003)(4326008)(2906002)(316002)(16526019)(26005)(36756003)(6666004)(52116002)(83380400001)(16576012)(6486002)(956004)(186003)(2616005)(66556008)(8936002)(31696002)(8676002)(66476007)(6706004)(86362001)(5660300002)(6916009)(478600001)(31686004)(66946007)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZeEaBZHG7XzRfVoq/0D5Hiz0u+bf8e44iqnuPpiK2eZvOVvRLNKRtwH4lXTO591kzyEJOjMSl1HPQWDu0CGf6RR6rKkKOuEZKmJc6NFv6FRIDLA6PEtJXO+P4ak/tsaHBzV560nZG0Xm1BSPrnTqtmwd2tt8FCtFnHAyeX42fMExMF9D2CqVLf6BICH5gFl+LbaFPW9/5WCHf56Tui5fPgih34EYP0aa603piaD+jjCIQJvYy8k9gyb6ssgOm5V1vnsU6w0hof+GI04hvYbc4ewFQBWV3rZl2Ci+XDxlx90fWOmDZx9Z2rMZIxfziehTkN/gJbnh9z1tEDQj4WBpTrsyCxXCoHsGMtf0DPcHqoFeF0BmlrRGuPMp7cgQWWYrou1W8OHDu8eA7iqKnOth8Jty+1bJ8OU/zYiUWGtBp6sglrTwd0Zw462L3qUhDKVpggSSJ5xMBRMgalSMckLUdbKKvPsLpNa2RJcQt331EwQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0e846e-80f7-4f0e-755e-08d80c606fbc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 10:32:40.5979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJTewwPd84Fozd6h+s6nQsV7a4tfHb1ecjcspaa7jYek1korutlvx82XtAT4KrD9PSzjZ+WYMv56vdFM6zO8tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Bruce,

I encountered an issue that updating kernel rpm package will fail when 
the /boot dir was mount with vfat filesystem. The root cause is vfat 
don't support symlink.
--------cut here----------
error: unpacking of archive failed on file /boot/Image;5eda8385: cpio: 
symlink failed - Resource temporarily unavailable
error: 
kernel-image-image-5.4.43-yocto-standard-5.4.x+git0+f8c88c4331_9961cc8b79-r0.bcm_2xxx_rpi4: 
install failed
root@bcm-2xxx-rpi4:/boot#

Currently I have two ideas to fix it:
1. we use 'install' cmd instead of 'ln -sf' in kernel_do_install to 
avoid generating symlink in kernel-image-image*.rpm. And then add an 
postinstall to this rpm. It will check if the /boot dir is vfat, if not, 
we remove the copy image* and make a softlink for the image.
2. we specially add an package type which doesn't contain symlink for 
the vfat filesystem.

For the first idea, I met an problem when I try to add 
pkg_postinst_packagename function in kernel.bbclass file. Due to there 
are not package name variables defined for the kernel-image-image.gz 
kernel-image-image or other type kernel images. So I can not add 
postinst functions statically why that how many packages and packages' 
name are not certainly.

Do you have any opinions about these?


Regards,
Yanfei
