Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0055.outbound.protection.outlook.com [104.47.34.55])
	by mail.openembedded.org (Postfix) with ESMTP id CC06279715
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 21:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RhbPpnNvgQ+7EVa4Yh1YVLGNp41/qvcVp9wby1vcJEw=;
	b=b0c0ttg7VQA7BfsSdG7KKZpGeI5rE8gSUba/kn0ujmwPJI/WAXnwRGZcBqhK7hVLZVMad91xR1KKHJQCU2NqZkVqr0RDkZVDkIdUPeyA7Za88s98x9ZEKRBb6OR3kNv2WviNB1ypbnn7qL3Q9tSJzIXJ57xxU2sVB4+btUGU5x0=
Received: from MWHPR0201CA0027.namprd02.prod.outlook.com
	(2603:10b6:301:74::40) by BY2PR02MB507.namprd02.prod.outlook.com
	(2a01:111:e400:2c39::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.18;
	Mon, 10 Sep 2018 21:34:01 +0000
Received: from BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by MWHPR0201CA0027.outlook.office365.com
	(2603:10b6:301:74::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1122.15 via
	Frontend Transport; Mon, 10 Sep 2018 21:34:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT055.mail.protection.outlook.com (10.152.77.126) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1122.15
	via Frontend Transport; Mon, 10 Sep 2018 21:33:59 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:52770
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fzTol-0005fG-2f; Mon, 10 Sep 2018 14:33:59 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fzTof-00009R-VA; Mon, 10 Sep 2018 14:33:54 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fzToc-00009C-L6; Mon, 10 Sep 2018 14:33:50 -0700
To: Jens Rehsack <sno@netbsd.org>, Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
	<CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
	<27c3c64d-574e-e4b8-f1db-343e4a660724@xilinx.com>
	<F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <badf35f0-449f-d632-c016-509dfb3f0f01@xilinx.com>
Date: Mon, 10 Sep 2018 14:33:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(438002)(189003)(199004)(53546011)(36756003)(65806001)(31686004)(476003)(126002)(76176011)(63266004)(26005)(2616005)(77096007)(4326008)(106466001)(186003)(1720100001)(11346002)(65956001)(426003)(356003)(84326002)(446003)(6246003)(236005)(54896002)(6306002)(336012)(2906002)(229853002)(110136005)(486006)(316002)(93886005)(58126008)(37036004)(36386004)(65826007)(106002)(606006)(5660300001)(15650500001)(9786002)(966005)(8676002)(81156014)(478600001)(8936002)(2420400007)(31696002)(81166006)(5024004)(14444005)(64126003)(270700001)(16586007)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB507; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT055;
	1:x52896geBIiqCwKQk36RkgaKgAH5ri8is5meanddlar4yOqbMHZVZWSCE4eB0X0lqj3n9ZwCZL5Thr1J4RAHQBe4LGfESENPoSgEEcm+NWgZQN6muIPDC2o5G7OAkJjK
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bb40cdb-a1b0-438f-1997-08d617651f31
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BY2PR02MB507; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB507;
	3:S4Of5tf3dev8Dqv6UtHQwgynRg4XB60y//UhQX8mfeSopl+ttDZOLlejvRCS1PvoCuzd6Wjv/Gb9EdVscMhvoDtl65TPWMJ2vk5lD2CCMaESe4gITmcPk//HGAMxYPLRGqcMf9hjeVbu6sxREY+gHqL7IPZLtjuI3DvYL3pD5/Wo+3c/r8UdpYw2bx/4PgFL9ZXuVDb5pDpuy1EP8NpGl4DuKuuKJPcMNjyTWx1dkmgQxwZqYa4PNFMwOCCoQ6Q+Q+vYxBphI+ebRJtvuvhSJRmaXNzcq/4H5RyfwmZx5A5qY6185oWTX+z22XhC9hnae8oJ4BLRUsvrcWeGPvDGGtzlnFvwj/Xrj9JxxqGkKAs=;
	25:yZBSDiRlJFQln0vLA/39+hfFYUJCJxwYonFBPKf60hC2FbD1Wb/DVUerp7IDEHGOq/hsRHgiwS6d47f0aA2sfgOYNWyrCflVNlCA3TAnmQhcouAzaTy++HsAbpwglDN1DDJPDwrI+UiVewojEkwQ4iy09UvRxI9aCkeixqyAmQK6+3p1VzhzvjkLLvDtwK622KT0U+mwCM34o+K+QVAeRwc+jqfZ2yOfeOD29r/z66A7Xf66jMf36eUmej1oMNOeunZ08+ohICpEVDVZ6YEI/NNqOk8MsyKbt0DmoZya8/hRebR8f0ka8vaK+Vw8lQh9JTwC5fyClZowAP17R2711g==
X-MS-TrafficTypeDiagnostic: BY2PR02MB507:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB507;
	31:VedImwqk/kyBdqc1EDP3ui7zB/G88YJU7R1tbADrbMZuu2icH0H9spq1upmwbIxqnCbHlroqUSFEgBWxFIAYhQyDfN1eru3wb7IIaOBtX8iWENjSTGsHiq0aWXHORTIYuhq3vSCszpLrHudXnGpnNQlISXWn3kE+QSZam1eSmOYYVfmdY8noA+gCH3Dr19gsD6luFJaCDMyvKm6uv/B8RMyjsIXiCRWOmvJafrnX4xI=;
	20:7LWuQ6glH/3k0uMmEf14knRgAmgo8i4pFvkcL399NXXYIqEc7qtsUTR9GJAaJqUyYCnAeedvT/B24yLo+6MWpm1tE+yhdUc3psyVaV/s9xjrh0sobQ5PkYTKdjone0mr2NPemWH0XXRop6Qgafvi8mnExlxeQlET1LHSLTfKFUWAf/eLgS+rr1faTLtctIapE5pNTS+xLKt9YcmPi2IvontZ0Q4VTrVqxgL905NWh9Yfrrp3w7YoySK7OHiV0FVZgpbeL2oIkvTRWAI9oWZbt05gskyoN6b7bVkKFNjydeAQqSTLRNYHn+Omlpm+9GleyWiC0L7BFJdwdLh3BWbtZygd++KkaLleYYJqL5wmUoecDY13x2HCwDddDZ0yOjzOs9B5KL+qFxGlbDZgIAJT5c/VoJtF0dwZ7XdQUNM+Lg5PlQGMmH20xCJQYhfZnXhdwly3a7STUotU4OFpCEGGVBzRrZJTTEKgCETjBGxS85A/OP4geSnh7MX/65EQ6Wba
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB5070E0375C0090CE9593EA1AC050@BY2PR02MB507.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(264703809997249)(192813158149592); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93004095)(10201501046)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699050);
	SRVR:BY2PR02MB507; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB507; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB507;
	4:xN+LRZ9QtwX56LZuq9+UPB+EvATLaW7czrN0ZWVaP8xsya0u43RCqLfRUuO5WOhKyzmQ4NsnFvDJVjFSALFAI5VsZrQr3H72Mcg8/VNlliSa2xTgOu/bS8ZPBMDaC31E3YWu/jpN5DOVMGQamJhK+OJy4r2L5udRn9+EAoZ6kWkJovYjUmHZj5u4KPeqMXa79tZ/9/oFldSbkOB3xdmJjm+vqN8kjVv+opAF7FjBc5VRet++eDvD8h6d4d4WDlL5qjPNf++ITCrpNkkjfphZVwcLQsbz5vklNEkzyzqYLyd+YdqHXBCxGNoL64oMrgd1t73gtVX0vswkf6ukkXaZDK9tmq+mTKH8c37GLfE/Ga7cglwJjCHOQlaR+HmEDUvd
