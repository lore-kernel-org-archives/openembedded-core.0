Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.59])
 by mx.groups.io with SMTP id smtpd.web11.23263.1604980624263556343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 19:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YHsqODSg;
 spf=pass (domain: windriver.com, ip: 40.107.244.59, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BouLp5qSXbXsxIrJurBqbtibh76AHc9YnddIlfM4BOLTU+ebQfibf00zXmlMbeR0GiTTK9h0UgB3jEUQlrPRKp3MQdlnklYWXNr03UxhkeNv//NiYL5uCoe/oSDH/JcVJArTavBFrZfBQIijP9LJQgSi5KsN7lRkPz9OYTvdTwznjmJsN3mWvuyCDK0/c9oFa+uiHKUZRklr8pHQsbuWygntNwwA6YYD4Qzuz9/cAI51j3FKNMqK4goxk+hovTvaRbCJV1s4QbQ70t0snsyMrZ37TwX57x0begT0slKXFX1d+nzcml/N3KxW9FwqnLZwplCfl2PIAxm6CXhD0xEKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E10qqie/sLlR/rh83HFahRMi7F44N85FBvP/EU7SfQ0=;
 b=Hi0qrAkZR86Rlok4CBfxQvYIZ0vXB69fyxmyfw0qILbDY+uzRI8E/awU61aUMFnLCkeU4yeVjtUvmxbE+m9/89VZOXx2Uc5CbWoJWi5oyWa7OsuNjv60rCmzqRwFcDaeOlCQtfTA4KVGN33DRyNZjAYpgRWo6vGhVtYd2yxqFGLUDXCWXghv+QpS4iQFhe21YvbI2oSf0xQkONT/OtssXLe1NUxWnCGOE3Y9pYkbpzHkuhtPbFdq0q2yLfS3ANnTt0Vh7E2BEoTfSOnva3nrWhPR6db2tRsQPQYjQE6O6zHOZCoqsL3YFmIOfunlrNZLTGRwAsUL3mHk5liFrRKDAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E10qqie/sLlR/rh83HFahRMi7F44N85FBvP/EU7SfQ0=;
 b=YHsqODSgUyKsPTKIRNiwLThnZKnTaE7Th8l0YDxy+xug7krTA2DObZ8m5klSVzrkBwwLl5DUDE6fIzYEmpQRt7cuuM2cfs2Lc1yg83CwsaiUVnQRezkyMN2kDWzgx8PWg+UJ3I2fq/HWgQ2npkWd90c+N9kJdZV4+M4d8K/e55I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3421.namprd11.prod.outlook.com (2603:10b6:805:cd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 10 Nov
 2020 03:57:00 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 03:57:00 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Resend the patch from Joseph
Date: Tue, 10 Nov 2020 11:56:41 +0800
Message-Id: <20201110035642.19754-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0018.apcprd04.prod.outlook.com
 (2603:1096:202:2::28) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0401CA0018.apcprd04.prod.outlook.com (2603:1096:202:2::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 03:56:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5cbbb83-7615-4d75-9058-08d8852cad17
X-MS-TrafficTypeDiagnostic: SN6PR11MB3421:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB34211F35DBB244802BE288FC95E90@SN6PR11MB3421.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uO2ERId9UvA1ecJc0UT/fW8c2gthkf5XCuPDhJtEA2u2q9qL5vmW1AgCydF9EcXyDNEJHJqTy8aEJ7khWf9O3b8+3hpqUfT7rftWMxp2omWt0GfWK9Xn+BllJEEDC20PCLm2ZOgIV2vfy/ZQ6jYeCNNx0O3xKLFVSjlVpPfObzT0Cr0BOBggOiRei8xp19qUmtF7JqHq8lI2T4QzNgoQVAeTZUdztBA4GQMZ+w5JG4wJQwK872h+UqqCbvwyLcWXe7E2LzaFUSMoDuQlKTKq0Xfoz/qoqsSQiRJC8R7qumImKcJw1UVYACzNCRQ2/0XLpB51vAAfC2gBAvSSKIm5WR2pNY/hy/s/m3MTe+UDQVRhIFlzDZju5aeaS0aYvC/IP+R/4t4c+T/ah2aRvdwRRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(366004)(136003)(396003)(6506007)(6512007)(478600001)(9686003)(8676002)(6666004)(1076003)(66946007)(8936002)(966005)(4744005)(6916009)(66476007)(186003)(86362001)(52116002)(26005)(36756003)(2616005)(956004)(2906002)(66556008)(6486002)(316002)(83380400001)(16526019)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UJQ8Lc82ZFZw1t7/Y9er45METnTrHZlx9UJ80JOihe/uzoQcFowcCr2XPBkS6qbKHOleQkJEFD+eXaAEc68fwoPKwHncSlvJj4MXok8fLiCOrzeqVg+xJKZ8zZG2FaFKVjwLeUEOBeES9jyzFmrHMrMwZnfpBO0v5g9IkdZo8bhCpUCFBjOtPHxIqJQBT9D5Xx+Lc7Hb58rr96GwXQheQCgKHVdXDONVJPP9q50bB11M4nOBzQcHd1ZDSPlY6JUqVkCfQaag5Gp4D7AtIgJRjLK0nP+wMEqgrwiJk7pHfTpLl98JDg0Ah5k2C5NHxZwRbfx+v0kgLtZpG6e7FY6C84UU4jB2L34vXj6sYF4gOksxDGg0gHn1Yea9Zjw2csG3TANRFoDnjLKL5Y2gWn1I1RTFidLxzWFvhugFt2j4OfQZyHz4eAq9f3mguDyaWi/dQvqOklIrp4dOOkklGjucJ536OZOKboFCZeHak+W7HtHC2t+3sLvMRlQAnqQM08wyS7yiGwjAtjwazVN8wGffb/YfYgUlBweTBvczTWvZx4C1F3aCYfPefKtYwLEtyFEBEvz7l9LLAdclvSqXplLQX6SEGqgLbM8q6gcxtcFyTFjG81Gs6BTebfcqQQP17a8p7Ml0az1a9T2zBqp9U9B1aA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cbbb83-7615-4d75-9058-08d8852cad17
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 03:57:00.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubcwEg/vmOi26JJhavcr4+rr4sqe4Sd+wqFB7PinNmHoZiZPdMIBofAbGlARXLJ5sOkB89r6Ka1V+j/G3KbWKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3421
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The original patch can't applied with 'git am'. And it is useful for me,
so resend the patch from:

https://github.com/openembedded/openembedded-core/pull/63


Joseph Reynolds (1):
  add new extrausers command passwd-expire

 meta/classes/extrausers.bbclass   |  3 +++
 meta/classes/useradd_base.bbclass | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

-- 
2.17.1

