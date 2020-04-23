Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.80])
 by mx.groups.io with SMTP id smtpd.web12.1640.1587624339839951613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 23:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=eijHOXLp;
 spf=pass (domain: topicproducts.com, ip: 40.107.8.80, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyvBVUF7gYxAD1pVoWQHOUw2CGg8JX+CzZnuZKSQDK4=;
 b=eijHOXLpXsaDQkE4Rpo6jLCb9nVUu+dSV0hSZRS+LgDfYMO1hHo/4np9gIM31maxZ0i30PjoBC7HurtuVeD+38mjV5zzIGZpQA/t0tMxcYH/H27C5FZqix0Thtiw1ix+sYLlxgHQGwTiOaVJAh+r2aGYq89RNiegXwcvqFM53NY=
Received: from AM5P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::20)
 by AM0PR04MB5907.eurprd04.prod.outlook.com (2603:10a6:208:12f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Thu, 23 Apr
 2020 06:45:36 +0000
Received: from HE1EUR01FT012.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::3b) by AM5P194CA0010.outlook.office365.com
 (2603:10a6:203:8f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Thu, 23 Apr 2020 06:45:36 +0000
Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=fail (signature
 did not verify) header.d=topicbv.onmicrosoft.com;lists.openembedded.org;
 dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 HE1EUR01FT012.mail.protection.outlook.com (10.152.0.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.15 via Frontend Transport; Thu, 23 Apr 2020 06:45:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.54) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 23 Apr 2020 06:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvJkE4KBpnkF9xC1hLhzwxe2tSUDzfEWwpymePUpFFMmN12i1Wg4wDFCQu7GMxbveSkJiLI9x/JGEfiHEI2OXO/7VQjadfeDEX7nZP20T95ngcKwehiJ+EwLw/ZvF9qc7CHLB0eq1J9vse2UFQfuAvlbsS7WduyoSFJP+r4lA9a6GFUakQiJ6g6lW1Dg1SIyvbjWl9jUIVnyq6CjgW7H1Pmj6LVrCfM4R1HpUdgk/UC1N9R710yHanriHg4ycWl4jNKBZBD41JMEeet5+hl3mtxDPY4PxR61bvG+JuYinOdeRD2tlz0d+18uOibR9TG7IsS1WHdaPLYSs7nYnvJY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypt2qLhHhSZTfSJXgWkTeDu6xelABUgXEcSPvMwSdZs=;
 b=YRc00GSy03/bP34NSlA8NHXgnXVrzZR6+Eqgu7phVMM/NuKW4fQz4Hv4nH7USoAXmnixYtvJhgevKSKwxHchnw4nC3gUzbZ/F/TvlCfPXTV7xGinTxobNna6tZAfscTwc6cBNCgf7oKkLBS61vTermF7pUCAbip917LVIEXhL8km28RPMqIYicRAZWuZ+EhqZpIZr36DNBdhpaFO1h+PiRkaK+iPxan40C6XAiGAPc/8QdjRFH5JQOs74B5DHzJdhekWkk+CitXQctf2a5f4JKFTYg+KxwY6rgibsJzYijZ9Ai/8sXQUwjXp2z+3neMrYekVrmzRNDhMXPfNTabD9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypt2qLhHhSZTfSJXgWkTeDu6xelABUgXEcSPvMwSdZs=;
 b=s8tH13z3yZ0j4KmAXt2tmjoCg7HG9Vnyrbge6a21Uv87Mh0QLQ7kR7tMgCoxmVw+jcKSnqPNSIPBqfWRHCEGw/0m8/xOES8mRQHIZqToJpfOzWvDn8sKdDOncJKzChCNmkPXPpbgYLiuN42qamIbeBGEq709+aWNN63Rdl9Cpxw=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=mike.looijmans@topicproducts.com; 
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6794.eurprd04.prod.outlook.com (2603:10a6:10:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Thu, 23 Apr
 2020 06:45:32 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::1ed:921f:1b:4f0f]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::1ed:921f:1b:4f0f%7]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 06:45:31 +0000
