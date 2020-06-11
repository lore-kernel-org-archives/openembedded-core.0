Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.84])
 by mx.groups.io with SMTP id smtpd.web11.2417.1591860125850755127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 00:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZDVjSqIm;
 spf=pass (domain: windriver.com, ip: 40.107.94.84, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSrjoWTqBGvhLe6dPgMQ1xZiapTuKQsyhq/TdM9w4dkDrFxT/nTn/WsbDv9lOcoQeEsvMOoySUb8eZXkJs2gbVaj8cqNWmh+ptFuIjxxnNs/DXi4P5xxPKzCvGub4nm5IPb+O4rFElpyaLeAylyHdLhdXKH5ng73Utt75A74y74BMKgGHMcbZUBMc3kCSqjCYHlU6Vj3hnbd0N8qBBmAba6KDiwN8zPSN6glfQPBEVzIj5qcMwer2l7fp8tPnnUkJWKNwppVExZ/1mXdNmTVPOldpH2kb/rcodTY8pcIcmM+9Tc2ZEHpGfB8wzD8QIAHAiJCb+HkEMOzvln2U68piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6o6Ydoae0kK5+GlAzZa7qb4mcmOLqWioyodKcHc47U=;
 b=gZwTkZCO9cbrYKfpp80NhMQ+5bXxjJOQ0HS5Ifcs/DMAEYWrYN+ivE8kS2Jd6tcifsPckk4J8J82Dp6fkNK9tB3MTeHapD2xX36O3+lD0thxlBEoyg9oNd9kYdBsSxqVsIJPClTctSb2UXMCo3nU7oTwDBVMXxZv58kVCQY+m07d3hWCfueb6CgwbYgAWSu1jEG5s/Fp2lNSKk5/3+kC5XrQYuwRFuy1V1y4DJC1YxWYHEuf85HMDgD/pwp6h7X0NzO0E8zT4uchDRctv1hdB3QToORfti6JeW3qIE6bTXzN4+3eGxBcRp3urZFKCom7LWuA8zJiugCQ3JkPrhZFYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6o6Ydoae0kK5+GlAzZa7qb4mcmOLqWioyodKcHc47U=;
 b=ZDVjSqImDq33T/lNEKb4pAEhT379PI5Zoa2MEcljflHij1sDrlr7xf2/Jkt8o5n0Kpg+bfZ2Efh7m+vLUDvZb4M+USp7WUpidAnlwhC8mAVX1/+bntOMC3RTSC2ruHTfFUyxkpm7tf3JtRYoibBwDo9iLA6lh9AlWqGHNmI0bJg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3813.namprd11.prod.outlook.com (2603:10b6:a03:ff::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 07:22:03 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 07:22:03 +0000
Subject: Re: [OE-core] [PATCH] virglrenderer: correct REQUIRED_DISTRO_FEATURES
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20200609071549.350578-1-mingli.yu@windriver.com>
 <CANNYZj9AZ7HS2ufOhWbEpDknD87Bp84nQNVe1kGBFdBffRP_tg@mail.gmail.com>
 <20200609215055.GV17660@denix.org>
 <f2a20c42-f0b6-4387-b877-90344f90a627@windriver.com>
 <CANNYZj_YwkQeLNW1VHAhOJXkgyXDW6XcfyM-N4zcrRdp3fJZ7w@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <fe6bf251-571e-a5ed-53f9-e150f7407b13@windriver.com>
Date: Thu, 11 Jun 2020 15:21:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CANNYZj_YwkQeLNW1VHAhOJXkgyXDW6XcfyM-N4zcrRdp3fJZ7w@mail.gmail.com>
X-ClientProxiedBy: HK0PR03CA0102.apcprd03.prod.outlook.com
 (2603:1096:203:b0::18) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK0PR03CA0102.apcprd03.prod.outlook.com (2603:1096:203:b0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 07:22:02 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f40ccf2-ca92-4be2-daeb-08d80dd8236d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3813:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB381356F17CABABFCB9C2E0DAF1800@BYAPR11MB3813.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2sUEotUPn2Kxgy9p5a8/wGWv9hWSJEpzJKm97Ax2YUUa90V0VL/YgoVdapZ6zSZ7xFfNxVTe0jXOTDW24IX9X2uFDeZt0fN6XOx+cQxUhLxJtZlAI7q/4P4mscdqoAfZ42DCcMO7Qtf1X6hhCmyICJhB5WaTT7aLOJStmuCBR74uExNq5ZlhIgKxC7z4NGbSaKsMYOFmhr66byLeEAm2sdgIQrMUI8Nzj9AxpNWIRc5sNkSAj1aVQvf7M6UkX9s+vVtGBoHCsgd8HKYF43u2BbymGuGdY1H7MDtJQI+nNMqmkO+ZRQGVyKgDbwjxJoJR1CDHfONk8F2OzBA87uLGOfgB5A39CDz3p+y+6OQdfo5xJV74BGh4Z4sDUSsnJx55cRpCCTuov0fDbOWdlq4vlpr2EpeUkO21xLCuJ8UIlMecoWEAdAkCCYwXtEt+ghJb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(396003)(136003)(346002)(376002)(4744005)(66946007)(8676002)(8936002)(16526019)(186003)(26005)(6486002)(86362001)(66476007)(66556008)(31696002)(956004)(53546011)(5660300002)(31686004)(2616005)(16576012)(52116002)(83380400001)(2906002)(478600001)(36756003)(316002)(4326008)(6706004)(6916009)(54906003)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dDCOJBisg56z1t72TapePLutme5ZXHLEJJifH3B86Futbi7vq7Y4+ylvHIDRDin0RqOIdeBkU2LaxI8775+vdUw5RV8zuCYwU+bR1/IJtW94RJweSzfVoXOZgam4qubSueN/6SGb4Eg3fHfhYqY8GLqQVeYp0ii6sIvHcSXyjNfF3UrVA202152ZxJer5gcnOQZc07Ayq2Whi6bxJexaBk3CCN2p0QNIY1LGUFwfk6waYoqXXJGeSUIthQvYxEO5+AFStO+UuyORKMFqLYiRpfWTjUJrLyB3wkCEyJ7ppoKyZEixdvb/iUVDmeyPlcDB/wl8wIkDopDRKJPw1LflerA1MviwoxlmsYhEBqWPKTLFvxLC/TQTXo4RHMe69jOZyg64wH8ywxhRywwXj3YX8P/sr0D3q3KJDPnZFU+k3awR/EetwGFF9dISzlMMCRs3t3C29060rHyyp7qX3wiQ6OxLllLX8SW4rsrGLDkUm9U=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f40ccf2-ca92-4be2-daeb-08d80dd8236d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 07:22:03.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EstqBJ0kkh0XIFg8vH3zveViHzpTutiqzNgiUzEH1bR2FptvZ8YbH0jdmdtyUBKSTv1ZMBI1qcCHV/xwINQZ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3813
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

On 6/10/20 4:25 PM, Alexander Kanavin wrote:
> On Wed, 10 Jun 2020 at 04:10, Yu, Mingli <mingli.yu@windriver.com 
> <mailto:mingli.yu@windriver.com>> wrote:
> 
>     Hi Alex and Denys,
> 
>     On 6/10/20 5:50 AM, Denys Dmytriyenko wrote:
>      > +1
>      >
>      > The commit message should explain "why" and not "what", as "what"
>     can be
>      > easily understood from the code itself.
> 
>     In fact, the DISTRO_FEATURES setting shouldn't affect native build.
> 
>     Initially this patch is used to fix below error when opengl not defined
>     in DISTRO_FEATURES in my build environment.
>     $ bitbake virglrenderer-native
>     virglrenderer-native was skipped: missing required distro feature
>     'opengl' (not in DISTRO_FEATURES)
> 
> 
> This is not an error, but expected behavior. virglrenderer-native only 
> works when opengl is in DISTRO_FEATURES and should be skipped otherwise.

Does it mean the DISTRO_FEATURES setting also affects the native build? 
If so, please ignore this patch.

Thanks,

> 
> Alex
