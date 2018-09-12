Return-Path: <alejandr@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0060.outbound.protection.outlook.com [104.47.36.60])
	by mail.openembedded.org (Postfix) with ESMTP id BD61379693
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=u29+CQIV+tzI7FZux31CTOWg3ut1WMOX0ng2/oqe0CQ=;
	b=GWxv8ghu4jIca6z3D8QmVLD3utwVgSoQO/tM/h5ZPlkOYP0QqHqH6D2jULv/xnNbJiBz5inGeu4XUHXVWuDlMMjRKC6pZvZ8gk72X00wHmJ/bV6m9LunW7039ZS2CaN8/CjQB4FkmSPL59kpdHz1fatli/Aw8wGNZFJU6jsp4a8=
Received: from MWHPR0201CA0096.namprd02.prod.outlook.com
	(2603:10b6:301:75::37) by BL0PR02MB4753.namprd02.prod.outlook.com
	(2603:10b6:208:5d::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.18;
	Wed, 12 Sep 2018 21:02:50 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by MWHPR0201CA0096.outlook.office365.com
	(2603:10b6:301:75::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.16 via
	Frontend Transport; Wed, 12 Sep 2018 21:02:49 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1143.14
	via Frontend Transport; Wed, 12 Sep 2018 21:02:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0CHg-00031q-TH; Wed, 12 Sep 2018 14:02:48 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0CHb-0005F5-Pg; Wed, 12 Sep 2018 14:02:43 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8CL2fLC028658; Wed, 12 Sep 2018 14:02:41 -0700
Received: from [10.23.118.184] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g0CHY-0005Eq-Rx; Wed, 12 Sep 2018 14:02:41 -0700
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
	<badf35f0-449f-d632-c016-509dfb3f0f01@xilinx.com>
	<0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org>
	<17b3364c-32a6-91db-6583-6eb7e0131394@xilinx.com>
	<8ABCF3BE-EFE8-4FE6-9886-65F6AE4E4EDC@netbsd.org>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <b74ecac2-3eb1-62e9-6162-449d678e03c9@xilinx.com>
Date: Wed, 12 Sep 2018 14:02:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <8ABCF3BE-EFE8-4FE6-9886-65F6AE4E4EDC@netbsd.org>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(438002)(54534003)(189003)(199004)(81156014)(229853002)(84326002)(76176011)(31696002)(8936002)(486006)(2616005)(446003)(11346002)(14444005)(2906002)(6246003)(36386004)(77096007)(478600001)(58126008)(37036004)(16586007)(336012)(54896002)(65956001)(316002)(356003)(9786002)(53546011)(4326008)(6346003)(426003)(81166006)(110136005)(476003)(3260700006)(26005)(106002)(64126003)(5660300001)(8676002)(15650500001)(236005)(186003)(126002)(65826007)(93886005)(63266004)(36756003)(65806001)(31686004)(106466001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4753; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT012;
	1:fqTkZB9kpw0o4vZ5EEng16flqrbEOsRiUxoYvFBm+Uh88HMSnUmb2Z+dM7qA97TAJfIkmv/E9y/iDysoV9d9SAYJ90PPRBJuQxxqAou5P1CwGbL2IsODSyHEIXyW5eN9
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6276aa3-65f5-494f-f1cb-08d618f31906
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4753; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4753;
	3:ygOPfUHMjhR9mxXRYX57BMK6WDIr1nPpMKYDB9JHWftrPzk7TCGPgGMolP8dc1ezbdf1NVtc0gRSeudYiTNMhTfG/Qkn9vkfOuDeHEHbvbrl48v9P/hV81PelYset5d3lwGxuzfFvlTFtlCvcQNj1TxMwjGo1zZ8i6Z2ZrDt8Wap0HGPV/Su2DGvWQPd5NV+GoPI8CmfNRI56tkLC3Is37jMgxmLBwS5Qqzxmk6nsPSTDj6RZQ9j2/D3OVtYfx2U2gWy5/yXTSXSTIvdeJHoxhlkHN0aFgSzvXfASJCRcyL3sOoAXIzrvBX6yY0koJMlbgIe1+Yb94DxPwl4IFAQdQwT3nbtB8NAPh1tZJ9NX3g=;
	25:lEPfvyv/ewBkvPkhIkpzd5EARf50c7T9kVd+eZo34MKPM9GTrFEgL+q8dxlLcDBykIi4mwG9DQIbcnsn36VdGfuFYkZglchqcZcNApjkNVazZjChiFwEH6CNEDN6xrUXArgsu0+vL5990+Hb4SM4y2frjVhagcNku016Lb74CL2fxPoY/fWH4UgnRhT4FaaMqdtusIY8io8MDm7gOJZclg1MEF7GpLP0fqu2T2lYg7z4d2/JwFNlG7IUVPZ59cx1jSatzVZ4hDd7inXRlK24yGhjKGgH0yTDcm2XjOyT9QdVsQppIj16RxwPMzSJi0VfvzSDz0Fk/jSGfoLVan5Cjw==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4753:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4753;
	31:mEHJ3GsvidySlICnl7Ilx/4n5gOGr2598HienjNryZaqC2JYEGLZkYa1zVDMM8z1cbGM0rJ0WLq3F/x7PNlAQkTPbU6T/56GzsKdDWwVirraSobSuJfG8stqYMUC841efsYtW0BhX3lL+Y0+9UDKYsLGb6w3qtA2ADqMinXDovtJBWf83HxybPinxAWLHGPVBWIqzC0FEynx7jwelsF9V833LsJRFqr1sBldL5upYBY=;
	20:GT/IHuRWDkM4G0HVijbjq5xWNxzHA2IiDOZ5YrDM+Kh+c2m/3DtuIoYF9FwY8Bhnq04g2DGgZg5hI2WJdzKaEcL23/nW1uljkIJ+NAJQX5emfT6wNwwtWumoK0pqaJaUaZiqeuwQrGJPEe89/hC3+WalRx5iAfIAHSZP81gBXbPE1mvrA5PVOT7EmwYSXsX8tPrYWCe8UCMZvLfFbWJpsOmCstZNcXzTS0RQcT2SV8rQ2nkRlO7DjQ5cM9BFWmRYBp1DpHOKJqmYeRkhlG1cesyEfFHle729TMQ47AaQvrImQ/6P8RkVVWsXf+Ejfj2OWJa867GNMoVNhmbU69ZhPUg6/aSzRsa2eWCmkZXHbOA7r8Kt2dtYpjQBcHqWmISNtOq73y39cqL8e7/YiePVzzGVh4a/yrPVBcTN2ZtnFZ5M7gChrE8X7dXz4Ws2ui5GpH0SpHfLaTFhby0GutiSiHqE7XW34vwJo1hjUvjAbFw+kbVHSfR+k9PQqFc+gdP4
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB47537C8859C37472D012C695AC1B0@BL0PR02MB4753.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592)(17755550239193); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93004095)(3002001)(3231344)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699050)(76991041);
	SRVR:BL0PR02MB4753; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4753; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4753;
	4:jQB0cpqd+9G7nMgxoMKfsXiLn4MJELf+ZOljun9Iv41UwZnjt1WWknhgsN3toufnct9E4JYgeArEEyfQr4xEM80TG+fe43pADLz9gLdWlAVbIe5+yBkm7fgo5rKA5X4Qldtz5cbWBNfZMhWkRmEd4vcCPNeqY16B7pbL6H6d2mK4d6mJFngQsPnwZxGv2EiaFUm9d+//FwQpeEihQUCNWXWbgBqmDsOfxvzUHUxaSPvjQiekJuNrlgZRkQ2ycr0jCKY4iPya+XmpcpduZathDCh0I+AEM82JHTouDICLPHCTp1yAB3PCRC3YQwMYaxbK7xy8jNncEDLl8vAxm4xsaHPfNb3kCdmw3NzhZrEyNGVbb+SbhCiU/CCI+rX+GGVm