X-Forefront-PRVS: 07915F544A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB507;
	23:oDtZnrpH6yyKr0ZdpjIgbFqmaff7Bmhd9VMkmZJ3oV?=
	=?us-ascii?Q?PEo1Cbuqf8OvyXzRWAeOcQx3ghEc2No82y7vKMH35PTrNt4vn8d7GDwOr7j7?=
	=?us-ascii?Q?ZBgy2eg3os3IgWl3bqqt1nklU3GgKty0SNHmGIYRwQa4nW1cpElgs8c1T7zk?=
	=?us-ascii?Q?gmoIg7vDxzJ0xZX6XKdWzVvWrG5b4pmzp4pj/rpvVxa6T9LsHO+cWBWIuF4l?=
	=?us-ascii?Q?DWVkQxtMnrEu9Z/S/Hy/vtThXIaJJAPVpRqQOFrNIPEe9fx4Br14290aARz6?=
	=?us-ascii?Q?dp2MT0Ilki0hf+5QBzXTCHu2TTAOhgpG18L3kt8CoE2jjVw5bw0coi0Ds1BP?=
	=?us-ascii?Q?7Sx64h6/tSt6qsBjoUO4I8R4vkqeZwQuanVcrWd1Bv0HUD16licDXOd6mBMC?=
	=?us-ascii?Q?9if4UUXuJ0xHwmRp3xn0NsTOVjrWB5VJeZ+CH/xjexIw5yJN70mKFIrVGmZq?=
	=?us-ascii?Q?5AlAnq195BUtsMCGOuBLUtqoo/gViAd2XodTDCm6ZQSAe/aQKyVNZoVabDEL?=
	=?us-ascii?Q?6QwcSt+BTtCj3kEC3KSti0XY4oOG7ibaY6XY2aFxeph+DupMSGrDsVRMz22q?=
	=?us-ascii?Q?nnzHBdHFAIKB3z54GX4B5s0diTGvJWwKYTBmbJvc5F2hY/PSK5+xqVGCas3Y?=
	=?us-ascii?Q?YR7VZEjCOYnwLozBCaGTyOMJvMO5SrUoX4ROpyvwEcq6792FdB2uuWr3sjw6?=
	=?us-ascii?Q?VEMz40nei/wQfEXbSqI25b2PyvA+taKV1pp0mHxr6swdtLSgb1hzwwRKQuqm?=
	=?us-ascii?Q?wfDUENhOyJNkffwllcTlmfsf2aJxm56rkco/yRF4SOYzwKFa7I5SgBvg+f3f?=
	=?us-ascii?Q?LNDu7rKARV+mxDthFAACcz1rBg8hhJxlpGndmRmhrHa99u2C5pvpQJZaJ/1r?=
	=?us-ascii?Q?9VpsvJC7tknZoXNr9PoBG69WJzm5xt7jHAcuYYUYKQzJ20PS4LdmRJblriCl?=
	=?us-ascii?Q?FfH8iRQKU0GnQxEcqVSRa9E1pe/SYN12woZw26EYLhXhui5YoeWInSFTJ71e?=
	=?us-ascii?Q?JntMjvUCDI+yMay6bHIvszRy+oJY22IQ61rFEG7q9+kNQdwsljbvfRMMTHQZ?=
	=?us-ascii?Q?8vnSADpIpxukjsOI6IHQ0As6g7AxpOELLrYRYXnc0ZkH5ScgtRxmyfGOTstJ?=
	=?us-ascii?Q?BUKYLuG60VDRt6kYwKs0Rc9KJYXfvgHwinDVRqLCk0ma3kCa76kjkLwCukdF?=
	=?us-ascii?Q?w6nBDCFOF8c5SmAnKXJijIseTy7wbxFlNdsSXyN/0Ct9zBK/gg7+iDNfdRqi?=
	=?us-ascii?Q?rEd2Rg3urFtHZsJlzOCT4CWLNd0wqJLSs0dI2bOwewY9t8Xo47pWmSJwKdTj?=
	=?us-ascii?Q?E71tZqsi+kCusEGkgLBKTWvRC+NkluuY6+oJny7aGiP1DT3Uc50kZxMeL1Nh?=
	=?us-ascii?Q?hK7AKP75Z6JWW4wmcmRGSZeBbszuU/7fVUllA7K9e4wYWuB1SfjAHQMfO28z?=
	=?us-ascii?Q?ljKHF+1w=3D=3D?=
