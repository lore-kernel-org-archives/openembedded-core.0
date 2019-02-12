Return-Path: <fsnow@phoenixcontact.com>
X-Greylist: delayed 7222 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Feb 2019 17:37:15 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10047.outbound.protection.outlook.com [40.107.1.47])
	by mail.openembedded.org (Postfix) with ESMTP id A18736010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 17:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=phoenixcontact.onmicrosoft.com; s=selector1-phoenixcontact-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HpLkvoK+h2eZZmgyYSjbj5kiNb4vmPEr7Czj1WFHwrw=;
	b=IEv4U2fb6ubx7fVg8t6Pdh1JOjAfP1cORTyRoV+foPPWBQpfKkh3p2yCm7DF0nnNZryf8Gp05Uque5QrTbFYiHEfhpboEkWMUmtppS8DQGjOyewySXuppPNswnxJDymEPm7XUsUpL+OcdCzuJykSn50T+Nj+d6KOQe+/GaotLXU=
Received: from HE1PR05CA0293.eurprd05.prod.outlook.com (2603:10a6:7:93::24) by
	HE1PR0502MB3884.eurprd05.prod.outlook.com (2603:10a6:7:87::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.22; Tue, 12 Feb 2019 10:03:01 +0000
Received: from HE1EUR04FT029.eop-eur04.prod.protection.outlook.com
	(2a01:111:f400:7e0d::205) by HE1PR05CA0293.outlook.office365.com
	(2603:10a6:7:93::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via
	Frontend Transport; Tue, 12 Feb 2019 10:03:01 +0000
Authentication-Results: spf=none (sender IP is 51.136.18.164)
	smtp.mailfrom=phoenixcontact.com; lists.openembedded.org;
	dkim=fail (body hash did not verify)
	header.d=phoenixcontact.onmicrosoft.com;lists.openembedded.org;
	dmarc=temperror action=none header.from=phoenixcontact.com;
Received-SPF: None (protection.outlook.com: phoenixcontact.com does not
	designate permitted sender hosts)
Received: from azr-iqsuite11 (51.136.18.164) by
	HE1EUR04FT029.mail.protection.outlook.com (10.152.27.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1580.10 via Frontend Transport; Tue, 12 Feb 2019 10:02:59 +0000
Received: from mail pickup service by azr-iqsuite11 with Microsoft SMTPSVC;
	Tue, 12 Feb 2019 11:02:58 +0100
Received: from EUR04-DB3-obe.outbound.protection.outlook.com ([104.47.12.50])
	by azr-iqsuite11 over TLS secured channel with Microsoft
	SMTPSVC(10.0.14393.0); Tue, 12 Feb 2019 11:02:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=phoenixcontact.onmicrosoft.com; s=selector1-phoenixcontact-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JS+TB1pZQJnFG+XGmXR1JBQHb8tufGIcu3ehWqCTT58=;
	b=nOPLz6Hyixv47XlKOSBr/6uTy6tn028TQKvRJ+ZUhO8abLYFyW254nLJop1xx/+0hW1F1gjnG0YZPZLylSi6kpJVBYgY88CsyW9FCsmA8MdP2F3XHAK4DfeAGv2Wrrub7OfZ6ZHmwoMU2svKDeVOxEltIOF820yKp5Fj9xnw8AI=
Received: from AM6PR05MB6357.eurprd05.prod.outlook.com (20.179.5.150) by
	AM6PR05MB6568.eurprd05.prod.outlook.com (20.179.18.145) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Tue, 12 Feb 2019 10:02:57 +0000
Received: from AM6PR05MB6357.eurprd05.prod.outlook.com
	([fe80::65c1:8a3e:3f16:9d95]) by
	AM6PR05MB6357.eurprd05.prod.outlook.com
	([fe80::65c1:8a3e:3f16:9d95%5]) with mapi id 15.20.1601.023;
	Tue, 12 Feb 2019 10:02:57 +0000
From: Felix Snow <fsnow@phoenixcontact.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: version upgrade to python-click
Thread-Index: AdTCuf+1N4vtWG1HREemV5dLITeusQ==
Date: Tue, 12 Feb 2019 10:02:57 +0000
Message-ID: <AM6PR05MB6357644B9FBDB2505BE9F0D3DB650@AM6PR05MB6357.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=fsnow@phoenixcontact.com; 
x-originating-ip: [62.157.123.101]
x-ms-publictraffictype: Email
X-Microsoft-Exchange-Diagnostics-untrusted: 1; AM6PR05MB6568;
	6:z0tqoJfs54uDSym+x6bAKde1GhYt4hlhX8uA4iXfB1nh6w3CfI9RrhHza+4PJgZiCqiKQ40PeecIG9jDgpS22U3xXM7si15quei5og8LPRS61jF3K93Am6QwEhKDu/+Hr0QAHbNajdvYOzvk0Bmmyc3nXJokniyj3CHaM2Pt5gF98D4p52EBARLLuzg1zGO4D5jjTIJuG8NAlq9maigNTFhK/Fs04xwWxj2YvR5JklaU+B45js3A0sjLSl0f2xqLjvBRz8jVdBdPwLktp52dyj2Z3/wK0Vt5OgDh0VfiOkPAjqOAiwJvJOtoWW4PXekIHJpS3azigEa9NXHl5OzzH4JsrA38vhuchY7qlNJpixCfIOgoUmHnIZXQgcngZ34FEq0ts3fCSndWvot01dUllFFHBLzzmjXuKhSvwy3kW5jNoyNvFxUIK1hKf1ejx7ohf8n71YfpGGLhHDSMEDwmNw==;
	5:fhjsCuqarZhOOzvm5Ga5hhK3nA4u1kYAqwZVdQDGsuDN/l+KlxsgJFwrl292YXxezJvajJTKwImEbv29Sx7fyKvozHFIqsmWg1ZYQeYadH++t3IzDtftUO6nuUPFKCw85madsKKMSZ+lqRgxz9KMPy2emu++JXeTmlY1+Eq1dkxKCANoS8M9WuWO4rxjt7242LmP9pH4Dmb215Z49TsSDA==;
	7:nfpoErRuy3wbfLkBLPIIRtWqvh1g3M5zlglKqJbroeU++ZvhnfPnTP8tKEH09L1PJ4sfuEu3IkrZZUG5zdl1RaVxnHFw715/8rihJ3uWWucHbhvHtZNcLa3s0++pySnYKOZhEOSW89QsHAlmK3goPA==
X-MS-Office365-Filtering-Correlation-Id: dcc5dd45-9f27-4a6c-8a20-08d690d1448b
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR05MB6568; 
X-MS-TrafficTypeDiagnostic: AM6PR05MB6568:|AM6PR05MB6568:|HE1PR0502MB3884:
X-MS-Exchange-PUrlCount: 7
x-ld-processed: 6868843b-f012-4c95-a18e-bab826cca9ac,ExtAddr
X-Microsoft-Antispam-PRVS: <HE1PR0502MB3884C4FBF742B2B7E5FD685DDB650@HE1PR0502MB3884.eurprd05.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(346002)(376002)(136003)(366004)(54534003)(199004)(189003)(486006)(6916009)(2906002)(97736004)(6116002)(790700001)(3846002)(66066001)(68736007)(14454004)(7696005)(478600001)(606006)(99286004)(966005)(19627235002)(14444005)(25786009)(256004)(26005)(86362001)(6506007)(186003)(102836004)(476003)(316002)(2501003)(33656002)(7736002)(74316002)(71190400001)(53936002)(71200400001)(106356001)(105586002)(54896002)(55016002)(6306002)(6436002)(5640700003)(2351001)(9686003)(236005)(8936002)(81166006)(81156014)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR05MB6568;
	H:AM6PR05MB6357.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: phoenixcontact.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: wc8UR/p2i5Rage6hrX1hg0uKuVEViorMdGfw/Ha5Hey3esLZje5ZOJvRlQoXPK+x50HsyFHjYe1oiO4kWJrLkBNHD9C25q3Q9SwEZ04tKXEQX2wfDTK+10OBTgAELH7issFi5kT6OzIsAN1SP3h30FpPXN7FVJGrYlyO3eQlVbn4/Yv2BbE2yFyWGX95sTnCiwKhdnuo26MsALAHKwpnYASHC0dixpR9tKz9+PuFUO2AjlrVwS25BL9iKiPzBb2ExxioKI928W6vqw0Fn/PNH+up5BY7xwk1emRdabiBzr6Uup+/Re2XGjSC3wtbv1GOqZORjUt05Q+8Uv311/5xi6/wJrD4wFP6RJTwLdYNCFpdxE5EwV8wtTPwohHLytP/StDxZantzopEOhT5xcCpBJdAAGGocx3qUY0SOl2PWY0=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6568
X-OriginalArrivalTime: 12 Feb 2019 10:02:57.0948 (UTC)
	FILETIME=[215485C0:01D4C2BA]
X-GBS-PROC: k7BRzbpU//IoBiUoohvGGIWacJX+DmeSVQVbfbS1NDjP9zS31X1iUvQnGcqo/+21
X-GRP-TAN: azr-iqsuite11@693A00A1773F468E8DC40166E4B69D86
X-iqsuite-process: processed
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR04FT029.eop-eur04.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:51.136.18.164; IPV:NLI; CTRY:GB; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(54534003)(71190400001)(356004)(97736004)(6506007)(478600001)(790700001)(6116002)(84326002)(476003)(2351001)(126002)(606006)(7736002)(63370400001)(3846002)(25786009)(53936002)(55016002)(2501003)(966005)(102836004)(33964004)(9686003)(74316002)(236005)(6306002)(54896002)(186003)(5640700003)(61614004)(26005)(99286004)(7696005)(336012)(81166006)(8676002)(81156014)(105586002)(14454004)(316002)(86362001)(33656002)(36906005)(2906002)(68736007)(16586007)(66066001)(14444005)(486006)(19627235002)(106466001)(6916009)(66574012)(8936002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0502MB3884; H:azr-iqsuite11;
	FPR:; SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; HE1EUR04FT029;
	1:5z4heMvBYrrIqn0sp3tJg0d1EKCmW+9bzZYHq215h89NqV4gl2LBC+jzDqxh9DEQSacKzWWBBc3ZFuqQOMtFlo1e+w5OP68/GWRkjiGWQ3zkTVeHZilSCNrLz7LuNxMSxSuZivXJuo3TgJWVdT9x4m0KR2OM8bA6CkcKA1hmsaU=
X-MS-Office365-Filtering-Correlation-Id-Prvs: cedd4f51-cfe6-42a2-7890-08d690d14352
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(710020)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0502MB3884; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0502MB3884;
	3:1Eo2HkulPt2Jyv1ctkLA/YewDLwFX5zCmtFi7CJHQNNV+oO0xJcPUxyC26HVAd5hP3tWM29q7DLmY6f5N/zxcqnTGvOe/OCbieIL2RLTeoEHuJPUw3XOZBi0jlROGXNJVYXNpeigzl3ycBaRkIynihnI8U9n+F4ba+X7xtoD4NWJJaLHK4VArDdB3q1//REjIbnVSv98g48o/D0Kd23Z24SFcHOz5zlxbrwfY+Ye+wHzE1z8GJV/vn/oC+R29bTcwliThXMjd+OHmwCkC6TPqMIr1bMv6YvUnCLeghfNfmav94aClJFqtKPYghwCTjoioh6wL8/YQ3A91/tWgYDbO5VJcJ1TpJroJAVvciJdYCubc64O0UHaYjD/VQbTATt+;
	25:sHElQiHmGixBNbrXI5PHjiBxVuVT/4Sh8AVCELij1pdYLa+YivaEejIXtwA5FDBoBLu9DClzaH64zEIaIiFd1LGkqRfJojKsWX8ZLoIf1/KkNIVV7vuMfcPZB0ZEYQHwQUaa0E89fj7thXW+aN5dqoOjgEdMm/wn3AoOspwbx07mRdEWSFbcn8gJkckP5/3u2gFI2goiJLm+kKZfaZ6LPjY4zubbZudO47lL5atHfsf1vHt83tzHZaP3d4HN0AWi4avltcFOLdzEhQdMWACOz25cBLhD+GPMpttZjI/IHFjxQ4LvgIy7x5ha13WARKSqHUYi8sTMYueJR1RAjTu1mQ==
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0502MB3884;
	31:+RmCVNkcfpI+QjwD29ZIv6p9zjUV18DEij77QSNIRkIiC1V03fAi5KSZ91vgJZMRWW75mtwWHvLuBVUun3PDvSjFm5u5e26uaf+xnU5kxMfRIaDBL0Az1CHQ9HPt86BxcEnoGCYwX/uOHl9rUePOJvdKi7T4hqRaekqpiRdJyD5rjehzgXaywJkCrGt3g8xxTpNhKmthAkLI2Xg4WSLOs2Dukg7tCF7gCMXNi42b/EE=;
	20:wPBB54NVUQEg8K33ORQ3NaYGSNVZc/ybuKzWsbKFe1ZsA/SuO9rxLMZxT9JwdeHkxKmVl0Vg/w0KSpmNXsHJYBaL5/V174YGSISjRhBkpLFzA8finxxzzuRY47KAWZp1K0n3uqfvdbZ3OseRRtQi7x2nZMtciYzX/KzjFx6nFzQDNkydbHeDQbax4iF6GdceQUetipiKmUxw4wOGgtOseqgQDHIU+GdPh50MyNRNvcKmk6eRbMsPyjIBxgXckB+hzhXuojdFMFu1LarJLuIrVhyJxxPWIedMF/VgOzBMX21psso5n72HKcATCh80cZgd+f7Ouuk8uXIz0r0B+RJCzlfV4RVj7kkpEme4EIspeVDNrEgtPXUfaAGJy750Ox5goMDkW8G1SROFyjpBzH+Z3rRUuj725rQWrlBMNGPxUkp+xIppM0dNpfJ9gCIw+MfENPB+BWUcW2Zmkd1D9xgIk73YKJfYgfV+lbH71+pE6AJy9xK/IeYxNdphk6wxOxsK/XKP7YZGPUltngVcvsEqXw==
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0502MB3884;
	4:hwyE7X18eXGfGCzka+hoT7NxqPlO6lqNZPX27HCYwpC/Ay4QJDTbEApLBD0Zsv4PRaTaZpz+tUT5AsR9BIlmyVvW0iIM16Jyy8iMxZkuAdzBlDLF/sJD2Gf09kk3j4OVYaqgU+YcuDGf1RCdNZUemgmIBX1bL4dQtauT51H03/9rBtQnm+iJIGMGz2WuqgDGWlRJY5AyBkcCNCtMTYjGhRCgrLwN4vBCi+4bF04HP335G+PrSlDMGfB75oaCZXQxNlFlhih5f1qS2unAwXCKq+wdtGNrHbXUbF1wZe6/XEDolCqLLm5Mq1NQysdTof3F
X-Forefront-PRVS: 0946DC87A1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0502MB3884;
	23:f4Xajf+myArk1FDY9FB5jzurQ3V1numzmnzW4jJ?=
	=?us-ascii?Q?5EhTt6CgnjMbQWqdRFwcFSGt9pC54zeW2fDOF5L9avQDBgIbrtyAdeR/eTyX?=
	=?us-ascii?Q?APAQPDz7scpD+ynPEq4YjoGtx6mEwcTdAJKWjfsGsMknQfY62DApFpVpkQfJ?=
	=?us-ascii?Q?lwQIU99Q6qsEzY2NVKt8TTA+fMsoshPxhY474y32ieDlT+ntktmUDpVh3RaU?=
	=?us-ascii?Q?tFUEx9k3tGPhx/HuONgF+3XaYsr8RLuZEG2ekaRilUUJn72JYRFM0g9t8OeN?=
	=?us-ascii?Q?lyUqa9aIkyMhebij4mQQRRmyeADeYRUHZx1Mp0BfH5TeUB7hnx0p4L3MiYbS?=
	=?us-ascii?Q?fx9mo+k135b9FAj1ZtC5nmQC+s8253hXZdUFyWf0qqTlAMihiP6gODWEEHWv?=
	=?us-ascii?Q?ONrwDgBgBtKpylID1EqhsoO4z7njuZdn9hxq2BNUlOLa429V6TWT69t9Zlgp?=
	=?us-ascii?Q?exJztJwvTlwdUAiVzAi2vMvUAQpBdZndCTmKiUtYHfAzskXoCrD2FEDy8PnS?=
	=?us-ascii?Q?yleIZs/a43jIEaRYeGColKNhfDrGqvcJFzDL3GFkXG0yRbnEwjPGQfBQCLIw?=
	=?us-ascii?Q?AugHv5Zhne+z86LymMtoNoS+WaDaeJcznNRs3bb72xJnL31X1q+yXbaKiN6a?=
	=?us-ascii?Q?HDAZ8oZ38dDV2RrNELi3iiY7H7O11hR161WRwrlIDHwdcu26c/3a2QwCVLSU?=
	=?us-ascii?Q?5lAmf9NLPFvS6HVQzAmbBJVH08bm5GlS9bu2KuQEiE2mMer3xfyt2uO9Ufx8?=
	=?us-ascii?Q?9PQsotflAJTM9rlm2YgPpWQ86RQZFQgCWOJzd6f17WzkMlVBNqaFzIUG0bH4?=
	=?us-ascii?Q?wN3pTLPIMJaSoWsEOX2N5Y3JU1eicicOegrLRAn1bqwAencGeUIG6CVV0An0?=
	=?us-ascii?Q?75CRIyztzG6zdsGgJuQHlNCtyCX0sXiw9+oZomEJ4cG883HC83i2EnhHP1GD?=
	=?us-ascii?Q?DeQPLBj5HoiUD0A3Eld3UNq+iJ6poDrN/nKRwZWFBybv4xAY4h6AJv31/itd?=
	=?us-ascii?Q?CSMsNI0MyuHZTcxnfTUDJR9sLbfrqJTfmkXJVljEhBGeQqZa5pihAOuJjmBT?=
	=?us-ascii?Q?QGGzuNqqcQwnl355xrGOuTmjslXFuWX22tx1fsGqGFxV5CdD6eCvJD3+ssHr?=
	=?us-ascii?Q?t9QMSBB7LSLz3dmlu2GM+nIRLeSO/iXy5obQtZbrSlJoyR7Xgp0vBYSRsnoo?=
	=?us-ascii?Q?MEMa28Pdz5mjZr0RCJp5bXtUeu8kR3tCtOLsVZfPhT3QaRlIHRkAzQpZga9F?=
	=?us-ascii?Q?DKQeC4MeW2qKSgreJvFB7Hn44gbRg4KbXSMbX3+gs8KSRk4Vd9aj4BWe3xyS?=
	=?us-ascii?Q?wzxnZmc4BMfbNRDBr+gOeUHcJ3iLx1B2qReygrZ/xAkboLS3K/eQc9DuNwrh?=
	=?us-ascii?Q?0Y4ggCCy8T3sxJh86mMzcNE4MePaf6iWf6YIQdPIJqtYrW4PC5VH1+UbLBGd?=
	=?us-ascii?Q?qEPHFysmJWA=3D=3D?=
X-Microsoft-Antispam-Message-Info: gycb7a1iontzttHJ8sskZKmsklkxQ3tpaTrwKaCUsg8RMniG7TwpG8XEqk9KnRJFUgKHdjGVCOrefY3dKYzXsjPbybJFE3gikzPn1RpRnhGomJbIAinVnIgAf+JRZzKiDgHRo8ikkrx+DxcXya3VGl8FztVOd4qZELtsreOcpDnlbIcAabixmbF7pQuDGqYb6bhnEspQIeJt7h7uaX9z16kDb0khmBmK8k6QBhgv2ayOOTIw0FmEwFYXxPL+/Mw1JfPbg4PuJJ6S6HkXU4JT+bZkIiSDLtufzI7OXVUi2NvHNlruWMQO+CCiMvIPvixFEvMVB8q50H3Hb0Bcu++uSRIUXUdG/neqBNuJ2PEOkH/XA7LwY4MYfLh6YTKAkhwarhhqlh1GBwg3tWBQ2x5NWQYYpRzHGFyG48qB03UlWjM=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0502MB3884;
	6:A4M5rTLGh06heIttKng9JxUlPJxrFTwF0QJd8gTfs+INI5SDy0SR21IRuEwHhvFap6smPil7w66x/08PKuT+lY1da0rrvFOyQ9+8R26mcUH+3pIozgdbNi8NXlW5lPZ6cZG/gZ/MjNe4MDfnEGdqCJ2VpebONovdm9BL1HbrpCPPxha7IFRT5IDK0z4oNqDsi3LlXIIAFC0yU1CMHGbftjSZsyZOKGtPahhH4IBL8xDvNjgOoMUMgWreznC14TIkyXJ85Iljz6jSqenEFeIlhtV/FNHe4S/kbMyzkzIv0214bMliDNx/6unpmc++Cq28ML7O++9FEiEdtCW8wC/ivhWYa/5LTnxG0zbTXgxEQ5rT+wEENTWKT60xmu9oXTAKw0TUtI1nYO7vXv39zd9/5XkEvSBPU26+c0QkZS0QXdEry0dS/5OCmBwVLiykO1R7GwRSdTFtH1NvzlVV5nYPuw==;
	5:jFTAIUdd3WhxZ9V/43ZmFxZxZy9YcVV19O0B1Uptazrs9hee9jSkWgK7ViOagcqqqyp77dP4vaEA/8hBOzv5JwbJDTGc9isV5FPufpKmfQJuwWoARrcmR0ovIhNySpGYeZwcz2o0hIpxU5Y7YCpTJ5AjxdJGJp7mtb+DK9n4VirtkhoOBn4xnInePjR1Ty6ruqUMzM54P9aBNkPCTirdPg==;
	7:AA6xe3sWnc+mrRSpnRawJNJwtYbmWQ8fBmbZXkjcHzwPTKYsng4Oo37yhjLmuA6GL/moSXQYaLky0RmsNDL2NftwFiw/xZzgXnfAm+f98FUYCGV05NC+2IVQQhCOUIgUnVbqA3YfOFQhaho3QsGipQ==
X-OriginatorOrg: phoenixcontact.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2019 10:02:59.0943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc5dd45-9f27-4a6c-8a20-08d690d1448b
X-MS-Exchange-CrossTenant-Id: 6868843b-f012-4c95-a18e-bab826cca9ac
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6868843b-f012-4c95-a18e-bab826cca9ac;
	Ip=[51.136.18.164]; Helo=[azr-iqsuite11]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0502MB3884
Subject: version upgrade to python-click
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2019 17:37:16 -0000
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_AM6PR05MB6357644B9FBDB2505BE9F0D3DB650AM6PR05MB6357eurp_"

--_000_AM6PR05MB6357644B9FBDB2505BE9F0D3DB650AM6PR05MB6357eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

it seems that the latest version of python-click in open-embedded is 6.7 =
:
 https://layers.openembedded.org/layerindex/recipe/52136/
This was released in January 2017, but 7.0 came out in September 2018:
https://pypi.org/project/click/#history

I have had a considerable struggle with click on our embedded linux aroun=
d locale.

It was a hard requirement and there are were a lot of complaints prior to=
 version 7.0

Here are a few examples:
https://github.com/NixOS/nixpkgs/pull/41843
https://github.com/NixOS/nixpkgs/issues/40146
https://github.com/NixOS/nixpkgs/issues/38991

I believe they removed the hard dependency in this pull request - https:/=
/github.com/pallets/click/pull/880
which went into version 7.0

If you look at the code of that request there is very little which fixes =
this, but it would probably still be cleaner at least long term to have t=
he newer version of click than to patch that in our system.  The locale i=
ssue is one of a long list of changes in 7.0 http://click.palletsprojects=
.com/en/7.x/changelog/

Actually, click is not explicitly mentioned in the bb file, but python-fl=
ask is, and that somehow installs click with it, I think as there is anot=
her recipe for python-flask which includes click.

Cheers,
Felix



.........................................................................=
..............
PHOENIX CONTACT Cyber Security GmbH 
Richard-Willst=C3=A4tter-Stra=C3=9Fe 6  
D-12489 Berlin  
 
Register Court: AG Charlottenburg, HR B 202908 
Gesch=C3=A4ftsf=C3=BChrer/General Manager: Kilian Golm

--_000_AM6PR05MB6357644B9FBDB2505BE9F0D3DB650AM6PR05MB6357eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D=22urn:schemas-microsoft-com:vml=22 xmlns:o=3D=22urn:sche=
mas-microsoft-com:office:office=22 xmlns:w=3D=22urn:schemas-microsoft-com=
:office:word=22 xmlns:m=3D=22http://schemas.microsoft.com/office/2004/12/=
omml=22 xmlns=3D=22http://www.w3.org/TR/REC-html40=22>
<head>
<meta http-equiv=3D=22Content-Type=22 content=3D=22text/html; charset=3Du=
tf-8=22>
<meta name=3D=22Generator=22 content=3D=22Microsoft Word 15 (filtered med=
ium)=22>
<style><!--
/* Font Definitions */
@font-face
	{font-family:=22Cambria Math=22;
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:=22Calibri=22,sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:=22Calibri=22,sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=22Calibri=22,sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D=22edit=22 spidmax=3D=221026=22 />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D=22edit=22>
<o:idmap v:ext=3D=22edit=22 data=3D=221=22 />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D=22DE=22 link=3D=22#0563C1=22 vlink=3D=22#954F72=22>
<div class=3D=22WordSection1=22>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>Hello, <o></o:p></spa=
n></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>it seems that the lat=
est version of python-click in open-embedded is 6.7 :
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>&nbsp;<a href=3D=22ht=
tps://layers.openembedded.org/layerindex/recipe/52136/=22>https://layers.=
openembedded.org/layerindex/recipe/52136/</a>
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>This was released in =
January 2017, but 7.0 came out in September 2018:<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><a href=3D=22https://=
pypi.org/project/click/#history=22>https://pypi.org/project/click/#histor=
y</a>
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>I have had a consider=
able struggle with click on our embedded linux around locale.
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>It was a hard require=
ment and there are were a lot of complaints prior to version 7.0
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>Here are a few exampl=
es:<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><a href=3D=22https://=
github.com/NixOS/nixpkgs/pull/41843=22>https://github.com/NixOS/nixpkgs/p=
ull/41843</a>
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><a href=3D=22https://=
github.com/NixOS/nixpkgs/issues/40146=22>https://github.com/NixOS/nixpkgs=
/issues/40146</a>
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><a href=3D=22https://=
github.com/NixOS/nixpkgs/issues/38991=22>https://github.com/NixOS/nixpkgs=
/issues/38991</a>
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>I believe they remove=
d the hard dependency in this pull request -
<a href=3D=22https://github.com/pallets/click/pull/880=22>https://github.=
com/pallets/click/pull/880</a>
<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>which went into versi=
on 7.0<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>If you look at the co=
de of that request there is very little which fixes this, but it would pr=
obably still be cleaner at least long term to have the newer version of c=
lick than to patch that in our system.&nbsp; The locale
 issue is one of a long list of changes in 7.0 <a href=3D=22http://click.=
palletsprojects.com/en/7.x/changelog/=22>
http://click.palletsprojects.com/en/7.x/changelog/</a> <o></o:p></span></=
p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>Actually, click is no=
t explicitly mentioned in the bb file, but python-flask is, and that some=
how installs click with it, I think as there is another recipe for python=
-flask which includes click.<o></o:p></span></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>Cheers,<o></o:p></spa=
n></p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22>Felix<o></o:p></span>=
</p>
<p class=3D=22MsoNormal=22><span lang=3D=22EN-US=22><o>&nbsp;</o:p></span=
></p>
<p class=3D=22MsoNormal=22><o>&nbsp;</o:p></p>
</div>
<FONT face=3D=22Calibri=22><FONT face=3D=22Calibri=22>
<P dir=3D=22ltr=22>......................................................=
.................................</P>
<P dir=3D=22ltr=22>PHOENIX CONTACT Cyber Security GmbH=E3=80=80</P>
<P dir=3D=22ltr=22>Richard-Willst=C3=A4tter-Stra=C3=9Fe 6 =E3=80=80</P>
<P dir=3D=22ltr=22>D-12489 Berlin =E3=80=80</P>
<P dir=3D=22ltr=22>=E3=80=80</P>
<P dir=3D=22ltr=22>Register Court: AG Charlottenburg, HR B 202908=E3=80=
=80</P>
<P>Gesch=C3=A4ftsf=C3=BChrer/General Manager: Kilian Golm</P></FONT></FON=
T><I><FONT face=3D=22Calibri=22></I></FONT></body>
</html>

--_000_AM6PR05MB6357644B9FBDB2505BE9F0D3DB650AM6PR05MB6357eurp_--