X-Forefront-PRVS: 07935ACF08
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4753;
	23:lNW+Wgq5eiiDCED7d3RylAIzj63qYKjEgTXsoFKql?=
	=?us-ascii?Q?VF6k5SWPxKBCDcXV1swqELrosjAr+j0Q8CgJE+ZYH1dflqnqcGnh0OYFlfFB?=
	=?us-ascii?Q?Xc3R6HceBHITpxQwokET1ebFq11Fp+F1LDRUCARweuHNQ+kUseuYdofCAcux?=
	=?us-ascii?Q?/cIRHHv85AphWDVECXWqJRQfqEvk1hrqWKAsI45jblyUpiu1Vn71Yv+huORT?=
	=?us-ascii?Q?OkF6Wq1p++CizeM9o72lQ69/fux1v33zrYk+6soaoOtIoMwjX7ANfhfo+T/M?=
	=?us-ascii?Q?7wVP6+LrwE+Xvj12M8ML8IiKJnmGEeGD4UWX3+EXumEGO/fxj8bAR8aRukMs?=
	=?us-ascii?Q?fBfWf3IbtOpPhdUZGQR1m4ZIUP+5wFlZ7uBH54Nb6Ecs82cJAzXLh3RCj/iM?=
	=?us-ascii?Q?Tspq7/RqKGBRzzJY1z7g3dbKrzRyxqTqwqaxy2+0Fjl0SW0sUuvgESqiOBV1?=
	=?us-ascii?Q?sLfWk1AXMXz5WWPt5N9mwSmKkiU062KI0BdsUmARTW7DA6jnv7FoM6re6GHy?=
	=?us-ascii?Q?u20UBEhyayqIsAwS+2dh/3mfpmMLpTgiqaaHqzB/3yR0LYsY1Xb1drwWRE87?=
	=?us-ascii?Q?Ei9+DxxlowLkQ7+zKAOutxn/WnkLW1e8P4/x014yFuRcd/EuImpwm4YOyZsC?=
	=?us-ascii?Q?uoCu74P2DVDryJYcDscypnYM1FxNa8XEyeDFFjrypftwgljTiKT6HqpsQxys?=
	=?us-ascii?Q?DBCtfMRf/XuXM8fPd5BCmskKdEstpWNM6k/cfs7bRelfc725vVGegjz4BYb2?=
	=?us-ascii?Q?fxjF2Hdb/oOlIrcSGYYuewwnn3jTCPdkLAgrj1rJMTtPpvBCep+bJiUZfjsJ?=
	=?us-ascii?Q?kOIqjDegAfG/VVjGjwgteA0uMcmv+vRQwAveG6Wfzv8qBdjYZnPwrAjcG0M2?=
	=?us-ascii?Q?ut36PBuvZQwnypAc0pG3YLwoYj7JdDgprpl4NSYpTRXzA7VDvcx1HiqAWeQ2?=
	=?us-ascii?Q?oRaHyLkalaa8DHp67kSbMsbviqoKvZJyrexWFZyLEhuIjqY5kbTCtR1dxIjI?=
	=?us-ascii?Q?ML6uMcYrPLGat297q1ttVqBgY4WH80c3g0Ku2uqZ2/mScPsNeTFWOh9GRoGq?=
	=?us-ascii?Q?Wclk1LbHBRe1GXoFatuLUPbJFKAMD7EfYGYgFTY9xNt2obdOc08s+X6mNxHG?=
	=?us-ascii?Q?G97jnjj+IgY1DVCI0D+Gaysr/7N9a8pMObHaz5+Vni3jfqy78EDqXKsFX0zj?=
	=?us-ascii?Q?5R0wi/lCpb7dj+F72Fa98HHbcpuKrw+QfeqxkpjrIKe13YJbMcbbhcuwA8AY?=
	=?us-ascii?Q?UChXEbdVpokWoAw1No58GM1r4tsQ4OVa+OXZwv5p46RxlHVxs/bXTaJj2V5f?=
	=?us-ascii?Q?WS+6D18QzNP0TmkW/v6QLQ=3D?=
