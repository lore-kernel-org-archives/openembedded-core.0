Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0066.outbound.protection.outlook.com [104.47.33.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA4E748F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5dcD5OSGmxPkxcfmZ1apQAtjksiJHjHODPyT+eZCGG0=;
	b=RCiReqn6NQW3thUz8hLexdI1bHBayuK7l7gwsCIDi+Rw98dc26/CLG6n8yv8dfQcf2RY/QwpfJz5f48d3Ks6oaaNqRwKYeHa7B9if4YnL/sJWs/hHxdyyCI1NGWgVdXblT0/fnQVThCdQkzOByoAoP8YjoHHzMAe7R5mWCh9i7c=
Received: from SN4PR0201CA0042.namprd02.prod.outlook.com
	(2603:10b6:803:2e::28) by BL0PR02MB4756.namprd02.prod.outlook.com
	(2603:10b6:208:5d::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1143.15;
	Fri, 21 Sep 2018 16:53:24 +0000
Received: from SN1NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by SN4PR0201CA0042.outlook.office365.com
	(2603:10b6:803:2e::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1143.15 via
	Frontend Transport; Fri, 21 Sep 2018 16:53:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT027.mail.protection.outlook.com (10.152.72.99) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1164.13
	via Frontend Transport; Fri, 21 Sep 2018 16:53:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:58242
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g3OgF-0007YJ-4w for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2018 09:53:23 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g3OgA-0001zi-22 for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2018 09:53:18 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8LGrHB6006708 for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 09:53:17 -0700
Received: from [10.23.119.158] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1g3Og9-0001zc-Ax
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2018 09:53:17 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180921114900.26338-1-ross.burton@intel.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <685be727-76d8-250d-e403-1c71496ceeee@xilinx.com>
Date: Fri, 21 Sep 2018 09:53:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180921114900.26338-1-ross.burton@intel.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(438002)(189003)(199004)(316002)(8676002)(31696002)(23676004)(305945005)(3260700006)(58126008)(2351001)(53546011)(478600001)(50466002)(65806001)(77096007)(76176011)(106466001)(47776003)(81156014)(14444005)(229853002)(26005)(65956001)(2486003)(336012)(476003)(230700001)(446003)(11346002)(36756003)(65826007)(6916009)(2906002)(186003)(356003)(64126003)(486006)(575784001)(5660300001)(81166006)(31686004)(426003)(8936002)(2616005)(126002)(63266004)(6246003)(53946003)(9786002)(106002)(67846002)(16200700003)(107986001)(5001870100001)(579004)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4756; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT027;
	1:LjuH5torgB1q5jC4R/5Ny/hVtgVAVAkaeUgfzckskILZS851tSxoE5eMl+lgLGdr0Jt3o+gOOrcrkmo+4bCmd6w6GL2H62IdiPerp62HXaUivT47Y1J9XbGvq/sTOfs0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51f580b5-ad3b-43b2-143e-08d61fe2be73
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4756; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4756;
	3:uiFIy3zV6qIQVu8c6dGEKcCc4KhD8kvguyfs5p9cLOtQwnoS27l+R2pHeB0YKQDm7cqaRG8biWtN8TisUnR+P7dl/k/sPRv8VH5ukMcMqrZ0NGDcggzglrHNtVTQYDXSXWDNv9PCgmFFJRznBSSjsTVO/H/LHcf9Rd2s0dKX1h/v394s7Cj8w21lFfS54sdVjnZEif+YB0Qrvmg8izhgouSkP8VeII/P07VA2GJTfQp+YKaIRKgdLza8aRwjG6JSI1Y94RmBBKrBlaYGSdfH3RsCcSsCxDe6BTk+QfhHQmaD4JlwdXT3uQRWohtmaW9tew2P3Jz9zk1OTb33HkDbQDvQQbzlHGFzuYFVo0HZXkI=;
	25:KaeEMSsaLbGF4WrHzm3wJ5O08UUXuL7GtLy2D6++HsgYn+XlZeaZwhFz/3KfBD9L8FQDyCKfzjhFilrA4dn0nGCmJP3c4PRUYsal+uOd4ppZLnFnSKZDOinw5Yb8h0ND9KnRA8HSO2cKNT/EUsFz5bA10G9IN/ksfxj5udylmXTTdjnxHX7LjCEnl2m1UR7DYiiTyvDLaXeMUV80zLIwm5LZVGP0GOwO4Fh7o//imdlmTY/nW6ywkHJSnmIKqBM8NuhxNDL40zgWG+Va+QZ+LKuKU8wuq0OX8I+y2I4gMOKnRAVCtEEvukGAtil9KMqCGgEcwZCZL/W+EpZ5IqlBWA==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4756:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4756;
	31:5VIwTshBwTBvc/Ds5w0ycai2wN0om2wAQlx4eeMVpfF4FsPlBPxpSsdiP4C9DpHY+iMWRdP5FLWz6wV+yAbKmm8Xw6JJu28biWCWlaegRPYHjJOXt57xJrWNL6UZlSdxKnAPPI2aZPeKwZ5fmQNFxnXQ0O/xsU7v+rNMsx6gd3bZX7N47oEzQUg4sfOMlMPsMk3xpARN73HvHUfRSdlnLsGHjxXxBQGpuCRGDi0evf4=;
	20:aS2HXzO8uIr1e7LGUhIP4lGpOBuPtnZ3ETJZn5OA7NpJyv90yA1eobVBn6cEGKj2w/1F873vHRcYS9cre8y6TrMgB5Qiofl/38ENxQUuq62CaSpKnN27rArsGppEL3b0vMATeVyZrOWREqwUY25BTyIhizx6k10Y/OaGfI72UpvoL/f8OctBQoQDZlnudca5kIi3H3RnPEKnG5MjhiImEjooptxdeXGCUIYT6AObH5CC4PICqO4dNCZayQh5D8/VEfM4eQ8FIyLpfXam/E2HhfOTSIJcEkniSWSROcEBvDLJqtEUQn5R7rIvWlvDrvTd3Kh6fwYNR+TDk1HHMSIOx0qS9Ee/SufaYPF38VkSBhqfDTXDBVSsJIzdm4gSnyrIcOvAnGaO9gX6tGG9DbD/6W2TamgliB1VCKaDCid1Fu0nARiWFDJJo5cnNPQzjBLQLvqHQv8XJMslUC1pA6T4qR2Asizo3Z/3awPiLjdP5zDPoQ5O5XkA6IJyuxI34Unk
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB475636DECD7F1EFD5F495408AC120@BL0PR02MB4756.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(93006095)(93004095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051);
	SRVR:BL0PR02MB4756; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4756; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4756;
	4:uYtAF4fzH+KRb4QWf395WE3AVcosCAEm91HtFWUnNbDb/knMUQyy+NHSsMkWP8ugNjjflX5YU9sjMmncq4SPB9s73dPtJ3vLjMWdIXH82/h0yHjlHBcnN6DRQ+x8AtybM8mCV0hbWTJmrvsNpDoCCKFN38XX1bFN5KAqWgPwWnW4nfVMMPTKur8BoXr9kR7VcEe1buLhH0lmR0rcojVKq6SdffENBHDx81uR4wX1Y5kR504diyrB/ETWMR0IHiJRKzt3vpAvgOq908CPlki5NBbKjJKhKy+JEJF70e5uSuteVSmCR94HFSMdtAkwDQXfmgAs3MnLmW80K2jcFJv9zl4nBX68YLIi1dbpUhXfrWE=
X-Forefront-PRVS: 0802ADD973
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDBQUjAyTUI0NzU2OzIzOjNGOTF0UlZSaVk3d3ZMcm9JNHVzTS90aS9Q?=
	=?utf-8?B?MHZMTjJLeUo3b3FVVGcvb0tqN2JNbjl0U244QkdYSmh2SW5pUzFuQ2hmamxp?=
	=?utf-8?B?OGR5MzhJUkNUYThtemt2L3lHcVBxWHB1cjVDN2ozY3NUNUsxTzRwK2VOTE5S?=
	=?utf-8?B?Q3poUmpsSWJlMWQ3ZktIZHI0RDBHZ1BiN0MraFNpdXFHTzk0ek9wMm9UVmtj?=
	=?utf-8?B?cnZtUlZhVU10VTYzNlZzR3dIOFkvRHE1U1BDODlrMDhYd0dDblNwQjI4Mkl5?=
	=?utf-8?B?dmEvZzUvYVRvbC9DOUMzeVBENWZZc0pnYjFqY2hHWTB5cHpMYW44NG1RMzl1?=
	=?utf-8?B?Q2xwY0tOUk1QZWgrWmRzL0JtV2tZR0VyZ2VpWlBHSnFxSkVMM2NZdjhFakxF?=
	=?utf-8?B?cU1ha0NxU0dhMk10SnBMeVUvbXN1dTVxZ2VCVE1nNmh0blQ0ZDIvQ0JjNXEx?=
	=?utf-8?B?SnRlZ1VVcU1FMFZlME9oMThRdmtuRlhuMmh1S0RmcmJHMDlwblNEbFZxV2pa?=
	=?utf-8?B?bDhidXRoTURLRHFlbittLzRXb0ZOMS81NEhnQ1UxM1Q0TnpDMEh3MzhxQXI5?=
	=?utf-8?B?WEpPSi92Sk5abU4zaTlKL1B0TWYxR0JXbXhQZEJJTjl2RjJmK0Y3YnVGVEI5?=
	=?utf-8?B?VVk3R3ZVc3ZNZ0Irdy9RWTgvdVpTNnpHT3FiODY2MWlRaWorWitjZFMxeE9F?=
	=?utf-8?B?NVVoR3d1emNuOXd1dEJqaW5zTU84aVVYa2FSUjhtelU1Qm1jenFCTUZJYW5Q?=
	=?utf-8?B?UHd4dXNaK2hqZFFPRDExVmFwTGxoUlhXTHVyd1B2NWU3Um8rM2xWZnFyV2RV?=
	=?utf-8?B?dm1hcnk0djNwUWRDRHhmc1hiY1BsU2haaWpOakJlYlV1NUNDaVJpanFnTmZI?=
	=?utf-8?B?c2o3Rms4ZUJiZjhPSVgwYlpQMXBQTjJlNDVlcEFXN0pjdExzdVB4NVhlZFVh?=
	=?utf-8?B?T3drTVFWMTlDOXMwSjBHcjBqVXZqeDZaSWFWYlFzVlA3MmNoNk96TzlwYnlj?=
	=?utf-8?B?RXhnZmJ6M0grK0xvL1VpZzkrZWF3QmpaS3lyMm5JQmlTS0VjYzBLQUlBa3pQ?=
	=?utf-8?B?bUZYdHQ4Ujh6TTlsWW01cjRQQmhIQkE2VnBXUlhPcWZidjYyWmhZNGppdHVm?=
	=?utf-8?B?c0NwU2ZaSXh2QWdBdnpITXpId2p3VkhhQzdTNVYwSml0RTJTUTJoNHpNbVpk?=
	=?utf-8?B?QjBJRHB2N3ZZMHg2ejl1WThPdEVlc0hqamxsK1VOZ1hzS2FhZDNFSUVxcHE0?=
	=?utf-8?B?ZDJNbkhtakxncFd3TDBpUCtMa2VjWXM2QjQ1WG1HNFJoaVRjY2xsbUllMmVK?=
	=?utf-8?B?dW1xUEdEcDVXVDhvT294WjBGSklBb1Z3KzVKd0JxYVMzbXFORzY2dllidVR3?=
	=?utf-8?B?dWhHQTEzMWs1SFFMNVNKbXdpeDhGL3lURmhoS0RuYUl0SHpiYWFxM1Z5T3NS?=
	=?utf-8?B?N3RZNnFWcFEyM0ZKbHV3bk9ZdCtiNTNDNWZ0SDVmMGRMU1lmUGVQYzBFQUY5?=
	=?utf-8?B?K3BvdjYxdm1KbXVjbWZrUlppcTBVaGpPOHBmQjdUZFpXVTArMjVSZ1Yzekti?=
	=?utf-8?B?MzdyV3dvSVV4UEc1NzFBMWJ1ZFhaUU5qZ0g3UkluRkVMSDNRVjJwakVsaTJG?=
	=?utf-8?B?VEZYQm5qZjFvSGhra3B1WWtaaEdVK2lJS3VBbTdyZHZhL2FxeGZYSEtVdTZz?=
	=?utf-8?B?SE11WkFDUmJEVHF3TDRxVHB3SzRycVo5UVlNNzZueXRXbDF2aXFVN29zSWx5?=
	=?utf-8?B?NHFlOUZGNUs2SGVhZ28wbi94NXM1cyt1RUdNOC9SWnkyalRNcExDV3NIN0N5?=
	=?utf-8?B?UGE1dHpDVDRnRE02ZEcwc1BjajhTWC91RUZjemRhL012WVREL1N5bVhkbHkv?=
	=?utf-8?Q?Uk9kGdVTZ9UpglLaF9OAvSiKnpBmx3+i?=
X-Microsoft-Antispam-Message-Info: hSMqrzryy0ePzwAnq+sZ8wiu6iKKZni+6fbiD1N0u033E1RCkLlyCybXNyPFuMRbCYSejqhuRTN0ErLfye+8W+R5ItIvX+rHSvaG6qk7u18ApWeAQAQQPvQ8IOlje9mGJ/5tDyqHAHtY/+aoRXqDdP8TabMPhT+KvCKR5PUuS2Dc0AKTJUX72G/DBNwDWNz97vQXE1GJ8eAvspq2B+0S4Z90nj0SDQL5epbiyO/7EqJda+Vpon4FDr/Hfw6Hbcqk6muuuaqjihWm+Zee4jtjwtW8tg9oE9i4vJYd/XWP6QrkkQOUBNRWjCAMESLUVXrJ+MtYbDviH8y4p/M5vN92CVhPtQ9XGSd9RdYhWTOzTFk=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4756;
	6:sBdis1+3Py7MQToD/NfOcxLNKr1SknxZoR3aPhhDsR24Ze7GZHPoIJGT32WhISBwxLO/0WU0im7h9GXRQ60pbly7O9Wvk/qUcagT+qJNqPt6ilHFQs3WCMr0oRD53rgMMXzta/gdWIaXaqFY6+s1vkuEaVXF9Pkyzx9/ZpCSUqbI6ahrPi6YgkjxHeSBc2Ggw8L9Duc9RDep7ZTO51ainrAib0MOZW8Ws48GjAU89uoVz1baZ6ZmLPuqJS5AdjFRhhZOQ8zcoXbiiFB/k8Qw30IGTpva/QNZ7iv/jcDWNXZaOq8Gn8DDgA8bR2kW7jCE2nic5sBioahHS8DiGEvp3EcXRU044+VBFKPRoNMlDjNVQJQsMqgqViXo3WkxJsZDQgSv6Q7T6ITyKagcjdeF+t+uvoFfupvIKpXond08RWcdl3ccD7apmO/twC+0zbLEqJVCwlibZuLR3sAnhhi2AA==;
	5:VevJbJnAOdPT9d99k4xxMMB5eLQ6K2OzkSsNi99trPduUIVr9fFYrDansZ8UbNPVCuKTvM513CIym3AX3RC5oU+dDtB9cPbHz+caJyRAg+tDueAZbxqA17INd796VvDCcbdNsYGk0tyWcjZ/JPX66Q1fiSWtSbWDlgiYKSYETxw=;
	7:uC3Tnx4itT15cJcvKrchtMkw4WGOgpB7QLf/cTIqo8K4zY0RKHTMaF+JxD7QFkiivwb5AFRPY5BNucIKwS/U1ICRJ0J+kFvBEDlU2V54wLiwoEph60ZIpDxsTEj9gYi1SenqiS7R5EDn/unXWvyIWvwLT3MjTliB5Bt43FIUHn5eOD7gvn/0wNIh0IYLIwaqIWVgfV/5nN+n/S67pTuIo9OvA1oBYQOja+iWJOb8Y4ZgalBnQ/RKHAqXPN0C68Lj
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2018 16:53:23.5286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f580b5-ad3b-43b2-143e-08d61fe2be73
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4756
Subject: Re: [PATCH 1/4] python3: don't sort the manifest in create_manifest
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
X-List-Received-Date: Fri, 21 Sep 2018 17:08:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Looks good, thanks Ross!

Acked-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>

On 9/21/2018 4:48 AM, Ross Burton wrote:
> Instead of sorting the entire manifest when it is updated, use OrderedDict to
> preserve the order of fields.  This means that packages can be ordered in the
> manifest to allow non-trivial FILES assignments (such as a package that picks up
> pieces of other packages)
>
> The manifest has been regenerated with the new stable ordering, and
> distutils-staticdev moved above distutils so the packaging rules work as
> expected.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../python/python3/create_manifest3.py             |  21 +-
>   .../python/python3/python3-manifest.json           | 940 ++++++++++-----------
>   2 files changed, 480 insertions(+), 481 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
> index 2db5e3b0b67..efef62af943 100644
> --- a/meta/recipes-devtools/python/python3/create_manifest3.py
> +++ b/meta/recipes-devtools/python/python3/create_manifest3.py
> @@ -43,6 +43,7 @@ import sys
>   import subprocess
>   import json
>   import os
> +import collections
>   
>   # Get python version from ${PYTHON_MAJMIN}
>   pyversion = str(sys.argv[1])
> @@ -54,7 +55,7 @@ for p in sys.path:
>           nativelibfolder = p[:p.find(pivot)+len(pivot)]
>   
>   # Empty dict to hold the whole manifest
> -new_manifest = {}
> +new_manifest = collections.OrderedDict()
>   
>   # Check for repeated files, folders and wildcards
>   allfiles = []
> @@ -79,7 +80,7 @@ def isCached(item):
>   
>   # Read existing JSON manifest
>   with open('python3-manifest.json') as manifest:
> -    old_manifest = json.load(manifest)
> +    old_manifest = json.load(manifest, object_pairs_hook=collections.OrderedDict)
>   
>   #
>   # First pass to get core-package functionality, because we base everything on the fact that core is actually working
> @@ -195,18 +196,16 @@ for pypkg in old_manifest:
>   
>   for pypkg in old_manifest:
>       # Use an empty dict as data structure to hold data for each package and fill it up
> -    new_manifest[pypkg] = {}
> -    new_manifest[pypkg]['files'] = []
> +    new_manifest[pypkg] = collections.OrderedDict()
> +    new_manifest[pypkg]['summary'] = old_manifest[pypkg]['summary']
>       new_manifest[pypkg]['rdepends'] = []
> +    new_manifest[pypkg]['files'] = []
> +    new_manifest[pypkg]['cached'] = old_manifest[pypkg]['cached']
>   
>       # All packages should depend on core
>       if pypkg != 'core':
> -         new_manifest[pypkg]['rdepends'].append('core')
> -         new_manifest[pypkg]['cached'] = []
> -    else:
> -         new_manifest[pypkg]['cached'] = old_manifest[pypkg]['cached']
> -    new_manifest[pypkg]['summary'] = old_manifest[pypkg]['summary']
> -
> +        new_manifest[pypkg]['rdepends'].append('core')
> +        new_manifest[pypkg]['cached'] = []
>   
>       print('\n')
>       print('--------------------------')
> @@ -400,7 +399,7 @@ for pypkg in new_manifest:
>   
>   # Create the manifest from the data structure that was built
>   with open('python3-manifest.json.new','w') as outfile:
> -    json.dump(new_manifest,outfile,sort_keys=True, indent=4)
> +    json.dump(new_manifest,outfile, indent=4)
>       outfile.write('\n')
>   
>   if (repeated):
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 90a41fbf29c..95ae3fb0215 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -1,22 +1,17 @@
>   {
>       "2to3": {
> -        "cached": [],
> +        "summary": "Python automated Python 2 to 3 code translator",
> +        "rdepends": [
> +            "core"
> +        ],
>           "files": [
>               "${bindir}/2to3-*",
>               "${libdir}/python${PYTHON_MAJMIN}/lib2to3"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python automated Python 2 to 3 code translator"
> +        "cached": []
>       },
>       "asyncio": {
> -        "cached": [],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/asyncio",
> -            "${libdir}/python${PYTHON_MAJMIN}/concurrent",
> -            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures"
> -        ],
> +        "summary": "Python Asynchronous I/",
>           "rdepends": [
>               "compression",
>               "core",
> @@ -32,14 +27,17 @@
>               "threading",
>               "unixadmin"
>           ],
> -        "summary": "Python Asynchronous I/"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/asyncio",
> +            "${libdir}/python${PYTHON_MAJMIN}/concurrent",
> +            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures"
> +        ],
> +        "cached": []
>       },
>       "audio": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/chunk.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sndhdr.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sunau.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
> +        "summary": "Python Audio Handling",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/chunk.py",
> @@ -49,33 +47,28 @@
>               "${libdir}/python${PYTHON_MAJMIN}/sunau.py",
>               "${libdir}/python${PYTHON_MAJMIN}/wave.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python Audio Handling"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/chunk.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sndhdr.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sunau.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
> +        ]
>       },
>       "codecs": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/xdrlib.*.pyc"
> +        "summary": "Python codec",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecodec.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/xdrlib.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python codec"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/xdrlib.*.pyc"
> +        ]
>       },
>       "compile": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
> -        ],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
> -        ],
> +        "summary": "Python bytecode compilation support",
>           "rdepends": [
>               "asyncio",
>               "compression",
> @@ -91,16 +84,21 @@
>               "threading",
>               "unixadmin"
>           ],
> -        "summary": "Python bytecode compilation support"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
> +        ]
>       },
>       "compression": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipfile.*.pyc"
> +        "summary": "Python high-level compression support",
> +        "rdepends": [
> +            "core",
> +            "shell",
> +            "unixadmin"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
> @@ -113,87 +111,18 @@
>               "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
>               "${libdir}/python${PYTHON_MAJMIN}/zipfile.py"
>           ],
> -        "rdepends": [
> -            "core",
> -            "shell",
> -            "unixadmin"
> -        ],
> -        "summary": "Python high-level compression support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipfile.*.pyc"
> +        ]
>       },
>       "core": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
> -            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
> -            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
> -            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
> -        ],
> +        "summary": "Python interpreter and core modules",
> +        "rdepends": [],
>           "files": [
>               "${bindir}/python*[!-config]",
>               "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
> @@ -296,13 +225,86 @@
>               "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
>               "${libdir}/python${PYTHON_MAJMIN}/weakref.py"
>           ],
> -        "rdepends": [],
> -        "summary": "Python interpreter and core modules"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
> +        ]
>       },
>       "crypt": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
> +        "summary": "Python basic cryptographic and hashing support",
> +        "rdepends": [
> +            "core",
> +            "math",
> +            "stringold"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
> @@ -312,81 +314,79 @@
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
>           ],
> -        "rdepends": [
> -            "core",
> -            "math",
> -            "stringold"
> -        ],
> -        "summary": "Python basic cryptographic and hashing support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
> +        ]
>       },
>       "ctypes": {
> -        "cached": [],
> +        "summary": "Python C types support",
> +        "rdepends": [
> +            "core"
> +        ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/ctypes",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes_test.*.so"
>           ],
> +        "cached": []
> +    },
> +    "curses": {
> +        "summary": "Python curses support",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python C types support"
> -    },
> -    "curses": {
> -        "cached": [],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/curses",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses_panel.*.so"
>           ],
> +        "cached": []
> +    },
> +    "datetime": {
> +        "summary": "Python calendar and time support",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python curses support"
> -    },
> -    "datetime": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
> -        ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
>               "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
>               "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
>           ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
> +        ]
> +    },
> +    "db": {
> +        "summary": "Python file-based database support",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python calendar and time support"
> -    },
> -    "db": {
> -        "cached": [],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/dbm",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_dbm.*.so"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python file-based database support"
> +        "cached": []
>       },
>       "debugger": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
> -        ],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
> -        ],
> +        "summary": "Python debugger",
>           "rdepends": [
>               "core",
>               "pprint",
>               "shell",
>               "stringold"
>           ],
> -        "summary": "Python debugger"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
> +        ]
>       },
>       "dev": {
>           "cached": [],
> @@ -411,26 +411,16 @@
>           "summary": "Python development package"
>       },
>       "difflib": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
> -        ],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
> -        ],
> +        "summary": "Python helpers for computing deltas between objects",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python helpers for computing deltas between objects"
> -    },
> -    "distutils": {
> -        "cached": [],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/distutils"
> -        ],
> -        "rdepends": [
> -            "core"
> +            "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
>           ],
> -        "summary": "Python Distribution Utilities"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
> +        ]
>       },
>       "distutils-staticdev": {
>           "cached": [
> @@ -444,13 +434,18 @@
>           ],
>           "summary": "Python distribution utilities (static libraries)"
>       },
> -    "doctest": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
> +    "distutils": {
> +        "summary": "Python Distribution Utilities",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
> +            "${libdir}/python${PYTHON_MAJMIN}/distutils"
>           ],
> +        "cached": []
> +    },
> +    "doctest": {
> +        "summary": "Python framework for running examples in docstrings",
>           "rdepends": [
>               "core",
>               "debugger",
> @@ -461,16 +456,15 @@
>               "stringold",
>               "unittest"
>           ],
> -        "summary": "Python framework for running examples in docstrings"
> -    },
> -    "email": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
> -        ],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/email",
> -            "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
> +            "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
>           ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
> +        ]
> +    },
> +    "email": {
> +        "summary": "Python email support",
>           "rdepends": [
>               "core",
>               "crypt",
> @@ -479,74 +473,82 @@
>               "math",
>               "netclient"
>           ],
> -        "summary": "Python email support"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/email",
> +            "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
> +        ]
>       },
>       "fcntl": {
> -        "cached": [],
> +        "summary": "Python's fcntl interface",
> +        "rdepends": [
> +            "core"
> +        ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
>           ],
> +        "cached": []
> +    },
> +    "gdbm": {
> +        "summary": "Python GNU database support",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python's fcntl interface"
> -    },
> -    "gdbm": {
> -        "cached": [],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_gdbm.*.so"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python GNU database support"
> +        "cached": []
>       },
>       "html": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/formatter.*.pyc"
> +        "summary": "Python HTML processing support",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/formatter.py",
>               "${libdir}/python${PYTHON_MAJMIN}/html"
>           ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/formatter.*.pyc"
> +        ]
> +    },
> +    "idle": {
> +        "summary": "Python Integrated Development Environment",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python HTML processing support"
> -    },
> -    "idle": {
> -        "cached": [],
>           "files": [
>               "${bindir}/idle*",
>               "${libdir}/python${PYTHON_MAJMIN}/idlelib"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python Integrated Development Environment"
> +        "cached": []
>       },
>       "image": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imghdr.*.pyc"
> +        "summary": "Python graphical image handling",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/colorsys.py",
>               "${libdir}/python${PYTHON_MAJMIN}/imghdr.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python graphical image handling"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imghdr.*.pyc"
> +        ]
>       },
>       "io": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
> +        "summary": "Python low-level I/O",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "crypt",
> +            "math",
> +            "netclient",
> +            "shell",
> +            "unixadmin"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
> @@ -559,46 +561,39 @@
>               "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
>               "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
>           ],
> -        "rdepends": [
> -            "compression",
> -            "core",
> -            "crypt",
> -            "math",
> -            "netclient",
> -            "shell",
> -            "unixadmin"
> -        ],
> -        "summary": "Python low-level I/O"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
> +        ]
>       },
>       "json": {
> -        "cached": [],
> +        "summary": "Python JSON support",
> +        "rdepends": [
> +            "core"
> +        ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/json",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_json.*.so"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python JSON support"
> +        "cached": []
>       },
>       "logging": {
> -        "cached": [],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/logging"
> -        ],
> +        "summary": "Python logging support",
>           "rdepends": [
>               "core",
>               "stringold"
>           ],
> -        "summary": "Python logging support"
> -    },
> -    "mailbox": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
> -        ],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
> +            "${libdir}/python${PYTHON_MAJMIN}/logging"
>           ],
> +        "cached": []
> +    },
> +    "mailbox": {
> +        "summary": "Python mailbox format support",
>           "rdepends": [
>               "core",
>               "crypt",
> @@ -611,46 +606,51 @@
>               "netclient",
>               "stringold"
>           ],
> -        "summary": "Python mailbox format support"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
> +        ]
>       },
>       "math": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
> +        "summary": "Python math support",
> +        "rdepends": [
> +            "core",
> +            "crypt"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/random.py"
>           ],
> -        "rdepends": [
> -            "core",
> -            "crypt"
> -        ],
> -        "summary": "Python math support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
> +        ]
>       },
>       "mime": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uu.*.pyc"
> +        "summary": "Python MIME handling APIs",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
>               "${libdir}/python${PYTHON_MAJMIN}/uu.py"
>           ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uu.*.pyc"
> +        ]
> +    },
> +    "mmap": {
> +        "summary": "Python memory-mapped file support",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python MIME handling APIs"
> -    },
> -    "mmap": {
> -        "cached": [],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/mmap.*.so"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python memory-mapped file support"
> +        "cached": []
>       },
>       "modules": {
>           "cached": [],
> @@ -713,27 +713,31 @@
>           "summary": "All Python modules"
>       },
>       "multiprocessing": {
> -        "cached": [],
> +        "summary": "Python multiprocessing support",
> +        "rdepends": [
> +            "core"
> +        ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/multiprocessing"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python multiprocessing support"
> +        "cached": []
>       },
>       "netclient": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
> +        "summary": "Python Internet Protocol clients",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "crypt",
> +            "ctypes",
> +            "datetime",
> +            "email",
> +            "io",
> +            "math",
> +            "mime",
> +            "shell",
> +            "stringold",
> +            "unixadmin"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/base64.py",
> @@ -750,54 +754,48 @@
>               "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>               "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
>           ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
> +        ]
> +    },
> +    "netserver": {
> +        "summary": "Python Internet Protocol servers",
>           "rdepends": [
>               "compression",
>               "core",
>               "crypt",
> -            "ctypes",
>               "datetime",
>               "email",
> +            "html",
>               "io",
>               "math",
>               "mime",
> +            "netclient",
>               "shell",
>               "stringold",
>               "unixadmin"
>           ],
> -        "summary": "Python Internet Protocol clients"
> -    },
> -    "netserver": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgi.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
> -        ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/cgi.py",
>               "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
>           ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgi.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
> +        ]
> +    },
> +    "numbers": {
> +        "summary": "Python number APIs",
>           "rdepends": [
> -            "compression",
> -            "core",
> -            "crypt",
> -            "datetime",
> -            "email",
> -            "html",
> -            "io",
> -            "math",
> -            "mime",
> -            "netclient",
> -            "shell",
> -            "stringold",
> -            "unixadmin"
> -        ],
> -        "summary": "Python Internet Protocol servers"
> -    },
> -    "numbers": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/_pydecimal.py",
> @@ -806,17 +804,17 @@
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python number APIs"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
> +        ]
>       },
>       "pickle": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
> +        "summary": "Python serialisation/persistence support",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/_compat_pickle.py",
> @@ -825,54 +823,55 @@
>               "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
>               "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python serialisation/persistence support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
> +        ]
>       },
>       "pkgutil": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc"
> +        "summary": "Python package extension utility support",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python package extension utility support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc"
> +        ]
>       },
>       "plistlib": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
> -        ],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
> -        ],
> +        "summary": "Generate and parse Mac OS X .plist files",
>           "rdepends": [
>               "core",
>               "datetime",
>               "xml"
>           ],
> -        "summary": "Generate and parse Mac OS X .plist files"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
> +        ]
>       },
>       "pprint": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
> +        "summary": "Python pretty-print support",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python pretty-print support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
> +        ]
>       },
>       "profile": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
> +        "summary": "Python basic performance profiling support",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
> @@ -880,57 +879,58 @@
>               "${libdir}/python${PYTHON_MAJMIN}/profile.py",
>               "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python basic performance profiling support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
> +        ]
>       },
>       "pydoc": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
> +        "summary": "Python interactive help support",
> +        "rdepends": [
> +            "core",
> +            "netclient",
> +            "pkgutil"
>           ],
>           "files": [
>               "${bindir}/pydoc*",
>               "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>               "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
>           ],
> -        "rdepends": [
> -            "core",
> -            "netclient",
> -            "pkgutil"
> -        ],
> -        "summary": "Python interactive help support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
> +        ]
>       },
>       "resource": {
> -        "cached": [],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
> -        ],
> +        "summary": "Python resource control interface",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python resource control interface"
> -    },
> -    "runpy": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc"
> -        ],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/runpy.py"
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
>           ],
> +        "cached": []
> +    },
> +    "runpy": {
> +        "summary": "Python helper for locating/executing scripts in module namespace",
>           "rdepends": [
>               "core",
>               "pkgutil"
>           ],
> -        "summary": "Python helper for locating/executing scripts in module namespace"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/runpy.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc"
> +        ]
>       },
>       "shell": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc"
> +        "summary": "Python shell-like functionality",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "stringold",
> +            "unixadmin"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
> @@ -939,26 +939,16 @@
>               "${libdir}/python${PYTHON_MAJMIN}/shlex.py",
>               "${libdir}/python${PYTHON_MAJMIN}/shutil.py"
>           ],
> -        "rdepends": [
> -            "compression",
> -            "core",
> -            "stringold",
> -            "unixadmin"
> -        ],
> -        "summary": "Python shell-like functionality"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc"
> +        ]
>       },
>       "smtpd": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asynchat.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asyncore.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtpd.*.pyc"
> -        ],
> -        "files": [
> -            "${bindir}/smtpd.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/asynchat.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/asyncore.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/smtpd.py"
> -        ],
> +        "summary": "Python Simple Mail Transport Daemon",
>           "rdepends": [
>               "core",
>               "crypt",
> @@ -970,24 +960,34 @@
>               "netclient",
>               "stringold"
>           ],
> -        "summary": "Python Simple Mail Transport Daemon"
> +        "files": [
> +            "${bindir}/smtpd.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/asynchat.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/asyncore.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/smtpd.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asynchat.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asyncore.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtpd.*.pyc"
> +        ]
>       },
>       "sqlite3": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__",
> -            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dbapi2.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
> +        "summary": "Python Sqlite3 database support",
> +        "rdepends": [
> +            "core",
> +            "datetime"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dbapi2.py",
>               "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dump.py"
>           ],
> -        "rdepends": [
> -            "core",
> -            "datetime"
> -        ],
> -        "summary": "Python Sqlite3 database support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dbapi2.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
> +        ]
>       },
>       "sqlite3-tests": {
>           "cached": [],
> @@ -1001,41 +1001,41 @@
>           "summary": "Python Sqlite3 database support tests"
>       },
>       "stringold": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
> +        "summary": "Python string APIs [deprecated]",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/string.py"
>           ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
> +        ]
> +    },
> +    "syslog": {
> +        "summary": "Python syslog interface",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python string APIs [deprecated]"
> -    },
> -    "syslog": {
> -        "cached": [],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/syslog.*.so"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python syslog interface"
> +        "cached": []
>       },
>       "terminal": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
> +        "summary": "Python terminal controlling support",
> +        "rdepends": [
> +            "core",
> +            "io"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/pty.py",
>               "${libdir}/python${PYTHON_MAJMIN}/tty.py"
>           ],
> -        "rdepends": [
> -            "core",
> -            "io"
> -        ],
> -        "summary": "Python terminal controlling support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
> +        ]
>       },
>       "tests": {
>           "cached": [],
> @@ -1049,11 +1049,9 @@
>           "summary": "Python tests"
>       },
>       "threading": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dummy_threading.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
> +        "summary": "Python threading & synchronization support",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
> @@ -1061,40 +1059,37 @@
>               "${libdir}/python${PYTHON_MAJMIN}/dummy_threading.py",
>               "${libdir}/python${PYTHON_MAJMIN}/queue.py"
>           ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dummy_threading.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
> +        ]
> +    },
> +    "tkinter": {
> +        "summary": "Python Tcl/Tk bindings",
>           "rdepends": [
>               "core"
>           ],
> -        "summary": "Python threading & synchronization support"
> -    },
> -    "tkinter": {
> -        "cached": [],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python Tcl/Tk bindings"
> +        "cached": []
>       },
>       "typing": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
> +        "summary": "Python typing support",
> +        "rdepends": [
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/typing.py"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python typing support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
> +        ]
>       },
>       "unittest": {
> -        "cached": [],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/unittest",
> -            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
> -            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
> -        ],
> +        "summary": "Python unit testing framework",
>           "rdepends": [
>               "core",
>               "difflib",
> @@ -1103,45 +1098,50 @@
>               "shell",
>               "stringold"
>           ],
> -        "summary": "Python unit testing framework"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/unittest",
> +            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
> +            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
> +        ],
> +        "cached": []
>       },
>       "unixadmin": {
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
> +        "summary": "Python Unix administration support",
> +        "rdepends": [
> +            "core",
> +            "io"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/getpass.py",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/nis.*.so"
>           ],
> -        "rdepends": [
> -            "core",
> -            "io"
> -        ],
> -        "summary": "Python Unix administration support"
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
> +        ]
>       },
>       "xml": {
> -        "cached": [],
> +        "summary": "Python basic XML support",
> +        "rdepends": [
> +            "core"
> +        ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_elementtree.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/pyexpat.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/xml"
>           ],
> -        "rdepends": [
> -            "core"
> -        ],
> -        "summary": "Python basic XML support"
> +        "cached": []
>       },
>       "xmlrpc": {
> -        "cached": [],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
> -            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
> -        ],
> +        "summary": "Python XML-RPC support",
>           "rdepends": [
>               "core",
>               "xml"
>           ],
> -        "summary": "Python XML-RPC support"
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
> +            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
> +        ],
> +        "cached": []
>       }
>   }

