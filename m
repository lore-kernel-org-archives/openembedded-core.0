Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0046.outbound.protection.outlook.com [104.47.33.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD3071A8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ALb7bDF1aRz9+B57G8Z6RFwWKn6iVFsqL5vJMfEL+8s=;
	b=nuUC+L6IEQXGJD0NJJJl35TTXz7ggrAuyh4Gt6H5CkQI3iNhG2O0ogTeYtAokgppFQufxogOVz7XJuoh3T4q7ciNijKgbazy6juBJO5t/gpBEMsMubeYStwGW26ZNK6KxMGpZmqq3CF+7zPDjkCEd/z7x1/jznoYTDHIhhxV6fw=
Received: from SN4PR0201CA0048.namprd02.prod.outlook.com
	(2603:10b6:803:2e::34) by DM6PR02MB4940.namprd02.prod.outlook.com
	(2603:10b6:5:11::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1080.17;
	Fri, 31 Aug 2018 21:21:24 +0000
Received: from BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by SN4PR0201CA0048.outlook.office365.com
	(2603:10b6:803:2e::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1101.13 via
	Frontend Transport; Fri, 31 Aug 2018 21:21:24 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT051.mail.protection.outlook.com (10.152.76.181) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1101.10
	via Frontend Transport; Fri, 31 Aug 2018 21:21:24 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47316
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fvqr5-0007K8-DH; Fri, 31 Aug 2018 14:21:23 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fvqr0-0003yy-AK; Fri, 31 Aug 2018 14:21:18 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7VLLHK2028875; Fri, 31 Aug 2018 14:21:17 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fvqqz-0003ys-IY; Fri, 31 Aug 2018 14:21:17 -0700
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	<sno@netbsd.org>
References: <20180831154710.26856-1-sno@netbsd.org>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <f47d5155-bcf0-3245-b1da-6d1fe7861496@xilinx.com>
Date: Fri, 31 Aug 2018 14:21:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20180831154710.26856-1-sno@netbsd.org>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(438002)(199004)(189003)(67846002)(106466001)(966005)(476003)(5660300001)(106002)(316002)(2616005)(58126008)(64126003)(36756003)(6306002)(126002)(426003)(110136005)(16200700003)(50466002)(53946003)(229853002)(446003)(11346002)(486006)(65826007)(31686004)(478600001)(53546011)(14444005)(26005)(23676004)(186003)(77096007)(2486003)(63266004)(76176011)(575784001)(47776003)(65806001)(65956001)(15650500001)(356003)(9786002)(2420400007)(81156014)(6246003)(230700001)(8676002)(10710500007)(31696002)(305945005)(53386004)(2906002)(81166006)(8936002)(336012)(46800400004)(107986001)(5001870100001)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4940; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT051;
	1:fmkFnDhIys2cbqK9yQ1QPxi1G8F+UTu/D08Mk1dshYg7GEefbXLS3QcZel41B+7m4IWoyQmNwwVVzpPIqr3ktwQy7PgN76WX8ldsHHS45IJjXoVuaF8gqa93I+P52khC
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d439f26d-79c7-4688-1ec4-08d60f87b48e
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM6PR02MB4940; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4940;
	3:94I10zQDSOa6xKonqzkTqWwQMdU+BKUf7tiuhF5Zpk5nPLRY8/FPIawou5sgzyrUcQGbN1mGYgn/ffjIr1SSEzNJ3irO1p+EOrf1k4b0lsAQRbirC/+dobN/1tNTtfm5MaUPaT/NboQAE2NqVxjjlFn0QK4g6Pnhsq3PrAGmavQKc0lB1MoEid8X5cupQ1JMeKsr164fIMmDy+01UfQg0xJ4v1LGMcTITUBwbijApo01O94KUXyeB/UKGESx6p6/REkj/HOCbtP7OxSYOzsUNrPOKkU3U7gi3XwcY/7nRvRBHaODwRWArQWERgu4l+NsST8vS+0e1VwwHmEzzCu3jLRv82Tyf9avD3I9Cr2/M6A=;
	25:45HuCsM/gpSjTuicXkC6mG/s5FLoILSM50O2NTsjwFsZGMXCNuYONOz/oq2WwDNHHYZ6hiHNeGfZW++egbt9jDSzsMtLQ3h2m8Wvg2TlirXltl+QL5gdoFZ7mipol50ZRVj40OUx+9S9jce98o+RQvvLU7v+1q0XAHQYJF6v/3mbJDce1jjkaW7VwJechklgojul07+deeBBgmmMtXFUGSv32T3Od2ooW0vQzMMIcndRrobx/k/SGqiHVSfiR5+quAZ+Kz/x7qcGB8fsnM9ecBf20hZcUk2AHu51XZZdONBTFV42x7mQCbBRAQAs0CDvj3iUxC1spQhMT5FMyY1nlA==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4940:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4940;
	31:Wm4rrjW+9fgkyxh9R9R2nZLf6heFtVvv4BmVqVvRazzoWucjWlig+Vr2pr9ye7DIXrBOmsgZMHkT+zdMhvKPXduxKONbvX1KyA3RIL03yhrrgA/Xt/FsbObviYjxvcZpswiZeAYMh/Ti/+a8GtZuoTW7Wvz7TjbPspwPF6IN4gAXGlcmCe+dYxwjPCUjM7B4c+KmBOHpU3C2TBnWz8UakG1PYE6TyCMLP7sPgX00MOw=;
	20:I43Z2cjnjDEPVfJpeOslTUhx/J25r+R8vYpKO8dcQLBQ21gQcYFJLHnv/yXxjL3K7u4pOfMJmgnEPlhazrWQdZNYfFcQNtI5CGPW8VYaUm+PnCkwHnAIxFIMDxIM185hZovHGw+GTaIHadhaRfu/jRFVKyu9CVBeZkEZctnPxFEZxDRmmaHkvAMeJml3mOt+H0dxPm/enl1CqqH81/IBpQn9AomYzu0gok9Fu8d0DrZhCxMSKv8HlIgEvrjGnYYD/H5PDLUUCUETJnQ78vP58JYSptK9qa7oASmAWDWL+vSqweAqmJhzKtv/N8QGcpdqKQrPnkDioluzm07IXkTXsLf9DJNCQIduiGMqIovhk26/ka+nJ8sGEWHzrDtgv31BTIwTWQn1Zq4wDog0J+E5aCAt5mhvX1VwCQ42pdJsr1fE4nyl6bssdLbtCV/mxwK374qHnUeGomC/mASyJ/zKcVoXB3jymscVKKrpByP4tgggdyrVFt1pVyHoT6r/o0Qb
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB4940BDC5EA4011EA529166CAAC0F0@DM6PR02MB4940.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(48706222282353)(85827821059158)(69456235874885)(788757137089)(48300812402016)(163750095850)(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3231311)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699016);
	SRVR:DM6PR02MB4940; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4940; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4940;
	4:gS8IqhVJqjB7rvme9yo1q9tWlaSylTDod2jEwew9VAACGCvZaRtshtqHuXYpIEcKd5C5vVg19Iba81DWD1pyjyurnzFWQJklMtgAlC5Yix50hKj4ylynUCv7eXegIDXl0FGl1XrhXmdL0Ulx3eaoaJLSme+1ogV4hBeqJfmdqaNE1qVzICjqcv5H7VDXeI5VpZc/28t7CxqzkGWCrRRiu+weLCvw9+fM9jXg5ZYxRqdTqs4bxCqe3zFRNYCzABxBr5gu6Hr8z0+1P/EOjjrlASx5UcsA1MQ+hBGsRZ8EvkyfDL74/hXB/ConRzltLbIR32NKBhPctKeIK+bdn2P/1Ptp0pvxtWWN4lRPC1lv+XnNT0f7snlg0vW9VvyRVEyPRIyzTbSBt0xcmaZgubiCQRlDZuvUELn8w3ZW9DugkdBroHQQdf5J8djr2M3+nN7J0ZtOmHclDtXNgm1gftPyKF0cjBinNva5gZpeBTvVoIoMrYggdVSFCyKgOhGvl0g+K/NSFkh8C8f4ZohKzxAfIPLUEumMSocUn7J0xJYdTg4=
X-Forefront-PRVS: 07817FCC2D
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTZQUjAyTUI0OTQwOzIzOjczT3QySUhJN3pLMWFQaTVJUm1xcUhFTHdm?=
	=?utf-8?B?MElkYkJ5NTd2N0hEamxSeFl1M3JTcjNzUTBHUGM0Mk5MWXB1bjU0KzdqSG16?=
	=?utf-8?B?dFdaUGo1aWZnbmIrME00L1N5TUJjS1dmM0ZrakNkdW52NTFXWmY4YWRxZ2Fh?=
	=?utf-8?B?QnJBell4bW1LWFMvQjFvYjFDV3FadE9YVXJkb0ZKVnUrYWV5VklBWWNYS1p6?=
	=?utf-8?B?ODJsYnFZUUl2dC9oK29tUzNXUEpkVFBIMDRRYlhGa05YYStoNFp6V1NrR1lp?=
	=?utf-8?B?c2ovekltYXZMaVFtWGkzTDJ4SjU2Qkp0NlFVdUwzL2ZEN1JxMTdvK1o0c1pl?=
	=?utf-8?B?VTdFbXE5cXM5M2EyNURXVEJJaksxQUVucXNPZ3VLOUlOanh5Y29xc3FVaS9H?=
	=?utf-8?B?R2x1ay9mL0RIRTByQzNXeVpQTk5VNEU2ejVzdi9TcSs2dkQ1WWxrK3FvU0da?=
	=?utf-8?B?amc4WUhiMFZ2bk5kWEtxNTl2U2dtbU1rL0VxRlhBQmdZcEZCZUc3WkIxR3RR?=
	=?utf-8?B?Wi9NQ2o2bDE5cVdnUkdhYytOR2swdEhEL1AxSGRiditLZGZlSjg2NFlmaGc3?=
	=?utf-8?B?Z2Z5eVdXUnFZWk9PRTg3bzRYbGQ2UUlPRkZYWno3aFZsaU4zRU5IUnFxNUlh?=
	=?utf-8?B?N3lyWkFQZXBmRXlJcmR4c0VwbnFkT2Q4RjlZS3dnSm10ajVleEhtRUNHcHN1?=
	=?utf-8?B?aTdWVGpjTG5Qclk1K2NkTklTS3lRbFB5bEZyd2ZiTXBpR0srK1lRM3ZmTVIy?=
	=?utf-8?B?eC9WK2RNWGY5Ukh6STBNOW1BMUY1NEZqVmV2QU9oQzNSRWJxdkh6MDZ6K01x?=
	=?utf-8?B?eW9qN2hlQXVxNHVGVkNCdWJObFNSQmZhNENUaVFBSVlLeUN0REN0YmNiN3A2?=
	=?utf-8?B?VDRrcWVoQTF5dmE4REhmVnVGaXp0My9Yck9lMkF6LzczSVRXNHh3SzJSaHds?=
	=?utf-8?B?Q092R2FlanhOZVJMeWxpeDltVzh1VHpzTXoxaFNKcHVBbUxadVNDcTdZTDlo?=
	=?utf-8?B?dXcwYXZIcGt6cDBLODFzQ3BUbnlKeFVEbkJ2ZlVpVWU1dklEV2hCSGc4S2dQ?=
	=?utf-8?B?U1gwalkzWnRxSDI0bVE1QzhmeUhtUkl0eWhOa2ZCM2dubldFeTdXbmpqclRl?=
	=?utf-8?B?TmhSVnVJamxPZ2hMdkM0YkkxOEN5eDVhaWxpSzhyajJvRE8rUy83YkRQRlY0?=
	=?utf-8?B?MU8zWFk1NzlsSDNCMnZTWTllaHFmODV6anlxK3ZVU2ZBUjdzSjNqNEZuSnYz?=
	=?utf-8?B?K3djaFFIU01Cd0JTcHZkMWxnODZwZ05zNDQxUEhxQ2NUcThCcjNSY21rZ3Q1?=
	=?utf-8?B?OGUrdEZ3Z0o3VHFyN1BoQWQ5WXJPclJiS1JDR056cFAyNXhDQ3liSTJvUlZB?=
	=?utf-8?B?MjVJUnphZFAwTnV3VzRveGl1eW9wL2lQc1RlWmNCTXlobWlGY3hCZDNnTXRy?=
	=?utf-8?B?alJKMjl5ZHl5M2JXaDJ3aC8relNMOGhwQitvK2VLZjlKNXg4amZuZlduRkRl?=
	=?utf-8?B?M1ZwSGhvdFdiWGJGNlZNN21VaFRPcklIQVlSNldnRWNHQTdaN2MwYVlGLzFm?=
	=?utf-8?B?OGRMcFREblNkWjdlRnhrdnpzTnNYN2twb3BDbW5xT0E0TWlDWXA5UUR5OEY4?=
	=?utf-8?B?UTB5allMMkJFeTdBcWNnZ3p1dEpDdDE0NjdWcEI1czYraXhaSG5HNzlIK2xC?=
	=?utf-8?B?UmxlM09wamkvNE4rV0JhZFpZR00wZjFPaG5JZm9aaW9hTUdORVFGcDZ0NjNz?=
	=?utf-8?B?cEE5bEsvZXN0TFNOUlZmUWFyWndDZnh0TFVaZ1BidXdsMVVLM2VEZkYvdGM1?=
	=?utf-8?B?NjUvM0t6QW5CckdLTU9jYi9vWk43UXpZbWNDb3VYVENpTDBLRXlyQkhHVzNO?=
	=?utf-8?B?OTVJYVdoSjlKTU5OaklnRGpVWitBSHBXRE5vTEZnajl3MnozRGNvNnlKNWZP?=
	=?utf-8?B?L0NLa2VEamI0T2ErK1BaNnM1N3Q4cjhtRzFFTWpqbHhZUE9Uci84SlB4WWtO?=
	=?utf-8?B?bXBwa05XaFJMZDdKTmFWaDNHamFqbTBsOXU3eG15N0JuejVsNE51T1VhOU9w?=
	=?utf-8?Q?cck8=3D?=
X-Microsoft-Antispam-Message-Info: pVABHG+0/Yf+pr5VAcUDi0jhbOlJ4hZbpxHxA2Hgrvq3NfvFXP373uGXY/dBOoXxKERwKxBBpddPpLLhxr/R2hVq8cphcJ2JpAHR29JPCUxea1zQJkB0N+VtwIIhHpMUMXEuBKe+TSkYTIt/Skg4P5ZM/MsbruN1RP1fG6OTnaAgoqOStnJKK5SI1K2vIbhdAoCVVS3FULcXpnFErnH60kqbCIyADs1SnQvCvg1Nx5flsD2rWda/7WaNrjNPf4XydKMUoK/U88iGzXA+rOgr1TGSuy823ShxoEzic5lIOnyAIF1mixCLCdhxMl5jxZl5i2IyK2D0aH2TyNOF9B3nVnMGMyYUJeSTXem5BVOGhOY=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4940;
	6:ba7FR25QAwX47x6OreWDxcqQHYugAeMTQh6n3EuytapSfDRlWSPpgTG84GhCzfFnGjC5p7wDPi9sVBzxlvxWWgGtq3KlCarKxV+pT/DCXbpU5xOx35Y0q12GxOMuw5rkLwTKfcSb5KaH5/wpn2rRka7NMrKpeLamSrOQIb2lYwpHI3RVlhOj1QFb+IYOoF2N4s8s60fr+MznHyBwkFLHXuvpSoXYwBUiaC1YuodHacCuSjTPFVMLHmBkDIXINzy8NqrOWHH7SKbXlNiu0l1Oam005D3inaX2n1GxMkjVSaV3E6UMTgtyhSBSeM1qIcjeEZgkMZ+hW0s9QLalIPCAuOJK3L4zRM1w83bPYuv1iCaRelfxopEsS3+qt0fa9L6NPl8hG9WFfvPkrr29KlO2rubLhJEhj2LlFnkuOILknuNd+hje9jYHmjeLR7DPaGbNFGcpS3BvEOXflgddvaZJvw==;
	5:om8H9oCyhKLded3TZ1gEygqsx0c1U82LNq8Ccmo7tVf0isbRYaTO27FdmRIvhIx33N3JVjBgiYgipNUByss5H7nPZixv5C1VWrXHNBg9WqaBpidLVHiGPiWUgyZ0DL0tj8TmXTHVXOCg8yomN77yC6Bvu6iD6gYt18lNKod8I9Y=;
	7:d/bnatIfUXjBkKsCUTperm8kQUAW/BqNXLbdhNX3lB0xBSlI8HSDcfsiyzj2XPSfO6GqyR6c6Gk9f7hB032RTt0PjnzEVeUOy4rpnUoT40oyOwMShKnLSee+eHsyL3jTDQAApyUcT+cbIzlGHU1iylq5//xI3kT61tAnr6v6MxikqKEruAWn0f+krRbTXOQ1D33OxL8Z82CNTJmmuR/ZOWEZmHwPWxQ/m9HW0FA2ha81n0pER2hcR6WLTo5TYnrp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2018 21:21:24.0124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d439f26d-79c7-4688-1ec4-08d60f87b48e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4940
Subject: Re: [PATCH] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 31 Aug 2018 21:37:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Jens,

First of all good job!

On 08/31/2018 08:47 AM, Jens Rehsack wrote:
> Update python3 to recent 3.7.0 release.
>
> This is the first state of the package which compiles and
> packages, further tests on target and in sysroot-native have
> to be done before.
>
> Please review, give feedback etc.
Can you please add a summary of what was modified on the commit message 
please?, rebased patches, upstreamed patches, deleted patches (and 
Why?), new patches, etc.

The native build says its missing uuid:
The necessary bits to build these optional modules were not found:
_uuid

perhaps there's a missing DEPENDS to whoever provides uuid.h... 
util-linux-native? or its not looking for the required h file in the 
correct location, check setup.py

Its really important that our python-native build is complete, since its 
the base on what the manifest is created, which btw I believe you forgot 
to run bitbake python3 -c create_manifest?
It would've produced a new manifest for this release, but I don't see 
any changes to it so I'm just assuming you didn't run it.

Also,
python3 (target) failed to build for me on qemuarm (do_install):
sed: can't read 
/poky/builds/qemuarm/tmp/work/armv5e-poky-linux-gnueabi/python3/3.7.0-r1.0/image//usr/lib/python3.7/_sysconfigdata_m_linux-gnueabi_arm-linux-gnueabi.py: 
No such file or directory


Cheers,

Alejandro

>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>   meta/classes/python3-dir.bbclass              |   6 +-
>   .../python/python3-native_3.5.5.bb            | 112 ------
>   .../python/python3-native_3.7.0.bb            |  74 ++++
>   meta/recipes-devtools/python/python3.inc      |  74 ++++
>   ...hell-version-of-python-config-that-w.patch |  21 +-
>   ..._sysconfigdata.py-to-initialize-dist.patch |  66 ----
>   .../python3/0001-cross-compile-support.patch  |  66 ++--
>   ...d-target-to-split-profile-generation.patch |  40 --
>   .../python3/03-fix-tkinter-detection.patch    |  12 +-
>   .../python3/030-fixup-include-dirs.patch      |   9 -
>   .../080-distutils-dont_adjust_files.patch     |   4 +-
>   .../python/python3/150-fix-setupterm.patch    |  17 -
>   ...GS-for-extensions-when-cross-compili.patch |  53 ++-
>   .../python3/avoid-ncursesw-include-path.patch |  18 +-
>   .../python3/avoid_warning_about_tkinter.patch |  18 +-
>   .../python3/configure.ac-fix-LIBPL.patch      |  21 +-
>   ...ssing-libraries-to-Extension-for-mul.patch |  26 +-
>   .../python/python3/python-3.3-multilib.patch  | 241 ++++++------
>   ...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  17 +-
>   .../python/python3/regen-all.patch            |  25 --
>   ...port_SOURCE_DATE_EPOCH_in_py_compile.patch |  36 +-
>   .../python3/sysroot-include-headers.patch     |  23 +-
>   meta/recipes-devtools/python/python3_3.5.5.bb | 346 ------------------
>   meta/recipes-devtools/python/python3_3.7.0.bb | 309 ++++++++++++++++
>   24 files changed, 747 insertions(+), 887 deletions(-)
>   delete mode 100644 meta/recipes-devtools/python/python3-native_3.5.5.bb
>   create mode 100644 meta/recipes-devtools/python/python3-native_3.7.0.bb
>   create mode 100644 meta/recipes-devtools/python/python3.inc
>   delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>   delete mode 100644 meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
>   delete mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
>   delete mode 100644 meta/recipes-devtools/python/python3/regen-all.patch
>   delete mode 100644 meta/recipes-devtools/python/python3_3.5.5.bb
>   create mode 100644 meta/recipes-devtools/python/python3_3.7.0.bb
>
> diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bbclass
> index 06bb046d9c..26d2b6668b 100644
> --- a/meta/classes/python3-dir.bbclass
> +++ b/meta/classes/python3-dir.bbclass
> @@ -1,4 +1,8 @@
> -PYTHON_BASEVERSION = "3.5"
> +PYTHON_BASEVERSION = "3.7"
> +# [d][m]
> +# d: py_debug
> +# m: my_malloc
> +# u: wide-char unicode
>   PYTHON_ABI = "m"
>   PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>   PYTHON_PN = "python3"
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb b/meta/recipes-devtools/python/python3-native_3.5.5.bb
> deleted file mode 100644
> index 3098027d80..0000000000
> --- a/meta/recipes-devtools/python/python3-native_3.5.5.bb
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -require recipes-devtools/python/python.inc
> -
> -PR = "${INC_PR}.0"
> -PYTHON_MAJMIN = "3.5"
> -DISTRO_SRC_URI ?= "file://sitecustomize.py"
> -DISTRO_SRC_URI_linuxstdbase = ""
> -SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> -file://12-distutils-prefix-is-inside-staging-area.patch \
> -file://python-config.patch \
> -file://0001-cross-compile-support.patch \
> -file://030-fixup-include-dirs.patch \
> -file://070-dont-clean-ipkg-install.patch \
> -file://080-distutils-dont_adjust_files.patch \
> -file://130-readline-setup.patch \
> -file://150-fix-setupterm.patch \
> -file://python-3.3-multilib.patch \
> -file://03-fix-tkinter-detection.patch \
> -file://avoid_warning_about_tkinter.patch \
> -file://shutil-follow-symlink-fix.patch \
> -file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> -file://sysroot-include-headers.patch \
> -file://unixccompiler.patch \
> -${DISTRO_SRC_URI} \
> -file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> -file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> -file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> -file://regen-all.patch \
> -"
> -
> -SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
> -SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
> -
> -# exclude pre-releases for both python 2.x and 3.x
> -UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> -
> -S = "${WORKDIR}/Python-${PV}"
> -
> -EXTRANATIVEPATH += "bzip2-native"
> -DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native gdbm-native"
> -
> -inherit native
> -
> -EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
> -
> -EXTRA_OEMAKE = '\
> -  LIBC="" \
> -  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
> -  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
> -  LIB=${baselib} \
> -  ARCH=${TARGET_ARCH} \
> -'
> -
> -# No ctypes option for python 3
> -PYTHONLSBOPTS = ""
> -
> -do_configure_append() {
> -	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
> -	sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM \*/,' ${B}/pyconfig.h
> -}
> -
> -# Regenerate all of the generated files
> -# This ensures that pgen and friends get created during the compile phase
> -#
> -do_compile_prepend() {
> -    # Assuming https://bugs.python.org/issue33080 has been addressed in Makefile.
> -    oe_runmake regen-all
> -}
> -
> -do_install() {
> -	install -d ${D}${libdir}/pkgconfig
> -	oe_runmake 'DESTDIR=${D}' install
> -	if [ -e ${WORKDIR}/sitecustomize.py ]; then
> -		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
> -	fi
> -	install -d ${D}${bindir}/${PN}
> -	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> -
> -	# Make sure we use /usr/bin/env python
> -	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
> -		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> -	done
> -
> -        # Add a symlink to the native Python so that scripts can just invoke
> -        # "nativepython" and get the right one without needing absolute paths
> -        # (these often end up too long for the #! parser in the kernel as the
> -        # buffer is 128 bytes long).
> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> -}
> -
> -python(){
> -
> -    # Read JSON manifest
> -    import json
> -    pythondir = d.getVar('THISDIR',True)
> -    with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
> -        python_manifest=json.load(manifest_file)
> -
> -    rprovides = d.getVar('RPROVIDES').split()
> -
> -    # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
> -    pn = 'python3'
> -
> -    for key in python_manifest:
> -        pypackage = pn + '-' + key + '-native'
> -        if pypackage not in rprovides:
> -              rprovides.append(pypackage)
> -
> -    d.setVar('RPROVIDES', ' '.join(rprovides))
> -}
> diff --git a/meta/recipes-devtools/python/python3-native_3.7.0.bb b/meta/recipes-devtools/python/python3-native_3.7.0.bb
> new file mode 100644
> index 0000000000..fdbc9888b9
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-native_3.7.0.bb
> @@ -0,0 +1,74 @@
> +require recipes-devtools/python/python3.inc
> +
> +SRC_URI += "\
> +    file://12-distutils-prefix-is-inside-staging-area.patch \
> +    file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
> +"
> +
> +EXTRANATIVEPATH += "bzip2-native"
> +DEPENDS = "openssl-native libffi-native bzip2-replacement-native zlib-native readline-native sqlite3-native gdbm-native"
> +
> +inherit native
> +
> +EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
> +
> +EXTRA_OEMAKE = '\
> +  LIBC="" \
> +  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
> +  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
> +  LIB=${baselib} \
> +  ARCH=${TARGET_ARCH} \
> +'
> +
> +# No ctypes option for python 3
> +PYTHONLSBOPTS = ""
> +
> +# Regenerate all of the generated files
> +# This ensures that pgen and friends get created during the compile phase
> +#
> +do_compile_prepend() {
> +    # Assuming https://bugs.python.org/issue33080 has been addressed in Makefile.
> +    oe_runmake regen-all
> +}
> +
> +do_install() {
> +	install -d ${D}${libdir}/pkgconfig
> +	oe_runmake 'DESTDIR=${D}' install
> +	if [ -e ${WORKDIR}/sitecustomize.py ]; then
> +		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
> +	fi
> +	install -d ${D}${bindir}/${PN}
> +	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
> +
> +	# Make sure we use /usr/bin/env python
> +	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
> +		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> +	done
> +
> +        # Add a symlink to the native Python so that scripts can just invoke
> +        # "nativepython" and get the right one without needing absolute paths
> +        # (these often end up too long for the #! parser in the kernel as the
> +        # buffer is 128 bytes long).
> +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +}
> +
> +python(){
> +
> +    # Read JSON manifest
> +    import json
> +    pythondir = d.getVar('THISDIR',True)
> +    with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
> +        python_manifest=json.load(manifest_file)
> +
> +    rprovides = d.getVar('RPROVIDES').split()
> +
> +    # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
> +    pn = 'python3'
> +
> +    for key in python_manifest:
> +        pypackage = pn + '-' + key + '-native'
> +        if pypackage not in rprovides:
> +              rprovides.append(pypackage)
> +
> +    d.setVar('RPROVIDES', ' '.join(rprovides))
> +}
> diff --git a/meta/recipes-devtools/python/python3.inc b/meta/recipes-devtools/python/python3.inc
> new file mode 100644
> index 0000000000..45914b66ca
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3.inc
> @@ -0,0 +1,74 @@
> +SUMMARY = "The Python Programming Language"
> +HOMEPAGE = "http://www.python.org"
> +LICENSE = "PSFv2"
> +SECTION = "devel/python"
> +# bump this on every change in contrib/python/generate-manifest-2.7.py
> +INC_PR = "r1"
> +
> +PR = "${INC_PR}.0"
> +PYTHON_MAJMIN = "3.7"
> +DISTRO_SRC_URI ?= "file://sitecustomize.py"
> +DISTRO_SRC_URI_linuxstdbase = ""
> +SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> +    file://python-config.patch \
> +    file://python-3.3-multilib.patch \
> +    file://03-fix-tkinter-detection.patch \
> +    file://avoid_warning_about_tkinter.patch \
> +    file://unixccompiler.patch \
> +    file://sysroot-include-headers.patch \
> +    file://shutil-follow-symlink-fix.patch \
> +    file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> +    file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> +    file://0001-cross-compile-support.patch \
> +    file://030-fixup-include-dirs.patch \
> +    file://070-dont-clean-ipkg-install.patch \
> +    file://080-distutils-dont_adjust_files.patch \
> +    file://130-readline-setup.patch \
> +    file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> +    ${DISTRO_SRC_URI} \
> +    file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> +"
> +
> +SRC_URI[md5sum] = "eb8c2a6b1447d50813c02714af4681f3"
> +SRC_URI[sha256sum] = "0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4126dd1c40a8b3549"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
> +
> +# exclude pre-releases for both python 2.x and 3.x
> +UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> +
> +S = "${WORKDIR}/Python-${PV}"
> +
> +CVE_PRODUCT = "python"
> +
> +inherit autotools pkgconfig python3-dir
> +
> +EXTRA_OECONF = "\
> +  --with-pymalloc \
> +  --without-cxx-main \
> +  --enable-shared \
> +  --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
> +  ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no \
> +  ${PYTHONLSBOPTS} \
> +"
> +
> +do_configure_prepend() {
> +	libdirleaf="$(echo ${libdir} | sed -e 's:${prefix}/::')"
> +	sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
> +		${S}/configure.ac
> +}
> +
> +do_install_prepend() {
> +	MAKESETTINGS="$(egrep '^(ABIFLAGS|MULTIARCH)=' ${B}/Makefile | sed -E -e 's/[[:space:]]//g' -e 's/=/="/' -e 's/$/"/')"
> +	eval ${MAKESETTINGS}
> +	if test "${ABIFLAGS}" != "${PYTHON_ABI}"; then
> +	    die "do_install: configure determined ABIFLAGS '${ABIFLAGS}' != '${PYTHON_ABI}' from python3-dir.bbclass"
> +	fi
> +	_PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
> +}
> +
> +do_install_append () {
> +	sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
> +		-e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
> +		${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py
> +}
> diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> index 8ea3f03fe0..aac34533ef 100644
> --- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> +++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> @@ -14,25 +14,22 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>    1 file changed, 3 insertions(+), 6 deletions(-)
>   
>   diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 236f005..5c4337f 100644
> +index 31b4bcabb3..7da6d6941e 100644
>   --- a/Makefile.pre.in
>   +++ b/Makefile.pre.in
> -@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
> +@@ -1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
>    	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
> - 	# Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
> + 	@ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
>    	LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
> --	# On Darwin, always use the python version of the script, the shell
> --	# version doesn't use the compiler customizations that are provided
> --	# in python (_osx_support.py).
> --	if test `uname -s` = Darwin; then \
> +-	@ # On Darwin, always use the python version of the script, the shell
> +-	@ # version doesn't use the compiler customizations that are provided
> +-	@ # in python (_osx_support.py).
> +-	@if test `uname -s` = Darwin; then \
>   -		cp python-config.py python-config; \
>   -	fi
> -+	# In OpenEmbedded, always use the python version of the script, the shell
> -+	# version is broken in multiple ways, and doesn't return correct directories
> ++	@ # In OpenEmbedded, always use the python version of the script, the shell
> ++	@ # version is broken in multiple ways, and doesn't return correct directories
>   +	cp python-config.py python-config
>    
>    
>    # Install the include files
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> deleted file mode 100644
> index d1c92e9eed..0000000000
> --- a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001
> -From: Libin Dang <libin.dang@windriver.com>
> -Date: Tue, 11 Apr 2017 14:12:15 +0800
> -Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
> - distutils.sysconfig
> -
> -Backport upstream commit
> -https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - Lib/distutils/sysconfig.py | 35 ++++-------------------------------
> - 1 file changed, 4 insertions(+), 31 deletions(-)
> -
> -diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> -index 6d5cfd0..9925d24 100644
> ---- a/Lib/distutils/sysconfig.py
> -+++ b/Lib/distutils/sysconfig.py
> -@@ -424,38 +424,11 @@ _config_vars = None
> -
> - def _init_posix():
> -     """Initialize the module as appropriate for POSIX systems."""
> --    g = {}
> --    # load the installed Makefile:
> --    try:
> --        filename = get_makefile_filename()
> --        parse_makefile(filename, g)
> --    except OSError as msg:
> --        my_msg = "invalid Python installation: unable to open %s" % filename
> --        if hasattr(msg, "strerror"):
> --            my_msg = my_msg + " (%s)" % msg.strerror
> --
> --        raise DistutilsPlatformError(my_msg)
> --
> --    # load the installed pyconfig.h:
> --    try:
> --        filename = get_config_h_filename()
> --        with open(filename) as file:
> --            parse_config_h(file, g)
> --    except OSError as msg:
> --        my_msg = "invalid Python installation: unable to open %s" % filename
> --        if hasattr(msg, "strerror"):
> --            my_msg = my_msg + " (%s)" % msg.strerror
> --
> --        raise DistutilsPlatformError(my_msg)
> --
> --    # On AIX, there are wrong paths to the linker scripts in the Makefile
> --    # -- these paths are relative to the Python source, but when installed
> --    # the scripts are in another directory.
> --    if python_build:
> --        g['LDSHARED'] = g['BLDSHARED']
> --
> -+    # _sysconfigdata is generated at build time, see the sysconfig module
> -+    from _sysconfigdata import build_time_vars
> -     global _config_vars
> --    _config_vars = g
> -+    _config_vars = {}
> -+    _config_vars.update(build_time_vars)
> -
> -
> - def _init_nt():
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
> index 7cd7e3b490..a87b86015b 100644
> --- a/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
> +++ b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
> @@ -1,4 +1,4 @@
> -From ecde3ea170999a9ef734e8af4d7c25be5ba81697 Mon Sep 17 00:00:00 2001
> +From 6ad4d2101b5d67bb2de166829879a5b1a0f1c18f Mon Sep 17 00:00:00 2001
>   From: Alexander Kanavin <alex.kanavin@gmail.com>
>   Date: Fri, 31 Mar 2017 15:42:46 +0300
>   Subject: [PATCH] cross-compile support
> @@ -8,7 +8,7 @@ python instead of in-tree tools
>   
>   -Khem
>   
> -Rebased on 3.5.4
> +Rebased on 3.7.0
>   
>   Upstream-Status: Inappropriate[Configuration Specific]
>   Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> @@ -18,53 +18,53 @@ Signed-off-by: Derek Straka <derek@asterius.io>
>    1 file changed, 8 insertions(+), 6 deletions(-)
>   
>   diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 144c1f8629..f252ac2417 100644
> +index d60d48e5f9..31b4bcabb3 100644
>   --- a/Makefile.pre.in
>   +++ b/Makefile.pre.in
> -@@ -223,6 +223,7 @@ LIBOBJS=	@LIBOBJS@
> -
> +@@ -233,6 +233,7 @@ LIBOBJS=	@LIBOBJS@
> +
>    PYTHON=		python$(EXE)
>    BUILDPYTHON=	python$(BUILDEXE)
>   +HOSTPYTHON=    $(BUILDPYTHON)
> -
> +
>    PYTHON_FOR_REGEN=@PYTHON_FOR_REGEN@
> - PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
> -@@ -277,6 +278,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
> + UPDATE_FILE=@PYTHON_FOR_REGEN@ $(srcdir)/Tools/scripts/update_file.py
> +@@ -285,6 +286,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
>    ##########################################################################
>    # Parser
>    PGEN=		Parser/pgen$(EXE)
>   +HOSTPGEN=	$(PGEN)$(EXE)
> -
> - PSRCS=		\
> - 		Parser/acceler.c \
> -@@ -478,7 +480,7 @@ build_all_generate_profile:
> -
> +
> + POBJS=		\
> + 		Parser/acceler.o \
> +@@ -501,7 +503,7 @@ build_all_generate_profile:
> +
>    run_profile_task:
> - 	: # FIXME: can't run for a cross build
> + 	@ # FIXME: can't run for a cross build
>   -	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
>   +	$(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true
> -
> +
>    build_all_merge_profile:
>    	$(LLVM_PROF_MERGER)
> -@@ -772,7 +774,7 @@ regen-grammar: $(PGEN)
> +@@ -796,7 +798,7 @@ regen-grammar: $(PGEN)
>    	# Regenerate Include/graminit.h and Python/graminit.c
>    	# from Grammar/Grammar using pgen
>    	@$(MKDIR_P) Include
>   -	$(PGEN) $(srcdir)/Grammar/Grammar \
>   +	$(HOSTPGEN) $(srcdir)/Grammar/Grammar \
> - 		$(srcdir)/Include/graminit.h \
> - 		$(srcdir)/Python/graminit.c
> -
> -@@ -978,7 +980,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTHON_HEADERS)
> + 		$(srcdir)/Include/graminit.h.new \
> + 		$(srcdir)/Python/graminit.c.new
> + 	$(UPDATE_FILE) $(srcdir)/Include/graminit.h $(srcdir)/Include/graminit.h.new
> +@@ -1034,7 +1036,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTHON_HEADERS)
>    ######################################################################
> -
> +
>    TESTOPTS=	$(EXTRATESTOPTS)
>   -TESTPYTHON=	$(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
>   +TESTPYTHON=	$(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
>    TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
> - TESTTIMEOUT=	3600
> -
> -@@ -1470,7 +1472,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
> + TESTTIMEOUT=	1200
> +
> +@@ -1536,7 +1538,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
>    		fi; \
>    	done
>    	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
> @@ -73,24 +73,24 @@ index 144c1f8629..f252ac2417 100644
>    	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
>    	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
>    	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
> -@@ -1543,7 +1545,7 @@ Python/dtoa.o: Python/dtoa.c
> -
> +@@ -1609,7 +1611,7 @@ Python/dtoa.o: Python/dtoa.c
> +
>    # Run reindent on the library
>    reindent:
>   -	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
>   +	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
> -
> +
>    # Rerun configure with the same options as it was run last time,
>    # provided the config.status script exists
> -@@ -1678,7 +1680,7 @@ funny:
> -
> +@@ -1744,7 +1746,7 @@ funny:
> +
>    # Perform some verification checks on any modified files.
>    patchcheck: @DEF_MAKE_RULE@
>   -	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
>   +	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> -
> +
>    # Dependencies
> -
> ---
> -2.11.0
> +
> +--
> +2.17.1


This patch was just added, please state a reason on why you're deleting it.


>   
> diff --git a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
> deleted file mode 100644
> index bb01c5bcb4..0000000000
> --- a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 2001
> -From: Anuj Mittal <anuj.mittal@intel.com>
> -Date: Tue, 7 Aug 2018 16:43:17 +0800
> -Subject: [PATCH 2/2] Makefile: add target to split profile generation
> -
> -We don't want to have profile task invoked from here and want to use
> -qemu-user instead. Split the profile-opt task so qemu can be invoked
> -once binaries have been built with instrumentation and then we can go
> -ahead and build again using the profile data generated.
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - Makefile.pre.in | 6 ++----
> - 1 file changed, 2 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 84bc3ff..017a2c4 100644
> ---- a/Makefile.pre.in
> -+++ b/Makefile.pre.in
> -@@ -469,13 +469,11 @@ profile-opt:
> - 	$(MAKE) profile-removal
> - 	$(MAKE) build_all_generate_profile
> - 	$(MAKE) profile-removal
> --	@echo "Running code to generate profile data (this can take a while):"
> --	$(MAKE) run_profile_task
> --	$(MAKE) build_all_merge_profile
> -+
> -+clean_and_use_profile:
> - 	@echo "Rebuilding with profile guided optimizations:"
> - 	$(MAKE) clean
> - 	$(MAKE) build_all_use_profile
> --	$(MAKE) profile-removal
> -
> - build_all_generate_profile:
> - 	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> index fddfd2b2f6..b916d04d05 100644
> --- a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> +++ b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
> @@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [embedded specific]
>   # will not be found.
>   # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
>   
> -Index: Python-3.3.0rc2/setup.py
> -===================================================================
> ---- Python-3.3.0rc2.orig/setup.py	2012-09-20 15:24:14.009124003 -0700
> -+++ Python-3.3.0rc2/setup.py	2012-09-20 15:25:08.449124963 -0700
> -@@ -1620,7 +1620,7 @@
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..7f0e4d1010 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1803,7 +1803,7 @@ class PyBuildExt(build_ext):
>                    dotversion = dotversion[:-1] + '.' + dotversion[-1]
>                tcl_include_sub = []
>                tk_include_sub = []
> @@ -17,7 +17,7 @@ Index: Python-3.3.0rc2/setup.py
>                    tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
>                    tk_include_sub += [dir + os.sep + "tk" + dotversion]
>                tk_include_sub += tcl_include_sub
> -@@ -1639,22 +1639,6 @@
> +@@ -1822,22 +1822,6 @@ class PyBuildExt(build_ext):
>                if dir not in include_dirs:
>                    include_dirs.append(dir)
>    
> diff --git a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> index 6beac7b805..c12f11c6e7 100644
> --- a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> +++ b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
> @@ -22,12 +22,3 @@ Index: Python-3.3.2/setup.py
>    
>            # Add paths specified in the environment variables LDFLAGS and
>            # CPPFLAGS for header and library files.
> -@@ -480,7 +481,7 @@ class PyBuildExt(build_ext):
> -                     for directory in reversed(options.dirs):
> -                         add_dir_to_list(dir_list, directory)
> -
> --        if os.path.normpath(sys.base_prefix) != '/usr' \
> -+        if not cross_compiling and os.path.normpath(sys.base_prefix) != '/usr' \
> -                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
> -             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
> -             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
> diff --git a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
> index b96419a638..1bd6e56117 100644
> --- a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
> +++ b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
> @@ -14,11 +14,11 @@ Upstream-Status: Inappropriate [Embedded-Specific]
>    
>    
>        def copy_scripts(self):
> --        """Copy each script listed in 'self.scripts'; if it's marked as a
> +-        r"""Copy each script listed in 'self.scripts'; if it's marked as a
>   -        Python script in the Unix way (first line matches 'first_line_re',
>   -        ie. starts with "\#!" and contains "python"), then adjust the first
>   -        line to refer to the current Python interpreter as we copy.
> -+        """Copy each script listed in 'self.scripts'
> ++        r"""Copy each script listed in 'self.scripts'
>            """
>            self.mkpath(self.build_dir)
>            outfiles = []
> diff --git a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
> deleted file mode 100644
> index 78d7c78670..0000000000
> --- a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Fix warning with newer compiler
> -
> --Khem
> -
> -Upstream-Status: Pending
> -
> ---- a/Modules/_cursesmodule.c
> -+++ b/Modules/_cursesmodule.c
> -@@ -116,7 +116,7 @@ char *PyCursesVersion = "2.2";
> -     #defines many common symbols (such as "lines") which breaks the
> -     curses module in other ways.  So the code will just specify
> -     explicit prototypes here. */
> --extern int setupterm(char *,int,int *);
> -+//extern int setupterm(char *,int,int *);
> - #ifdef __sgi
> - #include <term.h>
> - #endif
> diff --git a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
> index ae74ef531d..35b849e399 100644
> --- a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
> +++ b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
> @@ -9,6 +9,11 @@ profile-optimized build.
>   
>   Upstream-Status: Pending
>   
> +2018-08:
> +  * Rebased Makefile.pre.in for 3.7
> +  * Remove patch for setup.py in favor of upstream fix
> +  -- Jens
> +
>   Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>   ---
>    Makefile.pre.in | 4 ++--
> @@ -16,41 +21,31 @@ Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>    2 files changed, 4 insertions(+), 3 deletions(-)
>   
>   diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index e2d5d3d..84bc3ff 100644
> +index 4c23c0e411..0871c98f29 100644
>   --- a/Makefile.pre.in
>   +++ b/Makefile.pre.in
> -@@ -478,7 +478,7 @@ profile-opt:
> - 	$(MAKE) profile-removal
> +@@ -497,6 +497,7 @@ profile-run-stamp:
>    
>    build_all_generate_profile:
> --	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
> -+	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
> + 	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_GEN_FLAG)" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
> ++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG)" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
>    
>    run_profile_task:
> - 	: # FIXME: can't run for a cross build
> -@@ -488,7 +488,7 @@ build_all_merge_profile:
> - 	$(LLVM_PROF_MERGER)
> -
> - build_all_use_profile:
> --	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
> -+	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
> + 	@ # FIXME: can't run for a cross build
> +@@ -510,14 +511,14 @@ build_all_merge_profile:
> + profile-opt: profile-run-stamp
> + 	@echo "Rebuilding with profile guided optimizations:"
> + 	-rm -f profile-clean-stamp
> +-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_USE_FLAG)" LDFLAGS="$(LDFLAGS)"
> ++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG)" LDFLAGS="$(LDFLAGS)"
>    
>    # Compile and run with gcov
>    .PHONY=coverage coverage-lcov coverage-report
> -diff --git a/setup.py b/setup.py
> -index add3346..65e83b1 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -263,7 +263,8 @@ class PyBuildExt(build_ext):
> -         # compilers
> -         if compiler is not None:
> -             if cross_compiling:
> --                (ccshared,cflags) = (os.environ.get('CCSHARED') or '', os.environ.get('CFLAGS') or '')
> -+                (ccshared,cflags) = (os.environ.get('CCSHARED') or '',
> -+                                     (os.environ.get('CFLAGS') or '') + ' ' + sysconfig.get_config_var('PY_CFLAGS_NODIST'))
> -             else:
> -                 (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
> -             args['compiler_so'] = compiler + ' ' + ccshared + ' ' + cflags
> ---
> -2.17.1
> -
> + coverage:
> + 	@echo "Building with support for coverage checking:"
> + 	$(MAKE) clean profile-removal
> +-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS="$(CFLAGS) -O0 -pg -fprofile-arcs -ftest-coverage" LIBS="$(LIBS) -lgcov"
> ++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS="$(CFLAGS) $(EXTRA_CFLAGS) -O0 -pg -fprofile-arcs -ftest-coverage" LIBS="$(LIBS) -lgcov"
> +
> + coverage-lcov:
> + 	@echo "Creating Coverage HTML report with LCOV:"
> diff --git a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> index f29ae53371..7e1dc4ef5b 100644
> --- a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> +++ b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
> @@ -6,16 +6,16 @@ hardcoded locations for include paths
>   
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
> -Index: Python-3.4.2/configure.ac
> -===================================================================
> ---- Python-3.4.2.orig/configure.ac
> -+++ Python-3.4.2/configure.ac
> -@@ -4434,7 +4434,7 @@ fi
> -
> +diff --git a/configure.ac b/configure.ac
> +index 2b8aa4d592..1f5bf4b4b0 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -4976,7 +4976,7 @@ fi
>    # first curses header check
>    ac_save_cppflags="$CPPFLAGS"
> --CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
> -+CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
> + if test "$cross_compiling" = no; then
> +-  CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
> ++  CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
> + fi
>    
>    AC_CHECK_HEADERS(curses.h ncurses.h)
> -
> diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> index a3cc48c9a4..ebdd64b7b5 100644
> --- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> +++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> @@ -5,13 +5,17 @@ Avoid a warning by not adding this module to missing variable.
>   Upstream-Status: Inappropriate [distribution]
>   
>   Also simply disable the tk module since its not in DEPENDS.
> +
> +2018-08: Rebased for 3.7.0
> +  -- Jens
> +
>   Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>   
> -Index: Python-3.5.3/setup.py
> -===================================================================
> ---- Python-3.5.3.orig/setup.py
> -+++ Python-3.5.3/setup.py
> -@@ -1558,10 +1558,12 @@ class PyBuildExt(build_ext):
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..0321245761 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1608,10 +1608,12 @@ class PyBuildExt(build_ext):
>            self.extensions.extend(exts)
>    
>            # Call the method for detecting whether _tkinter can be compiled
> @@ -25,5 +29,5 @@ Index: Python-3.5.3/setup.py
>   +        #if '_tkinter' not in [e.name for e in self.extensions]:
>   +        #    missing.append('_tkinter')
>    
> - ##         # Uncomment these lines if you want to play with xxmodule.c
> - ##         ext = Extension('xx', ['xxmodule.c'])
> +         # Build the _uuid module if possible
> +         uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
> diff --git a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> index 97214f9aa4..689baf00ad 100644
> --- a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> +++ b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
> @@ -7,24 +7,27 @@ Use LIBDIR rather than prefix/lib, so that it would work when lib64.
>   
>   Upstream-Status: Pending
>   
> +2018-08: rebased and adopted for 3.7
> +  -- Jens
> +
>   Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>   ---
>    configure.ac |    2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 63aef8e..aefb27f 100644
> +index 2b8aa4d592..0da15fbbdf 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -4366,7 +4366,7 @@ AC_MSG_RESULT($LDVERSION)
> -
> +@@ -4674,9 +4674,9 @@ AC_MSG_RESULT($LDVERSION)
>    dnl define LIBPL after ABIFLAGS and LDVERSION is defined.
>    AC_SUBST(PY_ENABLE_SHARED)
> --LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> -+LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> + if test x$PLATFORM_TRIPLET = x; then
> +-  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
> ++  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
> + else
> +-  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
> ++  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
> + fi
>    AC_SUBST(LIBPL)
>    
> - # Check whether right shifting a negative integer extends the sign bit
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
> index 5c3af6b626..1ce4defe95 100644
> --- a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
> +++ b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
> @@ -47,16 +47,19 @@ And the semaphore issue also caused multiprocessing.Queue().put() hung.
>   
>   Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999]
>   
> +2018-08: rebased for 3.7
> +  -- Jens
> +
>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   ---
>    setup.py | 7 +++++--
>    1 file changed, 5 insertions(+), 2 deletions(-)
>   
>   diff --git a/setup.py b/setup.py
> -index 4f0f522..d05707d 100644
> +index a97a7559ca..633eba8f1e 100644
>   --- a/setup.py
>   +++ b/setup.py
> -@@ -1606,8 +1606,10 @@ class PyBuildExt(build_ext):
> +@@ -1580,8 +1580,10 @@ class PyBuildExt(build_ext):
>            elif host_platform.startswith('netbsd'):
>                macros = dict()
>                libraries = []
> @@ -69,14 +72,11 @@ index 4f0f522..d05707d 100644
>                macros = dict()
>                libraries = ['rt']
>    
> -@@ -1626,6 +1628,7 @@ class PyBuildExt(build_ext):
> -         if sysconfig.get_config_var('WITH_THREAD'):
> -             exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
> -                                     define_macros=list(macros.items()),
> -+                                    libraries=libraries,
> -                                     include_dirs=["Modules/_multiprocessing"]))
> -         else:
> -             missing.append('_multiprocessing')
> ---
> -2.7.4
> -
> +@@ -1599,6 +1601,7 @@ class PyBuildExt(build_ext):
> +
> +         exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
> +                                 define_macros=list(macros.items()),
> ++                                libraries=libraries,
> +                                 include_dirs=["Modules/_multiprocessing"]))
> +         # End multiprocessing
> +
> diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> index cc35dc1617..d5bafbfba1 100644
> --- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> +++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> @@ -4,7 +4,7 @@ Date: Tue, 14 May 2013 15:00:26 -0700
>   Subject: [PATCH 01/13] get the sys.lib from python itself and do not use
>    hardcoded value of 'lib'
>   
> -02/2015 Rebased for 3.4.2
> +08/2018 Rebased for 3.7.0
>   
>   Upstream-Status: Pending
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> @@ -25,12 +25,12 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>    setup.py                         |  9 ++++-----
>    12 files changed, 97 insertions(+), 23 deletions(-)
>   
> -Index: Python-3.5.4/Include/pythonrun.h
> -===================================================================
> ---- Python-3.5.4.orig/Include/pythonrun.h
> -+++ Python-3.5.4/Include/pythonrun.h
> -@@ -23,6 +23,9 @@ typedef struct {
> - } PyCompilerFlags;
> +diff --git a/Include/pythonrun.h b/Include/pythonrun.h
> +index 6f0c6fc655..95a597b412 100644
> +--- a/Include/pythonrun.h
> ++++ b/Include/pythonrun.h
> +@@ -7,6 +7,9 @@
> + extern "C" {
>    #endif
>    
>   +PyAPI_FUNC(const char *) Py_GetArch(void);
> @@ -39,10 +39,10 @@ Index: Python-3.5.4/Include/pythonrun.h
>    #ifndef Py_LIMITED_API
>    PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
>    PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags *);
> -Index: Python-3.5.4/Lib/distutils/command/install.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/distutils/command/install.py
> -+++ Python-3.5.4/Lib/distutils/command/install.py
> +diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/install.py
> +index 0258d3deae..352fd8f792 100644
> +--- a/Lib/distutils/command/install.py
> ++++ b/Lib/distutils/command/install.py
>   @@ -19,6 +19,8 @@ from site import USER_BASE
>    from site import USER_SITE
>    HAS_USER_SITE = True
> @@ -63,11 +63,11 @@ Index: Python-3.5.4/Lib/distutils/command/install.py
>            'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
>            'scripts': '$base/bin',
>            'data'   : '$base',
> -Index: Python-3.5.4/Lib/pydoc.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/pydoc.py
> -+++ Python-3.5.4/Lib/pydoc.py
> -@@ -389,7 +389,7 @@ class Doc:
> +diff --git a/Lib/pydoc.py b/Lib/pydoc.py
> +index 8a6b27b16e..fc55893b18 100644
> +--- a/Lib/pydoc.py
> ++++ b/Lib/pydoc.py
> +@@ -399,7 +399,7 @@ class Doc:
>        docmodule = docclass = docroutine = docother = docproperty = docdata = fail
>    
>        def getdocloc(self, object,
> @@ -76,29 +76,30 @@ Index: Python-3.5.4/Lib/pydoc.py
>                                           "python%d.%d" %  sys.version_info[:2])):
>            """Return the location of module docs or None"""
>    
> -Index: Python-3.5.4/Lib/site.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/site.py
> -+++ Python-3.5.4/Lib/site.py
> -@@ -303,12 +303,12 @@ def getsitepackages(prefixes=None):
> +diff --git a/Lib/site.py b/Lib/site.py
> +index ffd132b389..3ca8270d49 100644
> +--- a/Lib/site.py
> ++++ b/Lib/site.py
> +@@ -334,12 +334,12 @@ def getsitepackages(prefixes=None):
>            seen.add(prefix)
>    
>            if os.sep == '/':
>   -            sitepackages.append(os.path.join(prefix, "lib",
> +-                                        "python%d.%d" % sys.version_info[:2],
>   +            sitepackages.append(os.path.join(prefix, sys.lib,
> -                                         "python" + sys.version[:3],
> ++                                        "python%d.%d" % sys.version_info[:2],
>                                            "site-packages"))
>            else:
>                sitepackages.append(prefix)
>   -            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
>   +            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
> -         if sys.platform == "darwin":
> -             # for framework builds *only* we add the standard Apple
> -             # locations.
> -Index: Python-3.5.4/Lib/sysconfig.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/sysconfig.py
> -+++ Python-3.5.4/Lib/sysconfig.py
> +     return sitepackages
> +
> + def addsitepackages(known_paths, prefixes=None):
> +diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> +index e0f9c18531..9869363977 100644
> +--- a/Lib/sysconfig.py
> ++++ b/Lib/sysconfig.py
>   @@ -20,10 +20,10 @@ __all__ = [
>    
>    _INSTALL_SCHEMES = {
> @@ -129,7 +130,7 @@ Index: Python-3.5.4/Lib/sysconfig.py
>            'include': '{installed_base}/include/python',
>            'platinclude': '{installed_base}/include/python',
>            'scripts': '{base}/bin',
> -@@ -61,10 +61,10 @@ _INSTALL_SCHEMES = {
> +@@ -62,10 +62,10 @@ _INSTALL_SCHEMES = {
>            'data': '{userbase}',
>            },
>        'posix_user': {
> @@ -144,28 +145,24 @@ Index: Python-3.5.4/Lib/sysconfig.py
>            'include': '{userbase}/include/python{py_version_short}',
>            'scripts': '{userbase}/bin',
>            'data': '{userbase}',
> -Index: Python-3.5.4/Lib/trace.py
> -===================================================================
> ---- Python-3.5.4.orig/Lib/trace.py
> -+++ Python-3.5.4/Lib/trace.py
> -@@ -749,10 +749,10 @@ def main(argv=None):
> -                 # should I also call expanduser? (after all, could use $HOME)
> +diff --git a/Lib/trace.py b/Lib/trace.py
> +index 86b2101763..f3c32ec317 100755
> +--- a/Lib/trace.py
> ++++ b/Lib/trace.py
> +@@ -659,7 +659,7 @@ def main():
> +     opts = parser.parse_args()
> +
> +     if opts.ignore_dir:
> +-        rel_path = 'lib', 'python{0.major}.{0.minor}'.format(sys.version_info)
> ++        rel_path = sys.lib, 'python{0.major}.{0.minor}'.format(sys.version_info)
> +         _prefix = os.path.join(sys.base_prefix, *rel_path)
> +         _exec_prefix = os.path.join(sys.base_exec_prefix, *rel_path)
>    
> -                 s = s.replace("$prefix",
> --                              os.path.join(sys.base_prefix, "lib",
> -+                              os.path.join(sys.base_prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s = s.replace("$exec_prefix",
> --                              os.path.join(sys.base_exec_prefix, "lib",
> -+                              os.path.join(sys.base_exec_prefix, sys.lib,
> -                                            "python" + sys.version[:3]))
> -                 s = os.path.normpath(s)
> -                 ignore_dirs.append(s)
> -Index: Python-3.5.4/Makefile.pre.in
> -===================================================================
> ---- Python-3.5.4.orig/Makefile.pre.in
> -+++ Python-3.5.4/Makefile.pre.in
> -@@ -109,6 +109,8 @@ CFLAGS_ALIASING=@CFLAGS_ALIASING@
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 31b4bcabb3..713215e57d 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -114,6 +114,8 @@ CFLAGS_ALIASING=@CFLAGS_ALIASING@
>    
>    # Machine-dependent subdirectories
>    MACHDEP=	@MACHDEP@
> @@ -174,7 +171,7 @@ Index: Python-3.5.4/Makefile.pre.in
>    
>    # Multiarch directory (may be empty)
>    MULTIARCH=	@MULTIARCH@
> -@@ -128,7 +130,7 @@ LIBDIR=		@libdir@
> +@@ -134,7 +136,7 @@ LIBDIR=		@libdir@
>    MANDIR=		@mandir@
>    INCLUDEDIR=	@includedir@
>    CONFINCLUDEDIR=	$(exec_prefix)/include
> @@ -183,7 +180,7 @@ Index: Python-3.5.4/Makefile.pre.in
>    ABIFLAGS=	@ABIFLAGS@
>    
>    # Detailed destination directories
> -@@ -731,6 +733,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
> +@@ -754,6 +756,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
>    		-DEXEC_PREFIX='"$(exec_prefix)"' \
>    		-DVERSION='"$(VERSION)"' \
>    		-DVPATH='"$(VPATH)"' \
> @@ -191,8 +188,8 @@ Index: Python-3.5.4/Makefile.pre.in
>    		-o $@ $(srcdir)/Modules/getpath.c
>    
>    Programs/python.o: $(srcdir)/Programs/python.c
> -@@ -813,7 +816,7 @@ regen-opcode:
> - Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
> +@@ -842,7 +845,7 @@ regen-opcode:
> + Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
>    
>    Python/getplatform.o: $(srcdir)/Python/getplatform.c
>   -		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
> @@ -200,11 +197,11 @@ Index: Python-3.5.4/Makefile.pre.in
>    
>    Python/importdl.o: $(srcdir)/Python/importdl.c
>    		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
> -Index: Python-3.5.4/Modules/getpath.c
> -===================================================================
> ---- Python-3.5.4.orig/Modules/getpath.c
> -+++ Python-3.5.4/Modules/getpath.c
> -@@ -105,6 +105,13 @@
> +diff --git a/Modules/getpath.c b/Modules/getpath.c
> +index 041cb14b4b..d52d1e1cdb 100644
> +--- a/Modules/getpath.c
> ++++ b/Modules/getpath.c
> +@@ -106,6 +106,13 @@ extern "C" {
>    #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
>    #endif
>    
> @@ -218,30 +215,22 @@ Index: Python-3.5.4/Modules/getpath.c
>    #ifndef LANDMARK
>    #define LANDMARK L"os.py"
>    #endif
> -@@ -113,6 +120,7 @@ static wchar_t prefix[MAXPATHLEN+1];
> - static wchar_t exec_prefix[MAXPATHLEN+1];
> - static wchar_t progpath[MAXPATHLEN+1];
> - static wchar_t *module_search_path = NULL;
> -+static wchar_t *lib_python = L"" LIB_PYTHON;
> -
> - /* Get file status. Encode the path to the locale encoding. */
> -
> -@@ -494,7 +502,7 @@ calculate_path(void)
> -     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
> -     _prefix = Py_DecodeLocale(PREFIX, NULL);
> -     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
> --    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
> -+    lib_python = Py_DecodeLocale(LIB_PYTHON, NULL);
> -
> -     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
> -         Py_FatalError(
> -Index: Python-3.5.4/Python/getplatform.c
> -===================================================================
> ---- Python-3.5.4.orig/Python/getplatform.c
> -+++ Python-3.5.4/Python/getplatform.c
> +@@ -867,7 +874,7 @@ calculate_init(PyCalculatePath *calculate,
> +     if (!calculate->prefix) {
> +         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> +     }
> +-    calculate->lib_python = Py_DecodeLocale("lib/python" VERSION, &len);
> ++    calculate->lib_python = Py_DecodeLocale(LIB_PYTHON, &len);
> +     if (!calculate->lib_python) {
> +         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
> +     }
> +diff --git a/Python/getplatform.c b/Python/getplatform.c
> +index 81a0f7ac53..bc7127ae3e 100644
> +--- a/Python/getplatform.c
> ++++ b/Python/getplatform.c
>   @@ -10,3 +10,23 @@ Py_GetPlatform(void)
>    {
> - 	return PLATFORM;
> +     return PLATFORM;
>    }
>   +
>   +#ifndef ARCH
> @@ -263,11 +252,11 @@ Index: Python-3.5.4/Python/getplatform.c
>   +{
>   +	return LIB;
>   +}
> -Index: Python-3.5.4/Python/sysmodule.c
> -===================================================================
> ---- Python-3.5.4.orig/Python/sysmodule.c
> -+++ Python-3.5.4/Python/sysmodule.c
> -@@ -1827,6 +1827,10 @@ _PySys_Init(void)
> +diff --git a/Python/sysmodule.c b/Python/sysmodule.c
> +index 177b830762..38112b831e 100644
> +--- a/Python/sysmodule.c
> ++++ b/Python/sysmodule.c
> +@@ -2324,6 +2324,10 @@ _PySys_BeginInit(PyObject **sysmod)
>                            PyUnicode_FromString(Py_GetCopyright()));
>        SET_SYS_FROM_STRING("platform",
>                            PyUnicode_FromString(Py_GetPlatform()));
> @@ -275,16 +264,16 @@ Index: Python-3.5.4/Python/sysmodule.c
>   +                        PyUnicode_FromString(Py_GetArch()));
>   +    SET_SYS_FROM_STRING("lib",
>   +                        PyUnicode_FromString(Py_GetLib()));
> -     SET_SYS_FROM_STRING("executable",
> -                         PyUnicode_FromWideChar(
> -                                Py_GetProgramFullPath(), -1));
> -Index: Python-3.5.4/configure.ac
> -===================================================================
> ---- Python-3.5.4.orig/configure.ac
> -+++ Python-3.5.4/configure.ac
> -@@ -885,6 +885,41 @@ PLATDIR=plat-$MACHDEP
> - AC_SUBST(PLATDIR)
> - AC_SUBST(PLATFORM_TRIPLET)
> +     SET_SYS_FROM_STRING("maxsize",
> +                         PyLong_FromSsize_t(PY_SSIZE_T_MAX));
> +     SET_SYS_FROM_STRING("float_info",
> +diff --git a/configure.ac b/configure.ac
> +index 5b66624d78..1c88696532 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -867,6 +867,41 @@ AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
> + LDFLAGS="$save_LDFLAGS"
> + AC_SUBST(NO_AS_NEEDED)
>    
>   +AC_SUBST(ARCH)
>   +AC_MSG_CHECKING(ARCH)
> @@ -322,13 +311,13 @@ Index: Python-3.5.4/configure.ac
>   +esac
>   +AC_MSG_RESULT($LIB)
>    
> - AC_MSG_CHECKING([for -Wl,--no-as-needed])
> - save_LDFLAGS="$LDFLAGS"
> -Index: Python-3.5.4/setup.py
> -===================================================================
> ---- Python-3.5.4.orig/setup.py
> -+++ Python-3.5.4/setup.py
> -@@ -494,7 +494,7 @@ class PyBuildExt(build_ext):
> + # checks for UNIX variants that set C preprocessor variables
> + AC_USE_SYSTEM_EXTENSIONS
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..b82b7177bc 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -541,7 +541,7 @@ class PyBuildExt(build_ext):
>            # directories (i.e. '.' and 'Include') must be first.  See issue
>            # 10520.
>            if not cross_compiling:
> @@ -337,17 +326,16 @@ Index: Python-3.5.4/setup.py
>                add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
>            # only change this for cross builds for 3.3, issues on Mageia
>            if cross_compiling:
> -@@ -552,8 +552,7 @@ class PyBuildExt(build_ext):
> -         # be assumed that no additional -I,-L directives are needed.
> -         if not cross_compiling:
> -             lib_dirs = self.compiler.library_dirs + [
> --                '/lib64', '/usr/lib64',
> --                '/lib', '/usr/lib',
> -+                '/' + sys.lib, '/usr/' + sys.lib,
> -                 ]
> -             inc_dirs = self.compiler.include_dirs + ['/usr/include']
> -         else:
> -@@ -745,11 +744,11 @@ class PyBuildExt(build_ext):
> +@@ -579,7 +579,7 @@ class PyBuildExt(build_ext):
> +             add_dir_to_list(self.compiler.include_dirs,
> +                             sysconfig.get_config_var("INCLUDEDIR"))
> +
> +-        system_lib_dirs = ['/lib64', '/usr/lib64', '/lib', '/usr/lib']
> ++        system_lib_dirs = ['/' + sys.lib, '/usr/' + sys.lib]
> +         system_include_dirs = ['/usr/include']
> +         # lib_dirs and inc_dirs are used to search for files;
> +         # if a file is found in one of those directories, it can
> +@@ -836,11 +836,11 @@ class PyBuildExt(build_ext):
>                elif curses_library:
>                    readline_libs.append(curses_library)
>                elif self.compiler.find_library_file(lib_dirs +
> @@ -361,3 +349,26 @@ Index: Python-3.5.4/setup.py
>                                       extra_link_args=readline_extra_link_args,
>                                       libraries=readline_libs) )
>            else:
> +@@ -1054,8 +1054,7 @@ class PyBuildExt(build_ext):
> +
> +                 # check lib directories parallel to the location of the header
> +                 db_dirs_to_check = [
> +-                    db_incdir.replace("include", 'lib64'),
> +-                    db_incdir.replace("include", 'lib'),
> ++                    db_incdir.replace("include", sys.lib),
> +                 ]
> +
> +                 if host_platform != 'darwin':
> +@@ -1166,10 +1165,8 @@ class PyBuildExt(build_ext):
> +
> +         if sqlite_incdir:
> +             sqlite_dirs_to_check = [
> +-                os.path.join(sqlite_incdir, '..', 'lib64'),
> +-                os.path.join(sqlite_incdir, '..', 'lib'),
> +-                os.path.join(sqlite_incdir, '..', '..', 'lib64'),
> +-                os.path.join(sqlite_incdir, '..', '..', 'lib'),
> ++                os.path.join(sqlite_incdir, '..', sys.lib),
> ++                os.path.join(sqlite_incdir, '..', '..', sys.lib),
> +             ]
> +             sqlite_libfile = self.compiler.find_library_file(
> +                                 sqlite_dirs_to_check + lib_dirs, 'sqlite3')
> diff --git a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> index a4f8bd4710..c6aa581b4c 100644
> --- a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> +++ b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
> @@ -5,21 +5,24 @@ Subject: [PATCH] python3 use CROSSPYTHONPATH for PYTHON_FOR_BUILD
>   
>   Upstream-Status: Inappropriate [Cross compile specific]
>   
> +2018-08: Rebased and adopted for 3.7
> +  -- Jens
> +
>   Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>   ---
>    configure.ac | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
> -Index: Python-3.5.4/configure.ac
> -===================================================================
> ---- Python-3.5.4.orig/configure.ac
> -+++ Python-3.5.4/configure.ac
> -@@ -73,7 +73,7 @@ if test "$cross_compiling" = yes; then
> +diff --git a/configure.ac b/configure.ac
> +index 2b8aa4d592..a361436f4f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -75,7 +75,7 @@ if test "$cross_compiling" = yes; then
>    	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
>    	fi
>            AC_MSG_RESULT($interp)
> --	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
> -+	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) '$interp
> +-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$interp
> ++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$interp
>        fi
>    elif test "$cross_compiling" = maybe; then
>        AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
> diff --git a/meta/recipes-devtools/python/python3/regen-all.patch b/meta/recipes-devtools/python/python3/regen-all.patch
> deleted file mode 100644
> index 36b9d9d919..0000000000
> --- a/meta/recipes-devtools/python/python3/regen-all.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -python3-native: run regen-importlib target correctly
> -
> -regen-importlib depends on other regen- targets, so we must be sure to
> -run it after (most of) the others.  In reality, we do not need to run it
> -at all since "make" will invoke it, if necessary.  We do not want to
> -rely on that, though.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> -
> -
> ---- a/Makefile.pre.in
> -+++ b/Makefile.pre.in
> -@@ -709,7 +709,8 @@ regen-importlib: Programs/_freeze_import
> - ############################################################################
> - # Regenerate all generated files
> -
> --regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-grammar regen-ast regen-importlib
> -+regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-grammar regen-ast
> -+	$(MAKE) regen-importlib
> -
> - ############################################################################
> - # Special rules for object files
> diff --git a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
> index 32ecab9fec..058cfdbc2d 100644
> --- a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
> +++ b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
> @@ -36,12 +36,12 @@ The software will still work, but it will not use the .pyc file as it should.
>    3 files changed, 27 insertions(+)
>   
>   diff --git a/Doc/library/py_compile.rst b/Doc/library/py_compile.rst
> -index 0af8fb1..841f3e8 100644
> +index d720e01050..c8cc738f3d 100644
>   --- a/Doc/library/py_compile.rst
>   +++ b/Doc/library/py_compile.rst
> -@@ -53,6 +53,10 @@ byte-code cache files in the directory containing the source code.
> -    :func:`compile` function.  The default of ``-1`` selects the optimization
> -    level of the current interpreter.
> +@@ -59,6 +59,10 @@ byte-code cache files in the directory containing the source code.
> +    *invalidation_mode* will be forced to
> +    :attr:`PycInvalidationMode.CHECKED_HASH`.
>    
>   +   If the SOURCE_DATE_EPOCH environment variable is set, the .py file mtime
>   +   and timestamp entry in .pyc file header, will be limited to this value.
> @@ -51,27 +51,27 @@ index 0af8fb1..841f3e8 100644
>          Changed default value of *cfile* to be :PEP:`3147`-compliant.  Previous
>          default was *file* + ``'c'`` (``'o'`` if optimization was enabled).
>   diff --git a/Lib/py_compile.py b/Lib/py_compile.py
> -index 11c5b50..62dcdc7 100644
> +index 16dc0a011f..b7c28e4fdd 100644
>   --- a/Lib/py_compile.py
>   +++ b/Lib/py_compile.py
> -@@ -137,6 +137,10 @@ def compile(file, cfile=None, dfile=None, doraise=False, optimize=-1):
> -     except FileExistsError:
> +@@ -149,6 +149,10 @@ def compile(file, cfile=None, dfile=None, doraise=False, optimize=-1,
>            pass
> -     source_stats = loader.path_stats(file)
> -+    sde = os.environ.get('SOURCE_DATE_EPOCH')
> -+    if sde and source_stats['mtime'] > int(sde):
> -+        source_stats['mtime'] = int(sde)
> -+        os.utime(file, (source_stats['mtime'], source_stats['mtime']))
> -     bytecode = importlib._bootstrap_external._code_to_bytecode(
> +     if invalidation_mode == PycInvalidationMode.TIMESTAMP:
> +         source_stats = loader.path_stats(file)
> ++        sde = os.environ.get('SOURCE_DATE_EPOCH')
> ++        if sde and source_stats['mtime'] > int(sde):
> ++            source_stats['mtime'] = int(sde)
> ++            os.utime(file, (source_stats['mtime'], source_stats['mtime']))
> +         bytecode = importlib._bootstrap_external._code_to_timestamp_pyc(
>                code, source_stats['mtime'], source_stats['size'])
> -     mode = importlib._bootstrap_external._calc_mode(file)
> +     else:
>   diff --git a/Lib/test/test_py_compile.py b/Lib/test/test_py_compile.py
> -index 4a6caa5..3d09963 100644
> +index 8fc0b3308c..1445a14548 100644
>   --- a/Lib/test/test_py_compile.py
>   +++ b/Lib/test/test_py_compile.py
> -@@ -98,6 +98,25 @@ def test_bad_coding(self):
> -         self.assertFalse(os.path.exists(
> -             importlib.util.cache_from_source(bad_coding)))
> +@@ -110,6 +110,25 @@ class PyCompileTests(unittest.TestCase):
> +                 fp.read(), 'test', {})
> +         self.assertEqual(flags, 0b11)
>    
>   +    def test_source_date_epoch(self):
>   +        testtime = 123456789
> diff --git a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> index 785b5567f2..d5983544c4 100644
> --- a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> +++ b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
> @@ -6,26 +6,27 @@ Should fix things like
>   configure:6972: arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 -DNDEBUG -fno-inline -D__SOFTFP__ --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone -c -O2 -pipe -g -feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
>   cc1: warning: include location "/usr/include/ncursesw" is unsafe for cross-compilation [-Wpoison-system-directories]
>   
> +2018-08: Rebased to 3.7.0
> +  -- Jens
>   
>   Signed-off-by: Khem Raj
>   Upstream-Status: Pending
>   
> -
> -Index: Python-3.3.2/setup.py
> -===================================================================
> ---- Python-3.3.2.orig/setup.py	2013-07-30 01:30:48.000000000 -0700
> -+++ Python-3.3.2/setup.py	2013-07-30 01:41:11.697862723 -0700
> -@@ -1210,7 +1210,7 @@
> -         panel_library = 'panel'
> +diff --git a/setup.py b/setup.py
> +index 37c5dd58a6..41e88a152b 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1333,7 +1333,7 @@ class PyBuildExt(build_ext):
>            if curses_library == 'ncursesw':
>                curses_defines.append(('HAVE_NCURSESW', '1'))
> --            curses_includes.append('/usr/include/ncursesw')
> -+            curses_includes.append('=/usr/include/ncursesw')
> +             if not cross_compiling:
> +-                curses_includes.append('/usr/include/ncursesw')
> ++                curses_includes.append('=/usr/include/ncursesw')
>                # Bug 1464056: If _curses.so links with ncursesw,
>                # _curses_panel.so must link with panelw.
>                panel_library = 'panelw'
> -@@ -1819,7 +1819,7 @@
> -         if host_platform == 'darwin':
> +@@ -1968,7 +1968,7 @@ class PyBuildExt(build_ext):
> +                 return
>                # OS X 10.5 comes with libffi.dylib; the include files are
>                # in /usr/include/ffi
>   -            inc_dirs.append('/usr/include/ffi')
> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
> deleted file mode 100644
> index bfe91fb1c7..0000000000
> --- a/meta/recipes-devtools/python/python3_3.5.5.bb
> +++ /dev/null
> @@ -1,346 +0,0 @@
> -require recipes-devtools/python/python.inc
> -
> -DEPENDS = "python3-native libffi bzip2 gdbm openssl \
> -           sqlite3 zlib virtual/libintl xz qemu-native \
> -           qemu-helper-native virtual/crypt"
> -
> -PR = "${INC_PR}.0"
> -PYTHON_MAJMIN = "3.5"
> -PYTHON_BINABI = "${PYTHON_MAJMIN}m"
> -DISTRO_SRC_URI ?= "file://sitecustomize.py"
> -DISTRO_SRC_URI_linuxstdbase = ""
> -SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> -file://python-config.patch \
> -file://0001-cross-compile-support.patch \
> -file://030-fixup-include-dirs.patch \
> -file://070-dont-clean-ipkg-install.patch \
> -file://080-distutils-dont_adjust_files.patch \
> -file://130-readline-setup.patch \
> -file://150-fix-setupterm.patch \
> -file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> -file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
> -${DISTRO_SRC_URI} \
> -"
> -
> -SRC_URI += "\
> -            file://03-fix-tkinter-detection.patch \
> -            file://avoid_warning_about_tkinter.patch \
> -            file://cgi_py.patch \
> -            file://host_include_contamination.patch \
> -            file://python-3.3-multilib.patch \
> -            file://shutil-follow-symlink-fix.patch \
> -            file://sysroot-include-headers.patch \
> -            file://unixccompiler.patch \
> -            file://avoid-ncursesw-include-path.patch \
> -            file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
> -            file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
> -            file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> -            file://configure.ac-fix-LIBPL.patch \
> -            file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
> -            file://pass-missing-libraries-to-Extension-for-mul.patch \
> -            file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
> -            file://0002-Makefile-add-target-to-split-profile-generation.patch \
> -           "
> -SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
> -SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
> -
> -# exclude pre-releases for both python 2.x and 3.x
> -UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> -
> -S = "${WORKDIR}/Python-${PV}"
> -
> -inherit autotools multilib_header python3native pkgconfig update-alternatives qemu
> -
> -MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> -
> -ALTERNATIVE_${PN}-dev = "python-config"
> -ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
> -ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> -
> -CONFIGUREOPTS += " --with-system-ffi "
> -
> -CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
> -                ac_cv_have_lchflags=no \
> -                ac_cv_have_long_long_format=yes \
> -                ac_cv_buggy_getaddrinfo=no \
> -                ac_cv_file__dev_ptmx=yes \
> -                ac_cv_file__dev_ptc=no \
> -"
> -
> -TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
> -SDK_CC_ARCH += "-DNDEBUG -fno-inline"
> -EXTRA_OEMAKE += "CROSS_COMPILE=yes"
> -EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip --enable-optimizations"
> -PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 10"
> -
> -export CROSS_COMPILE = "${TARGET_PREFIX}"
> -export _PYTHON_PROJECT_BASE = "${B}"
> -export _PYTHON_PROJECT_SRC = "${S}"
> -export CCSHARED = "-fPIC"
> -
> -# Fix cross compilation of different modules
> -export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
> -
> -# No ctypes option for python 3
> -PYTHONLSBOPTS = ""
> -
> -PACKAGECONFIG ??= "readline"
> -PACKAGECONFIG[readline] = ",,readline"
> -
> -do_configure_append() {
> -	rm -f ${S}/Makefile.orig
> -	autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
> -}
> -
> -do_compile() {
> -        # regenerate platform specific files, because they depend on system headers
> -        cd ${S}/Lib/plat-linux*
> -        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -                ${S}/Tools/scripts/h2py.py -i '(u_long)' \
> -                ${STAGING_INCDIR}/dlfcn.h \
> -                ${STAGING_INCDIR}/linux/cdrom.h \
> -                ${STAGING_INCDIR}/netinet/in.h \
> -                ${STAGING_INCDIR}/sys/types.h
> -        sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
> -        cd -
> -
> -	# remove any bogus LD_LIBRARY_PATH
> -	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
> -
> -	if [ ! -f Makefile.orig ]; then
> -		install -m 0644 Makefile Makefile.orig
> -	fi
> -	sed -i -e 's,^CONFIGURE_LDFLAGS=.*,CONFIGURE_LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
> -		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
> -		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
> -		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
> -		-e 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
> -		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
> -		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
> -		Makefile
> -	# save copy of it now, because if we do it in do_install and
> -	# then call do_install twice we get Makefile.orig == Makefile.sysroot
> -	install -m 0644 Makefile Makefile.sysroot
> -
> -        oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> -                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -                STAGING_LIBDIR=${STAGING_LIBDIR} \
> -                STAGING_INCDIR=${STAGING_INCDIR} \
> -                STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> -                LIB=${baselib} \
> -                ARCH=${TARGET_ARCH} \
> -                OPT="${CFLAGS}" profile-opt
> -
> -        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
> -                qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
> -                cat > pgo-image-qemuwrapper << EOF
> -#!/bin/sh
> -set -x
> -$qemu_binary "\$@"
> -EOF
> -                chmod +x pgo-image-qemuwrapper
> -                ./pgo-image-qemuwrapper ${B}/python ${PYTHON3_PROFILE_TASK} || true
> -	fi
> -
> -        oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> -                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -                STAGING_LIBDIR=${STAGING_LIBDIR} \
> -                STAGING_INCDIR=${STAGING_INCDIR} \
> -                STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> -                LIB=${baselib} \
> -                ARCH=${TARGET_ARCH} \
> -                OPT="${CFLAGS}" clean_and_use_profile
> -}
> -
> -do_install() {
> -	# make install needs the original Makefile, or otherwise the inclues would
> -	# go to ${D}${STAGING...}/...
> -	install -m 0644 Makefile.orig Makefile
> -
> -	install -d ${D}${libdir}/pkgconfig
> -	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
> -
> -	# rerun the build once again with original makefile this time
> -	# run install in a separate step to avoid compile/install race
> -	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> -		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -		STAGING_LIBDIR=${STAGING_LIBDIR} \
> -		STAGING_INCDIR=${STAGING_INCDIR} \
> -		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> -		LIB=${baselib} \
> -		ARCH=${TARGET_ARCH} \
> -		DESTDIR=${D} LIBDIR=${libdir} build_all_use_profile
> -	
> -	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> -		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> -		STAGING_LIBDIR=${STAGING_LIBDIR} \
> -		STAGING_INCDIR=${STAGING_INCDIR} \
> -		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> -		LIB=${baselib} \
> -		ARCH=${TARGET_ARCH} \
> -		DESTDIR=${D} LIBDIR=${libdir} install
> -
> -	# avoid conflict with 2to3 from Python 2
> -	rm -f ${D}/${bindir}/2to3
> -
> -	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> -	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
> -
> -	if [ -e ${WORKDIR}/sitecustomize.py ]; then
> -		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
> -	fi
> -
> -	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> -}
> -
> -do_install_append_class-nativesdk () {
> -	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
> -}
> -
> -SSTATE_SCAN_FILES += "Makefile"
> -PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
> -
> -py_package_preprocess () {
> -	# copy back the old Makefile to fix target package
> -	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> -	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
> -	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
> -	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> -		-e 's|${DEBUG_PREFIX_MAP}||g' \
> -		-e 's:${HOSTTOOLS_DIR}/::g' \
> -		-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> -		-e 's:${RECIPE_SYSROOT}::g' \
> -		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> -		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
> -		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile \
> -		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
> -		${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> -
> -	# Recompile _sysconfigdata after modifying it
> -	cd ${PKGD}
> -	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py')"
> -	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=1)"
> -	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> -	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=2)"
> -	cd -
> -
> -	mv ${PKGD}/${bindir}/python3.5m-config ${PKGD}/${bindir}/python3.5m-config-${MULTILIB_SUFFIX}
> -}
> -
> -# manual dependency additions
> -RPROVIDES_${PN}-modules = "${PN}"
> -RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
> -RRECOMMENDS_${PN}-crypt = "openssl"
> -RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
> -
> -FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
> -FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> -FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
> -
> -PACKAGES =+ "${PN}-pyvenv"
> -FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
> -
> -# package libpython3
> -PACKAGES =+ "libpython3 libpython3-staticdev"
> -FILES_libpython3 = "${libdir}/libpython*.so.*"
> -FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
> -INSANE_SKIP_${PN}-dev += "dev-elf"
> -
> -# catch all the rest (unsorted)
> -PACKAGES += "${PN}-misc"
> -RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs"
> -RDEPENDS_${PN}-modules += "${PN}-misc"
> -FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
> -
> -# catch manpage
> -PACKAGES += "${PN}-man"
> -FILES_${PN}-man = "${datadir}/man"
> -
> -BBCLASSEXTEND = "nativesdk"
> -
> -RPROVIDES_${PN} += "${PN}-modules"
> -
> -# We want bytecode precompiled .py files (.pyc's) by default
> -# but the user may set it on their own conf
> -INCLUDE_PYCS ?= "1"
> -
> -python(){
> -    import json
> -
> -    filename = os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')
> -    # This python changes the datastore based on the contents of a file, so mark
> -    # that dependency.
> -    bb.parse.mark_dependency(d, filename)
> -
> -    with open(filename) as manifest_file:
> -        python_manifest=json.load(manifest_file)
> -
> -    include_pycs = d.getVar('INCLUDE_PYCS')
> -
> -    packages = d.getVar('PACKAGES').split()
> -    pn = d.getVar('PN')
> -
> -    newpackages=[]
> -    for key in python_manifest:
> -        pypackage= pn + '-' + key
> -
> -        if pypackage not in packages:
> -            # We need to prepend, otherwise python-misc gets everything
> -            # so we use a new variable
> -            newpackages.append(pypackage)
> -
> -        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> -        d.setVar('FILES_' + pypackage, '')
> -        for value in python_manifest[key]['files']:
> -            d.appendVar('FILES_' + pypackage, ' ' + value)
> -
> -    	# Add cached files
> -        if include_pycs == '1':
> -            for value in python_manifest[key]['cached']:
> -                    d.appendVar('FILES_' + pypackage, ' ' + value)
> -
> -        d.setVar('RDEPENDS_' + pypackage, '')
> -        for value in python_manifest[key]['rdepends']:
> -            # Make it work with or without $PN
> -            if '${PN}' in value:
> -                value=value.split('-')[1]
> -            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> -        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
> -
> -    # We need to ensure staticdev packages match for files first so we sort in reverse
> -    newpackages.sort(reverse=True)
> -    # Prepending so to avoid python-misc getting everything
> -    packages = newpackages + packages
> -    d.setVar('PACKAGES', ' '.join(packages))
> -    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> -}
> -
> -# Files needed to create a new manifest
> -SRC_URI += "file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json"
> -
> -do_create_manifest() {
> -    # This task should be run with every new release of Python.
> -    # We must ensure that PACKAGECONFIG enables everything when creating
> -    # a new manifest, this is to base our new manifest on a complete
> -    # native python build, containing all dependencies, otherwise the task
> -    # wont be able to find the required files.
> -    # e.g. BerkeleyDB is an optional build dependency so it may or may not
> -    # be present, we must ensure it is.
> -
> -    cd ${WORKDIR}
> -    # This needs to be executed by python-native and NOT by HOST's python
> -    nativepython3 create_manifest3.py
> -    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
> -}
> -
> -# bitbake python -c create_manifest
> -addtask do_create_manifest
> -
> -# Make sure we have native python ready when we create a new manifest
> -do_create_manifest[depends] += "python3:do_prepare_recipe_sysroot"
> -do_create_manifest[depends] += "python3:do_patch"
> diff --git a/meta/recipes-devtools/python/python3_3.7.0.bb b/meta/recipes-devtools/python/python3_3.7.0.bb
> new file mode 100644
> index 0000000000..adf932606f
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3_3.7.0.bb
> @@ -0,0 +1,309 @@
> +require recipes-devtools/python/python3.inc
> +
> +DEPENDS = "libffi bzip2 gdbm openssl sqlite3 zlib xz \
> +           virtual/libintl virtual/crypt"
> +DEPENDS += "${@["qemu-native qemu-helper-native", ""][(bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 0, 1, d))]}"
> +
> +PYTHON_BINABI = "${PYTHON_MAJMIN}${PYTHON_ABI}"
> +

The upstream source is already on python3.inc, which is set as required, 
and then its added here again.

> +SRC_URI += "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> +    file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
> +    file://cgi_py.patch \
> +    file://host_include_contamination.patch \
> +    file://avoid-ncursesw-include-path.patch \
> +    file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
> +    file://configure.ac-fix-LIBPL.patch \
> +    file://pass-missing-libraries-to-Extension-for-mul.patch \
> +    file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
> +"
> +
> +inherit multilib_header python3native update-alternatives qemu
> +
> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> +
> +ALTERNATIVE_${PN}-dev = "python-config"
> +ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
> +ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
> +
> +CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
> +                ac_cv_have_lchflags=no \
> +                ac_cv_have_long_long_format=yes \
> +                ac_cv_buggy_getaddrinfo=no \
> +                ac_cv_file__dev_ptmx=yes \
> +                ac_cv_file__dev_ptc=no \
> +"
> +
> +TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
> +SDK_CC_ARCH += "-DNDEBUG -fno-inline"
> +EXTRA_OEMAKE += "CROSS_COMPILE=yes"
> +EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip --enable-optimizations"
> +PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 10"
> +
> +export CROSS_COMPILE = "${TARGET_PREFIX}"
> +export _PYTHON_PROJECT_BASE = "${B}"
> +export _PYTHON_PROJECT_SRC = "${S}"
> +export CCSHARED = "-fPIC"
> +
> +# Fix cross compilation of different modules
> +export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
> +
> +# No ctypes option for python 3
> +PYTHONLSBOPTS = ""
> +
> +PACKAGECONFIG ??= "readline"
> +PACKAGECONFIG[readline] = ",,readline"
> +
> +do_compile() {
> +        # regenerate platform specific files, because they depend on system headers
> +        #cd ${S}/Lib/plat-linux*
> +        #include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +        #        ${S}/Tools/scripts/h2py.py -i '(u_long)' \
> +        #        ${STAGING_INCDIR}/dlfcn.h \
> +        #        ${STAGING_INCDIR}/linux/cdrom.h \
> +        #        ${STAGING_INCDIR}/netinet/in.h \
> +        #        ${STAGING_INCDIR}/sys/types.h
> +        #sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
> +        #cd -
> +
> +	# remove any bogus LD_LIBRARY_PATH
> +	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
> +
> +	if [ ! -f Makefile.orig ]; then
> +		install -m 0644 Makefile Makefile.orig
> +	fi
> +	sed -i -e 's,^CONFIGURE_LDFLAGS=.*,CONFIGURE_LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
> +		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
> +		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
> +		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
> +		-e 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
> +		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
> +		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
> +		Makefile
> +
> +        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
> +                qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
> +                cat > ${B}/pgo-image-qemuwrapper << EOF
> +#!/bin/sh
> +set -x
> +$qemu_binary "\$@"
> +EOF
> +                chmod +x ${B}/pgo-image-qemuwrapper
> +                ./pgo-image-qemuwrapper ${B}/python ${PYTHON3_PROFILE_TASK} || true
> +                sed -i -e 's,$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK),'"${B}/pgo-image-qemuwrapper ${B}/python ${PYTHON3_PROFILE_TASK}," \
> +                        Makefile
> +	else
> +                sed -i -e 's,$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK),,' \
> +                        Makefile
> +	fi
> +
> +	# save copy of it now, because if we do it in do_install and
> +	# then call do_install twice we get Makefile.orig == Makefile.sysroot
> +	install -m 0644 Makefile Makefile.sysroot
> +
> +        oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> +                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +                STAGING_LIBDIR=${STAGING_LIBDIR} \
> +                STAGING_INCDIR=${STAGING_INCDIR} \
> +                STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> +                LIB=${baselib} \
> +                ARCH=${TARGET_ARCH} \
> +                OPT="${CFLAGS}" profile-opt
> +}
> +
> +do_install() {
> +	# make install needs the original Makefile, or otherwise the inclues would
> +	# go to ${D}${STAGING...}/...
> +	install -m 0644 Makefile.orig Makefile
> +
> +	install -d ${D}${libdir}/pkgconfig
> +	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
> +
> +	# rerun the build once again with original makefile this time
> +	# run install in a separate step to avoid compile/install race
> +	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> +		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +		STAGING_LIBDIR=${STAGING_LIBDIR} \
> +		STAGING_INCDIR=${STAGING_INCDIR} \
> +		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> +		LIB=${baselib} \
> +		ARCH=${TARGET_ARCH} \
> +		DESTDIR=${D} LIBDIR=${libdir} build_all
> +	
> +	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
> +		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
> +		STAGING_LIBDIR=${STAGING_LIBDIR} \
> +		STAGING_INCDIR=${STAGING_INCDIR} \
> +		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
> +		LIB=${baselib} \
> +		ARCH=${TARGET_ARCH} \
> +		DESTDIR=${D} LIBDIR=${libdir} install
> +
> +	# avoid conflict with 2to3 from Python 2
> +	rm -f ${D}/${bindir}/2to3
> +
> +	set -x
> +        install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> +	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile
> +
> +	if [ -e ${WORKDIR}/sitecustomize.py ]; then
> +		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
> +	fi
> +
> +	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> +}
> +
> +do_install_append_class-nativesdk () {
> +	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
> +}
> +
> +SSTATE_SCAN_FILES += "Makefile"
> +PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
> +
> +py_package_preprocess () {
> +	MAKESETTINGS="$(egrep '^(ABIFLAGS|MULTIARCH)=' ${B}/Makefile | sed -E -e 's/[[:space:]]//g' -e 's/=/="/' -e 's/$/"/')"
> +	eval ${MAKESETTINGS}
> +	if test "${ABIFLAGS}" != "${PYTHON_ABI}"; then
> +	    die "do_install: configure determined ABIFLAGS '${ABIFLAGS}' != '${PYTHON_ABI}' from python3-dir.bbclass"
> +	fi
> +	_PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
> +
> +	# copy back the old Makefile to fix target package
> +	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
> +	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile
> +	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
> +	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> +		-e 's|${DEBUG_PREFIX_MAP}||g' \
> +		-e 's:${HOSTTOOLS_DIR}/::g' \
> +		-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +		-e 's:${RECIPE_SYSROOT}::g' \
> +		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
> +		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
> +		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile \
> +		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py \
> +		${PKGD}/${bindir}/python${PYTHON_BINABI}-config
> +
> +	# Recompile _sysconfigdata after modifying it
> +	cd ${PKGD}
> +	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py')"
> +	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py', optimize=1)"
> +	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py', optimize=2)"
> +	cd -
> +
> +	mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
> +}
> +
> +# manual dependency additions
> +RPROVIDES_${PN}-modules = "${PN}"
> +RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
> +RRECOMMENDS_${PN}-crypt = "openssl"
> +RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
> +
> +FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
> +FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
> +FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
> +
> +PACKAGES =+ "${PN}-pyvenv"
> +FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
> +
> +# package libpython3
> +PACKAGES =+ "libpython3 libpython3-staticdev"
> +FILES_libpython3 = "${libdir}/libpython*.so.*"
> +FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}*/libpython${PYTHON_BINABI}.a"
> +INSANE_SKIP_${PN}-dev += "dev-elf"
> +
> +# catch all the rest (unsorted)
> +PACKAGES += "${PN}-misc"
> +RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs"
> +RDEPENDS_${PN}-modules += "${PN}-misc"
> +FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
> +
> +# catch manpage
> +PACKAGES += "${PN}-man"
> +FILES_${PN}-man = "${datadir}/man"
> +
> +BBCLASSEXTEND = "nativesdk"
> +
> +RPROVIDES_${PN} += "${PN}-modules"
> +
> +# We want bytecode precompiled .py files (.pyc's) by default
> +# but the user may set it on their own conf
> +INCLUDE_PYCS ?= "1"
> +
> +python(){
> +    import json
> +
> +    filename = os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')
> +    # This python changes the datastore based on the contents of a file, so mark
> +    # that dependency.
> +    bb.parse.mark_dependency(d, filename)
> +
> +    with open(filename) as manifest_file:
> +        python_manifest=json.load(manifest_file)
> +
> +    include_pycs = d.getVar('INCLUDE_PYCS')
> +
> +    packages = d.getVar('PACKAGES').split()
> +    pn = d.getVar('PN')
> +
> +    newpackages=[]
> +    for key in python_manifest:
> +        pypackage= pn + '-' + key
> +
> +        if pypackage not in packages:
> +            # We need to prepend, otherwise python-misc gets everything
> +            # so we use a new variable
> +            newpackages.append(pypackage)
> +
> +        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> +        d.setVar('FILES_' + pypackage, '')
> +        for value in python_manifest[key]['files']:
> +            d.appendVar('FILES_' + pypackage, ' ' + value)
> +
> +    	# Add cached files
> +        if include_pycs == '1':
> +            for value in python_manifest[key]['cached']:
> +                    d.appendVar('FILES_' + pypackage, ' ' + value)
> +
> +        d.setVar('RDEPENDS_' + pypackage, '')
> +        for value in python_manifest[key]['rdepends']:
> +            # Make it work with or without $PN
> +            if '${PN}' in value:
> +                value=value.split('-')[1]
> +            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> +        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
> +
> +    # We need to ensure staticdev packages match for files first so we sort in reverse
> +    newpackages.sort(reverse=True)
> +    # Prepending so to avoid python-misc getting everything
> +    packages = newpackages + packages
> +    d.setVar('PACKAGES', ' '.join(packages))
> +    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> +}
> +
> +# Files needed to create a new manifest
> +SRC_URI += "file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json"
> +
> +do_create_manifest() {
> +    # This task should be run with every new release of Python.
> +    # We must ensure that PACKAGECONFIG enables everything when creating
> +    # a new manifest, this is to base our new manifest on a complete
> +    # native python build, containing all dependencies, otherwise the task
> +    # wont be able to find the required files.
> +    # e.g. BerkeleyDB is an optional build dependency so it may or may not
> +    # be present, we must ensure it is.
> +
> +    cd ${WORKDIR}
> +    # This needs to be executed by python-native and NOT by HOST's python
> +    nativepython3 create_manifest3.py
> +    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
> +}
> +
> +# bitbake python -c create_manifest
> +addtask do_create_manifest
> +
> +# Make sure we have native python ready when we create a new manifest
> +do_create_manifest[depends] += "python3:do_prepare_recipe_sysroot"
> +do_create_manifest[depends] += "python3:do_patch"