X-Microsoft-Antispam-Message-Info: E06kx2InEbXGpIs1qEmGDUDuCv9cxDXn6UV24o+EjFOpnU7SmgE1kP8WJV/AOHvv7vJStdteWFITyuWx4OU+YCwZxakNeixHRcyqW4cpOn1M7DpirEJ+zy6EHL67uu35HcLdemPXWcI6nlT+ro1rtHHBDQFCZQDiBe52b6stY9rVCmELnovjNp+yKVGBDBCTErayAymreo1F4YmDWJxloDhH6USod88DhdVQcIbvDQLAUU8F+kiWqQubAhPAttRyjSEaHRKdYFYbHN9B0QcRvCiVZLNgO+dg1GWrc6hUNxjByCLvC1TD8uw8hNw0pMfkB7CqKuCWpVPMN3zlJMxiH/PdzOl0R2gIcupbVUIullU=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4753;
	6:fMUtsQU+iPCLBl203Wn5N6gBY9TIGmDukchWo4j8ou+LvDcSnkTNSWjohWLwVj94Q14kAOzcH8bb/9vviI36XAqSuPHsoZIDBDT8DKtSx2m7M1Qe7JwbIQgAN8gpeQhCJJwtfRYLOPPzZQFCwJhvn3TkI9YJ6t4a4QzvnzIgQgqrDNYADgoMiYfuqRnhbBcxAS0+KjEQAod469TSkfW84/oBqueTCECx80z8bprj9AyGbDXN2S/EeENFI2osBypXO9c7XBEz7augnFO9WdyAw7aWh+yEEjfhB/xrSVBsw4MSyUxXiZ62emHNm2LBc1fYsiGc8866/XSJmqG4rf2O6ku8nxovr3si8dUwHVupuzDfr58Y1k8lYgvmKbhRkRkh7bV9AqcaObUJrRzN11bDjuH9jBs8GeTj4O40QsF4Ua0q1mMJy2z/CFNX7WW4+yU46iseh5jP1WKUPfkGWtmCxA==;
	5:UnDlCFz4Pl/7JF7FsIdqQTZgZ2oFljATxW0n1CEStT72iqqLkcnvLhIq9P1DAkLFBOYEawmxnmUVFYy3pDB9Z9ywUzOIFxcS3WpZ82YCz1cMGWTX5DpBVTl0+3bzZLvf18kuTKPblrFRc5YmdPAnelOY6K+nreUkXZ+27CAkCEE=;
	7:2ItYKquJV2Y9T2LmW/QF8UR1Mnrz8GAHddylkqlOQOM2MBpMffYJhfOloQclqXswG2F1ymV8yGc3NHTg+d3suRC4SpMsMpqt3Czp4lZx1RmVMY4YiPZl47p0F1MENEWRfIYzTQ09egMHa+NNmzYhvEyOVIvdePf5u1gRkWj/2ZQssmoD8SvsqhDYzNUTLgyR8vEwIAwY55fuzm3FxtkeemOp5BRQRHhlrZxIVw/HkrHHRXKmhp3neVbSIIC3r+wP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2018 21:02:49.2696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6276aa3-65f5-494f-f1cb-08d618f31906
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4753
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
X-List-Received-Date: Wed, 12 Sep 2018 21:02:51 -0000
Content-Type: multipart/alternative;
	boundary="------------0D248AA555A48112BA2FAB36"