X-Microsoft-Antispam-Message-Info: 76Pl68/Azc61LNJo9NVyZzkxFkHpI7h33PqnKVPmeFLRHW2GLrzhRCkLNbrcPOG6f55UEXY3vSO2P3OiCVelNTxgFqhYFUqr1LwlhXgJybWn5Iy/UZrwnHIE/WzafZKeFDsHT+xWf2FcUJ+toxqUY8gPyRhYnOuJFWpCR12mvuVJMvqF7nwsR7+oy9/UlyygIV5vsDXNspvINbHpJihkp3ln+zE3XjQR7jc2ci9brC3iQtNMmT+yb2v49PMQ1onOJ/mZLiAMdG1Gc29N7MAIdtbZIIp7bKhP6qL0+mnbxDJTtWppnThOn2bLrPcfvQjCzq6LfKiklh19D/A+1PfzAwBX2vhdJlV10GQbYIW6n0Y=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB507;
	6:WPRA4pGhGRnWCJFlc2PqQlHLBREovoBxKqkhB8pVgrrt69hZZFPBQZE37NFjWf6e0KE7U1dmNEQSn7wQbPfpaM5/gW7NbyMW72ljuoMcU/KN7uPvmJa+ktDpQXN4byCagh3O6QVjAny3oVwnb/9dHCgeD3K0W+QJ8j+CFCSVLKfzVgs9LcAKnFq84anIAGpBHeG6vCLG/6OhMeml0rTRBP6IIebMyqxWnk0yKSYTk+GuGZUjBMnArfycUCx9FZfiEaMoWB4PLWRdUqKl1hbaTRogM23OWVyrnyl1nE1UPfp+1Bn6oiqtJKRLnV7hUDxCPtYUf+T+cyPJ6M0M0yQom1o8lEcZtFWcpR1A93lSUqEkYvWBCjhBiGchoYYRLS5f6bLq3pwNc/MQtduVJsgUS06qUE5lBRowcbWEwS2wT8iSGaxxWzW3Wlf/NhsR8XfWl9BVAq2ufiDoAOL3DdU5yw==;
	5:B6V+14Wm9GWGGGbYKEIuC3ffQDV+eK6huE5iryfQFwIzfqnAmM/KX+QYYbI9eIneylma1rI39wcdDh7oHF6Jag2CmAA84fx1+RVSwSzm6tI5T2M9+yqQjPw6Z3H1c8b/3WRIMZ5T2FaWZZ2siAXwE7nsqZcK2ZL3mCHAkcjXTh8=;
	7:3VFvYkggoSvzBdx7bjvZA239cSeWx+p61IcKLFc1qKP/I/w3V/+0N0fO8Rivp6ZCO6MAU9f0f966C6ew1WcXa52XrIakTZ5n14V7yQZxB0xjJaj81yFO3p03k7MU7TbKxnMrrxyMQ9+J2ZcFV4Z5Zjabat5d4ZG7yzBy57DrKpgoCX8Q0SCLBRgT97pZJVKZY2Hrm3tjruS14fzJ1U6i6GylOSRKGrcobiZqN0mfzO6iaMiToa8tz4W4QAn1JXFf
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2018 21:33:59.8044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb40cdb-a1b0-438f-1997-08d617651f31
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB507
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Mon, 10 Sep 2018 21:34:02 -0000
Content-Type: multipart/alternative;
	boundary="------------D9E9C7B5BDBE5C44C1F5BB9A"
