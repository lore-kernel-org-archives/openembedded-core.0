Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 1989 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Dec 2017 22:35:16 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0065.outbound.protection.outlook.com [104.47.33.65])
	by mail.openembedded.org (Postfix) with ESMTP id E281478887
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DJUWzL+Zo/nQQ682cCwWEB3a7E07VChsXyQ6qpLBT7k=;
	b=V4VkPPiEXRp+MqQ4mUay4udnhXxrMhXwqve6QDfIGNvfDAS8R46dXbFFjOE1RXUR4P0tId7l2+DqoF5TyZ8ng09o+Wi89dDeFCIZEYbWwr6rbpkjBefW6OzSxGo276J4DPLXmwllE03MAivbY+g75XovhGmrSiINiHEKkxVT37Y=
Received: from SN4PR0201CA0039.namprd02.prod.outlook.com (10.162.76.25) by
	BN6PR02MB3379.namprd02.prod.outlook.com (10.161.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Thu, 21 Dec 2017 22:01:05 +0000
Received: from SN1NAM02FT061.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by SN4PR0201CA0039.outlook.office365.com
	(2603:10b6:803:2e::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Thu, 21 Dec 2017 22:01:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT061.mail.protection.outlook.com (10.152.72.196) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Thu, 21 Dec 2017 22:01:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eS8tk-0001Nn-PV; Thu, 21 Dec 2017 14:01:04 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eS8tk-0001hQ-Lm; Thu, 21 Dec 2017 14:01:04 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBLM0oNF009939; Thu, 21 Dec 2017 14:00:50 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eS8tW-0001YT-5Y; Thu, 21 Dec 2017 14:00:50 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Dec 2017 13:56:34 -0800
Message-ID: <20171221215634.26019-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23542.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(376002)(346002)(39380400002)(2980300002)(438002)(24433001)(189003)(199004)(53946003)(356003)(39060400002)(107886003)(50466002)(2870700001)(36756003)(16200700003)(2351001)(4326008)(478600001)(63266004)(6306002)(6916009)(47776003)(8936002)(575784001)(966005)(77096006)(6666003)(36386004)(5820100001)(59450400001)(81156014)(23676004)(50226002)(106002)(8676002)(1076002)(7696005)(106466001)(305945005)(2906002)(81166006)(316002)(9786002)(54906003)(5660300001)(2004002)(107986001)(579004)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3379; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT061;
	1:cea0SSei6rAmBcW456QGJGhxX+5xF/wnHLrARCUFR3Xt9ZUz52Z5uFUkj7qqV3P6SXkfN49aQNIJj+smgvInH1JMw5Vce9Tm/yCx5MTqexO+J8GM3ed01OgDmwWNpZRs
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15e59c3e-5e70-4c4b-60a8-08d548be5569
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	3:9ojtnkdMtUK4zqYYTxuAAry3kKWuCRCBNq9AKdR9FoLsnlUl6lkK4yo9VnYGrA1/ZKbJOkYVFIhVB244gLckngOzx77Yt0a6PabK59I1BoaGQYtAnsD+ADiiL0jqqvgm4bh/XFGVcGW8JNlIaeF4Lpf+U/je7ZdD2r/1+EIX2kyEQpxsnCbRwvBuKwKQmcVyZs6uI1mAtRUNXyRiX6nagCzU913oJddfM3+utoBx5rsVFro3bjBahfQ/R7Kj8j4vA7EYStshX8esg3M7xxfriapZtnWlinb5Ix33uDt0JjJ4UbwKjSwCaXKHydsHn3XyqJ5SW01eG9IzXKJn4PvHKb2GVjKwDtWgdTXMo7SGsN0=;
	25:rhCtr6+jsheUI5PcbfRRgLYwTF+Uhetbo877HLlgHPbgB5eJszh4dL3umOXXYfeiQU7BcL1PavqFMFQmBPNmcoTdGwl0Fv7Sa7F/Z31shMMf4DItFKWt/qqY7OLcY4g0Y24lmBgb1Bz01F7mFdFL/EELqgQw2MhFuTzuSgc9REImaspEhkMPB4JjBkgbb5sL7Ucv4E8JOZNY9cJl/PgiWKAHwQSAHLVnoKK4osTuBhyXosGRImBH5Vr0CWhPA/v+XibqNkhn8t+wdXNJjoF7nq9/MmKMts4gSknnupdlU1U4TTpbkfXBWWROM/yl6xZlrlHMMQt5lT+WcbKTcjBgzA==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3379:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	31:vapewyZXVfydpACGCLnrH5J0SVcDpsH+AoJYaei63uDpXPtd12UL4ObD4a7pKYtkG/sBXBSXjRHj3zQ0uxbrWPM1pCnT8cMzjsrQQTsUcpsuJaj930zc16GkDiawWgToxJfaOvdNmoMh0n+3RaGYEd7V288teQA5op6YmeNdb0unqoPR1bzRUZa3zzQadNfEVZvdqbjyimxEQl084GNl1hRB+4L/O7GBoMy+UgyR65s=;
	20:dgKufJrnkiykSUx997KHMNxOyBvyhRvntxJT0541Wr81zIU5QPzQE4JxyKHu/KVVTkUmd+u4yXg6/ymUOfOcmEObnjsETZLpUSUXyKaQfLIR5eCBznnOi448V9kCjdQovheoX3w5LpzG6llDe4Hb29OGF52U3lL3qBOw+9n5ieo2/loTpGxA90EjvQb35E4T0aZJ/aIFWWaU4OT+LGBMSU1RQhhenN4j00B++HC2YfmIhzF1C9lAF193AjVz/mL32m8s7cel6mGMbnLq8UBWJs5lWgTqz/wHe3pT2/Ktyisy+Z1Z6cGgdX86P9yGSSsxJ9TCgpBNNv6nnzWMfp7XE+YZxmq6yEOlsA6DwqNNZt987SuFuKPz9z58zuw5TVinJxtWZ8SxGbf0WV/ijAKYeaAlqBMT6XkXeayLwOh4dQP5aEishtWrFCPMakV+lIpRh6soCRvJTXIZu3j5wCIaPpCg4f+aHVjUtykB5jKr9QX67k5Qc6X64OL1m2K9pJJo
X-Microsoft-Antispam-PRVS: <BN6PR02MB3379AA3F87DD546A5F9E38CADC0D0@BN6PR02MB3379.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(158342451672863)(22074186197030)(166708455590820)(192813158149592)(274839183919467)(104084551191319)(21532816269658)(228905959029699)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(3231023)(6055026)(6041268)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:BN6PR02MB3379; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	4:WNI2pJurCp3+Fxhvu0A6+gQIF5rXTjT67rtVeweZbIMsmBSfZyRapUM29DDRVbmIYjO74rVYIJKzFuQ+qwG0FOGRakgxCiUIHreVPqPd2g+edZuKPsLW0NeI1j0HXBQSGrH4KOH6dvE1iqNFSIi3gERDTVTHPs6lisJork1vQYVQroEYX8T0BgdIr4ssj/LdDAvyAShCqmS97QNaTEyGDahde9TyqJjGleltgLFY4j6jaFLAM95cpCZbQdQ+mMGmnU047ekRM9A5O59sEeJUYAMXRaHqLZ52ACRwybiRbuM9EaCGrRjWjidbzFIPVk1xL7vnWscEMJdRu0LkODD3ZU/RoXbAfp/NTSoHWQ+FTLDP+kuGUgQNeTyXkQPNPEQ5/MWSYEAf/WKSNA34lzx9l3xRzM2vXywnHyctOs/G53I8ZeMUQXs82Syh0Tz4HUK5umz/IEMAuuX3YxTBbdtAnvWi5HHIFrmrA8i4KCXd9OJq0KHIspZKUKtzcCzwAyWN3Ggv0n8IfTU6VDbdjXqpA4Xy6LscTOc+2v4ipsBuM36grx+Pd+proFWXXAIeqibPOnJ23aKG1hoTp1bEp52G08bflFheZ+Pi3FsTB3CVhuw=
X-Forefront-PRVS: 0528942FD8
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIzMzc5OzIzOmo0blg3S21wNVpHYjdZUkRrcnozVzVicWh0?=
	=?utf-8?B?TE82TklVWjEvVnZUZmtnV01ENmtqTE5OSS9MMEltbGp6SHExekJJYTdQeUxu?=
	=?utf-8?B?UElFcTJHT24xaUo0eWxHd3FFNVJZalRSV0dFYVgwaGRYTks3UElEUTJ6Nmxr?=
	=?utf-8?B?RzVDQVE3eUFYdXVsR0Nkc2pXYlJCYzdOQi9KY1lsUHYrZXRQL0c1dDVpcUhI?=
	=?utf-8?B?VFVmRHZ6T2s0ZjhuUkhrM1o4VXhiVG40ZjhaWlpRWjdCWmlVS1phdnN3WGFt?=
	=?utf-8?B?SG9mU0FLRVFZaU5hR0VhOE13UU9WcjdNUXJmYnZrdHFGQTVERlh4b1hJTEFD?=
	=?utf-8?B?TVdWeXNBZkNWM3FIUjV6c2o2SXFZZndYbDlvTHpvVkdDZlJYMWYvVWcyOVI0?=
	=?utf-8?B?Z2tNRUxicnFkZEEwZS83ZEJBclRuejZ2RjQ2cTZzUEhKM1d5SjBqczRkRHFz?=
	=?utf-8?B?cm1LS0xsWUg3UWpPTVJ5amRoRXNnZm5PRndyZGtvTXdWcURhM2tUcjRjSVJv?=
	=?utf-8?B?WGxmVm9xZ1NCWDJMS01yVFdkR21kblQvSEpCRm45N1NsdnlPbXh0emRENzQ1?=
	=?utf-8?B?ZGVQd3pSanY5NmEzdHBaMDFndGY5Ulk2OFJqN0JsOXRKOUJPaDl5OHUyQ2Y0?=
	=?utf-8?B?dHRJN3VIYmxsUTNRVkZQZXFIemcySFJ6ZDBHRWNKN1VuMWZtTzlzZXNnQTM5?=
	=?utf-8?B?SnVLUG54c2x6elk4b1ZlVnZCSnZhdDNpbGdPQWVwRjlKbEU2K2lVTG9TbC9K?=
	=?utf-8?B?K1BENjEwYkw5T2dxelFyL2dTbUF4T0FDSDVBQTVndHFkQVVacnUzWG9CQi9z?=
	=?utf-8?B?M3RQYkwrQStIcUZvdWpEdURIMG9VTytNRlJQV0NBS2FuNEI1YU54b281NlU1?=
	=?utf-8?B?WFFRN1JwU1ZGLzFpS1JONEhvS1MvUFZNc1FDNXlLU1ROT3hqbE11eXA0YUFs?=
	=?utf-8?B?dlMrd21ReHgzOTVZU291THZrWFBXT1ZBTzlNNTI1YVF4UFlXYmp4MnlEa2pE?=
	=?utf-8?B?dVRBQXBKRmhGaWhNZzdhcHZqKzRHYzh1QnN5WWNSdy8vSjMzelIvb3F2dm9C?=
	=?utf-8?B?cnVOZGNDWjZGdTBGYldDaklkU1VGcThRdDNleUtUWlR6ZVlGRURrZUFQOU02?=
	=?utf-8?B?eWZ5WnRrT0ZrQ1NWR3FWR2VyM0dhZDhqWXB3Zkg5MzZUbkExbDZReWRrOHUz?=
	=?utf-8?B?UGFXMllTYTcyeElkUDVFS3hUcFpGWG9WK0tWOUU2aGVZKzdrSWRXeC9uK3JK?=
	=?utf-8?B?U2lUZG04VzNEbkE5enBWcEs3b2FpZ29BbEhjSVJnNE0yZWVZRDRzWDFzakw5?=
	=?utf-8?B?VmtqUExydzV3Zzd1cThrMm1lSEdXM1FtSjA5WTg0NmZLZkl3NTA4aUVQam1x?=
	=?utf-8?B?ODFJTjh0QnBLNXFIckNCYktSRjBIazBtMllSTHhqSXVyZkxQTkEvazRjYTY0?=
	=?utf-8?B?VkVMTXhGUDRwSmRVMGJUUnp5NEJLZGhEanhodE1DOHoxY3NOTnA0ODVtZHJ3?=
	=?utf-8?B?T1ZHY3Exd2liZjVtWExZSnNCMHBxb2QzMlpJNFpMUFJJYzQzQ0w4QjFvQWk3?=
	=?utf-8?B?cmx3VWlnc1MxVkNYT3oxZ3ZtY0JveWlpaVg0RHI0NWFOaWphMjFoM2lwY3Ba?=
	=?utf-8?Q?LWlZWt2h+w67tLmugpx6?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	6:xp2HueOF7jrNhqlys4cEuOqDuSwujr+wYPVl+imJVF/l+jaOiOgmVYEpGiNtkojpXwdMuvKn0g/ExNqd/MaNMDBMm9Vs60jpCAMvLHxfoohTViWQMvPEVnUK1csoPRwf5/0RRbiLYmBQ2azr56EwjBmYR+rgVBF9p/xXTYR+sGHSgCQz07mYAxPvLyecb8rj1KRG0gaXoZFKnH+5c+2Ov7GSuPnskBBiERhT3wExyWD5W8tERdiiOhkK8f7fG98a3jBFM13SsyLA6SQeFQZmm/WSLpN6TBqFq2UXiA0CNnYspGEFZnwUsFORsGujLEw0F2FfGn/KgB8WL4ZLtPQLse4bA3qxbOLqEOXQH9792EE=;
	5:vY9ZOYWytgUFw46ejP/JR47+tAF4XhAf2Hhy19ULFXyCwULPvRb71QqXZvAHpl26HrcAYL4Kwf0pwokVc3IiT2wZK5sJbTR7suOq7RieLYWck13sGahkv2HqiUzxCIKfqDmU4LVVJdUCAWgOwiHczhH2hMnKvvaJX52enfLpyWM=;
	24:Q1cL9E/t9EhUjCTQlIhJX5Nta+oJ4VctYiW55o8y7y1G6eNrORDT5msy1BbAiP5L2qwG7g9R9t6xOkfYTf6mpovc+cPTSRO5fvYYp8iX2iY=;
	7:1m2i7BwC/qh7CAStvxTlbbtYVJnAJ/KutNC4uotA7FkNwN/wZmJqBCvVGPipeCkrB+nrrf9pezLP9E3iXKZsAfRrDSkobP/ukCQ0deoQOgyx7e/zju1TioIgoQdKEVhUGc/3tpDn19+3Nyn/L101ikgp49yW4BHvW2UlpFvqbj9V/IF0qcwvq3ilYtcjOk6ibqyWNbbcA7MNu1IQNzq6UHuZyf/ZLo2+fadJgfHBP3huJbQqLQe8QvBge6JI1X4i
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2017 22:01:05.4248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e59c3e-5e70-4c4b-60a8-08d548be5569
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3379
Cc: vineethchowz.chowdary@xilinx.com
Subject: [PATCH] receipes-devtools: QEMU: Bump to version 2.11.0
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
X-List-Received-Date: Thu, 21 Dec 2017 22:35:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Use the latest QEMU release 2.11. Remove all patches that are no longer
required as they have been merged into the 2.11 releaese. One patch had
to be updated to apply to thet 2.11 tree.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...1-tpm-Clean-up-driver-registration-lookup.patch |  154 ---
 ...02-tpm-Clean-up-model-registration-lookup.patch |  121 ---
 ...-Remove-unneeded-member-variable-from-bac.patch |   75 --
 ...nd-Move-thread-handling-inside-TPMBackend.patch |  417 --------
 ...-Initialize-and-free-data-members-in-it-s.patch |  185 ----
 ...ckend-Made-few-interface-methods-optional.patch |  284 ------
 ...ckend-Add-new-api-to-read-backend-TpmInfo.patch |  293 ------
 ...-Move-realloc_buffer-implementation-to-tp.patch |  140 ---
 ...m-passthrough-move-reusable-code-to-utils.patch |  182 ----
 .../0010-tpm-Added-support-for-TPM-emulator.patch  | 1059 --------------------
 .../0011-tpm-Move-tpm_cleanup-to-right-place.patch |   43 -
 ...GSIZE-instead-of-EBADMSG-to-compile-on-Op.patch |   67 --
 ...ardev-connect-socket-to-a-spawned-command.patch |   45 +-
 .../exclude-some-arm-EABI-obsolete-syscalls.patch  |   87 --
 meta/recipes-devtools/qemu/qemu/ppc_locking.patch  |  105 --
 .../qemu/{qemu_2.10.1.bb => qemu_2.11.0.bb}        |   18 +-
 16 files changed, 24 insertions(+), 3251 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/ppc_locking.patch
 rename meta/recipes-devtools/qemu/{qemu_2.10.1.bb => qemu_2.11.0.bb} (60%)

diff --git a/meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch b/meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch
deleted file mode 100644
index 1a484b91c3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-tpm-Clean-up-driver-registration-lookup.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From a0f8d150794164f41cd7288c9ed059bbf21c95ec Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
-Date: Thu, 24 Aug 2017 10:45:58 +0200
-Subject: [PATCH 01/12] tpm: Clean up driver registration & lookup
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We have a strict separation between enum TpmType and be_drivers[]:
-
-* TpmType may have any number of members.  It just happens to have one.
-
-* tpm_register_driver() uses the first empty slot in be_drivers[].
-
-  If you register more than tpm_models[] has space,
-  tpm_register_driver() fails.  Its caller silently ignores the
-  failure.
-
-  If you register more than one with a given TpmType,
-  tpm_display_backend_drivers() will shows all of them, but
-  tpm_driver_find_by_type() and tpm_get_backend_driver() will find
-  only the one one that registered first.
-
-Since we only ever register one driver, and be_drivers[] has space for
-just that one, this contraption even works.
-
-Turn be_drivers[] into a straight map from enum TpmType to driver.
-Much simpler, and has a decent chance to actually work should we ever
-acquire additional drivers.
-
-While there, use qapi_enum_parse() in tpm_get_backend_driver().
-
-Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20170822132255.23945-8-marcandre.lureau@redhat.com>
-Reviewed-by: Markus Armbruster <armbru@redhat.com>
-[Rebased, superfluous initializer dropped, commit message rewritten]
-Cc: Stefan Berger <stefanb@us.ibm.com>
-Signed-off-by: Markus Armbruster <armbru@redhat.com>
-Message-Id: <1503564371-26090-4-git-send-email-armbru@redhat.com>
-
-Upstream-Status: Backport
----
- include/sysemu/tpm_backend.h |  2 +-
- tpm.c                        | 45 +++++++++++++-------------------------------
- 2 files changed, 14 insertions(+), 33 deletions(-)
-
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index b58f52d39f..1d21c6b19b 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -227,6 +227,6 @@ TPMBackend *qemu_find_tpm(const char *id);
- 
- const TPMDriverOps *tpm_get_backend_driver(const char *type);
- int tpm_register_model(enum TpmModel model);
--int tpm_register_driver(const TPMDriverOps *tdo);
-+void tpm_register_driver(const TPMDriverOps *tdo);
- 
- #endif
-diff --git a/tpm.c b/tpm.c
-index 9a7c7114d3..bb45d0c08e 100644
---- a/tpm.c
-+++ b/tpm.c
-@@ -14,6 +14,7 @@
- #include "qemu/osdep.h"
- 
- #include "qapi/qmp/qerror.h"
-+#include "qapi/util.h"
- #include "sysemu/tpm_backend.h"
- #include "sysemu/tpm.h"
- #include "qemu/config-file.h"
-@@ -25,11 +26,8 @@ static QLIST_HEAD(, TPMBackend) tpm_backends =
- 
- 
- #define TPM_MAX_MODELS      1
--#define TPM_MAX_DRIVERS     1
- 
--static TPMDriverOps const *be_drivers[TPM_MAX_DRIVERS] = {
--    NULL,
--};
-+static TPMDriverOps const *be_drivers[TPM_TYPE__MAX];
- 
- static enum TpmModel tpm_models[TPM_MAX_MODELS] = {
-     TPM_MODEL__MAX,
-@@ -63,31 +61,18 @@ static bool tpm_model_is_registered(enum TpmModel model)
- 
- const TPMDriverOps *tpm_get_backend_driver(const char *type)
- {
--    int i;
--
--    for (i = 0; i < TPM_MAX_DRIVERS && be_drivers[i] != NULL; i++) {
--        if (!strcmp(TpmType_lookup[be_drivers[i]->type], type)) {
--            return be_drivers[i];
--        }
--    }
-+    int i = qapi_enum_parse(TpmType_lookup, type, TPM_TYPE__MAX, -1, NULL);
- 
--    return NULL;
-+    return i >= 0 ? be_drivers[i] : NULL;
- }
- 
- #ifdef CONFIG_TPM
- 
--int tpm_register_driver(const TPMDriverOps *tdo)
-+void tpm_register_driver(const TPMDriverOps *tdo)
- {
--    int i;
-+    assert(!be_drivers[tdo->type]);
- 
--    for (i = 0; i < TPM_MAX_DRIVERS; i++) {
--        if (!be_drivers[i]) {
--            be_drivers[i] = tdo;
--            return 0;
--        }
--    }
--    error_report("Could not register TPM driver");
--    return 1;
-+    be_drivers[tdo->type] = tdo;
- }
- 
- /*
-@@ -100,9 +85,12 @@ static void tpm_display_backend_drivers(void)
- 
-     fprintf(stderr, "Supported TPM types (choose only one):\n");
- 
--    for (i = 0; i < TPM_MAX_DRIVERS && be_drivers[i] != NULL; i++) {
-+    for (i = 0; i < TPM_TYPE__MAX; i++) {
-+        if (be_drivers[i] == NULL) {
-+            continue;
-+        }
-         fprintf(stderr, "%12s   %s\n",
--                TpmType_lookup[be_drivers[i]->type], be_drivers[i]->desc());
-+                TpmType_lookup[i], be_drivers[i]->desc());
-     }
-     fprintf(stderr, "\n");
- }
-@@ -239,14 +227,7 @@ int tpm_config_parse(QemuOptsList *opts_list, const char *optarg)
- 
- static const TPMDriverOps *tpm_driver_find_by_type(enum TpmType type)
- {
--    int i;
--
--    for (i = 0; i < TPM_MAX_DRIVERS && be_drivers[i] != NULL; i++) {
--        if (be_drivers[i]->type == type) {
--            return be_drivers[i];
--        }
--    }
--    return NULL;
-+    return be_drivers[type];
- }
- 
- static TPMInfo *qmp_query_tpm_inst(TPMBackend *drv)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch b/meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch
deleted file mode 100644
index c223ba83b6..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-tpm-Clean-up-model-registration-lookup.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 89430c64784484214b3c99562520cdffe79cd801 Mon Sep 17 00:00:00 2001
-From: Markus Armbruster <armbru@redhat.com>
-Date: Thu, 24 Aug 2017 10:45:59 +0200
-Subject: [PATCH 02/12] tpm: Clean up model registration & lookup
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We have a strict separation between enum TpmModel and tpm_models[]:
-
-* TpmModel may have any number of members.  It just happens to have one.
-
-* tpm_register_model() uses the first empty slot in tpm_models[].
-
-  If you register more than tpm_models[] has space,
-  tpn_register_model() fails.  Its caller silently ignores the
-  failure.
-
-  Register the same TpmModel more than once has no effect other than
-  wasting tpm_models[] slots: tpm_model_is_registered() is happy with
-  the first one it finds.
-
-Since we only ever register one model, and tpm_models[] has space for
-just that one, this contraption even works.
-
-Turn tpm_models[] into a straight map from enum TpmType to bool.  Much
-simpler.
-
-Cc: Stefan Berger <stefanb@us.ibm.com>
-Signed-off-by: Markus Armbruster <armbru@redhat.com>
-Message-Id: <1503564371-26090-5-git-send-email-armbru@redhat.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-[Commit message typo fixed]
-
-Upstream-Status: Backport
----
- include/sysemu/tpm_backend.h |  2 +-
- tpm.c                        | 37 +++++--------------------------------
- 2 files changed, 6 insertions(+), 33 deletions(-)
-
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index 1d21c6b19b..b0a9731aee 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -226,7 +226,7 @@ TPMVersion tpm_backend_get_tpm_version(TPMBackend *s);
- TPMBackend *qemu_find_tpm(const char *id);
- 
- const TPMDriverOps *tpm_get_backend_driver(const char *type);
--int tpm_register_model(enum TpmModel model);
-+void tpm_register_model(enum TpmModel model);
- void tpm_register_driver(const TPMDriverOps *tdo);
- 
- #endif
-diff --git a/tpm.c b/tpm.c
-index bb45d0c08e..2dbea70645 100644
---- a/tpm.c
-+++ b/tpm.c
-@@ -24,39 +24,12 @@
- static QLIST_HEAD(, TPMBackend) tpm_backends =
-     QLIST_HEAD_INITIALIZER(tpm_backends);
- 
--
--#define TPM_MAX_MODELS      1
--
- static TPMDriverOps const *be_drivers[TPM_TYPE__MAX];
-+static bool tpm_models[TPM_MODEL__MAX];
- 
--static enum TpmModel tpm_models[TPM_MAX_MODELS] = {
--    TPM_MODEL__MAX,
--};
--
--int tpm_register_model(enum TpmModel model)
--{
--    int i;
--
--    for (i = 0; i < TPM_MAX_MODELS; i++) {
--        if (tpm_models[i] == TPM_MODEL__MAX) {
--            tpm_models[i] = model;
--            return 0;
--        }
--    }
--    error_report("Could not register TPM model");
--    return 1;
--}
--
--static bool tpm_model_is_registered(enum TpmModel model)
-+void tpm_register_model(enum TpmModel model)
- {
--    int i;
--
--    for (i = 0; i < TPM_MAX_MODELS; i++) {
--        if (tpm_models[i] == model) {
--            return true;
--        }
--    }
--    return false;
-+    tpm_models[model] = true;
- }
- 
- const TPMDriverOps *tpm_get_backend_driver(const char *type)
-@@ -270,7 +243,7 @@ TPMInfoList *qmp_query_tpm(Error **errp)
-     TPMInfoList *info, *head = NULL, *cur_item = NULL;
- 
-     QLIST_FOREACH(drv, &tpm_backends, list) {
--        if (!tpm_model_is_registered(drv->fe_model)) {
-+        if (!tpm_models[drv->fe_model]) {
-             continue;
-         }
-         info = g_new0(TPMInfoList, 1);
-@@ -317,7 +290,7 @@ TpmModelList *qmp_query_tpm_models(Error **errp)
-     TpmModelList *head = NULL, *prev = NULL, *cur_item;
- 
-     for (i = 0; i < TPM_MODEL__MAX; i++) {
--        if (!tpm_model_is_registered(i)) {
-+        if (!tpm_models[i]) {
-             continue;
-         }
-         cur_item = g_new0(TpmModelList, 1);
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch b/meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch
deleted file mode 100644
index 6b94eba720..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From cac845f55b8f27e5c90e0f2e3dcbeea7013df67c Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Thu, 30 Mar 2017 15:55:17 +0300
-Subject: [PATCH 03/12] tpm-backend: Remove unneeded member variable from
- backend class
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-TPMDriverOps inside TPMBackend is not required, as it is supposed to be a class
-member. The only possible reason for keeping in TPMBackend was, to get the
-backend type in tpm.c where dedicated backend api, tpm_backend_get_type() is
-present.
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Backport [fb4b0c6765471dad2363875989e7661ca5f9a608]
----
- hw/tpm/tpm_passthrough.c     | 4 ----
- include/sysemu/tpm_backend.h | 1 -
- tpm.c                        | 2 +-
- 3 files changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index 9234eb3459..a0baf5f080 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -46,8 +46,6 @@
- #define TPM_PASSTHROUGH(obj) \
-     OBJECT_CHECK(TPMPassthruState, (obj), TYPE_TPM_PASSTHROUGH)
- 
--static const TPMDriverOps tpm_passthrough_driver;
--
- /* data structures */
- typedef struct TPMPassthruThreadParams {
-     TPMState *tpm_state;
-@@ -462,8 +460,6 @@ static TPMBackend *tpm_passthrough_create(QemuOpts *opts, const char *id)
-     /* let frontend set the fe_model to proper value */
-     tb->fe_model = -1;
- 
--    tb->ops = &tpm_passthrough_driver;
--
-     if (tpm_passthrough_handle_device_opts(opts, tb)) {
-         goto err_exit;
-     }
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index b0a9731aee..3708413035 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -50,7 +50,6 @@ struct TPMBackend {
-     enum TpmModel fe_model;
-     char *path;
-     char *cancel_path;
--    const TPMDriverOps *ops;
- 
-     QLIST_ENTRY(TPMBackend) list;
- };
-diff --git a/tpm.c b/tpm.c
-index 2dbea70645..b7166ca200 100644
---- a/tpm.c
-+++ b/tpm.c
-@@ -212,7 +212,7 @@ static TPMInfo *qmp_query_tpm_inst(TPMBackend *drv)
-     res->model = drv->fe_model;
-     res->options = g_new0(TpmTypeOptions, 1);
- 
--    switch (drv->ops->type) {
-+    switch (tpm_backend_get_type(drv)) {
-     case TPM_TYPE_PASSTHROUGH:
-         res->options->type = TPM_TYPE_OPTIONS_KIND_PASSTHROUGH;
-         tpo = g_new0(TPMPassthroughOptions, 1);
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch b/meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch
deleted file mode 100644
index 64e88b6de9..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch
+++ /dev/null
@@ -1,417 +0,0 @@
-From 5767322022d54ceb5a2ed6c650f667a4d24aa150 Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Thu, 30 Mar 2017 16:20:25 +0300
-Subject: [PATCH 04/12] tpm-backend: Move thread handling inside TPMBackend
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Move thread handling inside TPMBackend, this way backend implementations need
-not to maintain their own thread life cycle, instead they needs to implement
-'handle_request()' class method that always been called from a thread.
-
-This change made tpm_backend_int.h kind of useless, hence removed it.
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Backport [b19a5eea5a26e9bd83a48c742172d2a6aa8c4180]
----
- backends/tpm.c                   | 62 +++++++++++++++++++++++++---------------
- hw/tpm/tpm_passthrough.c         | 58 ++++++-------------------------------
- include/sysemu/tpm_backend.h     | 32 +++++++++++++--------
- include/sysemu/tpm_backend_int.h | 41 --------------------------
- 4 files changed, 67 insertions(+), 126 deletions(-)
- delete mode 100644 include/sysemu/tpm_backend_int.h
-
-diff --git a/backends/tpm.c b/backends/tpm.c
-index 536f262bb7..ce56c3b74d 100644
---- a/backends/tpm.c
-+++ b/backends/tpm.c
-@@ -18,7 +18,24 @@
- #include "qapi/qmp/qerror.h"
- #include "sysemu/tpm.h"
- #include "qemu/thread.h"
--#include "sysemu/tpm_backend_int.h"
-+
-+static void tpm_backend_worker_thread(gpointer data, gpointer user_data)
-+{
-+    TPMBackend *s = TPM_BACKEND(user_data);
-+    TPMBackendClass *k  = TPM_BACKEND_GET_CLASS(s);
-+
-+    assert(k->handle_request != NULL);
-+    k->handle_request(s, (TPMBackendCmd)data);
-+}
-+
-+static void tpm_backend_thread_end(TPMBackend *s)
-+{
-+    if (s->thread_pool) {
-+        g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_END, NULL);
-+        g_thread_pool_free(s->thread_pool, FALSE, TRUE);
-+        s->thread_pool = NULL;
-+    }
-+}
- 
- enum TpmType tpm_backend_get_type(TPMBackend *s)
- {
-@@ -39,6 +56,8 @@ void tpm_backend_destroy(TPMBackend *s)
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
-     k->ops->destroy(s);
-+
-+    tpm_backend_thread_end(s);
- }
- 
- int tpm_backend_init(TPMBackend *s, TPMState *state,
-@@ -46,13 +65,23 @@ int tpm_backend_init(TPMBackend *s, TPMState *state,
- {
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
--    return k->ops->init(s, state, datacb);
-+    s->tpm_state = state;
-+    s->recv_data_callback = datacb;
-+
-+    return k->ops->init(s);
- }
- 
- int tpm_backend_startup_tpm(TPMBackend *s)
- {
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
-+    /* terminate a running TPM */
-+    tpm_backend_thread_end(s);
-+
-+    s->thread_pool = g_thread_pool_new(tpm_backend_worker_thread, s, 1, TRUE,
-+                                       NULL);
-+    g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_INIT, NULL);
-+
-     return k->ops->startup_tpm(s);
- }
- 
-@@ -72,9 +101,8 @@ size_t tpm_backend_realloc_buffer(TPMBackend *s, TPMSizedBuffer *sb)
- 
- void tpm_backend_deliver_request(TPMBackend *s)
- {
--    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
--
--    k->ops->deliver_request(s);
-+    g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_PROCESS_CMD,
-+                       NULL);
- }
- 
- void tpm_backend_reset(TPMBackend *s)
-@@ -82,6 +110,8 @@ void tpm_backend_reset(TPMBackend *s)
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
-     k->ops->reset(s);
-+
-+    tpm_backend_thread_end(s);
- }
- 
- void tpm_backend_cancel_cmd(TPMBackend *s)
-@@ -156,29 +186,14 @@ static void tpm_backend_instance_init(Object *obj)
-                              tpm_backend_prop_get_opened,
-                              tpm_backend_prop_set_opened,
-                              NULL);
--}
- 
--void tpm_backend_thread_deliver_request(TPMBackendThread *tbt)
--{
--   g_thread_pool_push(tbt->pool, (gpointer)TPM_BACKEND_CMD_PROCESS_CMD, NULL);
- }
- 
--void tpm_backend_thread_create(TPMBackendThread *tbt,
--                               GFunc func, gpointer user_data)
-+static void tpm_backend_instance_finalize(Object *obj)
- {
--    if (!tbt->pool) {
--        tbt->pool = g_thread_pool_new(func, user_data, 1, TRUE, NULL);
--        g_thread_pool_push(tbt->pool, (gpointer)TPM_BACKEND_CMD_INIT, NULL);
--    }
--}
-+    TPMBackend *s = TPM_BACKEND(obj);
- 
--void tpm_backend_thread_end(TPMBackendThread *tbt)
--{
--    if (tbt->pool) {
--        g_thread_pool_push(tbt->pool, (gpointer)TPM_BACKEND_CMD_END, NULL);
--        g_thread_pool_free(tbt->pool, FALSE, TRUE);
--        tbt->pool = NULL;
--    }
-+    tpm_backend_thread_end(s);
- }
- 
- static const TypeInfo tpm_backend_info = {
-@@ -186,6 +201,7 @@ static const TypeInfo tpm_backend_info = {
-     .parent = TYPE_OBJECT,
-     .instance_size = sizeof(TPMBackend),
-     .instance_init = tpm_backend_instance_init,
-+    .instance_finalize = tpm_backend_instance_finalize,
-     .class_size = sizeof(TPMBackendClass),
-     .abstract = true,
- };
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index a0baf5f080..f50d9cffd7 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -30,7 +30,6 @@
- #include "tpm_int.h"
- #include "hw/hw.h"
- #include "hw/i386/pc.h"
--#include "sysemu/tpm_backend_int.h"
- #include "tpm_tis.h"
- #include "tpm_util.h"
- 
-@@ -47,20 +46,9 @@
-     OBJECT_CHECK(TPMPassthruState, (obj), TYPE_TPM_PASSTHROUGH)
- 
- /* data structures */
--typedef struct TPMPassthruThreadParams {
--    TPMState *tpm_state;
--
--    TPMRecvDataCB *recv_data_callback;
--    TPMBackend *tb;
--} TPMPassthruThreadParams;
--
- struct TPMPassthruState {
-     TPMBackend parent;
- 
--    TPMBackendThread tbt;
--
--    TPMPassthruThreadParams tpm_thread_params;
--
-     char *tpm_dev;
-     int tpm_fd;
-     bool tpm_executing;
-@@ -214,12 +202,9 @@ static int tpm_passthrough_unix_transfer(TPMPassthruState *tpm_pt,
-                                         selftest_done);
- }
- 
--static void tpm_passthrough_worker_thread(gpointer data,
--                                          gpointer user_data)
-+static void tpm_passthrough_handle_request(TPMBackend *tb, TPMBackendCmd cmd)
- {
--    TPMPassthruThreadParams *thr_parms = user_data;
--    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(thr_parms->tb);
--    TPMBackendCmd cmd = (TPMBackendCmd)data;
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-     bool selftest_done = false;
- 
-     DPRINTF("tpm_passthrough: processing command type %d\n", cmd);
-@@ -227,12 +212,12 @@ static void tpm_passthrough_worker_thread(gpointer data,
-     switch (cmd) {
-     case TPM_BACKEND_CMD_PROCESS_CMD:
-         tpm_passthrough_unix_transfer(tpm_pt,
--                                      thr_parms->tpm_state->locty_data,
-+                                      tb->tpm_state->locty_data,
-                                       &selftest_done);
- 
--        thr_parms->recv_data_callback(thr_parms->tpm_state,
--                                      thr_parms->tpm_state->locty_number,
--                                      selftest_done);
-+        tb->recv_data_callback(tb->tpm_state,
-+                               tb->tpm_state->locty_number,
-+                               selftest_done);
-         break;
-     case TPM_BACKEND_CMD_INIT:
-     case TPM_BACKEND_CMD_END:
-@@ -248,15 +233,6 @@ static void tpm_passthrough_worker_thread(gpointer data,
-  */
- static int tpm_passthrough_startup_tpm(TPMBackend *tb)
- {
--    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
--
--    /* terminate a running TPM */
--    tpm_backend_thread_end(&tpm_pt->tbt);
--
--    tpm_backend_thread_create(&tpm_pt->tbt,
--                              tpm_passthrough_worker_thread,
--                              &tpm_pt->tpm_thread_params);
--
-     return 0;
- }
- 
-@@ -268,20 +244,11 @@ static void tpm_passthrough_reset(TPMBackend *tb)
- 
-     tpm_passthrough_cancel_cmd(tb);
- 
--    tpm_backend_thread_end(&tpm_pt->tbt);
--
-     tpm_pt->had_startup_error = false;
- }
- 
--static int tpm_passthrough_init(TPMBackend *tb, TPMState *s,
--                                TPMRecvDataCB *recv_data_cb)
-+static int tpm_passthrough_init(TPMBackend *tb)
- {
--    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
--
--    tpm_pt->tpm_thread_params.tpm_state = s;
--    tpm_pt->tpm_thread_params.recv_data_callback = recv_data_cb;
--    tpm_pt->tpm_thread_params.tb = tb;
--
-     return 0;
- }
- 
-@@ -315,13 +282,6 @@ static size_t tpm_passthrough_realloc_buffer(TPMSizedBuffer *sb)
-     return sb->size;
- }
- 
--static void tpm_passthrough_deliver_request(TPMBackend *tb)
--{
--    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
--
--    tpm_backend_thread_deliver_request(&tpm_pt->tbt);
--}
--
- static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-@@ -483,8 +443,6 @@ static void tpm_passthrough_destroy(TPMBackend *tb)
- 
-     tpm_passthrough_cancel_cmd(tb);
- 
--    tpm_backend_thread_end(&tpm_pt->tbt);
--
-     qemu_close(tpm_pt->tpm_fd);
-     qemu_close(tpm_pt->cancel_fd);
- 
-@@ -520,7 +478,6 @@ static const TPMDriverOps tpm_passthrough_driver = {
-     .realloc_buffer           = tpm_passthrough_realloc_buffer,
-     .reset                    = tpm_passthrough_reset,
-     .had_startup_error        = tpm_passthrough_get_startup_error,
--    .deliver_request          = tpm_passthrough_deliver_request,
-     .cancel_cmd               = tpm_passthrough_cancel_cmd,
-     .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
-     .reset_tpm_established_flag = tpm_passthrough_reset_tpm_established_flag,
-@@ -540,6 +497,7 @@ static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
-     TPMBackendClass *tbc = TPM_BACKEND_CLASS(klass);
- 
-     tbc->ops = &tpm_passthrough_driver;
-+    tbc->handle_request = tpm_passthrough_handle_request;
- }
- 
- static const TypeInfo tpm_passthrough_info = {
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index 3708413035..58308b3687 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -29,22 +29,24 @@
- 
- typedef struct TPMBackendClass TPMBackendClass;
- typedef struct TPMBackend TPMBackend;
--
- typedef struct TPMDriverOps TPMDriverOps;
-+typedef void (TPMRecvDataCB)(TPMState *, uint8_t locty, bool selftest_done);
- 
--struct TPMBackendClass {
--    ObjectClass parent_class;
--
--    const TPMDriverOps *ops;
--
--    void (*opened)(TPMBackend *s, Error **errp);
--};
-+typedef enum TPMBackendCmd {
-+    TPM_BACKEND_CMD_INIT = 1,
-+    TPM_BACKEND_CMD_PROCESS_CMD,
-+    TPM_BACKEND_CMD_END,
-+    TPM_BACKEND_CMD_TPM_RESET,
-+} TPMBackendCmd;
- 
- struct TPMBackend {
-     Object parent;
- 
-     /*< protected >*/
-     bool opened;
-+    TPMState *tpm_state;
-+    GThreadPool *thread_pool;
-+    TPMRecvDataCB *recv_data_callback;
- 
-     char *id;
-     enum TpmModel fe_model;
-@@ -54,7 +56,15 @@ struct TPMBackend {
-     QLIST_ENTRY(TPMBackend) list;
- };
- 
--typedef void (TPMRecvDataCB)(TPMState *, uint8_t locty, bool selftest_done);
-+struct TPMBackendClass {
-+    ObjectClass parent_class;
-+
-+    const TPMDriverOps *ops;
-+
-+    void (*opened)(TPMBackend *s, Error **errp);
-+
-+    void (*handle_request)(TPMBackend *s, TPMBackendCmd cmd);
-+};
- 
- typedef struct TPMSizedBuffer {
-     uint32_t size;
-@@ -71,7 +81,7 @@ struct TPMDriverOps {
-     void (*destroy)(TPMBackend *t);
- 
-     /* initialize the backend */
--    int (*init)(TPMBackend *t, TPMState *s, TPMRecvDataCB *datacb);
-+    int (*init)(TPMBackend *t);
-     /* start up the TPM on the backend */
-     int (*startup_tpm)(TPMBackend *t);
-     /* returns true if nothing will ever answer TPM requests */
-@@ -79,8 +89,6 @@ struct TPMDriverOps {
- 
-     size_t (*realloc_buffer)(TPMSizedBuffer *sb);
- 
--    void (*deliver_request)(TPMBackend *t);
--
-     void (*reset)(TPMBackend *t);
- 
-     void (*cancel_cmd)(TPMBackend *t);
-diff --git a/include/sysemu/tpm_backend_int.h b/include/sysemu/tpm_backend_int.h
-deleted file mode 100644
-index 00639dd7de..0000000000
---- a/include/sysemu/tpm_backend_int.h
-+++ /dev/null
-@@ -1,41 +0,0 @@
--/*
-- *  common TPM backend driver functions
-- *
-- *  Copyright (c) 2012-2013 IBM Corporation
-- *  Authors:
-- *    Stefan Berger <stefanb@us.ibm.com>
-- *
-- * This library is free software; you can redistribute it and/or
-- * modify it under the terms of the GNU Lesser General Public
-- * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-- *
-- * This library is distributed in the hope that it will be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- * Lesser General Public License for more details.
-- *
-- * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, see <http://www.gnu.org/licenses/>
-- */
--
--#ifndef TPM_BACKEND_INT_H
--#define TPM_BACKEND_INT_H
--
--typedef struct TPMBackendThread {
--    GThreadPool *pool;
--} TPMBackendThread;
--
--void tpm_backend_thread_deliver_request(TPMBackendThread *tbt);
--void tpm_backend_thread_create(TPMBackendThread *tbt,
--                               GFunc func, gpointer user_data);
--void tpm_backend_thread_end(TPMBackendThread *tbt);
--
--typedef enum TPMBackendCmd {
--    TPM_BACKEND_CMD_INIT = 1,
--    TPM_BACKEND_CMD_PROCESS_CMD,
--    TPM_BACKEND_CMD_END,
--    TPM_BACKEND_CMD_TPM_RESET,
--} TPMBackendCmd;
--
--#endif /* TPM_BACKEND_INT_H */
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch b/meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch
deleted file mode 100644
index 91dd542f45..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch
+++ /dev/null
@@ -1,185 +0,0 @@
-From 83ef052c60de271a97abb7eb9b5a8aeee52659e6 Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Fri, 31 Mar 2017 10:58:11 +0300
-Subject: [PATCH 05/12] tpm-backend: Initialize and free data members in it's
- own methods
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Initialize and free TPMBackend data members in it's own instance_init() and
-instance_finalize methods.
-
-Took the opportunity to remove unneeded destroy() method from TpmDriverOps
-interface as TPMBackend is a Qemu Object, we can use object_unref() inplace of
-tpm_backend_destroy() to free the backend object, hence removed destroy() from
-TPMDriverOps interface.
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Backport [f35fe5cb97bbdaa6a6967f2fefc3fc1f79680601]
----
- backends/tpm.c               | 16 ++++++----------
- hw/tpm/tpm_passthrough.c     | 31 ++++++++++++-------------------
- include/sysemu/tpm_backend.h |  7 -------
- tpm.c                        |  2 +-
- 4 files changed, 19 insertions(+), 37 deletions(-)
-
-diff --git a/backends/tpm.c b/backends/tpm.c
-index ce56c3b74d..cf5abf1582 100644
---- a/backends/tpm.c
-+++ b/backends/tpm.c
-@@ -51,15 +51,6 @@ const char *tpm_backend_get_desc(TPMBackend *s)
-     return k->ops->desc();
- }
- 
--void tpm_backend_destroy(TPMBackend *s)
--{
--    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
--
--    k->ops->destroy(s);
--
--    tpm_backend_thread_end(s);
--}
--
- int tpm_backend_init(TPMBackend *s, TPMState *state,
-                      TPMRecvDataCB *datacb)
- {
-@@ -182,17 +173,22 @@ static void tpm_backend_prop_set_opened(Object *obj, bool value, Error **errp)
- 
- static void tpm_backend_instance_init(Object *obj)
- {
-+    TPMBackend *s = TPM_BACKEND(obj);
-+
-     object_property_add_bool(obj, "opened",
-                              tpm_backend_prop_get_opened,
-                              tpm_backend_prop_set_opened,
-                              NULL);
--
-+    s->fe_model = -1;
- }
- 
- static void tpm_backend_instance_finalize(Object *obj)
- {
-     TPMBackend *s = TPM_BACKEND(obj);
- 
-+    g_free(s->id);
-+    g_free(s->path);
-+    g_free(s->cancel_path);
-     tpm_backend_thread_end(s);
- }
- 
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index f50d9cffd7..815a72ef9a 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -417,8 +417,6 @@ static TPMBackend *tpm_passthrough_create(QemuOpts *opts, const char *id)
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
- 
-     tb->id = g_strdup(id);
--    /* let frontend set the fe_model to proper value */
--    tb->fe_model = -1;
- 
-     if (tpm_passthrough_handle_device_opts(opts, tb)) {
-         goto err_exit;
-@@ -432,26 +430,11 @@ static TPMBackend *tpm_passthrough_create(QemuOpts *opts, const char *id)
-     return tb;
- 
- err_exit:
--    g_free(tb->id);
-+    object_unref(obj);
- 
-     return NULL;
- }
- 
--static void tpm_passthrough_destroy(TPMBackend *tb)
--{
--    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
--
--    tpm_passthrough_cancel_cmd(tb);
--
--    qemu_close(tpm_pt->tpm_fd);
--    qemu_close(tpm_pt->cancel_fd);
--
--    g_free(tb->id);
--    g_free(tb->path);
--    g_free(tb->cancel_path);
--    g_free(tpm_pt->tpm_dev);
--}
--
- static const QemuOptDesc tpm_passthrough_cmdline_opts[] = {
-     TPM_STANDARD_CMDLINE_OPTS,
-     {
-@@ -472,7 +455,6 @@ static const TPMDriverOps tpm_passthrough_driver = {
-     .opts                     = tpm_passthrough_cmdline_opts,
-     .desc                     = tpm_passthrough_create_desc,
-     .create                   = tpm_passthrough_create,
--    .destroy                  = tpm_passthrough_destroy,
-     .init                     = tpm_passthrough_init,
-     .startup_tpm              = tpm_passthrough_startup_tpm,
-     .realloc_buffer           = tpm_passthrough_realloc_buffer,
-@@ -486,10 +468,21 @@ static const TPMDriverOps tpm_passthrough_driver = {
- 
- static void tpm_passthrough_inst_init(Object *obj)
- {
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(obj);
-+
-+    tpm_pt->tpm_fd = -1;
-+    tpm_pt->cancel_fd = -1;
- }
- 
- static void tpm_passthrough_inst_finalize(Object *obj)
- {
-+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(obj);
-+
-+    tpm_passthrough_cancel_cmd(TPM_BACKEND(obj));
-+
-+    qemu_close(tpm_pt->tpm_fd);
-+    qemu_close(tpm_pt->cancel_fd);
-+    g_free(tpm_pt->tpm_dev);
- }
- 
- static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index 58308b3687..202ec8d5a2 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -78,7 +78,6 @@ struct TPMDriverOps {
-     const char *(*desc)(void);
- 
-     TPMBackend *(*create)(QemuOpts *opts, const char *id);
--    void (*destroy)(TPMBackend *t);
- 
-     /* initialize the backend */
-     int (*init)(TPMBackend *t);
-@@ -118,12 +117,6 @@ enum TpmType tpm_backend_get_type(TPMBackend *s);
- const char *tpm_backend_get_desc(TPMBackend *s);
- 
- /**
-- * tpm_backend_destroy:
-- * @s: the backend to destroy
-- */
--void tpm_backend_destroy(TPMBackend *s);
--
--/**
-  * tpm_backend_init:
-  * @s: the backend to initialized
-  * @state: TPMState
-diff --git a/tpm.c b/tpm.c
-index b7166ca200..7feb3b43c9 100644
---- a/tpm.c
-+++ b/tpm.c
-@@ -158,7 +158,7 @@ void tpm_cleanup(void)
- 
-     QLIST_FOREACH_SAFE(drv, &tpm_backends, list, next) {
-         QLIST_REMOVE(drv, list);
--        tpm_backend_destroy(drv);
-+        object_unref(OBJECT(drv));
-     }
- }
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch b/meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch
deleted file mode 100644
index eb456f01c7..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0006-tpm-backend-Made-few-interface-methods-optional.patch
+++ /dev/null
@@ -1,284 +0,0 @@
-From 47e6ef6586401e82e652f3c013a349bba3a0479b Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Thu, 30 Mar 2017 18:04:16 +0300
-Subject: [PATCH 06/12] tpm-backend: Made few interface methods optional
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This allows backend implementations left optional interface methods.
-For mandatory methods assertion checks added.
-
-Took the opportunity to remove unused methods:
- - tpm_backend_get_desc()
- - TPMDriverOps->handle_startup_error
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Reviewed-by: Stefan Berger<stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Backport [93330cf542b920b6ea5fea8120a08b76bb353113]
----
- backends/tpm.c               | 39 ++++++++++++++++++++++++---------------
- hw/tpm/tpm_passthrough.c     | 36 +-----------------------------------
- include/sysemu/tpm_backend.h | 13 ++-----------
- tpm.c                        |  2 +-
- 4 files changed, 28 insertions(+), 62 deletions(-)
-
-diff --git a/backends/tpm.c b/backends/tpm.c
-index cf5abf1582..8911597fab 100644
---- a/backends/tpm.c
-+++ b/backends/tpm.c
-@@ -44,13 +44,6 @@ enum TpmType tpm_backend_get_type(TPMBackend *s)
-     return k->ops->type;
- }
- 
--const char *tpm_backend_get_desc(TPMBackend *s)
--{
--    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
--
--    return k->ops->desc();
--}
--
- int tpm_backend_init(TPMBackend *s, TPMState *state,
-                      TPMRecvDataCB *datacb)
- {
-@@ -58,12 +51,14 @@ int tpm_backend_init(TPMBackend *s, TPMState *state,
- 
-     s->tpm_state = state;
-     s->recv_data_callback = datacb;
-+    s->had_startup_error = false;
- 
--    return k->ops->init(s);
-+    return k->ops->init ? k->ops->init(s) : 0;
- }
- 
- int tpm_backend_startup_tpm(TPMBackend *s)
- {
-+    int res = 0;
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
-     /* terminate a running TPM */
-@@ -73,20 +68,24 @@ int tpm_backend_startup_tpm(TPMBackend *s)
-                                        NULL);
-     g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_INIT, NULL);
- 
--    return k->ops->startup_tpm(s);
-+    res = k->ops->startup_tpm ? k->ops->startup_tpm(s) : 0;
-+
-+    s->had_startup_error = (res != 0);
-+
-+    return res;
- }
- 
- bool tpm_backend_had_startup_error(TPMBackend *s)
- {
--    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
--
--    return k->ops->had_startup_error(s);
-+    return s->had_startup_error;
- }
- 
- size_t tpm_backend_realloc_buffer(TPMBackend *s, TPMSizedBuffer *sb)
- {
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
-+    assert(k->ops->realloc_buffer);
-+
-     return k->ops->realloc_buffer(sb);
- }
- 
-@@ -100,15 +99,21 @@ void tpm_backend_reset(TPMBackend *s)
- {
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
--    k->ops->reset(s);
-+    if (k->ops->reset) {
-+        k->ops->reset(s);
-+    }
- 
-     tpm_backend_thread_end(s);
-+
-+    s->had_startup_error = false;
- }
- 
- void tpm_backend_cancel_cmd(TPMBackend *s)
- {
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
-+    assert(k->ops->cancel_cmd);
-+
-     k->ops->cancel_cmd(s);
- }
- 
-@@ -116,20 +121,24 @@ bool tpm_backend_get_tpm_established_flag(TPMBackend *s)
- {
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
--    return k->ops->get_tpm_established_flag(s);
-+    return k->ops->get_tpm_established_flag ?
-+           k->ops->get_tpm_established_flag(s) : false;
- }
- 
- int tpm_backend_reset_tpm_established_flag(TPMBackend *s, uint8_t locty)
- {
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
--    return k->ops->reset_tpm_established_flag(s, locty);
-+    return k->ops->reset_tpm_established_flag ?
-+           k->ops->reset_tpm_established_flag(s, locty) : 0;
- }
- 
- TPMVersion tpm_backend_get_tpm_version(TPMBackend *s)
- {
-     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
- 
-+    assert(k->ops->get_tpm_version);
-+
-     return k->ops->get_tpm_version(s);
- }
- 
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index 815a72ef9a..4c21e52b7c 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -54,7 +54,6 @@ struct TPMPassthruState {
-     bool tpm_executing;
-     bool tpm_op_canceled;
-     int cancel_fd;
--    bool had_startup_error;
- 
-     TPMVersion tpm_version;
- };
-@@ -227,29 +226,11 @@ static void tpm_passthrough_handle_request(TPMBackend *tb, TPMBackendCmd cmd)
-     }
- }
- 
--/*
-- * Start the TPM (thread). If it had been started before, then terminate
-- * and start it again.
-- */
--static int tpm_passthrough_startup_tpm(TPMBackend *tb)
--{
--    return 0;
--}
--
- static void tpm_passthrough_reset(TPMBackend *tb)
- {
--    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
--
-     DPRINTF("tpm_passthrough: CALL TO TPM_RESET!\n");
- 
-     tpm_passthrough_cancel_cmd(tb);
--
--    tpm_pt->had_startup_error = false;
--}
--
--static int tpm_passthrough_init(TPMBackend *tb)
--{
--    return 0;
- }
- 
- static bool tpm_passthrough_get_tpm_established_flag(TPMBackend *tb)
-@@ -264,13 +245,6 @@ static int tpm_passthrough_reset_tpm_established_flag(TPMBackend *tb,
-     return 0;
- }
- 
--static bool tpm_passthrough_get_startup_error(TPMBackend *tb)
--{
--    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
--
--    return tpm_pt->had_startup_error;
--}
--
- static size_t tpm_passthrough_realloc_buffer(TPMSizedBuffer *sb)
- {
-     size_t wanted_size = 4096; /* Linux tpm.c buffer size */
-@@ -309,11 +283,6 @@ static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
-     }
- }
- 
--static const char *tpm_passthrough_create_desc(void)
--{
--    return "Passthrough TPM backend driver";
--}
--
- static TPMVersion tpm_passthrough_get_tpm_version(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-@@ -453,13 +422,10 @@ static const QemuOptDesc tpm_passthrough_cmdline_opts[] = {
- static const TPMDriverOps tpm_passthrough_driver = {
-     .type                     = TPM_TYPE_PASSTHROUGH,
-     .opts                     = tpm_passthrough_cmdline_opts,
--    .desc                     = tpm_passthrough_create_desc,
-+    .desc                     = "Passthrough TPM backend driver",
-     .create                   = tpm_passthrough_create,
--    .init                     = tpm_passthrough_init,
--    .startup_tpm              = tpm_passthrough_startup_tpm,
-     .realloc_buffer           = tpm_passthrough_realloc_buffer,
-     .reset                    = tpm_passthrough_reset,
--    .had_startup_error        = tpm_passthrough_get_startup_error,
-     .cancel_cmd               = tpm_passthrough_cancel_cmd,
-     .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
-     .reset_tpm_established_flag = tpm_passthrough_reset_tpm_established_flag,
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index 202ec8d5a2..9ea707253a 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -47,6 +47,7 @@ struct TPMBackend {
-     TPMState *tpm_state;
-     GThreadPool *thread_pool;
-     TPMRecvDataCB *recv_data_callback;
-+    bool had_startup_error;
- 
-     char *id;
-     enum TpmModel fe_model;
-@@ -75,7 +76,7 @@ struct TPMDriverOps {
-     enum TpmType type;
-     const QemuOptDesc *opts;
-     /* get a descriptive text of the backend to display to the user */
--    const char *(*desc)(void);
-+    const char *desc;
- 
-     TPMBackend *(*create)(QemuOpts *opts, const char *id);
- 
-@@ -83,8 +84,6 @@ struct TPMDriverOps {
-     int (*init)(TPMBackend *t);
-     /* start up the TPM on the backend */
-     int (*startup_tpm)(TPMBackend *t);
--    /* returns true if nothing will ever answer TPM requests */
--    bool (*had_startup_error)(TPMBackend *t);
- 
-     size_t (*realloc_buffer)(TPMSizedBuffer *sb);
- 
-@@ -109,14 +108,6 @@ struct TPMDriverOps {
- enum TpmType tpm_backend_get_type(TPMBackend *s);
- 
- /**
-- * tpm_backend_get_desc:
-- * @s: the backend
-- *
-- * Returns a human readable description of the backend.
-- */
--const char *tpm_backend_get_desc(TPMBackend *s);
--
--/**
-  * tpm_backend_init:
-  * @s: the backend to initialized
-  * @state: TPMState
-diff --git a/tpm.c b/tpm.c
-index 7feb3b43c9..9f4f37da50 100644
---- a/tpm.c
-+++ b/tpm.c
-@@ -63,7 +63,7 @@ static void tpm_display_backend_drivers(void)
-             continue;
-         }
-         fprintf(stderr, "%12s   %s\n",
--                TpmType_lookup[i], be_drivers[i]->desc());
-+                TpmType_lookup[i], be_drivers[i]->desc);
-     }
-     fprintf(stderr, "\n");
- }
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch b/meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch
deleted file mode 100644
index 6d79ac4d63..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch
+++ /dev/null
@@ -1,293 +0,0 @@
-From 5f698395b5de1ab2826f5aad99d757ce31d7c95f Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Mon, 6 Mar 2017 00:10:10 +0200
-Subject: [PATCH 07/12] tpm backend: Add new api to read backend TpmInfo
-
-TPM configuration options are backend implementation details and shall not be
-part of base TPMBackend object, and these shall not be accessed directly outside
-of the class, hence added a new interface method, get_tpm_options() to
-TPMDriverOps., which shall be implemented by the derived classes to return
-configured tpm options.
-
-A new tpm backend api - tpm_backend_query_tpm() which uses _get_tpm_options() to
-prepare TpmInfo.
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-
-Upstream-Status: Backport[f59864ba3aedd26aef7c84545cc1e565caccebf7]
----
- backends/tpm.c               | 15 +++++++++++--
- hw/tpm/tpm_passthrough.c     | 51 +++++++++++++++++++++++++++-----------------
- include/sysemu/tpm_backend.h | 15 +++++++++++--
- tpm.c                        | 32 +--------------------------
- 4 files changed, 59 insertions(+), 54 deletions(-)
-
-diff --git a/backends/tpm.c b/backends/tpm.c
-index 8911597fab..de313c9d5a 100644
---- a/backends/tpm.c
-+++ b/backends/tpm.c
-@@ -142,6 +142,19 @@ TPMVersion tpm_backend_get_tpm_version(TPMBackend *s)
-     return k->ops->get_tpm_version(s);
- }
- 
-+TPMInfo *tpm_backend_query_tpm(TPMBackend *s)
-+{
-+    TPMInfo *info = g_new0(TPMInfo, 1);
-+    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
-+
-+    info->id = g_strdup(s->id);
-+    info->model = s->fe_model;
-+    info->options = k->ops->get_tpm_options ?
-+                    k->ops->get_tpm_options(s) : NULL;
-+
-+    return info;
-+}
-+
- static bool tpm_backend_prop_get_opened(Object *obj, Error **errp)
- {
-     TPMBackend *s = TPM_BACKEND(obj);
-@@ -196,8 +209,6 @@ static void tpm_backend_instance_finalize(Object *obj)
-     TPMBackend *s = TPM_BACKEND(obj);
- 
-     g_free(s->id);
--    g_free(s->path);
--    g_free(s->cancel_path);
-     tpm_backend_thread_end(s);
- }
- 
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index 4c21e52b7c..84fc49a4d3 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -30,6 +30,7 @@
- #include "tpm_int.h"
- #include "hw/hw.h"
- #include "hw/i386/pc.h"
-+#include "qapi/clone-visitor.h"
- #include "tpm_tis.h"
- #include "tpm_util.h"
- 
-@@ -49,7 +50,8 @@
- struct TPMPassthruState {
-     TPMBackend parent;
- 
--    char *tpm_dev;
-+    TPMPassthroughOptions *options;
-+    const char *tpm_dev;
-     int tpm_fd;
-     bool tpm_executing;
-     bool tpm_op_canceled;
-@@ -296,15 +298,14 @@ static TPMVersion tpm_passthrough_get_tpm_version(TPMBackend *tb)
-  * in Documentation/ABI/stable/sysfs-class-tpm.
-  * From /dev/tpm0 create /sys/class/misc/tpm0/device/cancel
-  */
--static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
-+static int tpm_passthrough_open_sysfs_cancel(TPMPassthruState *tpm_pt)
- {
--    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-     int fd = -1;
-     char *dev;
-     char path[PATH_MAX];
- 
--    if (tb->cancel_path) {
--        fd = qemu_open(tb->cancel_path, O_WRONLY);
-+    if (tpm_pt->options->cancel_path) {
-+        fd = qemu_open(tpm_pt->options->cancel_path, O_WRONLY);
-         if (fd < 0) {
-             error_report("Could not open TPM cancel path : %s",
-                          strerror(errno));
-@@ -319,7 +320,7 @@ static int tpm_passthrough_open_sysfs_cancel(TPMBackend *tb)
-                      dev) < sizeof(path)) {
-             fd = qemu_open(path, O_WRONLY);
-             if (fd >= 0) {
--                tb->cancel_path = g_strdup(path);
-+                tpm_pt->options->cancel_path = g_strdup(path);
-             } else {
-                 error_report("tpm_passthrough: Could not open TPM cancel "
-                              "path %s : %s", path, strerror(errno));
-@@ -339,17 +340,18 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
-     const char *value;
- 
-     value = qemu_opt_get(opts, "cancel-path");
--    tb->cancel_path = g_strdup(value);
-+    if (value) {
-+        tpm_pt->options->cancel_path = g_strdup(value);
-+        tpm_pt->options->has_cancel_path = true;
-+    }
- 
-     value = qemu_opt_get(opts, "path");
--    if (!value) {
--        value = TPM_PASSTHROUGH_DEFAULT_DEVICE;
-+    if (value) {
-+        tpm_pt->options->has_path = true;
-+        tpm_pt->options->path = g_strdup(value);
-     }
- 
--    tpm_pt->tpm_dev = g_strdup(value);
--
--    tb->path = g_strdup(tpm_pt->tpm_dev);
--
-+    tpm_pt->tpm_dev = value ? value : TPM_PASSTHROUGH_DEFAULT_DEVICE;
-     tpm_pt->tpm_fd = qemu_open(tpm_pt->tpm_dev, O_RDWR);
-     if (tpm_pt->tpm_fd < 0) {
-         error_report("Cannot access TPM device using '%s': %s",
-@@ -370,10 +372,8 @@ static int tpm_passthrough_handle_device_opts(QemuOpts *opts, TPMBackend *tb)
-     tpm_pt->tpm_fd = -1;
- 
-  err_free_parameters:
--    g_free(tb->path);
--    tb->path = NULL;
--
--    g_free(tpm_pt->tpm_dev);
-+    qapi_free_TPMPassthroughOptions(tpm_pt->options);
-+    tpm_pt->options = NULL;
-     tpm_pt->tpm_dev = NULL;
- 
-     return 1;
-@@ -391,7 +391,7 @@ static TPMBackend *tpm_passthrough_create(QemuOpts *opts, const char *id)
-         goto err_exit;
-     }
- 
--    tpm_pt->cancel_fd = tpm_passthrough_open_sysfs_cancel(tb);
-+    tpm_pt->cancel_fd = tpm_passthrough_open_sysfs_cancel(tpm_pt);
-     if (tpm_pt->cancel_fd < 0) {
-         goto err_exit;
-     }
-@@ -404,6 +404,17 @@ err_exit:
-     return NULL;
- }
- 
-+static TpmTypeOptions *tpm_passthrough_get_tpm_options(TPMBackend *tb)
-+{
-+    TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
-+
-+    options->type = TPM_TYPE_OPTIONS_KIND_PASSTHROUGH;
-+    options->u.passthrough.data = QAPI_CLONE(TPMPassthroughOptions,
-+                                             TPM_PASSTHROUGH(tb)->options);
-+
-+    return options;
-+}
-+
- static const QemuOptDesc tpm_passthrough_cmdline_opts[] = {
-     TPM_STANDARD_CMDLINE_OPTS,
-     {
-@@ -430,12 +441,14 @@ static const TPMDriverOps tpm_passthrough_driver = {
-     .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
-     .reset_tpm_established_flag = tpm_passthrough_reset_tpm_established_flag,
-     .get_tpm_version          = tpm_passthrough_get_tpm_version,
-+    .get_tpm_options          = tpm_passthrough_get_tpm_options,
- };
- 
- static void tpm_passthrough_inst_init(Object *obj)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(obj);
- 
-+    tpm_pt->options = g_new0(TPMPassthroughOptions, 1);
-     tpm_pt->tpm_fd = -1;
-     tpm_pt->cancel_fd = -1;
- }
-@@ -448,7 +461,7 @@ static void tpm_passthrough_inst_finalize(Object *obj)
- 
-     qemu_close(tpm_pt->tpm_fd);
-     qemu_close(tpm_pt->cancel_fd);
--    g_free(tpm_pt->tpm_dev);
-+    qapi_free_TPMPassthroughOptions(tpm_pt->options);
- }
- 
- static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index 9ea707253a..e96c1918cc 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -49,10 +49,9 @@ struct TPMBackend {
-     TPMRecvDataCB *recv_data_callback;
-     bool had_startup_error;
- 
-+    /* <public> */
-     char *id;
-     enum TpmModel fe_model;
--    char *path;
--    char *cancel_path;
- 
-     QLIST_ENTRY(TPMBackend) list;
- };
-@@ -96,6 +95,8 @@ struct TPMDriverOps {
-     int (*reset_tpm_established_flag)(TPMBackend *t, uint8_t locty);
- 
-     TPMVersion (*get_tpm_version)(TPMBackend *t);
-+
-+    TpmTypeOptions *(*get_tpm_options)(TPMBackend *t);
- };
- 
- 
-@@ -214,6 +215,16 @@ void tpm_backend_open(TPMBackend *s, Error **errp);
-  */
- TPMVersion tpm_backend_get_tpm_version(TPMBackend *s);
- 
-+/**
-+ * tpm_backend_query_tpm:
-+ * @s: the backend
-+ *
-+ * Query backend tpm info
-+ *
-+ * Returns newly allocated TPMInfo
-+ */
-+TPMInfo *tpm_backend_query_tpm(TPMBackend *s);
-+
- TPMBackend *qemu_find_tpm(const char *id);
- 
- const TPMDriverOps *tpm_get_backend_driver(const char *type);
-diff --git a/tpm.c b/tpm.c
-index 9f4f37da50..cac400ef3e 100644
---- a/tpm.c
-+++ b/tpm.c
-@@ -203,36 +203,6 @@ static const TPMDriverOps *tpm_driver_find_by_type(enum TpmType type)
-     return be_drivers[type];
- }
- 
--static TPMInfo *qmp_query_tpm_inst(TPMBackend *drv)
--{
--    TPMInfo *res = g_new0(TPMInfo, 1);
--    TPMPassthroughOptions *tpo;
--
--    res->id = g_strdup(drv->id);
--    res->model = drv->fe_model;
--    res->options = g_new0(TpmTypeOptions, 1);
--
--    switch (tpm_backend_get_type(drv)) {
--    case TPM_TYPE_PASSTHROUGH:
--        res->options->type = TPM_TYPE_OPTIONS_KIND_PASSTHROUGH;
--        tpo = g_new0(TPMPassthroughOptions, 1);
--        res->options->u.passthrough.data = tpo;
--        if (drv->path) {
--            tpo->path = g_strdup(drv->path);
--            tpo->has_path = true;
--        }
--        if (drv->cancel_path) {
--            tpo->cancel_path = g_strdup(drv->cancel_path);
--            tpo->has_cancel_path = true;
--        }
--        break;
--    case TPM_TYPE__MAX:
--        break;
--    }
--
--    return res;
--}
--
- /*
-  * Walk the list of active TPM backends and collect information about them
-  * following the schema description in qapi-schema.json.
-@@ -247,7 +217,7 @@ TPMInfoList *qmp_query_tpm(Error **errp)
-             continue;
-         }
-         info = g_new0(TPMInfoList, 1);
--        info->value = qmp_query_tpm_inst(drv);
-+        info->value = tpm_backend_query_tpm(drv);
- 
-         if (!cur_item) {
-             head = cur_item = info;
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch b/meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch
deleted file mode 100644
index 94cc6c542c..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 02189909fdc5e73b3ca54362084c16f0b67a3fdf Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Fri, 7 Apr 2017 10:57:28 +0300
-Subject: [PATCH 08/12] tpm-backend: Move realloc_buffer() implementation to
- tpm-tis model
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-buffer reallocation is very unlikely to be backend specific. Hence move inside
-the tis.
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-
-Upstream-Status: Backport [d0c519bdffa303d141727369e55b157c45b03147]
----
- backends/tpm.c               |  9 ---------
- hw/tpm/tpm_passthrough.c     | 12 ------------
- hw/tpm/tpm_tis.c             | 14 ++++++++++++--
- include/sysemu/tpm_backend.h | 12 ------------
- 4 files changed, 12 insertions(+), 35 deletions(-)
-
-diff --git a/backends/tpm.c b/backends/tpm.c
-index de313c9d5a..37c84b7c66 100644
---- a/backends/tpm.c
-+++ b/backends/tpm.c
-@@ -80,15 +80,6 @@ bool tpm_backend_had_startup_error(TPMBackend *s)
-     return s->had_startup_error;
- }
- 
--size_t tpm_backend_realloc_buffer(TPMBackend *s, TPMSizedBuffer *sb)
--{
--    TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
--
--    assert(k->ops->realloc_buffer);
--
--    return k->ops->realloc_buffer(sb);
--}
--
- void tpm_backend_deliver_request(TPMBackend *s)
- {
-     g_thread_pool_push(s->thread_pool, (gpointer)TPM_BACKEND_CMD_PROCESS_CMD,
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index 84fc49a4d3..22d3460550 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -247,17 +247,6 @@ static int tpm_passthrough_reset_tpm_established_flag(TPMBackend *tb,
-     return 0;
- }
- 
--static size_t tpm_passthrough_realloc_buffer(TPMSizedBuffer *sb)
--{
--    size_t wanted_size = 4096; /* Linux tpm.c buffer size */
--
--    if (sb->size != wanted_size) {
--        sb->buffer = g_realloc(sb->buffer, wanted_size);
--        sb->size = wanted_size;
--    }
--    return sb->size;
--}
--
- static void tpm_passthrough_cancel_cmd(TPMBackend *tb)
- {
-     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
-@@ -435,7 +424,6 @@ static const TPMDriverOps tpm_passthrough_driver = {
-     .opts                     = tpm_passthrough_cmdline_opts,
-     .desc                     = "Passthrough TPM backend driver",
-     .create                   = tpm_passthrough_create,
--    .realloc_buffer           = tpm_passthrough_realloc_buffer,
-     .reset                    = tpm_passthrough_reset,
-     .cancel_cmd               = tpm_passthrough_cancel_cmd,
-     .get_tpm_established_flag = tpm_passthrough_get_tpm_established_flag,
-diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
-index a6440fef91..d5118e7f60 100644
---- a/hw/tpm/tpm_tis.c
-+++ b/hw/tpm/tpm_tis.c
-@@ -963,6 +963,16 @@ static int tpm_tis_do_startup_tpm(TPMState *s)
-     return tpm_backend_startup_tpm(s->be_driver);
- }
- 
-+static void tpm_tis_realloc_buffer(TPMSizedBuffer *sb)
-+{
-+    size_t wanted_size = 4096; /* Linux tpm.c buffer size */
-+
-+    if (sb->size != wanted_size) {
-+        sb->buffer = g_realloc(sb->buffer, wanted_size);
-+        sb->size = wanted_size;
-+    }
-+}
-+
- /*
-  * Get the TPMVersion of the backend device being used
-  */
-@@ -1010,9 +1020,9 @@ static void tpm_tis_reset(DeviceState *dev)
-         tis->loc[c].state = TPM_TIS_STATE_IDLE;
- 
-         tis->loc[c].w_offset = 0;
--        tpm_backend_realloc_buffer(s->be_driver, &tis->loc[c].w_buffer);
-+        tpm_tis_realloc_buffer(&tis->loc[c].w_buffer);
-         tis->loc[c].r_offset = 0;
--        tpm_backend_realloc_buffer(s->be_driver, &tis->loc[c].r_buffer);
-+        tpm_tis_realloc_buffer(&tis->loc[c].r_buffer);
-     }
- 
-     tpm_tis_do_startup_tpm(s);
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
-index e96c1918cc..2c798a1eb4 100644
---- a/include/sysemu/tpm_backend.h
-+++ b/include/sysemu/tpm_backend.h
-@@ -84,8 +84,6 @@ struct TPMDriverOps {
-     /* start up the TPM on the backend */
-     int (*startup_tpm)(TPMBackend *t);
- 
--    size_t (*realloc_buffer)(TPMSizedBuffer *sb);
--
-     void (*reset)(TPMBackend *t);
- 
-     void (*cancel_cmd)(TPMBackend *t);
-@@ -140,16 +138,6 @@ int tpm_backend_startup_tpm(TPMBackend *s);
- bool tpm_backend_had_startup_error(TPMBackend *s);
- 
- /**
-- * tpm_backend_realloc_buffer:
-- * @s: the backend
-- * @sb: the TPMSizedBuffer to re-allocated to the size suitable for the
-- *      backend.
-- *
-- * This function returns the size of the allocated buffer
-- */
--size_t tpm_backend_realloc_buffer(TPMBackend *s, TPMSizedBuffer *sb);
--
--/**
-  * tpm_backend_deliver_request:
-  * @s: the backend to send the request to
-  *
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch b/meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch
deleted file mode 100644
index 8670b8a0d3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0009-tpm-passthrough-move-reusable-code-to-utils.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From b8322aaa2f31995e1b7b776e7efae68416573bc3 Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Wed, 29 Mar 2017 15:36:47 +0300
-Subject: [PATCH 09/12] tpm-passthrough: move reusable code to utils
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-
-Upstream-Status: Backport [4a3d80980ebf71d8faf9d0ce2e2e23bdda5728df]
----
- hw/tpm/tpm_passthrough.c | 64 ++++--------------------------------------------
- hw/tpm/tpm_util.c        | 25 +++++++++++++++++++
- hw/tpm/tpm_util.h        |  4 +++
- 3 files changed, 34 insertions(+), 59 deletions(-)
-
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
-index 22d3460550..e6ace28b04 100644
---- a/hw/tpm/tpm_passthrough.c
-+++ b/hw/tpm/tpm_passthrough.c
-@@ -68,27 +68,6 @@ typedef struct TPMPassthruState TPMPassthruState;
- 
- static void tpm_passthrough_cancel_cmd(TPMBackend *tb);
- 
--static int tpm_passthrough_unix_write(int fd, const uint8_t *buf, uint32_t len)
--{
--    int ret, remain;
--
--    remain = len;
--    while (remain > 0) {
--        ret = write(fd, buf, remain);
--        if (ret < 0) {
--            if (errno != EINTR && errno != EAGAIN) {
--                return -1;
--            }
--        } else if (ret == 0) {
--            break;
--        } else {
--            buf += ret;
--            remain -= ret;
--        }
--    }
--    return len - remain;
--}
--
- static int tpm_passthrough_unix_read(int fd, uint8_t *buf, uint32_t len)
- {
-     int ret;
-@@ -102,45 +81,12 @@ static int tpm_passthrough_unix_read(int fd, uint8_t *buf, uint32_t len)
-     }
-     return ret;
- }
--
--static uint32_t tpm_passthrough_get_size_from_buffer(const uint8_t *buf)
--{
--    struct tpm_resp_hdr *resp = (struct tpm_resp_hdr *)buf;
--
--    return be32_to_cpu(resp->len);
--}
--
--/*
-- * Write an error message in the given output buffer.
-- */
--static void tpm_write_fatal_error_response(uint8_t *out, uint32_t out_len)
--{
--    if (out_len >= sizeof(struct tpm_resp_hdr)) {
--        struct tpm_resp_hdr *resp = (struct tpm_resp_hdr *)out;
--
--        resp->tag = cpu_to_be16(TPM_TAG_RSP_COMMAND);
--        resp->len = cpu_to_be32(sizeof(struct tpm_resp_hdr));
--        resp->errcode = cpu_to_be32(TPM_FAIL);
--    }
--}
--
--static bool tpm_passthrough_is_selftest(const uint8_t *in, uint32_t in_len)
--{
--    struct tpm_req_hdr *hdr = (struct tpm_req_hdr *)in;
--
--    if (in_len >= sizeof(*hdr)) {
--        return (be32_to_cpu(hdr->ordinal) == TPM_ORD_ContinueSelfTest);
--    }
--
--    return false;
--}
--
- static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
-                                         const uint8_t *in, uint32_t in_len,
-                                         uint8_t *out, uint32_t out_len,
-                                         bool *selftest_done)
- {
--    int ret;
-+    ssize_t ret;
-     bool is_selftest;
-     const struct tpm_resp_hdr *hdr;
- 
-@@ -148,9 +94,9 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
-     tpm_pt->tpm_executing = true;
-     *selftest_done = false;
- 
--    is_selftest = tpm_passthrough_is_selftest(in, in_len);
-+    is_selftest = tpm_util_is_selftest(in, in_len);
- 
--    ret = tpm_passthrough_unix_write(tpm_pt->tpm_fd, in, in_len);
-+    ret = qemu_write_full(tpm_pt->tpm_fd, (const void *)in, (size_t)in_len);
-     if (ret != in_len) {
-         if (!tpm_pt->tpm_op_canceled || errno != ECANCELED) {
-             error_report("tpm_passthrough: error while transmitting data "
-@@ -170,7 +116,7 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
-                          strerror(errno), errno);
-         }
-     } else if (ret < sizeof(struct tpm_resp_hdr) ||
--               tpm_passthrough_get_size_from_buffer(out) != ret) {
-+               be32_to_cpu(((struct tpm_resp_hdr *)out)->len) != ret) {
-         ret = -1;
-         error_report("tpm_passthrough: received invalid response "
-                      "packet from TPM");
-@@ -183,7 +129,7 @@ static int tpm_passthrough_unix_tx_bufs(TPMPassthruState *tpm_pt,
- 
- err_exit:
-     if (ret < 0) {
--        tpm_write_fatal_error_response(out, out_len);
-+        tpm_util_write_fatal_error_response(out, out_len);
-     }
- 
-     tpm_pt->tpm_executing = false;
-diff --git a/hw/tpm/tpm_util.c b/hw/tpm/tpm_util.c
-index 7b35429725..fb929f6e92 100644
---- a/hw/tpm/tpm_util.c
-+++ b/hw/tpm/tpm_util.c
-@@ -24,6 +24,31 @@
- #include "tpm_int.h"
- 
- /*
-+ * Write an error message in the given output buffer.
-+ */
-+void tpm_util_write_fatal_error_response(uint8_t *out, uint32_t out_len)
-+{
-+    if (out_len >= sizeof(struct tpm_resp_hdr)) {
-+        struct tpm_resp_hdr *resp = (struct tpm_resp_hdr *)out;
-+
-+        resp->tag = cpu_to_be16(TPM_TAG_RSP_COMMAND);
-+        resp->len = cpu_to_be32(sizeof(struct tpm_resp_hdr));
-+        resp->errcode = cpu_to_be32(TPM_FAIL);
-+    }
-+}
-+
-+bool tpm_util_is_selftest(const uint8_t *in, uint32_t in_len)
-+{
-+    struct tpm_req_hdr *hdr = (struct tpm_req_hdr *)in;
-+
-+    if (in_len >= sizeof(*hdr)) {
-+        return (be32_to_cpu(hdr->ordinal) == TPM_ORD_ContinueSelfTest);
-+    }
-+
-+    return false;
-+}
-+
-+/*
-  * A basic test of a TPM device. We expect a well formatted response header
-  * (error response is fine) within one second.
-  */
-diff --git a/hw/tpm/tpm_util.h b/hw/tpm/tpm_util.h
-index df76245e6e..2f7c96146d 100644
---- a/hw/tpm/tpm_util.h
-+++ b/hw/tpm/tpm_util.h
-@@ -24,6 +24,10 @@
- 
- #include "sysemu/tpm_backend.h"
- 
-+void tpm_util_write_fatal_error_response(uint8_t *out, uint32_t out_len);
-+
-+bool tpm_util_is_selftest(const uint8_t *in, uint32_t in_len);
-+
- int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version);
- 
- #endif /* TPM_TPM_UTIL_H */
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch b/meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch
deleted file mode 100644
index 968e12e88a..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0010-tpm-Added-support-for-TPM-emulator.patch
+++ /dev/null
@@ -1,1059 +0,0 @@
-From 70e73b7c6c7cf982d645db9c81c74588e6b10a2b Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Wed, 29 Mar 2017 15:39:41 +0300
-Subject: [PATCH 10/12] tpm: Added support for TPM emulator
-
-This change introduces a new TPM backend driver that can communicate with
-swtpm(software TPM emulator) using unix domain socket interface. QEMU talks to
-TPM emulator using QEMU's socket-based chardev backend device.
-
-Swtpm uses two Unix sockets for communications, one for plain TPM commands and
-responses, and one for out-of-band control messages. QEMU passes data socket to
-be used over the control channel.
-
-The swtpm and associated tools can be found here:
-    https://github.com/stefanberger/swtpm
-
-The swtpm's control channel protocol specification can be found here:
-    https://github.com/stefanberger/swtpm/wiki/Control-Channel-Specification
-
-Usage:
-    # setup TPM state directory
-    mkdir /tmp/mytpm
-    chown -R tss:root /tmp/mytpm
-    /usr/bin/swtpm_setup --tpm-state /tmp/mytpm --createek
-
-    # Ask qemu to use TPM emulator with given tpm state directory
-    qemu-system-x86_64 \
-        [...] \
-        -chardev socket,id=chrtpm,path=/tmp/swtpm-sock \
-        -tpmdev emulator,id=tpm0,chardev=chrtpm \
-        -device tpm-tis,tpmdev=tpm0 \
-        [...]
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-
-Upstream-Status: Backport [f4ede81eed29e6140374177d1f2808248c5b5650]
----
- configure             |  13 +-
- hmp.c                 |   5 +
- hw/tpm/Makefile.objs  |   1 +
- hw/tpm/tpm_emulator.c | 583 ++++++++++++++++++++++++++++++++++++++++++++++++++
- hw/tpm/tpm_ioctl.h    | 246 +++++++++++++++++++++
- qapi-schema.json      |  18 +-
- qemu-options.hx       |  22 +-
- 7 files changed, 882 insertions(+), 6 deletions(-)
- create mode 100644 hw/tpm/tpm_emulator.c
- create mode 100644 hw/tpm/tpm_ioctl.h
-
-diff --git a/configure b/configure
-index dd73cce62f..9a25537096 100755
---- a/configure
-+++ b/configure
-@@ -3503,6 +3503,12 @@ else
-   tpm_passthrough=no
- fi
- 
-+# TPM emulator is for all posix systems
-+if test "$mingw32" != "yes"; then
-+  tpm_emulator=$tpm
-+else
-+  tpm_emulator=no
-+fi
- ##########################################
- # attr probe
- 
-@@ -5396,6 +5402,7 @@ echo "gcov enabled      $gcov"
- echo "TPM support       $tpm"
- echo "libssh2 support   $libssh2"
- echo "TPM passthrough   $tpm_passthrough"
-+echo "TPM emulator      $tpm_emulator"
- echo "QOM debugging     $qom_cast_debug"
- echo "Live block migration $live_block_migration"
- echo "lzo support       $lzo"
-@@ -5983,12 +5990,16 @@ else
-   echo "HOST_USB=stub" >> $config_host_mak
- fi
- 
--# TPM passthrough support?
- if test "$tpm" = "yes"; then
-   echo 'CONFIG_TPM=$(CONFIG_SOFTMMU)' >> $config_host_mak
-+  # TPM passthrough support?
-   if test "$tpm_passthrough" = "yes"; then
-     echo "CONFIG_TPM_PASSTHROUGH=y" >> $config_host_mak
-   fi
-+  # TPM emulator support?
-+  if test "$tpm_emulator" = "yes"; then
-+    echo "CONFIG_TPM_EMULATOR=y" >> $config_host_mak
-+  fi
- fi
- 
- echo "TRACE_BACKENDS=$trace_backends" >> $config_host_mak
-diff --git a/hmp.c b/hmp.c
-index fd80dce758..820aa8f002 100644
---- a/hmp.c
-+++ b/hmp.c
-@@ -995,6 +995,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
-     Error *err = NULL;
-     unsigned int c = 0;
-     TPMPassthroughOptions *tpo;
-+    TPMEmulatorOptions *teo;
- 
-     info_list = qmp_query_tpm(&err);
-     if (err) {
-@@ -1024,6 +1025,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
-                            tpo->has_cancel_path ? ",cancel-path=" : "",
-                            tpo->has_cancel_path ? tpo->cancel_path : "");
-             break;
-+        case TPM_TYPE_OPTIONS_KIND_EMULATOR:
-+            teo = ti->options->u.emulator.data;
-+            monitor_printf(mon, ",chardev=%s", teo->chardev);
-+            break;
-         case TPM_TYPE_OPTIONS_KIND__MAX:
-             break;
-         }
-diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
-index 64cecc3b67..41f0b7a590 100644
---- a/hw/tpm/Makefile.objs
-+++ b/hw/tpm/Makefile.objs
-@@ -1,2 +1,3 @@
- common-obj-$(CONFIG_TPM_TIS) += tpm_tis.o
- common-obj-$(CONFIG_TPM_PASSTHROUGH) += tpm_passthrough.o tpm_util.o
-+common-obj-$(CONFIG_TPM_EMULATOR) += tpm_emulator.o tpm_util.o
-diff --git a/hw/tpm/tpm_emulator.c b/hw/tpm/tpm_emulator.c
-new file mode 100644
-index 0000000000..433bc4fa8a
---- /dev/null
-+++ b/hw/tpm/tpm_emulator.c
-@@ -0,0 +1,583 @@
-+/*
-+ *  Emulator TPM driver
-+ *
-+ *  Copyright (c) 2017 Intel Corporation
-+ *  Author: Amarnath Valluri <amarnath.valluri@intel.com>
-+ *
-+ *  Copyright (c) 2010 - 2013 IBM Corporation
-+ *  Authors:
-+ *    Stefan Berger <stefanb@us.ibm.com>
-+ *
-+ *  Copyright (C) 2011 IAIK, Graz University of Technology
-+ *    Author: Andreas Niederl
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
-+ *
-+ */
-+
-+#include "qemu/osdep.h"
-+#include "qemu/error-report.h"
-+#include "qemu/sockets.h"
-+#include "io/channel-socket.h"
-+#include "sysemu/tpm_backend.h"
-+#include "tpm_int.h"
-+#include "hw/hw.h"
-+#include "hw/i386/pc.h"
-+#include "tpm_util.h"
-+#include "tpm_ioctl.h"
-+#include "migration/blocker.h"
-+#include "qapi/error.h"
-+#include "qapi/clone-visitor.h"
-+#include "chardev/char-fe.h"
-+
-+#include <fcntl.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <stdio.h>
-+
-+#define DEBUG_TPM 0
-+
-+#define DPRINTF(fmt, ...) do { \
-+    if (DEBUG_TPM) { \
-+        fprintf(stderr, "tpm-emulator:"fmt"\n", ## __VA_ARGS__); \
-+    } \
-+} while (0)
-+
-+#define TYPE_TPM_EMULATOR "tpm-emulator"
-+#define TPM_EMULATOR(obj) \
-+    OBJECT_CHECK(TPMEmulator, (obj), TYPE_TPM_EMULATOR)
-+
-+#define TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(S, cap) (((S)->caps & (cap)) == (cap))
-+
-+static const TPMDriverOps tpm_emulator_driver;
-+
-+/* data structures */
-+typedef struct TPMEmulator {
-+    TPMBackend parent;
-+
-+    TPMEmulatorOptions *options;
-+    CharBackend ctrl_chr;
-+    QIOChannel *data_ioc;
-+    TPMVersion tpm_version;
-+    ptm_cap caps; /* capabilities of the TPM */
-+    uint8_t cur_locty_number; /* last set locality */
-+    Error *migration_blocker;
-+} TPMEmulator;
-+
-+
-+static int tpm_emulator_ctrlcmd(CharBackend *dev, unsigned long cmd, void *msg,
-+                                size_t msg_len_in, size_t msg_len_out)
-+{
-+    uint32_t cmd_no = cpu_to_be32(cmd);
-+    ssize_t n = sizeof(uint32_t) + msg_len_in;
-+    uint8_t *buf = NULL;
-+
-+    buf = g_alloca(n);
-+    memcpy(buf, &cmd_no, sizeof(cmd_no));
-+    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
-+
-+    n = qemu_chr_fe_write_all(dev, buf, n);
-+    if (n <= 0) {
-+        return -1;
-+    }
-+
-+    if (msg_len_out != 0) {
-+        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
-+        if (n <= 0) {
-+            return -1;
-+        }
-+    }
-+
-+    return 0;
-+}
-+
-+static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
-+                                     const uint8_t *in, uint32_t in_len,
-+                                     uint8_t *out, uint32_t out_len,
-+                                     bool *selftest_done,
-+                                     Error **err)
-+{
-+    ssize_t ret;
-+    bool is_selftest = false;
-+    const struct tpm_resp_hdr *hdr = NULL;
-+
-+    if (selftest_done) {
-+        *selftest_done = false;
-+        is_selftest = tpm_util_is_selftest(in, in_len);
-+    }
-+
-+    ret = qio_channel_write(tpm_emu->data_ioc, (char *)in, in_len, err);
-+    if (ret != in_len) {
-+        return -1;
-+    }
-+
-+    ret = qio_channel_read(tpm_emu->data_ioc, (char *)out, out_len, err);
-+    if (ret <= 0 || ret < sizeof(*hdr)) {
-+        return -1;
-+    }
-+
-+    hdr = (struct tpm_resp_hdr *)out;
-+    if (be32_to_cpu(hdr->len) != ret) {
-+        return -1;
-+    }
-+
-+    if (is_selftest) {
-+        *selftest_done = (be32_to_cpu(hdr->errcode) == 0);
-+    }
-+
-+    return 0;
-+}
-+
-+static int tpm_emulator_set_locality(TPMEmulator *tpm_emu, uint8_t locty_number)
-+{
-+    ptm_loc loc;
-+
-+    DPRINTF("%s : locality: 0x%x", __func__, locty_number);
-+
-+    if (tpm_emu->cur_locty_number == locty_number) {
-+        return 0;
-+    }
-+
-+    DPRINTF("setting locality : 0x%x", locty_number);
-+    loc.u.req.loc = locty_number;
-+    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_SET_LOCALITY, &loc,
-+                             sizeof(loc), sizeof(loc)) < 0) {
-+        error_report("tpm-emulator: could not set locality : %s",
-+                     strerror(errno));
-+        return -1;
-+    }
-+
-+    loc.u.resp.tpm_result = be32_to_cpu(loc.u.resp.tpm_result);
-+    if (loc.u.resp.tpm_result != 0) {
-+        error_report("tpm-emulator: TPM result for set locality : 0x%x",
-+                     loc.u.resp.tpm_result);
-+        return -1;
-+    }
-+
-+    tpm_emu->cur_locty_number = locty_number;
-+
-+    return 0;
-+}
-+
-+static void tpm_emulator_handle_request(TPMBackend *tb, TPMBackendCmd cmd)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
-+    TPMLocality *locty = NULL;
-+    bool selftest_done = false;
-+    Error *err = NULL;
-+
-+    DPRINTF("processing command type %d", cmd);
-+
-+    switch (cmd) {
-+    case TPM_BACKEND_CMD_PROCESS_CMD:
-+        locty = tb->tpm_state->locty_data;
-+        if (tpm_emulator_set_locality(tpm_emu,
-+                                      tb->tpm_state->locty_number) < 0 ||
-+            tpm_emulator_unix_tx_bufs(tpm_emu, locty->w_buffer.buffer,
-+                                      locty->w_offset, locty->r_buffer.buffer,
-+                                      locty->r_buffer.size, &selftest_done,
-+                                      &err) < 0) {
-+            tpm_util_write_fatal_error_response(locty->r_buffer.buffer,
-+                                                locty->r_buffer.size);
-+            error_report_err(err);
-+        }
-+
-+        tb->recv_data_callback(tb->tpm_state, tb->tpm_state->locty_number,
-+                               selftest_done);
-+
-+        break;
-+    case TPM_BACKEND_CMD_INIT:
-+    case TPM_BACKEND_CMD_END:
-+    case TPM_BACKEND_CMD_TPM_RESET:
-+        /* nothing to do */
-+        break;
-+    }
-+}
-+
-+static int tpm_emulator_probe_caps(TPMEmulator *tpm_emu)
-+{
-+    DPRINTF("%s", __func__);
-+    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_GET_CAPABILITY,
-+                         &tpm_emu->caps, 0, sizeof(tpm_emu->caps)) < 0) {
-+        error_report("tpm-emulator: probing failed : %s", strerror(errno));
-+        return -1;
-+    }
-+
-+    tpm_emu->caps = be64_to_cpu(tpm_emu->caps);
-+
-+    DPRINTF("capbilities : 0x%lx", tpm_emu->caps);
-+
-+    return 0;
-+}
-+
-+static int tpm_emulator_check_caps(TPMEmulator *tpm_emu)
-+{
-+    ptm_cap caps = 0;
-+    const char *tpm = NULL;
-+
-+    /* check for min. required capabilities */
-+    switch (tpm_emu->tpm_version) {
-+    case TPM_VERSION_1_2:
-+        caps = PTM_CAP_INIT | PTM_CAP_SHUTDOWN | PTM_CAP_GET_TPMESTABLISHED |
-+               PTM_CAP_SET_LOCALITY | PTM_CAP_SET_DATAFD;
-+        tpm = "1.2";
-+        break;
-+    case TPM_VERSION_2_0:
-+        caps = PTM_CAP_INIT | PTM_CAP_SHUTDOWN | PTM_CAP_GET_TPMESTABLISHED |
-+               PTM_CAP_SET_LOCALITY | PTM_CAP_RESET_TPMESTABLISHED |
-+               PTM_CAP_SET_DATAFD;
-+        tpm = "2";
-+        break;
-+    case TPM_VERSION_UNSPEC:
-+        error_report("tpm-emulator: TPM version has not been set");
-+        return -1;
-+    }
-+
-+    if (!TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(tpm_emu, caps)) {
-+        error_report("tpm-emulator: TPM does not implement minimum set of "
-+                     "required capabilities for TPM %s (0x%x)", tpm, (int)caps);
-+        return -1;
-+    }
-+
-+    return 0;
-+}
-+
-+static int tpm_emulator_startup_tpm(TPMBackend *tb)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
-+    ptm_init init;
-+    ptm_res res;
-+
-+    DPRINTF("%s", __func__);
-+    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_INIT, &init, sizeof(init),
-+                         sizeof(init)) < 0) {
-+        error_report("tpm-emulator: could not send INIT: %s",
-+                     strerror(errno));
-+        goto err_exit;
-+    }
-+
-+    res = be32_to_cpu(init.u.resp.tpm_result);
-+    if (res) {
-+        error_report("tpm-emulator: TPM result for CMD_INIT: 0x%x", res);
-+        goto err_exit;
-+    }
-+    return 0;
-+
-+err_exit:
-+    return -1;
-+}
-+
-+static bool tpm_emulator_get_tpm_established_flag(TPMBackend *tb)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
-+    ptm_est est;
-+
-+    DPRINTF("%s", __func__);
-+    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_GET_TPMESTABLISHED, &est,
-+                             0, sizeof(est)) < 0) {
-+        error_report("tpm-emulator: Could not get the TPM established flag: %s",
-+                     strerror(errno));
-+        return false;
-+    }
-+    DPRINTF("established flag: %0x", est.u.resp.bit);
-+
-+    return (est.u.resp.bit != 0);
-+}
-+
-+static int tpm_emulator_reset_tpm_established_flag(TPMBackend *tb,
-+                                                   uint8_t locty)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
-+    ptm_reset_est reset_est;
-+    ptm_res res;
-+
-+    /* only a TPM 2.0 will support this */
-+    if (tpm_emu->tpm_version != TPM_VERSION_2_0) {
-+        return 0;
-+    }
-+
-+    reset_est.u.req.loc = tpm_emu->cur_locty_number;
-+    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_RESET_TPMESTABLISHED,
-+                             &reset_est, sizeof(reset_est),
-+                             sizeof(reset_est)) < 0) {
-+        error_report("tpm-emulator: Could not reset the establishment bit: %s",
-+                     strerror(errno));
-+        return -1;
-+    }
-+
-+    res = be32_to_cpu(reset_est.u.resp.tpm_result);
-+    if (res) {
-+        error_report("tpm-emulator: TPM result for rest establixhed flag: 0x%x",
-+                     res);
-+        return -1;
-+    }
-+
-+    return 0;
-+}
-+
-+static void tpm_emulator_cancel_cmd(TPMBackend *tb)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
-+    ptm_res res;
-+
-+    if (!TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(tpm_emu, PTM_CAP_CANCEL_TPM_CMD)) {
-+        DPRINTF("Backend does not support CANCEL_TPM_CMD");
-+        return;
-+    }
-+
-+    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_CANCEL_TPM_CMD, &res, 0,
-+                             sizeof(res)) < 0) {
-+        error_report("tpm-emulator: Could not cancel command: %s",
-+                     strerror(errno));
-+    } else if (res != 0) {
-+        error_report("tpm-emulator: Failed to cancel TPM: 0x%x",
-+                     be32_to_cpu(res));
-+    }
-+}
-+
-+static TPMVersion tpm_emulator_get_tpm_version(TPMBackend *tb)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
-+
-+    return tpm_emu->tpm_version;
-+}
-+
-+static int tpm_emulator_block_migration(TPMEmulator *tpm_emu)
-+{
-+    Error *err = NULL;
-+
-+    error_setg(&tpm_emu->migration_blocker,
-+               "Migration disabled: TPM emulator not yet migratable");
-+    migrate_add_blocker(tpm_emu->migration_blocker, &err);
-+    if (err) {
-+        error_report_err(err);
-+        error_free(tpm_emu->migration_blocker);
-+        tpm_emu->migration_blocker = NULL;
-+    
-+        return -1;
-+    }
-+
-+    return 0;
-+}
-+
-+static int tpm_emulator_prepare_data_fd(TPMEmulator *tpm_emu)
-+{
-+    ptm_res res;
-+    Error *err = NULL;
-+    int fds[2] = { -1, -1 };
-+
-+    if (socketpair(AF_UNIX, SOCK_STREAM, 0, fds) < 0) {
-+        error_report("tpm-emulator: Failed to create socketpair");
-+        return -1;
-+    }
-+
-+    qemu_chr_fe_set_msgfds(&tpm_emu->ctrl_chr, fds + 1, 1);
-+
-+    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_SET_DATAFD, &res, 0,
-+                    sizeof(res)) || res != 0) {
-+        error_report("tpm-emulator: Failed to send CMD_SET_DATAFD: %s",
-+                     strerror(errno));
-+        goto err_exit;
-+    }
-+
-+    tpm_emu->data_ioc = QIO_CHANNEL(qio_channel_socket_new_fd(fds[0], &err));
-+    if (err) {
-+        error_prepend(&err, "tpm-emulator: Failed to create io channel: ");
-+        error_report_err(err);
-+        goto err_exit;
-+    }
-+
-+    closesocket(fds[1]);
-+
-+    return 0;
-+
-+err_exit:
-+    closesocket(fds[0]);
-+    closesocket(fds[1]);
-+    return -1;
-+}
-+
-+static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, QemuOpts *opts)
-+{
-+    const char *value;
-+
-+    value = qemu_opt_get(opts, "chardev");
-+    if (value) {
-+        Error *err = NULL;
-+        Chardev *dev = qemu_chr_find(value);
-+
-+        if (!dev) {
-+            error_report("tpm-emulator: tpm chardev '%s' not found.", value);
-+            goto err;
-+        }
-+
-+        if (!qemu_chr_fe_init(&tpm_emu->ctrl_chr, dev, &err)) {
-+            error_prepend(&err, "tpm-emulator: No valid chardev found at '%s':",
-+                          value);
-+            error_report_err(err);
-+            goto err;
-+        }
-+
-+        tpm_emu->options->chardev = g_strdup(value);
-+    }
-+
-+    if (tpm_emulator_prepare_data_fd(tpm_emu) < 0) {
-+        goto err;
-+    }
-+
-+    /* FIXME: tpm_util_test_tpmdev() accepts only on socket fd, as it also used
-+     * by passthrough driver, which not yet using GIOChannel.
-+     */
-+    if (tpm_util_test_tpmdev(QIO_CHANNEL_SOCKET(tpm_emu->data_ioc)->fd,
-+                             &tpm_emu->tpm_version)) {
-+        error_report("'%s' is not emulating TPM device. Error: %s",
-+                      tpm_emu->options->chardev, strerror(errno));
-+        goto err;
-+    }
-+
-+    DPRINTF("TPM Version %s", tpm_emu->tpm_version == TPM_VERSION_1_2 ? "1.2" :
-+            (tpm_emu->tpm_version == TPM_VERSION_2_0 ?  "2.0" : "Unspecified"));
-+
-+    if (tpm_emulator_probe_caps(tpm_emu) ||
-+        tpm_emulator_check_caps(tpm_emu)) {
-+        goto err;
-+    }
-+
-+    return tpm_emulator_block_migration(tpm_emu);
-+
-+err:
-+    DPRINTF("Startup error");
-+    return -1;
-+}
-+
-+static TPMBackend *tpm_emulator_create(QemuOpts *opts, const char *id)
-+{
-+    TPMBackend *tb = TPM_BACKEND(object_new(TYPE_TPM_EMULATOR));
-+
-+    tb->id = g_strdup(id);
-+
-+    if (tpm_emulator_handle_device_opts(TPM_EMULATOR(tb), opts)) {
-+        goto err_exit;
-+    }
-+
-+    return tb;
-+
-+err_exit:
-+    object_unref(OBJECT(tb));
-+
-+    return NULL;
-+}
-+
-+static TpmTypeOptions *tpm_emulator_get_tpm_options(TPMBackend *tb)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
-+    TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
-+
-+    options->type = TPM_TYPE_OPTIONS_KIND_EMULATOR;
-+    options->u.emulator.data = QAPI_CLONE(TPMEmulatorOptions, tpm_emu->options);
-+
-+    return options;
-+}
-+
-+static const QemuOptDesc tpm_emulator_cmdline_opts[] = {
-+    TPM_STANDARD_CMDLINE_OPTS,
-+    {
-+        .name = "chardev",
-+        .type = QEMU_OPT_STRING,
-+        .help = "Character device to use for out-of-band control messages",
-+    },
-+    { /* end of list */ },
-+};
-+
-+static const TPMDriverOps tpm_emulator_driver = {
-+    .type                     = TPM_TYPE_EMULATOR,
-+    .opts                     = tpm_emulator_cmdline_opts,
-+    .desc                     = "TPM emulator backend driver",
-+
-+    .create                   = tpm_emulator_create,
-+    .startup_tpm              = tpm_emulator_startup_tpm,
-+    .cancel_cmd               = tpm_emulator_cancel_cmd,
-+    .get_tpm_established_flag = tpm_emulator_get_tpm_established_flag,
-+    .reset_tpm_established_flag = tpm_emulator_reset_tpm_established_flag,
-+    .get_tpm_version          = tpm_emulator_get_tpm_version,
-+    .get_tpm_options          = tpm_emulator_get_tpm_options,
-+};
-+
-+static void tpm_emulator_inst_init(Object *obj)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(obj);
-+
-+    DPRINTF("%s", __func__);
-+    tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
-+    tpm_emu->cur_locty_number = ~0;
-+}
-+
-+/*
-+ * Gracefully shut down the external TPM
-+ */
-+static void tpm_emulator_shutdown(TPMEmulator *tpm_emu)
-+{
-+    ptm_res res;
-+
-+    if (tpm_emulator_ctrlcmd(&tpm_emu->ctrl_chr, CMD_SHUTDOWN, &res, 0,
-+                             sizeof(res)) < 0) {
-+        error_report("tpm-emulator: Could not cleanly shutdown the TPM: %s",
-+                     strerror(errno));
-+    } else if (res != 0) {
-+        error_report("tpm-emulator: TPM result for sutdown: 0x%x",
-+                     be32_to_cpu(res));
-+    }
-+}
-+
-+static void tpm_emulator_inst_finalize(Object *obj)
-+{
-+    TPMEmulator *tpm_emu = TPM_EMULATOR(obj);
-+
-+    tpm_emulator_shutdown(tpm_emu);
-+
-+    object_unref(OBJECT(tpm_emu->data_ioc));
-+
-+    qemu_chr_fe_deinit(&tpm_emu->ctrl_chr, false);
-+
-+    qapi_free_TPMEmulatorOptions(tpm_emu->options);
-+
-+    if (tpm_emu->migration_blocker) {
-+        migrate_del_blocker(tpm_emu->migration_blocker);
-+        error_free(tpm_emu->migration_blocker);
-+    }
-+}
-+
-+static void tpm_emulator_class_init(ObjectClass *klass, void *data)
-+{
-+    TPMBackendClass *tbc = TPM_BACKEND_CLASS(klass);
-+    tbc->ops = &tpm_emulator_driver;
-+    tbc->handle_request = tpm_emulator_handle_request;
-+}
-+
-+static const TypeInfo tpm_emulator_info = {
-+    .name = TYPE_TPM_EMULATOR,
-+    .parent = TYPE_TPM_BACKEND,
-+    .instance_size = sizeof(TPMEmulator),
-+    .class_init = tpm_emulator_class_init,
-+    .instance_init = tpm_emulator_inst_init,
-+    .instance_finalize = tpm_emulator_inst_finalize,
-+};
-+
-+static void tpm_emulator_register(void)
-+{
-+    type_register_static(&tpm_emulator_info);
-+    tpm_register_driver(&tpm_emulator_driver);
-+}
-+
-+type_init(tpm_emulator_register)
-diff --git a/hw/tpm/tpm_ioctl.h b/hw/tpm/tpm_ioctl.h
-new file mode 100644
-index 0000000000..33564b11de
---- /dev/null
-+++ b/hw/tpm/tpm_ioctl.h
-@@ -0,0 +1,246 @@
-+/*
-+ * tpm_ioctl.h
-+ *
-+ * (c) Copyright IBM Corporation 2014, 2015.
-+ *
-+ * This file is licensed under the terms of the 3-clause BSD license
-+ */
-+#ifndef _TPM_IOCTL_H_
-+#define _TPM_IOCTL_H_
-+
-+#include <stdint.h>
-+#include <sys/uio.h>
-+#include <sys/types.h>
-+#include <sys/ioctl.h>
-+
-+/*
-+ * Every response from a command involving a TPM command execution must hold
-+ * the ptm_res as the first element.
-+ * ptm_res corresponds to the error code of a command executed by the TPM.
-+ */
-+
-+typedef uint32_t ptm_res;
-+
-+/* PTM_GET_TPMESTABLISHED: get the establishment bit */
-+struct ptm_est {
-+    union {
-+        struct {
-+            ptm_res tpm_result;
-+            unsigned char bit; /* TPM established bit */
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* PTM_RESET_TPMESTABLISHED: reset establishment bit */
-+struct ptm_reset_est {
-+    union {
-+        struct {
-+            uint8_t loc; /* locality to use */
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* PTM_INIT */
-+struct ptm_init {
-+    union {
-+        struct {
-+            uint32_t init_flags; /* see definitions below */
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* above init_flags */
-+#define PTM_INIT_FLAG_DELETE_VOLATILE (1 << 0)
-+    /* delete volatile state file after reading it */
-+
-+/* PTM_SET_LOCALITY */
-+struct ptm_loc {
-+    union {
-+        struct {
-+            uint8_t loc; /* locality to set */
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* PTM_HASH_DATA: hash given data */
-+struct ptm_hdata {
-+    union {
-+        struct {
-+            uint32_t length;
-+            uint8_t data[4096];
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/*
-+ * size of the TPM state blob to transfer; x86_64 can handle 8k,
-+ * ppc64le only ~7k; keep the response below a 4k page size
-+ */
-+#define PTM_STATE_BLOB_SIZE (3 * 1024)
-+
-+/*
-+ * The following is the data structure to get state blobs from the TPM.
-+ * If the size of the state blob exceeds the PTM_STATE_BLOB_SIZE, multiple reads
-+ * with this ioctl and with adjusted offset are necessary. All bytes
-+ * must be transferred and the transfer is done once the last byte has been
-+ * returned.
-+ * It is possible to use the read() interface for reading the data; however, the
-+ * first bytes of the state blob will be part of the response to the ioctl(); a
-+ * subsequent read() is only necessary if the total length (totlength) exceeds
-+ * the number of received bytes. seek() is not supported.
-+ */
-+struct ptm_getstate {
-+    union {
-+        struct {
-+            uint32_t state_flags; /* may be: PTM_STATE_FLAG_DECRYPTED */
-+            uint32_t type;        /* which blob to pull */
-+            uint32_t offset;      /* offset from where to read */
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+            uint32_t state_flags; /* may be: PTM_STATE_FLAG_ENCRYPTED */
-+            uint32_t totlength;   /* total length that will be transferred */
-+            uint32_t length;      /* number of bytes in following buffer */
-+            uint8_t  data[PTM_STATE_BLOB_SIZE];
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/* TPM state blob types */
-+#define PTM_BLOB_TYPE_PERMANENT  1
-+#define PTM_BLOB_TYPE_VOLATILE   2
-+#define PTM_BLOB_TYPE_SAVESTATE  3
-+
-+/* state_flags above : */
-+#define PTM_STATE_FLAG_DECRYPTED     1 /* on input:  get decrypted state */
-+#define PTM_STATE_FLAG_ENCRYPTED     2 /* on output: state is encrypted */
-+
-+/*
-+ * The following is the data structure to set state blobs in the TPM.
-+ * If the size of the state blob exceeds the PTM_STATE_BLOB_SIZE, multiple
-+ * 'writes' using this ioctl are necessary. The last packet is indicated
-+ * by the length being smaller than the PTM_STATE_BLOB_SIZE.
-+ * The very first packet may have a length indicator of '0' enabling
-+ * a write() with all the bytes from a buffer. If the write() interface
-+ * is used, a final ioctl with a non-full buffer must be made to indicate
-+ * that all data were transferred (a write with 0 bytes would not work).
-+ */
-+struct ptm_setstate {
-+    union {
-+        struct {
-+            uint32_t state_flags; /* may be PTM_STATE_FLAG_ENCRYPTED */
-+            uint32_t type;        /* which blob to set */
-+            uint32_t length;      /* length of the data;
-+                                     use 0 on the first packet to
-+                                     transfer using write() */
-+            uint8_t data[PTM_STATE_BLOB_SIZE];
-+        } req; /* request */
-+        struct {
-+            ptm_res tpm_result;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+/*
-+ * PTM_GET_CONFIG: Data structure to get runtime configuration information
-+ * such as which keys are applied.
-+ */
-+struct ptm_getconfig {
-+    union {
-+        struct {
-+            ptm_res tpm_result;
-+            uint32_t flags;
-+        } resp; /* response */
-+    } u;
-+};
-+
-+#define PTM_CONFIG_FLAG_FILE_KEY        0x1
-+#define PTM_CONFIG_FLAG_MIGRATION_KEY   0x2
-+
-+
-+typedef uint64_t ptm_cap;
-+typedef struct ptm_est ptm_est;
-+typedef struct ptm_reset_est ptm_reset_est;
-+typedef struct ptm_loc ptm_loc;
-+typedef struct ptm_hdata ptm_hdata;
-+typedef struct ptm_init ptm_init;
-+typedef struct ptm_getstate ptm_getstate;
-+typedef struct ptm_setstate ptm_setstate;
-+typedef struct ptm_getconfig ptm_getconfig;
-+
-+/* capability flags returned by PTM_GET_CAPABILITY */
-+#define PTM_CAP_INIT               (1)
-+#define PTM_CAP_SHUTDOWN           (1 << 1)
-+#define PTM_CAP_GET_TPMESTABLISHED (1 << 2)
-+#define PTM_CAP_SET_LOCALITY       (1 << 3)
-+#define PTM_CAP_HASHING            (1 << 4)
-+#define PTM_CAP_CANCEL_TPM_CMD     (1 << 5)
-+#define PTM_CAP_STORE_VOLATILE     (1 << 6)
-+#define PTM_CAP_RESET_TPMESTABLISHED (1 << 7)
-+#define PTM_CAP_GET_STATEBLOB      (1 << 8)
-+#define PTM_CAP_SET_STATEBLOB      (1 << 9)
-+#define PTM_CAP_STOP               (1 << 10)
-+#define PTM_CAP_GET_CONFIG         (1 << 11)
-+#define PTM_CAP_SET_DATAFD         (1 << 12)
-+
-+enum {
-+    PTM_GET_CAPABILITY     = _IOR('P', 0, ptm_cap),
-+    PTM_INIT               = _IOWR('P', 1, ptm_init),
-+    PTM_SHUTDOWN           = _IOR('P', 2, ptm_res),
-+    PTM_GET_TPMESTABLISHED = _IOR('P', 3, ptm_est),
-+    PTM_SET_LOCALITY       = _IOWR('P', 4, ptm_loc),
-+    PTM_HASH_START         = _IOR('P', 5, ptm_res),
-+    PTM_HASH_DATA          = _IOWR('P', 6, ptm_hdata),
-+    PTM_HASH_END           = _IOR('P', 7, ptm_res),
-+    PTM_CANCEL_TPM_CMD     = _IOR('P', 8, ptm_res),
-+    PTM_STORE_VOLATILE     = _IOR('P', 9, ptm_res),
-+    PTM_RESET_TPMESTABLISHED = _IOWR('P', 10, ptm_reset_est),
-+    PTM_GET_STATEBLOB      = _IOWR('P', 11, ptm_getstate),
-+    PTM_SET_STATEBLOB      = _IOWR('P', 12, ptm_setstate),
-+    PTM_STOP               = _IOR('P', 13, ptm_res),
-+    PTM_GET_CONFIG         = _IOR('P', 14, ptm_getconfig),
-+    PTM_SET_DATAFD         = _IOR('P', 15, ptm_res),
-+};
-+
-+/*
-+ * Commands used by the non-CUSE TPMs
-+ *
-+ * All messages container big-endian data.
-+ *
-+ * The return messages only contain the 'resp' part of the unions
-+ * in the data structures above. Besides that the limits in the
-+ * buffers above (ptm_hdata:u.req.data and ptm_get_state:u.resp.data
-+ * and ptm_set_state:u.req.data) are 0xffffffff.
-+ */
-+enum {
-+    CMD_GET_CAPABILITY = 1,
-+    CMD_INIT,
-+    CMD_SHUTDOWN,
-+    CMD_GET_TPMESTABLISHED,
-+    CMD_SET_LOCALITY,
-+    CMD_HASH_START,
-+    CMD_HASH_DATA,
-+    CMD_HASH_END,
-+    CMD_CANCEL_TPM_CMD,
-+    CMD_STORE_VOLATILE,
-+    CMD_RESET_TPMESTABLISHED,
-+    CMD_GET_STATEBLOB,
-+    CMD_SET_STATEBLOB,
-+    CMD_STOP,
-+    CMD_GET_CONFIG,
-+    CMD_SET_DATAFD
-+};
-+
-+#endif /* _TPM_IOCTL_H */
-diff --git a/qapi-schema.json b/qapi-schema.json
-index 802ea53d00..78a00bc868 100644
---- a/qapi-schema.json
-+++ b/qapi-schema.json
-@@ -5314,10 +5314,12 @@
- # An enumeration of TPM types
- #
- # @passthrough: TPM passthrough type
-+# @emulator: Software Emulator TPM type
-+#            Since: 2.11
- #
- # Since: 1.5
- ##
--{ 'enum': 'TpmType', 'data': [ 'passthrough' ] }
-+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ] }
- 
- ##
- # @query-tpm-types:
-@@ -5352,6 +5354,17 @@
-                                              '*cancel-path' : 'str'} }
- 
- ##
-+# @TPMEmulatorOptions:
-+#
-+# Information about the TPM emulator type
-+#
-+# @chardev: Name of a unix socket chardev
-+#
-+# Since: 2.11
-+##
-+{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' } }
-+
-+##
- # @TpmTypeOptions:
- #
- # A union referencing different TPM backend types' configuration options
-@@ -5361,7 +5374,8 @@
- # Since: 1.5
- ##
- { 'union': 'TpmTypeOptions',
--   'data': { 'passthrough' : 'TPMPassthroughOptions' } }
-+   'data': { 'passthrough' : 'TPMPassthroughOptions',
-+             'emulator': 'TPMEmulatorOptions'} }
- 
- ##
- # @TPMInfo:
-diff --git a/qemu-options.hx b/qemu-options.hx
-index 9f6e2adfff..60eb193c23 100644
---- a/qemu-options.hx
-+++ b/qemu-options.hx
-@@ -3121,7 +3121,9 @@ DEF("tpmdev", HAS_ARG, QEMU_OPTION_tpmdev, \
-     "-tpmdev passthrough,id=id[,path=path][,cancel-path=path]\n"
-     "                use path to provide path to a character device; default is /dev/tpm0\n"
-     "                use cancel-path to provide path to TPM's cancel sysfs entry; if\n"
--    "                not provided it will be searched for in /sys/class/misc/tpm?/device\n",
-+    "                not provided it will be searched for in /sys/class/misc/tpm?/device\n"
-+    "-tpmdev emulator,id=id,chardev=dev\n"
-+    "                configure the TPM device using chardev backend\n",
-     QEMU_ARCH_ALL)
- STEXI
- 
-@@ -3130,8 +3132,8 @@ The general form of a TPM device option is:
- 
- @item -tpmdev @var{backend} ,id=@var{id} [,@var{options}]
- @findex -tpmdev
--Backend type must be:
--@option{passthrough}.
-+Backend type must be either one of the following:
-+@option{passthrough}, @option{emulator}.
- 
- The specific backend type will determine the applicable options.
- The @code{-tpmdev} option creates the TPM backend and requires a
-@@ -3181,6 +3183,20 @@ To create a passthrough TPM use the following two options:
- Note that the @code{-tpmdev} id is @code{tpm0} and is referenced by
- @code{tpmdev=tpm0} in the device option.
- 
-+@item -tpmdev emulator, id=@var{id}, chardev=@var{dev}
-+
-+(Linux-host only) Enable access to a TPM emulator using Unix domain socket based
-+chardev backend.
-+
-+@option{chardev} specifies the unique ID of a character device backend that provides connection to the software TPM server.
-+
-+To create a TPM emulator backend device with chardev socket backend:
-+@example
-+
-+-chardev socket,id=chrtpm,path=/tmp/swtpm-sock -tpmdev emulator,id=tpm0,chardev=chrtpm -device tpm-tis,tpmdev=tpm0
-+
-+@end example
-+
- @end table
- 
- ETEXI
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch b/meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch
deleted file mode 100644
index f4998e1681..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0011-tpm-Move-tpm_cleanup-to-right-place.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 22429d175911af2e57617a30e0ac097af74f2791 Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Fri, 29 Sep 2017 12:57:33 +0300
-Subject: [PATCH 11/12] tpm: Move tpm_cleanup() to right place
-
-As Emulator TPM backend uses chardev, tpm cleanup should happen before chardev
-similar to other vhost-users.
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-
-Upstream-Status: Backport [c37cacabf2285b0731b44c1f667781fdd4f2b658]
----
- tpm.c | 1 -
- vl.c  | 1 +
- 2 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tpm.c b/tpm.c
-index cac400ef3e..4a9d3d739e 100644
---- a/tpm.c
-+++ b/tpm.c
-@@ -173,7 +173,6 @@ int tpm_init(void)
-         return -1;
-     }
- 
--    atexit(tpm_cleanup);
-     return 0;
- }
- 
-diff --git a/vl.c b/vl.c
-index 8e247cc2a2..5df0b7f205 100644
---- a/vl.c
-+++ b/vl.c
-@@ -4797,6 +4797,7 @@ int main(int argc, char **argv, char **envp)
-     res_free();
- 
-     /* vhost-user must be cleaned up before chardevs.  */
-+    tpm_cleanup();
-     net_cleanup();
-     audio_cleanup();
-     monitor_cleanup();
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch b/meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch
deleted file mode 100644
index 430fe1b1c4..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From c559d599c6880caf7aa0f0a60c6c023584e1b8ad Mon Sep 17 00:00:00 2001
-From: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Date: Wed, 11 Oct 2017 08:52:43 -0400
-Subject: [PATCH 12/12] tpm: Use EMSGSIZE instead of EBADMSG to compile on
- OpenBSD
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-EBADMSG was only added to OpenBSD very recently. To make QEMU compilable
-on older OpenBSD versions use EMSGSIZE instead when a mismatch between
-number of received bytes and message size indicated in the header was
-found.
-
-Return -EMSGSIZE and convert all other errnos in the same functions to
-return the negative errno.
-
-Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-
-Upstream-Status: Backport [98979cdca44ba0e21055ee7736694aa5ebb54347]
----
- hw/tpm/tpm_util.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/hw/tpm/tpm_util.c b/hw/tpm/tpm_util.c
-index fb929f6e92..73d77965fd 100644
---- a/hw/tpm/tpm_util.c
-+++ b/hw/tpm/tpm_util.c
-@@ -68,10 +68,10 @@ static int tpm_util_test(int fd,
- 
-     n = write(fd, request, requestlen);
-     if (n < 0) {
--        return errno;
-+        return -errno;
-     }
-     if (n != requestlen) {
--        return EFAULT;
-+        return -EFAULT;
-     }
- 
-     FD_ZERO(&readfds);
-@@ -80,18 +80,18 @@ static int tpm_util_test(int fd,
-     /* wait for a second */
-     n = select(fd + 1, &readfds, NULL, NULL, &tv);
-     if (n != 1) {
--        return errno;
-+        return -errno;
-     }
- 
-     n = read(fd, &buf, sizeof(buf));
-     if (n < sizeof(struct tpm_resp_hdr)) {
--        return EFAULT;
-+        return -EFAULT;
-     }
- 
-     resp = (struct tpm_resp_hdr *)buf;
-     /* check the header */
-     if (be32_to_cpu(resp->len) != n) {
--        return EBADMSG;
-+        return -EMSGSIZE;
-     }
- 
-     *return_tag = be16_to_cpu(resp->tag);
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
index 49d4af2e5e..32809d3085 100644
--- a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
@@ -1,6 +1,6 @@
-From aa3aef4cf5f4dd98f9133df085e825ff5da7dcbd Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Fri, 27 Oct 2017 15:23:35 +0200
+From 3bb3100c22eb30146a69656480bdffeef8663575 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Thu, 21 Dec 2017 11:35:16 -0800
 Subject: [PATCH] chardev: connect socket to a spawned command
 
 The command is started in a shell (sh -c) with stdin connect to QEMU
@@ -44,18 +44,17 @@ as simple as possible.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
 ---
  chardev/char-socket.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++++---
  chardev/char.c        |  3 ++
- qapi-schema.json      |  5 +++
+ qapi/char.json        |  5 +++
  3 files changed, 90 insertions(+), 4 deletions(-)
 
 diff --git a/chardev/char-socket.c b/chardev/char-socket.c
-index 1ae730a4..c366a02a 100644
+index 53eda8ef00..f566107c35 100644
 --- a/chardev/char-socket.c
 +++ b/chardev/char-socket.c
-@@ -854,6 +854,66 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
+@@ -852,6 +852,66 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
      return false;
  }
  
@@ -122,7 +121,7 @@ index 1ae730a4..c366a02a 100644
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
                                      bool *be_opened,
-@@ -861,6 +921,7 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -859,6 +919,7 @@ static void qmp_chardev_open_socket(Chardev *chr,
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -130,7 +129,7 @@ index 1ae730a4..c366a02a 100644
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -928,7 +989,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -926,7 +987,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
          s->reconnect_time = reconnect;
      }
  
@@ -144,7 +143,7 @@ index 1ae730a4..c366a02a 100644
          sioc = qio_channel_socket_new();
          tcp_chr_set_client_ioc_name(chr, sioc);
          qio_channel_socket_connect_async(sioc, s->addr,
-@@ -987,11 +1053,22 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -985,11 +1051,22 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *tls_creds = qemu_opt_get(opts, "tls-creds");
@@ -168,7 +167,7 @@ index 1ae730a4..c366a02a 100644
          if (!host) {
              error_setg(errp, "chardev: socket: no host given");
              return;
-@@ -1023,13 +1100,14 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1021,13 +1098,14 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      sock->has_reconnect = true;
      sock->reconnect = reconnect;
      sock->tls_creds = g_strdup(tls_creds);
@@ -186,24 +185,24 @@ index 1ae730a4..c366a02a 100644
          addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
          addr->u.inet.data = g_new(InetSocketAddress, 1);
 diff --git a/chardev/char.c b/chardev/char.c
-index 5d283b90..ccb329d4 100644
+index 2ae4f465ec..5d52cd5de5 100644
 --- a/chardev/char.c
 +++ b/chardev/char.c
-@@ -782,6 +782,9 @@ QemuOptsList qemu_chardev_opts = {
+@@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts = {
+         },{
              .name = "path",
              .type = QEMU_OPT_STRING,
-         },{
++        },{
 +            .name = "cmd",
 +            .type = QEMU_OPT_STRING,
-+        },{
+         },{
              .name = "host",
              .type = QEMU_OPT_STRING,
-         },{
-diff --git a/qapi-schema.json b/qapi-schema.json
-index 78a00bc8..790b026d 100644
---- a/qapi-schema.json
-+++ b/qapi-schema.json
-@@ -5004,6 +5004,10 @@
+diff --git a/qapi/char.json b/qapi/char.json
+index ae19dcd1ed..6de0f29bcd 100644
+--- a/qapi/char.json
++++ b/qapi/char.json
+@@ -241,6 +241,10 @@
  #
  # @addr: socket address to listen on (server=true)
  #        or connect to (server=false)
@@ -214,7 +213,7 @@ index 78a00bc8..790b026d 100644
  # @tls-creds: the ID of the TLS credentials object (since 2.6)
  # @server: create server socket (default: true)
  # @wait: wait for incoming connection on server
-@@ -5021,6 +5025,7 @@
+@@ -258,6 +262,7 @@
  # Since: 1.4
  ##
  { 'struct': 'ChardevSocket', 'data': { 'addr'       : 'SocketAddressLegacy',
@@ -223,5 +222,5 @@ index 78a00bc8..790b026d 100644
                                       '*server'    : 'bool',
                                       '*wait'      : 'bool',
 -- 
-2.11.0
+2.14.1
 
diff --git a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
deleted file mode 100644
index f593cf9ae0..0000000000
--- a/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-[PATCH] exclude some arm EABI obsolete syscalls
-
-Upstream-Status: Pending
-
-some syscalls are obsolete and no longer available for EABI, exclude them to
-fix the below error:
-	In file included from qemu-seccomp.c:16:0:
-	qemu-seccomp.c:28:7: error: '__NR_select' undeclared here (not in a function)
-	      { SCMP_SYS(select), 252 },
-	        ^
-	qemu-seccomp.c:36:7: error: '__NR_mmap' undeclared here (not in a function)
-	      { SCMP_SYS(mmap), 247 },
-	        ^
-	qemu-seccomp.c:57:7: error: '__NR_getrlimit' undeclared here (not in a function)
-	      { SCMP_SYS(getrlimit), 245 },
-	        ^
-	qemu-seccomp.c:96:7: error: '__NR_time' undeclared here (not in a function)
-	      { SCMP_SYS(time), 245 },
-	        ^
-	qemu-seccomp.c:185:7: error: '__NR_alarm' undeclared here (not in a function)
-	      { SCMP_SYS(alarm), 241 },
-
-please refer source files:
-	arch/arm/include/uapi/asm/unistd.h
-or kernel header:
-	/usr/include/asm/unistd.h
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- qemu-seccomp.c | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/qemu-seccomp.c b/qemu-seccomp.c
-index df75d9c..0e577f8 100644
---- a/qemu-seccomp.c
-+++ b/qemu-seccomp.c
-@@ -35,15 +35,21 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
-     { SCMP_SYS(timer_settime), 255 },
-     { SCMP_SYS(timer_gettime), 254 },
-     { SCMP_SYS(futex), 253 },
-+#if !defined(__ARM_EABI__)
-     { SCMP_SYS(select), 252 },
-+    { SCMP_SYS(time), 245 },
-+    { SCMP_SYS(alarm), 241 },
-+    { SCMP_SYS(getrlimit), 245 },
-+    { SCMP_SYS(mmap), 247 },
-+    { SCMP_SYS(socketcall), 250 },
-+    { SCMP_SYS(ipc), 245 },
-+#endif
-     { SCMP_SYS(recvfrom), 251 },
-     { SCMP_SYS(sendto), 250 },
--    { SCMP_SYS(socketcall), 250 },
-     { SCMP_SYS(read), 249 },
-     { SCMP_SYS(io_submit), 249 },
-     { SCMP_SYS(brk), 248 },
-     { SCMP_SYS(clone), 247 },
--    { SCMP_SYS(mmap), 247 },
-     { SCMP_SYS(mprotect), 246 },
-     { SCMP_SYS(execve), 245 },
-     { SCMP_SYS(open), 245 },
-@@ -58,7 +64,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
-     { SCMP_SYS(bind), 245 },
-     { SCMP_SYS(listen), 245 },
-     { SCMP_SYS(semget), 245 },
--    { SCMP_SYS(ipc), 245 },
-     { SCMP_SYS(gettimeofday), 245 },
-     { SCMP_SYS(readlink), 245 },
-     { SCMP_SYS(access), 245 },
-@@ -104,7 +109,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
-     { SCMP_SYS(times), 245 },
-     { SCMP_SYS(exit), 245 },
-     { SCMP_SYS(clock_gettime), 245 },
--    { SCMP_SYS(time), 245 },
-     { SCMP_SYS(restart_syscall), 245 },
-     { SCMP_SYS(pwrite64), 245 },
-     { SCMP_SYS(nanosleep), 245 },
-@@ -194,7 +198,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
-     { SCMP_SYS(lstat64), 241 },
-     { SCMP_SYS(sendfile64), 241 },
-     { SCMP_SYS(ugetrlimit), 241 },
--    { SCMP_SYS(alarm), 241 },
-     { SCMP_SYS(rt_sigsuspend), 241 },
-     { SCMP_SYS(rt_sigqueueinfo), 241 },
-     { SCMP_SYS(rt_tgsigqueueinfo), 241 },
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/ppc_locking.patch b/meta/recipes-devtools/qemu/qemu/ppc_locking.patch
deleted file mode 100644
index 6f722433d4..0000000000
--- a/meta/recipes-devtools/qemu/qemu/ppc_locking.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-I've tracked down what I think is a problem causing qemu-system-ppc
-to hang whilst booting images.
-
-I believe the decrementer timer stops receiving interrupts so
-tasks in our images hang indefinitely as the timer stopped. 
-
-It can be summed up with this line of debug:
-
-ppc_set_irq: 0x55b4e0d562f0 n_IRQ 8 level 1 => pending 00000100req 00000004
-
-It should normally read:
-
-ppc_set_irq: 0x55b4e0d562f0 n_IRQ 8 level 1 => pending 00000100req 00000002
-
-The question is why CPU_INTERRUPT_EXITTB ends up being set when the
-lines above this log message clearly sets CPU_INTERRUPT_HARD (via 
-cpu_interrupt() ).
-
-I note in cpu.h:
-
-    /* updates protected by BQL */
-    uint32_t interrupt_request;
-
-(for struct CPUState)
-
-The ppc code does "cs->interrupt_request |= CPU_INTERRUPT_EXITTB" in 5
-places, 3 in excp_helper.c and 2 in helper_regs.h. In all cases,  
-g_assert(qemu_mutex_iothread_locked()); fails. If I do something like:
-
-if (!qemu_mutex_iothread_locked()) {
-    qemu_mutex_lock_iothread();
-    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-    qemu_mutex_unlock_iothread();
-} else {
-    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-}
-
-in these call sites then I can no longer lock qemu up with my test
-case.
-
-I suspect the _HARD setting gets overwritten which stops the 
-decrementer interrupts being delivered.
-
-Upstream-Status: Submitted [Issue discussed on qemu mailing list 2017/11/20]
-RP 2017/11/20
-
-Index: qemu-2.10.1/target/ppc/excp_helper.c
-===================================================================
---- qemu-2.10.1.orig/target/ppc/excp_helper.c
-+++ qemu-2.10.1/target/ppc/excp_helper.c
-@@ -207,7 +207,9 @@ static inline void powerpc_excp(PowerPCC
-                         "Entering checkstop state\n");
-             }
-             cs->halted = 1;
--            cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-+            qemu_mutex_lock_iothread();
-+            cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-+            qemu_mutex_unlock_iothread();
-         }
-         if (env->msr_mask & MSR_HVB) {
-             /* ISA specifies HV, but can be delivered to guest with HV clear
-@@ -940,7 +942,9 @@ void helper_store_msr(CPUPPCState *env,
- 
-     if (excp != 0) {
-         CPUState *cs = CPU(ppc_env_get_cpu(env));
--        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-+        qemu_mutex_lock_iothread();
-+        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-+        qemu_mutex_unlock_iothread();
-         raise_exception(env, excp);
-     }
- }
-@@ -995,7 +999,9 @@ static inline void do_rfi(CPUPPCState *e
-     /* No need to raise an exception here,
-      * as rfi is always the last insn of a TB
-      */
--    cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-+    qemu_mutex_lock_iothread();
-+    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-+    qemu_mutex_unlock_iothread();
- 
-     /* Reset the reservation */
-     env->reserve_addr = -1;
-Index: qemu-2.10.1/target/ppc/helper_regs.h
-===================================================================
---- qemu-2.10.1.orig/target/ppc/helper_regs.h
-+++ qemu-2.10.1/target/ppc/helper_regs.h
-@@ -114,11 +114,15 @@ static inline int hreg_store_msr(CPUPPCS
-     }
-     if (((value >> MSR_IR) & 1) != msr_ir ||
-         ((value >> MSR_DR) & 1) != msr_dr) {
--        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-+        qemu_mutex_lock_iothread();
-+        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-+        qemu_mutex_unlock_iothread();
-     }
-     if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
-         ((value >> MSR_GS) & 1) != msr_gs) {
--        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-+        qemu_mutex_lock_iothread();
-+        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-+        qemu_mutex_unlock_iothread();
-     }
-     if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
-                  ((value ^ env->msr) & (1 << MSR_TGPR)))) {
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.0.bb
similarity index 60%
rename from meta/recipes-devtools/qemu/qemu_2.10.1.bb
rename to meta/recipes-devtools/qemu/qemu_2.11.0.bb
index 71cc74ebc7..f4273df7cc 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://powerpc_rom.bin \
            file://disable-grabs.patch \
-           file://exclude-some-arm-EABI-obsolete-syscalls.patch \
            file://wacom.patch \
            file://add-ptest-in-makefile-v10.patch \
            file://run-ptest \
@@ -19,21 +18,8 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://pathlimit.patch \
            file://qemu-2.5.0-cflags.patch \
            file://glibc-2.25.patch \
-           file://0001-tpm-Clean-up-driver-registration-lookup.patch \
-           file://0002-tpm-Clean-up-model-registration-lookup.patch \
-           file://0003-tpm-backend-Remove-unneeded-member-variable-from-bac.patch \
-           file://0004-tpm-backend-Move-thread-handling-inside-TPMBackend.patch \
-           file://0005-tpm-backend-Initialize-and-free-data-members-in-it-s.patch \
-           file://0006-tpm-backend-Made-few-interface-methods-optional.patch \
-           file://0007-tpm-backend-Add-new-api-to-read-backend-TpmInfo.patch \
-           file://0008-tpm-backend-Move-realloc_buffer-implementation-to-tp.patch \
-           file://0009-tpm-passthrough-move-reusable-code-to-utils.patch \
-           file://0010-tpm-Added-support-for-TPM-emulator.patch \
-           file://0011-tpm-Move-tpm_cleanup-to-right-place.patch \
-           file://0012-tpm-Use-EMSGSIZE-instead-of-EBADMSG-to-compile-on-Op.patch \
            file://chardev-connect-socket-to-a-spawned-command.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
-           file://ppc_locking.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
@@ -43,8 +29,8 @@ SRC_URI_append_class-native = " \
             file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
             "
 
-SRC_URI[md5sum] = "b375373f688bea0cd8865b966dad15e3"
-SRC_URI[sha256sum] = "8e040bc7556401ebb3a347a8f7878e9d4028cf71b2744b1a1699f4e741966ba8"
+SRC_URI[md5sum] = "335994a755bc655e88a87aeb36bfc0b9"
+SRC_URI[sha256sum] = "c4f034c7665a84a1c3be72c8da37f3c31ec063475699df062ab646d8b2e17fcb"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.14.1