Content-Language: en-US

--------------0D248AA555A48112BA2FAB36
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hello Jens,


On 9/12/2018 4:53 AM, Jens Rehsack wrote:
>
>
>> Am 11.09.2018 um 20:56 schrieb Alejandro Enedino Hernandez Samaniego 
>> <alejandro.enedino.hernandez-samaniego@xilinx.com 
>> <mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>>:
>>
>> Hey Jens,
>>
> Hey Alejandro,
>
>> On 09/10/2018 11:58 PM, Jens Rehsack wrote:
>>>
>>>
>>>> Am 10.09.2018 um 23:33 schrieb Alejandro Enedino Hernandez 
>>>> Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com 
>>>> <mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>>:
>>>>
>>>> Hey Jens,
>>>>
>>>>
>>>> As I explained before, when you create a manifest for python 
>>>> (target), it uses the native build as base (it literally runs the 
>>>> native python that was just built), it is assumed its the same 
>>>> version as target and contains all the modules provided by 
>>>> upstream, otherwise the missing modules cannot be checked for 
>>>> dependencies, and the manifest becomes incoherent, so its not an 
>>>> option to have an incomplete python native build.
>>>>
>>> In that case, uuid for target never gets deployed, but it is. And I 
>>> didn't see any packaging issues for `python3` nor for 
>>> `nativesdk-python3`
>>
>>
>> I don't see what that has to do with anything, fixing the native 
>> build should not affect what gets deployed on target, thats exactly 
>> why we have a manifest, so they user can decide what to install and 
>> what not to install.
>
> The manifest isn't used for python3-native.
> You try to argue whether there is an error to be fixed - and I don't 
> agree.
> Each fix requires effort - and that's why some errors will never 
> become fixed. When the impact is reasonable or high enough, fixes are 
> more likely.
>
> So: before you try to force me into "that's all ugly und must be 
> seriously beautified just because ..." I will not do anything.
> When you give me a sane reason, I try to understand and make a decision.



