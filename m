Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.40])
 by mx.groups.io with SMTP id smtpd.web12.3158.1591864356402324556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 01:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jXIOaef7;
 spf=pass (domain: windriver.com, ip: 40.107.244.40, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgzR39+eRSmAhwEsJKr2gh7IFQy4vyfXM2/W4MtJ7ZdfQyh25rAoBECK2CJJGpJUDWa4mvwcldHCinBxGouzxv1djRfLZ2Q51QIC4xcORNEDMavMQe2b9RVuQGWgJs4ax0L6r5n9XmJpwjDohaFVGGOMkOE/6YJGqib5Avtdx2//HUOzvY734LTubXDlUSZ/QhFvMe91HSKHGFjF8Xdm9VohxHRhzdPDY5r2PHYORIv4BO9I12ujD00W96JddEZll6SLRTBvpQkxGCoa8w7FdPHcDI4jdE6EPJrH5y3dJm6y0Wr0ErVxi6X8spVRG4HBkhIGrhNDG/27Lblq9Pqm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY8AiCG8kNFVfmvHlGx/CdLo4PSg+LDuxlkWCrDsahU=;
 b=C3gHGMt8zrm8OW0E0MzBKHluUFvgY0vGyxNHcydeeKjC10mpUzI/pDxGwCjhJ5u/b3BjZ0JcNBj40sVi3yi+MZrTY7lZOARpliHWHGREZntXkKwv6aTk6gFrh0nQbtGarWD0urKm1I+ekim14O9Y/HgrftBi+7Vtp9GLX3ZhuDJK8zkMDlNIdVyDA1jJmEFh36JPP9jbdrsAqwuQawNvFBgUDrvw7M0JrZj4Vc/N1RQb019ESOIXWAJl85aMymfKD9xN4Uy5fyI8CO7u5xydc1Kah/rMQoG5SIUo0nfu0xXbGbM/4kd+Ma9RQ8E1KDn2Q+NC1XJ1xRa/lZIwVJ2PrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY8AiCG8kNFVfmvHlGx/CdLo4PSg+LDuxlkWCrDsahU=;
 b=jXIOaef7p9ujpNwuSihW3PFn73i0vq21AF7TYrFDuqdwxEn0KX5FUUADyPueDPSRaPzLjPnx3Lcqwwf1fHOoakkOhitqBWmDFM41jtebd9vyxBL4h1UeKGJrVsRMYnYIcOALNVDuWWI2GRpjrmxWg7Ca+mQ+jOQXX7iKVK2PM/s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 08:32:34 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 08:32:34 +0000
Subject: Re: [OE-core] [PATCH] virglrenderer: correct REQUIRED_DISTRO_FEATURES
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20200609071549.350578-1-mingli.yu@windriver.com>
 <CANNYZj9AZ7HS2ufOhWbEpDknD87Bp84nQNVe1kGBFdBffRP_tg@mail.gmail.com>
 <20200609215055.GV17660@denix.org>
 <f2a20c42-f0b6-4387-b877-90344f90a627@windriver.com>
 <CANNYZj_YwkQeLNW1VHAhOJXkgyXDW6XcfyM-N4zcrRdp3fJZ7w@mail.gmail.com>
 <fe6bf251-571e-a5ed-53f9-e150f7407b13@windriver.com>
 <CANNYZj9Ng7mr3-Ca7dNATFeyh7q3odoc+tzyizM9G9dZt07wrw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <56630264-5da6-1d52-557b-0eed1d851a81@windriver.com>
Date: Thu, 11 Jun 2020 16:31:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CANNYZj9Ng7mr3-Ca7dNATFeyh7q3odoc+tzyizM9G9dZt07wrw@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR02CA0150.apcprd02.prod.outlook.com (2603:1096:202:16::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 08:32:33 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f477408-d7a6-45c3-7996-08d80de1fd7a
X-MS-TrafficTypeDiagnostic: BY5PR11MB3893:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3893D574D05F0AB1080719C4F1800@BY5PR11MB3893.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZlkVQHOSbEXVR0CW06R7U+dn9rv0tImCFWHQFi7ZhPeZdF0lbUh2PkGEHYnZ4q/lsZ/lzm1g8cLJtmLiwJXUGGrjIG4jls/H1ebE3N2ryRmv+AV+2hmRhhpyYqVh5lH+lLnKuxi7lBWGTvuUhtF9Nd7sT0L282kRNy+X6P2TR59MOJPKRMqgT1y8LQVyUhAo36yIQZ5mbQxqHgkua7wQlKpYAWluE+SJx24rF2dCL9oyRT9/pSwMgvPKUTqzrAp/qgVT+bHS8aoQzfIcbAF3cte/Z5Sth0ipdY9Zrk5TfIZ7F1i9FhLSAZGNKwFId2RCBd4fp/Lq7cBdjedoqk59f5cxWgYcQn/zSEy5K8pIjKjwA2doBNf9IWlS9i/keBaTFiYPGdj3sbp108796d5AUVOn0b/SZ/bGYnP/jLlBohVzwtVjHrEaqnswnT8b9Wcl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(39850400004)(396003)(316002)(26005)(53546011)(6916009)(186003)(8676002)(16576012)(4326008)(5660300002)(66556008)(66946007)(66476007)(36756003)(31696002)(54906003)(8936002)(478600001)(52116002)(2906002)(16526019)(6706004)(4744005)(2616005)(31686004)(86362001)(6486002)(956004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LnJWLUExWlIkqgSZLzWTuaC2yAOXCsheDLzyK9u/aAxbSW6dv2mMuO1DM6fJMc67ALn+X3g9fBDqAuV2GPUxXh+O24dWr8/amAe6NMmf/GPRck1rycS8HU9VxG3ZWuCLWgp7RwPb0rd6l0n3ggn2LGEOOmrmNBS2JPYXHA3B3yBGIq2ayRp0BLfcjNYQZtIx8AOKX6kls9PD8hyEzmrezAZenAdSauv+zBqz5O3l0QyLRmqpI68JnO1X7sTYcquMPm5dK8DWtyvfx4bPEPAKSuh2/cAYsTqHUzr95DnmeaZ+KgiPNlqp0J3wTOFX6HOSWrfcOpedl9+RM6PNnFr7i2SjIv384kFxzFl94SwySJYxIgkRyyYitZLWg1v4pI5azo4DOE0y7hFsF8Az+KckJgiwffkn24Zp7Zcppxv7mWcIWOo8okABCR/4sq/k92G4sD3j4cf1KlYLW18fdBAU6X/SKZsM7Tz/TYQQvXDWcKw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f477408-d7a6-45c3-7996-08d80de1fd7a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 08:32:34.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwm/LG/dr2n+89IbbX0BxIZ8fzZUoBOCAdbFEPmODik2OXYOZEGvIXqrbpfN5wEYH4f7UX/vKqx+CUZNBQOVPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/11/20 4:14 PM, Alexander Kanavin wrote:
> On Thu, 11 Jun 2020 at 09:22, Yu, Mingli <mingli.yu@windriver.com 
> <mailto:mingli.yu@windriver.com>> wrote:
> 
>      > This is not an error, but expected behavior. virglrenderer-native
>     only
>      > works when opengl is in DISTRO_FEATURES and should be skipped
>     otherwise.
> 
>     Does it mean the DISTRO_FEATURES setting also affects the native build?
>     If so, please ignore this patch.
> 
> 
> By default it does not, but for specific items listed in bitbake.conf it 
> does:
> 
> # Normally target distro features will not be applied to native builds:
> # Native distro features on this list will use the target feature value
> DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
> DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"

Understood, many thanks your explanation!

Thanks,

> 
> Alex
