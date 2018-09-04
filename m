Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0041.outbound.protection.outlook.com [104.47.33.41])
	by mail.openembedded.org (Postfix) with ESMTP id B8249753D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oSHwwGxKRgBFCl9JGcKnmLiumzrLm0FcDUmpk20KKsI=;
	b=d1Yy4JqqXiugCvqGjzdeHkOTiu4jRJbHAOOcfV/pTdGMhHSUiNI0T2YnpD6Hlx5G/T+zpkbb1EMRzLKdL+BzEF+fBVmZsS8DS5EbzuLcFXN1zBHegohYRopLQPAPxIYliVM1Ib1wwCz34HQQleA5kWlHMYu3b3W9qgk5e59Qgbc=
Received: from MWHPR02CA0043.namprd02.prod.outlook.com (2603:10b6:301:60::32)
	by MWHSPR00MB190.namprd02.prod.outlook.com (2603:10b6:300:28::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1101.16;
	Tue, 4 Sep 2018 16:36:24 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by MWHPR02CA0043.outlook.office365.com
	(2603:10b6:301:60::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1101.16 via
	Frontend Transport; Tue, 4 Sep 2018 16:36:24 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; windriver.com; dkim=none (message not signed)
	header.d=none;windriver.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1101.10
	via Frontend Transport; Tue, 4 Sep 2018 16:36:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxEJT-0003xC-43; Tue, 04 Sep 2018 09:36:23 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxEJO-0000Pk-05; Tue, 04 Sep 2018 09:36:18 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w84GaA82026614; Tue, 4 Sep 2018 09:36:10 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fxEJG-0000Ol-0N; Tue, 04 Sep 2018 09:36:10 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>, Alejandro Enedino Hernandez
	Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
	<83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
	<591d25eb-bb99-746f-37ac-6769db4228b8@windriver.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <217b44d6-0d44-8f9f-80c6-7262324d751f@xilinx.com>
Date: Tue, 4 Sep 2018 09:36:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <591d25eb-bb99-746f-37ac-6769db4228b8@windriver.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(438002)(54094003)(199004)(189003)(5660300001)(446003)(26005)(486006)(106466001)(77096007)(2486003)(76176011)(65956001)(336012)(9786002)(8936002)(65806001)(31696002)(23676004)(47776003)(36756003)(426003)(65826007)(126002)(31686004)(63266004)(476003)(67846002)(186003)(229853002)(11346002)(2616005)(110136005)(14444005)(356003)(478600001)(50466002)(58126008)(8676002)(106002)(36386004)(6246003)(64126003)(316002)(2906002)(81166006)(53546011)(81156014)(2870700001)(305945005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHSPR00MB190; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT018;
	1:MiH8kmfqE748UwsyvKeCi6bmfNAApdpzkQeSz7zlbiJyf5CPeYz5WfxyC7n/x6Reve52xAHlsDVQp+1goyfrIjdYg6lh6iiSyv14MBB5nsS47gmTpegmEWUkLcjgWATI
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0c9535a-e5bd-4af6-7769-08d612848d8a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:MWHSPR00MB190; 
X-Microsoft-Exchange-Diagnostics: 1; MWHSPR00MB190;
	3:Vxrot2hqczIUqxyTO4Tk9PwakbLYMjvvwzS2RO99OtfysJLV7ijusu8ElgacAdRAuyLxiQi1QjD7HQtPzyDrk7PWeiqxBpSAMaStl83rltGYrMpoXnuCQHQpY8yljlB0EfO3yE65zd/BybQZdX2O16DNybM5Zd1eOTa0yU9MTSnNz0QVS8qKObQf98EqdUGYNZoWk0GuPi4uTRzgI1dQstj9i8FIlsi26yyGE/BavjwExwJfSm2uWmk/+K5kLP56Pyp47zy3DFXbj98lMrwy7dklZsArq+RftOlRyRSrHdj81of9qqILCQZy2uIvAZ1/6epSPx1UlmPwFfFZpU6n62hvotd3h6HoOUfL90OmNDM=;
	25:J7RSCedM6s7wcf9qW1O7t8X08V43SLwRuITRtaenjLDJ8JFetWKmFyqCbfE3pSe3oQ0o3ZCiYfoxRHJWng8LaPjU7JQJIpT1F2S+FAk19L0AavcTwtSv5yGMCpEEsDWSF4CH61UWqWenjEa3pB+6Mjicho6qMrxxDm5dRvhTURZ84zeZq9SbDbFYr0WaaGqT6/pDi6VXfLRnpdov2q6B8AtdaCBQ3Vp+laIuLrrC/MZ1LePx+CxaXI4NnTN4dj+y2wbWr3jwU+BZf4ZYI8heY0qehSs8PjvyR1LwRIVfGZPYEahNmf6669LbJgqSYc7U6OP4RF7mP/z2XOCTt7CbBw==
X-MS-TrafficTypeDiagnostic: MWHSPR00MB190:
X-Microsoft-Exchange-Diagnostics: 1; MWHSPR00MB190;
	31:TNNMK5S2I2DN6oRY+qfiYMfYUwg/REk706v8nF3/A79rYCdX/SJs3RbJa2dHejIMB9FTtykSAWioOtRPlyzYx4P6q7dqFSnW3tlvY/PPfS6ud0UKfvjRWzsSlQv8oVIC1r3p7PNcrSHMUTzYbjCDGYg+ScyEt1F4mvmtne3eu5p5Y3t7fh59RhNaihrfsS9NeBjsFnbE4YOkIe8sxwLrlxVDHDQwoc0KpTFLalcy+O4=;
	20:DRXWWVumAbj49bWNprm+YD+1ON3R64bZSVB/5VNe8QPOcfShNKpR2QDNX9svg6JY7RKx9Ii0pjujx8DlAPuSLb3VnXFWb3qi2gH6CLwyyRU3RqaVZxk7SqZa0FW+X87eVAcSeE/VSEI1EDM43GCdPCvSo1Tg+ZjMsSZImMOF15O7XpayMcKD0LwYxr7ivQl84UsIUbKx33OfFL+VXl6P169G0i3CJ9aU0TNFqQfPRT1ymHZZwFMuUjpLq0b/17hx4nJ4CWOlplkf9ZFoQn92b6jHR5Olz5jkJ6q6vgNuotpOoi0z7KgFBM+p4VKOdSnbWFzCyejYfRKZFmMD553Qftut0F5GvHd8sGupcK7/7cMDS8tAJ5BJ71obCS6gn5v+ApdMmnIWt3bjwS84hhJ/LdiuEBz3wAt87qoz0nM7Sc1ueF9qWO4f07hFX3tlQC0wkJKceNPkAYXRHL/rl6U6pmfLIfNU4tiSC++GqpXD3LaCLHpdkN3r40WDnJOrIziE
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHSPR00MB190BCCCA253FF88D6606C53AC030@MWHSPR00MB190.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699016);
	SRVR:MWHSPR00MB190; BCL:0; PCL:0; RULEID:; SRVR:MWHSPR00MB190; 
X-Microsoft-Exchange-Diagnostics: 1; MWHSPR00MB190;
	4:B9yYlpUFC4m/STuVUd2t6T+C7yBcjP0p96TsT763t9AX0l5CvCNUCwCVcsQMnb3Gct/ohs8D/1GpFe/33zlXBzQQfhAxkOklp62tO4hhdUrtxIN82bng0L9Nig0qSkxkVOeXu/bSxA6AWxyRVBWeXTF8SB5Eh8Ds/9op036tqjNfCRG4rD3NXGCLevGdZiC/qjy9CJSZKDW5KytKJGuOeGJhlBs0nziI5w+jOdEV2uSqu3DtuQfE0n0nE0xjmNXSH2z1zE7WziVOiqeA7RprbQ==
X-Forefront-PRVS: 0785459C39
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hTUFIwME1CMTkwOzIzOjNJdlI3OUlLUTF1NlF3c2t0SmZmMU9UVktl?=
	=?utf-8?B?TnFpNTFZS0VzMExiSytnbm4wZnFnK3NRTWNQUWN6b3o4cGRSdkNlTVhtYTRI?=
	=?utf-8?B?ckVVWmFUT2Q2UmM1amZmN0dRYXVFY0RsQ3VSSlZuR3N0bXFFSC9OWUx2YjRV?=
	=?utf-8?B?SWJRMTVOYVBpYkFxR1J5Nkl2YWtsNE5yUGZneG9OcTRNc1NQbEp2QVBZS2J0?=
	=?utf-8?B?N2w2Z0FaYXJYSkZ4cXRXaVBodFQvcnJBYnl1VEFaK3hFUERWcGtDRzJvOGhJ?=
	=?utf-8?B?ek9xY3lwNkdzMzhCa3lLb05mdVJrNjFXRm1OaTExN011eXZuV1FKcUVPd2U3?=
	=?utf-8?B?NFNNajhsLzYwQ3VZK01JQTlCajd5SXRsb2VKVE5ZUzBRcm5jN1I3VTRKNXN3?=
	=?utf-8?B?NEJIaVBHYTh5WTlHTFhOWi9sb0l4L0MzTHBlUWg4SWIzTDBiNFVEYy9SOUhD?=
	=?utf-8?B?MytnSnhXaFlEamg4aU5FcEU5QncvTlIxZ1R1NStJL0lWOE5rMkxTRnl5UXFh?=
	=?utf-8?B?VUhLOFoyZnBTcTV6VzFyc1VRK1YzbVVIb25pc0FqN1hBWm1EYjlUVGZ4dnRa?=
	=?utf-8?B?KzlFdTgxdXpQTTRHSWpyMzBHNTdnQW1La1ZlcU1CbzNrdzAxb2F5MWRLdUlD?=
	=?utf-8?B?RzJaYzdLcUJwb3BvSmdxU0N0L1pGT1lsVWVRdHFmZEFQY3J4RGw1VzBzYld3?=
	=?utf-8?B?RU11cFBka0dzWnJ0eDV0c0pQTHR0SmZEL1ZQQ1oyY24zcW84Z3Ryb0JhQmpl?=
	=?utf-8?B?ZUVZN04reFJNL1E4UWEyYUcrYWU5QXIxY3F3VXNrMnZUb2Z1L01oYTdZTktF?=
	=?utf-8?B?b01xaDBqRTRVWDV6cUVDOWpXYVRTM216U1FWOG1vMGIzSllyUW40andlbTd6?=
	=?utf-8?B?cWpIKyszRUw4eW4yd3MydllYVWdYNVZVQlhhYU5FVjBPd25lVGpsVmlKWnNU?=
	=?utf-8?B?ZFRQbHl4dUhUQzYxNTVLL2k0TDZKektJU3dDZHBzNE5OVHRkMVg4VXRYblF6?=
	=?utf-8?B?Q1VnRCs1WVBvYmRLSTRIL3NQcVhFOXFDZEU3NVQrV25YK1F6OXFGU0s4NHRO?=
	=?utf-8?B?dWJ3MUQvUnBpM3lGWlcvZnZMUVpERkFRVnNuVFF5clZkcWtiRmplb1dlYnNq?=
	=?utf-8?B?MEJDY25WZDBLVExSK1U4VVV1OGRlRXkrZDFFcG9ndVFVbHp1bzZBU0lYVTQ4?=
	=?utf-8?B?eVFDNkc4UkxkdHJYQi9XSDFadG13NlErVFlzdFlseGlLQ01ZMUZySC90WXhp?=
	=?utf-8?B?bEhmYXpySWVVYnlSSEo4OXk4a1JPbGFHSXI4RjBmZWphOVNCMFpRaTB0K3F4?=
	=?utf-8?B?bkZSSXF5bWpRR0swRWQrSk91Mzg3RnprNE1vM0dVSFdEYk15SEFXN3dXV2Uz?=
	=?utf-8?B?MWgwS1crblhVMXk3N3ZqNVZ3MDB5bWNYNklwSnhzY284TEQ4U0U3amg1OUln?=
	=?utf-8?B?UVU2U2JBdU5GWElycmh5OEExRmpZaHhVek9LT0hXd0Z6L1lIN3FuK3lUdkdN?=
	=?utf-8?B?TUhyNURCb3hvbmJIazhDcXJIWFZVUXlUMndTc2tQdFVRUmRneHVqczdlc2FB?=
	=?utf-8?B?NkhISXZqdlNzMUlpdm5tTmRodDV1d3hFVTVhNFB3bzBIWC8zME5mNldudVBP?=
	=?utf-8?B?dit6TnBmRi8zYy9XQ3U3RHNkZmVNeWtQSm85cjE3SVZkd0FsTjNnU1E2T0Zt?=
	=?utf-8?Q?8VJRtlLF9b1qgKRkhJFHJTF8fPPSFa0SMnYlV7B?=
X-Microsoft-Antispam-Message-Info: Humn4ZNH5iTzyO0JoWSLrHfIJGFg93zuN5NmJMrbITQBKlI7m2s7QZmshSLqXqM2Rniz9ZT1lh5Q42USSWMIsPXneiFtSwnYkP4P7C2SOkzRbVJL5vMpCu6L6JnKffOgiShxUMVROOd3QABcMNt4j1uhdvz0ramYlWTrkYShk2OX0/PAwOCoFSbPjOBtKsVO9s8eBUWOzjwrWPPto2DpW8jG1veARpeTAx+7hT/9pwXtJg+Sozdpt0/KQl7CPFPd86maFzZEJpDrN5BjoAxg2r9aDdtrSY4wuJUJYgZSejK22wPS0EG075a8yKlopQ9aNVm470TDki1OIyzQfXkI5ni3wAbvW+HjGprEM64q/y8=
X-Microsoft-Exchange-Diagnostics: 1; MWHSPR00MB190;
	6:+v7/052ORGAQVVhr6GBsGocBTHwHLuQ8RDDn8DDMyV9TSz9edEv59Z9jucLxJnlV/Tb7QJu6rJu7BE2d7Vtkk2eEad+7IpxXKt805rT1yEr0UWi1LgxRlHmhfAX9d3jTHXbeiZlUiykktHeCwAyRTDeEz5qCqZ6S7+VnZ9sSLKvHWgpy0jvmMCkija8v3qJuPREN1B+Dnk8muewX+70hDPEEM862TXd+3blNgyv7hky+0wN0Tua6sZ5JjwpoemqIJXMR9Hm3DE7SESG3IB9V0CqxzifHgUbNs2wSgXnId7W4wNJX/6C8XyYDJx1vD+ozc0meri5q0C+bTEmk6FilwuPpKulFf/YvtpusjfC0BkoSrqWswvCquPOyf1T61o0dEyosW/lnSnQk2omDF2TWfMjp0AOZx4EfVAxc4+A7EBqE2bwE2NDVWLfa5QrnnWhpToyqVnUedxFnElUAT28iAA==;
	5:GU9GqSWk1qt9JCAmXNgq9/S+gfdWu2fBQJ4HGPogQFLTgL+6gUm7Pp4UhlokGD4gKmXpg0srJQWyKF1ZMMYEj24jPNKBBn4M21/V0tsspqVlKr3ZxSHWRx8pM4th/ROD4BSVmhXCrhPiPLO3bZqjmHMR/MKRcebN1p1nhm2y16c=;
	7:EWR2AhxRaAUZFRxY69NXVynBsmuikNWUMLDrdrA3+g81Rm2wExGfC12C49TFqbdZqRZfv0GL1P8JfcgugrlgmarigCepS/tVqq4PSQLoMSCOkJ0/JkHViqhlOgRBMKd0WWCYe0YocBNCaS4Z/DrjRk093qBH8jHARW9NWRwNYiCE4sxj8I3B4uWTGEbbyGqtmqWLYOoOCRB4bIIHshXjyLveoYtIQML/OhENDfRNLFz5+45Et1I+q1dMmi2E1KyH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2018 16:36:23.6648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c9535a-e5bd-4af6-7769-08d612848d8a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHSPR00MB190
Subject: Re: [PATCH] terminal.bbclass: use var-SHELL as the shebang of wrapper script
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
X-List-Received-Date: Tue, 04 Sep 2018 16:52:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hey Hongxu,


On 09/02/2018 10:52 PM, Hongxu Jia wrote:
> On 2018年09月01日 08:14, Alejandro Enedino Hernandez Samaniego wrote:
>> Hey Hongxu,
>>
>>
>> On 08/24/2018 01:54 AM, Hongxu Jia wrote:
>>> The devshell.bbclass set var-SHELL to var-DEVSHELL, and 
>>> terminal.bbclass
>>> initial var-SHELL with `bash'. Keep sync with it, use var-SHELL rather
>>> than hardcoded `/bin/sh' as the shebang of wrapper script.
>>>
>>> On Ubuntu host, default shell is dash (/bin/sh -> dash), even though
>>> we assign var-SHELL with `/bin/bash', the wrapper script is still 
>>> dashism.
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   meta/classes/terminal.bbclass | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/terminal.bbclass 
>>> b/meta/classes/terminal.bbclass
>>> index a27e10c..73e765d 100644
>>> --- a/meta/classes/terminal.bbclass
>>> +++ b/meta/classes/terminal.bbclass
>>> @@ -25,7 +25,8 @@ def emit_terminal_func(command, envdata, d):
>>>       bb.utils.mkdirhier(os.path.dirname(runfile))
>>>         with open(runfile, 'w') as script:
>>> -        script.write('#!/bin/sh -e\n')
>>> +        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
>>> +        script.write('set -e\n')
>> This is causing a bug on several systems, I believe that it is 
>> because the way our systems are set up,
>> basically, our running shell isn't necessarily $SHELL, so it is 
>> causing the process to exit immediately,
>> anything thats using this class is affected, devshell, menuconfig, etc.
>>
>>
>> $ echo $SHELL
>> /bin/csh
>>
>> $ echo $0
>> /bin/bash
>>
>
> The csh does not support `export', in you case, you should correct 
> var-SHELL to align with $0,
>
> Such as:
> $ usermod <username> -s $0

I absolutely agree, but as I was saying, because the way the system is 
set up, it does not allow me to do so.

Thanks!

Alejandro
>
>
>
> But the script should be more robust, it should
> work well in this situation. I will try to fix it.
>
> //Hongxu
>
>>
>>
>> Sadly we are unable to set $SHELL correctly.
>>
>> I wonder if there is another way of doing this that wouldn't cause 
>> this behavior.
>>
>> Cheers,
>>
>> Alejandro
>>
>>
>>>           bb.data.emit_func(cmd_func, script, envdata)
>>>           script.write(cmd_func)
>>>           script.write("\n")
>>
>