Ok first of all, I am not forcing you to do anything, and I've never 
said its all ugly, so please don't reply aggressively since I am just 
trying to help you get your patch merged, and it needs to work correctly 
for that to happen, this is a community and if you don't want to do 
something just don't do it, we're all trying to make this work in the 
best possible way, whether we get paid for it or do it for fun.

Second of all, I know the manifest is not used for python3-native, I 
never said python3-native used the manifest, but I am trying to explain 
to you why the fix is necessary, and I am even telling you what the fix 
is, so you don't have to waste your time and effort on that, here it 
goes once again:


There are python3-native and python3 packages.

The python3 package uses a manifest file, to go through the installed 
files by the whole python installation from upstream, and separates it 
in several packages, providing more granularity and giving users the 
possibility of installing a trimmed version of python, only with what 
they require on their image.

I think we're good until here.

The problem here comes because we don't control upstream python and it 
changes with every release, so new files show up, for example what I 
mentioned before sha3.*.so.

Since that file is not on the manifest, during packaging, it will end up 
on python3-misc, which contains basically everything that doesn't belong 
anywhere else, although clearly this file in specific should belong in 
python3-crypt.

What this means for the user, is that he/she will install python3-crypt 
and expect it to work at runtime, but this wont happen, and when sha3 
gets imported (or something that depends on it to run), it will fail,  
this will cause a bug on our system, which we would need to fix (yes, 
fixing bugs takes effort and time).

At this point an usual fix would be to just install python3-misc as 
well, because it contains the required library, but python3-misc also 
contains other unnecessary stuff that the user doesn't need, but anyways 
an RDEPENDS to python3-misc would somewhat solve it. The correct fix 
however, is to add the sha3.*.so file to the manifest, on the 
python3-crypt package, that way, it will get installed and the user 
would be able to use it correctly. This would solve one problem, but its 
still not enough, because, I can see (from the log), that there are some 
dependencies from other packages to sha3, which means that yes, it will 
work correctly if we decide to install python3-crypt, but if we just 
install one of the other packages that need it, it won't, again, it will 
fail to import it and its the same story, its introducing a bug into the 
system.

OK, up to this point I've explained how this will cause bugs in our 
system, now, what does this fix that I mentioned has to do with 
everything?.

