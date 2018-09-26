Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0049.outbound.protection.outlook.com [104.47.34.49])
	by mail.openembedded.org (Postfix) with ESMTP id 121CD793E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rdQYrUG0oKr4wlilXC/VPFBJsUIWIebRLJzAwxUd7rs=;
	b=bkrYRiGEI11h6HunZGrLJxblGliZu1nIjl06/4FsPtmHsY87wRfJSVI6qJQtbhXYKhDAiQwuY+Nsldy8F1eIuC/+aQfHrfMLHPXE/Kd9Ln2h58IZZBi3DwNFnq67A2MEsTbZtzBDrHkEtd902rkRGM3Te6GHPHTAAB/PQS4oZhY=
Received: from MWHPR0201CA0076.namprd02.prod.outlook.com
	(2603:10b6:301:75::17) by BN7PR02MB5108.namprd02.prod.outlook.com
	(2603:10b6:408:22::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1143.18;
	Wed, 26 Sep 2018 18:14:12 +0000
Received: from CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by MWHPR0201CA0076.outlook.office365.com
	(2603:10b6:301:75::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1164.20 via
	Frontend Transport; Wed, 26 Sep 2018 18:14:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT039.mail.protection.outlook.com (10.152.75.140) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1185.13
	via Frontend Transport; Wed, 26 Sep 2018 18:14:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:51279
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g5EKB-00024U-3L; Wed, 26 Sep 2018 11:14:11 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g5EK5-0001lf-VA; Wed, 26 Sep 2018 11:14:06 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8QIE5fa003630; Wed, 26 Sep 2018 11:14:05 -0700
Received: from [10.23.119.61] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g5EK5-0001lR-72; Wed, 26 Sep 2018 11:14:05 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180926120246.1024-1-ross.burton@intel.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <01b9521f-32af-0c76-e454-b99479ab88d4@xilinx.com>
Date: Wed, 26 Sep 2018 11:08:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180926120246.1024-1-ross.burton@intel.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(438002)(3190300001)(199004)(189003)(446003)(486006)(2486003)(8936002)(81166006)(23676004)(34290500001)(426003)(65826007)(81156014)(76176011)(53546011)(6666003)(11346002)(336012)(316002)(26005)(67846002)(77096007)(2906002)(110136005)(186003)(2616005)(106002)(230700001)(5660300001)(476003)(126002)(8676002)(64126003)(58126008)(478600001)(305945005)(229853002)(36756003)(31696002)(6246003)(3260700006)(65806001)(65956001)(9786002)(47776003)(106466001)(31686004)(356003)(50466002)(63266004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5108; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT039;
	1:LPo4JmOJy8zCtVz/Pf9Ua9Tm4ZyYYQmhd8r2Lypoy3TRmxnoC/nbdmUE9uXzgDcpfpB5ezJfmQYIELeMYwHS6P69k9UibTEn91wFfwFZEzBaFtqXWfyH0ObDYypsIy5p
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f29536c-d950-45de-4e69-08d623dbdc16
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BN7PR02MB5108; 
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5108;
	3:ReaTKB6UhMwvuMTSbc/oH3dVIyw75IYahMf7UGeqK6eITkHeKtomOtSZvSgVm7+1upAgbRT/i6Z7TowyOGCB76P9gSsWF//GJaz7VkjwIO94yvYHEPQ3xRM6uw67CWLDrL0wbOkG1v9+BMkVwM9cDRS4K6G9qctz8TCECRQ4dHtcd6ws/plQ2vr6aim/2hp301wYpf9fYMJPUOPyLt6Qk8MRi4oUnYvSH1XxDPGvWrYvR7IpfTX3xVeMjhWrxFoEiUUIbbVFaQv8RyIsO02KM1om2Ebq+80il7XS3mplUlwh5fyq0hPG68WEj8jUJKa2cw16Nx6O9tfedD3B/fY3aM9nZSRkGRgcGR2e3Kqk2H0=;
	25:4cTnSIZSeOcm2ZO4Hn0wCgERbzsYBwQMx5M+gdg44DP6jzBTLZd+//SautKFb5dYNlhy+WscjKFejCWp7PPlSuiaOmBVFdYdw8qtzuSiyVokTBZlYrNVgQslxp8V0QGksAeIiWVDvRxP8tiELyVFV7lmBjr1x5L+wAx4X7rBwAzqzBodyh4Opqth11PpB/C9KxKL4uT9BB6oz877TZRpK8BQM96FKwLkZxfTG9FazxGRHNq/5YCISMPw7zX5DrWatQUROL2TzqgRpIJINscjGYlq12aOJx2uQSSPxdPXPhNlSC+FCkodZ84glMVIOAQH2Z0VvmeKnn47U7int853Tg==
X-MS-TrafficTypeDiagnostic: BN7PR02MB5108:
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5108;
	31:d6IK1in3RsgVeZYge2Ya43w0shWaW4Ui5Vvjp3hCrl9ViO1y3Riaz16HLkIjdAKN5zgpD88seCxl9BRTJmIZs1vDIl5fWCX6gl3Gwj84BsjovHy+Mbohulsf9ZDVWZW1XdKcBaGjiAe8PC0t7X7kkoPzubqrPvmhZq6Fz6bXnHgoTUT/BaH/J8hceQTQP/DFm4Rbqtq68YYvFuA/JHDx7KuRrC2rFHirGy0T88lrnNI=;
	20:m+Ogn09SUtm+Ygw/3IcTRnfnrT0ixqimpaebGWACmbCXWer0TSoA8/jzdXVm6mF/qHkOAmnOYzoggSc3TEhHXj012/v0Ag8e3FZCWDJ5GSwuX5L+StEK5parw/8OLZVuz9B1Qzi68ZQabt0+KOQUvUKnqe+ARwYwQA7mGZWqL/+ohRSNX2aNz0oTneFElQEM5CzDslZviLOEqbbK/gwND9nxw46XBz05A226kyPj1E33WDuxcWu/g1kktbPz8JYlh6mpeOVpp7lKBZ4EPi9mstbUqzc0ZwsM/Q9451yO+wrb5ggdatoDQIvXWJp2bWYJq+C30+12cg0M/SXaVOeKFiALOTes9671yS6s3n0xf6ILUqufLdgvc/qrvcZRrU1XWeWsEChlkki/YGx0E644RaC+JpNYG2kA8A3hAgXVUDyfqiPjc/Wr6MjqB9T8jiDIQcyvxT+X+sNbJrz15fm59R8vE7FQeYZZd3ZOpV/VQtx92rFdghAGVT7sAsRtcPLR
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN7PR02MB5108C8052B5360764CC2420AAC150@BN7PR02MB5108.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231355)(944501410)(52105095)(93006095)(93004095)(10201501046)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201708071742011)(7699051);
	SRVR:BN7PR02MB5108; BCL:0; PCL:0; RULEID:; SRVR:BN7PR02MB5108; 
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5108;
	4:3+dEcSUh6jYSJzI0o+iAKgJNdWiADoPX0+vRAEYZMyzq013S6F5LZYqXEgiCA1YZOlRE8gQKhp9ILLrLVO+LULpRIuvkFLD5IXM2y6F0YP6X4+VBSKHcTnopzj8XN3PGDo+mFHj9nCwhwv65FH9SK8UI6TzWys3jyQOIqHKTT1yAX9Jjdr8Zlx6Ffa6qiPgwClCF9jsiJYGbOy/UhEJK5w/cyiygljFXIeKgZPcZv0ZTzw5dYU+94lCDaWll/y74/dy3HRz7FR2GjO3qGijn8BeKyyPE8m3SP+th3EI5PtNC0ilmwSAlw2sqZa59eoEh
X-Forefront-PRVS: 08076ABC99
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjdQUjAyTUI1MTA4OzIzOjdBNUNWWmw2dTZKdFNvZWJuS3hleG5Kd0RH?=
	=?utf-8?B?YWJtMkRQQm9QOFYwZjJxZlBpcWdtSitpNzhXVVZhc2lSTHFDRjI3emgyN1ox?=
	=?utf-8?B?UEJYaGNhNUxxWDFZdXY2a0UwTEUzTzh1NTNDNmNDakNSdFh2cll3NHBYZE9j?=
	=?utf-8?B?eER3Q0hPVFRveERHRGFLbXAzRHBmYURKZWRXb2ZlZ2JtcVhmQ0hCbWpLRXNK?=
	=?utf-8?B?L3hzQzlXdGowdzRoYWFqVVg2VVZuOUZEWkkvdUpreXMvVmgyNlpZa1NYdy9Q?=
	=?utf-8?B?ZVhka0M0aGw5NHRDL2lqSklreUZGSjRwV09naUJDU0luL0c4aWZoRXovTDJU?=
	=?utf-8?B?N0JRR1JWYXFaN2VOVnRaelVKMVlnZjIrWDNWZjFIZ0lCS3FrWjViaGlwK3B0?=
	=?utf-8?B?bE5DcVlGK0I3TG5mWGYwZ083VS9NQnNtU0R4bUpLK3k5cE9vT1VVS2RVMU9E?=
	=?utf-8?B?N3NXbVFOZ2t3RDlMTkNocWp1RjZTZVgwQ2xMR3VRWk4remNDVVZ6aW5OS3Nq?=
	=?utf-8?B?aVJmSzdFNHlSdDhLc2RBMjhSM3lybmVSUnVlclFHMGhaVGR0SGgxVlhJWTZZ?=
	=?utf-8?B?ajQrT3gvNGJ4bmhTM0E4aUpFc1RsMVp4RzVVTmc0OXdhTy8yUDQzeDh3UFVy?=
	=?utf-8?B?eGpZYkJEQjNTdEJoK1RHSkxaWXhRNy81K0cxQk9YWEJCOGdTZVZEYlZJcUxR?=
	=?utf-8?B?bFB0dTdIWEpqUEI4L0pLYWFnNStxSWIwd2liNkFFMnVvc1VUZjlJYWt1bzRL?=
	=?utf-8?B?L3BVNmpPWTdlSFdUTkR4ZGYrNnFNRDBWZGppcXF4RnJZeFFvR0xLWkVxc2h3?=
	=?utf-8?B?S0pwbnBFdUpnUWRHRGJBTHFlUEFmejltalZmOFBkTHBRVis3b2FjOTdlOFVn?=
	=?utf-8?B?TjFGZlFSOTU0NFBJa1VSbU9rVHdWT0szbmEzMWRlZzEzaU1UdVJpL0pMcksz?=
	=?utf-8?B?U2FpMHRFYXk4MkNjRW9LMFcvUVBzTG0wZ09hNm5vdHdlQi9mRlh6dW4zclBr?=
	=?utf-8?B?QStacC9HcW8wdkl4T1JrOUFvdWFPem9scHZ1MmIyelgxSmtJSG01U0ZMa01V?=
	=?utf-8?B?QmZ4QUcwaEZ2cFhIdDBOdUFuU0dhSy95K2tUMWhEdDdyMU5wRDJNVm5kMnBt?=
	=?utf-8?B?ZXlXUHY1OC9hTUdWREVua2dvZ21XYkJzY2pUZ1VPTU0rbFpZaWsvWHg4YnhB?=
	=?utf-8?B?dE9VNmkrbmpnajYxV0gybFRtNU92U3lpdXE0QUxlbWcwVFdWNzZWQkY3dCta?=
	=?utf-8?B?Z2xUc2lES2tKcExsL1J6VFZrWFJhaXpSenYzek1jL09iWWdCdlcxemoyMUJC?=
	=?utf-8?B?c2VYbm5pOVQ0dnY0RllRdC8vSmhGaGNDUTRSSzNWSTVKVGloSUQraGFKTlc2?=
	=?utf-8?B?Q3RzNm1MWmRDWW85NFZzRm0vUU1JMTkzN1hpTDBxa0tqd1dEWnduWC85TXI0?=
	=?utf-8?B?S2hsT3Rvdjl3YzdYUG5OMUU0Qno5bHErMXZSSzJ2bUVINjlUN3FOYVRkV1lP?=
	=?utf-8?B?ZE14S2tmYUE1dkErV0c5ZDdKZVpjNGNUeUlNWENsUm54MW1QZWljYnVMTmZs?=
	=?utf-8?B?VHFFT0Vua3MxazZtc2NiN1llVWZjNUw5Z01rbFRHUDBvbkdKc3V6ZmREYUJR?=
	=?utf-8?B?dEZLYVl6KzVNbmJiMVhUZnZvUVp4cFlEcVN1aCt1Tk1ma3YvSkRHMXQ1Q1o4?=
	=?utf-8?B?MHVzOGtsbCtDMHpuWVhQOUhWS29TcmJ6Y0JER05Ia3Z3QTEvTlJnWUxMVVZZ?=
	=?utf-8?Q?PONmkAfP7iY7FCRhOIZphe98ZiTEPB0yVjnXI=3D?=
X-Microsoft-Antispam-Message-Info: PnB7Bo4jZqrVPVri/RZkzm0EwXiXiYQfUKLeA9upXtVRl70XS0uD96p+TF5Xg88OiuDLBNLgf60zX9kCm2/Mn5EIHzkOmll6Aa1WmzoZFVmlFGhgX3F2QpSmrnPBFYFsPJMLaUVdKFczcCeSOTiz4THY3BPWMmKRD3MKLOHI3etNG0Mp69WoagXk1Kkgqh6p7jZhmz6xeh+TiM4REkHyy+/0cn4TCZsR4g7XGBo3BJs+MCrVN87u/A5L4lJMIsyTpzCkoLa7F1vWa947stvko4BnbrO5+3lwXV+WDJKhrJzRokMv1NFcYpbEjHJFDsAHDiIw0hLj5tqRa/hbmCxEaFArhpvuJYjRIrkcCoEeFmk=
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5108;
	6:n+kPod6ST7CnTu+VIRgUpzIjQK/9dKj15Kej/QSUiJ4S0l50wX4zxhw4kRUQ+Y9GPpzjFIxRHDANwenS7wbYTUdv7ofi8keekuLDfLLgOzDxKJp+kdo+7JFxVcG9VVYVArUZzB8KcTV+94OPT+xjou+Uv3Z/q8pZRfQKIidzsJMCqCSsOMwdvjG4nIUzXzQ7K94uRin/ik1ZE6vBqfrzz/K12wGa2z8MyZRkMNSsZ/XDBGJY09tGjbV6DVke1H1N1VRB4ljGcCRbjQIrZag3K0ajNBPw5NAZqMIZqG9JaDLnURZ+QJ141L6p4abhDECW7iH6VHVDYMY6dWnecTGXcrEb3dcqprlUq7sH/3nZxDf9HtjbwL16G84gWDQTaX95AaS2DUW2ZIHiuxCDCGgoX0hWHj0v+bAwo8Gi2HYBg9SwzQvshrtNNyUW0hPvIKWb+Wtmy7oTUN8kUo5/mkhf9A==;
	5:BsgH+S4sP7jDENoykD6d6eyNOtrHVFw27MfYzqL3QHeIfp+rKmJzekmrh/DUv/GNqG+VewI7j/XX0QYouYvCiqlND57orobBhpAYFaqNv3JaxRLoWA0vK0N688TzjKCUajSO2V5R92+H7jwZZFsLVvC5girGCbQyQ2VIBtXrWTY=;
	7:fkyTp2tVippjGNOkbqAoMZ1PqYrVbYm8KA4Rx6pqju5YtKRpMs57Ei5pd0gHwslo7WS9Buhf8/s7p49oTARtcN16ceH4Bf11wXFFhV08PheeLkGaJOdOSToYtPjxfLJs+NHN6q4cr86UAVR1LxzeedGYWJElPZnu8ostlHPbea3Zlpzvi6GWrgfHthW9P83aEixojOMuq/0whqwRXFL8Y5joleCjJli7lJI1EuXUA26FBBNBeBYOFxDwbhnUkklt
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2018 18:14:11.5044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f29536c-d950-45de-4e69-08d623dbdc16
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5108
Subject: Re: [PATCH] python3: move sqlite files into python-sqlite
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
X-List-Received-Date: Wed, 26 Sep 2018 18:14:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Ross,


On 9/26/2018 5:02 AM, Ross Burton wrote:
> sqlite3/__init__.py was accidentally included in python3-misc.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/python/python3/python3-manifest.json | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 539b7967b59..fe8bb992928 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -994,13 +994,11 @@
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
> -            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dbapi2.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dump.py"
> +            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/*.py"
>           ],


For python modules that use an __init__.py file, they need to include 
the directory instead of the wildcard *.py, that way when the manifest 
is created it passes the whole directory to the new manifest, and it 
does check for dependencies with the directory name, otherwise the 
wildcard is just ignored and cant check for rdepends.

Cheers,

Alejandro


>           "cached": [
>               "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__",
> -            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dbapi2.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
> +            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/*.pyc"
>           ]
>       },
>       "stringold": {

