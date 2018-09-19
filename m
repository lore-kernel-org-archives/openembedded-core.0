Return-Path: <alejandr@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0082.outbound.protection.outlook.com [104.47.32.82])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEA6795DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LhINCgKdgChlA10ocsGBsn6W3gK6FDs4QsML69WEFZM=;
	b=afq1MPUUtypGK02Op4Y1e9DqclKZexuWvaue4xZ7IgbpFleXcmlypmwUhHpTm21WeQ8DvF5ks5V+L8SN6o9PKFbcs/IW6tsb3rOE/t0Ps6rLth6hIkGj5q6bbZvnBvg6qpcRobW7LYatI/yvXbegdGTEb80qmFMYwk3/VXPWOa0=
Received: from CY4PR02CA0007.namprd02.prod.outlook.com (2603:10b6:903:18::17)
	by BL0PR02MB4754.namprd02.prod.outlook.com (2603:10b6:208:5d::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1143.18;
	Wed, 19 Sep 2018 18:08:48 +0000
Received: from SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by CY4PR02CA0007.outlook.office365.com
	(2603:10b6:903:18::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1143.15 via
	Frontend Transport; Wed, 19 Sep 2018 18:08:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT041.mail.protection.outlook.com (10.152.72.217) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1164.13
	via Frontend Transport; Wed, 19 Sep 2018 18:08:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g2gu7-0003Zi-7C; Wed, 19 Sep 2018 11:08:47 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g2gu2-0001wf-2j; Wed, 19 Sep 2018 11:08:42 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8JI8cxG007552; Wed, 19 Sep 2018 11:08:38 -0700
Received: from [10.23.116.7] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g2gtx-0001wS-Rp; Wed, 19 Sep 2018 11:08:37 -0700
To: Jens Rehsack <rehsack@gmail.com>, Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
References: <20180917184949.22961-1-sno@netbsd.org>
	<e980857d-518a-cdb1-cb63-8d812d3f342a@xilinx.com>
	<CAANR1XE=tT3LTcu7tsY6HCniwBKHwPD9HM3Apbpp9T+V_RHxow@mail.gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <741fd29e-72d4-408f-38bc-1a54381c5e68@xilinx.com>
Date: Wed, 19 Sep 2018 11:08:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAANR1XE=tT3LTcu7tsY6HCniwBKHwPD9HM3Apbpp9T+V_RHxow@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(438002)(55674003)(189003)(199004)(10710500007)(47776003)(36386004)(65806001)(53386004)(11346002)(63266004)(45954006)(19627235002)(305945005)(478600001)(39060400002)(31686004)(486006)(2486003)(9786002)(65956001)(8936002)(426003)(126002)(110136005)(76176011)(6246003)(316002)(3260700006)(31696002)(23676004)(64126003)(5660300001)(15650500001)(26005)(446003)(36756003)(966005)(2906002)(58126008)(186003)(2420400007)(336012)(575784001)(77096007)(81156014)(81166006)(16200700003)(106466001)(6306002)(53546011)(53946003)(67846002)(8676002)(476003)(4326008)(2616005)(356003)(50466002)(14444005)(106002)(230700001)(65826007)(229853002)(21314002)(107986001)(559001)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4754; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT041;
	1:FJLsl3fBLJo79QYSYWY3AzoCxZexYF2g72obGybZi3SCyY4owsXXz3r7Qo63PayWO2kloJKgiy6r920b5dczqC13SHEC1xB8kP9WtWbV1ROTvRkOcqiRTHUeaMYy5Enr
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1de9971-2dc3-4f09-d440-08d61e5af22e
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4754; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4754;
	3:fs7OMm2UtIrS6v5gj3H4SKGAo1Hz9+I+EZWrxxYGp6ks7ZS0EhZobZvC8QgUhbc30l4kZ5YjIm2ozqirqBBRjwuXddWWCKqEPY0YdSoVvHbkQdkINbG4aX6fxUYR6xwXPm1Acy50bT1bZ1UgwKVTtINhlmNXQk9HY/xQXFMA8hj0MUAFtOt68J565z05P8TgDl1HvROcZB/ypt+i9gVMVLwke4aXs7VMGMQW1V8omUsUhCzxqu3k3syH57Y4OCevjrhG5NDnjGUDaPJIPrw1eWoCeYPCKyEUdUukEy19F5xCIdfaMkOXiTY8aK52QxWMKynQWeCZ69RsJcYpGbPcXFrGfc5rT9eaVim/iKaYGAs=;
	25:mi1ftgnXbA6PrYileUjFNRNdo9PpKm4DdhhwGtCuWLvCvPOF/3cOXqes0UkH8w5LMvTe29T6qBKujzNVjL7nwW2hAZ/yBRbzc/ppScPdy7z/PIMmy4iFe6LnN0skTl/A1GMDd+zmnVrdPnZVnjwh5vEYxvJMBhpNpM56MySu3ZYJKmef4Vn6qo2Qb7GAtn7Yjei51T/97L/lwkIOl9ZYE3ZkYBom4rK3Tb9RuP+EU+4RO7RK6mXHC45Bun4J+zjxWUJZg84TEBXtSLTKzNnUoI4vxn9pr/hCSC8qG5NB3GJupefXqqwfUw69yxpfMxfW9BGBlcgdEdpeLN3ZVeRHpA==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4754:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4754;
	31:KcHy0fLnVZ69vwij9ypaHJi17+3ehlsmoa52Sj6OhwDMWi/Yf8XFxbS5AdULtdcWeCbSzHJz4stY/9hvC7TXJF7RX4+7vZt5UNd6TThXYEwW2RYV1sXdpIrPBRW3x47ztUw5Seg19rYFdObCrtMx3BWa387aM5JXGA4MAdwMAmSiLesyzjAVOpnEPJbaGGwHUqFoANNcicX/mbAvLzcATkjVBoUgLe140wxc6eduEJM=;
	20:IuUtJGuK4DJwlqMaAFKuXg1LEjNCjRhNa1w7uER/54bu48ogqqLRYNv9J/P/vZOfxD1CVf8b7BtZMHdj2r9VNMiz5BJQVcVTz8f/oxIT+/vQQYREuJX6ak/MjewbhDfCD8fZFvBDoFuhaaTQdcDIlZpCFymUgD94/h7AldT7m/29RV9lJupex3ghEXmYexb/PFYjRdLvTgbOtR1SRig1FxjNUY+nQOZ/lzrM/hJ4aaxOX/k3tyysTiEj7tGx2ZG1Y7fLS5ABtTbPWL+6TPBAu/m0ukgxJgfSpLOUkR+TXK0lI6YCopeytxWT5QtqDqwwLp2avLGUHV2r1yWY0Wg8RrxUQQ7F6gjna66L5FhOmdgTMoBdZ8CrpPQhpp/rtcS64qw4wu711ho4mvGE/aOeLfLt2AlFc2/1zCVW72rELMVpCHUU5hG1/gMKesjGWQIHhW/H5aTKqWO/QIR1di2XL0Jc4jFZhduFYNlMdzJT25U4dZfdJ5TgoTM1oAFcEqsi
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB4754ECB4671B1985B6FF5193AC1C0@BL0PR02MB4754.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(278428928389397)(166708455590820)(192374486261705)(85827821059158)(265634631926514)(788757137089)(192813158149592)(163750095850)(21532816269658);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231355)(944501410)(52105095)(149027)(150027)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699050);
	SRVR:BL0PR02MB4754; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4754; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4754;
	4:AHQ6dqM/UCk9pwqx/iqXrYtGp2J2IkEXiZBrCLsDGZnDiDBpZdtKh9ggvVo/XylIJFHceaHdB//TlGbTT75FqT94hM60pD8hPv8QEGVUWGDzsaS7p8REhHRidoMGeFRbwWUtHcwJbEeI7NNfscOM3xyR4jpLiWITx3GA+GKmy6MmXPpOID31wI2xLwYQ6uIeDMX2/HTPkcE4Q13jcp4rFdQ5TD9xShxA75o/IOmFwvMD9zoQ+qSyv2DrrQ0LEBapnJ4/kh32K+WSeJ6/CmRbBo9KJz39KHwOofGIyDaMV9cxL0GwD747ReWayYZWAPvyR55yZoR89zt1RI51bZ2GDz8GW0z6kuvv1UwKnYchySeOMQ85h7jtlDSj8WrexSyigORGd4rPJkc39HbtOvF1aM9tooWU4NWyOaUlZbZgnnqu9+VvBLyQbRMcPaGZnYy6DswDyr9iE5q/vovoMNEo1OyYX1ZAimfTBGJHLsLn+B4FeWCyOT9j/mA0Aait9BhuJSsWfTZSGUwe56gpCJdBC5yFSZUhtidBQb2+J/HHiab2CevssBUtzHdDPUnyOWk+HCWcr2Zn4KP00OfbQjHSw8yqNEjynS0BU+AKf1v9gOQ=
