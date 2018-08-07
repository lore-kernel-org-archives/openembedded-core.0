Return-Path: <JAEWON@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0073.outbound.protection.outlook.com [104.47.41.73])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3B97552F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 20:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=S7mGUNdmM8bSVR3E5IsMLk5HV1EpW0gc8xLjg0s1m50=;
	b=FqXLh0gSkHXZ9Qe+lSJ8hobYfkVpKuJirP88Lh1KmpKIXgJoFC+eUOq+HQqVRje5WQQhMAzAXdhfRhhBGBGX2yrYFRFY4wln/WypJVLXGq/eUQhZaZScb0UrUrS1bb1zwbz2H2sTzDq5iaPHWVDASzt3xbI70dVr8j0i+JudS2Q=
Received: from BN7PR02CA0015.namprd02.prod.outlook.com (2603:10b6:408:20::28)
	by CY4PR0201MB3508.namprd02.prod.outlook.com (2603:10b6:910:95::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1017.15;
	Tue, 7 Aug 2018 20:27:39 +0000
Received: from BL2NAM02FT037.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by BN7PR02CA0015.outlook.office365.com
	(2603:10b6:408:20::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.20 via
	Frontend Transport; Tue, 7 Aug 2018 20:27:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT037.mail.protection.outlook.com (10.152.77.11) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Tue, 7 Aug 2018 20:27:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54667
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fn8Zt-0000gp-Cm; Tue, 07 Aug 2018 13:27:37 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fn8Zo-0007um-8w; Tue, 07 Aug 2018 13:27:32 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w77KRVEa027321; Tue, 7 Aug 2018 13:27:31 -0700
Received: from [172.19.3.42] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fn8Zn-0007ud-C2; Tue, 07 Aug 2018 13:27:31 -0700
To: Nathan Rossi <nathan@nathanrossi.com>, Jaewon Lee <JAEWON@xilinx.com>
References: <20180802085504.15851-1-nathan@nathanrossi.com>
	<MWHPR02MB2768F151648844374BA8BF3BAF200@MWHPR02MB2768.namprd02.prod.outlook.com>
	<CA+aJhH0HwtVvAY3cLPfCapykLaqJi-Whi9=WdGMwgMgCVnq6Pg@mail.gmail.com>
From: Jaewon Lee <jaewon.lee@xilinx.com>
Message-ID: <ca10ec07-72df-fcbf-efb2-738dcdbabc43@xilinx.com>
Date: Tue, 7 Aug 2018 13:27:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CA+aJhH0HwtVvAY3cLPfCapykLaqJi-Whi9=WdGMwgMgCVnq6Pg@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(438002)(13464003)(199004)(189003)(486006)(67846002)(476003)(2486003)(44832011)(2616005)(229853002)(65826007)(5660300001)(305945005)(23676004)(50466002)(1720100001)(14444005)(126002)(8936002)(11346002)(81166006)(426003)(446003)(8676002)(81156014)(356003)(336012)(72206003)(65806001)(36386004)(6306002)(64126003)(6246003)(58126008)(4326008)(26005)(110136005)(186003)(31686004)(316002)(77096007)(2906002)(106002)(6636002)(478600001)(53546011)(106466001)(9786002)(2870700001)(76176011)(47776003)(31696002)(65956001)(63266004)(966005)(36756003)(107986001)(5001870100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0201MB3508;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT037;
	1:bT2lLfp0Kk9RQhxW/R2TxGzt0n+HDZ5QMX0cf4+opBEClgYVSOvZrY8LsjLLJG9hyA86vWW9xRQOIH15U0yl1DXbCsmjBqYoFM9ljNHVhtsO8V42fOpwGlEtKBnV4+vy
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75481bad-d920-41b8-d25a-08d5fca437cb
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CY4PR0201MB3508; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	3:CD5ryCxxmvmVh4mQDRE3bnnJKKAWHIxjJOpysfNRzBLyBwB2uaKYrASB8R0PgcOd0eadDRvtfTyx++f7NfIL1Dk2Z/qEkeera8apcedVUoUXkyoVRs4TZR+4nAnydzPoN7rw9/AUmhV0swpIWx94vrs5S8lSBjm0PT/aKygtsuebP7tIw9mB0XQ+CdsLfoyqCkLY2wMU5B8RZA1QOd+0x5ySbrsJOh9sttvR/16vhak8FboYVCe5lGfdNlzLVuYWtHb5XHHhLyGp7XesXQAFYB73syaR/Tewz8kmtqAqoHVgxT/dvg9luEE8NBKdAvJqrTMmG6+ow6lktgHoOo856dAU8+p4kLOy3aW6Wguw+E8=;
	25:yqRBavZrkBa9YWJGYiwbjxPhECXygpSBTg5yKpsgD9xU0dEyf9K+pYMBq+GCqInB78xGCGtxLO5geEdDdouREuHRkI6+qDIVADbRFAZ/xp4C1Mg7CTdTyk3tZaAS92AmkCSf5h1q1wYOZ+nf9gEjXe8qid9cCa2ce/W7TkpRRsjKILnN3GphH7GFC47kGQD5qeRqcu2RhDUhbGlHT9HSu14F/Brpqnb0InNiJP4L6m0fiPs5dMJSIuX3jZHRB2XYg1COsNyK/lme7KlesWY79lNP9psRICIuPfaHQqz7JKM57HrPXVT9XgM7TWE0oZcjsm1SNMn0mFI6g3ToyJ9qcw==
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3508:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	31:zImfQAWXKG9VbPqGMUZqAgjiQfGPnfS8iuzLWIpgfMzY0jIPyT0IFSj24Dvynvwaq2ecGBQPS+lZdNh28Kmnt+u061XhL0DdJkHR61aMqvzkIsM0qed5MKeVQU5LhH70Jtsc6y6QpDqjU9Og89W0EwPviBsNlkJ8rGjOsuAJWlhYJRXDj0N0uvvXVHZseOInvn+qFCARXksKDYynC/AUau+HZ3R0fk46uSuHqTfY9XY=;
	20:ChZFynQa6sMJx85M+0TTUrvyWQGZ3G+UdIiHYp5FgPNFP3BJTh7JFhGr41TEkw5ML5WhSO1yQEq+XXwTbOIPXbexU5VcqlLJIJZ245kRYl7cLPx5cRL6yBigUuVQ9vVf53EC0DL5qE1whlmQwqgeOhf/JwZw2P9gGfHxBDUQp3TaE0r5mhn/rkmNvGmncjaYMPuB2cB+LAVUcGcv47wIdACaFS9MTGtp/4/zWwGY91Ys1k1PWaWJ7SCK3JciQyt0cgLqxr0hwbvkiIxXI+QvAgM1BQyPNjVcnEB4hDEc5UxfpgNu7JulzWTjWcdj/HLtwNJN0ufzXmcYG5/8zvkAYpyMDMPVVVF2oJ9OyiH48XQZtGVDQh8XGgMsKI0ZPH2h9tedf4zeq3jgz8FyDgX3i64fkODaQRfh0SKmo6CKGs5U146oHPc3BSCjh8umkGmfCCubfffv1frXYW/vf90v8/LDEVS9qQTgFjmd2GDFxsQQdPVBwvn0q3GxkjOUBcNw
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR0201MB3508603AA8656D6F4F6C1B18AF270@CY4PR0201MB3508.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(264703809997249)(192813158149592); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231311)(944501410)(52105095)(10201501046)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR0201MB3508; BCL:0; PCL:0; RULEID:;
	SRVR:CY4PR0201MB3508; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	4:wKTD3c0b02BPMkMK1bwtc5HNLPoXjn9PhnrCMh9HB7jMRjH8LUf1U2TZYpGER+XldjZ1dumkmXz02Ck0KspGVuWiFxFhXMbE1uUY7lle/ITuDc1c0qbZmSwdHJ2YIogcT4bykZzMFXATFa3fpWFQ/FhQJmjlOJ5jMquOmt7SmyqhbW/yI9eigUeggivTKUrNqebbqdj801sbA0hW7hPRVb8gOGBOdLbmqDYyFW6GqILf9/u545HmUtm9a4fhheo3s36ANNU2pMuJQ/SQKKRRce6fr0tBHlT/p84Hmq0bE9e7J93+NOT/ThkMcgxRs6Q0vDnub0gbHLR47CZ09EP/z4MYdqkaYRGdfbAVc7GS10yvEZjfvDXrYFwWEruPkBXA
X-Forefront-PRVS: 0757EEBDCA
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAyMDFNQjM1MDg7MjM6MDRXUXB2dzZFMjF1MjMyK0V2ZWRwK281?=
	=?utf-8?B?SkhpK2xoeGM5aUZ1YTBMbEF1ZEY0RnNZbWl4SzFqYjhBZnR6dmRpK3BkL2wz?=
	=?utf-8?B?TVAweFlVUFVwLzV1NkdtMlFteFR3SmIydVdQelptcXhJTGVWaHptOXNSK0Q5?=
	=?utf-8?B?SFU1emZ3VXo0WWczN25TNll4MFpEUTlidDFrUVNDSWdyQVc2bFhvLzhuNHVs?=
	=?utf-8?B?Rk12VnNJaHgxOG01Y2E1Mjd6VlRRVExBY1dqZVJpWmFaYUF4OVJUa21wL2hq?=
	=?utf-8?B?ZjJQM0gwNGF1alFZTHFHQlNiQjlDYWY5UGlreWN5Y2hJd1VhV296c0sxNitN?=
	=?utf-8?B?U0ZRbHhUdG1lNmRxcG9CaElMaThSd1JZdDBiWHlwWHVIdkRNZFVyMHFoNG4v?=
	=?utf-8?B?NkkrWjNpUnhBTnVIY0hqRk0xcmRZNmxCV0ZvM3crY3E5OFc4N1oybkJlS0ZL?=
	=?utf-8?B?Q3hzS0prMHV3elVtQU1Ga2J0TUVhYnNkZWRTTkwyVHFXRWU2TTc5Qjhyb3Fw?=
	=?utf-8?B?WlYrNnlyamhyTDBsK3Nxb2Jib0tYaHpQOWpPUUo5TEptTmtlRldEMjVZYS8x?=
	=?utf-8?B?UkJ1S1BwVjFPQWV6SFdGRStwQWR0cnFrQWlQQ2tCZmZaMmNKa2p0aUdqWHF3?=
	=?utf-8?B?S3h5R2JZekNNVFU5YUkrZDNQRHRSWmd6RjlMMmFGeFpyK09wVzVBODM5ZndK?=
	=?utf-8?B?RmhCSnFSMXNGNWZYamRPMGhBWUQ5QVZvVmVFUGtic3RrVW1scExMV2dlaGN1?=
	=?utf-8?B?L3hRTVdaODhWV1ozL0piT0ovQ3Y0dGNtcHVqUlpQZHZWcVcrdlR0UXpDK2l0?=
	=?utf-8?B?SVF0eU5CTnZQNkpKM0lMUGJmOWxmTXo1MnV6dHJxMjVtTWg1ZmFjNW5uV0xW?=
	=?utf-8?B?NndQOHRjeDlBbGg4MHl0YU12SEZRcTBid1AvcFFTZkFub2N3VU9CS0tvSXpN?=
	=?utf-8?B?NlhVNGl2enMrc3dXTEw4KzhiampDdjR6UFRzbm11OEpjV0cwMUdFMWlld3RR?=
	=?utf-8?B?QW9ZNUt1aTZxWjdld1c0WVYzUlEwaGJPNG5ISjZCc2s2dG1IekJwT0ZCZGlQ?=
	=?utf-8?B?SnQ1dk4zYWx6ZVA5c1F4bXJMOFJXZXZ5dzV0bER0akR1NVFpcnlQNEN1WFo0?=
	=?utf-8?B?dWExeUpMZGNwNGFuMHpqaVY3RjFaRlRvTHA4aEZDdllGZ0x6MUI3Mk5MYjFv?=
	=?utf-8?B?WitNZENGSnRhZ3k1TzdjUjVYSjRYZlRjZkZGaEx2dHU0QTFtRVZjK2RqYzln?=
	=?utf-8?B?MmNhVmE1YllVVVpVVlVlT0tWMWIrUmc4Mm5qVjEzSXQxbTB0cmR5eUNBemYr?=
	=?utf-8?B?bnkxaEF4SzBDWjh2aVRraVczdncrdEIzb3VTMWdNWERDT0l6R2VyS253OUpa?=
	=?utf-8?B?WUhZaGxJRUhCanNlQlhJZGFRUTZHNW1RNHFVK1BQNjZTOEI0dnVmclRveE13?=
	=?utf-8?B?L2wvaTFoQzdyTWN0dTNpV2xLK0tGWU9FV1VybWFjeXVWbzFSOE5IeWJSODdI?=
	=?utf-8?B?RHJEQnp2M200Rk5zSUQyYW9KVTJWQmMwa2JwcFdnMkVodlRwZnZiVFRVNWFB?=
	=?utf-8?B?TmZnR3NWdVRTRW9vYk5oR1M2K2pKNHc1cFluVFZ5QlBIOHRDaWRFa3phME11?=
	=?utf-8?B?WVAwYkliQVdYQXdWSU9LMDRBVXJGdklRUEh3MFJTa2ZvODVMKy85TnErd2N1?=
	=?utf-8?B?TmFRc2VrZStnSGJnV0VJeGdwRXo0dmZSeWdpb2JwdTh2QzFnMzNqSXF0S0g3?=
	=?utf-8?B?YjlITUN5Ukhzd1kxMVhJSDlyV0FtbjFZTnlweGpKVGF3T3dpUitLcDRMVWxO?=
	=?utf-8?B?Yk5QTDhOR1R4UStNSGtrUGFnSGpTZUVIY0R5eTdMdG1rRDJZL1R0V1hqZXlQ?=
	=?utf-8?B?RDJqaWZoZDlWTEJMRHFLTVNna3RDRnhRYzZwanl0V1laVVpxTkZEUTdRT0pz?=
	=?utf-8?B?VWJ6RmhaRll4cDNiNkc1YTJDbUNWQWRkQndWb2F0MzR2RmpKNnV0WUdIMFpK?=
	=?utf-8?B?SUJMVkd5d01ITmtQYnBVdnlDckc5ZWw3SmdGK2d2OTlCeFBPWEtYaVJuVkk5?=
	=?utf-8?Q?FndXSvY5ZTghXL21tCdCMLVlEui?=
X-Microsoft-Antispam-Message-Info: TKIFy4qwrvXqx3WYn4s/g+z8WQXYmmfuCp7PHEA4RrY9dNO3ivligaVOc5fBm4I/5t/GCv3bJhlLZZZxipTlS59ijGNlftYUKqeTTco4RJE3xOVOGmcntEw5Menw1Xlxm5V2TmD3rDRFIuiBl7w+2kvsVZ94T721vBK8K8a8SIqLX2E8yL6Wp9RHSc0O1tRUn91j9Oxw+LFi3pEi4XYaBLe+8YpdtNgcLFrhNDqnShQXa8djZxQcIvSHm2+wf2Md6QgOO/CrQPpxwNQcto1b+Kqbdk+BB7FIvsEiArzCa0HEylzVaJGMIkb2DyiC5RQZdY0mGaZTE/L47S/71S17RqnrMoE5IBL01z6HNyxNfbM=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3508;
	6:rPTIh3nGVbgdeV5kontlSvU468i1vaI6rWjg0bs0+eBy+j7FhMK1OP+ZkuWr3kSG2lyJrTn6tZvkeGL7PpR5trEESvE7QenqO/Jq6G0JlDs8Hcx8qloe8XncHwGFYUvBeTm1VxgBtWIejAi65WKgae6VdFoTnalVQfydrUdE2LY7imUaLE5n4Q6umQYMwGggP6gPDCJnyr+BEKK4BNcMVUbQhbjmixK6dfz3gsk4UDfk/NsnyYde/yr4dg0bUfVwm494zwxMvpPYZ4u8WtmdKrKEUEKhzSokuYNohpK5ervlLGhRjp/X7rw7h3Q/ilrpogHcs1sTIGkAoHFFRgaDFAGYPtaQWgztvnRmsbab2KCohp27WimdtTGeo+Q21cM76VYmfed23mmABY4w92NnGZS9bUfLpgez2KKzU4d/8m7eIcakZq1txMdzwKfJD0EV4vthkufaTMJrqGK78zKH4Q==;
	5:K13g7Q3gNZ9sZU9vLjo8r38OKXOHyGoGEyMlbjU14zPG86E8u/xIYFcNuiifrDq7OqUT83WDEvfrXESTSVbpE0dxOJQvoWDlxL7dQv4bTPTLJKR31P80hoYp0iyjzuMfvS15NY+g6HFTy0z7bCeAGHbJAo/XdiZar9kDEd6WsPA=;
	7:X7gYusWB/MHGxIxadQPBUhQBH173Ptt2KGnA9wJGX6fZN/fQo86eXFtgmbuGz6CL9ZtodNqNmuqXVNlj0KLSDg7kZuhxhhezHQfTG91g3kPAxaXxPp1AX17ThhnLqepPNO1xzd+OZpcCNlTlOtfdP07sl6UN+ycGMMKQ480kCPoTQ4u5bLCuo61rCMIGCKqapcKuea2Gy9XnlBeadPxtOTXy1/q3fiGy6LRGntGzEXo70uawRyVVbGd2fog1Ef6/
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2018 20:27:37.9671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75481bad-d920-41b8-d25a-08d5fca437cb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3508
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devicetree.bbclass: User/BSP device tree source compilation class
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
X-List-Received-Date: Tue, 07 Aug 2018 20:43:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Nathan,


On 08/07/2018 04:59 AM, Nathan Rossi wrote:
> On 7 August 2018 at 07:16, Jaewon Lee <JAEWON@xilinx.com> wrote:
>> Hi Nathan,
>>
>> What do you think about adding support for dts include files as well (.dtsi)?
> Hi Jaewon,
>
> Device tree include files already work with the implementation in this
> patch. The default include path is the same as the path of the dts
> files, so if you use "/include/ "<dtsi>.dtsi";" (dtc) or "#include
> <dtsi.dtsi>" (preprocessor) it will search within the DT_FILES_PATH
> (which is WORKDIR by default) and then the KERNEL_INCLUDE paths.
> Though if the dtsi is in another path you can add it to DT_INCLUDE,
> and it will be searched.
If i'm understanding correctly, this flow just supports compiling a dts 
file that has a plugin tag (it can include dtsi files)
in short I can't compile the dtsi file itself to a dtbo
> Does this cover the support you are after or is there another
> configuration you would like it to support?
Yes for us, if dt overlays are enabled, we don't include a dtsi in the 
base dts and compile that dtsi separately as a dtbo which is loaded later.
so would be great to loop through all dtsi files as well and compile if 
it has a plugin tag.

Your thoughts?

Thanks,
Jaewon

>
> Thanks,
> Nathan
>
>> Thanks,
>> Jaewon
>>
>>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Nathan Rossi
>> Sent: Thursday, August 2, 2018 1:55 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] devicetree.bbclass: User/BSP device tree source compilation class
>>
>> This bbclass implements the device tree compilation for user provided device trees. In order to use this class, it should be inherited in a BSP recipe which provides the sources. The default setup enables inclusion of kernel device tree sources (though can be disabled by the recipe by overriding DT_INCLUDE or KERNEL_INCLUDE).
>>
>> This provides an additional mechanism for BSPs to provide device trees and device tree overlays for their target machines. Whilst still enabling access to the kernel device trees for base SoC includes and headers.
>>
>> This approach to providing device trees has benefits for certain use cases over patching the device trees into the kernel source.
>>
>> * device trees are separated from kernel source, allows for selection of kernel and or kernel versions without needing to explicitly patch the kernel (or appending to the kernel recipes).
>>
>> * providing device trees from separate sources, from the layer, generated by the recipe or other recipes.
>>
>> This class also implements some additional features that are not available in the kernel-devicetree flow. This includes population of device tree blobs into the sysroot which allows for other recipes to consume built dtbs (e.g. U-Boot with EXT_DTB compilation), device tree overlay compilation and customizing DTC compilation args (boot cpu/padding/etc.).
>>
>> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>> Acked-by: Martin Hundebøll <mnhu@prevas.dk>
>> ---
>> In addition to this patch I have written some documentation for the Yocto BSP guide that covers details about both methods.
>>
>> The meta-xilinx layer has a recipe (device-tree.bb) that behaves exactly like this class for some time. It has been very useful for out-of-kernel device tree compilation as well as for a mechanism so that users of Xilinx SoCs can provide their customizations (FPGA devices) and board specific configuration. This compilation flow also makes sense for other BSPs, which is the reason for creating this bbclass for common shared use by other BSPs.
>>
>> Examples of this classes usage can be seen for meta-xilinx:
>> https://github.com/nathanrossi/meta-xilinx/blob/nrossi/devicetree-classify/meta-xilinx-bsp/recipes-bsp/device-tree/device-tree.bb
>> ---
>>   meta/classes/devicetree.bbclass | 140 ++++++++++++++++++++++++++++++++
>>   1 file changed, 140 insertions(+)
>>   create mode 100644 meta/classes/devicetree.bbclass
>>
>> diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass new file mode 100644 index 0000000000..dbc83f2a1d
>> --- /dev/null
>> +++ b/meta/classes/devicetree.bbclass
>> @@ -0,0 +1,140 @@
>> +# This bbclass implements device tree compliation for user provided
>> +device tree # sources. The compilation of the device tree sources is
>> +the same as the kernel # device tree compilation process, this includes
>> +being able to include sources # from the kernel such as soc dtsi files
>> +or header files such as gpio.h. In # addition to device trees this
>> +bbclass also handles compilation of device tree # overlays.
>> +#
>> +# The output of this class behaves similar to how
>> +kernel-devicetree.bbclass # operates in that the output files are installed into /boot/devicetree.
>> +# However this class on purpose separates the deployed device trees
>> +into the # 'devicetree' subdirectory. This prevents clashes with the
>> +kernel-devicetree # output. Additionally the device trees are populated
>> +into the sysroot for # access via the sysroot from within other recipes.
>> +
>> +SECTION ?= "bsp"
>> +
>> +# The default inclusion of kernel device tree includes and headers
>> +means that # device trees built with them are at least GPLv2 (and in
>> +some cases dual # licensed). Default to GPLv2 if the recipe does not specify a license.
>> +LICENSE ?= "GPLv2"
>> +LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>> +
>> +INHIBIT_DEFAULT_DEPS = "1"
>> +DEPENDS += "dtc-native"
>> +
>> +inherit deploy kernel-arch
>> +
>> +COMPATIBLE_MACHINE ?= "^$"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +SYSROOT_DIRS += "/boot/devicetree"
>> +FILES_${PN} = "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
>> +
>> +S = "${WORKDIR}"
>> +B = "${WORKDIR}/build"
>> +
>> +# Default kernel includes, these represent what are normally used for
>> +in-kernel # sources.
>> +KERNEL_INCLUDE ??= " \
>> +        ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts \
>> +        ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/* \
>> +        ${STAGING_KERNEL_DIR}/scripts/dtc/include-prefixes \
>> +        "
>> +
>> +DT_INCLUDE[doc] = "Search paths to be made available to both the device tree compiler and preprocessor for inclusion."
>> +DT_INCLUDE ?= "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
>> +DT_FILES_PATH[doc] = "Defaults to source directory, can be used to select dts files that are not in source (e.g. generated)."
>> +DT_FILES_PATH ?= "${S}"
>> +
>> +DT_PADDING_SIZE[doc] = "Size of padding on the device tree blob, used as extra space typically for additional properties during boot."
>> +DT_PADDING_SIZE ??= "0x3000"
>> +DT_RESERVED_MAP[doc] = "Number of reserved map entires."
>> +DT_RESERVED_MAP ??= "8"
>> +DT_BOOT_CPU[doc] = "The boot cpu, defaults to 0"
>> +DT_BOOT_CPU ??= "0"
>> +
>> +DTC_FLAGS ?= "-R ${DT_RESERVED_MAP} -p ${DT_PADDING_SIZE} -b ${DT_BOOT_CPU}"
>> +DTC_PPFLAGS ?= "-nostdinc -undef -D__DTS__ -x assembler-with-cpp"
>> +DTC_OFLAGS ?= "-@ -H epapr"
>> +
>> +python () {
>> +    if d.getVar("KERNEL_INCLUDE"):
>> +        # auto add dependency on kernel tree, but only if kernel include paths
>> +        # are specified.
>> +        d.appendVarFlag("do_compile", "depends", "
>> +virtual/kernel:do_configure") }
>> +
>> +def expand_includes(varname, d):
>> +    import glob
>> +    includes = set()
>> +    # expand all includes with glob
>> +    for i in (d.getVar(varname) or "").split():
>> +        for g in glob.glob(i):
>> +            if os.path.isdir(g): # only add directories to include path
>> +                includes.add(g)
>> +    return includes
>> +
>> +def devicetree_source_is_overlay(path):
>> +    # determine if a dts file is an overlay by checking if it uses "/plugin/;"
>> +    with open(path, "r") as f:
>> +        for i in f:
>> +            if i.startswith("/plugin/;"):
>> +                return True
>> +    return False
>> +
>> +def devicetree_compile(dtspath, includes, d):
>> +    import subprocess
>> +    dts = os.path.basename(dtspath)
>> +    dtname = os.path.splitext(dts)[0]
>> +    bb.note("Processing {0} [{1}]".format(dtname, dts))
>> +
>> +    # preprocess
>> +    ppargs = d.getVar("BUILD_CPP").split()
>> +    ppargs += (d.getVar("DTC_PPFLAGS") or "").split()
>> +    for i in includes:
>> +        ppargs.append("-I{0}".format(i))
>> +    ppargs += ["-o", "{0}.pp".format(dts), dtspath]
>> +    bb.note("Running {0}".format(" ".join(ppargs)))
>> +    subprocess.run(ppargs, check = True)
>> +
>> +    # determine if the file is an overlay or not (using the preprocessed file)
>> +    isoverlay = devicetree_source_is_overlay("{0}.pp".format(dts))
>> +
>> +    # compile
>> +    dtcargs = ["dtc"] + (d.getVar("DTC_FLAGS") or "").split()
>> +    if isoverlay:
>> +        dtcargs += (d.getVar("DTC_OFLAGS") or "").split()
>> +    for i in includes:
>> +        dtcargs += ["-i", i]
>> +    dtcargs += ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay else "dtb")]
>> +    dtcargs += ["-I", "dts", "-O", "dtb", "{0}.pp".format(dts)]
>> +    bb.note("Running {0}".format(" ".join(dtcargs)))
>> +    subprocess.run(dtcargs, check = True)
>> +
>> +python devicetree_do_compile() {
>> +    includes = expand_includes("DT_INCLUDE", d)
>> +    listpath = d.getVar("DT_FILES_PATH")
>> +    for dts in os.listdir(listpath):
>> +        if not dts.endswith(".dts"):
>> +            continue # skip non-.dts files
>> +        dtspath = os.path.join(listpath, dts)
>> +        devicetree_compile(dtspath, includes, d) }
>> +
>> +devicetree_do_install() {
>> +    for DTB_FILE in `ls *.dtb *.dtbo`; do
>> +        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot/devicetree/${DTB_FILE}
>> +    done
>> +}
>> +
>> +devicetree_do_deploy() {
>> +    for DTB_FILE in `ls *.dtb *.dtbo`; do
>> +        install -Dm 0644 ${B}/${DTB_FILE} ${DEPLOYDIR}/devicetree/${DTB_FILE}
>> +    done
>> +}
>> +addtask deploy before do_build after do_install
>> +
>> +EXPORT_FUNCTIONS do_compile do_install do_deploy
>> +
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