There is a special task for the python3 package (not native), that 
creates a manifest for us, this task tries to import every module from 
the manifest and get its dependencies, for example, if the 
python3-numbers package needed the sha3 library (this is just an example 
I really don't know if numbers needs this), this will be picked up, and 
the python3-numbers package will RDEPEND on python3-crypt, hence solving 
both the bugs I mentioned before, even before they exist.

Now why is a fix to python3-native important for python3 target?

Because of the way the previously mentioned script works, it calls 
python3-native (it has to, because it can't use python from host for 
example, because its not guaranteed its the same version of python3 
target, and we need it to contain exactly the same files) to import all 
modules in an automated manner and get their dependencies, that's how we 
know if there are new files and/or rdependencies between python3 packages.

So what will happen if the python3-native build isn't complete?, 
whatever file its missing, we wont be able to catch dependencies to it, 
causing them to end up in python3-misc, causing the issue #1, and also, 
in any case, there wont be an RDEPENDS created to python3-misc (which 
would solve issue #1), sometimes files do belong in python3-misc, but we 
need to know that so we can add an RDEPENDS to it, but again if we just 
add an RDEPENDS to python3-misc we'll be causing issue/bug #2, which we 
won't catch, until someone actually tries to run something on a running 
image and gets an import failure on their application.


I'm not even asking you to fix the manifest, I am simply asking you to 
provide a functional native package (in this case, functional means with 
all modules built), so it doesn't break the current functionality that 
helps us catch these bugs. I hope its clear now that I am not asking you 
to just change something because I want "beautiful" code everywhere and 
I never was, I am asking you to do it because your patch will introduce 
bugs into the system, and I am trying to help you fix them.


Alejandro


>
>> I know you didn't see any packaging issues, but that doesn't mean 
>> they don't exist, just from the log I showed you, I can tell you that 
>> the python3-crypt package is not created correctly, for example, if 
>> you do:
>>
>> IMAGE_INSTALL_append = " python3-crypt"
>>
>> Boot the image, run python3 and you try to import sha3, it will fail, 
>> because the sha3*.so library won't be on the filesystem.
>>
>>
>> And thats because the sha3.*.so library was just introduced in this 
>> upgrade, and our manifest isn't aware it exists, hence it'll end up 
>> on python3-misc and you have just created an unnecessary dependency 
>> from python3-crypt to python3-misc (and worse, a dependency which 
>> were not even aware of, until we test it manually), which beats the 
>> whole purpose of the manifest.
>>
>> The do_package function is not gonna fail just because, so you won't 
>> see errors, but the files will be packaged incorrectly, causing 
>> runtime errors as a consequence, the create_manifest task tries to 
>> solve these runtime issues before they happen.
>
> That's something completely different. I'm not a python guy and I 
> don't get from the ChangeLog what I have to change in the manifest.
> I can and will do such stuff when doing the perl update. For python, I 
> ask for review because of things I don't know.
>
> You can give me a reasonable list of such changes and I update the 
> manifest accordingly when I rebase the patch after Ross PGO patches 
> are committed.
>
>> Cheers,
>>
>> Alejandro
>>
>>
>>>> Yes you probably need a patch to look at the correct directories 
>>>> for the h files, as well as a dependency to make the h files 
>>>> available on recipe-sysroot-native.
>>>>
>>> Please check the submission.
>>
>> I did, its not checking inside recipe-sysroot-native.
>
> I know. You could check the submission anyway and find the right patch 
> and then argue differently.
>
> Cheers
> -- 
> Jens Rehsack - rehsack@gmail.com <mailto:rehsack@gmail.com>
>

--------------0D248AA555A48112BA2FAB36
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello Jens,</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/12/2018 4:53 AM, Jens Rehsack
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8ABCF3BE-EFE8-4FE6-9886-65F6AE4E4EDC@netbsd.org">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <br class="">
      <div><br class="">
        <blockquote type="cite" class="">
          <div class="">Am 11.09.2018 um 20:56 schrieb Alejandro Enedino
            Hernandez Samaniego &lt;<a
              href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com"
              class="" moz-do-not-send="true">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div>
          <br class="Apple-interchange-newline">
          <div class="">
            <meta http-equiv="Content-Type" content="text/html;
              charset=windows-1252" class="">
            <div text="#000000" bgcolor="#FFFFFF" class="">
              <p class="">Hey Jens,</p>
            </div>
          </div>
        </blockquote>
        <div>Hey <span style="caret-color: rgb(34, 34, 34); color:
            rgb(34, 34, 34); font-family: arial, sans-serif; font-size:
            small; background-color: rgb(255, 255, 255);" class="">Alejandro,</span></div>
        <br class="">
        <blockquote type="cite" class="">
          <div class="">
            <div text="#000000" bgcolor="#FFFFFF" class="">
              <div class="moz-cite-prefix">On 09/10/2018 11:58 PM, Jens
                Rehsack wrote:<br class="">
              </div>
              <blockquote type="cite"
                cite="mid:0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org"
                class="">
                <meta http-equiv="Content-Type" content="text/html;
                  charset=windows-1252" class="">
                <br class="">
                <div class=""><br class="">
                  <blockquote type="cite" class="">
                    <div class="">Am 10.09.2018 um 23:33 schrieb
                      Alejandro Enedino Hernandez Samaniego &lt;<a
                        href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com"
                        class="" moz-do-not-send="true">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div>
                    <br class="Apple-interchange-newline">
                    <div class="">
                      <meta http-equiv="Content-Type"
                        content="text/html; charset=windows-1252"
                        class="">
                      <div text="#000000" bgcolor="#FFFFFF" class="">
                        <p class="">Hey Jens,</p>
                        <p class=""><br class="">
                        </p>
                        <p class="">As I explained before, when you
                          create a manifest for python (target), it uses
                          the native build as base (it literally runs
                          the native python that was just built), it is
                          assumed its the same version as target and
                          contains all the modules provided by upstream,
                          otherwise the missing modules cannot be
                          checked for dependencies, and the manifest
                          becomes incoherent, so its not an option to
                          have an incomplete python native build.</p>
                      </div>
                    </div>
                  </blockquote>
                  <div class="">In that case, uuid for target never gets
                    deployed, but it is. And I didn't see any packaging
                    issues for `python3` nor for `nativesdk-python3`</div>
                </div>
              </blockquote>
              <br class="">
              <br class="">
              I don't see what that has to do with anything, fixing the
              native build should not affect what gets deployed on
              target, thats exactly why we have a manifest, so they user
              can decide what to install and what not to install.<br
                class="">
            </div>
          </div>
        </blockquote>
        <div><br class="">
        </div>
        <div>The manifest isn't used for python3-native.</div>
        <div>You try to argue whether there is an error to be fixed -
          and I don't agree.</div>
        <div>Each fix requires effort - and that's why some errors will
          never become fixed. When the impact is reasonable or high
          enough, fixes are more likely.</div>
        <div><br class="">
        </div>
        <div>So: before you try to force me into "that's all ugly und
          must be seriously beautified just because ..." I will not do
          anything.</div>
        <div>When you give me a sane reason, I try to understand and
          make a decision.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>Ok first of all, I am not forcing you to do anything, and I've
      never said its all ugly, so please don't reply aggressively since
      I am just trying to help you get your patch merged, and it needs
      to work correctly for that to happen, this is a community and if
      you don't want to do something just don't do it, we're all trying
      to make this work in the best possible way, whether we get paid
      for it or do it for fun.<br>
    </p>
    <p>Second of all, I know the manifest is not used for
      python3-native, I never said python3-native used the manifest, but
      I am trying to explain to you why the fix is necessary, and I am
      even telling you what the fix is, so you don't have to waste your
      time and effort on that, here it goes once again:</p>
    <p><br>
    </p>
    <p>There are python3-native and python3 packages.</p>
    <p>The python3 package uses a manifest file, to go through the
      installed files by the whole python installation from upstream,
      and separates it in several packages, providing more granularity
      and giving users the possibility of installing a trimmed version
      of python, only with what they require on their image.</p>
    <p>I think we're good until here.</p>
    <p>The problem here comes because we don't control upstream python
      and it changes with every release, so new files show up, for
      example what I mentioned before sha3.*.so.</p>
    <p>Since that file is not on the manifest, during packaging, it will
      end up on python3-misc, which contains basically everything that
      doesn't belong anywhere else, although clearly this file in
      specific should belong in python3-crypt.</p>
    <p>What this means for the user, is that he/she will install
      python3-crypt and expect it to work at runtime, but this wont
      happen, and when sha3 gets imported (or something that depends on
      it to run), it will fail,  this will cause a bug on our system,
      which we would need to fix (yes, fixing bugs takes effort and
      time).<br>
    </p>
    <p>At this point an usual fix would be to just install python3-misc
      as well, because it contains the required library, but
      python3-misc also contains other unnecessary stuff that the user
      doesn't need, but anyways an RDEPENDS to python3-misc would
      somewhat solve it. The correct fix however, is to add the
      sha3.*.so file to the manifest, on the python3-crypt package, that
      way, it will get installed and the user would be able to use it
      correctly. This would solve one problem, but its still not enough,
      because, I can see (from the log), that there are some
      dependencies from other packages to sha3, which means that yes, it
      will work correctly if we decide to install python3-crypt, but if
      we just install one of the other packages that need it, it won't, 
      again, it will fail to import it and its the same story, its
      introducing a bug into the system.</p>
    <p>OK, up to this point I've explained how this will cause bugs in
      our system, now, what does this fix that I mentioned has to do
      with everything?. <br>
    </p>
    <p>There is a special task for the python3 package (not native),
      that creates a manifest for us, this task tries to import every
      module from the manifest and get its dependencies, for example, if
      the python3-numbers package needed the sha3 library (this is just
      an example I really don't know if numbers needs this), this will
      be picked up, and the python3-numbers package will RDEPEND on
      python3-crypt, hence solving both the bugs I mentioned before,
      even before they exist.</p>
    <p>Now why is a fix to python3-native important for python3 target?</p>
    <p>Because of the way the previously mentioned script works, it
      calls python3-native (it has to, because it can't use python from
      host for example, because its not guaranteed its the same version
      of python3 target, and we need it to contain exactly the same
      files) to import all modules in an automated manner and get their
      dependencies, that's how we know if there are new files and/or
      rdependencies between python3 packages.</p>
    <p>So what will happen if the python3-native build isn't complete?,
      whatever file its missing, we wont be able to catch dependencies
      to it, causing them to end up in python3-misc, causing the issue
      #1, and also, in any case, there wont be an RDEPENDS created to
      python3-misc (which would solve issue #1), sometimes files do
      belong in python3-misc, but we need to know that so we can add an
      RDEPENDS to it, but again if we just add an RDEPENDS to
      python3-misc we'll be causing issue/bug #2, which we won't catch,
      until someone actually tries to run something on a running image
      and gets an import failure on their application.</p>
    <p><br>
    </p>
    <p>I'm not even asking you to fix the manifest, I am simply asking
      you to provide a functional native package (in this case,
      functional means with all modules built), so it doesn't break the
      current functionality that helps us catch these bugs. I hope its
      clear now that I am not asking you to just change something
      because I want "beautiful" code everywhere and I never was, I am
      asking you to do it because your patch will introduce bugs into
      the system, and I am trying to help you fix them.</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:8ABCF3BE-EFE8-4FE6-9886-65F6AE4E4EDC@netbsd.org">
      <div><br class="">
        <blockquote type="cite" class="">
          <div class="">
            <div text="#000000" bgcolor="#FFFFFF" class=""> I know you
              didn't see any packaging issues, but that doesn't mean
              they don't exist, just from the log I showed you, I can
              tell you that the python3-crypt package is not created
              correctly, for example, if you do:<br class="">
              <br class="">
              IMAGE_INSTALL_append = " python3-crypt"<br class="">
              <br class="">
              Boot the image, run python3 and you try to import sha3, it
              will fail, because the sha3*.so library won't be on the
              filesystem.<br class="">
              <br class="">
              <br class="">
              And thats because the sha3.*.so library was just
              introduced in this upgrade, and our manifest isn't aware
              it exists, hence it'll end up on python3-misc and you have
              just created an unnecessary dependency from python3-crypt
              to python3-misc (and worse, a dependency which were not
              even aware of, until we test it manually), which beats the
              whole purpose of the manifest.<br class="">
              <br class="">
              The do_package function is not gonna fail just because, so
              you won't see errors, but the files will be packaged
              incorrectly, causing runtime errors as a consequence, the
              create_manifest task tries to solve these runtime issues
              before they happen.<br class="">
            </div>
          </div>
        </blockquote>
        <div><br class="">
        </div>
        <div>That's something completely different. I'm not a python guy
          and I don't get from the ChangeLog what I have to change in
          the manifest.</div>
        <div>I can and will do such stuff when doing the perl update.
          For python, I ask for review because of things I don't know.</div>
        <div><br class="">
        </div>
        <div>You can give me a reasonable list of such changes and I
          update the manifest accordingly when I rebase the patch after
          Ross PGO patches are committed.</div>
        <br class="">
        <blockquote type="cite" class="">
          <div class="">
            <div text="#000000" bgcolor="#FFFFFF" class=""> Cheers,<br
                class="">
              <br class="">
              Alejandro<br class="">
              <br class="">
              <br class="">
              <blockquote type="cite"
                cite="mid:0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org"
                class="">
                <div class="">
                  <blockquote type="cite" class="">
                    <div class="">
                      <div text="#000000" bgcolor="#FFFFFF" class="">
                        <p class="">Yes you probably need a patch to
                          look at the correct directories for the h
                          files, as well as a dependency to make the h
                          files available on recipe-sysroot-native.</p>
                      </div>
                    </div>
                  </blockquote>
                  Please check the submission.</div>
              </blockquote>
              <br class="">
              I did, its not checking inside recipe-sysroot-native.<br
                class="">
            </div>
          </div>
        </blockquote>
        <div><br class="">
        </div>
        <div>I know. You could check the submission anyway and find the
          right patch and then argue differently.</div>
      </div>
      <div class=""><br class="">
      </div>
      Cheers<br class="">
      <div class="">
        <div style="color: rgb(0, 0, 0); letter-spacing: normal;
          orphans: auto; text-align: start; text-indent: 0px;
          text-transform: none; white-space: normal; widows: auto;
          word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap:
          break-word; -webkit-nbsp-mode: space; -webkit-line-break:
          after-white-space;" class="">
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
    </blockquote>
  </body>
</html>

--------------0D248AA555A48112BA2FAB36--
