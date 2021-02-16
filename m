Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.107])
 by mx.groups.io with SMTP id smtpd.web10.5797.1613469594084357055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 01:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=CtjLwc+J;
 spf=pass (domain: outlook.com, ip: 40.92.89.107, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQJE4xC4l5KiIZq+lmV2pQCWFVKFfw+WCauCMoUqFOMVm7a/SgWYXmKOHxXrpEgAwMkXCDagzBZuEdJehBLWuvh5B0JuvjZwPRB4ffcmIOS7VPEqtTkUOvkNIoONV8SIbruoxI1qcn3IWg58z5J+hE9R5tnaHIIV+ymwdDwZUH0Uqprj7oWS4eZRtBpQDpOt8U5ignw+DAWYem3pzFOD3iWow28Ws8YHZWbMYttGx+BPPIwDB5LHFUpyVtFMgM8s72u63qHu3XIi8TgbHGgCP9wurMI/EDDQwyERfM11TpSNQJyeSyt/4m/vWfTWoSe+uSc9L85JDxanE4sRLnVHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iYsVDAAO/dpUo+eIBZJRepbgI7OsTB1VL2Dk9ci0iw=;
 b=GRTTB+JZb9xgbIseZEAZqtRRQwtlkHvIdPg10a+9qZfE2nTor2QEMN7R1XRnUm0K/Ak2OLypGZQNB7rJa0GIyTOGMEUPuo1P9zeH1Q9zhVvqS6rijfukeag4Uov8FWtWC5JLBtY/OrM+uLKH5thNcnIa6tmPKLiVj+2YZmXEjSA/pz3B//fphD8uRvoI1Uaf5e01bOdkT6r8nlClimAn8ThvqAbZtFu7imKfq3GLuXs6zzIk4/KhEzVYoqV13kwhXOzdFgF9y9OWdVkgzro+P1eRlRCY0mnIG/1biWavetfV7RwZBe0HiCKEMNiIh9z2XZzpbOC2Yma4XCEDkMceIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iYsVDAAO/dpUo+eIBZJRepbgI7OsTB1VL2Dk9ci0iw=;
 b=CtjLwc+J9YoPYe/ROjzx7oAq7eQ+aDt4OAANYuf4SVfOVuma2ORhJG5V1YPR6tAytN/ZSFqUqh01cSxWr/0xcgJKN/RJksrccO0xfENG2L3Ymc7EeSn36Bwqu1fUpWk3DL5fjl+Ri3U0T/QvnSUJUJMg/lBFjO33YcT6gzSEMZmBJD736ixfwQVDt8mutQR2CO/vTZqGhPAI8GuZ4wBq8X41btRXNJTJiHGBoLanJn0mNzft5XlDzgx/6RAa+aWLu8fREW8q6PoncgdHWjdgYXDH3cpix/BwCk+qigK3RUzb6uYmCy3hEKZYRtda01mqsY4sDsDoAhVKGW45zurP8w==
Received: from VI1EUR05FT061.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::40) by
 VI1EUR05HT127.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::468)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 09:59:52 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc12::53) by VI1EUR05FT061.mail.protection.outlook.com
 (2a01:111:e400:fc12::254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Tue, 16 Feb 2021 09:59:52 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:ED2C015FF2690D54E074DCE55627E52C59550BE7A8EE23A9AB53A7A080C25685;UpperCasedChecksum:86ACBED5BB3B2274D7DD1D8B20775099E99CD6167B5024EEDCC9516EF99FC396;SizeAsReceived:8492;Count:45
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 09:59:52 +0000
To: openembedded-core@lists.openembedded.org
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: native python recipes using setuptools
Message-ID: 
 <AM9PR09MB46427C15B7F9F7652EA41605A8879@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 16 Feb 2021 10:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-TMN: [dxUsOt+/Yd6U8XQZfin5xgEFBO0hkV6+]
X-ClientProxiedBy: AS8PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::35) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <a76d6b45-670b-82a4-a5db-79f662026d05@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.84.106) by AS8PR04CA0120.eurprd04.prod.outlook.com (2603:10a6:20b:31e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend Transport; Tue, 16 Feb 2021 09:59:51 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4d2a9624-e2cc-4b8b-bd53-08d8d2619a8c
X-MS-TrafficTypeDiagnostic: VI1EUR05HT127:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cQcY/jyhayt1cZ59L9K5hCh338pG6D07PjVcCHHZngzQQYaSp5oWNYZROBnXPU5PDDuhCH9dvwZ4VRQfugqp5oXBaSZx1q2c+rd0+fo7LWJNrSXoeEq5T3jkg0qFwX+Grpyw08C5I26d2EQW74nMTBc8i1iKXUqOHUVHOyyYpMYKvMOCDhKI9454vP/7pMEmL+wRPz5KhCu7aFHt70p7nefXgGy1Ff3jWVnEbzPKt6PeMaadnZG95Ow39dCpkSB96TtXzZ8+H15pMWDq+KuUqPCSi8zZtFdKIOqW6Z2hjmrM+s83NuOfx3vyk8clR+tFsrCfdbGv4nrtoytwYrB7Z+n3BITEcbbJTan/Y2hsb0G4A6GDqwRmjOIEnAJj/Xk9qVzBOw6168fSslXA1r5xFabFhKiYDBoPvBBnso4T45qWyCr4ufHPX0zERMl74zlZ
X-MS-Exchange-AntiSpam-MessageData: 
	SUrm6/LzP+C61fzM5eQHrIbQ6ujSpRqGYmekLDBWBDTTn355CpSZKv0WGEL0UdowHMi7VnlsxKAvW6wbsJC7l+7shuKMSW84SLnr6xWk5fL2M8PCapp8HIRHL+BO1rbTuOhr11+HggSOAu6yporx1A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2a9624-e2cc-4b8b-bd53-08d8d2619a8c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 09:59:52.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR05FT061.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT127
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I'm a bit puzzled at the moment - after 
fd6a007efa7cb45101a66f294af81d9d33bb3fab in meta-openembedded I faced a 
lot of changes in the behavior of native-only recipes (@RP yes the ones 
that don't use BBCLASSEXTEND :-))

after this change I had a couple of dependency loops like

python3-my-recipe-native > python3 > ... > python3-my-recipe-native

and I could track it down to distutils3-base.bbclass [1].
There for all recipes no matter what the set (I guess BBCLASSEXTEND 
magic will solves that in the end) "python3-native python3" is set in 
DEPENDS.

My question is, is that intended behavior or would it make sense to be 
more explicit here, like

DEPENDS += "python3-native"
DEPENDS_class-target += "python3"

?

Mainly this happens when a globally inherited class requests a native 
python3 package via DEPENDS (a not too uncommon use case for me).

Thoughts?

Cheers
Konrad

[1] 
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/distutils3-base.bbclass#n1
