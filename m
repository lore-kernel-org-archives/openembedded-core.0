Return-Path: <alejandr@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0043.outbound.protection.outlook.com [104.47.38.43])
	by mail.openembedded.org (Postfix) with ESMTP id B71D560102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eQYbAXythd4xVv4P8q+EsLbqYco2ywPHHAm38qpPm9o=;
	b=21rwTDcWzZv1zD9XoPY7R8ZA6s00sMpY/iME0FGEA6OLstf1VHCfNKXMKh+W/e0nazdfBZqN94xr8EWbmEfZSUj3gUFRRXRl0ThMkDNEU65Y3/H/I8HMCLUJzOqOuGcIahV1vm+JrqwaQ9XHrnKNJhwM+mRHWLpSV7pt3WJeRlo=
Received: from SN4PR0201CA0056.namprd02.prod.outlook.com
	(2603:10b6:803:20::18) by BYAPR02MB5109.namprd02.prod.outlook.com
	(2603:10b6:a03:70::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1143.15;
	Tue, 25 Sep 2018 15:07:32 +0000
Received: from BL2NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by SN4PR0201CA0056.outlook.office365.com
	(2603:10b6:803:20::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1164.22 via
	Frontend Transport; Tue, 25 Sep 2018 15:07:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT023.mail.protection.outlook.com (10.152.77.72) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1185.13
	via Frontend Transport; Tue, 25 Sep 2018 15:07:30 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g4ovx-00018R-UR; Tue, 25 Sep 2018 08:07:29 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g4ovs-0007zD-Qq; Tue, 25 Sep 2018 08:07:24 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8PF7ODv004754; Tue, 25 Sep 2018 08:07:24 -0700
Received: from [10.23.116.65] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g4ovr-0007zA-VN; Tue, 25 Sep 2018 08:07:24 -0700
To: <openembedded-core@lists.openembedded.org>, Jeroen Hofstee
	<jhofstee@victronenergy.com>
References: <1b958e43-01e8-c958-7c5e-1f5f3aca227e@victronenergy.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <b34c562c-b738-4817-8241-f2b02d00827c@xilinx.com>
Date: Tue, 25 Sep 2018 08:08:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1b958e43-01e8-c958-7c5e-1f5f3aca227e@victronenergy.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(438002)(199004)(189003)(106002)(31686004)(8676002)(9786002)(58126008)(64126003)(110136005)(8936002)(6246003)(81156014)(81166006)(63266004)(316002)(6666003)(5660300001)(126002)(65826007)(336012)(446003)(34290500001)(31696002)(478600001)(486006)(106466001)(50466002)(476003)(426003)(2616005)(11346002)(966005)(76176011)(3260700006)(356003)(23676004)(2486003)(53546011)(305945005)(186003)(77096007)(230700001)(67846002)(36756003)(229853002)(65956001)(65806001)(47776003)(26005)(6306002)(2906002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5109; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT023;
	1:4LjR9/NztBgudOeoWFSTqMAiiJvp0RAzoS1wSBwsW5zJwOIvJAEL2U5C6agaKd1tpS0AfkwvOFIgsVeFQPmsnWpXkfH88Rw1ysloqhW/0uiwZsXF5A9bkjuw5pKKbq0Z
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1321bf65-a74b-4cff-d979-08d622f89df8
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB5109; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5109;
	3:mH+vtMAslbo4F/gYYU/+y8G78rfwL/XiYxqJNtohUlASrOdBeWQsG+grvOfGZFFXTjBnc30i3COQ11CbqM1702HVtxa+0X9nact6B6WeFY9xMcA+w6YBe03v/ITtA6MWvXsLMTxS3Od+wakFAx50tXZ1kYCCN6lR+LkF/eCBjMN5ycQursiYKbx0HX3CC4+t2rJvhUPqJdLutx+UqIDJFXANBPm/ORnqbKNvRr9CIx8jlipHKyeq6jBxNoHud+RaWdZnfnUjTcueiEUnbjVk1lpvsUKPLXpCfqZLZOPmE34PCEedyEcHw+yUEVows0S4tbpwaRTWlQUqQKFqj0R7igNIB5sgNMEvQTounoyxEgE=;
	25:o7fewmW7Gt1uieelzShLsbU8+ZMAcBBLNEWLLJ9h7x9xDpajdwsggZxJc7kS8oMUsnYKtlXZY/RiHB24Tixtg1dBlsvl4nxs31KSTinMMKAK7O262UMNSVRKQcRvdV4ibjZD/tGe34lLEknASBK/7Pfr+oQXwtuVXh/q+hmhS/DNgihi0QM30mZVpW/McAD2h+oWe9SYwEJuftNQFDc9tNtRKIZGM7KXQhJr/DFhNhN0NXG1Kc6FFW45zdZW9wRWG2DZ2HEhsv5cyJYqfwkHknZp1cYJtQ2wYtgCq3CbQsM6ez0xGZqxYTR3DBfHZVOgq4YL3whPt0aAhy5Jc+Yeuw==
X-MS-TrafficTypeDiagnostic: BYAPR02MB5109:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5109;
	31:0JWyDhADcQhWHUDtvKNvPESHR70XsGXtXwRMvV8k7JE8k70B1pER7obNS6/qyvaQTy81GEiSpmggfdRGZeQO8mEt0Dt0KGILbyFYtT0+S2YtZ0zChNBGPXQX4VVdX7Qw3Tk3D43e4vkERqCQmvrzp02odyn1V9E7qeEcqPTaB6VP/YkEn69YvuHdvxc3SFqiJFXA2hs0b258LzkSJEMT76qX2boM8Py7Vb9/GKF9+wc=;
	20:nxhsL2cuxGx3RHTGr6O4hxVlh9M9shMwuQqBKVuWkLwCSVONc6Nq0MOnGxfqXAkdiXlvMZvAp0DPrkdT4mfE4FtfpJBpZNENM3gV0k1qkwZVhSA96f5+4YoCAC0zkpvUYbHvME9SobSKEVSjuaX5dwle2gVeSomNY3TCLBwKbS8AF5NZldUMNT/0KS10hddVfOAL5VmbS23e2dpWMcgPN2dtMuEZfje6XZmQQSJygsaTHJaz7r1l4IJpzQjMhHk6A7d56sMkIG78rbaQQM2YoDOl9HT3/ySk035olKOMOzyXttstqOO6V8VxBlj3qAaHvfLFYU4hLV1Gm4rk8hXbztSO/KhuogyVJpMPC6zFFBG4qEMD5qmKk/UmI/ys0tyohbHBddpIVlOVK3MCz+pWbQPWEGkHUWVtLZX9htTcJBulHIPnjMwuJvYbtP4OgJQtmSUm3BTm6PsSWYIpNaTP22zCDdCyfzgfUluDWiK0oFwieJXTv6ZfsYgQ0x1YSnbj
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB5109F29F4E25DB9C2469CCB9AC160@BYAPR02MB5109.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93004095)(6055026)(149066)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
	SRVR:BYAPR02MB5109; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB5109; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5109;
	4:qKHvhOmFSjwShsGV5hn6ygzY/AicDJ5gOYPvMNdUVsBl3hvBnZe9mnsAiIaPEZQhttX9xc1+I6qwBRoIBbKcIgcNvXUiJ6MrbbMYu3tV/5rBtyJV88GXFWhJfiHCbit1DcCJaRoqKKSASXDQ9y9Kp3vfDEBoqb34UydllntKQSDX1sPAy0ngD7+Gd83xxpwh/yjds7EisR3JeFATIpu3REgtBWpTN19Dr2cWem3dkHoTlD/ZPz95fYdMjusdFHmniIaWiD5PmFJQSoWqHUg/HA==
X-Forefront-PRVS: 08062C429B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWUFQUjAyTUI1MTA5OzIzOjFvd2V5SDVXbUxkb09GRzFRblJDNjQrdlN6?=
	=?utf-8?B?M2ZSWkI0Qkp6MnJPMW53NUl3a0FJVUdIYjJ3aTdmcVExZDdQaEFMQWVoSjhn?=
	=?utf-8?B?d3d6bG9PVUlnRDRSWnBVQ2o5N2FTb2t2K0dGTW9adGlCZm5HakpndDRJUEor?=
	=?utf-8?B?VnlLY2M3L2tmQWFzSGJWMjhabjBLWUo2elV5dC9MNmhqa3ZQSWp5VDRES1hI?=
	=?utf-8?B?d2J6R05KTTN3Y2VXU2dFSTgzbW13T3p1djRPUEt6SnVlUzdEd0lKUlNQOEFu?=
	=?utf-8?B?ekp6bEcweHFxOTBCZ3RSMDlYdHErU3c1SHdUZWVJaEQ1cFB1ajhHTEYvK1g2?=
	=?utf-8?B?RWxwZy9mYWpicENKa2UzQXYrY0xsd1FObWF0emFrMk92MTI5NXlYcjJuYVNz?=
	=?utf-8?B?VnV2aDNlUEZrMmlrOXM5QUQ5cVh3WVNSbndRalMzT3AxalEwdi9FRDZIeHpM?=
	=?utf-8?B?VmtvTDNGUzNKZDkxLytJWjYwZm9EWER4VVRwZUZMeWtFT3YzZGwvSlFCZDFP?=
	=?utf-8?B?a0QxM0dFY2JXbDJ0OUdXL0pXV0M4S203cXJIa3pJdVprc0oxVERwQzVpbGNC?=
	=?utf-8?B?cGRuenE1RnhDZFVmdWlqeGVUMmlRR2diYkh2bnpMUmYzR0M2US9EMzJXTDJO?=
	=?utf-8?B?QzVTVXplT0dSTVJhYkc5ek1QM3d3U0JuMkxWalFEUWFBTE5sL2VsUkpxSERU?=
	=?utf-8?B?WnozUzkwaWp4NU9sc1FaUFp2TDM0cUVKS0U1eFVUNS8vdWtzRGJpZVVIMHJZ?=
	=?utf-8?B?Vjhxa05ZQ1IrOXY3b0x6WVNqSVVUNGZyZ1pZSWZJeTFWaUVjcFhBVDFkMEhh?=
	=?utf-8?B?Z0xmd0FRK28wTGUvcERKNXl0ZGd6dmNlNWh6ZzByM0tQcUVPdlZNYVR5Q1Rw?=
	=?utf-8?B?SERVY1RMZHo0Mk02ei9QSjBpOWZpbGlBNUJ6U2VnQWEveUNJSmUxUWRwZGxi?=
	=?utf-8?B?bmJ0RXpKbXhleThRUTl1aEc1UUtvWW9NYkNaZ1ZsWktyMTNoMVhoaXJNaFpW?=
	=?utf-8?B?Z0ZTZjIvRkQweGgrbis2NVVFQUtKMHc1VVIwNkg0YTZES3lURFJTWDhROHNS?=
	=?utf-8?B?QkZsUW53WTdpMk9ndXBVMlc4MUFPL3R1MTJrdzAzWWFrYWhUQWs4SU1IeTEy?=
	=?utf-8?B?YVkxeitsek1iK3BlZUZhR0x5cS9GUFVYdE1YMjZOWFROY2RpWUhXMGltM21s?=
	=?utf-8?B?WHhNSHU2SSsyNW9Vc0xmTVU1cVNjOS9lcmJHUm1ud0FVa2xrYTZDT3R6Zmth?=
	=?utf-8?B?d1E3MGZwazVEczI0cU9hR051dVo0ZWdtNUszM1R2WlZjY0taTjJqMmphN1Nw?=
	=?utf-8?B?b2t0NGlTNjh3OE94cXNCNWRVaDRyZSsxSjhVa1l3eWpSK0VrME9mU1dWazUz?=
	=?utf-8?B?bnEzQ1ROcWFnMEU2Tk1INkdiZFd6NWQ1S2dLMUVuN2JlK054U0JWVEhaZ2Rx?=
	=?utf-8?B?SVhBSUVoZjhnTUNBS1JtdXVteWZOOE12WDRJTmg2RDRuMklTaWdwZDI3WERo?=
	=?utf-8?B?Y1AvZVAyc3hRYXBsWVZJdnVBZXNmc2M5YkpkTzV3WitGUHFSVEhyWDYrQ1ZG?=
	=?utf-8?B?cnNSU3BEVWs0R05jek1Vc3B4eDN1bXJmYWQzckhBVTNyWjVNSGhIZDZ0ZEQw?=
	=?utf-8?B?UVRRSjRCYmoyZGpnOXJVUEUyOXUwSTRCYnlQNHFzWGJzVmFQd1BxTEFTYTNu?=
	=?utf-8?B?Q2lpTHBkWGJwZHVXZmgvQ2FOWTVVMStyc3orYlh4Y1NnVUZHSmJFWHJaN2o3?=
	=?utf-8?B?bEhIdktyZ3NNZFZSbVczZz09?=
X-Microsoft-Antispam-Message-Info: p3+4iqfnXa9RN8b1r481nrXfamAGtI5rkm7Ogp2CHo/zHPMnghaJbnZ1uDwDLy9uEWyHY22v/EVHv9VtRQTUHZzL4SXXT19eAY/M6Kf41pZcLdQ01HKktqIwkPmO8xwBS5p7plNqqiKJW940b6cvZlG4CCUxiI7xDick/47Q1a1XoAFxknBT64Xgg1GXCTN1fT0O1syG0Xl3gfBtFjvNdBomUEtVGUN6B6r/T/oDZecmyS6A77+TRcc68SvE15JZqjIrEoF04grsCgCEo4u2M0dFPw4tdWqQpUc9eX0uFQlALmBhmo3pnYuydb8D6SyzE5khAA160O4a7rpBmhvY/fpd4hYloAYLf7WV1U8N49k=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5109;
	6:SEzoelpkpbW2j50N2Z9C8UfMmD543tOio33ECIEE9y0vEIX5NsSpktSZd6hHFNIO+r6//QGswGdGnmlu8zs8sMYaa65PIWaoIunjnV/FXrYFdFvppFsmKPAZS43G9+GFtLg1TFoLFd1WmtO+EJCDaxVRPaWX4iY4vcGzVdLigdQpfCsJPo13mp/hKJkH0q0hXNB9rbE5i4z8wiK1vW5i0R4O746k2q8gT8s6b8rOMP81VC2qm1FRqnx+smPCyHvxomVGlRDYVdkKhiPMEM/zIpR8b6iyg9Cwd6kypFdmeErScGk8gLCGUcfdzf5bbJV/bisgCQTso1agSVtcN7q9/E+kZioig8TCdZvjIEIO5bP3RPmkwk3dDJKfWWe+09QISzdnf++h9FqlUCfqr+1J76PBf4xruE4/Vnc4nCwMRoiKJ7vkH+IOKQSoUai1UZ7+ZTBnzFiZ8kmiLwzYFJ+BHw==;
	5:MeLTXP/kUokcz4nFHNwKWQDwqSA/4JfIxQBCqi+oApzJuiKfbxD0XUDZeN9u0lzbgfPut6WAOnvqPZbAvsTbGzIy+R7dOzaMyZOEU1RrDmbbyGbqQnpEMO5InyMm0l9Vw70RISUWZc6K1F+ASAN0JCxRqn7PUySDksu3QX0HXEU=;
	7:W3aci972uGkrZWaiGpf2XLHStQ1DhxAkGD0If8+6VQKbtwrrRY7B+T71IW22RdNrRqtqiYo8UPSbO1I+hobzhr6sHkWsLj0+omAeYxwmVh65APPvt5C8Nft+YcExWYk/PIN1SrBaFzcW0Jf2/z79MseSsiDzDbQRMjEB2fvGtOJ6JfExuv3SALrOu0rbMlOD24eF2BiL7OYzCJWu0DfIqI7Hersot/dXMNXriOmE3r2S6x4GttxZqDZKyfj4BETh
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 15:07:30.8475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1321bf65-a74b-4cff-d979-08d622f89df8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5109
Subject: Re: python-sqlite3 packaging
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
X-List-Received-Date: Tue, 25 Sep 2018 15:40:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Jeroen,

On 9/24/2018 12:22 PM, Jeroen Hofstee wrote:
> Hello,
>
> Not sure where to report this, so trying here. It seems the
> /usr/lib/python2.7/sqlite3 ends up in the python-misc and not
> in python-sqlite3.
>
> This causes statements like:
>
> import sqlite3
>
> To error with ImportError: No module named sqlite3, when
> python-misc is not installed.
>
> It looks like the python2-manifest should at least include the
> __init__.py, but the logs suggest the manifest is generated.
>
> Perhaps it is easier if someone who knows more about this
> looks into it..

Yes, this sure looks like a bug, can you please file it on 
https://bugzilla.yoctoproject.org/enter_bug.cgi?product=OE-Core so we 
can keep track of it?


Thanks!

Alejandro

>
> Regards,
>
> Jeroen
>

