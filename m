Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0067.outbound.protection.outlook.com [104.47.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB9AA600EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cE3TvHa9qOfdwQ+axKabuTSaoJxs9WUsAMw1nCuOxbs=;
	b=JbEUgCqksieH57Jku8GkshlVPipbxh29y8uivGpZVazdFu1gMAo8o/SsqfrcQIWU/Jni2DdOTr8c4Io0KlmBuoYd7dR5KcYFSpfoGsU6cweIqgYlxL4jAMHZRM/tWFSRrobHgy3tSOp3M45MtNDZzKsx7yQoeX1fx95luX11ijo=
Received: from BY2PR02CA0044.namprd02.prod.outlook.com (10.141.216.34) by
	CY1PR02MB1382.namprd02.prod.outlook.com (10.161.171.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.977.11; Mon, 20 Mar 2017 11:29:05 +0000
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by BY2PR02CA0044.outlook.office365.com
	(2a01:111:e400:2c40::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.977.11 via
	Frontend Transport; Mon, 20 Mar 2017 11:29:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.977.7
	via Frontend Transport; Mon, 20 Mar 2017 11:29:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:43882
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cpvUk-0006Nj-Ir; Mon, 20 Mar 2017 04:29:02 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cpvUk-0006Md-FP; Mon, 20 Mar 2017 04:29:02 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v2KBT1qP017384; Mon, 20 Mar 2017 04:29:02 -0700
Received: from [172.19.131.26] (helo=XSJ-PVEXCAS02.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <MANJUKUM@xilinx.com>)
	id 1cpvUj-0006MW-Rg; Mon, 20 Mar 2017 04:29:01 -0700
Received: from XSJ-PSEXMBX01.xlnx.xilinx.com ([fe80::c4cc:6661:8e92:58bf]) by
	XSJ-PVEXCAS02.xlnx.xilinx.com ([::1]) with mapi id 14.03.0319.002;
	Mon, 20 Mar 2017 04:29:01 -0700
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
To: Robert Yang <liezhi.yang@windriver.com>, Stefano Babic <sbabic@denx.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/5] file: 5.29 -> 5.30
Thread-Index: AQHSjK1sofxLXsrBbE+5auXQQ2F0I6GeELIAgAAIOID//6d18A==
Date: Mon, 20 Mar 2017 11:29:00 +0000
Message-ID: <14EB1FFCA0C8D24A8B04EDEC1EA78C2458A130E3@XSJ-PSEXMBX01.xlnx.xilinx.com>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
	<2702bdc3f6961ba31689d97d67e900f9865d40ee.1487727826.git.liezhi.yang@windriver.com>
	<ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
	<490a19b0-0d48-c090-685f-1edf1e017c4b@windriver.com>
In-Reply-To: <490a19b0-0d48-c090-685f-1edf1e017c4b@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.92.111]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-22952.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39840400002)(39450400003)(2980300002)(438002)(377454003)(199003)(189002)(24454002)(13464003)(9170700003)(93886004)(97756001)(50986999)(54356999)(76176999)(3846002)(6116002)(102836003)(229853002)(106466001)(305945005)(7736002)(33656002)(63266004)(189998001)(47776003)(2920100001)(2900100001)(2501003)(6306002)(55846006)(5660300001)(5890100001)(46406003)(38730400002)(966004)(2906002)(7696004)(2950100002)(8676002)(81166006)(53546008)(8936002)(8746002)(575784001)(55016002)(1720100001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1382; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT029;
	1:1bj1F/2gKhzqC0QAymK5s5AGSquqIJry0/YAO0n+O72GH3vkPq08s7n0h3t+5DIaAIIhpAzuH0pHDinsO7NTQMUWWyqRtaBGCRAGqRTPsqhKT2aYrYs51OpxPFQJ2mSVTMMzyK1g6S1sk5pNpz98DtnbQjTeuwSnhBXyB6+n8xLidDEkbctvwCD2d03vw+SjJkYg+bkVY5WE1rXwP60DKKTTmkRGL/O9M3iRCehcIJIjnDwgxjuqENVRyZ4QNteDDrbscb9MoFf1qY0is/KCjRD6v6/qE14P2jJovm7kukxdyBdcVtFgHLsENN3IqBNWYt0PeceeA/B9/yc1QoO3rE+vb+ugBEvVmIoz9aOQvbdud8Vli3dJ+557eDIq2Mm/S2CxcaL9yVexLV04VoyLOgBZQOvigQaPEgGi+vy6w94I81kN9lNo0CcKbyX6JLNI1/AqHT3AZ7mP5NfgTioJkfs1NW0bMK/1m65KhcPwKOReAU/hYXv5sFhJoApTamp1re+i+GblbI821TKVLcKOeAVYj0PUyZVpIVPWbUaSGd9Axl/SelZZR/mrXIyo7bCF3I1vomNQGdK6hZOjGPPUrQ==
X-MS-Office365-Filtering-Correlation-Id: 45bfe10b-f386-4ce7-792f-08d46f845048
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(2017030254075); SRVR:CY1PR02MB1382; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1382;
	3:Zt1HVvFrZ/istvfu790B059aVdi/UTiSDzzJy2Ughy5QNmqLREMVxaOCKNKENBj1X/oH8/I2KjSvzxqDXGEAV0x+wmK8BDvY3yfJl4O0ZLFTKR7NJEvcE/32tfesrU5uoBkTIwcky/W99fdpiRwrr7M+b41f7Mgw3nzmYwwMSPekDgB1WCRCfQ/ERiLFg22p9rCHs2tGRsszdDKGhz698f9ys80dIWMrhkkPzwRau97KvAYdyFpMO8yzvs+6o4PKa6Vb810rtTu4U1aZn9xjZf5Z9TII/Vcx3zP/4pgA39bLTHmYHpDih5SIN0M1oSU2ptiOmdt/Nc+lNKb2dV4j0BhsvdxVmq6NGPbnNgU0t8piG1ihNRT6ZgR/Pvi/ixyOhEMm4t7+mwBN2gjdRVKgPJ/EVQvR9LiHWr12K1bdb5J6Ptir2zv+cRgacJsPBAUD;
	25:QQIgZPBSORe6C/+y2ysrJD6er/QJ+ji9S08oWH0/S22FGnjKWrsBljtx3cXeeaKGJ0GQ/wcSdbajo3emPzdH/X+A0NyEJSS8jJT85904wSDkkTwmOi3F1hVoJHxRmPUu0PPTY3Mu3Z4XjlQX0RTK8bdhxjoIuFm2zHqQsqixLTsFS0Wjie4KjKO28vFwLKZytJfqvuRreYTeWzuN+SyUUEPB7xW1WuidOBOqUpZlWTzX0d+oWUvdlBd3oUUn0XlROUYXXLiU1+D9OZUSrLeS16DXoS9FPVfQw8Ds2IF9X8BW4hzByP1IcUN1OMLyq2+85/TWK+/oQb002rg6FYWMi6v4En3o1MZezNr+TSD0q6TLapqwfEES5uUU4O+jQ1oSEwUJTGJV5zwc1dSjyyTWW0FF6t2I657q+/asw1Tp/zdANcYf+SqxTfLbnFcpPQR3pyuanLkB4rtk/gmrvBUvOg==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1382;
	31:8nk03e/5BFBaYui7r/LXMB9RiFJc890CCMtJdizunHqWEwp1yQdr0j6P4vPfUSU2IdGPzXzwx9Fp1uKoYFmSKLx/qF+iLTfvBYwh0OUB2gZhYbDZ43cNj9YhdiFtcAjil+C+5I7H0mRbgjjCJKzTUeIroR0C9uNCAYt/6q+9/A4O4FQJPWRjQPA2rzC/vMoyMAZqWBPytd8o3ZuChxd+zicFlkU8/7jUxZ5uDbq3NldDF0UmIGLj0yLypfjT79tfYzJlWUIOV6RfrSBrRTx5AwhXLrx0WK+nRrOl1/kO/ic=;
	20:zU6Xb/rnf4uaBBhx2crSgX378fyMYftBvsmypQu/nENkLqmN4IRgEFkudmwvSkQTWMd3ARhB5T2Jr4+bT375uIqKapp2p02VigzDxMoumrczUyJRLHflOzZeFs9IyXWM3Nga1wGl4Y0yrwtGS5RhEv5+LMmq+vNns6ka85FQrlaMIHC55CeMf+6fL+FozXVwQr1MIpuzmKoQLUy4u7cM2Twee+IfWYn263EIWrl8BdUxt7UcfNIW7p72tJKwSULjjnKz8HJHBMfNnEo1TI5hpdDvwZHapd5SOL8OSX0aYtsXdc2a9u6MzpGJnFUznIyKVh0j2wN9BR7u9tvvrZK2LtFPRrpgLi2ldrMKNVn7tdtORlnuTPGs85VOT2eJ95DnGBs2aP61j6x+OTYlYiZT6cs2oOaeDi5xXWDJ17xkWlyFX6MbfcO9eDxwv/6YHV3tQaeaPkgnrDDpYrdPP1ia9H0kQezBxn7lf4Np8f++QZz7In34lxrP00g4lv2KYah4
X-Microsoft-Antispam-PRVS: <CY1PR02MB1382D75AE0A3DC8C76E6EA2DB93A0@CY1PR02MB1382.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13015025)(5005006)(13017025)(8121501046)(13018025)(13023025)(13024025)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123564025)(20161123560025)(20161123555025)(20161123558025)(6072148);
	SRVR:CY1PR02MB1382; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1382; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1382;
	4:z2xzFpO5DozoH94mKSjatKuVWiGXP5okoyDcne3U8oLEpeiA2sSJZxU6cw3ytFRVnrDGsaPjzHgqDoArc6rsByDeIJ4h6jtuphd4WbPulZZ8FTKXktD5wWWYUWkSdrQYRn/PXVkd6ivAIoAKD06A0stBXwG1evbd0zq2shUETu33Pbu7uCW/YQtbxxHKQfsZ3yZc6D/d60Y8RbKwEee2H5w3NtYwVtXvLcfcyxdAQ9eAgZZ/S+w2jXLr+1KctqNy9w3/uZLRShFHmNpeSLffyHKSlb9FSpmyCQVldss0C6YQkTk6DwpFpN4Mur9c7KUtKOm2EnDAMA8SVUbqtrK748H9AcsC23Dui9YY+DGGpnOuWa6UWxGBn5zj/BbULI4AGngrBNQIEWfHqO/89h13/k17BaJLw/fWkdCbrrzwYjz8pOoZDHPO2B+ace3kDsi/RicPoUXA9Wsmsfr44mRSXjx+LYXEBxvMo26TOO695/EGgFE+gx8vBFl2IxxBIKs97tilhrnv1nJ5f2PyO6HDN8k7S9FCXK9EponHqf35Cl6z96gj5Z08v74+LKAsB5vLNq3MBpq7qZngsYRn/jpAr8E+vztk1eNKVx8E5WJrDhSNR27dPwIuPuamqCsPIT9XUnj8V4MeV9sY9YOyDBJXFX0aph7xaw95aUrNhmLbkP8eKoW1U9hmQ3DTBjWLL0g8nc65GA7LIbeFd9H+OCyaQSBFouKzQgU9ix8WwB5uo5zDg6Ioztn+3HumUck7lDuQqxZUvfOcgf3sdApePZbD+nKWzGwX9ODGVhxqxjmnNcw=