X-Forefront-PRVS: 0800C0C167
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDBQUjAyTUI0NzU0OzIzOlVhSUpyV2hCcHFMTkdFVGpqU09JMmJUVWpt?=
	=?utf-8?B?TkFFOEIwYSszclVaWVJhNklwRmxIVXBOVDFzbEdJQW56K1Y5Vi83akdQWEJs?=
	=?utf-8?B?STBFN3RPcGRLcm40OE1CY1pHVUN0RTF6djZhMDNCSkQ1VTlTbDk5VUJxNDhz?=
	=?utf-8?B?RnJ2aWF6b1BlWHZpaTFIWjNRcjhscmVldzFIb1F4TWlNYWR3d3pQWUxoRGFP?=
	=?utf-8?B?QlJsUzFGK0poVzVGVEpFWUxIS1VxdnoraFhpbDQ3YUhNYWszQmpsNkJJOWpx?=
	=?utf-8?B?V1VlRCtEdmRVWDVFUG1LTk9YZUR3KzJlRlZMWWMxSWRLTzcrQ3U3S0Fwbnpq?=
	=?utf-8?B?NE9mU2RpSFJ1WmRucGdCd0pZSDllTWJmRFNIQTBEbnhYZTBWYUtMYmpCdFF3?=
	=?utf-8?B?WGh3cDd2MFdvbGN2ZEVRVndNZWtxSE9hQ1o5NEhJakZmaVNqSnZPVDd1UnRj?=
	=?utf-8?B?ZU94TzJ6ZDhCRDJ1VEd6NCtqcHFEY1J6S0txTnBROXQ5MStyQW54TkptS3BD?=
	=?utf-8?B?UTVqTEU0US9Xdml6YUlzU3lTOHhnUTRxWm0yVXd3dzhrM3FaODJ6QmZHUEhX?=
	=?utf-8?B?MHB4M2NwSlg1d2RoWFd6bXFyV2RhV3FpbnNPMnluR1hKU09OSTFxT09QS0h5?=
	=?utf-8?B?aElsMjFUbE5WeWlzODZSZ3F1dTJiYUo3YTlZYkY2YTYvRFdJd2tsenV0SmtV?=
	=?utf-8?B?QTNpWTZyU3llZmhFTnkxektpMjZjaXVsZGhFbjJzLzFINWFtL0c3bXVwQ1Rm?=
	=?utf-8?B?YmMvWFRMVG12eTUzMDB0VVpwMHBrQ216V1NtQXBSQjVzOHFoR3hGR1p5RmpG?=
	=?utf-8?B?ZkpucHZ6T0x4T1lRZ3pOSzZ2VWJrM0xmeHFmbmVjVnhsTU9rWFphVGpwN011?=
	=?utf-8?B?Rm1mZEhoYjM1NFdkNXJRL2RJbWdDMVdPUjRmenRIWFBBV3F2cmxteVQwR0Nj?=
	=?utf-8?B?VXRkZG5Kd1ZkbDRSZFZGSVpqSlpSQ2VSQzNnNHRNQXNCc0xPZVlYMUNvNmxQ?=
	=?utf-8?B?a1dDTXRic2U1ZGo0Z3dCSDFqMzIyWTdiSlF5WmhwVzcybjFKNit1THpMRm5w?=
	=?utf-8?B?MnpyTG1Odk5STmFPd0trdm1BZy9tdWs5L2wzRFp6YkszdGhOVFpIYmMyc0Er?=
	=?utf-8?B?Smp3cVVtK1EwS1dBU3c5MFQ0NjM2RXducjZXZUxjSWErOHk0ZTRlSkZNMHRq?=
	=?utf-8?B?cE1jU2xJNzR5UTJPS280dXpWQThieUVWcnVvZXMvSUVtLytoZFIvUndlNmZZ?=
	=?utf-8?B?Tlg5Z2JJYkNrVmFTOThDSWgwaVhPRmYxUmZoblc5RENFVTNZeUVCcVBua2VB?=
	=?utf-8?B?ZDRpdnR6L1FIcUVLMGtLcUlZRGJqcUtsaCtvNGNwV1B0ckxVUUQwcDJwZDVP?=
	=?utf-8?B?WVRZY2FLRVJBTVlzT1AydTNJN1N0UlAyTXNISDlvc0xUSDdxVElOZDIzdjh0?=
	=?utf-8?B?ZXZIMlVma2ZhMFBjaFVtMGlCSlQzMFJJRkNnVjRxVjgrbk5nb1YwVktSWEhR?=
	=?utf-8?B?ZGpVWThKRzJXaVlGaXMyREY4em5TVHJvenRTVlpiL0lFQnVoZStpWW15V2sz?=
	=?utf-8?B?My9uYUlNZ1NKK0J2TVZVZ2EvRUtpMzc4M041L0w0WFJTeTd6aUpCN2xCUGlJ?=
	=?utf-8?B?Mm1PcUYvN2UwK0VLUlNMemZFelY5Z3g5RzZrdDI1S293ZVRLc0lrSUxMcmRD?=
	=?utf-8?B?TVlEZjh6QlRNbnhzeGd3SkxNL3NpTHBjR0lRUXA1bHg1QmJ0NlM5SXR2QjZM?=
	=?utf-8?B?Z3FNNUZJZmV6ajQ5WFJEbXlSRGFKSWVjNlYyU0R5bXNNSEticmlTVi9uZ29I?=
	=?utf-8?B?a1FBZE1EYUkwTGtqbG4xV2tPTjh4MGhDekk3ZGJ1WmxRY2c0TmpXVng5RnB0?=
	=?utf-8?B?ZWFJOGtIR3JWc2VNSXZlcjVDMGhSK1FvS1lpT09ZQytTcTdXWlAyZHdJTzJ6?=
	=?utf-8?B?cmRNSFgrTmxXamNCZ3FJdFBtNTJsME5JNVJRLzlmYWdrK1UrSDJ0WE0zZWQ1?=
	=?utf-8?B?aGZ3aG0rZityY0VNUXdUS0VEME5SWTZrcXJwcG1aR1Uydit6Vkl3d2NwSjZC?=
	=?utf-8?B?MlY4dnVyR0VnejRQVXhJQVZLcXMxT2Y4bWhhbEhkenFFT25oQ29KempYaVBH?=
	=?utf-8?B?bnpTZUVBcGkwcnlVeDNUajlRQThKazNOZU1uY2pJVStvMElGTkcrWnZINnlP?=
	=?utf-8?Q?tdkMuo/0Nd2Cat2Lg4Vndny1v+sGP4EICb6ycEB2GM=3D?=
X-Microsoft-Antispam-Message-Info: TPlBUViY20S0XEpuGY9sCJG0RvT7zVdD0WbvEwYul2L8LivI2ieJjiF53YemiIVl19agNfe4VJUdZjyU0GlGeFLSyo8cBvZ8BzCfIUUUwpTgc8bERx51GT4L6pAWk4R9t2V1Bm9Z+rJDtEPS4dB5gJjG8uZ9fvPylp3Y4llMxst58uZOEGUBC6UYiuxpn7tpT/csKB2pLnRh9j2gJZfm/8wwX0WLJj5PtpwowIGVqPfQmG9w0snYYuewqqFjAptuyiRpmy20MCZMhnFUVMABrZZyzWN7/n3sjjeSlxsKi6xkovXZm4vrCxrL2Rwnp2zxlWJwY5HYtTnuKkTtYIikIcCKelHzoaaLf23E+hUvaJE=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4754;
	6:qTaPDTM68+ZiyxpSufOqNSuFfeGbFyQts9eNi4cb8HQrlLu13i/eWO7Y/OPVxm+9DP4b6sZmcB/jomCKDOy0ieIMb4ynmCD3PMbs2IBmqs2ksXRZt6WMUYfSBj88Ofi9jQ52CAds9pUtQx7Ih7AbAXz5d4oAEHs8vRVS7+AP7FNmHn1gRpOSIi37Oc+Kw9MLKJhyt/8Yy1X1gk2v2Tu7oG0KBgpN0YW2a/pNGt3M/WZiErfa7+TfX5MoeNKTyydpXU7TeFyL6bjtWCsKFHeV4liI991fxmw0kiSBM0/JLkdIK9FdZUO6EBrd1AmMGHcsUDy6y4/ZTFUxoZv3kKcrrcjhigynlP4vSX0R5vQ6CwsqNqtm2+BZgssrSXtD/yHzLrrjianx9K1CrpjRNfa+khehemZq9rRxKGF5ja36VKdufOVusBda80Kk8PSY5QlTdaQKe29bKuVUfA0TeYQtPg==;
	5:YJ7bt1VIFTZ6fu59mfbjHWHEZHP8Hnf/7XMAHXUKA755i9yJViylZQG10DWSUUSUq3eTuI0Yb/PmQnTt6GZXHYSBoyPu1335gpgE87uVeKrceIAcQ21LkxVdkhiY+dY1eSCLWfzBGclNBXoc6QBbGqmcm94P1Dh2/tJNWcJkhvo=;
	7:7rXc0NZI7Sk9XfnAU7wNla8GSQLkVihnRQIspqR37UKROj2aRUHke7rVot9D425QJq4P3mEwPJeUMd0+qC+PPX4KhakoOWAgscAfF8NzVTVXtZdE+QkUZdJn/TXrf9V1yFbg2nnXLpzQhcCQaVYGnTml0nEgYDZhh+MyKZpfBg5Z8abrz+gaTthOuq2/uX+nZQ1ny3EBI7dS0Dax+qlOlf9boPG080SClXFRCxortSdYKgLGp0gIlignj4DDfcRt
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2018 18:08:47.6048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1de9971-2dc3-4f09-d440-08d61e5af22e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4754
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Wed, 19 Sep 2018 18:08:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I am aware dnf needs an update, but in the meantime you can't break 
functionality of other components of the build system when upgrading a 
certain component, we either need a patch to dnf to fix compatibility or 
the upgrade to dnf as well.


Alejandro