Content-Language: en-US

--------------D9E9C7B5BDBE5C44C1F5BB9A
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hey Jens,


As I explained before, when you create a manifest for python (target), 
it uses the native build as base (it literally runs the native python 
that was just built), it is assumed its the same version as target and 
contains all the modules provided by upstream, otherwise the missing 
modules cannot be checked for dependencies, and the manifest becomes 
incoherent, so its not an option to have an incomplete python native build.


Yes you probably need a patch to look at the correct directories for the 
h files, as well as a dependency to make the h files available on 
recipe-sysroot-native.

Alejandro


On 09/10/2018 02:05 PM, Jens Rehsack wrote:
> Hey Alejandro,
>
> I fixed that for cross-compile only, since I would need add a patch 
> and a dependency python3-native for one thing: calculate uuids.
> When you can explain to me why the python-native needs that, I'll 
> change that from -target & nativesdk to all.
>
> From my point of view it's not a question of having every (unneeded) 
> python module being built for the native python, which is used for 
> cross-compiling python and some modules only.
>
> Cheers,
> Jens
>
>> Am 10.09.2018 um 22:17 schrieb Alejandro Enedino Hernandez Samaniego 
>> <alejandro.enedino.hernandez-samaniego@xilinx.com 
>> <mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>>:
>>
>> Hey Jens,
>>
>> The compilation log for python3-native still shows that it didn't 
>> build the uuid module
>>
>>
>> Python build finished successfully!
>> The necessary bits to build these optional modules were not found:
>> _uuid
>>
>> Please look at my previous reply to find how this can be solved (its 
>> likely a missing DEPENDS).
>>
>>
>> Also, this patch is missing the new python3 manifest for this 
>> release, there appears to be a few new modules that we need to decide 
>> which package they belong to, this is the output of bitbake python3 
>> -c create_manifest:
>>
>>
>> | ERROR:
>> | The following files are repeated (contained in more than one package),
>> | this is likely to happen when new files are introduced after an 
>> upgrade,
>> | please check which package should get it,
>> |  modify the manifest accordingly and re-run the create_manifest task:
>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so
>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so
>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so
>> | ${libdir}/python${PYTHON_MAJMIN}/contextvars.py
>> | ${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc
>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so
>>
>>
>> Cheers,
>>
>>
>> Alejandro
>>
>>
>> On 09/10/2018 09:38 AM, Burton, Ross wrote:
>>> One thing to be aware of is that I've been fixing up Python's PGO
>>> support and there's a slew of patches in master-next and more just
>>> posted that this needs to be rebased on top of.  Good news is that my
>>> patches remove two of the patches we've been carrying!
>>>
>>> Ross
>>>
>>> On 10 September 2018 at 17:36, Jens Rehsack <sno@netbsd.org 
>>> <mailto:sno@netbsd.org>> wrote:
>>>>
>>>> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin 
>>>> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>:
>>>>
>>>> Large parts of dnf and friends have been rewritten in c++. I have not
>>>> yet updated and reviewed that, that will happen in the next cycle.
>>>>
>>>>
>>>> If I can prepare something for you - drop me a note.
>>>> Otherwise - the perl-5.28 update ("." in @INC, regex buffer 
>>>> overflow, ...)
>>>> is also
>>>> awaiting some progress (I can keep "myself" busy).
>>>>
>>>> There's already enough disruption to deal with (postinsts errors,
>>>> openssl 1.1, both caused by me :)
>>>>
>>>>
>>>> You know, corner, ash, ... things happen. But there is progress! Great!
>>>>
>>>> Good that we got all the way to do_rootfs though with 3.7.
>>>>
>>>>
>>>> Yeah, but than came postinst (coreutils :P) :D
>>>>
>>>> Cheers
>>>>
>>>> Alex
>>>>
>>>> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com 
>>>> <mailto:ticotimo@gmail.com>>:
>>>>
>>>> I did not review the patches closely, but I did try to build
>>>> core-image-full-cmdline with the tip of poky and these patches applied.
>>>> Everything was fine until do_rootfs... I've attached the log.
>>>>
>>>> Essentially, there are some bits of dnf and so on which are not 
>>>> ready for
>>>> Python 3.7. We have dnf version 2.7.5, but the latest upstream 
>>>> release is
>>>> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would have
>>>> helped.
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org 
>>>> <mailto:Openembedded-core@lists.openembedded.org>
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>> --
>>>> Jens Rehsack - rehsack@gmail.com
>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org 
>> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> -- 
> Jens Rehsack - rehsack@gmail.com <mailto:rehsack@gmail.com>
>


