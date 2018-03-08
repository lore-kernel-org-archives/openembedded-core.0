Return-Path: <VINEETHC@xilinx.com>
X-Greylist: delayed 946 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Mar 2018 09:39:55 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0059.outbound.protection.outlook.com [104.47.42.59])
	by mail.openembedded.org (Postfix) with ESMTP id EC59878557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 09:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tVQGTE8AZ0teDMwQ5x+xftYy9oZwzO+Ct3CyYgOwhfo=;
	b=z4b01VguxTs+C71JEG+6u4Q8I4o2DoZlcwX1CPqXteRmrd/T+9gjr9eC+EZK1hLPACNNZF/5iAKhqubZG5YgrjXXW2mQ65HMcsMTY4opgrfmdCqYiK0U6rvOwkjfGawlp08pMv+fImUc1DtSDi8lkf5r72f0jje59sxj98LNSW4=
Received: from MWHPR0201CA0038.namprd02.prod.outlook.com
	(2603:10b6:301:73::15) by CY4PR02MB2263.namprd02.prod.outlook.com
	(2603:10b6:903:a::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.567.14;
	Thu, 8 Mar 2018 09:24:09 +0000
Received: from CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by MWHPR0201CA0038.outlook.office365.com
	(2603:10b6:301:73::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.567.12 via
	Frontend Transport; Thu, 8 Mar 2018 09:24:09 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT037.mail.protection.outlook.com (10.152.75.77) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Thu, 8 Mar 2018 09:24:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:33878
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etrmR-0001m0-Vf; Thu, 08 Mar 2018 01:24:07 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etrmM-0002Wb-NQ; Thu, 08 Mar 2018 01:24:02 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w289NtaW004338; Thu, 8 Mar 2018 01:23:55 -0800
Received: from [172.23.180.111] (helo=[0.0.0.0])
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineethc@xilinx.com>)
	id 1etrmF-0002VD-Ar; Thu, 08 Mar 2018 01:23:55 -0800
To: Vincent Prince <vincent.prince.fr@gmail.com>, Vineeth Karumanchi
	<vineethchowz.chowdary@xilinx.com>
References: <1520479851-22522-1-git-send-email-vineethchowz.chowdary@xilinx.com>
	<d3e216a8-65c8-6ad8-1514-2b04dd53fa38@xilinx.com>
	<CAB2nKc9tBJW_zFJFEq=CT4DqnQfLQsKTLuBjW1yDveVoYzpZ5w@mail.gmail.com>
From: Vineeth Karumanchi <vineethchowz.chowdary@xilinx.com>
Message-ID: <3f8d4b2b-b3ef-bf9a-9d1d-dea7f068080b@xilinx.com>
Date: Thu, 8 Mar 2018 14:53:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAB2nKc9tBJW_zFJFEq=CT4DqnQfLQsKTLuBjW1yDveVoYzpZ5w@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(39380400002)(376002)(396003)(2980300002)(438002)(377424004)(199004)(189003)(39060400002)(67846002)(9786002)(53386004)(4326008)(63266004)(72206003)(6706004)(31686004)(6666003)(966005)(2950100002)(305945005)(5660300001)(356003)(478600001)(65806001)(36756003)(106466001)(31696002)(229853002)(36386004)(81166006)(65956001)(81156014)(6246003)(8676002)(8936002)(6306002)(64126003)(2486003)(23676004)(2870700001)(106002)(2906002)(50466002)(53546011)(110136005)(1720100001)(76176011)(54906003)(59450400001)(77096007)(26005)(956003)(186003)(65826007)(58126008)(47776003)(316002)(336012)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2263; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT037;
	1:haB/ysIh4VsfdQQlukeDgiGmRzVaSAhkszCeFDlT6f501Q+Dx2M22EVbVDuDEWBtyfpwbFllf4h2DAu/bzAwS0EwZRXIDDPAGgVQHuHkTZAgCefBIZQ95MHALN0kxUg4
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4404d84c-b608-4c0e-27cc-08d584d658b3
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY4PR02MB2263; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2263;
	3:kuYmOjSQnE0KUkx2Q38SsR0JRIw5VMTTKKWvccnSu/2jugZDIVWw4eEfk6zMUwwp3nvMTlrkr7DEFDaAdnrGSdK8gaqAwROzk0zv0vI/3A3MCd9j+1jsg43GPuD1eJ5LeL/Lcl8tzTfCS/qXcmV+Yg47Ia6+E8NZCVZKWkQ2sddqs/0n6NUQfvXQzl/6i3u+bkCr8TDlqL2U9sKkhaqngAgYBhZaW1HV0HRH7bFapR9MsUBC0V5bvnarQhqN8kKc7wEivkXbtKnfuXKcrDxSJktKhn7y0oCn38JYpYIEnRxM9imHU8Ub4rVab7QU0L6zWYu3iuwqGU4fP/FaeNmVRauxeFhrsXBWBjdNV5qg7uo=;
	25:J5ODIsxRDCg6R94ut00qDutGcQXs723xrupCM6hyCorZ0R4J6pQsAU4AgdtFrVEwag1zP2oes0qRNPSHuit2W0M6zZB6yu+Vn9l56KRDj2W9PBaTPdx05ueFnwF+hzGgu7XS6/oZWV7GkjFKSTY48jKWm7nUhAALFeh/L6CAYlERpzpxwA5Is0TNBbqsvMYgy2sc2kixOXRicaVRAydlXSZ3VTY7ePV+XFArNBmdAEGzFMSoliYyu/ty50lK2Ga07rx0A52bdaDQ9J+s+wfXULNZtUpg6arKj7K5MzS7DtLOEzlwC8uUf3lvhCTXl8gvzJDBiukQa4sXpvLD43p+5w==
X-MS-TrafficTypeDiagnostic: CY4PR02MB2263:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2263;
	31:gk5KMUajxcu5J/+oi56o7Cc2Ca6WNyiC6gnNA3O9mlBDcqwIfjkfRrrkLIQYfbRuIxA9pn0hH9kN5BZHKLK+Z0GxJ8tKLt2o0ILS1/v4YFf7xjMM9B92QJt7CjhWuIpKn6adzFEVatWuTs+jTOqXNWZvIanBLNfeHFww0fS5P789RGnpk8HqbnZf3eGqgIjd7hPWrprVHSmRBbwy2c0fPU5Ze27IKG9sjbxsIKyhysY=;
	20:mmy7WLeY7k2SO3bXd2/netZfOLOQckyKV20NkoF2I1bJYQ5gk6ZLwA2NS7UoDJkCiP4/9ts44o58CiIa1QKoJvFrU8VnAVtq1PIcJdO4B19CUn67G0PgSdoLLk5ktcm5Ho4UzyWXbYUXZWbKSqJPucj13ylPxFZzFLT5tABLUIdlntULj/5cr4/JqbC7qpuRBUe+2TDTE5alb/TyUFvn7scZRkSr1cDIRgI0qZoNGLHjqDDbgmlRjgX6Io7G2OoUz8JQGZXJsQ16XbNIcGbsv8SZAvXI1lUBQrW3tcY1rJWRuml9agQV0CKXVjG8V/pyjX0r5GjralEoOHj89pd6T7PdD1WybQVqgGOugUTkdYauh/NCFOcnUF80KDky4LNaBdZcbfkBhSBGqSiiXHRAQk/2/PKNXWJtRE/bOM4L0NTp1dJtTibRPhRrQhN9pMyeAtiP/LCIQWFvtk9KqwWSz0Q9I74CJKWAmHBIGs+zjWsnVl9sv7xwCOmAI8u+LEOf
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB22637121A6CB38C87887E9A3B9DF0@CY4PR02MB2263.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(8121501046)(5005006)(3002001)(3231220)(944501244)(52105095)(93006095)(93004095)(10201501046)(6055026)(6041288)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:CY4PR02MB2263; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2263; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2263;
	4:ZiR0w2cCPa8KhoeCslrsv7R+FWuS87eE4p+ty0pXEkPup6BH3cS7/oKb19YpxXDgETK3181jdY5k1A3eXXlX+MZRBXsNz/wW+erzp019J2zDtqozrqd9an1oQYCVYFpmApK1nwY+qpmpNQtePygeVUjn4Nt31FK9XwLwHFic1cqIPH6SMj72mv/2aDaIL3PfkRN4UbmhYutzzHqikNr1+YJVpoXafqMZ67yZDeuJPtwBgdzWGGsF9GbiX7UjaNbZ/buWg5BbbeCNlSBlVlWOljR/9gpC68A3v7sfokZk5yanqxAk7KTn95yFtyBT1FrfZsI+RxYUg4fvXlF5wMbYIkkUNokUSyXUJEthL1mM9kA=
X-Forefront-PRVS: 060503E79B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAyTUIyMjYzOzIzOnFQckZjS2ZXNUdnNnZNdFd2UkZYeStDZzZo?=
	=?utf-8?B?YytVcTRzL0NDTVJhSGl0M2tYdnRWT2JOcXBlT2prODZRelZjZjVLd2tLMGhC?=
	=?utf-8?B?VElqdGdFTFpidzdIR1JyNE1SYzF3bDlLTXB6N1gvKzVjcHBBU0dOK1hNU1Nm?=
	=?utf-8?B?N1llZVhtclBUSmRraDdpMnFpY0VvUEkzNStPSlBQSnNwNnFyYzJMcndMVWdT?=
	=?utf-8?B?bTd0bmc4Nm9aVk12dlVwTXM5UzlWYlEzbGpDZ0psWi81ZXRhRHdhVDErYms4?=
	=?utf-8?B?djRQNmd4UUpGWkkrQlVtVkgxNWdmckRoMHNjL3VJSzZRcGtWQ3NZWlh6am9X?=
	=?utf-8?B?NU96aFZOTHVyVjBzRUUwSlNEcSt4ODRkdUhoSGhEYjlGSkora05kUU5jSzJx?=
	=?utf-8?B?YlBkZVIvNGQ5MXBScUxMMUFTdU1weFlaN0RudURURTdJNTh5VWFoazMrNFgr?=
	=?utf-8?B?RURSdWppaEhGNEFscHZ3dmhSM2dvZ1ZUdDR6Nk4raE9raFova3dsb2I2aS8w?=
	=?utf-8?B?TlJUL0IrdjhPZUkweFlHK1RIcmV0NFkxOEg1YUYrRVVLOXJySVRMUVlEZ1Nq?=
	=?utf-8?B?VU83T1BSRFZvN3Uvb2VjaGRvZE1HVTdISENwWUJHaUxucmkyblpQUExWU1pj?=
	=?utf-8?B?dGltVXlIenlwZ0J2ekpRNDlsK3ZYSkZJaVFqdzE0WSttNy9iRThBVEt1d05G?=
	=?utf-8?B?V1B5b0I5aUlWdUZzY1djVVFNSEFuR1J6UGJjWVI5WDUzQ1VlTW0vQmp4MXdy?=
	=?utf-8?B?ZU1UaEZVbGU4MFV2QmpnQXRHZTRHUFFyc0VIVi85a1I0ck5STHhCeFhHakZB?=
	=?utf-8?B?VXFvOCtYR0pnKzg5eWZhYjI2QTc2NlROMlAyY2U5SktRNjFQL0xlR2dEUFo0?=
	=?utf-8?B?NmthVzlXMTEweG5RdDRaT1g2ZWZTcEhSK2JYVTFlWFdYTFZyN2JtQ2xKZmoy?=
	=?utf-8?B?NlpFWkdudlh5RytCcmZoYTB3NjBoN2xTV3FLRG11aFFYN3IxZWpsbCs3dkMx?=
	=?utf-8?B?cCtvSDRjOXh6a2VvUHIwdHBXaFF5YWZLRXNQTE5CZHpxUVE5ZU5vdmJnWmc1?=
	=?utf-8?B?MjQyN2Fuc0pYeHNwTStuVXBYZVR6aG5KOVFXcmFRaHlKaU83UEtsUXdLSC9Z?=
	=?utf-8?B?TXErcEl0QXh2MFd0eGt4cGFoT3lxUUs1dmVoSXkxTVJWVVBHT2dWdnFuSlIy?=
	=?utf-8?B?U2E1NThkKzVMWkVmOG1tMWRzaGpJZjBURXNyZE9FZWd3UW9aQnpUellpR1RJ?=
	=?utf-8?B?SlFWd0o5eHd3VjJRL0llbWdNRlVCOXhoam9pc2tKRzEvVC9iWFNHN3h2T2kw?=
	=?utf-8?B?Z2loSTlDbXdkalFPWXRYV3BrT2QraXJxbWtpTEEvd1Nud0h4cTRnaWFUSW53?=
	=?utf-8?B?NDlwMU1qZk9mbkRScXhEMzRSZGhnbVJhVm1IU2RUM29ZSGxLUlprS3pKcFht?=
	=?utf-8?B?cnlZclJERmU0dFFpdlIvNmN1NlJxQkFzRFdvak5UTVdhOWxsbC9EenBPSnVT?=
	=?utf-8?B?L3lJZVlvV1QzYTRBS3dRdDRiM1FpSExMYldpbW5KT1NDRWp5VGdnRnBTWGp2?=
	=?utf-8?B?elpocmp3ZHBCTTQ2VWVBdHBXY0swd2haTks2c3FRalh2OUdWSENXako3aXlR?=
	=?utf-8?B?NnAzR0ZPdGVQS1cyWHBoelVEZTZGSTJMbXpYang0cDBzMlJIM0FJdzBjcGtL?=
	=?utf-8?B?Vkdpd0NZMDMwekZYb0ZzVGRoVnlGRFdYRTBQdEhsRVNwQ2Npc3lORFpCcUR6?=
	=?utf-8?B?ZVl0Z2ZCMUNCT0x6Snc4ZDk4V0tyUk83STNwQWp6YUN1TEJFRnB1SHYvcC8v?=
	=?utf-8?B?ZWtZMGZBeUVVUWY0MFlGT2VRdDZMTmRtN3BMMlNlRUxpblo3OURzWjlxSkxG?=
	=?utf-8?B?bm1xcldmSHh4cDRSUmlIN1RmQzVXZVZOZmNnamY2Z3ppQmlpbmpKQk9BOHgz?=
	=?utf-8?Q?yJp3muMo22b1Op/o9iAjkGCvl0bNZg=3D?=
X-Microsoft-Antispam-Message-Info: X2UynSWuXR/K0060m7xxU3mpSvhKAXkUQFObzgCruYKZlEC5xz4TbgXtWg8cMKiQtlbRNllWZ6K+bu7FU67rrqN4WV0qHRlqAR/QpCJEwgDv+5DPDtelJ/gYt66VMy4DAHD2Hbr8L42BGrh9CE9lcArKkpZ6uL2wwtg5rv2+j623U+j9XRQ5QsmoIchWIsDQ
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2263;
	6:AXW8RgKbJGcDPKH2XmdqS6RylLcYoh/CKWUclYXzey5q5SPr189gB5OqKoXMN8yprz1ilPW/003prPqrLUxnAdADi2U8xLNzIBZBC/RwlRMjBl7f72/bjMWlYr4d5UpJPuH88VeoksJw//e4Z8Rb2rkvIdtIMerwmcrySoxc2EgM75htcYLWkr8WZ/aVZX4VXsBbPFg0uNGMz+p3zqHz4ohpz7Lrc8zOraNUVHsd57JqKjlgO4Hfi0x3sVvsP5O/sqKE8pHU9R+MBM5tmPQ5nc07UVuVZwsyqbkjpxiUQo6ufj2LVtPkXBWrzJoq2P8fa2nx2Y7/qV49NLiKKsomSEE6C3Je0iUzHYY0KHvnnyE=;
	5:q+SpQ2M5ThekBPGMjStkSt/pkCVF8LZEaGW3yecj5c9iIAZJPf/bfV53s7D0RplQa95ne7wcPkO6lFTqH0Wnja5jEnR3+p3PAxiQwOQbmV3SXppDpST6UM8GOV9VkQkCauhCDk2c5DsXyWkhxiPfsEnBjrYewsylXWM7gIhltzY=;
	24:YO+hMsIjXEold973iuaFLCnQWndbTw6+KV9RiXUJJTEon/HsFhs4vcAxrZ7qCtC+Odigf8MtjyUZBk9jALkXRhnYD+5RUfTodT3wtb/aTHc=;
	7:5RepqPYfpj7jDx2vSLOEM/jGz6WLNuYq0rndAXHUTGYkVt4cHK6o+vPTG3Ggl0e8mjmbz/opRdyinNOLURj5jtFerI4aRqrZrBI1EeULfEJ58e+OD9u1124tBwN+yVA4Wg7QedVduYVKuVRKOuacrgsuhEh5yyf/viJKpEKTwakaZujc0qINisHEIXmNXEvo6sJQJPr4m8dIR3OvE/TNQCmF90i+xCZYRf5bpKj7PIQNsVx3UTzGMLSe0IjUt9gd
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2018 09:24:08.5672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4404d84c-b608-4c0e-27cc-08d584d658b3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2263
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-fitimage.bbclass: Deploy fitImage without Initramfs
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
X-List-Received-Date: Thu, 08 Mar 2018 09:39:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Vincent,

Thanks, I was using the second one.

The auto builder uses http://git.openembedded.org and the patches should 
be on top of it ?

Thanks
Vineeth

On 03/08/2018 02:09 PM, Vincent Prince wrote:
> Hi Vineeth,
> 
> I think it's because this class can be found in those two repos and 
> error log tells it should be based on first one:
> 
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/kernel-fitimage.bbclass
> 
> Best regards,
> Vincent
> 
> 2018-03-08 5:39 GMT+01:00 Vineeth Karumanchi 
> <vineethchowz.chowdary@xilinx.com 
> <mailto:vineethchowz.chowdary@xilinx.com>>:
> 
>     Hi,
> 
>     I am getting the patch failure error saying unable to apply.
>     https://patchwork.openembedded.org/series/11297/
>     <https://patchwork.openembedded.org/series/11297/>
> 
> 
>     I did these steps:
> 
>     - git clone git://git.yoctoproject.org/poky
>     <http://git.yoctoproject.org/poky>  ( master is at
>     83cd2b3e775235942dd4201622dc5cc2d4328994 )
> 
>     - Applied this patch, it went well.
> 
> 
>     Can you please let me know what is the mistake .
>     I was sending patch on master.
> 
>     Thanks
>     Vineeth
> 
> 
> 
>     On 03/08/2018 09:00 AM, Vineeth Chowdary Karumanchi wrote:
> 
>         This patch deploys fitImage (linux.bin + dtb ).
>         The use case is to have 2 partioned sd card, with
>         FAT partition having bootloader + fitImage and
>         ext4 partion having rootfs.
> 
>         Signed-off-by: Vineeth Chowdary Karumanchi
>         <vineethchowz.chowdary@xilinx.com
>         <mailto:vineethchowz.chowdary@xilinx.com>>
>         ---
>         v2: Proper signed off
>         ---
>            meta/classes/kernel-fitimage.bbclass | 5 +++++
>            1 file changed, 5 insertions(+)
> 
>         diff --git a/meta/classes/kernel-fitimage.bbclass
>         b/meta/classes/kernel-fitimage.bbclass
>         index 50a91e1..25884d5 100644
>         --- a/meta/classes/kernel-fitimage.bbclass
>         +++ b/meta/classes/kernel-fitimage.bbclass
>         @@ -464,6 +464,10 @@ kernel_do_deploy_append() {
>                         
>         linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
>                         
>         linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
>                          install -m 0644 linux.bin
>         ${DEPLOYDIR}/${linux_bin_base_name}.bin
>         +             
>           fitimage_base_name="fitImage-${PV}-${PR}-${MACHINE}-${DATETIME}"
>         +               fitimage_symlink_name=fitImage-${MACHINE}
>         +               install -m 0644 arch/${ARCH}/boot/fitImage
>         ${DEPLOYDIR}/${fitimage_base_name}.bin
>         +
>                          if [ -n "${INITRAMFS_IMAGE}" ]; then
>                                  echo "Copying
>         fit-image-${INITRAMFS_IMAGE}.its source file..."
>         @@ -478,6 +482,7 @@ kernel_do_deploy_append() {
>                          cd ${DEPLOYDIR}
>                          ln -sf ${its_base_name}.its ${its_symlink_name}.its
>                          ln -sf ${linux_bin_base_name}.bin
>         ${linux_bin_symlink_name}.bin
>         +               ln -sf ${fitimage_base_name}.bin
>         ${fitimage_symlink_name}.bin
>                          if [ -n "${INITRAMFS_IMAGE}" ]; then
>                                  ln -sf ${its_initramfs_base_name}.its
>         ${its_initramfs_symlink_name}.its
> 
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 


