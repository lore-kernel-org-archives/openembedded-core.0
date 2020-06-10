Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.71])
 by mx.groups.io with SMTP id smtpd.web12.2186.1591755035121078231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 19:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bV00CJcj;
 spf=pass (domain: windriver.com, ip: 40.107.92.71, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsheIDtyUMvyRBgJ+ULmxZRb4BUFsAADeNCx39dzLE3Bk5IoMdlLSkNh6WZGZ3q9FltqCJxMZQ9g5aRoq5X5+CWctAkA1jR7zXk3MnioY6T66KiraBBWYmaKn846PF0uPkKAk1zGAkte+GfBO66tVpsLS9UJcP7DQCD3iniEJ1t/FkKAA0XEYZ5Y9HZJhlaBmG84TDRSV9eqOgbyU7NBwGMtRVOUfdVVeAUZvWuT5NYtBK16k8dBZ+AEbngyJ0DS+tUcAM/tiLHfa5z093f5h+/d4ejTS8YOYzTu9LrjSdIHxqYLOmrWRTzAkNHyLOWaxWGZSQpjw4QqxydoH/0Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhrygGG8aigP2yqOOM7gvkGA1A2HDWHNh1BzzTUZuRM=;
 b=c8B/QrIXL0Rfxl+65v+Uf6KeiBDLLO7G2HW64TCLzRLFg6524UT88M97FAkRs8jYk8ZR4LLGCd0u6/ywioH4nPuW/5o/xVVqc8mLO8TfaPnuW0vqKVFwl5MVtewV+1mF4qcXAco7dkvm7XBSsTmewXtrpKWLegtPdGV8USN+tFlF1tIob+MsD5OoZpBwVHLeh4IFIKVTTo/pIUGc1BORkr1bxY/flyVKaPQ+y0QJGVRXlOqxbv3a3A0RXNJgn0ycdCVXdlJbHgQ/E2mwLhvnCi6264eP7Cg+Ga2Dfi6qdbzqDXryWKhzdYutWGxhK92XV6bNMS50XPBHxr3LJN/Lhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhrygGG8aigP2yqOOM7gvkGA1A2HDWHNh1BzzTUZuRM=;
 b=bV00CJcj8ApH99xTPEwYhQi1x3H38H3yvXBSC28GKTfLDdFxOn0Bk/9NE5momaDLJ2lZuV2dinPLfcwIYTQcFXcaDCyKiu2U1YzCACGiAuJ31HQR0bzHBy9fHIvYKa1Sv/dgtaPTTXAgemeJPY/EtsEcWr9mpz/UbAF4UFe9B3M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3382.namprd11.prod.outlook.com (2603:10b6:a03:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Wed, 10 Jun
 2020 02:10:33 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 02:10:33 +0000
Subject: Re: [OE-core] [PATCH] virglrenderer: correct REQUIRED_DISTRO_FEATURES
To: Denys Dmytriyenko <denis@denix.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20200609071549.350578-1-mingli.yu@windriver.com>
 <CANNYZj9AZ7HS2ufOhWbEpDknD87Bp84nQNVe1kGBFdBffRP_tg@mail.gmail.com>
 <20200609215055.GV17660@denix.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <f2a20c42-f0b6-4387-b877-90344f90a627@windriver.com>
Date: Wed, 10 Jun 2020 10:09:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609215055.GV17660@denix.org>
X-ClientProxiedBy: HK0PR01CA0072.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::36) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK0PR01CA0072.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 02:10:31 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2624630a-a17d-4d5e-37ed-08d80ce374c7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3382:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3382429D7FC450999D880FECF1830@BYAPR11MB3382.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KQTmyKnmILtzGn49IlI7CX5gSXsk/XpBMzLBUU45aUCtAF69rZC0HnLzxJCNC79sFFJs5WUwNTsjV4ay9PeC8KlU3r0eC2sorgG3CX4lVnBJ9VErK4md8mYuiNJSNzS7XUYpmFeGfm+HKsYcdZsBpXpv/Uq5omIrR7xPEs4A+Gkhk8iFAycFvHPARyuK3RqVSafONWEOUxAtn1DRqu/mTzmsjXsqtqgbFHR+kgTqKn7S9AcnsvoMUAtEKekwW2JR6jWDYsnoWxXjg+q+qE0VlLs500vQCn2ljN5C8Eux3ixO2HjUeOCMloDwikb2m+/ZE6URaVMgiVP0MeVEo8PamOvrShKx+PPt40mvaE2psn2nROf6vsaId2dObHnstA2gR8HzXGQYZrEApaCDTCDYI7uOnnGsKRXiMBPv7fGhDwZigQdknn4YEDzghjMf1KdjnyDDNTheKig/F38DL2SrwsXHa1Ar5zNpSLajA80ibHcAXApd0y1wimOvBrBWBAwucGh0k3PqbKd07U7VQjlpGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39840400004)(376002)(396003)(136003)(366004)(6486002)(110136005)(2616005)(2906002)(966005)(31686004)(956004)(86362001)(4326008)(5660300002)(186003)(478600001)(8936002)(66946007)(16576012)(53546011)(83380400001)(36756003)(8676002)(26005)(52116002)(66476007)(316002)(31696002)(16526019)(66556008)(6706004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	utBubzJtm8y98g5hljl7zrJebi5LHnkUaSs64Qikd1dmq3xyu3vr6q/NaHPB7ZdCRdUKstTT5JPOgOtVyB8i+KyOkV253oN8ED2B0Gns/zRS5izW9x363zfYaN7G9QX7dfsrJHFArlZl9L/ApK7yW/kJAHys31TFd2hUjcsvpbH15FaxMngUvjG9jAKdAyILgbLD+eHoo1HrJ9cd4FTLy8tKG774rUlcYN9lNrmHrBK3KWkMm/PyPpciWWVT769WuO4p2F2G5IQIJbyWstsrFYteh7qATexjGhO0zRbG/23ekIOpj6Q6yjs3Z+OA1m+9GYOm7HXYOfIZe6dcfCvIISDZbqLSs38IOYrXtviOqt+4PhncyAXE8JbNshWzJrWl6T+S7WPEJCQQXIvW896aFhdFm6dYQ2PoyqXCb+yXb+Fiic9bzmlOvJBM24xyUku2XjqY1jci2dNHppZc0brqnpvFbSU7/YixbxIrusnliaY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2624630a-a17d-4d5e-37ed-08d80ce374c7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 02:10:33.1646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaugOMabIJiUXw5QGcR970MBHvsFFaDZojhECv4l43YazWZqWVGh8btV/vXZccBFNq6qUAOU/OpXGzoJFC8bww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3382
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex and Denys,

On 6/10/20 5:50 AM, Denys Dmytriyenko wrote:
> +1
> 
> The commit message should explain "why" and not "what", as "what" can be
> easily understood from the code itself.

In fact, the DISTRO_FEATURES setting shouldn't affect native build.

Initially this patch is used to fix below error when opengl not defined 
in DISTRO_FEATURES in my build environment.
$ bitbake virglrenderer-native
virglrenderer-native was skipped: missing required distro feature 
'opengl' (not in DISTRO_FEATURES)

And the value defined in DISTRO_FEATURES is only translated to the 
appropriate option supplied to the configure script during the 
do_configure task for recipes built for the target.

Thanks,
Mingli


> 
> Sometimes "why" is obvious - e.g. version update of CVE fix, but in many cases
> it's not at all clear why do you want everyone to be affected by your change.
> 
> PS. https://xkcd.com/1296/
> 
> 
> 
> 
