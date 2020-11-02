Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.82])
 by mx.groups.io with SMTP id smtpd.web09.24997.1604283501854373519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 18:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S4s6gWpP;
 spf=pass (domain: windriver.com, ip: 40.107.70.82, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ3F6hyjgj7yNMNUiUtbkeMFMdvW+keBS7JRg2xCOaPThDxcPGlwsGgZoKB7TKutqQk9A+9C1LALKsVv4SvAXkz5GheX+7Un7xGJ7Gg3WhOoBslVX9va0l3Hd3E1ULOgQzMrsrLipb42KCcX82qaCgiIKzq4b8A/ljQrxvubus/JHgla9gvSMJD2ajNoXgprkrScrWLA3PS7rridxcRn8XUxUnay5mOWbY9EP5DUp/9nAnKE61HU22Tseik7q8VgQD9WzJzvaEEM32m68qZaWTikPuKfUB6AUnba3HPElubLfQc/fGkbRatVAG1/HKMTQqMhzjm05gJNKew7KWf/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV40EAfAf2St9J4vceYXyzpyFjd0PqalvQSYsgOLEqU=;
 b=mEvwEEzS/pytlRZMp+zd2IKv6saV39GMO3Hsrq6gYu+oq71WgknYApfBh/gmzpN2rnjUYNCw0kf/XGPQYBeqOv+ZIzgIMiVy2nCzUqJQVNEFWtK7NnZhXx/TvcamITSJMaqmGTEC9osljDzxIWU2TCR2FcXISB5Z+qKCIBJG/F1rPZqi9wMR4yTcKQrQNrnR+b1yrM2JjtZddFnACtZcWO5nhXl33/E3Mj9/LhubuluSYaUbKR+/XWuUl4WiFg7iy2EJnQHw330+1gfo2ss1YLQotcnMtNOHsSPVvxzWlI82vbxC87LDri89eGEoQ9HETcKvM28Uc9vXeqBHKCM9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV40EAfAf2St9J4vceYXyzpyFjd0PqalvQSYsgOLEqU=;
 b=S4s6gWpPU7aFc++Gjxnh25SgOtvvvJIKnrvW7jrywo1/+so1mS+8YXKs53kgohOuNY8Q2z8N6RyT1IyNXe5S4gEDz58aNrbeboFx84Yl2MRYESJ45dP7jaf4j1AMN/vnIC8jMJztORD+0rTpxBixZjk9zChr8sii1mxcIPslyUU=
Authentication-Results: opendreambox.org; dkim=none (message not signed)
 header.d=none;opendreambox.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3485.namprd11.prod.outlook.com (2603:10b6:805:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Mon, 2 Nov
 2020 02:18:19 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 02:18:19 +0000
From: "kai" <kai.kang@windriver.com>
To: obi@opendreambox.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Update check for systemctl
Date: Mon,  2 Nov 2020 10:17:55 +0800
Message-Id: <20201102021757.32532-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:203:b0::28) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0112.apcprd03.prod.outlook.com (2603:1096:203:b0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 02:18:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 029e090a-189f-4ad7-8f67-08d87ed59082
X-MS-TrafficTypeDiagnostic: SN6PR11MB3485:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3485F133BE34C885D63C18E695100@SN6PR11MB3485.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MKATBtvUp7Kxii4YaS/NxsiJOqj8pNxGN3w1PUlR6gGxGpPOcp5+9ISHY48yzXxQXmNXQ3d5FHqYXlH0Ur1h2wG2ukWLzrhrJfob1/Bj/8dcxljrRt0cNr69nbEeVgBCPXB0Ov1s69dMMsSnZpjLCngiUJZKqX+hZ8Hb7rg6do3o5hvBcTpoOTMshtM0Wet3NSlSRIpM14Rur4svQlR/TYlGrjjYQZ+WWNo6JQQIHBzmtkD9g0jwd1o/krln1kK3BsFLH0LVPOS4NTnmpQW+H987UKhntF7CeMoWBwJrszIADDbSvGgwznX7gAuFjVgNF/LLDrQ+DEcdIfuRCz1BNg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(366004)(376002)(396003)(136003)(2616005)(4326008)(956004)(86362001)(8676002)(52116002)(66476007)(8936002)(66556008)(6486002)(66946007)(186003)(16526019)(6512007)(6916009)(316002)(6666004)(1076003)(6506007)(36756003)(478600001)(83380400001)(15650500001)(9686003)(2906002)(26005)(5660300002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qhmNkZrm9ek4i1bkS4xqWjvRNoGDVWiZfqICjXrf7vq4Et0C1HniClC/WwAFkRLZ7iAL881Dteah1ou11IbFiaTJD2C8VCWcBD4TFk1Ww+TZpwO/A135B67q3K3riOZdYZJe7Pk6Vdd8U5kDUBWiG03MFNc7t7qfeGIPQkJ1bUgs6xgsr5X7AOIo105kjqWu6mnV1M14riQLOis+aZaVWHPybyWx4U7pbeCNXh8YH1hkEjAaH63T2/+gVvNaIFft/1hUN+4DNvD4//+Y4GXL58DG6IAD0DKAXPdaqqia1GWBhGdJa0PhMmpp62QzUHSHRMFl+RPpd7Gsnv0hw8usgZ7f7Gj5TK/sG85PBZGJW0AMcyxRZkQ6jomuxq8dqRgCJ19n+MyBQ1QVp4h5UjEhf82wgU04nhfQNoCcPSFQXQ/rt+wh9i4FeMNKHRUBV4Y/zeqJEfm5+sJgTLWvARm/doR2b4ABX4Vq5PBX5UUx4dc0/L6F1HoEOwuaL3vKJGVsitjCQIX/0rzQq+JNQmWBuRU2RC4ipTWcoZ5cJIkJtiyLUnnvqamwqZKT1zmop28aL6BzDrAaS6cXadctFz8tnYI1Mc2Pa5gOx6qJH6cij0KQ8k5TanhssLEFtcu/w9v85c4B4zZDMLkLrftBruju5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029e090a-189f-4ad7-8f67-08d87ed59082
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 02:18:19.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW2qrRM8rBOK6wIWNFUfbW40YWIssg8utBMlTU5V68l0/FhcbxyJ3lM+pORQlgtxe3o7SjWp1iajloBvOmdcPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3485
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* update systemd-systemctl that could call systemctl without argument
* check with excute 'systemctl' directly

Kai Kang (2):
  systemd-systemctl: capable to call without argument
  systemd.bbclass: check whether systemctl works in post scripts

 meta/classes/systemd.bbclass                          |  4 ++--
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.17.1

