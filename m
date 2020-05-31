Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.59])
 by mx.groups.io with SMTP id smtpd.web10.20178.1590947931940115408
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 10:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=gVv+lFIF;
 spf=pass (domain: outlook.com, ip: 40.92.74.59, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4ML5OabZ8LeUOyHv+mTpQ1Nd9Yc3QGcOmu74YSsRyh9WQrISr4q37+H/ZVn9ljqYwhPdRtMu3ohs9HDCS199VKuT5mWT1nhgFmHJf4444Cbgaru8YBMU+k9W/Vu5/tEYThMPs3cZvu+OnAeFkkz/zI2gpMaoyn5lvuN+Rs1se/jQIpdluDDdgxc8FufKzcRFHWYXEBuYc44Wdca5lrKHPTZGssjLxufV2kI3DZdXnXZ/RSGE9EaEnE0vMknrUmkHoaBkwpJ5nEaC+rTsUUW9l9WI/HrpYK3v9ux1MRQWDd+noCdMA9/M6TWEI56Dq1jacW0Mc1/RepKqrJJ+QbxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr/hwM/vRpr9w388frS++M4Udcvmk6WLoFfugqzXXO8=;
 b=MCxUlUpEeU8NmV/OobgtX2QfsVPX8TmlS+BCnGUmBMe00V/cLqxqgLr9yzPIEGVbxdTLVNH+fvZ8C7qq2HC4AZlW5HARezrqUIEw44UE2MTFML07tLFL4HyrTMIC78b5KdvMHS6ijrYqPJS9qY2x5wDNdNV6ZuMW/mQyLJ624Z9EAXYeqYiudGyE6ZvSCTaX8HkM+nhIvDVaShWersM7Udsy0naxMttW5yezb3oTScUL1Rwcm60AjCTuN7GRIpc7u9kWbdDQI3dXm94BGZhcfL0RO2QQGovbXBSqNwJi5XAPQcjitHWfbM1yXfD6xBQNe4p6CL1iMU1HE+79MmsrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr/hwM/vRpr9w388frS++M4Udcvmk6WLoFfugqzXXO8=;
 b=gVv+lFIF/AWhxp6LiRc3KxCoWvqGBasVB7DBF3KO5Llu51tWIlDu6eF01VpsOI0z9ow4Qq8SYmIqcAizNLu28JAqn50p6CnMz/aun6/zvfkrgut4auXU4yEB07R9Ulwt0fsgJ2uaDkC8Ipq/1NAREir8w4QVHBU+FmeJmeGQi7JN795eVstOnSVIRqr+wfdSsRMIiatZAa40Ms1KxovpeDpdmjvdVTcFYfo1Hwpw3qG9rw7fhouM246YRf21aCpsGM5ahtkB9mokr3UFewiQmNiBdFVljjKh/mj7xpPnKfRYwibCLVAHA2xSj+1AKxicvbqkWSpg789zBPdMuGGfKQ==
Received: from VI1EUR04FT015.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4b) by
 VI1EUR04HT016.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::240)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sun, 31 May
 2020 17:58:50 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::44) by VI1EUR04FT015.mail.protection.outlook.com
 (2a01:111:e400:7e0e::148) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sun, 31 May 2020 17:58:50 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:CAC8CE18FCA9A86A24F54B65CCB0AB8A4F922DE8FE7DC25A65FA818CA97F14AB;UpperCasedChecksum:5BE887E27CB8BB9029ABD3D2A6DA999B46E6136DA36BB3F1BA317B5D5E884151;SizeAsReceived:8657;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.024; Sun, 31 May 2020
 17:58:50 +0000
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Qi.Chen@windriver.com
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: kmod: question about RCONFLICTS option
Message-ID: 
 <AM7PR05MB6881F168863D089A7265330CA88D0@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sun, 31 May 2020 19:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
X-ClientProxiedBy: AM6PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::19) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <3695c36c-aeb4-2302-c9b1-3bced1da6713@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (79.215.15.24) by AM6PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:20b:92::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sun, 31 May 2020 17:58:49 +0000
X-Microsoft-Original-Message-ID: 
 <3695c36c-aeb4-2302-c9b1-3bced1da6713@outlook.com>
X-TMN: [O9faxYGwvR0BB3vQuEBNPnppn+xlJjyG]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ca116cd1-470b-447e-f19c-08d8058c45c7
X-MS-TrafficTypeDiagnostic: VI1EUR04HT016:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UfVBJ2l+KzSiiL3zwTjqKNXJRI0wliOxUHPDIcQj7+Po2IMAJXvIUCq76nyBzrboI91mKTwxW36NILRQMcXdr81Wk07IWIxE/p5VICoKwXq4P26T5h+R1ZRrz69VD0zQTQjIDO1U5rDPVwbIe+OMdVOK8QjlVV48GeVlvUAUh+riqX2omd7ksQgVAQXGODevypg3gbBnQnm37HrTMcA/0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	47i5+2Nhp46Y+xtruEg0lTrRf4QVxFCS2KmLL0QtX4lnPtmU0KTx/g+5myLvCaUHoOOtQ1yWQkOoP3L1NOnIFQ30grwlP3+xjOIrxnqkRVj+fLSRM/stH+2yurVY3zNxkpEn8IlWQusAqalKwm8QVA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca116cd1-470b-447e-f19c-08d8058c45c7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2020 17:58:50.1000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT016
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

I stumbled upon current kmod recipe, which does have the following line

RCONFLICTS_libkmod2 += "module-init-tools-insmod-static 
module-init-tools-depmod module-init-tools"

but there is no package "libkmod2" defined in this scope (nor is it in 
any layer I grepped so far).
So my question is, shouldn't it be

RCONFLICTS_libkmod += "module-init-tools-insmod-static 
module-init-tools-depmod module-init-tools"

then?
Git history didn't reveal too much insights on the topic and I admit I 
don't fully understand all of the implications of this setting, so I 
wanted to raise the question before writing some (possibly unneeded) patch.


Regards
Konrad
