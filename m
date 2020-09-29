Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.91])
 by mx.groups.io with SMTP id smtpd.web11.14837.1601361235927316612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 23:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigmatek.at header.s=selector2 header.b=bnur/pb9;
 spf=pass (domain: sigmatek.at, ip: 40.107.22.91, mailfrom: christian.perkonig@sigmatek.at)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3hPq62kuWmYUQ/jlRx6ZDUCyQt/n1h96H6WwLvr6cy4VeBkuSgihDtWsOX7itBNVoG23KdqS+k/sqO30jHo1UGcO92htdOujVvqvYB93pkgabJgCwGIbWWpYVitB4AUnOiVtFtw7b/Uho7iqbwU7SBpQQLovg6G/9HFuhGDabSvX7BMBPjXS2qI0pip1M4Llbo3pEYvCEV8NFETGaJzDPGX3ylMGHve5t7jxzRdXMB/iaV/8gCrJImuK3Lcdib/PXlAvJNIRHHkngl1HNi5SPPyAp2LyJhWVSFAJXDk4PeEIOdA2q1198FvDGlQ+7q6ruq/F0NYv3hRxyYw8KlM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KgrDSeX6IFomYRCrYtvn1OOpR3itt1yFEr0ZWv/xcw=;
 b=gxWoAtGFRrB4cz4WchoBVM/MxItx4kgWl5u0/L2pprCoJSDyrZznB/rHoPcSjhDI49ucQebouqz78nkyPKQF7XKWPsTeO+jSc2r6de3VFib8bamwJ9IXyc1mGzwbZ6umYWihx1lpGeMIaW74S7+hSTcB5mbFv6+lxcnIdvaGU83G5/+HENn/J4zWcOeWaToOREuiy4FEoTN0GPBbdi9QTf5EFAFi+StqgDaBUZc7XHSkkYRPJG0UXf8sSC3qpc/UoKjAYVp/HuOJHXWSZp98D5cElnESXFXx7Qgi5EwQFxl1lINOT3z/QkArb9WdgqD6SQUUkMG7WoSwG/Kx/GcI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sigmatek.at; dmarc=pass action=none header.from=sigmatek.at;
 dkim=pass header.d=sigmatek.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigmatek.at;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KgrDSeX6IFomYRCrYtvn1OOpR3itt1yFEr0ZWv/xcw=;
 b=bnur/pb9r0UBK7DXFX4yLw7NgiQNZAq5HIrzT3viAjeTLtxshya3h1D3/+6NV/245YAKybTEcyq3vBnLeKbW8nQZDqblt3gtyYN2D3oOJCS2lb288LoZB6GB+BkN0uHKTlHW6sJX1jQVw4YlZC4+qAaLa/tN/Xt1iKY4R+1gv6g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=sigmatek.at;