On 9/19/2018 1:44 AM, Jens Rehsack wrote:
> That has already been discussed, dnf needs an update.
> Am Mi., 19. Sep. 2018 um 08:50 Uhr schrieb Alejandro Hernandez
> <alejandro.enedino.hernandez-samaniego@xilinx.com>:
>> Hey Jens,
>>
>> Apart from the python3-native incomplete build which we discussed before
>> and is still there, this is still breaking dnf, hence producing an error
>> when executing do_rootfs for an image.
>>
>> The following error is shown:
>>
>> NOTE: ###### Generate rootfs #######
>> NOTE: Executing 'RSN/usr/bin/createrepo_c --update -q
>> wrkdir/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo' ...
>> NOTE: Running RSN/usr/bin/dnf -v --rpmverbosity=debug -y -c
>> wrkdir/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf
>> --setoh
>> ERROR: Could not invoke dnf. Command 'RSN/usr/bin/dnf -v
>> --rpmverbosity=debug -y -c
>> wrkdir/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs:
>> Traceback (most recent call last):
>>     File "RSN/usr/lib/python3.7/site-packages/dnf/util.py", line 121, in
>> ensure_dir
>>       os.makedirs(dname, mode=0o755)
>>     File "RSN/usr/lib/python3.7/os.py", line 221, in makedirs
>>       mkdir(name, mode)
>> FileExistsError: [Errno 17] File exists:
>> 'wrkdir/qemux86-poky-linux/core-image-minimal/1.0-r0/temp'
>>
>> Traceback (most recent call last):
>>     File "RSN/usr/bin/dnf.real", line 58, in <module>
>>       main.user_main(sys.argv[1:], exit_code=True)
>>     File "RSN/usr/lib/python3.7/site-packages/dnf/cli/main.py", line 179,
>> in user_main
>>
>> ...
>>
>> File "RSN/usr/lib/python3.7/site-packages/dnf/util.py", line 123, in
>> ensure_dir
>>       if e.errno != os.errno.EEXIST or not os.path.isdir(dname):
>> AttributeError: module 'os' has no attribute 'errno'
>>
>>
>> This means either the python3 build needs to be fixed (unlikely) or that
>> the dnf build needs to be fixed to be compatible with python 3.7, and if
>> that's the case the patch to dnf still needs to be provided (even if
>> it's not part of the upgrade), since we need to ensure that we don't
>> break other component's functionality in between patches.
>>
>> This also means that you probably haven't tested running python3.7
>> inside an image, otherwise its likely you would've seen this same issue,
>> while I see no reason why the python3.7 build wouldn't work at runtime,
>> it still needs to be tested, the fact that a package builds successfully
>> doesn't mean it will necessarily run properly.
>>
>> Alejandro
>>
>> On 9/17/2018 11:49 AM, Jens Rehsack wrote:
>>> Update python3 to recent 3.7.0 release.
>>>
>>> Details about new features and bug-fixes can be taken from
>>> * https://docs.python.org/3/whatsnew/3.7.html
>>> * https://docs.python.org/3/whatsnew/3.6.html
>>>
>>> Remove patches when they were fixed upstream and rebase the
>>> remaining ones. If necessary, the patches are adopted to
>>> keep the idea when upstream code was changed. Also remove
>>> backports from 3.6 and 3.7 into 3.5.6 codebase for TLS
>>> and multiprocessing.
>>>
>>> Open TODO: track patches in a -STABLE rebased git branch for
>>> easier rebasing or upstream submitting.
>>>
>>> Enhancement requests for Yocto project
>>> * https://bugzilla.yoctoproject.org/show_bug.cgi?id=12375
>>> * https://bugzilla.yoctoproject.org/show_bug.cgi?id=12901
>>> are solved by this.
>>>
>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>> ---
>>>    meta/classes/python3-dir.bbclass              |   6 +-
>>>    .../python/python3-native_3.5.6.bb            | 100 ------
>>>    .../python/python3-native_3.7.0.bb            |  73 ++++
>>>    meta/recipes-devtools/python/python3.inc      |  65 +++-
>>>    ...hell-version-of-python-config-that-w.patch |  21 +-
>>>    ..._sysconfigdata.py-to-initialize-dist.patch |  66 ----
>>>    ...ontext-has-improved-default-settings.patch | 272 ---------------
>>>    ...d-target-to-split-profile-generation.patch |  40 ---
>>>    ...S-1.3-cipher-suites-and-OP_NO_TLSv1_.patch | 227 ------------
>>>    ...for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch | 173 ---------
>>>    ....3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch | 110 ------
>>>    ...ALPN-changes-for-OpenSSL-1.1.0f-2305.patch |  68 ----
>>>    .../python3/03-fix-tkinter-detection.patch    |  12 +-
>>>    .../python3/030-fixup-include-dirs.patch      |   9 -
>>>    .../080-distutils-dont_adjust_files.patch     |   4 +-
>>>    .../python/python3/150-fix-setupterm.patch    |  17 -
>>>    ...GS-for-extensions-when-cross-compili.patch |  53 ++-
>>>    .../python3/avoid-ncursesw-include-path.patch |  18 +-
>>>    .../python3/avoid_warning_about_tkinter.patch |  18 +-
>>>    .../python3/configure.ac-fix-LIBPL.patch      |  21 +-
>>>    .../python/python3/float-endian.patch         |   9 +-
>>>    ...ssing-libraries-to-Extension-for-mul.patch |  26 +-
>>>    .../python/python3/python-3.3-multilib.patch  | 241 +++++++------
>>>    .../python/python3/python3-manifest.json      |  11 +-
>>>    ...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  17 +-
>>>    .../python/python3/regen-all.patch            |  25 --
>>>    .../python/python3/signal.patch               |  56 ---
>>>    ...port_SOURCE_DATE_EPOCH_in_py_compile.patch |  36 +-
>>>    .../python3/sysroot-include-headers.patch     |  23 +-
>>>    .../python3/uuid_when_cross_compiling.patch   |  22 ++
>>>    meta/recipes-devtools/python/python3_3.5.6.bb | 328 ------------------
>>>    meta/recipes-devtools/python/python3_3.7.0.bb | 296 ++++++++++++++++
>>>    32 files changed, 709 insertions(+), 1754 deletions(-)
>>>    delete mode 100644 meta/recipes-devtools/python/python3-native_3.5.6.bb
>>>    create mode 100644 meta/recipes-devtools/python/python3-native_3.7.0.bb
>>>    delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/regen-all.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3/signal.patch
>>>    create mode 100644 meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
>>>    delete mode 100644 meta/recipes-devtools/python/python3_3.5.6.bb
>>>    create mode 100644 meta/recipes-devtools/python/python3_3.7.0.bb
>>>
>>> diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bbclass
>>> index 06bb046d9c..ad7ea8dd9a 100644
>>> --- a/meta/classes/python3-dir.bbclass
>>> +++ b/meta/classes/python3-dir.bbclass
>>> @@ -1,4 +1,8 @@
>>> -PYTHON_BASEVERSION = "3.5"
>>> +PYTHON_BASEVERSION = "3.7"
>>> +# [d][m][u]
>>> +# d: py_debug
>>> +# m: my_malloc
>>> +# u: wide-char unicode
>>>    PYTHON_ABI = "m"
>>>    PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>>>    PYTHON_PN = "python3"
>>> diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb b/meta/recipes-devtools/python/python3-native_3.5.6.bb
>>> deleted file mode 100644
>>> index d5953cf4bb..0000000000
>>> --- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
>>> +++ /dev/null
>>> @@ -1,100 +0,0 @@
>>> -require recipes-devtools/python/python3.inc
>>> -
>>> -DISTRO_SRC_URI ?= "file://sitecustomize.py"
>>> -DISTRO_SRC_URI_linuxstdbase = ""
>>> -SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>> -file://12-distutils-prefix-is-inside-staging-area.patch \
>>> -file://python-config.patch \
>>> -file://030-fixup-include-dirs.patch \
>>> -file://070-dont-clean-ipkg-install.patch \
>>> -file://080-distutils-dont_adjust_files.patch \
>>> -file://130-readline-setup.patch \
>>> -file://150-fix-setupterm.patch \
>>> -file://python-3.3-multilib.patch \
>>> -file://03-fix-tkinter-detection.patch \
>>> -file://avoid_warning_about_tkinter.patch \
>>> -file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
>>> -file://sysroot-include-headers.patch \
>>> -file://unixccompiler.patch \
>>> -${DISTRO_SRC_URI} \
>>> -file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
>>> -file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
>>> -file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
>>> -file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
>>> -file://regen-all.patch \
>>> -file://0001-Issue-28043-SSLContext-has-improved-default-settings.patch \
>>> -file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch \
>>> -file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
>>> -file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
>>> -file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
>>> -"
>>> -
>>> -EXTRANATIVEPATH += "bzip2-native"
>>> -DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native gdbm-native"
>>> -
>>> -inherit native
>>> -
>>> -EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
>>> -
>>> -EXTRA_OEMAKE = '\
>>> -  LIBC="" \
>>> -  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
>>> -  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
>>> -  LIB=${baselib} \
>>> -  ARCH=${TARGET_ARCH} \
>>> -'
>>> -
>>> -do_configure_append() {
>>> -     autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
>>> -     sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM \*/,' ${B}/pyconfig.h
>>> -}
>>> -
>>> -# Regenerate all of the generated files
>>> -# This ensures that pgen and friends get created during the compile phase
>>> -#
>>> -do_compile_prepend() {
>>> -    # Assuming https://bugs.python.org/issue33080 has been addressed in Makefile.
>>> -    oe_runmake regen-all
>>> -}
>>> -
>>> -do_install() {
>>> -     install -d ${D}${libdir}/pkgconfig
>>> -     oe_runmake 'DESTDIR=${D}' install
>>> -     if [ -e ${WORKDIR}/sitecustomize.py ]; then
>>> -             install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
>>> -     fi
>>> -     install -d ${D}${bindir}/${PN}
>>> -     install -m 0755 Parser/pgen ${D}${bindir}/${PN}
>>> -
>>> -     # Make sure we use /usr/bin/env python
>>> -     for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
>>> -             sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
>>> -     done
>>> -
>>> -        # Add a symlink to the native Python so that scripts can just invoke
>>> -        # "nativepython" and get the right one without needing absolute paths
>>> -        # (these often end up too long for the #! parser in the kernel as the
>>> -        # buffer is 128 bytes long).
>>> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
>>> -}
>>> -
>>> -python(){
>>> -
>>> -    # Read JSON manifest
>>> -    import json
>>> -    pythondir = d.getVar('THISDIR',True)
>>> -    with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
>>> -        python_manifest=json.load(manifest_file)
>>> -
>>> -    rprovides = d.getVar('RPROVIDES').split()
>>> -
>>> -    # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
>>> -    pn = 'python3'
>>> -
>>> -    for key in python_manifest:
>>> -        pypackage = pn + '-' + key + '-native'
>>> -        if pypackage not in rprovides:
>>> -              rprovides.append(pypackage)
>>> -
>>> -    d.setVar('RPROVIDES', ' '.join(rprovides))
>>> -}
>>> diff --git a/meta/recipes-devtools/python/python3-native_3.7.0.bb b/meta/recipes-devtools/python/python3-native_3.7.0.bb
>>> new file mode 100644
>>> index 0000000000..3ef9f0a5e3
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python3-native_3.7.0.bb
>>> @@ -0,0 +1,73 @@
>>> +require recipes-devtools/python/python3.inc
>>> +
>>> +SRC_URI += "\
>>> +    file://12-distutils-prefix-is-inside-staging-area.patch \
>>> +    file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
>>> +"
>>> +
>>> +EXTRANATIVEPATH += "bzip2-native"
>>> +DEPENDS = "openssl-native libffi-native bzip2-replacement-native zlib-native \
>>> +           util-linux-native readline-native sqlite3-native gdbm-native \
>>> +"
>>> +
>>> +inherit native
>>> +
>>> +EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
>>> +
>>> +EXTRA_OEMAKE = '\
>>> +  LIBC="" \
>>> +  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
>>> +  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
>>> +  LIB=${baselib} \
>>> +  ARCH=${TARGET_ARCH} \
>>> +'
>>> +
>>> +# Regenerate all of the generated files
>>> +# This ensures that pgen and friends get created during the compile phase
>>> +#
>>> +do_compile_prepend() {
>>> +    # Assuming https://bugs.python.org/issue33080 has been addressed in Makefile.
>>> +    oe_runmake regen-all
>>> +}
>>> +
>>> +do_install() {
>>> +     install -d ${D}${libdir}/pkgconfig
>>> +     oe_runmake 'DESTDIR=${D}' install
>>> +     if [ -e ${WORKDIR}/sitecustomize.py ]; then
>>> +             install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
>>> +     fi
>>> +     install -d ${D}${bindir}/${PN}
>>> +     install -m 0755 Parser/pgen ${D}${bindir}/${PN}
>>> +
>>> +     # Make sure we use /usr/bin/env python
>>> +     for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
>>> +             sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
>>> +     done
>>> +
>>> +        # Add a symlink to the native Python so that scripts can just invoke
>>> +        # "nativepython" and get the right one without needing absolute paths
>>> +        # (these often end up too long for the #! parser in the kernel as the
>>> +        # buffer is 128 bytes long).
>>> +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
>>> +}
>>> +
>>> +python(){
>>> +
>>> +    # Read JSON manifest
>>> +    import json
>>> +    pythondir = d.getVar('THISDIR',True)
>>> +    with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
>>> +        python_manifest=json.load(manifest_file)
>>> +
>>> +    rprovides = d.getVar('RPROVIDES').split()
>>> +
>>> +    # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
>>> +    pn = 'python3'
>>> +
>>> +    for key in python_manifest:
>>> +        pypackage = pn + '-' + key + '-native'
>>> +        if pypackage not in rprovides:
>>> +              rprovides.append(pypackage)
>>> +
>>> +    d.setVar('RPROVIDES', ' '.join(rprovides))
>>> +}
>>> diff --git a/meta/recipes-devtools/python/python3.inc b/meta/recipes-devtools/python/python3.inc
>>> index f565b3f171..b0fc0144a4 100644
>>> --- a/meta/recipes-devtools/python/python3.inc
>>> +++ b/meta/recipes-devtools/python/python3.inc
>>> @@ -3,41 +3,74 @@ HOMEPAGE = "http://www.python.org"
>>>    LICENSE = "PSFv2"
>>>    SECTION = "devel/python"
>>>
>>> -# TODO Remove this when we upgrade
>>> -INC_PR = "r1"
>>> -PR = "${INC_PR}.0"
>>> +PYTHON_MAJMIN = "3.7"
>>> +DISTRO_SRC_URI ?= "file://sitecustomize.py"
>>> +DISTRO_SRC_URI_linuxstdbase = ""
>>> +SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>> +    file://python-config.patch \
>>> +    file://python-3.3-multilib.patch \
>>> +    file://03-fix-tkinter-detection.patch \
>>> +    file://avoid_warning_about_tkinter.patch \
>>> +    file://unixccompiler.patch \
>>> +    file://sysroot-include-headers.patch \
>>> +    file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
>>> +    file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
>>> +    file://030-fixup-include-dirs.patch \
>>> +    file://070-dont-clean-ipkg-install.patch \
>>> +    file://080-distutils-dont_adjust_files.patch \
>>> +    file://130-readline-setup.patch \
>>> +    file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
>>> +    ${DISTRO_SRC_URI} \
>>> +    file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
>>> +    file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
>>> +"
>>>
>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
>>> +SRC_URI[md5sum] = "eb8c2a6b1447d50813c02714af4681f3"
>>> +SRC_URI[sha256sum] = "0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4126dd1c40a8b3549"
>>>
>>> -# TODO consolidate patch set
>>> -SRC_URI[md5sum] = "f5a99f765e765336a3ebbb2a24ca2be3"
>>> -SRC_URI[sha256sum] = "f55cde04f521f273c7cba08912921cc5642cfc15ca7b22d5829f0aff4371155f"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
>>>
>>>    # exclude pre-releases for both python 2.x and 3.x
>>>    UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>>>
>>> -CVE_PRODUCT = "python"
>>> -
>>> -PYTHON_MAJMIN = "3.5"
>>> -PYTHON_BINABI = "${PYTHON_MAJMIN}m"
>>> -
>>>    S = "${WORKDIR}/Python-${PV}"
>>>
>>> -inherit autotools bluetooth pkgconfig
>>> +CVE_PRODUCT = "python"
>>> +
>>> +inherit autotools bluetooth pkgconfig python3-dir
>>>
>>>    EXTRA_OECONF = "\
>>> -  --with-threads \
>>>      --with-pymalloc \
>>>      --without-cxx-main \
>>> -  --with-signal-module \
>>>      --enable-shared \
>>>      --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
>>>    "
>>>
>>>    PACKAGECONFIG[bluetooth] = ",ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no,${BLUEZ}"
>>>
>>> +do_configure_prepend() {
>>> +     libdirleaf="$(echo ${libdir} | sed -e 's:${prefix}/::')"
>>> +     sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
>>> +             ${S}/configure.ac
>>> +}
>>> +
>>> +do_install_prepend() {
>>> +     MAKESETTINGS="$(egrep '^(ABIFLAGS|MULTIARCH)=' ${B}/Makefile | sed -E -e 's/[[:space:]]//g' -e 's/=/="/' -e 's/$/"/')"
>>> +     eval ${MAKESETTINGS}
>>> +     if test "${ABIFLAGS}" != "${PYTHON_ABI}"; then
>>> +         die "do_install: configure determined ABIFLAGS '${ABIFLAGS}' != '${PYTHON_ABI}' from python3-dir.bbclass"
>>> +     fi
>>> +     if test "x${BUILD_OS}" = "x${TARGET_OS}"; then
>>> +             # no cross-compile at all
>>> +             _PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
>>> +     else
>>> +             # at the very moment, it's the only available target
>>> +             _PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_linux_${MULTIARCH}
>>> +     fi
>>> +}
>>> +
>>>    do_install_append () {
>>>        sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
>>>                -e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
>>> -             ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
>>> +             ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py
>>>    }
>>> diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
>>> index 8ea3f03fe0..aac34533ef 100644
>>> --- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
>>> +++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
>>> @@ -14,25 +14,22 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>>     1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>>    diff --git a/Makefile.pre.in b/Makefile.pre.in
>>> -index 236f005..5c4337f 100644
>>> +index 31b4bcabb3..7da6d6941e 100644
>>>    --- a/Makefile.pre.in
>>>    +++ b/Makefile.pre.in
>>> -@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
>>> +@@ -1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
>>>        sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
>>> -     # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
>>> +     @ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
>>>        LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
>>> --    # On Darwin, always use the python version of the script, the shell
>>> --    # version doesn't use the compiler customizations that are provided
>>> --    # in python (_osx_support.py).
>>> --    if test `uname -s` = Darwin; then \
>>> +-    @ # On Darwin, always use the python version of the script, the shell
>>> +-    @ # version doesn't use the compiler customizations that are provided
>>> +-    @ # in python (_osx_support.py).
>>> +-    @if test `uname -s` = Darwin; then \
>>>    -           cp python-config.py python-config; \
>>>    -   fi
>>> -+    # In OpenEmbedded, always use the python version of the script, the shell
>>> -+    # version is broken in multiple ways, and doesn't return correct directories
>>> ++    @ # In OpenEmbedded, always use the python version of the script, the shell
>>> ++    @ # version is broken in multiple ways, and doesn't return correct directories
>>>    +   cp python-config.py python-config
>>>
>>>
>>>     # Install the include files
>>> ---
>>> -2.11.0
>>> -
>>> diff --git a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>>> deleted file mode 100644
>>> index d1c92e9eed..0000000000
>>> --- a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>>> +++ /dev/null
>>> @@ -1,66 +0,0 @@
>>> -From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001
>>> -From: Libin Dang <libin.dang@windriver.com>
>>> -Date: Tue, 11 Apr 2017 14:12:15 +0800
>>> -Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
>>> - distutils.sysconfig
>>> -
>>> -Backport upstream commit
>>> -https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
>>> -
>>> -Upstream-Status: Backport
>>> -
>>> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
>>> ----
>>> - Lib/distutils/sysconfig.py | 35 ++++-------------------------------
>>> - 1 file changed, 4 insertions(+), 31 deletions(-)
>>> -
>>> -diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
>>> -index 6d5cfd0..9925d24 100644
>>> ---- a/Lib/distutils/sysconfig.py
>>> -+++ b/Lib/distutils/sysconfig.py
>>> -@@ -424,38 +424,11 @@ _config_vars = None
>>> -
>>> - def _init_posix():
>>> -     """Initialize the module as appropriate for POSIX systems."""
>>> --    g = {}
>>> --    # load the installed Makefile:
>>> --    try:
>>> --        filename = get_makefile_filename()
>>> --        parse_makefile(filename, g)
>>> --    except OSError as msg:
>>> --        my_msg = "invalid Python installation: unable to open %s" % filename
>>> --        if hasattr(msg, "strerror"):
>>> --            my_msg = my_msg + " (%s)" % msg.strerror
>>> --
>>> --        raise DistutilsPlatformError(my_msg)
>>> --
>>> --    # load the installed pyconfig.h:
>>> --    try:
>>> --        filename = get_config_h_filename()
>>> --        with open(filename) as file:
>>> --            parse_config_h(file, g)
>>> --    except OSError as msg:
>>> --        my_msg = "invalid Python installation: unable to open %s" % filename
>>> --        if hasattr(msg, "strerror"):
>>> --            my_msg = my_msg + " (%s)" % msg.strerror
>>> --
>>> --        raise DistutilsPlatformError(my_msg)
>>> --
>>> --    # On AIX, there are wrong paths to the linker scripts in the Makefile
>>> --    # -- these paths are relative to the Python source, but when installed
>>> --    # the scripts are in another directory.
>>> --    if python_build:
>>> --        g['LDSHARED'] = g['BLDSHARED']
>>> --
>>> -+    # _sysconfigdata is generated at build time, see the sysconfig module
>>> -+    from _sysconfigdata import build_time_vars
>>> -     global _config_vars
>>> --    _config_vars = g
>>> -+    _config_vars = {}
>>> -+    _config_vars.update(build_time_vars)
>>> -
>>> -
>>> - def _init_nt():
>>> ---
>>> -1.8.3.1
>>> -
>>> diff --git a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch b/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
>>> deleted file mode 100644
>>> index 321b4afa12..0000000000
>>> --- a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
>>> +++ /dev/null
>>> @@ -1,272 +0,0 @@
>>> -From 758e7463c104f71b810c8588166747eeab6148d7 Mon Sep 17 00:00:00 2001
>>> -From: Christian Heimes <christian@python.org>
>>> -Date: Sat, 10 Sep 2016 22:43:48 +0200
>>> -Subject: [PATCH 1/4] Issue 28043: SSLContext has improved default settings
>>> -
>>> -The options OP_NO_COMPRESSION, OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE, OP_SINGLE_ECDH_USE, OP_NO_SSLv2 (except for PROTOCOL_SSLv2), and OP_NO_SSLv3 (except for PROTOCOL_SSLv3) are set by default. The initial cipher suite list contains only HIGH ciphers, no NULL ciphers and MD5 ciphers (except for PROTOCOL_SSLv2).
>>> -
>>> -Upstream-Status: Backport
>>> -[https://github.com/python/cpython/commit/358cfd426ccc0fcd6a7940d306602138e76420ae]
>>> -
>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> ----
>>> - Doc/library/ssl.rst  |  9 ++++++-
>>> - Lib/ssl.py           | 30 +++++----------------
>>> - Lib/test/test_ssl.py | 62 +++++++++++++++++++++++---------------------
>>> - Modules/_ssl.c       | 31 ++++++++++++++++++++++
>>> - 4 files changed, 78 insertions(+), 54 deletions(-)
>>> -
>>> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
>>> -index a2f008346b..14f2d68217 100644
>>> ---- a/Doc/library/ssl.rst
>>> -+++ b/Doc/library/ssl.rst
>>> -@@ -1151,7 +1151,14 @@ to speed up repeated connections from the same clients.
>>> -
>>> -    .. versionchanged:: 3.5.3
>>> -
>>> --      :data:`PROTOCOL_TLS` is the default value.
>>> -+      The context is created with secure default values. The options
>>> -+      :data:`OP_NO_COMPRESSION`, :data:`OP_CIPHER_SERVER_PREFERENCE`,
>>> -+      :data:`OP_SINGLE_DH_USE`, :data:`OP_SINGLE_ECDH_USE`,
>>> -+      :data:`OP_NO_SSLv2` (except for :data:`PROTOCOL_SSLv2`),
>>> -+      and :data:`OP_NO_SSLv3` (except for :data:`PROTOCOL_SSLv3`) are
>>> -+      set by default. The initial cipher suite list contains only ``HIGH``
>>> -+      ciphers, no ``NULL`` ciphers and no ``MD5`` ciphers (except for
>>> -+      :data:`PROTOCOL_SSLv2`).
>>> -
>>> -
>>> - :class:`SSLContext` objects have the following methods and attributes:
>>> -diff --git a/Lib/ssl.py b/Lib/ssl.py
>>> -index e1913904f3..4d302a78fa 100644
>>> ---- a/Lib/ssl.py
>>> -+++ b/Lib/ssl.py
>>> -@@ -446,32 +446,16 @@ def create_default_context(purpose=Purpose.SERVER_AUTH, *, cafile=None,
>>> -     if not isinstance(purpose, _ASN1Object):
>>> -         raise TypeError(purpose)
>>> -
>>> -+    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
>>> -+    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SINGLE_ECDH_USE
>>> -+    # by default.
>>> -     context = SSLContext(PROTOCOL_TLS)
>>> -
>>> --    # SSLv2 considered harmful.
>>> --    context.options |= OP_NO_SSLv2
>>> --
>>> --    # SSLv3 has problematic security and is only required for really old
>>> --    # clients such as IE6 on Windows XP
>>> --    context.options |= OP_NO_SSLv3
>>> --
>>> --    # disable compression to prevent CRIME attacks (OpenSSL 1.0+)
>>> --    context.options |= getattr(_ssl, "OP_NO_COMPRESSION", 0)
>>> --
>>> -     if purpose == Purpose.SERVER_AUTH:
>>> -         # verify certs and host name in client mode
>>> -         context.verify_mode = CERT_REQUIRED
>>> -         context.check_hostname = True
>>> -     elif purpose == Purpose.CLIENT_AUTH:
>>> --        # Prefer the server's ciphers by default so that we get stronger
>>> --        # encryption
>>> --        context.options |= getattr(_ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
>>> --
>>> --        # Use single use keys in order to improve forward secrecy
>>> --        context.options |= getattr(_ssl, "OP_SINGLE_DH_USE", 0)
>>> --        context.options |= getattr(_ssl, "OP_SINGLE_ECDH_USE", 0)
>>> --
>>> --        # disallow ciphers with known vulnerabilities
>>> -         context.set_ciphers(_RESTRICTED_SERVER_CIPHERS)
>>> -
>>> -     if cafile or capath or cadata:
>>> -@@ -497,12 +481,10 @@ def _create_unverified_context(protocol=PROTOCOL_TLS, *, cert_reqs=None,
>>> -     if not isinstance(purpose, _ASN1Object):
>>> -         raise TypeError(purpose)
>>> -
>>> -+    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
>>> -+    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SINGLE_ECDH_USE
>>> -+    # by default.
>>> -     context = SSLContext(protocol)
>>> --    # SSLv2 considered harmful.
>>> --    context.options |= OP_NO_SSLv2
>>> --    # SSLv3 has problematic security and is only required for really old
>>> --    # clients such as IE6 on Windows XP
>>> --    context.options |= OP_NO_SSLv3
>>> -
>>> -     if cert_reqs is not None:
>>> -         context.verify_mode = cert_reqs
>>> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
>>> -index ffb7314f57..f91af7bd05 100644
>>> ---- a/Lib/test/test_ssl.py
>>> -+++ b/Lib/test/test_ssl.py
>>> -@@ -73,6 +73,12 @@ NULLBYTECERT = data_file("nullbytecert.pem")
>>> - DHFILE = data_file("dh1024.pem")
>>> - BYTES_DHFILE = os.fsencode(DHFILE)
>>> -
>>> -+# Not defined in all versions of OpenSSL
>>> -+OP_NO_COMPRESSION = getattr(ssl, "OP_NO_COMPRESSION", 0)
>>> -+OP_SINGLE_DH_USE = getattr(ssl, "OP_SINGLE_DH_USE", 0)
>>> -+OP_SINGLE_ECDH_USE = getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
>>> -+OP_CIPHER_SERVER_PREFERENCE = getattr(ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
>>> -+
>>> -
>>> - def handle_error(prefix):
>>> -     exc_format = ' '.join(traceback.format_exception(*sys.exc_info()))
>>> -@@ -839,8 +845,9 @@ class ContextTests(unittest.TestCase):
>>> -         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
>>> -         # OP_ALL | OP_NO_SSLv2 | OP_NO_SSLv3 is the default value
>>> -         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
>>> --        if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >= (1, 1, 0):
>>> --            default |= ssl.OP_NO_COMPRESSION
>>> -+        # SSLContext also enables these by default
>>> -+        default |= (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERENCE |
>>> -+                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
>>> -         self.assertEqual(default, ctx.options)
>>> -         ctx.options |= ssl.OP_NO_TLSv1
>>> -         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
>>> -@@ -1205,16 +1212,29 @@ class ContextTests(unittest.TestCase):
>>> -             stats["x509"] += 1
>>> -             self.assertEqual(ctx.cert_store_stats(), stats)
>>> -
>>> -+    def _assert_context_options(self, ctx):
>>> -+        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
>>> -+        if OP_NO_COMPRESSION != 0:
>>> -+            self.assertEqual(ctx.options & OP_NO_COMPRESSION,
>>> -+                             OP_NO_COMPRESSION)
>>> -+        if OP_SINGLE_DH_USE != 0:
>>> -+            self.assertEqual(ctx.options & OP_SINGLE_DH_USE,
>>> -+                             OP_SINGLE_DH_USE)
>>> -+        if OP_SINGLE_ECDH_USE != 0:
>>> -+            self.assertEqual(ctx.options & OP_SINGLE_ECDH_USE,
>>> -+                             OP_SINGLE_ECDH_USE)
>>> -+        if OP_CIPHER_SERVER_PREFERENCE != 0:
>>> -+            self.assertEqual(ctx.options & OP_CIPHER_SERVER_PREFERENCE,
>>> -+                             OP_CIPHER_SERVER_PREFERENCE)
>>> -+
>>> -     def test_create_default_context(self):
>>> -         ctx = ssl.create_default_context()
>>> -+
>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
>>> -         self.assertTrue(ctx.check_hostname)
>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
>>> --        self.assertEqual(
>>> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
>>> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
>>> --        )
>>> -+        self._assert_context_options(ctx)
>>> -+
>>> -
>>> -         with open(SIGNING_CA) as f:
>>> -             cadata = f.read()
>>> -@@ -1222,40 +1242,24 @@ class ContextTests(unittest.TestCase):
>>> -                                          cadata=cadata)
>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
>>> --        self.assertEqual(
>>> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
>>> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
>>> --        )
>>> -+        self._assert_context_options(ctx)
>>> -
>>> -         ctx = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
>>> --        self.assertEqual(
>>> --            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
>>> --            getattr(ssl, "OP_NO_COMPRESSION", 0),
>>> --        )
>>> --        self.assertEqual(
>>> --            ctx.options & getattr(ssl, "OP_SINGLE_DH_USE", 0),
>>> --            getattr(ssl, "OP_SINGLE_DH_USE", 0),
>>> --        )
>>> --        self.assertEqual(
>>> --            ctx.options & getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
>>> --            getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
>>> --        )
>>> -+        self._assert_context_options(ctx)
>>> -
>>> -     def test__create_stdlib_context(self):
>>> -         ctx = ssl._create_stdlib_context()
>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
>>> -         self.assertFalse(ctx.check_hostname)
>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
>>> -+        self._assert_context_options(ctx)
>>> -
>>> -         ctx = ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
>>> -+        self._assert_context_options(ctx)
>>> -
>>> -         ctx = ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1,
>>> -                                          cert_reqs=ssl.CERT_REQUIRED,
>>> -@@ -1263,12 +1267,12 @@ class ContextTests(unittest.TestCase):
>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
>>> -         self.assertTrue(ctx.check_hostname)
>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
>>> -+        self._assert_context_options(ctx)
>>> -
>>> -         ctx = ssl._create_stdlib_context(purpose=ssl.Purpose.CLIENT_AUTH)
>>> -         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
>>> -         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
>>> --        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
>>> -+        self._assert_context_options(ctx)
>>> -
>>> -     def test_check_hostname(self):
>>> -         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
>>> -diff --git a/Modules/_ssl.c b/Modules/_ssl.c
>>> -index 86482677ae..0d5c121d2c 100644
>>> ---- a/Modules/_ssl.c
>>> -+++ b/Modules/_ssl.c
>>> -@@ -2330,6 +2330,7 @@ _ssl__SSLContext_impl(PyTypeObject *type, int proto_version)
>>> -     PySSLContext *self;
>>> -     long options;
>>> -     SSL_CTX *ctx = NULL;
>>> -+    int result;
>>> - #if defined(SSL_MODE_RELEASE_BUFFERS)
>>> -     unsigned long libver;
>>> - #endif
>>> -@@ -2393,8 +2394,38 @@ _ssl__SSLContext_impl(PyTypeObject *type, int proto_version)
>>> -         options |= SSL_OP_NO_SSLv2;
>>> -     if (proto_version != PY_SSL_VERSION_SSL3)
>>> -         options |= SSL_OP_NO_SSLv3;
>>> -+    /* Minimal security flags for server and client side context.
>>> -+     * Client sockets ignore server-side parameters. */
>>> -+#ifdef SSL_OP_NO_COMPRESSION
>>> -+    options |= SSL_OP_NO_COMPRESSION;
>>> -+#endif
>>> -+#ifdef SSL_OP_CIPHER_SERVER_PREFERENCE
>>> -+    options |= SSL_OP_CIPHER_SERVER_PREFERENCE;
>>> -+#endif
>>> -+#ifdef SSL_OP_SINGLE_DH_USE
>>> -+    options |= SSL_OP_SINGLE_DH_USE;
>>> -+#endif
>>> -+#ifdef SSL_OP_SINGLE_ECDH_USE
>>> -+    options |= SSL_OP_SINGLE_ECDH_USE;
>>> -+#endif
>>> -     SSL_CTX_set_options(self->ctx, options);
>>> -
>>> -+    /* A bare minimum cipher list without completly broken cipher suites.
>>> -+     * It's far from perfect but gives users a better head start. */
>>> -+    if (proto_version != PY_SSL_VERSION_SSL2) {
>>> -+        result = SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNULL:!MD5");
>>> -+    } else {
>>> -+        /* SSLv2 needs MD5 */
>>> -+        result = SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNULL");
>>> -+    }
>>> -+    if (result == 0) {
>>> -+        Py_DECREF(self);
>>> -+        ERR_clear_error();
>>> -+        PyErr_SetString(PySSLErrorObject,
>>> -+                        "No cipher can be selected.");
>>> -+        return NULL;
>>> -+    }
>>> -+
>>> - #if defined(SSL_MODE_RELEASE_BUFFERS)
>>> -     /* Set SSL_MODE_RELEASE_BUFFERS. This potentially greatly reduces memory
>>> -        usage for no cost at all. However, don't do this for OpenSSL versions
>>> ---
>>> -2.17.1
>>> -
>>> diff --git a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
>>> deleted file mode 100644
>>> index 2b4ba316e4..0000000000
>>> --- a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
>>> +++ /dev/null
>>> @@ -1,40 +0,0 @@
>>> -From 98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 2001
>>> -From: Anuj Mittal <anuj.mittal@intel.com>
>>> -Date: Tue, 7 Aug 2018 16:43:17 +0800
>>> -Subject: [PATCH 2/2] Makefile: add target to split profile generation
>>> -
>>> -We don't want to have profile task invoked from here and want to use
>>> -qemu-user instead. Split the profile-opt task so qemu can be invoked
>>> -once binaries have been built with instrumentation and then we can go
>>> -ahead and build again using the profile data generated.
>>> -
>>> -Upstream-Status: Inappropriate [OE-specific]
>>> -
>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> ----
>>> - Makefile.pre.in | 6 ++----
>>> - 1 file changed, 2 insertions(+), 4 deletions(-)
>>> -
>>> -diff --git a/Makefile.pre.in b/Makefile.pre.in
>>> -index 84bc3ff..017a2c4 100644
>>> ---- a/Makefile.pre.in
>>> -+++ b/Makefile.pre.in
>>> -@@ -469,13 +469,12 @@ profile-opt:
>>> -     $(MAKE) profile-removal
>>> -     $(MAKE) build_all_generate_profile
>>> -     $(MAKE) profile-removal
>>> --    @echo "Running code to generate profile data (this can take a while):"
>>> --    $(MAKE) run_profile_task
>>> --    $(MAKE) build_all_merge_profile
>>> -+
>>> -+clean_and_use_profile:
>>> -     @echo "Rebuilding with profile guided optimizations:"
>>> -     $(MAKE) clean
>>> -     $(MAKE) build_all_use_profile
>>> -     $(MAKE) profile-removal
>>> -
>>> - build_all_generate_profile:
>>> -     $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
>>> ---
>>> -2.17.1
>>> -
>>> diff --git a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch b/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
>>> deleted file mode 100644
>>> index d48cad7586..0000000000
>>> --- a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
>>> +++ /dev/null
>>> @@ -1,227 +0,0 @@
>>> -From e950ea68dab006944af194c9910b8f2341d1437d Mon Sep 17 00:00:00 2001
>>> -From: Christian Heimes <christian@python.org>
>>> -Date: Thu, 7 Sep 2017 20:23:52 -0700
>>> -Subject: [PATCH] bpo-29136: Add TLS 1.3 cipher suites and OP_NO_TLSv1_3
>>> - (GH-1363) (#3444)
>>> -
>>> -* bpo-29136: Add TLS 1.3 support
>>> -
>>> -TLS 1.3 introduces a new, distinct set of cipher suites. The TLS 1.3
>>> -cipher suites don't overlap with cipher suites from TLS 1.2 and earlier.
>>> -Since Python sets its own set of permitted ciphers, TLS 1.3 handshake
>>> -will fail as soon as OpenSSL 1.1.1 is released. Let's enable the common
>>> -AES-GCM and ChaCha20 suites.
>>> -
>>> -Additionally the flag OP_NO_TLSv1_3 is added. It defaults to 0 (no op) with
>>> -OpenSSL prior to 1.1.1. This allows applications to opt-out from TLS 1.3
>>> -now.
>>> -
>>> -Signed-off-by: Christian Heimes <christian@python.org>.
>>> -(cherry picked from commit cb5b68abdeb1b1d56c581d5b4d647018703d61e3)
>>> -
>>> -Upstream-Status: Backport
>>> -[https://github.com/python/cpython/commit/cb5b68abdeb1b1d56c581d5b4d647018703d61e3]
>>> -
>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> ----
>>> - Doc/library/ssl.rst                           | 21 ++++++++++++++
>>> - Lib/ssl.py                                    |  7 +++++
>>> - Lib/test/test_ssl.py                          | 29 ++++++++++++++++++-
>>> - .../2017-09-04-16-39-49.bpo-29136.vSn1oR.rst  |  1 +
>>> - Modules/_ssl.c                                | 13 +++++++++
>>> - 5 files changed, 70 insertions(+), 1 deletion(-)
>>> - create mode 100644 Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
>>> -
>>> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
>>> -index 14f2d68217..29c5e94cf6 100644
>>> ---- a/Doc/library/ssl.rst
>>> -+++ b/Doc/library/ssl.rst
>>> -@@ -285,6 +285,11 @@ purposes.
>>> -
>>> -      3DES was dropped from the default cipher string.
>>> -
>>> -+   .. versionchanged:: 3.7
>>> -+
>>> -+     TLS 1.3 cipher suites TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384,
>>> -+     and TLS_CHACHA20_POLY1305_SHA256 were added to the default cipher string.
>>> -+
>>> -
>>> - Random generation
>>> - ^^^^^^^^^^^^^^^^^
>>> -@@ -719,6 +724,16 @@ Constants
>>> -
>>> -    .. versionadded:: 3.4
>>> -
>>> -+.. data:: OP_NO_TLSv1_3
>>> -+
>>> -+   Prevents a TLSv1.3 connection. This option is only applicable in conjunction
>>> -+   with :const:`PROTOCOL_TLS`. It prevents the peers from choosing TLSv1.3 as
>>> -+   the protocol version. TLS 1.3 is available with OpenSSL 1.1.1 or later.
>>> -+   When Python has been compiled against an older version of OpenSSL, the
>>> -+   flag defaults to *0*.
>>> -+
>>> -+   .. versionadded:: 3.7
>>> -+
>>> - .. data:: OP_CIPHER_SERVER_PREFERENCE
>>> -
>>> -    Use the server's cipher ordering preference, rather than the client's.
>>> -@@ -783,6 +798,12 @@ Constants
>>> -
>>> -    .. versionadded:: 3.3
>>> -
>>> -+.. data:: HAS_TLSv1_3
>>> -+
>>> -+   Whether the OpenSSL library has built-in support for the TLS 1.3 protocol.
>>> -+
>>> -+   .. versionadded:: 3.7
>>> -+
>>> - .. data:: CHANNEL_BINDING_TYPES
>>> -
>>> -    List of supported TLS channel binding types.  Strings in this list
>>> -diff --git a/Lib/ssl.py b/Lib/ssl.py
>>> -index 4d302a78fa..f233e72e1f 100644
>>> ---- a/Lib/ssl.py
>>> -+++ b/Lib/ssl.py
>>> -@@ -122,6 +122,7 @@ _import_symbols('OP_')
>>> - _import_symbols('ALERT_DESCRIPTION_')
>>> - _import_symbols('SSL_ERROR_')
>>> - _import_symbols('VERIFY_')
>>> -+from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN, HAS_TLSv1_3
>>> -
>>> - from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN
>>> -
>>> -@@ -162,6 +163,7 @@ else:
>>> - # (OpenSSL's default setting is 'DEFAULT:!aNULL:!eNULL')
>>> - # Enable a better set of ciphers by default
>>> - # This list has been explicitly chosen to:
>>> -+#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
>>> - #   * Prefer cipher suites that offer perfect forward secrecy (DHE/ECDHE)
>>> - #   * Prefer ECDHE over DHE for better performance
>>> - #   * Prefer AEAD over CBC for better performance and security
>>> -@@ -173,6 +175,8 @@ else:
>>> - #   * Disable NULL authentication, NULL encryption, 3DES and MD5 MACs
>>> - #     for security reasons
>>> - _DEFAULT_CIPHERS = (
>>> -+    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
>>> -+    'TLS13-AES-128-GCM-SHA256:'
>>> -     'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:DH+AES256:'
>>> -     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+HIGH:'
>>> -     '!aNULL:!eNULL:!MD5:!3DES'
>>> -@@ -180,6 +184,7 @@ _DEFAULT_CIPHERS = (
>>> -
>>> - # Restricted and more secure ciphers for the server side
>>> - # This list has been explicitly chosen to:
>>> -+#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
>>> - #   * Prefer cipher suites that offer perfect forward secrecy (DHE/ECDHE)
>>> - #   * Prefer ECDHE over DHE for better performance
>>> - #   * Prefer AEAD over CBC for better performance and security
>>> -@@ -190,6 +195,8 @@ _DEFAULT_CIPHERS = (
>>> - #   * Disable NULL authentication, NULL encryption, MD5 MACs, DSS, RC4, and
>>> - #     3DES for security reasons
>>> - _RESTRICTED_SERVER_CIPHERS = (
>>> -+    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
>>> -+    'TLS13-AES-128-GCM-SHA256:'
>>> -     'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:DH+AES256:'
>>> -     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+HIGH:'
>>> -     '!aNULL:!eNULL:!MD5:!DSS:!RC4:!3DES'
>>> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
>>> -index f91af7bd05..1acc12ec2d 100644
>>> ---- a/Lib/test/test_ssl.py
>>> -+++ b/Lib/test/test_ssl.py
>>> -@@ -150,6 +150,13 @@ class BasicSocketTests(unittest.TestCase):
>>> -             ssl.OP_NO_COMPRESSION
>>> -         self.assertIn(ssl.HAS_SNI, {True, False})
>>> -         self.assertIn(ssl.HAS_ECDH, {True, False})
>>> -+        ssl.OP_NO_SSLv2
>>> -+        ssl.OP_NO_SSLv3
>>> -+        ssl.OP_NO_TLSv1
>>> -+        ssl.OP_NO_TLSv1_3
>>> -+    if ssl.OPENSSL_VERSION_INFO >= (1, 0, 1):
>>> -+            ssl.OP_NO_TLSv1_1
>>> -+            ssl.OP_NO_TLSv1_2
>>> -
>>> -     def test_str_for_enums(self):
>>> -         # Make sure that the PROTOCOL_* constants have enum-like string
>>> -@@ -3028,12 +3035,33 @@ else:
>>> -                     self.assertEqual(s.version(), 'TLSv1')
>>> -                 self.assertIs(s.version(), None)
>>> -
>>> -+        @unittest.skipUnless(ssl.HAS_TLSv1_3,
>>> -+                             "test requires TLSv1.3 enabled OpenSSL")
>>> -+        def test_tls1_3(self):
>>> -+            context = ssl.SSLContext(ssl.PROTOCOL_TLS)
>>> -+            context.load_cert_chain(CERTFILE)
>>> -+            # disable all but TLS 1.3
>>> -+            context.options |= (
>>> -+                ssl.OP_NO_TLSv1 | ssl.OP_NO_TLSv1_1 | ssl.OP_NO_TLSv1_2
>>> -+            )
>>> -+            with ThreadedEchoServer(context=context) as server:
>>> -+                with context.wrap_socket(socket.socket()) as s:
>>> -+                    s.connect((HOST, server.port))
>>> -+                    self.assertIn(s.cipher()[0], [
>>> -+                        'TLS13-AES-256-GCM-SHA384',
>>> -+                        'TLS13-CHACHA20-POLY1305-SHA256',
>>> -+                        'TLS13-AES-128-GCM-SHA256',
>>> -+                    ])
>>> -+
>>> -         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled OpenSSL")
>>> -         def test_default_ecdh_curve(self):
>>> -             # Issue #21015: elliptic curve-based Diffie Hellman key exchange
>>> -             # should be enabled by default on SSL contexts.
>>> -             context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
>>> -             context.load_cert_chain(CERTFILE)
>>> -+            # TLSv1.3 defaults to PFS key agreement and no longer has KEA in
>>> -+            # cipher name.
>>> -+            context.options |= ssl.OP_NO_TLSv1_3
>>> -             # Prior to OpenSSL 1.0.0, ECDH ciphers have to be enabled
>>> -             # explicitly using the 'ECCdraft' cipher alias.  Otherwise,
>>> -             # our default cipher list should prefer ECDH-based ciphers
>>> -@@ -3394,7 +3422,6 @@ else:
>>> -                         s.sendfile(file)
>>> -                         self.assertEqual(s.recv(1024), TEST_DATA)
>>> -
>>> --
>>> - def test_main(verbose=False):
>>> -     if support.verbose:
>>> -         import warnings
>>> -diff --git a/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
>>> -new file mode 100644
>>> -index 0000000000..e76997ef83
>>> ---- /dev/null
>>> -+++ b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
>>> -@@ -0,0 +1 @@
>>> -+Add TLS 1.3 cipher suites and OP_NO_TLSv1_3.
>>> -diff --git a/Modules/_ssl.c b/Modules/_ssl.c
>>> -index 0d5c121d2c..c71d89607c 100644
>>> ---- a/Modules/_ssl.c
>>> -+++ b/Modules/_ssl.c
>>> -@@ -4842,6 +4842,11 @@ PyInit__ssl(void)
>>> - #if HAVE_TLSv1_2
>>> -     PyModule_AddIntConstant(m, "OP_NO_TLSv1_1", SSL_OP_NO_TLSv1_1);
>>> -     PyModule_AddIntConstant(m, "OP_NO_TLSv1_2", SSL_OP_NO_TLSv1_2);
>>> -+#endif
>>> -+#ifdef SSL_OP_NO_TLSv1_3
>>> -+    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", SSL_OP_NO_TLSv1_3);
>>> -+#else
>>> -+    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", 0);
>>> - #endif
>>> -     PyModule_AddIntConstant(m, "OP_CIPHER_SERVER_PREFERENCE",
>>> -                             SSL_OP_CIPHER_SERVER_PREFERENCE);
>>> -@@ -4890,6 +4895,14 @@ PyInit__ssl(void)
>>> -     Py_INCREF(r);
>>> -     PyModule_AddObject(m, "HAS_ALPN", r);
>>> -
>>> -+#if defined(TLS1_3_VERSION) && !defined(OPENSSL_NO_TLS1_3)
>>> -+    r = Py_True;
>>> -+#else
>>> -+    r = Py_False;
>>> -+#endif
>>> -+    Py_INCREF(r);
>>> -+    PyModule_AddObject(m, "HAS_TLSv1_3", r);
>>> -+
>>> -     /* Mappings for error codes */
>>> -     err_codes_to_names = PyDict_New();
>>> -     err_names_to_codes = PyDict_New();
>>> ---
>>> -2.17.1
>>> -
>>> diff --git a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch b/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
>>> deleted file mode 100644
>>> index 56d591d1b5..0000000000
>>> --- a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
>>> +++ /dev/null
>>> @@ -1,173 +0,0 @@
>>> -From 170a614904febd14ff6cfd7a75c9bccc114b3948 Mon Sep 17 00:00:00 2001
>>> -From: Christian Heimes <christian@python.org>
>>> -Date: Tue, 14 Aug 2018 16:56:32 +0200
>>> -Subject: [PATCH] bpo-32947: Fixes for TLS 1.3 and OpenSSL 1.1.1 (GH-8761)
>>> -
>>> -Backport of TLS 1.3 related fixes from 3.7.
>>> -
>>> -Misc fixes and workarounds for compatibility with OpenSSL 1.1.1 from git
>>> -master and TLS 1.3 support. With OpenSSL 1.1.1, Python negotiates TLS 1.3 by
>>> -default. Some test cases only apply to TLS 1.2.
>>> -
>>> -OpenSSL 1.1.1 has added a new option OP_ENABLE_MIDDLEBOX_COMPAT for TLS
>>> -1.3. The feature is enabled by default for maximum compatibility with
>>> -broken middle boxes. Users should be able to disable the hack and CPython's test suite needs
>>> -it to verify default options
>>> -
>>> -Signed-off-by: Christian Heimes <christian@python.org>
>>> -
>>> -Upstream-Status: Backport
>>> -[https://github.com/python/cpython/commit/2a4ee8aa01d61b6a9c8e9c65c211e61bdb471826]
>>> -
>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> ----
>>> - Doc/library/ssl.rst                           |  9 ++++++
>>> - Lib/test/test_asyncio/test_events.py          |  6 +++-
>>> - Lib/test/test_ssl.py                          | 29 +++++++++++++++----
>>> - .../2018-08-14-08-57-01.bpo-32947.mqStVW.rst  |  2 ++
>>> - Modules/_ssl.c                                |  4 +++
>>> - 5 files changed, 44 insertions(+), 6 deletions(-)
>>> - create mode 100644 Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
>>> -
>>> -diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
>>> -index 29c5e94cf6..f63a3deec5 100644
>>> ---- a/Doc/library/ssl.rst
>>> -+++ b/Doc/library/ssl.rst
>>> -@@ -757,6 +757,15 @@ Constants
>>> -
>>> -    .. versionadded:: 3.3
>>> -
>>> -+.. data:: OP_ENABLE_MIDDLEBOX_COMPAT
>>> -+
>>> -+   Send dummy Change Cipher Spec (CCS) messages in TLS 1.3 handshake to make
>>> -+   a TLS 1.3 connection look more like a TLS 1.2 connection.
>>> -+
>>> -+   This option is only available with OpenSSL 1.1.1 and later.
>>> -+
>>> -+   .. versionadded:: 3.6.7
>>> -+
>>> - .. data:: OP_NO_COMPRESSION
>>> -
>>> -    Disable compression on the SSL channel.  This is useful if the application
>>> -diff --git a/Lib/test/test_asyncio/test_events.py b/Lib/test/test_asyncio/test_events.py
>>> -index 492a84a231..6f208474b9 100644
>>> ---- a/Lib/test/test_asyncio/test_events.py
>>> -+++ b/Lib/test/test_asyncio/test_events.py
>>> -@@ -1169,7 +1169,11 @@ class EventLoopTestsMixin:
>>> -                     self.loop.run_until_complete(f_c)
>>> -
>>> -         # close connection
>>> --        proto.transport.close()
>>> -+        # transport may be None with TLS 1.3, because connection is
>>> -+        # interrupted, server is unable to send session tickets, and
>>> -+        # transport is closed.
>>> -+        if proto.transport is not None:
>>> -+            proto.transport.close()
>>> -         server.close()
>>> -
>>> -     def test_legacy_create_server_ssl_match_failed(self):
>>> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
>>> -index 1acc12ec2d..a2e1d32a62 100644
>>> ---- a/Lib/test/test_ssl.py
>>> -+++ b/Lib/test/test_ssl.py
>>> -@@ -78,6 +78,7 @@ OP_NO_COMPRESSION = getattr(ssl, "OP_NO_COMPRESSION", 0)
>>> - OP_SINGLE_DH_USE = getattr(ssl, "OP_SINGLE_DH_USE", 0)
>>> - OP_SINGLE_ECDH_USE = getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
>>> - OP_CIPHER_SERVER_PREFERENCE = getattr(ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
>>> -+OP_ENABLE_MIDDLEBOX_COMPAT = getattr(ssl, "OP_ENABLE_MIDDLEBOX_COMPAT", 0)
>>> -
>>> -
>>> - def handle_error(prefix):
>>> -@@ -155,8 +156,8 @@ class BasicSocketTests(unittest.TestCase):
>>> -         ssl.OP_NO_TLSv1
>>> -         ssl.OP_NO_TLSv1_3
>>> -     if ssl.OPENSSL_VERSION_INFO >= (1, 0, 1):
>>> --            ssl.OP_NO_TLSv1_1
>>> --            ssl.OP_NO_TLSv1_2
>>> -+        ssl.OP_NO_TLSv1_1
>>> -+        ssl.OP_NO_TLSv1_2
>>> -
>>> -     def test_str_for_enums(self):
>>> -         # Make sure that the PROTOCOL_* constants have enum-like string
>>> -@@ -854,7 +855,8 @@ class ContextTests(unittest.TestCase):
>>> -         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
>>> -         # SSLContext also enables these by default
>>> -         default |= (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERENCE |
>>> --                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
>>> -+                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE |
>>> -+                    OP_ENABLE_MIDDLEBOX_COMPAT)
>>> -         self.assertEqual(default, ctx.options)
>>> -         ctx.options |= ssl.OP_NO_TLSv1
>>> -         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
>>> -@@ -1860,11 +1862,26 @@ else:
>>> -                         self.sock, server_side=True)
>>> -                     self.server.selected_npn_protocols.append(self.sslconn.selected_npn_protocol())
>>> -                     self.server.selected_alpn_protocols.append(self.sslconn.selected_alpn_protocol())
>>> --                except (ssl.SSLError, ConnectionResetError) as e:
>>> -+                except (ConnectionResetError, BrokenPipeError) as e:
>>> -                     # We treat ConnectionResetError as though it were an
>>> -                     # SSLError - OpenSSL on Ubuntu abruptly closes the
>>> -                     # connection when asked to use an unsupported protocol.
>>> -                     #
>>> -+                    # BrokenPipeError is raised in TLS 1.3 mode, when OpenSSL
>>> -+                    # tries to send session tickets after handshake.
>>> -+                    # https://github.com/openssl/openssl/issues/6342
>>> -+                    self.server.conn_errors.append(str(e))
>>> -+                    if self.server.chatty:
>>> -+                        handle_error(
>>> -+                            "\n server:  bad connection attempt from " + repr(
>>> -+                                self.addr) + ":\n")
>>> -+                    self.running = False
>>> -+                    self.close()
>>> -+                    return False
>>> -+                except (ssl.SSLError, OSError) as e:
>>> -+                    # OSError may occur with wrong protocols, e.g. both
>>> -+                    # sides use PROTOCOL_TLS_SERVER.
>>> -+                    #
>>> -                     # XXX Various errors can have happened here, for example
>>> -                     # a mismatching protocol version, an invalid certificate,
>>> -                     # or a low-level bug. This should be made more discriminating.
>>> -@@ -2974,7 +2991,7 @@ else:
>>> -                 # Block on the accept and wait on the connection to close.
>>> -                 evt.set()
>>> -                 remote, peer = server.accept()
>>> --                remote.recv(1)
>>> -+                remote.send(remote.recv(4))
>>> -
>>> -             t = threading.Thread(target=serve)
>>> -             t.start()
>>> -@@ -2982,6 +2999,8 @@ else:
>>> -             evt.wait()
>>> -             client = context.wrap_socket(socket.socket())
>>> -             client.connect((host, port))
>>> -+            client.send(b'data')
>>> -+            client.recv()
>>> -             client_addr = client.getsockname()
>>> -             client.close()
>>> -             t.join()
>>> -diff --git a/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
>>> -new file mode 100644
>>> -index 0000000000..28de360c36
>>> ---- /dev/null
>>> -+++ b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
>>> -@@ -0,0 +1,2 @@
>>> -+Add OP_ENABLE_MIDDLEBOX_COMPAT and test workaround for TLSv1.3 for future
>>> -+compatibility with OpenSSL 1.1.1.
>>> -diff --git a/Modules/_ssl.c b/Modules/_ssl.c
>>> -index c71d89607c..eb123a87ba 100644
>>> ---- a/Modules/_ssl.c
>>> -+++ b/Modules/_ssl.c
>>> -@@ -4858,6 +4858,10 @@ PyInit__ssl(void)
>>> -     PyModule_AddIntConstant(m, "OP_NO_COMPRESSION",
>>> -                             SSL_OP_NO_COMPRESSION);
>>> - #endif
>>> -+#ifdef SSL_OP_ENABLE_MIDDLEBOX_COMPAT
>>> -+    PyModule_AddIntConstant(m, "OP_ENABLE_MIDDLEBOX_COMPAT",
>>> -+                            SSL_OP_ENABLE_MIDDLEBOX_COMPAT);
>>> -+#endif
>>> -
>>> - #if HAVE_SNI
>>> -     r = Py_True;
>>> ---
>>> -2.17.1
>>> -
>>> diff --git a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch b/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
>>> deleted file mode 100644
>>> index b97d5501e1..0000000000
>>> --- a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
>>> +++ /dev/null
>>> @@ -1,110 +0,0 @@
>>> -From 0c9354362bfa5f90fbea8ff8237a1f1f5dba686f Mon Sep 17 00:00:00 2001
>>> -From: Christian Heimes <christian@python.org>
>>> -Date: Wed, 12 Sep 2018 15:20:31 +0800
>>> -Subject: [PATCH] bpo-33570: TLS 1.3 ciphers for OpenSSL 1.1.1 (GH-6976)
>>> -
>>> -Change TLS 1.3 cipher suite settings for compatibility with OpenSSL
>>> -1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by
>>> -default.
>>> -
>>> -Also update multissltests and Travis config to test with latest OpenSSL.
>>> -
>>> -Signed-off-by: Christian Heimes <christian@python.org>
>>> -(cherry picked from commit e8eb6cb7920ded66abc5d284319a8539bdc2bae3)
>>> -
>>> -Co-authored-by: Christian Heimes <christian@python.org
>>> -
>>> -Upstream-Status: Backport
>>> -[https://github.com/python/cpython/commit/3e630c541b35c96bfe5619165255e559f577ee71]
>>> -
>>> -Tweaked patch to not take changes for multissltests and Travis config.
>>> -
>>> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> ----
>>> - Lib/test/test_ssl.py | 51 ++++++++++++++++++++++----------------------
>>> - 1 file changed, 26 insertions(+), 25 deletions(-)
>>> -
>>> -diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
>>> -index a2e1d32a62..c484ead5ff 100644
>>> ---- a/Lib/test/test_ssl.py
>>> -+++ b/Lib/test/test_ssl.py
>>> -@@ -3024,17 +3024,21 @@ else:
>>> -                     sock.do_handshake()
>>> -                 self.assertEqual(cm.exception.errno, errno.ENOTCONN)
>>> -
>>> --        def test_default_ciphers(self):
>>> --            context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
>>> --            try:
>>> --                # Force a set of weak ciphers on our client context
>>> --                context.set_ciphers("DES")
>>> --            except ssl.SSLError:
>>> --                self.skipTest("no DES cipher available")
>>> --            with ThreadedEchoServer(CERTFILE,
>>> --                                    ssl_version=ssl.PROTOCOL_SSLv23,
>>> --                                    chatty=False) as server:
>>> --                with context.wrap_socket(socket.socket()) as s:
>>> -+        def test_no_shared_ciphers(self):
>>> -+            server_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
>>> -+            server_context.load_cert_chain(SIGNED_CERTFILE)
>>> -+            client_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
>>> -+            client_context.verify_mode = ssl.CERT_REQUIRED
>>> -+            client_context.check_hostname = True
>>> -+
>>> -+            client_context.set_ciphers("AES128")
>>> -+            server_context.set_ciphers("AES256")
>>> -+            # OpenSSL enables all TLS 1.3 ciphers, enforce TLS 1.2 for test
>>> -+            client_context.options |= ssl.OP_NO_TLSv1_3
>>> -+            with ThreadedEchoServer(context=server_context) as server:
>>> -+                with client_context.wrap_socket(
>>> -+                        socket.socket(),
>>> -+                        server_hostname="localhost") as s:
>>> -                     with self.assertRaises(OSError):
>>> -                         s.connect((HOST, server.port))
>>> -             self.assertIn("no shared cipher", str(server.conn_errors[0]))
>>> -@@ -3067,9 +3071,9 @@ else:
>>> -                 with context.wrap_socket(socket.socket()) as s:
>>> -                     s.connect((HOST, server.port))
>>> -                     self.assertIn(s.cipher()[0], [
>>> --                        'TLS13-AES-256-GCM-SHA384',
>>> --                        'TLS13-CHACHA20-POLY1305-SHA256',
>>> --                        'TLS13-AES-128-GCM-SHA256',
>>> -+                        'TLS_AES_256_GCM_SHA384',
>>> -+                        'TLS_CHACHA20_POLY1305_SHA256',
>>> -+                        'TLS_AES_128_GCM_SHA256',
>>> -                     ])
>>> -
>>> -         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled OpenSSL")
>>> -@@ -3391,22 +3395,19 @@ else:
>>> -             client_context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
>>> -             client_context.verify_mode = ssl.CERT_REQUIRED
>>> -             client_context.load_verify_locations(SIGNING_CA)
>>> --            if ssl.OPENSSL_VERSION_INFO >= (1, 0, 2):
>>> --                client_context.set_ciphers("AES128:AES256")
>>> --                server_context.set_ciphers("AES256")
>>> --                alg1 = "AES256"
>>> --                alg2 = "AES-256"
>>> --            else:
>>> --                client_context.set_ciphers("AES:3DES")
>>> --                server_context.set_ciphers("3DES")
>>> --                alg1 = "3DES"
>>> --                alg2 = "DES-CBC3"
>>> -+            client_context.set_ciphers("AES128:AES256")
>>> -+            server_context.set_ciphers("AES256")
>>> -+            expected_algs = [
>>> -+                "AES256", "AES-256",
>>> -+                 # TLS 1.3 ciphers are always enabled
>>> -+                 "TLS_CHACHA20", "TLS_AES",
>>> -+            ]
>>> -
>>> -             stats = server_params_test(client_context, server_context)
>>> -             ciphers = stats['server_shared_ciphers'][0]
>>> -             self.assertGreater(len(ciphers), 0)
>>> -             for name, tls_version, bits in ciphers:
>>> --                if not alg1 in name.split("-") and alg2 not in name:
>>> -+                if not any (alg in name for alg in expected_algs):
>>> -                     self.fail(name)
>>> -
>>> -         def test_read_write_after_close_raises_valuerror(self):
>>> ---
>>> -2.17.1
>>> -
>>> diff --git a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch b/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
>>> deleted file mode 100644
>>> index d609847204..0000000000
>>> --- a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
>>> +++ /dev/null
>>> @@ -1,68 +0,0 @@
>>> -From 7b40cb7293cb14e5c7c8ed123efaf9acb33edae2 Mon Sep 17 00:00:00 2001
>>> -From: Christian Heimes <christian@python.org>
>>> -Date: Tue, 15 Aug 2017 10:33:43 +0200
>>> -Subject: [PATCH] bpo-30714: ALPN changes for OpenSSL 1.1.0f (#2305)
>>> -
>>> -OpenSSL 1.1.0 to 1.1.0e aborted the handshake when server and client
>>> -could not agree on a protocol using ALPN. OpenSSL 1.1.0f changed that.
>>> -The most recent version now behaves like OpenSSL 1.0.2 again. The ALPN
>>> -callback can pretend to not been set.
>>> -
>>> -See https://github.com/openssl/openssl/pull/3158 for more details
>>> -
>>> -Signed-off-by: Christian Heimes <christian@python.org>
>>> -
>>> -Upstream-Status: Backport
>>> -[https://github.com/python/cpython/commit/7b40cb7293cb14e5c7c8ed123efaf9acb33edae2]