--------------D9E9C7B5BDBE5C44C1F5BB9A
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Jens,</p>
    <p><br>
    </p>
    <p>As I explained before, when you create a manifest for python
      (target), it uses the native build as base (it literally runs the
      native python that was just built), it is assumed its the same
      version as target and contains all the modules provided by
      upstream, otherwise the missing modules cannot be checked for
      dependencies, and the manifest becomes incoherent, so its not an
      option to have an incomplete python native build.<br>
    </p>
    <p><br>
    </p>
    <p>Yes you probably need a patch to look at the correct directories
      for the h files, as well as a dependency to make the h files
      available on recipe-sysroot-native.</p>
    <p>Alejandro<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 09/10/2018 02:05 PM, Jens Rehsack
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      Hey Alejandro,
      <div class=""><br class="">
      </div>
      <div class="">I fixed that for cross-compile only, since I would
        need add a patch and a dependency python3-native for one thing:
        calculate uuids.</div>
      <div class="">When you can explain to me why the python-native
        needs that, I'll change that from -target &amp; nativesdk to
        all.</div>
      <div class=""><br class="">
      </div>
      <div class="">From my point of view it's not a question of having
        every (unneeded) python module being built for the native
        python, which is used for cross-compiling python and some
        modules only.</div>
      <div class=""><br class="">
      </div>
      <div class="">Cheers,</div>
      <div class="">Jens<br class="">
        <div><br class="">
          <blockquote type="cite" class="">
            <div class="">Am 10.09.2018 um 22:17 schrieb Alejandro
              Enedino Hernandez Samaniego &lt;<a
                href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com"
                class="" moz-do-not-send="true">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div>
            <br class="Apple-interchange-newline">
            <div class="">
              <div class="">Hey Jens,<br class="">
                <br class="">
                The compilation log for python3-native still shows that
                it didn't build the uuid module<br class="">
                <br class="">
                <br class="">
                Python build finished successfully!<br class="">
                The necessary bits to build these optional modules were
                not found:<br class="">
                _uuid<br class="">
                <br class="">
                Please look at my previous reply to find how this can be
                solved (its likely a missing DEPENDS).<br class="">
                <br class="">
                <br class="">
                Also, this patch is missing the new python3 manifest for
                this release, there appears to be a few new modules that
                we need to decide which package they belong to, this is
                the output of bitbake python3 -c create_manifest:<br
                  class="">
                <br class="">
                <br class="">
                | ERROR:<br class="">
                | The following files are repeated (contained in more
                than one package),<br class="">
                | this is likely to happen when new files are introduced
                after an upgrade,<br class="">
                | please check which package should get it,<br class="">
                |  modify the manifest accordingly and re-run the
                create_manifest task:<br class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so<br
                  class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so<br
                  class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so<br
                  class="">
                | ${libdir}/python${PYTHON_MAJMIN}/contextvars.py<br
                  class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc<br
                  class="">
                |
                ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so<br
                  class="">
                <br class="">
                <br class="">
                Cheers,<br class="">
                <br class="">
                <br class="">
                Alejandro<br class="">
                <br class="">
                <br class="">
                On 09/10/2018 09:38 AM, Burton, Ross wrote:<br class="">
                <blockquote type="cite" class="">One thing to be aware
                  of is that I've been fixing up Python's PGO<br
                    class="">
                  support and there's a slew of patches in master-next
                  and more just<br class="">
                  posted that this needs to be rebased on top of.  Good
                  news is that my<br class="">
                  patches remove two of the patches we've been carrying!<br
                    class="">
                  <br class="">
                  Ross<br class="">
                  <br class="">
                  On 10 September 2018 at 17:36, Jens Rehsack &lt;<a
                    href="mailto:sno@netbsd.org" class=""
                    moz-do-not-send="true">sno@netbsd.org</a>&gt; wrote:<br
                    class="">
                  <blockquote type="cite" class=""><br class="">
                    Am 10.09.2018 um 11:35 schrieb Alexander Kanavin
                    &lt;<a href="mailto:alex.kanavin@gmail.com" class=""
                      moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;:<br
                      class="">
                    <br class="">
                    Large parts of dnf and friends have been rewritten
                    in c++. I have not<br class="">
                    yet updated and reviewed that, that will happen in
                    the next cycle.<br class="">
                    <br class="">
                    <br class="">
                    If I can prepare something for you - drop me a note.<br
                      class="">
                    Otherwise - the perl-5.28 update ("." in @INC, regex
                    buffer overflow, ...)<br class="">
                    is also<br class="">
                    awaiting some progress (I can keep "myself" busy).<br
                      class="">
                    <br class="">
                    There's already enough disruption to deal with
                    (postinsts errors,<br class="">
                    openssl 1.1, both caused by me :)<br class="">
                    <br class="">
                    <br class="">
                    You know, corner, ash, ... things happen. But there
                    is progress! Great!<br class="">
                    <br class="">
                    Good that we got all the way to do_rootfs though
                    with 3.7.<br class="">
                    <br class="">
                    <br class="">
                    Yeah, but than came postinst (coreutils :P) :D<br
                      class="">
                    <br class="">
                    Cheers<br class="">
                    <br class="">
                    Alex<br class="">
                    <br class="">
                    2018-09-10 0:38 GMT+02:00 Tim Orling &lt;<a
                      href="mailto:ticotimo@gmail.com" class=""
                      moz-do-not-send="true">ticotimo@gmail.com</a>&gt;:<br
                      class="">
                    <br class="">
                    I did not review the patches closely, but I did try
                    to build<br class="">
                    core-image-full-cmdline with the tip of poky and
                    these patches applied.<br class="">
                    Everything was fine until do_rootfs... I've attached
                    the log.<br class="">
                    <br class="">
                    Essentially, there are some bits of dnf and so on
                    which are not ready for<br class="">
                    Python 3.7. We have dnf version 2.7.5, but the
                    latest upstream release is<br class="">
                    3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet
                    if that would have<br class="">
                    helped.<br class="">
                    <br class="">
                    --<br class="">
                    _______________________________________________<br
                      class="">
                    Openembedded-core mailing list<br class="">
                    <a
                      href="mailto:Openembedded-core@lists.openembedded.org"
                      class="" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br
                      class="">
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br
                      class="">
                    <br class="">
                    <br class="">
                    --<br class="">
                    Jens Rehsack - <a class="moz-txt-link-abbreviated" href="mailto:rehsack@gmail.com">rehsack@gmail.com</a><br class="">
                    <br class="">
                    <br class="">
                    --<br class="">
                    _______________________________________________<br
                      class="">
                    Openembedded-core mailing list<br class="">
                    <a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br class="">
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br
                      class="">
                    <br class="">
                  </blockquote>
                </blockquote>
                <br class="">
                -- <br class="">
                _______________________________________________<br
                  class="">
                Openembedded-core mailing list<br class="">
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  class="" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br
                  class="">
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br
                  class="">
              </div>
            </div>
          </blockquote>
        </div>
        <br class="">
        <div class="">
          <div style="color: rgb(0, 0, 0); letter-spacing: normal;
            orphans: auto; text-align: start; text-indent: 0px;
            text-transform: none; white-space: normal; widows: auto;
            word-spacing: 0px; -webkit-text-stroke-width: 0px;
            word-wrap: break-word; -webkit-nbsp-mode: space;
            -webkit-line-break: after-white-space;" class="">
            <div style="color: rgb(0, 0, 0); letter-spacing: normal;
              orphans: auto; text-align: start; text-indent: 0px;
              text-transform: none; white-space: normal; widows: auto;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              word-wrap: break-word; -webkit-nbsp-mode: space;
              -webkit-line-break: after-white-space;" class="">
              <div class="">-- </div>
              <div class="">Jens Rehsack - <a
                  href="mailto:rehsack@gmail.com" class=""
                  moz-do-not-send="true">rehsack@gmail.com</a></div>
            </div>
          </div>
        </div>
        <br class="">
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------D9E9C7B5BDBE5C44C1F5BB9A--