X-Forefront-PRVS: 02524402D6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1382;
	23:mdVOKF2mkxYGv5QjhFu/Hw+01mASsEPRDgf/NKPQu?=
	=?us-ascii?Q?FzMP+B5Fsr4yJ+yZoPISY4rWnpdq6V1ZzeHNVKGKbQrXeH3M+fiJdwy1vPCX?=
	=?us-ascii?Q?8mNc9ftoAmHjHxQ/HXcxhjecWL2RTMVNQ2BsW2XIAhWR3XWX6Z6+9sqHDubk?=
	=?us-ascii?Q?J6C9jqw7a4hwDnE4GPmbLnvPVeqbqHCoaDDq+2qMTLBAvGGO7Kf4IEOY3tOl?=
	=?us-ascii?Q?O7WlNcJFavrA8Ml55E4YCeST0BsVfMIJYcU0jdlTm9gZbzux74GHKjUU7bdp?=
	=?us-ascii?Q?olynLrNdUdhQuZkRiqhX2Fb3Uy7ebkywrEPypPIUCZ5kZsI8BFiefz1z5/Zc?=
	=?us-ascii?Q?0R/FRxl9mZ7UTs5ADRQGX0cxhkDEt1YJJHljPNmkNdEoOY8EKypTTOSc8pqK?=
	=?us-ascii?Q?Q6kRn8j53GBNezSkV3ISuq7zSnUTVmNnwjBviybgj5rDQI2sxNJjJJ85u5+3?=
	=?us-ascii?Q?dBP3JQ64TIvDzPR2MdRwG8Z6f/u7KY79QKc32Ck4CEb5vSJUs/YN1kmf67ZC?=
	=?us-ascii?Q?24eKmfhbxOlA4OyYzGQVNBOVUfMxxExsfe+P0uyLBqKCR4UE7GUEfKSCDpE9?=
	=?us-ascii?Q?IeukoZt+eUV0aWzWquBKEs4X6pTg4SZE1xs+zQIQzxvkwHCoJfavcVQ1So2w?=
	=?us-ascii?Q?NiEac45v1UF5e0z3IF0yADKCqTHoREAMOQXrkC5/07rirS5AK5G52bPcdNzx?=
	=?us-ascii?Q?NBC6W3F/1JhvTUuEseFeIy2xVGVGP9GoS52MfyVmSm0Ll4NA8j1+ToK70roX?=
	=?us-ascii?Q?aL5aGDv8Yy4sHlh5tV3jS6e3JThuE0xqpP9+WwNFmjB8m8zmyY2sMxkXfHMn?=
	=?us-ascii?Q?n8d7ITEa9gPNRf1zAFxkFbH+Ttzsm0L43+guX/gUs8H/sXCN0/VpccqXqWOR?=
	=?us-ascii?Q?P9BBLWWmGAWf13JCZ8sjldJh7hozBp8UdsbdA6S9Haqqjp6xJR1/6NVA6Gxi?=
	=?us-ascii?Q?rm1mtI5euhq36lZBKj68Pzj9AE3RMN5xUaLTEDNxvXeL+akYYeZdCbCJ0as1?=
	=?us-ascii?Q?xbE8y8YANoMkUN8O2TOe/EPDmWJUGkevXxjTldayq8c1fgS1qyvG6b0icx5P?=
	=?us-ascii?Q?MH/x4XPuzjQkINQ9Nw6Tt0K4bCb6Wmtr8CYU3yCqAnYOzj2CQpXvlkwTmyEN?=
	=?us-ascii?Q?Qy6PWd493mg8LSSmQYVrV6n9cnykAyvTBNfxAqEXUHxHya3AMglVHlmVi7mQ?=
	=?us-ascii?Q?I+YdyGjPzk049k=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1382;
	6:w66ikbLzVph7DyH0Qu/Spb6PLIsLmqgDQ/TPoX6Lb22jnEk5+EYTakRLibXiTJixxiHdgqIpgz1IXVOj07QxxVTbhCIfO2qx+IGu5ADUqY0uQM2diTB5FMmuTsSuCjXdR5dq2aubYacHxjAM2oRmMee38LQaGvc2suWzky7QCg8AvnDb/ZvlXN47l2LL+BwEUbOJc7Y0qvp2KHilMpauFtpe5h4w4Zqv8UxZ+RySaQqm9qGR4Q6BuelwwjM680aL874IQuhZGTiGfMGZN2eC/EFCfMJSLbJmflEVSdgWTMbS+/aJLiTXOF2fvx8qrGvJe61aym/HaWWDu8KDAU7J7JzyQ4tqOMFeT7hUZe3ocLyhXl9DwNCT6SeTENc5WgJ+YAbdpqHjn9esugq/DIV6dw8L2OB5BAlYri4WvGXrl6A=;
	5:HLhZAwYzkkR1VvvAPM1xMur+AYWXTLkr32oUjDVX5OVr0ke6MFiPIUKzRP04ovVTO4jVyoNpiNb6yXDdJtUw9Mz84apwduNCtW5/qbKnDzGwHcPe2nkunLi+ERChrWSLBG6zfwOS3Z0Ct3SytXijZ7InK7mgv+3S5gP4Go1K5rk=;
	24:IFWeInVP42RDkiC8bxeAS66WiJODNk9MHgXZK0Te7mTxot8UFjgfra/n0g371o6HpWHFNHDLEQc3CXr9kKnYAuNPxnrbnAI+SnKJcCZbF9c=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1382;
	7:pf0PUE/vMymWQj6DP6lsdBjFGfQSW6cXKRotZHL9R1Z+v5LAvfDq6lNkaLpwig/gQ6psC3yNm/+K8RxhE6847NLQY8V+DnBnBCvy5eZAEJNCRDTFyGF1b7TcHDWxrv1iYzINNMvVJDhispraAklvM/JaIR5PY7xlEyrK0Zf5CP8GkAvD8bO5sCWlxtchte3ihMupogbopMX5hQTE4klo/53yGoZZLqkOnGUMF95Srxn/fCS04uXSdRQLe0gQTofStlLWzuHvQxFZIcC5p0Byw5tj1IIBdbesXZuXciqGpso6KKf3rieXLWYcBinQGWLEnuPSruphdqKCzEJjJGcOxw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2017 11:29:03.6719 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1382
