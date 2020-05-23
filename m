Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.82])
 by mx.groups.io with SMTP id smtpd.web10.4370.1590223759523550893
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 01:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=bW0kQQ7O;
 spf=pass (domain: outlook.com, ip: 40.92.64.82, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZljSQqRFFUfpAiK3ztW8ZFysUQzZ0jnGrNYKhWF/hcQ202Q0WXIiOmxq72hsJFmzVa4pNxGmNrVhIhIoRQcEGW2EOEjhWr8TSrixY9C7KrMI7p84UpCnlSx2aF+VpPArQiylCn9+coRtNhfn31CiHWv6oSWMOGfdy84CpXsc9evKy6EbQkCtHDoGLi8M0CgYdbdylnPu5p0kBzpoaqccZ/i+0ZxE/i7qIO/BGen2X4tUEC3+gxNR+i0ZVftaHVZtzUIR+of3R4ZMw4+vuaflRW3eNiy/0qZhY4V11Uxu1pShskC46xDrmL0KD/qGRWtGWKBJPDSYbGoQMCUpRT+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZtKEHOMbEicO9oawkvPfUmhDPWDv08PQCqUiOILMHo=;
 b=eSPWuFzO1FLBRdfuHw5CnVZ73Q089F5TqcHLzZBF1yhkv1X2gtKdzo/HtdrmN90sqqbPxgqVo989kr4M3YvAKYwnOljMo7ibPHpXp7Q4YsiadF2ZYik0flvnsdinkrfNo2P/wsSYoLsV9z8fInt0DdC/rx93VuQrH9NlHq8SsiFfVN04/31W90rGlGnPeC3XCzXbdGIerDbFS+/Yiry8r63MKFmpcH1y/YGo6hJBnPAGZjX517Wd8eoTKsbZDX64uhHIPO3qDgomTCfnjNsKuDS1w+br5pJCJnR7KTnt9Gv4rM7iRX7KDH/VqU5rHJ35ECpZFbiuxcTYzpknU23OCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZtKEHOMbEicO9oawkvPfUmhDPWDv08PQCqUiOILMHo=;
 b=bW0kQQ7OI5YU7Jz+rDVpvWhV9KjduPgDf2/Jm9j2GcKntyYKD7brcz3dHOQaLSMteXQWH95SJaF56TbRL+n2I0yic2wU8JbUygaDd7vjlUBaeXaJZplUUkl4Jox31rBm8clCF+BDmSCmnSgjt08DZSvH3nfDo//pnvpOsrkhPSRvBRnUkdj936tQx09szz3If3Lxa43EyDclO+9czLEMuv8PymIZ9u1AFK8XELVL3GxfaUFU7/3ChZmR3BgK3h47Wo5xKC2/xIJw3UNQPH/sAGiLzElDGL1ZvvIR1Z0ExvezuxKxGEydtDgtNntc30rhpRT3xA19AHY+8OgD/sreYw==
Received: from DB5EUR01FT060.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::51) by
 DB5EUR01HT021.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::382)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Sat, 23 May
 2020 08:49:17 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::42) by DB5EUR01FT060.mail.protection.outlook.com
 (2a01:111:e400:7e1a::488) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Sat, 23 May 2020 08:49:17 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:5E511DD927C448EE35F66ABE4B0E6BF3869E10B6BC7297FA988E9B221262A3BC;UpperCasedChecksum:3A5630DCDD6AF2391F27A9282DA14525CA1F952EBA34E111C82EF989B2631127;SizeAsReceived:8644;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 08:49:17 +0000
To: OE-core <openembedded-core@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: can't create boost_context lib for boost-native
Message-ID: 
 <AM7PR05MB688122DB540C514C7F56E3AAA8B50@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sat, 23 May 2020 10:49:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-ClientProxiedBy: AM6P192CA0100.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::41) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <d5a2f322-26e2-1694-e780-c7da4e07eee9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.141.93.143) by AM6P192CA0100.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Sat, 23 May 2020 08:49:17 +0000
X-Microsoft-Original-Message-ID: 
 <d5a2f322-26e2-1694-e780-c7da4e07eee9@outlook.com>
X-TMN: [GinblAj3sIjBUnvOlfrA4cbifXFoqeFW]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 08cb099c-eaa0-4834-7dac-08d7fef62d78
X-MS-TrafficTypeDiagnostic: DB5EUR01HT021:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HfV0PimA2+iXtKGSkuje/HwiIpia658xtELNurq3S3qjOx0bKBsHD2N0BheyKraZ2bqLJ+w3UC9k2LvqCQRcibktS1nrmJDWUhGQfOaqfa3g8fKznDphLspdNHNP4n5a/SF971x+dJXS/WXzQI54bI00BMkXrMVg1gfO2oudbKDDgEI5TRa+meeb/7JHWMbXSAhDH9USScoxgnsR+dOwyw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	3FS66Im4EM8QskouH9Ls/oJ3q9RG4pM/eR6N7aF0ayMygfyYNwOgZaUhw2S5BkgQSIbH0ceatbY9nEVFyXCXwUNKpozuNBLaFRm7Sn1p4zCmN4FTkkQx6HFLXSnSyK+64DqzzopSNiZdfsy98ZwCQA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cb099c-eaa0-4834-7dac-08d7fef62d78
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 08:49:17.7801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT021
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

For reasons that are beyond my control I need to have boost_context 
available from boost-native.
Unfortunately I didn't found a way of enabling it by a bbappend, only a 
full fork of the recipe would help.

It seems to be caused by that single line

BOOST_LIBS_remove_class-native = " context coroutine" (from boost.inc)

as remove-operation is always the last in the chain of processing any 
attempt to add won't work here.

Any ideas how to add it without forking the whole recipe?

Also this is another example for the ongoing discussion about remove, 
??= and ?= operators in architecture list and that there might be an 
alternative needed

Regards
Konrad
