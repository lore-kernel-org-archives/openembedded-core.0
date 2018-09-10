Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 11864 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Sep 2018 23:30:13 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0044.outbound.protection.outlook.com [104.47.36.44])
	by mail.openembedded.org (Postfix) with ESMTP id 946D679717
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 23:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/iSR+VIIYcsrlPphc81a8R2Ga9PKsn/clu5FBv5a9eg=;
	b=gRe2sZLL4vMTZJG6alvKM1qORf1owDfqMlcYv5Gx2CU6gm3gfZgocXoRIFCEHehOV1a3r9guDWNqC850vRaisygD3ERMk9k3PCygJ6CUO0uDAj4tbV+Th3LCvhRQ8dnXlS4pWgC3rxjWv3ABpsxlQ3cYr/4OVswV59lpZ68CtPE=
Received: from BN7PR02CA0031.namprd02.prod.outlook.com (2603:10b6:408:20::44)
	by BL2PR02MB500.namprd02.prod.outlook.com (2a01:111:e400:c2e::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.17;
	Mon, 10 Sep 2018 19:56:53 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by BN7PR02CA0031.outlook.office365.com
	(2603:10b6:408:20::44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1122.16 via
	Frontend Transport; Mon, 10 Sep 2018 19:56:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1122.15
	via Frontend Transport; Mon, 10 Sep 2018 19:56:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fzSIm-0006jS-8z for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2018 12:56:52 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fzSIh-0007tg-5c for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2018 12:56:47 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8AJukiw024693 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 12:56:46 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1fzSIg-0007tc-HM
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2018 12:56:46 -0700
To: <openembedded-core@lists.openembedded.org>
References: <CALLMt=r-i5AhyYaXon9na0NSky3cvph9ZpbGx0ogeuzOh8pB=w@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <cdbda904-0107-751a-a091-e0caf9e12fb2@xilinx.com>
Date: Mon, 10 Sep 2018 12:56:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=r-i5AhyYaXon9na0NSky3cvph9ZpbGx0ogeuzOh8pB=w@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(438002)(199004)(189003)(63266004)(31696002)(486006)(126002)(2616005)(65806001)(65956001)(26005)(476003)(77096007)(47776003)(230700001)(31686004)(186003)(426003)(106466001)(2351001)(305945005)(11346002)(446003)(336012)(6246003)(5660300001)(65826007)(53546011)(356003)(67846002)(2906002)(50466002)(6916009)(2486003)(76176011)(23676004)(316002)(81156014)(58126008)(64126003)(81166006)(36756003)(8676002)(8936002)(229853002)(106002)(478600001)(9786002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB500; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT058;
	1:jpE37NEOwKZnLcLJzdxkPw4n4e6eme0xyPFTrk+uILLCEO/w05TTkUT9iB5WItNsXOjWTfL3yHuuLInqwd9afNF2oiidiYBTNP3YkRJGOGtb2UCA9F/myiHkOeEOLgEV
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 592e8812-7c13-4df0-d424-08d617578dea
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL2PR02MB500; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB500;
	3:71+fDudX3QrYviZAXeNw4byR2K4ONioUhPEKJCiEliPbhosFpkl9IgA62hpu/qkseslCt0A2jZphKwIkMT9/HVkXpPa9bVpwUM6cR0haK/9KRWsYBE1Np6b+7IFL5Is5t4aqUWzQ/eairgnkil8Q9ky5XyShR3UoTcWbxgdlkIwCwJWqZSxriorWBnZb9z0VktSwnp6rU4VMQGBWA8zDtqf/kiI2knXq0uDJgaMGbDPMJQHaDCmzobd4lgkuHu5AuDnEP9UhN1j8DkJdYOoDfkjFZz6aMzoRjjIaybYrzoQJjg9a4bi86ZM1qhSkM1pEEytowDZ9brhJCo720k4H6ZJiwxpJs4xXepqeRcu/BBY=;
	25:NWA+4M/9BjP1+NL6V8cG/wfmHnO3tt/npVQbt+J+F+7IZXpV2AqtEJrpt8/v/VLZS2m2kiKJwYDvF8EC0h1Sy/XCcnq6e/FVR2qxPYi21OZedom4pJcxxasgQIVikXpfBEJV4RRqyovgSYwU1F0dhvPyGeUcIDdWW9BdvxAJrDqUV0tKeSkqLMraW+yja/1DRGD9pu+SD/58z+o3JcmTRKStC4XkZlyrc+WyNS4je1/Mm4xBoCakgaFqtorZjcqv88WuuRCL/Z/iXs6wg+KL+O9iiYJrhQ5xieh38dOcoO0RxgYWYX+Y93suqv7kJyMQJYSnRBDouIJ3kM5NDoXfug==
X-MS-TrafficTypeDiagnostic: BL2PR02MB500:
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB500;
	31:MMgphHOm1rA1QAgRrpWz0Jd5i5k3DEYHvY6oX7ksQKEGveStWPsu110n3ERxe9VQ5Ernw8I9Z9nfbErLFeAeFrbKeSHKZZe6NXIYxAYIaTiovUWx1lPAIfBbpmC5CQv0BDuP5siOTwzd1bP2BgJ0nNEa6MpzloeOkqvU33KZGUavJVVYCFWqoKhbe8J18Qzq5U9Jw7JmVhVXQEfV7Om1RMgTn9SlWvgVuTdlg5xTDXA=;
	20:+gk7A4j5VgmT/mizI/c0HX98XQv4Vxkw1Z7Nfaowh09RdmbjzXHyeYzvwKcuUSD25hQ/3QsUQbggVOwfuyxI/9c7OYoWmox/lFaaHtOWiv2ScnVY3tyQhWFDBwvUGvWOOTRx0NgddJ2z9JcaB2+7n/aIXpOZtVSQVSKGPgUTgvjcPS/jsjM/qIlaaKCdOENQgdqbq1uqKerpXMFoMuIMk1BDQMOhXTHsNX8Nzb2ckWSiNdnF9ZCidigOftsCeK/C69+u07l2S9ZqAFgxmM7W190uLWvcI7VqvYW9KpdIKCh9dL3QXX/wrdOEZGj2SLMtGC2Z+UPd2aCSvpTxZjPk4rl2jvnQ/R8xiFt6DeeJPnC64C7b+boXQCMxjOE+K+5ATuzURQBzEEgQh0Sx0IpJuXyj7EbTYZHF5laLaO5hGN3/XyFhR0y7WxYp2AiY7qqfVU+KJ1KUwu9YMp0xzKD9JDLKRPDxOK5yPH6JDIXHruCo5cPO8lIaLjCB30aQXsHG
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL2PR02MB500A45CA39DF8EB9962BA01AC050@BL2PR02MB500.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201708071742011)(7699050);
	SRVR:BL2PR02MB500; BCL:0; PCL:0; RULEID:; SRVR:BL2PR02MB500; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB500;
	4:7VRNoi0YBE7Ih4ban53TIZf9AzQ/ug2OM789nT8MYuTPwpKliAyFZ1RdKGmA7GWLI3Z0i9aLDh2RZBAszehhPYFmFOGhf88VF3J0nSfQNK292rvrA7rvFqqd3IMUW1unh/kGWD1h34JA7Ty21GodR7GlqFpB/ay5XHSlGbyZPSVrEg8vJOBGlKrB/ADjSldOi+iPKgU6tBq/23SdnXHZt1LR3dqcbFvBR1+8kP89N5iojFK3vyipSbHMlwYtdcc2qqUcL8ll5byhMEX/cJBdSw==
X-Forefront-PRVS: 07915F544A
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJQUjAyTUI1MDA7MjM6R0FyN0taT0MwWnpKVXdCK1FCZTUwdTlLR3NE?=
	=?utf-8?B?UTduRU5sblN5SDZrd2NOQlpZaFJqK2QwOUFkeVk4L0R6SVU1WFBneVVKT1lP?=
	=?utf-8?B?QlJrY3hpOEowdzA1VzRJaG5aQ0w5SS9oNldmZTgrQUp5YTlMd21HRDlIS2Vy?=
	=?utf-8?B?QnBidTBVd0NuQkRXZ1pYNmkvVDF3Y2lpQ0VwWGpKRGhpdG9iRXQzNnUrcUZt?=
	=?utf-8?B?UU1wZTZvNXpiZHFCcUN0TFVjaHZVbkZVZkdhSTBIRllYVHN5amFpcDVrekJs?=
	=?utf-8?B?ajJ5TE5wSm5nQU5HMzBkQUcrUDZEbklPc2NNWVRxTEdVMVpFQ3ZZaVRpTEZt?=
	=?utf-8?B?aEFSNDNWeDV6N25mTmtESEdoMG9mNjNNV0xDNDg3L3lSVzBuODBOMzM5cWhU?=
	=?utf-8?B?emc5SHJESzYwUjVUclBXa28rYmtPVjlkR3RCM2pNUG5GaCttWjJPMkpidjRJ?=
	=?utf-8?B?OVlYR0VqaTVVcW0xODRJWDRBYndRNWZsMzZ4UU5qTTAvSW5TSU5jZDA3K2Vp?=
	=?utf-8?B?ak5ObUd0cUZhZzJ2T0lxV1B5ZDB6OTdYWnYzRFF2WVNRWWgyalI5SHhSY3Jq?=
	=?utf-8?B?Zm8yQ2lpdWZQRGlxak1JLzZDR1B1RDNWalBxOW0wS2htWHlUOHExOEhodWtj?=
	=?utf-8?B?Q3dvTC9VMmNxNWl5c0VQbEZ2UW04Y2xkTHR0bXlwNE9tYmRjdGh6akFWQlNX?=
	=?utf-8?B?SEd6d0VrY3Zjck9Qekl6bEdaU2kwVGNjekE3c3I2Z3F6QnZ6R1dLQy9zeGRo?=
	=?utf-8?B?WTdNQU5TWGpIRzhqT2lIbFVmVUxtU25iTkVZaDYwY1QrR1M4eFYvK0FkVlJE?=
	=?utf-8?B?eEhLODZMUmNXK0pacHFvdzFJd09UVkJuYks3NEIwVUtmb25sNHpkTk82dytL?=
	=?utf-8?B?UGw1NlZwcy9FdlZ2U0gxNXgzRDhFd3JGYlFwSWVZcWw2K1dDQXIzMytpU20w?=
	=?utf-8?B?d3pTdmgzWTBKdDJyc0xlV2NDZ0N5UWV4S2t2KzcwWUk2eTNYa2RnZkJnUEZX?=
	=?utf-8?B?OUt1M3U2c0loOWFMZmJFS3RlNTNuUmUzVzh1WjBQNUR4MTQzclJKVzFjclVX?=
	=?utf-8?B?SjZHT1dSZFFmeXhPZ0pmUTEraDVGdTdQdDFhTHljcEV1Y21mN2RKUGY2QXA2?=
	=?utf-8?B?WU5tdnVndG1iVTU4SWRwS0YvUkJ0WjZDWGVCWUNUL0hKNzd1R20rT1VoSysz?=
	=?utf-8?B?dXhuSGN3Y1h0N0kyU29YQmFpRC9yd3AwTDVoZTR5Y09PQko1VG0vbC90QU1n?=
	=?utf-8?B?bzdNcTBpN3dUeVFRVk9rYk41SW9kaEhKdUNPVjUxcU94SWhEc3ZpTDh0S0tH?=
	=?utf-8?B?Yy9YMGdIUG1rVkxQNUJPcmxXZ3FzZXBqV01CK2lCMTEvem02aHppVzZ4cVVH?=
	=?utf-8?B?SytSVVlaN1ExQnhQYjdndi9sU2lERmVqVE81YThhNGhrZnc3R3NEQkZUVkV0?=
	=?utf-8?B?TWhOUlhWaXNnblhYWTdNZis2N2pYNzdJV1VWRkhvSFJlcW93TitLNVErLzJ3?=
	=?utf-8?B?Z1dxMmNwbnYrZkRMeUlJNWVMa0VmVncycGowRHZxekNZQnJONXlFeHNlVFdK?=
	=?utf-8?B?aUhUc0hPbngyVUxFMU9Yc05UbUxwRFFReEhhRGU2NUtuOUNDNnJLSzg0UTVS?=
	=?utf-8?Q?GV/XM9NRIFBc7pSmEqt?=
X-Microsoft-Antispam-Message-Info: 9tDstCfOivtPrBKwEiEv9Gc/VFP2/0uTtpQxpq1tnDBb50GR/NwPmQVCtDhdGX4h+r8WDspkPtlYHUF1X5s/aDoSd2gLpnh/f5MOf2XkJkMFHVvkmK5eZ0bTms5yFVWcyFb9CVHPH1zMZ1t/MJZZNHiN1Dih20nJS/YjO3YHc1l+d2cbZ+Z6gJ+Fp+QSP8vudfNXwXFwr3OJQPAO+9mb6PtXXZWIzLoWzNXu2F1e73vV1Wp0JgJgROzXoPfSTNwy1018OPdEiFQIHjjFRj8OhoI/3zqouEme27iYx02U7hWiCVLzeJ/9L6luYonRByOxp3rqOI+Cp2jS7G7JVXaYYp2aE9/af07aPPRRtVNziBU=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB500;
	6:xGVpq4Rj34MKJgsokvUJMIqx1L1POZ98QmJtejSdAqj9n6y4TfauB72TmprFOkdVKG9JYNUzqYQMjrp7rb4SFnTHX509ODOf+DaSjZvhREx7qn5c5171ODwZVgTRpgkL384UXiZYsMxomlTA9HDzWbZnXjRUzzYFPnEdn7HX2qriXigRmXVk5Rk9/bDoomnFqyc3caK8/PskM07YAg3OYiXomlDgVexDAGpBwwhXhqmP9MS6Hw3f9v6qmvPzDzo1y5jzXhLGDXNlj+4T2fremxXltba6h84uxQUQdU2kSrW83btRP4Ks1kCkqqozPkqEpsD7BIasoH9reolEkAMRZ9aPcpmICuZZAFX67pYTyAyIrASNvRxaFJ5RNgnwv4c0+WBkOlymEM76JqHptBScwtvDLOGQsz0eah/FbsAvaZtHa0W/C6zG8+fUWuSVamCJYvc80fLIkRBMLdmeTjDqmw==;
	5:xeyZKpnyshBfzE+nnJsOvuRpc+EePLIoJI1fpW+3l7hE1LrEq74qGiLkaJGHM68WsZsRJEzSmpnj7fwm2WKO8C3N0NlO73V24X3d0KozTdZIE6OR9cIizdPq88pQurE/TYY1wF7P6gxACH/LBhX8Brv6QsGPUcusP7aIPtQeWsM=;
	7:eIhCTcwMbNDXb2OGM4cPRSwg/PR63y+DRt2yawNgGucdtzlITw3aVdxQ02s4eylensUc01o4CliF81eCoHOoBk7tA6AnfSV+cPKqcEagXweO9XTU2vlywl5j8zTsL91Nz7o9CX9JeL/YXb8ldS5AeJUh31TPZfGfVZ9JOKunfVSa4TOuUbpQ1BpuuAcAwBnQWyDxEeNQ593/KgSzyJQQ1F4hUBXN8dW3LyUUu0FOj8tnLFsbzQK6Tdg0wPZpojmm
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2018 19:56:52.6949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592e8812-7c13-4df0-d424-08d617578dea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB500
Subject: Re: python test files installed in image on purpose?
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
X-List-Received-Date: Mon, 10 Sep 2018 23:30:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Andrew,


I seem to remember some of them were required, both unittest and and 
sqlite3-tests can be removed from the python-modules package,

as for the others, you would need to remove them at do_install() , and I 
would not mind making it optional.


Cheers,

Alejandro


On 09/07/2018 12:02 PM, Andrew Geissler wrote:
> Hi,
>
> We've been running into some flash space issues over in the openbmc
> project. I noticed the python.bb file (python_2.7.14.bb for us) is
> installing some test folders/files in our rootfs image.
>
> # find /usr/lib/python2.7/ -name "test" -print
> /usr/lib/python2.7/ctypes/test
> /usr/lib/python2.7/email/test
>
> I'm looking to see if there's any functional reason these tests are
> included in the image.
>
> In our compressed filesystem we're talking about ~150KB of space but
> right now that's a pretty big deal for us. Would the community be
> interested in a patch to not install (or make it an option like is
> done with INCLUDE_PYCS) these test files?  Or is this something we
> should just handle in a .bbappend file for our distro?
>
> Here's a complete list of test directories in the python package.
> ./Python-2.7.14/Lib/bsddb/test
> ./Python-2.7.14/Lib/sqlite3/test
> ./Python-2.7.14/Lib/ctypes/test
> ./Python-2.7.14/Lib/unittest/test
> ./Python-2.7.14/Lib/lib-tk/test
> ./Python-2.7.14/Lib/email/test
>
> Thanks,
> Andrew


