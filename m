Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0077.outbound.protection.outlook.com [104.47.33.77])
	by mail.openembedded.org (Postfix) with ESMTP id DE2DE79274
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qZz84Xk3Y6rgK5ZSvOh/GMirpuyV1qeDCSHqq3jQsQo=;
	b=kgSKKbByA61eUu8VMcavhxFvHgheCqCch6ldBu/H5he7J+7qeRjwxkAD1hEZuGU48++m5CsfaWi5ABVpQT2cxqUw16744LepHuyhTWAkSy41E64aZRce+m+p/iVWuTaRU6x/gGkYDQeertU2hR3b0sOipSFZ7NpZ7GU2JW+8F4k=
Received: from BN6PR02CA0081.namprd02.prod.outlook.com (2603:10b6:405:60::22)
	by BYAPR02MB4758.namprd02.prod.outlook.com (2603:10b6:a03:4e::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1164.22;
	Wed, 26 Sep 2018 18:04:29 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by BN6PR02CA0081.outlook.office365.com
	(2603:10b6:405:60::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1164.20 via
	Frontend Transport; Wed, 26 Sep 2018 18:04:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1185.13
	via Frontend Transport; Wed, 26 Sep 2018 18:04:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g5EAm-0005GP-Cp; Wed, 26 Sep 2018 11:04:28 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g5EAh-0006hM-8m; Wed, 26 Sep 2018 11:04:23 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8QI4Mjg031908; Wed, 26 Sep 2018 11:04:22 -0700
Received: from [10.23.119.61] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g5EAg-0006hJ-FA; Wed, 26 Sep 2018 11:04:22 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180926115449.27766-1-ross.burton@intel.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <82c1c834-04d1-032b-1bb8-593c531bfc15@xilinx.com>
Date: Wed, 26 Sep 2018 10:58:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180926115449.27766-1-ross.burton@intel.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(438002)(3190300001)(189003)(199004)(2906002)(230700001)(36756003)(2616005)(316002)(31696002)(8936002)(65826007)(67846002)(6666003)(8676002)(81166006)(81156014)(110136005)(126002)(11346002)(58126008)(476003)(65806001)(229853002)(65956001)(446003)(47776003)(486006)(64126003)(2486003)(76176011)(106002)(34290500001)(23676004)(426003)(305945005)(336012)(356003)(6246003)(9786002)(3260700006)(63266004)(50466002)(106466001)(31686004)(186003)(53546011)(77096007)(5660300001)(26005)(478600001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4758; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT041;
	1:xV/gsAlUDlA93M6oTR7Qj86UckdbeH/xYs2xW/5jCyiDKeWnrKn7HkpHgIw9+OUZje6pGktRDBTWDteDerzPDv3U/uoZJlar+TuwfqMKBEQqlbN+1Jw0W7/Hst5R/c/J
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41a663d3-501a-42fd-70cb-08d623da80c4
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4758; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4758;
	3:CeoNXpFQIgAAmAz0tCyTmLuMKUN39x+Mn6ZA0/BhNOUxZhbSEm0yJEty6p4D/AnAsOI+2mEUvABJurLjIBKj9pznriDzxvNVfUvhm4hoUoxAJV3dDxa577x9TRJl0IbA0bLs4U/D0VGob7LWJ8PFTSEQsFBp2SHnhQRkv+uY0xWj6768VYx7NaHMCTM4wIqNtwjUOOBV/8zNdp/duAo8eiJtotkTp209AcE+51xZs3kgL6Uf2clJb9mDjfArDmM6ya6ghYSEWSik6e/9qJAxS377XWclQGlFmLoC9YKpS4mtIkLr+qEoXdzZGimCkn9iT7ryvufQVU5Wlq4wf5BszH8EH4SOCOoMQ7KYm/YQ5Os=;
	25:kFlynZp4y0anSb1VV+DRgF91TSkkcZu0l4gcwR3dUZH7NBUzGfaxjj4gbOX+31gPHLnMzTRkPWtvQxBDxrv0W4OVzIyJac4yGyYDVCA4sh/y04dlRWN/rzrmScHUHwadh8ASMowwaLVAzAoJfsuse9pZDwn8ChajJJIw2621q7Cv0A4U9UMlBoK9PFbqmlZcFHoxWRI7O+FQx8BJsCPz49Nafu4oj3XqoH+0MIWwdMOt0B26EYFOlpBmQsjRyBOIzznHWN/0HUTTP7I7Qlk7hCxAI8ua/qeQpAwdksdF/R4GCunnoAFOu6ZGEUeLzUJIqGczLNHIp3Q3Y4SUibkaaQ==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4758:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4758;
	31:+PeUTTarksS9pePp+OY0JVD9fI53RdCuTSlAsZLVxMJ05lXgdAX9xCJF6yrfIPlnYcdNJ19ZVP5vYBC6qBy2KWaxDSms79EUlK/Y8q7ypKU/MptFvNgAJ4qLNPcPZir8kClm4piVhs3lbzulkvSNCn+bG0XjdHgb0QKI8FqIaj0LixZn2YQsJmCUzBNkHRIt4K/zAoZlLG5jQQBnPM8p1RdVc8fO9TtkHg/sCZiYFHE=;
	20:hsaz6zXupkrQfmdQY2hL9jZGUuUeeAJdv5LhDPv8iaKEue5plCUb3VMcLPJIT3vw/HR842QmKl68mzikoeBV17KBBpzbuQc5y2SEiwQaVRZB6Z/RMVBjsCiyp5pzA9nJ3YC25i0jBrau8wUa/Wyr3Nebws5rFu3M/ZHm8DXdT/eDi5sRJQMtrxShl+SAne4GWSVtPkqgYpWro8JYANAVFaMQHRlvluufTX6QvBZX2xngiSsvBbfoPLhuHXks5p3uTzaugAcuFBmY6q93bULbPBI0wXE0GcdFKBE01GcIFvsAUhZAV2q0LbGaWLXBJOLKS2h3Xhz5D/Wk7vPtWLTJrfzPUiqddhjh7gf1IOyLo0VpGD7d5mFavLbtPeugyA6dCoGC6LPD/YmXgD6Y1p00ac00vQxWXcPGrH1Bx/7HKvBTJgJfSiMThPtsu68oVnA/3CfPYVAWbyTuOgogwzRLnkQqZ2QNi/b2TEJuEgXgkkv1EiO8qgCFPj1XR+o2Gwyw
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB4758E88DCC1BC36A96BBC595AC150@BYAPR02MB4758.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93004095)(3002001)(3231355)(944501410)(52105095)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
	SRVR:BYAPR02MB4758; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4758; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4758;
	4:SRL6XP34TYpGMgYnOeDF+pEEdDbwQ9gZW692O6lv+iH3jFF69b8G8C4oOb0DRJjVZAwk7d66JuIDdtGHdIfxc4zZLJpTEYiL3csioDpAmWTudw62hQT+1Bgg6Pc8RHxQCR16c01757iL1yAtpNiHxhaAE8q8hZFoaTgN1XQ8bJ2LxsYSKeuKD5mAFTPUE9xNh5304vbyKvcxkn0yGZL/2j207ck2PqOGqLaeZoo0js8wIK2u5xmRKVw3bnUsf+K3HME15VpTYjkwT8uJ66HxEwyGA80H2LzP5NXeTtqOYvCKf4LRoew2Qbn02o6XTMkA
X-Forefront-PRVS: 08076ABC99
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWUFQUjAyTUI0NzU4OzIzOjQybzZZMFE2QkpORUZScXNhekpLdGZHMlp1?=
	=?utf-8?B?ekswRXJqSDQrbGFoOEtOU1V6Q3BOb1NUQ0RWdU4zcit2REpzT1M4aHBBYyts?=
	=?utf-8?B?ekN4U3AxV3FXUVJZN3N0Qm9uVlhWQlF2eUN4MUUweURKSG1OUWd0M3ZFRVdT?=
	=?utf-8?B?SzhiNURIQzhuUlR1bzd6Y2owUlJpZlZ0L05CaCtnTDBFRm5QWUlKd2pMZDJn?=
	=?utf-8?B?SXlsa24rTTFRTHpuVVp5QUlOQ05YaFdMM3dLSVZpS2lzTEZ3ZEkzcitrQzhX?=
	=?utf-8?B?anVncHgrNDFkek54ajJXYlZtQUpLdkVpejdpbWdVbjU2WXgxUDVUZTBIcFp3?=
	=?utf-8?B?NXZJaCtndkMvdlZjdWpTb242dVErRktwNmxpeU1FVkpOZE1JYXJqT3NSNFBY?=
	=?utf-8?B?TGwxMXJWVDFLTnpBWk83L0Q0VXNvRnMzTjRhbzFtS1ZnZ1VaeTNpQlpCd1FS?=
	=?utf-8?B?WThxeWJNK0pqYk1CNVJxYkRQcEIzQmlDUy9VSWJhM3k2SGlOQWtmSXlNRlJT?=
	=?utf-8?B?MkJOdHpkaDFaeTk1UEMrQjFDVTRGZlNONlVsS1hoZDNIZy90VGp6bnJIRGlj?=
	=?utf-8?B?QlR0OERETGhoUTloamtRTWNhaGRiRXlVUGxqS3dKQUVxeHBaU0thaEdlY2Q0?=
	=?utf-8?B?MVpRdmpQVS84Ym5Oc0VuUGpXSExaY3RhSHhUQ1pvc21CRnhaV0pkaTNvU3c2?=
	=?utf-8?B?THdYcUgrQzl1MTJ3TWRSMWFCYXNZcDVyT1h6MDJQUUdMdElhc2crQXJUTVd3?=
	=?utf-8?B?L1dOakVtUjNYUndvN2VrZHFpTUtVU3M3Qm5HdTdJSUJHNVh1Zm0vNmd6Z0d2?=
	=?utf-8?B?VFJKc1dyVDZsUW1oT2xWM2R5Zjh0Y2FKcTVmb3FOb3NNL1ZEMzFDQnBoTmo4?=
	=?utf-8?B?VVZkSm5UdER2dktBSHhMMGZ6c1B5Ni9uMS9IYmNnam9ENjY3SVlxZWw3MFJE?=
	=?utf-8?B?LzdPMnBWdGwraXRPOWhldlFYQ2ozOVhCUDBLTnNMcUI0QldhYitXMFRIWGZx?=
	=?utf-8?B?bElWaktwTDQ4MWwyekowV095dVY0bVpOWFF5a01hU2t6YWcvd0FESU94VXNq?=
	=?utf-8?B?bVdxZURBWUp6M0pvcUhITVpXa0hyVllqQm9IOWFiSEZKMG80bkMvaGZUcUFq?=
	=?utf-8?B?bFcwb2xPdUVuYThlR210MGpMdFJ0RUQxUlZmZEJUaGtWTTNpUFg3MXVoaXdP?=
	=?utf-8?B?S1FFNEY2dlRFa0dBMFZzU0FzM3duU3JkMmlaWUd3aU5lLzBGK1o5N2hyVmdJ?=
	=?utf-8?B?Z2VTSmdubmpOdmhPMEs4NTlJZUZ6YkY4MGNVRWR5QXYwellTTkZFdVBudGlt?=
	=?utf-8?B?WC9VODFRTnhMemFBai9TQllFMEUwd3hPMmVMcnNwSEFGYm9IcWtxVld6VlVa?=
	=?utf-8?B?a2Y5SjBrWGUvWXY1ZGpWc1ZzeWl5R2dQUVJyeUxtOUFFNDRzWTliYW1aTndT?=
	=?utf-8?B?bGJKVWlyR054anJDT0VJRGx4SVBmUGY3Y3hwSmQ4SzVUcUdEME0xSzhXNEFI?=
	=?utf-8?B?K09OVUo1MEROb0JLeUdDbzNMZFMxcytXdlVkSjhuendhRlBOT2VadWRWUnNJ?=
	=?utf-8?B?NGx1QmRqWnlBbEQyaVdNT0pKbG9lbitRWjJvcHRFbmVpamxja3Arc1o3RDBY?=
	=?utf-8?B?NEhMTWhQcWFmeEpScm0zSWhyZnRKMWhRTWxONEFXYVFtOUJDSXMxWGgvcmhJ?=
	=?utf-8?B?dG9OOVVRUlgvMGhsUUVxRE9wc0NCQXBITi9yb0FPSG9xMG9qb2NHeC84Wi9l?=
	=?utf-8?B?clJpL21odVVvM0czemVDdz09?=
X-Microsoft-Antispam-Message-Info: VgJDgg7kbwDavb0Ds5QlNQ+iVxeN6jppJyEszZxDY/NnMXUh7gno18Z+fpTXF5+zJXGGgRKHn4qmwZ6s2gUsh0lOgE8dOeXIJiurljmDri/oSKJROt/dJNZU6/IJPcQ9z1wYkYdbqPT/LNIEGZMDqFE0CAr/G8mWqNUgS31fKtvTYMlY1uovpn7x6cKHM6vnqeMtQO1F5Leisrd/GZleSMBhgAbRAd/J53sOh1BjKYnoUNRcBnhCIPfumNMUXWyaekKLDgrIs3NYeR9zUpy5OI9EjwR1j0b0VZd0KvGFD2ximP1bwR3j3xLvNtPb7o+8QRJNMjx3T5yELjAf/1/SkZqU2Dzl+vVyRK0xDC6lFV8=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4758;
	6:+PQejScDE4kn5i1H126oenIqI3Vb878vsK30I3b4k+gdFxOmb7kqHf0kPVAurVWRLsi/Nqxt5x61dh+itZFcpS1BqOr0SNyd7nRUyON80SKAsSs0ieV+GLpoIySuth/xAOJKc9Gl1iyzHLM2Bu/t9ZLRLlA/srpnSH97p1kSlszRjS86ByoLP6pqMmxwmkmKpDkjG1D3hzOg4QAUe7EnhqZJYy87NmwbkkwhJnfTHa/JjKLWAD70rnu+Y7aTfnaiX6CcilY/f/UWTxEKGzAbzljozXAZuNH0GC43JItfQSm7TWmo8TfA4XGEe2SB67UdHgren9NDpx9Fpl82hrxx7OLPwFyVkninNzaPqQDfC+Y0ePoyirtOVFpA0Ib19P1Jcm7QxvGBdbxnhGtRCWLWbhXzoSKRbHpvLbCVojy8RM6bbraprAYCZrrTvn1TKAceCmQaKTt10SwBzoHwlgVqSQ==;
	5:v4smH9Y31/HqNsLIc1UMSSqCn3M/8kgX9UMSrZU0CYY62ROBJTUc+xLHpOo7MmJWYAJ1NhWL/fFRUk+zW2iPX6RrVY/p8/7w0y2xD+QUECgkX0XHb2EvOSTJDI3yaGJBjfGq+DCIBrPwwCJJm4eLJVBcsBKAeREPIBieurjn8kI=;
	7:h6w0XMjtXH3nrX/PEjV9v/dsUCuysstds7Q/ed3Kto+hj5uhX1CzDo4ifA+MnIHBezFVOa4kDjHPIts/nVLHPUgz3mKkrPICqnsfKETyIuFXBUw22Oh6ZnWwmKY4pdVj8JtzckQ9IIBIUTWnmwTiK4XcUpjt90GW8b/yzDh9U/yrWfCrV01NJkp6rHaHDvFwqVHyIn+9dQC9tKWY/KUVktEWJiYywPP/et1NT7WJjnc03lpjby5b63Vc6dF98hHS
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2018 18:04:28.8141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a663d3-501a-42fd-70cb-08d623da80c4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4758
Subject: Re: [PATCH] python: move sqlite module into python-sqlite
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
X-List-Received-Date: Wed, 26 Sep 2018 18:04:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Ross,

On 9/26/2018 4:54 AM, Ross Burton wrote:
> The module was accidentally included in python-misc.
>
> [ YOCTO #12933 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/python/python/python2-manifest.json | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
> index 1e7004e05ea..d3cf66214a3 100644
> --- a/meta/recipes-devtools/python/python/python2-manifest.json
> +++ b/meta/recipes-devtools/python/python/python2-manifest.json
> @@ -884,6 +884,7 @@
>               "core"
>           ],


I'm pretty sure this issue was caused because we had the sqlite3-tests 
package hence we couldnt include the sqlite3 directory on the sqlite3 
package, this should work fine now ( I think).

After editing the manifest you need to run the create_manifest task to 
check for new dependencies that we might have missed, e.g. the sqlite3 
package rdepends on datetime.

Cheers,

Alejandro


>           "files": [
> +            "${libdir}/python2.7/sqlite3/",
>               "${libdir}/python2.7/lib-dynload/_sqlite3.so"
>           ]
>       },