Subject: Re: [PATCH 5/5] file: 5.29 -> 5.30
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
X-List-Received-Date: Mon, 20 Mar 2017 11:29:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Robert Yang
> Sent: Monday, March 20, 2017 3:14 PM
> To: Stefano Babic; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 5/5] file: 5.29 -> 5.30
>
> Yes, file's upstream commit ID has changed, Paul has sent a patch for it:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2017-
> March/134261.html
>

Is it better to use nobranch=3D1 ?
Changes in this file.git has broken Morty as well, we used nobranch=3D1 to =
resolve this issue.
I haven't tested this for other released versions of Yocto.

Thanks
Manju

> // Robert
>
> On 03/20/2017 05:14 PM, Stefano Babic wrote:
> > On 22/02/2017 02:44, Robert Yang wrote:
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>  meta/recipes-devtools/file/{file_5.29.bb =3D> file_5.30.bb} | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>  rename meta/recipes-devtools/file/{file_5.29.bb =3D> file_5.30.bb} (9=
6%)
> >>
> >> diff --git a/meta/recipes-devtools/file/file_5.29.bb b/meta/recipes-
> devtools/file/file_5.30.bb
> >> similarity index 96%
> >> rename from meta/recipes-devtools/file/file_5.29.bb
> >> rename to meta/recipes-devtools/file/file_5.30.bb
> >> index 29af8748150..0998fcfa899 100644
> >> --- a/meta/recipes-devtools/file/file_5.29.bb
> >> +++ b/meta/recipes-devtools/file/file_5.30.bb
> >> @@ -19,7 +19,7 @@ SRC_URI =3D "git://github.com/file/file.git \
> >>          file://0001-Add-P-prompt-into-Usage-info.patch \
> >>          "
> >>
> >> -SRCREV =3D "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> >> +SRCREV =3D "79814950aafb81ecd6a910c2a8a3b8ec12f3e4a6"
> >>  S =3D "${WORKDIR}/git"
> >>
> >>  inherit autotools
> >>
> >
> > Strange enough, it seems that the tree loses the history and all SRCREV
> > are wrong. I tried with -krogoth, -morty, -master, and no revision
> > number is found. In fact, after cloning the tree I see that all revisio=
n
> > number were changed, just a couple here:
> >
> > 5.25 is now : 789cfc7d727cee1c7cfb7d29c09162e2399285c5
> >
> > 5.30 (this patch) : 3050419355566d2a96c5be97fef0ffae097bbb96
> >
> > Ok, I fix this in my layer with a .bbappend, but...Of course, all build=
s
> > are broken - have you seen the same effect ?
> >
> > Best regards,
> > Stefano
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