To: OE-core <openembedded-core@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Subject: populate_sdk and conflicting "dev" packages
Organization: Topic
Message-ID: <8ee66f5d-99f4-66ac-405e-b6600f3f535e@topic.nl>
Date: Thu, 23 Apr 2020 08:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-ClientProxiedBy: AM6PR08CA0039.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::27) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM6PR08CA0039.eurprd08.prod.outlook.com (2603:10a6:20b:c0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Thu, 23 Apr 2020 06:45:31 +0000
X-Originating-IP: [83.128.90.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1ded927-d3a9-44a8-66f6-08d7e751eda5
X-MS-TrafficTypeDiagnostic: DB8PR04MB6794:|AM0PR04MB5907:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5907581B1661ACFB68B5133996D30@AM0PR04MB5907.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 03827AF76E
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(396003)(39840400004)(136003)(366004)(376002)(2906002)(6486002)(83170400001)(66946007)(6916009)(66556008)(66476007)(508600001)(31686004)(31696002)(5660300002)(36756003)(44832011)(8936002)(81156014)(8676002)(2616005)(316002)(42882007)(16576012)(26005)(52116002)(36916002)(16526019)(186003)(956004);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: topicproducts.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zkuKTEfwxIIhcuCoDA/qbLst7tlOti27CEbnaKLaAI283Owf6FGuOka0bG/jnkd/9IRtnI9Up1seGfY4rLqdpcOA2OBsxNZKYkkrqaaEG/3kjkB9IX4xpzZH+0ljCWo+CBBlqycJ9XycEaRJWG0/pRMtXh0uMkIn5h7cRVny/W35wbyAmDpg9ohzBCyE8Wyjh93ILWe8MZ9ykC8Rpqy/auiopiKwM5L2MPzSQwj+5PrByDqKxI6+27zGYLFwavT5lJhG2Ba2k+rdPm53WYJTOMSdqXB5ubbcIWBrBHvnpDWPcDUsRkSHjY3W1rAYjmKhOUFgq0QOBJSbVy+YDvqH/K5Pz5QBH4dSaYFhIWzTIWQYoE9Jcg3U3KXXTvh1nEBMcRzyHx9o4NipeZrpnP9D4ylkjgyJeoF8UfYo69zHKbStrHKEEEHR/z7OPqV3bYNA
X-MS-Exchange-AntiSpam-MessageData: U00i75CI6MDK9AXn+tC+KTYrT0S7m6SP/LYYmaMDP/jddCivBqjt2vWdsSD4CzpsqVOkqdRWdpbD0c/Ew6OIb7KN7KudbKrm2JW4EMEqs9lNtBzwFn/adXwyMptNiH0SIlyLxcQDUgaAsJ8G6ORVTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6794
X-CodeTwo-MessageID: c2b736e2-ba9b-49d9-8f71-53e71f56e8b3.20200423064533@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT012.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFTY:;SFS:(10009020)(346002)(396003)(136003)(376002)(39840400004)(46966005)(83170400001)(82310400002)(36916002)(42882007)(7636003)(26005)(186003)(70586007)(16526019)(508600001)(316002)(246002)(7596003)(6916009)(16576012)(70206006)(44832011)(47076004)(356005)(8676002)(31696002)(956004)(2616005)(6486002)(2906002)(8936002)(336012)(36756003)(31686004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ae4a79e9-8243-4721-7c6a-08d7e751eb00
X-Forefront-PRVS: 03827AF76E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RYuJI2wD8VS1wvsRgJFpg/jL9ZtGPADwV3K4ggYuWtpvIoBG7t8WXif10F9Wz7YhJGYPlbw8mEcOVGCvX2lmYJ5ITYSNNuFUANt4Q31sN1X/xvV5OtgmRHczgfgu5tSdMfvrYZerMKY+iLOWJ6Lwm3vXM/elM4pvFLDqVkoB3IfZmiVkXLRYauVl0zRfNzOqQBLMo5Erq6mfnpc+t3dlvTXKdRPPf2KB7TSYbD3Onoz08FNbrmNFt2zXFQgOoIA3tJymAnyQeJs/F0FmUKlovOGWKzX+Xh9jtRRW093sjOyEnURITS0aj00XkZkwFadfKzO+sAHxZRTFsiTchmX6gnxTRx29SQd0mE+a7RcrUJG8506L70MdDJmVAxmsSnbhe+W/ggO/pecUl9/DHiV5C6cGH5aP8vI2ug6+tG2euwjcvwH71mH9clZ88BGe9YzzCW++6mfGmtwoh/kHkXvIhoTlVv4RJQgF27v+CNnMkBZwlvvIwh/rjUqUqQgOvj3S55YgaVpBoGLgUViU3VWK+A==
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 06:45:36.1037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ded927-d3a9-44a8-66f6-08d7e751eda5
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5907
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I have a recurring issue with populate_sdk and alternatives. If I=20
install dropbear-ssh-server and openssh-sftp-server on an image, that=20
works just fine. But when creating the SDK, I get the warning below.

Issue #1 is that this is a "warning" but should have been an error. The=20
SDK just continues missing a few hundred packages and end up being unusable=
.

Issue #2 is that I cannot figure out a way to get rid of this error. I=20
can't find a way to remove openssh-dev from the package list that the=20
SDK wants to install.

Using the "zeus" branch by the way.


Collected errors:
 =C2=A0* Solver encountered 1 problem(s):
 =C2=A0* Problem 1/1:
 =C2=A0*=C2=A0=C2=A0 - package openssh-dev-8.0p1-r0.aarch64 requires openss=
h =3D=20
8.0p1-r0, but none of the providers can be installed
 =C2=A0*
 =C2=A0* Solution 1:
 =C2=A0*=C2=A0=C2=A0 - allow deinstallation of packagegroup-core-ssh-dropbe=
ar-1.0-r1.all

 =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing dropbear-d=
ev

 =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing=20
packagegroup-core-ssh-dropbear-dev

 =C2=A0* Solution 2:
 =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing openssh-de=
v

--=20
Mike Looijmans