Received: from AM0PR08MB3443.eurprd08.prod.outlook.com (2603:10a6:208:d4::14)
 by AM0PR08MB3138.eurprd08.prod.outlook.com (2603:10a6:208:66::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Tue, 29 Sep
 2020 06:33:53 +0000
Received: from AM0PR08MB3443.eurprd08.prod.outlook.com
 ([fe80::fc0d:e8d4:a84e:ed0d]) by AM0PR08MB3443.eurprd08.prod.outlook.com
 ([fe80::fc0d:e8d4:a84e:ed0d%7]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 06:33:53 +0000
Subject: Re: [OE-core] [PATCH 1/2] meson: remove shell wrapper for meson
From: "Christian Perkonig" <christian.perkonig@sigmatek.at>
To: OE-core <openembedded-core@lists.openembedded.org>
References: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
 <CAAnfSTuFBJ_-jKqkxzmDi-tpW+pVCvsZPGScxWqScJ7O6oqWVw@mail.gmail.com>
 <58340a4b-ee68-1923-114e-e28d7bfef422@sigmatek.at>
Message-ID: <891eb6bb-09c5-041e-b389-99ff216aa3aa@sigmatek.at>
Date: Tue, 29 Sep 2020 08:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <58340a4b-ee68-1923-114e-e28d7bfef422@sigmatek.at>
X-Originating-IP: [217.175.200.226]
X-ClientProxiedBy: VI1PR07CA0284.eurprd07.prod.outlook.com
 (2603:10a6:800:130::12) To AM0PR08MB3443.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::14)
Return-Path: christian.perkonig@sigmatek.at
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.37] (217.175.200.226) by VI1PR07CA0284.eurprd07.prod.outlook.com (2603:10a6:800:130::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.13 via Frontend Transport; Tue, 29 Sep 2020 06:33:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d29a3edd-e3eb-4ba2-8071-08d86441a25e
X-MS-TrafficTypeDiagnostic: AM0PR08MB3138:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB313866C6D2E1340F6122A65796320@AM0PR08MB3138.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aglpaNPp/Qse/yVRQvNBRfPw7XVl5zry0x55EBPW6K8GlNurTNvsybWC4Vzv0pnjjTa+dFP3VCCC1IOQuu6ofoYS6CmmR2sjZPjKvJ7BTjzIwFFSTS/xvFQyGHTkYiEFdDOnP15Xo3jKw5+Isb1LC4/jFeDuOjjXOylmTCkoM0UzkCIG2SWYiTXli2Ki5a4ZkH5sXPfNl7VCUmujRbpoGTTUhWzGxDbJCIYQKDMI1H4pAfhPN2AUylxcc6QOpHF54NXpu7CMsHSgIVDSgPxHoBgfcAPiyThe0WO/ELisZNB4Ss3esob2FyVGroJdiM7r+jdr8bexOM5l5/vGXr8Nyf9KGge7jC5R0yiwnz0KZFglJEkc43HAcKgBMgh1dDyV3dZOZpoRyKKg1etY84C5m6mIEjpzdmc94Vyci/AdLgf1rieJqniRtyxX6xBv51+6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3443.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(136003)(376002)(396003)(346002)(366004)(19618925003)(31696002)(2906002)(6916009)(66476007)(66946007)(66556008)(36756003)(31686004)(5660300002)(86362001)(8936002)(316002)(2616005)(44832011)(956004)(16576012)(558084003)(8676002)(6486002)(478600001)(16526019)(186003)(26005)(4270600006)(52116002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	8b0djbw/H2zy5MXTXxTgTBJxR5xkB9EwNEkqgybXpHyF9/518Tb+mj5m3miPZYfXwpePfxLBCS//911Qw2DQujjm0683Vv+nQo3SMwwI3AmhnwGo2HRMRZJ366rSwUJV3uazB7kmegzEJqF6HTFtMRscHUMGPdnxrvQmU69QXLnuo7L/mFuYxAiHQW03sYSGb+gkxY6bJP9PsNaG0qIOLS3J+HlMK7UQBF/I3D5TEg+H5FVzrAmK4kbl7jPxEDxDVJtFK5s6aHyhBNwl9+Agn8hmTHzi2yTn7sTWJSjJMdUO2d2wfTmXQEu3PBL5qDkmGn48UTFvjJukpiswI9nPgswW/Ld1zCqCdbf3hR2hSQNYDcUfSDmcmdYtRnr+LnXR6Gd7HDGCUgWtwqKHN+MiyfwimMFKoPmNvJfH4KNPeMJsWKi/QRExxj7toYwaxd82eLq+S3Y4d19kWj2fbKGxaeZl5JbzdTyk3AbkSPpxHr1sWVE1iPUUO5brJBzwhrJwPr5gwlMfAYGzan5eQRhRMioAcVpw/R+mvJYpQ3+kEnkdJ64oBDobRd9rg3w0u/tjDS6+La2mqP3NPkihFjDVIuU6kbddZPAzEAoDoo8JMVEjam6wOqnb6MZieK8lvzLWmmWXLgwZ7zCmhhPyOclIgQ==
X-OriginatorOrg: sigmatek.at
X-MS-Exchange-CrossTenant-Network-Message-Id: d29a3edd-e3eb-4ba2-8071-08d86441a25e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3443.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 06:33:53.4838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bcb1d87a-d2bc-486e-a62b-9ac9c746bc1b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFkafSXWpyY/VaTZFuACAOsUNq5RZFom+9sndFazAL1foFJFerE8I0rXzm907cngxK5NEd8zMKWfDuyvJ37Xe4Z6ZsY3osLKA64vm/vJ2f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3138
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 7bit

Can someone review the patches

thanks
Christian

