Return-Path: <alejandr@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0053.outbound.protection.outlook.com [104.47.40.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3F779076
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 18:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wiRjIiWbsYEDcVC9WBH6gpRdZ5Seri7xDAVEVJxD6CE=;
	b=DUhj7jk9tqG7m4AU44nr0a/qks91YrF1A9e+cXVgcWfB5RbNhQ7BvFJe26yoHlBmYcb243qNJ9ZYnj9kEspdRx3dug9vCVZo9z6GBd+v4fMm0LHgRLhUgReKi3tXk5zkPGBwAm9NCdAgfxjvpZbosB1YfRFy30rEtiRQy84/C1w=
Received: from BYAPR02CA0057.namprd02.prod.outlook.com (2603:10b6:a03:54::34)
	by BYAPR02MB4455.namprd02.prod.outlook.com (2603:10b6:a03:57::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.25;
	Tue, 14 Aug 2018 18:21:43 +0000
Received: from CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by BYAPR02CA0057.outlook.office365.com
	(2603:10b6:a03:54::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.21 via
	Frontend Transport; Tue, 14 Aug 2018 18:21:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT039.mail.protection.outlook.com (10.152.75.140) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 18:21:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fpdws-00053Q-S1 for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2018 11:21:42 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fpdwn-0007JC-O8 for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2018 11:21:37 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1fpdwn-0007J9-AJ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2018 11:21:37 -0700
To: <openembedded-core@lists.openembedded.org>
References: <SC1P152MB138947050EB80F8E776671CB94390@SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM>
	<CANNYZj9kfU8RQiVFE9eL79KLqJ280gf3SOKsmTAYyOFd3NgwvA@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <73e7f309-7910-a680-0476-0e28bf84e43d@xilinx.com>
Date: Tue, 14 Aug 2018 11:21:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9kfU8RQiVFE9eL79KLqJ280gf3SOKsmTAYyOFd3NgwvA@mail.gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(438002)(199004)(189003)(31696002)(8676002)(64126003)(50466002)(11346002)(106002)(446003)(230700001)(65806001)(65956001)(2906002)(478600001)(305945005)(26005)(426003)(336012)(45080400002)(36756003)(486006)(126002)(81166006)(81156014)(966005)(356003)(316002)(58126008)(476003)(2616005)(8936002)(186003)(77096007)(9786002)(2351001)(6246003)(53546011)(2486003)(1720100001)(106466001)(76176011)(67846002)(47776003)(31686004)(229853002)(5660300001)(6916009)(6306002)(65826007)(23676004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4455; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT039;
	1:dQvDk2gjbFg19uSvOMmdGNbbuPzpr3hc/9u21l6oJrxA3MdR8NpzdUp7wFK5EpsViwAK36kjoyFMG871UyoSLSckUrd0sSCo15qIJGG/ezOjBCoza4z6gb7uX6507qT4
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2fd9d3-65c7-4fd6-bf1e-08d60212c989
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4455; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	3:cVelnTkh9IVLl1wpMMyKsHwLDfd2TBi6oSOkUAWALkFtYLJpAOJ7MQSvH9w3AKW3LQ7H1V1CDGCFEA671730sXjYwu/67KrVwcL2kLltO3DY9F6LijNiPLjcSXG9lbOUugtzFiFE0In/pKFgj9rQrmeu/PMYxFgUFBvQm34/oGkUNxvSub+gWtWU5PjmxPOhTBoufTvwNtZuoN/apsdJpdPzR9rvzqmpdeEogfbr2aw6aw3d1n8mxuMiLDEor5Y0E8STDTdkkL9JQoolpblL/uMRnsj7ZBwJyU4m/doNMJOl9xabpQ+my+KLk8T5nOXN44F4XNg4I98mrDyDDVPTjOYU9TRoFto7kF3c21ifvZM=;
	25:yojRoDDuKsJLSyyhXeKuejW3ejIQU6l0pSF8L7tqJXmF7hSyjsGggBKsycQeOuA1kAZATbCcP9jURpJLXiURpiZYX8Z89CdayOILUVcYNsn+omZkjsfcPtF7rSNcsl6BLBPtKVDTEuPfDIMQRXjunp6GywiACi+iqxg2LPMHwtMSnGRqJ3mq63wRX8t/qkQfx84gl65a6Eb52kjD6r132Tg+WhOdTVoqbOybzOTBCZoOgwfqXP2aM4O7RVjFWmVbDHyP1gSSFlyO/a2ZW4Ez9uTeREIsI3aBpBAp9MzWXY/Pl98mZ8jvBhpG9lSD3qaofIYqT0nqzr17378vJSAcPA==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4455:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	31:8+8ztq9csNuMBB9VXuybhtNCsLfwgJmdd/0Ht5nIi1h1hriauQUMH/rdOa1rXWfY+aGAfdzpTYj2z+vCMYvO7s1UlfE44BzlKZBhRtgktnESS2Ru4RZQCnD0Mo0T+fNOP2WPiJOQ1oGvP61j+qxLcOO0P8eFzlprb2llwmoHalpbuKU7HSQs9cstdYLIVNlxQ5z0cChyqWL8bm+qpE1OCPqfE388uN9Tj2wQSd9Od+U=;
	20:/6ByknGaLgXVXsgI64YkjlPPf5HpQMuhJe1npRqAEaLUKIQiU+qbb6GtZdNiMIvp8OE4XLfXC9RbasRbZuQyVzlMqhkJdVrjKR/LuSoIwEhteHBAz515txKvppzg3jOKGelZFwRJqnDAA76JwkhOcQF8UNgcXdK65l2X/1UxLND1p4QjG1nInDo2d5bzkkmqxqQVBW61kquKZAyJKzobe8U0cWKrrRG2ILl1Fv1zshMojBrNfmvIJnvDMdt1FahQAuciy8tM+eL7x8YRHHpp1icwAvPtcEH/BhTL3mEF7elxrfXMPMXyLClGOSdpVKqrQJTl/74gdw6g2A2CvvcAXXFMTOschEPd/TfXRdn1Ho95sgxNWfHhs73GLJFLs99b66ck833d1yAQiUdYNeBIGiooIb8Fis5r3KTJ7nrIxuBQf/kf9kdmE4aKNNDhTE7C6RMyBmQ1yZcb5QO36EAiAMmkuzpnDH0NPQnuYSYUQ0+mGyZZZB3IlWxUpfd+P6+a
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB445526E2FF66CD2D989FB709AC380@BYAPR02MB4455.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(130873036417446)(194151415913766); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB4455; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4455; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	4:DFOKAjJANybIDZuTH9vDrD08KOgHvJExURho3iz4Iz/ie45WX6dw9aGXBSNCH0VeG0Ix+1XRfZCs0vcmRolveWqyBWkFGSEwp+L50HCTdR9CVZSIl5JyGAU9VP1kBCCQryOBn4Qtgx7YIBft5MdONkDnKweyINC3Fc39gBSi2PmIS+SVUTiR8Z0Blr1TiOwkFalacL2NOEIlY9AQZUH5/8bl0CywUQMWpxK8SSVmMaif5Kt1PJjoFCnu2iJFvmeBlPU1pmmJvc93MbMbEzTPKP1jNx+N92pSYzCNfWDRRcb2bGZVBctpN0oc2K9St/aq3KtNtakDUy5OB/637E7qMR/8hjb3XCzvLgmuZC8rRa+s1eCUhGSSd3jmC3pfutA+
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWUFQUjAyTUI0NDU1OzIzOmhPWkxIZ2J6RUpnbGJYaXVNYTUvM0RFdVpH?=
	=?utf-8?B?V2pERTFnSnQwNFRRdm5EV2lJM3d0WmlyZGFBTTJKUWhxMGt1d1l2RXN3MFlr?=
	=?utf-8?B?UnZ5TFJvNjZSb2lMVjFrODZqUTdGRS95bEdyU2RjQU41RHFXKzRvL2Jka0Uz?=
	=?utf-8?B?VWFLd0VoZXFHL1ppQ1Z1R1JQSndZRkZjWTE0QytlQWFla3kxNlE2SWF2Q0RN?=
	=?utf-8?B?QWtLQkZ1Rk1mUlMxRWN4WEQvekEwZzZtSlhrWXV1V3NOZTRBNERMM1YyeE9w?=
	=?utf-8?B?RG5nZTg1dEkveFNRa2V2R2x3Z2xiYXZEWVlhQyttRGR1RmtRckFGc0szdmov?=
	=?utf-8?B?d29xWXhhbVVKTTJaSUtCVHFpYWtrcWpZbFlWczJoMWtaR05jVkNpcXNsOUE1?=
	=?utf-8?B?SDRQekRrbEF2N3FtdFgySnFNT0F0Vm5lcWRYNkJWY1FWczZpZjE5M3RGVTVl?=
	=?utf-8?B?ZGxGM0NtMXZ4U0JTekYyaUljUFVWV2g2b2V5a0IzZS9iRU1VbXpWUGgvYW5x?=
	=?utf-8?B?NWxmMnhSQjJvZzcrRkwvaUFMclF0ajYvNFBwREptbzY3aFgra0F3STdFZXZS?=
	=?utf-8?B?YWNQeTRDRllMMWtyWEE1d2djWWVPd0NUVHIweTZ5MkZUNHBlVEVQTlZ1N2Rr?=
	=?utf-8?B?MVJrY3FKM3R6U3VRdWZRQjgrdmtEbG00ODRBTUd3OEdVMUk5cHVvam8wRXhQ?=
	=?utf-8?B?M3BmYmhQbXFtZDlPRU5UeURhOVVyajdjSVdxc0hrZXcrRTZvdEZrK1FLcEtv?=
	=?utf-8?B?SnVBZGVTUFkvWFg3N1lsVEt2TnNLb0xqM2dMTGRPeldZV1V3V0lsS0pZcU9x?=
	=?utf-8?B?RXRxdnlLbDRCL0lYOTNWaWl3MkMvZmFxV2RKVnU5ODBVQjc0Zk9wRHY5MWJo?=
	=?utf-8?B?dnh5ZTdtRW03Rlk2ZjJ5eFZxVlg3VWV2SXNSL1ArdWpnL0lMTU8vMTVBMGl4?=
	=?utf-8?B?RzlQMURvZHVUdy9WQnV4R1hISE5NSk5KK21JdGI4M2dVaGlkSC9DY0hESEZt?=
	=?utf-8?B?Z0xhcStWTWFtZ2lBWHJhL0NiYzRyelhJNEN2S2ttbkNyVDhxRmZWa0dhWUYv?=
	=?utf-8?B?aHlhbVFJWjJjbXpoSW5oZjVKTEM3VmY5blNEQnNEdDV3amVQenJQem14Nk9K?=
	=?utf-8?B?dWtzbnhFMnlMdDcybXZLUXNGOTI5SmNzLzdydEN6VHRsU3JMU2R4SzhYR2Zy?=
	=?utf-8?B?WTFJT05FZjl1Wm1Tb3psZlZRUXJXSEk2a1VYbjUvNkZrQ1dlQXoyWlQ4ajBF?=
	=?utf-8?B?RW9xd1FlUmxuRm9oeEtBZHVSNFZEUUFuNmtyVUZvVmx5eXM4dUxsdHl0SVRn?=
	=?utf-8?B?Mm4waFpDc2FIdWhEMnozL3ZSUWJRb2hHc3p5MFBxTWhlbjRRWlR0UWw2WG9R?=
	=?utf-8?B?b1pzZ0Nqclhwcy9NTkdJM2VJdGxYejh3V1RGL0lVa2h4ZThaM1ZQYW9BOSts?=
	=?utf-8?B?UTd3bHJxdlJYT05yR1RVVGFsS1hzNkFkMDlaZEthamwrbmhuMFF5N1pUTXl0?=
	=?utf-8?B?MjNqQ2N3ZUFiNG91eUU0a1pvZ0s1R0JKSG1zN09LQnk4dGJZS01uLzdsdGVK?=
	=?utf-8?B?YjJjU2pJNWkrL2xhcHYwSnhJUC8wYTR2VmRHZFBBam9vWHdMYnVUTDBOTmtx?=
	=?utf-8?B?Y1E2OXRrc0tsMnlUaU0zY3VPSmFkckh6Q1o0SmRCWUowVU5jbC96YU9URjlL?=
	=?utf-8?Q?cCiVfNelmMb3CrS7owb2ZLSZD+Orge9YHb7VR32?=
X-Microsoft-Antispam-Message-Info: yQClB+IlxxTF/rFdvPoDY3f/ivsKUWl9a92synaZY2BfOtYgQmv4vYGnzYyQGcHFsYo7JAsPuRuZVeVhEN6YmJo7+aVCh5u02UoOAV8fTZQay3hXioCugzPKgv1ztJuVcnxGu8Ewz2+WEpzQzKB6UWoCDcczZhPCY/+MLkbk0Oosr7lft1owiUab5LLTii07OJ+igcaff+OBRkb+XpQXxFp4R55fQE7WBWSZao8PlzJfA3CKvf7pAv6Wgw+z4caxwHHF8UVDg7ZxwNiWm6Dieswn9FnrQWvqBaDX93bjWXAABBbDy6aAWslskIIVSDi5vL1BaIQbE0910mXhILuBERubdRZDx0nmVCyuWlB9f8k=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	6:Mqj7SYtPZfH+Srer7eHsfOgO4MG38lKRU7PK2i7c9J43+3N7Sg9ugfzxjb1zIGvnd4AK1FAicEtu4OVpREacRIVGGsugZUaacMaNw4+c/bFDG+fINAKGHV2aMhLq0C8AX9A7UflwUsKP8rhe72FyuiPG+QICM2VebfCY2+xlkYMK5ZeTZJtQ5VXb0X9uCmmVnZwTwaII9rio3nSmyY0oQDAY0BScLx3o1Dg2WAikrNJBbXns8cEtqkbAOSK8pyY2M9CIQRTDAQQRKMS5okbTecstWP3CW1QhrRSGNevfk8Ahwn4mi97ENgtEVI1Iw20LhC6QJD++y/PHv/C7y1ouRNLxtDGi0fAbUMDhHOelPvxUufPs4zFMrHknYJ8+ZcYFa+/D6Db5Ta7sYCKUNsQE8V04R3iKKtFpB88xx1sqoVbtpCm9T872plCmTsM6zK03rICB80EpnhubTbqu2aj5FQ==;
	5:hKqtZIc2lg17WhvVmQcdtPjZxlbRrbLdET97pqYQqTBz99rvvvJ9uYPohBQ5CG+ZaU+UnmXnW80DqDp0vVbUKwLlugVoj3YuUumAElXalIFKTmy6fJCCcA/zAOVyu9Yvgql6llDWV3eHpfgBm2IUMPnt8HLh4FyKbQf6ar/ww8A=;
	7:qDpyp9Gfe8OcCj1jLbY8Mr0kX1ew8gxD7i3Q2kd+AP2Z0Rc3GkCJobztJBF9IuRq46oZRIVN3bnOGuvYu2SM42ngSYoS5zsJX2rvUQD14Rx1bh6mp3PsgDGOl8o66iXq9XsWEZur9FOt7rH5qIxXtPB78vPp7GUoI3QrK2U8GEOAo7gyl/iQ0TNK5PTLqNFNiCqwR/a4purxyYO/7qo/5rzejmE+sE02n/HTuoM8lONWmNnaxYe7Ztmk1SMJ5ulB
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 18:21:43.2012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2fd9d3-65c7-4fd6-bf1e-08d60212c989
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4455
Subject: Re: adding python modules
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
X-List-Received-Date: Tue, 14 Aug 2018 18:21:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Bhaskar, Alex


On 08/14/2018 01:18 AM, Alexander Kanavin wrote:
> Simple - add python3-modules to the packagegroup. Sadly this seems to
> be 'common knowledge' that is poorly documented.
>
> Alex
I'm pretty sure that the python3-modules package is included by default 
when python is installed (on master)
if you wont be using master then yes, install python3-modules
>
> 2018-08-14 0:51 GMT+02:00 bhas_purk <bhas_purk@hotmail.com>:
>> Hello,
>> I am new to yocto, and we are using this for an Intel SOC.
>> I am creating a console-image, and wanted to get python3 in the rootfs.
>>
>> So I added python3 in the recipe file -
>> layers/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
>> This gave me python3 in the rootfs and I can run ptyhon3. So that is great!
>>
>>
>> Now I would like to add some modules to python such that they are built in,
>> and I dont have to do a pip install for the modules.
>>
>> I see that there is a script file which generates the manifest for all
>> modules will be there.
>> openembedded-core/scripts/contrib/python/generate-manifest-3.5.py
>>
>>
>> I would like to edit this file to some python modules, and am wondering how.
>>
>> For example, one of the existing modules in the script is defined like this-
>>    m.addPackage( "${PN}-argparse", "Python command line argument parser",
>> "${PN}-core ${PN}-codecs ${PN}-textutils",
>>      "argparse.*" )
The generate-manifest-3.5 script is no longer used (again, on master),
there is a new one called create-manifest where you can add more granularity
to the python build, but in this case I don't believe you need it.

Alejandro
>>
>>
>> So my question is, for the modules I would like to add, how do I know the
>> dependencies etc? And more importantly, is this the right way to add modules
>> to python3 in the rootfs.
>>
>>
>> Thank you
>> Bhaskar
>>
>>
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


