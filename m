Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0075.outbound.protection.outlook.com [104.47.33.75])
	by mail.openembedded.org (Postfix) with ESMTP id 68C1E79513
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 21:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0xgi+mFyU4u13IhKArtuC+EWE7HsSajJNiZnlwh4vPs=;
	b=GyfdnclTITqu4mKng5UNi66ZQG3YAQWBOQOURQUEDQ8r1wmZTsyyJQIefXWCv9YGlnLjl+9/LwO7+mMPbF0RdxQEodkPXwmh7QktvwBmN0oJT1mcVzx3IRa0jbKqZ4BLMtWYEUV5j6UQvqq9u5fXqRMg82d7HFd2kQYdDtohmjM=
Received: from CY4PR02CA0040.namprd02.prod.outlook.com (2603:10b6:903:117::26)
	by CY4PR0201MB3507.namprd02.prod.outlook.com (2603:10b6:910:95::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1250.30;
	Tue, 23 Oct 2018 21:26:21 +0000
Received: from BL2NAM02FT015.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by CY4PR02CA0040.outlook.office365.com
	(2603:10b6:903:117::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1273.18 via
	Frontend Transport; Tue, 23 Oct 2018 21:26:21 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; arm.com; dkim=none (message not signed)
	header.d=none;arm.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT015.mail.protection.outlook.com (10.152.77.167) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1273.13
	via Frontend Transport; Tue, 23 Oct 2018 21:26:20 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:33321
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gF4Bv-0001Mj-Tx; Tue, 23 Oct 2018 14:26:19 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gF4Bq-0005Ho-Of; Tue, 23 Oct 2018 14:26:14 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w9NLQAwm006372; Tue, 23 Oct 2018 14:26:10 -0700
Received: from [10.23.118.121] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gF4Bl-0005Gk-Kg; Tue, 23 Oct 2018 14:26:10 -0700
To: Hugues Kamba <Hugues.Kamba@arm.com>, Alejandro Hernandez
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <VI1PR08MB36317EE05BE84D857C630F2398F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<a8c53475-1c2d-f909-1e52-cf8d04f6d3e5@xilinx.com>
	<VI1PR08MB36314F901C4C74C8C3E82F6F98F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<VI1PR08MB3631EBC976E8E5A79335589698F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <e574592b-8b68-2604-d337-c2086637cab1@xilinx.com>
Date: Tue, 23 Oct 2018 22:26:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB3631EBC976E8E5A79335589698F40@VI1PR08MB3631.eurprd08.prod.outlook.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(2980300002)(438002)(3190300001)(199004)(40434004)(189003)(236005)(11346002)(54906003)(6246003)(229853002)(6306002)(126002)(39060400002)(26005)(54896002)(31696002)(478600001)(77096007)(37036004)(110136005)(36386004)(4744004)(21615005)(2906002)(71190400001)(426003)(446003)(356004)(6666004)(486006)(36756003)(966005)(186003)(19627405001)(336012)(53946003)(2616005)(106466001)(65956001)(63266004)(31686004)(65806001)(58126008)(606006)(64126003)(9786002)(106002)(16586007)(84326002)(2501003)(81166006)(81156014)(93886005)(3260700006)(76176011)(4326008)(5024004)(65826007)(14444005)(8676002)(53546011)(8936002)(316002)(5660300001)(1015004)(476003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0201MB3507;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT015;
	1:174nVI3kmYgMCwzVas9RlXc95pKbzjnSXQ7d8ECsonH2L11N9gld7ljj9k3gbG1t36etLABBDkWMLuW5byJnKvh8oO3vSLACabtoC6l+G4c1red+APp7id4SqM4t8e2H
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0680e465-3a0d-4cb0-56ef-08d6392e2d37
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CY4PR0201MB3507; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3507;
	3:2UnNA/K6upwSZnM6lqEdiS+PrBU4X2I7h480n/5U91UoJWEBEn2QjdiDM47GGW8OON4CffrdO8Y4ToA88+eeIurIu2jW8qN7CXDp6aK8EHPULGh282IdU60DYafCZ1KZbTWDMYV4AKhB/27mAnX9/qtWa4u+ftDzR9oypIVNFHDMn4WKbeF8nouApl2HOdFi1XoPQGhJYiy49S/H6jU+l9J/Ce6GdWgih7pBA+PyBUO+CApJSMT8eq0sy6gqZp/uN930Ekd6irNxtSJ0JAPULv5Y/+i/YBBk048nAV+rfDF6sDrl7GwpwXZImj+j0oZ0XnGyQe1dBhu4HvPC5elE7V0ZxejjjcnfvugUZ+KNhfs=;
	25:oqz3mgZOzRLwvYQWV2S+8YD0YEuENsJIDOEMraOoyUSUgb8vRjbP6XbUrnLmzkgsIOLpIADb84cURF5JYufI02EVDoPjEzekica3aEGlkP/qbILwZb8jD5V/EIx3ittZ45+WmrEt9L/txyr8eJs4Y1MjYX2sHHJ3nYQul7bZhm3J28X2wmFzYngH3y3j8hP/sLDkO8r+mS8pqbPwYf2IDu2xfVglBs2zXKAh+pPqIsFJauKn3GIu/X/H/0N2DZcKMs3SGiHD/zVZikG0K7Jd1aMU76Te93PbKLnSZ2W9q43MC8zikEB5YQiqsWvGmXry54NCOcl5zR0K7DpyADqfUw==
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3507:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3507;
	31:WFYIiD0ocaXxeBmfYvWqQqw1yAlJbUrQgGM0oz9gUFEZ9xQwlTPn5cmhEN8KuVqFShyZF2Av8Pt0DUOCR2rOTAbRK73TY21tZ3nffkNFvZrZx1FX/oYEOeSKSieolqTpr+d7i9Qj568DvSCK+VuaisApWfflrRsb3A/bGnUQSKRmoHd0eodWmz4Lqvf/+OuCAE37FNzK5POm4vYS4051khjah5Kfoh1YP8ugbfBwNA4=;
	20:L3+wxB7ak0qPcAd9ktPf+ImuQhH5jENEUyoX5ljTfokBzX+Fiv0A2RobMOiKT2txN7Kx0CmhVlAl6gVyU0cjmjreavZWGNK/sfGAHRD8Qe56jRs6KOzlb25zGixM0oPB4mYUWC8TJlRN/ieAnfdvaZs1hRQkHySoCp2OTIHCQvMPOS1HTnnJunB4gCIv0hxHscVdzd6ruTYeaj5oQ9jPQdJDtOfju5B2GXiEoRr78c7dJrnSxr2yHHKSTlPALh1H7zwKK7gGUd5DRp7M4dwAfu3wRVNdr+YkpkuYKTxKX77FWHOb0d2RZt9hWDWlxzBzYURPtWiGa8FHq2YXOcNcY/e5Prh07DUNG4Fiypkii98aVqOiE6Xemdkg0YHlY5a4IB/Pk8gkagYUZv7wNNSXZ5Swj0ahWC6DM+GtpQLf3JgF6Ex0ZcqVmdPEO//Mlfutm0HoAI/1V9hkZqj2WOp9VlCopur5cPOcdmBpBBCF/GF0VY09CCdbADj4OCugPSab
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR0201MB3507D49B81AF9809CC393E45ACF50@CY4PR0201MB3507.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(85827821059158)(163750095850)(192813158149592)(238713787762100)(189930954265078);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:CY4PR0201MB3507; BCL:0; PCL:0; RULEID:;
	SRVR:CY4PR0201MB3507; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3507;
	4:/8OH1Qatc7KI+ZFKG+VYJLA/y/yTfYUKf6cAd9bbC7O0rzcAHNANcLkFawS59N8E/Rthosf6FNVClHLjdbY3XQYSNLxsl3FGx7G88JV7FyE3TbRej4rldLnEUfxMYoF/HXCSczsg4R+00ZaYZQ/k2Wc6EwGejJivcdhBWPpACe7xSjcvIcbzMSGMuJIsPgZB+I6x0CfRtPrOG6cWPpmh7vAsLiPjk/8psYTKjCTgJRTLqNIZWswV/bJd5Wz4BPsPqzetzbcZD1bx0Xf8SovR7gxvrxPu1QSVNcxPFrmkxI5QEQE/w136yYsHW0DKuBwZmC+0rRwPRnJ0kFERUe8u78qzw0Hp9lD4sIGZi4yWFm/mVCo1szZ7zxgPaL1STVGbJ8bnQhkdhNraj4bQOB2fKNHaSvRU2iKFvwC3chW9f5uzLWHnls3Zvbp2RKQzeCmzmXOUh4Nvr2XPrdHYtztq2u0jpl5EoHmanT2rblZh20c=
X-Forefront-PRVS: 0834BAF534
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0201MB3507;
	23:JDZCY/dZmmkkSvgfLgAexrnab20cSZPzfadCd1O?=
	=?us-ascii?Q?EfcPwC0i1cS8hqeqFnH+exRjRqUU9mQlv5cOTniFJaWXvUfyCqnql/TGrM6b?=
	=?us-ascii?Q?+aw+lUU4fVRXUUAw/0yrhov7I7x65czQ2u+OQWif6MrhHc1slcmRA8pSK4vB?=
	=?us-ascii?Q?Jt4B1fSRdRlYNnMW64iY8xv2p9uGzW5ynD2kmNRNQOu6plxtvU4EOUiBCaay?=
	=?us-ascii?Q?10NE+IiuWehUlqIv4lc0LbpcSGUrIKcLGhzeeiGW9NbNBWCvuygQ9+Q0WWFg?=
	=?us-ascii?Q?3MEro+jwWgSGxQOazgm3o83mYqLsvha0iFyvzdxOThKAQaCHyemmXA28Qtec?=
	=?us-ascii?Q?UDPpdachEhmnBCQUAVuQ6hL+zEiAcOcjTAVjit7ScTxCnKjiZ5n7d+HK8Nxh?=
	=?us-ascii?Q?PZGKYcyi7lzuJHWvEriZ4VD7G4XeIv8xQNhmrPfHOYgQrnQBvATtO0rtjEBZ?=
	=?us-ascii?Q?jDZNFbZRP/J5A+OfDvwcS1BklG1jd4c4TF9tCZzpVlALtnpopBnRAqBWnwK9?=
	=?us-ascii?Q?N3gd7qTXaEj6nIOfK+7/T5W/tPXKpJ7TAV+KuXmfYpiIwziQwT5v2Q4eLFYz?=
	=?us-ascii?Q?JM/ou0CD518KJgLBCHvLCKC3sPHzsIW2vpm8ncX3c3tjMa0Ws6QAaBdr6sSl?=
	=?us-ascii?Q?yiwlRKB/BQVtqaV8e8SEX5+TzK4L37hIzqe5HG+1gWwnVgLNV68Jn2JtO1Oe?=
	=?us-ascii?Q?UxKfJVEqxmVmA1bpkqXwrU4xtoQ0SWSERi39Nm0e3IcrHSTOr7s3u6jsSjt6?=
	=?us-ascii?Q?ekUrhAFuqImqG54Y0w/DTYE5uhpybJEhFgkIiQN5dUM2AqU/twGzvyQxBwxj?=
	=?us-ascii?Q?twAZd+4xVwTwcQ610rZe6FBe9S98rp3zCpLzxbPB3E2S0GKJMOh6oeVzMTDW?=
	=?us-ascii?Q?j4j6uh+zeJ8TPUfwF35M+3OPR3pnoZDfUbUpAwmLMoD8psvILc5YyrQfrp3U?=
	=?us-ascii?Q?H0WFPxuJep+3rnsJVz/f2nDaZmXnHZaOAU64AP5Qka5jAUnljz+ChwvFwKv8?=
	=?us-ascii?Q?5z93SGoIb2rOn6Xg6foP1Vev9BngB0O5GuPm9CTcnyMBQr4IabeVT+Eiz5mS?=
	=?us-ascii?Q?gIbbJGccCaLW+H1etCHDsq/A3TwkpvZoISNE+IloV+5SSbBxAKD4n5cYYiZp?=
	=?us-ascii?Q?lsMAiKPINbS8Qy1GQpSvMOlcDkA7wDYC6YOXEwpd2fOM6c/+zMIPcc9MDXnG?=
	=?us-ascii?Q?3EUGjJfF9jvcehFQw7elAyEDm+iOWNf8yF9qm6mhjm0OuoV0dmGbKr2xL1C3?=
	=?us-ascii?Q?EgrJNMB8DpGBZ7X0WGRx2N114XN6lOq9M3B5PoEg8xPU73oZT9L6q4PAMkBD?=
	=?us-ascii?Q?AQEmEHQerp6pGfJM0ecCAYVOimi9oXu5H0hIRqO1S5tHIF/aiRgrj6rgkRTn?=
	=?us-ascii?Q?rtkE9HrbHJqVb/S9HtcWrrlDQAYwbU99Qyg/GVUVh8n/d0ZclulrYdcz7/od?=
	=?us-ascii?Q?JHzK21YvvHJqYX1mQho89i8pdZanqvo75PecjdOH7F5dKxuwVftAkxdqNdK0?=
	=?us-ascii?Q?KSZs8oVP9QMfPXIwHHSq1lKEpUI4Djl4dKNjGSFiG+mXe0W0RUqZ1zX6gc8X?=
	=?us-ascii?Q?VGRbHtiO/wkY78Ul4cuaz26/ajKx0m22b+dQ0m5gsXqMtvsWFF9AruOvtYg1?=
	=?us-ascii?Q?gBM06NFOHEftdQYXznhClRQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: 8uPa74UODs+Tb04KpemqcTlKNsZGD6qSY5HmlJnX8TiCHW3ov2fPw2wFUdVDeAjF4QZMSXtNVus8E4Ix5JAPHyGKUThU7VkOYGbo+oewpJzivU+nlSjGnBHPmDxoCJlJdrd39jH8JZDJ9gFi7TklFpbNLmuBi5cI/cMjAySw163zy+wefRTBZzvybak794n6jqmBQ585BstAUro37WvB2dU928vvtr3lAjb43a3ai8I0+GBdnG3c6E8NAHWyubzeonJI3bXYOuZVJuH4yCDOl5eApdt1G8yNAzKX2Rdj0HmerqRugjS99kbJK0vHJmC6JDvodsBQT8Z8G424nJ6XnYPlFarwvY51b1xdi5WS3ds=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3507;
	6:03TX/b8KjsF/F5lE2kEz3EI6wjgJD9r/Xjp3Gpn55oRWqt/2F7imcPkj700GwHaGABMkV8ZQl7ui9QViLfQWWibGc6fw8W+RViIMVlr6X9Vpp7QWi7aqzn0qlzOgM+oOm3pr7uZfEGGIFReOqnaSOFLawLdzzbamXgx9Z9HHKz+pky4ZToWddkKKaC6iKCMQaEKdIP9nYLQY0eXq//65rNWgbN6VystWC7qqcqopZYihMIFxONYlRErpcc2ZvdiHlgYGdPALrjGmfe3MqP+X87LkA2xJucr5/gjRExLD+CGlQijCXhp3e/Zp4DwJzj5YUPP0mTF7fK5BGKkcZF+KUhmWDr7Oo3Nyt45gv0Sorabtj+OMgXXMO8SGwveWwCunu76WYtRVeoJ2JszDh7ZcyG15lXbFUxgSmHywr6G6cGqZpxVVTjMrVAAZnTDU7pHqo9zRxDmQDhI+rlvSh39+cg==;
	5:h0HMSqJOAHUbb71uWTylRlJjBKDmWML8oz+EbiipvHiswwgJyGqkewQZxS30vB6IAsFzkFC8YtJMMKARuLp6EnRdlAiXL0NGCap3maIOpyHDQ4aLNGHbP0OdsPezarKq/EKioxqNgENnVCizld5akqxJ+nVr5sWCIt00pqSA2Mo=;
	7:DOme0ZosCzHXaUcuNgiGvsgDHLqnPRBsJZ6sSY9q95ISDVXtP54AMC6a/1sgClOQeMZe/o4LElAbB73pYzQHylu01KDehK9hjaoY11YYvzqY4KtKE8Uv8Pyq3VtWiP3AOe6Tuvi+0iE9prGPN+dtYvqJcDMCl/9ffQB+R3bMRWJdoRW1bbIXsf3bNig8pNNHsE2sTLsaPXccZKiaK2ehp9Qqd6K9EV8HfPEkn4iIOp4YeiQlevfXAXLqN6sWu8EJ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2018 21:26:20.5477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0680e465-3a0d-4cb0-56ef-08d6392e2d37
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3507
Cc: Diego Russo <Diego.Russo@arm.com>, Jeremy Johnson <Jeremy.Johnson@arm.com>,
	"aehs29@gmail.com" <aehs29@gmail.com>
Subject: Re: PATCH: Fixing python3-pyvenv and adding python3-venv
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
X-List-Received-Date: Tue, 23 Oct 2018 21:26:22 -0000
Content-Type: multipart/alternative;
	boundary="------------5EAE415193294C1DC9B134F4"
Content-Language: en-US

--------------5EAE415193294C1DC9B134F4
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hello Huges,


On 10/23/2018 12:12 AM, Hugues Kamba wrote:
>
> Hi Alenjandro,
>
>
> More information here: 
> https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments
>
>
> What I am proposing is also a good idea for when python 3.6 is 
> available in Yocto.
>
> With Python 3.5 one can create virtual environment by including 
> python3-pyvenv OR python3-venv+python3-runpy.
>
> With Python 3.6 one will only be able to create virtual environments 
> with python3-venv+python3-runpy.
>
>
> I hope I made it a bit clearer now.
>
>

I do understand what you are saying, they are two different things, and 
while the purpose of the manifest

is to provide more granularity on what goes or doesn't go on an image, 
we still have to be careful on

how we package things, in this case I simply don't see any reason why we 
would need two separate packages,

specially because nothing else RDEPENDS on venv , and I don't see the 
point in creating a package that only

contains a single binary.


I believe it makes more sense to package them both together in a single 
package, we are upgrading to python 3.7 soon,

and I believe having a single vnenv package should work for that too.


Cheers,

Alejandro


> Thanks!
>
>
> Hugues
>
> ------------------------------------------------------------------------
> *From:* Hugues Kamba
> *Sent:* 22 October 2018 23:47:44
> *To:* Alejandro Hernandez; openembedded-core@lists.openembedded.org
> *Cc:* Diego Russo; Jeremy Johnson; aehs29@gmail.com
> *Subject:* Re: [OE-core] PATCH: Fixing python3-pyvenv and adding 
> python3-venv
>
>
> Hi Alejandro,
>
> I submitted the patch using git send-email since that email.
>
>
> pyvenv and venv are not the same. pyvenv depends on venv to run.
>
> See the entire content of pyvenv:
> /---------------------------------------------------/
> /#! /usr/bin/python3.5 /
> /if __name__ == '__main__': /
> /    import sys /
> /    rc = 1 /
> /    try: /
> /        import venv /
> /        venv.main() /
> /        rc = 0 /
> /    except Exception as e: /
> /        print('Error: %s' % e, file=sys.stderr) /
> /    sys.exit(rc) /
> ----------------------------------------------------
> As you can see, pyvenv depends on venv to run. Because it is confusing 
> to have both pyvenv and venv; pyvenv has been deprecated in python 3.6.
>
> They should be two seperate packages not a single because they are 
> different things. Read here for more information: 
> https://docs.python.org/3/library/venv.html
>
>
> I do not understand what you mean by the cached files as I did not add 
> it. After modifying the JSON I ran create_manifest3.py which added 
> that, the rdepends content on venv was also added automatically after 
> runny that script. My changes are only adding pyvenv and venv in the JSON.
>
>
> I will submit another patch which removes pyvenv in the python3 recipe.
>
>
> Regards,
>
>
> Hugues
>
>
>
>
> ------------------------------------------------------------------------
> *From:* Alejandro Hernandez 
> <alejandro.enedino.hernandez-samaniego@xilinx.com>
> *Sent:* 22 October 2018 23:17:26
> *To:* Hugues Kamba; openembedded-core@lists.openembedded.org
> *Cc:* Diego Russo; Jeremy Johnson; aehs29@gmail.com
> *Subject:* Re: [OE-core] PATCH: Fixing python3-pyvenv and adding 
> python3-venv
>
> Hello Huges,
>
>
> I cannot reply inline because you sent the patch as an attachment, 
> please send it using git send-email next time.
>
>
> Also, something doesnt add up here:
>
>
>
> +    "pyvenv": {
> +        "summary": "Allow you to create virtual environments so we can isolate our project dependencies. Deprecated in Python 3.6",
> +        "rdepends": [
> +            "core",
> +            "venv"
>
>
> This doesnt make sense, since you are saying that the python3-pyvenv package depends on python3-venv?, shouldnt they be the same package?
>   
>
> +        ],
> +        "files": [
> +            "${bindir}/pyvenv*"
>
>
>
> Again, this should probably on one single package.
>
>
>
>
>   +        ],
> +        "cached": []
> +    },
>       "resource": {
>           "summary": "Python resource control interface",
>           "rdepends": [
> @@ -1107,6 +1118,21 @@
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
>           ]
>
>
>
>
> This is wrong because, cached files shouldnt be on rdepends.
>
>
>
> Everything from there to the bottom is probably ok.
>
>   },
> +    "venv": {
> +        "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "logging",
> +            "shell",
> +            "stringold",
> +            "unixadmin"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/venv"
> +        ],
> +        "cached": []
> +    },
>       "xml": {
>           "summary": "Python basic XML support",
>           "rdepends": [
>
>
>
>
> Also, this patch is missing the changes to the python3 recipe file 
> where the python3-pyvenv package was being previously created, if were 
> now doing it through the manifest, then we dont need it in the recipe.
>
>
> Thanks!
>
>
> Alejandro
>
>
>
>
> On 10/22/2018 11:48 AM, Hugues Kamba wrote:
>>
>> Dear All,
>>
>>
>> As it currently is, python3-pyvenv is broken because it is missing 
>> the venv module run-time dependency.
>>
>>
>> The patch I am submitting is to add the venv module dependency to 
>> python3-pyvenv.
>>
>> The dependency has been added using the newly added venv package 
>> (python3-venv).
>>
>> The python3-venv package has been added for future proofing since 
>> pyvenv has been deprecated in Python 3.6 and creation of virtual 
>> environment is done using the venv module directly (i.e python3 -m 
>> venv my_venv).
>>
>>
>> Regards,
>>
>>
>> Hugues Kamba
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are 
>> confidential and may also be privileged. If you are not the intended 
>> recipient, please notify the sender immediately and do not disclose 
>> the contents to any other person, use it for any purpose, or store or 
>> copy the information in any medium. Thank you.
>>
> IMPORTANT NOTICE: The contents of this email and any attachments are 
> confidential and may also be privileged. If you are not the intended 
> recipient, please notify the sender immediately and do not disclose 
> the contents to any other person, use it for any purpose, or store or 
> copy the information in any medium. Thank you. 

--------------5EAE415193294C1DC9B134F4
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello Huges,</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/23/2018 12:12 AM, Hugues Kamba
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:VI1PR08MB3631EBC976E8E5A79335589698F40@VI1PR08MB3631.eurprd08.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>
      <div id="divtagdefaultwrapper"
style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;"
        dir="ltr">
        <p style="margin-top:0;margin-bottom:0">Hi Alenjandro,</p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
        <p style="margin-top:0;margin-bottom:0">More information here: <a
href="https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments"
            class="OWAAutoLink" moz-do-not-send="true">https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments</a></p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
        <p style="margin-top:0;margin-bottom:0">What I am proposing is
          also a good idea for when python 3.6 is available in Yocto. </p>
        <p style="margin-top:0;margin-bottom:0">With Python 3.5 one can
          create virtual environment by including python3-pyvenv
          OR python3-venv+python3-runpy.</p>
        <p style="margin-top:0;margin-bottom:0">With Python 3.6 one will
          only be able to create virtual environments with
          python3-venv+python3-runpy.</p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
        <p style="margin-top:0;margin-bottom:0">I hope I made it a bit
          clearer now.</p>
        <p style="margin-top:0;margin-bottom:0"><br>
        </p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I do understand what you are saying, they are two different
      things, and while the purpose of the manifest</p>
    <p>is to provide more granularity on what goes or doesn't go on an
      image, we still have to be careful on</p>
    <p>how we package things, in this case I simply don't see any reason
      why we would need two separate packages,</p>
    <p>specially because nothing else RDEPENDS on venv , and I don't see
      the point in creating a package that only</p>
    <p>contains a single binary.</p>
    <p><br>
    </p>
    <p>I believe it makes more sense to package them both together in a
      single package, we are upgrading to python 3.7 soon,</p>
    <p>and I believe having a single vnenv package should work for that
      too.<br>
    </p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Alejandro<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:VI1PR08MB3631EBC976E8E5A79335589698F40@VI1PR08MB3631.eurprd08.prod.outlook.com">
      <div id="divtagdefaultwrapper"
style="font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sans-serif;"
        dir="ltr">
        <p style="margin-top:0;margin-bottom:0">Thanks!</p>
        <div id="Signature">
          <div id="divtagdefaultwrapper" dir="ltr" style="font-size:
            12pt; color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
            sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;,
            &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI
            Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
            <p style="margin-top:0; margin-bottom:0"><br>
            </p>
            Hugues
            <table style="color:rgb(33,33,33);
              font-family:wf_segoe-ui_normal,&quot;Segoe
              UI&quot;,&quot;Segoe
              WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont;
              font-size:15px; border-collapse:collapse;
              margin-right:6.75pt; margin-left:6.75pt" cellspacing="0"
              cellpadding="0" border="0" align="left">
              <tbody>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b> Hugues
          Kamba<br>
          <b>Sent:</b> 22 October 2018 23:47:44<br>
          <b>To:</b> Alejandro Hernandez;
          <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>
          <b>Cc:</b> Diego Russo; Jeremy Johnson; <a class="moz-txt-link-abbreviated" href="mailto:aehs29@gmail.com">aehs29@gmail.com</a><br>
          <b>Subject:</b> Re: [OE-core] PATCH: Fixing python3-pyvenv and
          adding python3-venv</font>
        <div> </div>
      </div>
      <meta content="text/html; charset=us-ascii">
      <style type="text/css" style="display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
      <div dir="ltr">
        <div id="x_divtagdefaultwrapper" dir="ltr"
          style="font-size:12pt; color:#000000;
          font-family:Calibri,Helvetica,sans-serif">
          <p style="margin-top:0; margin-bottom:0"><br>
          </p>
          <p style="margin-top:0; margin-bottom:0">Hi Alejandro,<br>
            <br>
            I submitted the patch using git send-email since that email.</p>
          <p style="margin-top:0; margin-bottom:0"><br>
          </p>
          <p style="margin-top:0; margin-bottom:0">pyvenv and venv are
            not the same. pyvenv depends on venv to run.<br>
          </p>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="3" face="Calibri,sans-serif" color="black"><span
                style="font-size:12pt">See the entire content of pyvenv:</span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>---------------------------------------------------</i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>#! /usr/bin/python3.5         
                                     </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>if __name__ == '__main__':   
                              </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>    import sys               
                                         </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>    rc = 1                   
                                      </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>    try:                     
                                      </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>        import venv           
                              </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>        venv.main()           
                              </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>        rc = 0               
                                   </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>    except Exception as e:   
                        </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>        print('Error: %s' % e,
                  file=sys.stderr)  </i></span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="2" face="Calibri,sans-serif" color="black"><span
                style="font-size:10pt"><i>    sys.exit(rc)  </i></span></font><font
              size="3" face="Calibri,sans-serif" color="black"><span
                style="font-size:12pt">                                </span></font></div>
          <div
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">
            <font size="3" face="Calibri,sans-serif" color="black"><span
                style="font-size:12pt">----------------------------------------------------</span></font></div>
          As you can see, pyvenv depends on venv to run. <span
            style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
            Color Emoji&quot;,&quot;Segoe UI
            Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
            Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
            font-size:16px">Because it is confusing to have both pyvenv
            and venv; pyvenv has been deprecated in python 3.6.</span>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px">They should be two seperate packages not a
              single because they are different things. Read here for
              more information: <a
                href="https://docs.python.org/3/library/venv.html"
                class="x_OWAAutoLink" moz-do-not-send="true">https://docs.python.org/3/library/venv.html</a></span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px"><br>
            </span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px">I do not understand what you mean by the
              cached files as I did not add it. After modifying the JSON
              I ran create_manifest3.py which added that, the rdepends
              content on venv was also added automatically after runny
              that script. My changes are only adding pyvenv and venv in
              the JSON.</span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px"><br>
            </span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px">I will submit another patch which removes
              pyvenv in the python3 recipe.</span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px"><br>
            </span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px">Regards,</span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px"><br>
            </span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px">Hugues</span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px"><br>
            </span></p>
          <p style="margin-top:0; margin-bottom:0"><span
              style="font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;
              font-size:16px"><br>
            </span></p>
          <p style="margin-top:0; margin-bottom:0"><br>
          </p>
          <div id="x_Signature">
            <div id="x_divtagdefaultwrapper" dir="ltr"
              style="font-size:12pt; color:rgb(0,0,0);
              font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple
              Color Emoji&quot;,&quot;Segoe UI
              Emoji&quot;,NotoColorEmoji,&quot;Segoe UI
              Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
            </div>
          </div>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Alejandro Hernandez
            <a class="moz-txt-link-rfc2396E" href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com">&lt;alejandro.enedino.hernandez-samaniego@xilinx.com&gt;</a><br>
            <b>Sent:</b> 22 October 2018 23:17:26<br>
            <b>To:</b> Hugues Kamba;
            <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>
            <b>Cc:</b> Diego Russo; Jeremy Johnson; <a class="moz-txt-link-abbreviated" href="mailto:aehs29@gmail.com">aehs29@gmail.com</a><br>
            <b>Subject:</b> Re: [OE-core] PATCH: Fixing python3-pyvenv
            and adding python3-venv</font>
          <div> </div>
        </div>
        <meta content="text/html; charset=Windows-1252">
        <div style="background-color:#FFFFFF">
          <p>Hello Huges,</p>
          <p><br>
          </p>
          <p>I cannot reply inline because you sent the patch as an
            attachment, please send it using git send-email next time.</p>
          <p><br>
          </p>
          <p>Also, something doesnt add up here:</p>
          <p><br>
          </p>
          <p><br>
          </p>
          <pre class="x_x_moz-quote-pre">+    "pyvenv": {
+        "summary": "Allow you to create virtual environments so we can isolate our project dependencies. Deprecated in Python 3.6",
+        "rdepends": [
+            "core",
+            "venv"


This doesnt make sense, since you are saying that the python3-pyvenv package depends on python3-venv?, shouldnt they be the same package?
 

+        ],
+        "files": [
+            "${bindir}/pyvenv*"



Again, this should probably on one single package.




 +        ],
+        "cached": []
+    },
     "resource": {
         "summary": "Python resource control interface",
         "rdepends": [
@@ -1107,6 +1118,21 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
         ]




This is wrong because, cached files shouldnt be on rdepends.



Everything from there to the bottom is probably ok.

 },
+    "venv": {
+        "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories",
+        "rdepends": [
+            "compression",
+            "core",
+            "logging",
+            "shell",
+            "stringold",
+            "unixadmin"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/venv"
+        ],
+        "cached": []
+    },
     "xml": {
         "summary": "Python basic XML support",
         "rdepends": [</pre>
          <p><br>
          </p>
          <p><br>
          </p>
          <p><br>
          </p>
          <p>Also, this patch is missing the changes to the python3
            recipe file where the python3-pyvenv package was being
            previously created, if were now doing it through the
            manifest, then we dont need it in the recipe.</p>
          <p><br>
          </p>
          <p>Thanks!</p>
          <p><br>
          </p>
          <p>Alejandro<br>
          </p>
          <p><br>
          </p>
          <p><br>
          </p>
          <p><br>
          </p>
          <div class="x_x_moz-cite-prefix">On 10/22/2018 11:48 AM,
            Hugues Kamba wrote:<br>
          </div>
          <blockquote type="cite">
            <style type="text/css" style="display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
            <div id="x_x_divtagdefaultwrapper" dir="ltr" style="">
              <p style="margin-top:0; margin-bottom:0">Dear All,</p>
              <p style="margin-top:0; margin-bottom:0"><br>
              </p>
              <p style="margin-top:0; margin-bottom:0">As it currently
                is, python3-pyvenv is broken because it is missing the
                venv module run-time dependency.</p>
              <p style="margin-top:0; margin-bottom:0"><br>
              </p>
              <p style="margin-top:0; margin-bottom:0">The patch I am
                submitting is to add the venv module dependency to
                python3-pyvenv. </p>
              <p style="margin-top:0; margin-bottom:0">The dependency
                has been <span style="font-size:12pt">added </span><span
                  style="font-size:12pt">using the newly added venv
                  package (python3-venv).</span></p>
              <p style="margin-top:0; margin-bottom:0"><span
                  style="font-size:12pt">The python3-venv package has
                  been added for future proofing since pyvenv has been
                  deprecated in Python 3.6 and creation of virtual
                  environment is done using the venv module directly
                  (i.e python3 -m venv my_venv).</span></p>
              <p style="margin-top:0; margin-bottom:0"><span
                  style="font-size:12pt"><br>
                </span></p>
              <p style="margin-top:0; margin-bottom:0"><span
                  style="font-size:12pt">Regards,</span></p>
              <p style="margin-top:0; margin-bottom:0"><span
                  style="font-size:12pt"><br>
                </span></p>
              <p style="margin-top:0; margin-bottom:0"><span
                  style="font-size:12pt">Hugues Kamba</span></p>
              <div id="x_x_Signature">
                <div id="x_x_divtagdefaultwrapper" dir="ltr" style="">
                </div>
              </div>
            </div>
            IMPORTANT NOTICE: The contents of this email and any
            attachments are confidential and may also be privileged. If
            you are not the intended recipient, please notify the sender
            immediately and do not disclose the contents to any other
            person, use it for any purpose, or store or copy the
            information in any medium. Thank you. <br>
            <fieldset class="x_x_mimeAttachmentHeader"></fieldset>
          </blockquote>
        </div>
      </div>
      IMPORTANT NOTICE: The contents of this email and any attachments
      are confidential and may also be privileged. If you are not the
      intended recipient, please notify the sender immediately and do
      not disclose the contents to any other person, use it for any
      purpose, or store or copy the information in any medium. Thank
      you.
    </blockquote>
  </body>
</html>

--------------5EAE415193294C1DC9B134F4--
