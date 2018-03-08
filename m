Return-Path: <VINEETHC@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0060.outbound.protection.outlook.com [104.47.38.60])
	by mail.openembedded.org (Postfix) with ESMTP id B9F6B7896A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 04:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iqFK7yXzfPNc10wKY0EJrsHdegKgxl9bRHxmytYdnCk=;
	b=LkAVv844CCC/+oXe4642XFRB+rQUJew/AJbyV5fAtWhMXlL0Q7ILKzN59ndhTUWZEVUZ3Si1o1EO/QlgxF6j6rMlfHJvHbtF+phCMx7mIv+sgww+LBHSuLW1ot4AaHM37UDL9rD7h5QMtGjiVRgfCgH1QncwBHeJ5e+XlllLGOM=
Received: from SN4PR0201CA0036.namprd02.prod.outlook.com (10.162.76.22) by
	BN6PR02MB2260.namprd02.prod.outlook.com (10.168.253.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.548.13; Thu, 8 Mar 2018 04:40:33 +0000
Received: from BL2NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by SN4PR0201CA0036.outlook.office365.com
	(2603:10b6:803:2e::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.548.13 via
	Frontend Transport; Thu, 8 Mar 2018 04:40:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT025.mail.protection.outlook.com (10.152.77.151) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Thu, 8 Mar 2018 04:40:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etnLz-00073m-W9; Wed, 07 Mar 2018 20:40:31 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etnLu-0000lP-RU; Wed, 07 Mar 2018 20:40:26 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w284eFZs018339; Wed, 7 Mar 2018 20:40:15 -0800
Received: from [172.23.180.111] (helo=[0.0.0.0])
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineethc@xilinx.com>)
	id 1etnLj-0000fN-6Q; Wed, 07 Mar 2018 20:40:15 -0800
To: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>,
	<ross.burton@intel.com>, <manjukum@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <1520479851-22522-1-git-send-email-vineethchowz.chowdary@xilinx.com>
From: Vineeth Karumanchi <vineethchowz.chowdary@xilinx.com>
Message-ID: <d3e216a8-65c8-6ad8-1514-2b04dd53fa38@xilinx.com>
Date: Thu, 8 Mar 2018 10:09:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520479851-22522-1-git-send-email-vineethchowz.chowdary@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(39380400002)(346002)(376002)(396003)(2980300002)(438002)(3190300001)(199004)(189003)(36756003)(2201001)(107886003)(6246003)(31686004)(966005)(356003)(336012)(9786002)(72206003)(478600001)(5660300001)(186003)(59450400001)(6666003)(36386004)(31696002)(4326008)(106466001)(229853002)(6306002)(65826007)(2950100002)(6706004)(230700001)(110136005)(53546011)(47776003)(77096007)(65806001)(65956001)(26005)(23676004)(50466002)(64126003)(2486003)(106002)(316002)(81166006)(8676002)(81156014)(67846002)(8936002)(305945005)(63266004)(58126008)(2906002)(956003)(76176011)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2260; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT025;
	1:aqaALTJyCGiCpQI3N21U0Q4NlRBopOlhPRBd+9wPIoewLIQ+l8p20Z/ouJJIB+wuXLXB4fYSwRz4NcI+ibVgu0h1diDEVq9bNt30//SPfc08ZTvs7iOP2brxX4ggjWX3
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a341f2ce-e4d1-4400-44bb-08d584aeba43
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BN6PR02MB2260; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2260;
	3:xw5dqPCcCUOriJyNR30qyocZxb6CAmv4yB862cRDLG4BucSfqJwDezZAYvNryGqFUWGAIngqV/LayVPhsVIglURkJWES0anDZwsT4/cGJNNBcdJv1U3RALk+DB3BnrRnwGFBdeCqeRq0V3cj3Ao7o1idMpTvcxbOii0T5Xk7zuBzQ9TlIMolrHFf4FGxcZnbCvlpRUrpP5QpZoUXaRui0hwGENGXuiHGAIRblRxtrSXL9VhGIL8ZmQ2Q1dUsYpryn7FAjYi3DQCfoO7id5Bqrrv2+rimyk/3tzHvO8SRXawyKnTTab1SiQlwnLoAU4twCUGNI3twCtDZddA77CTacjNlGY9iZ1fdZDBMZ+oOND8=;
	25:0DSRTcGXF84eSRQw7OrdAwBRKIwbURk0KyXaiGfhAHuVy+nLyYDTueJ9O79RJMqchD1TJdAzPOIKmfU7iD39RQt+/dfORai8AD/0zpr+0r89+3MP062Ak0xRhjkYI51fjT2SwDe6Ys9hXWwnygWfYnv+WmHp3J0jo0MmKzezp6cQce6Or9qqi3ohVchK0H+MXyv4uRGiUY68YwkexczoevXjMJxsI82R8oIW9ZKNCM4XHV5hR35zMZJWMekV4NYrZYCw28H2I5AAPKMCIMCxT/BIHE5qaMOxSY56KkWEHCltp4iSp1o/Ul/u0M0QfNPXUwv1ErB3TXRXPeG2PPiciQ==
X-MS-TrafficTypeDiagnostic: BN6PR02MB2260:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2260;
	31:mI91gBP+2bMI+5Mn7VsD78Xhgj/yP04PVqR3Qzi94VDaiTz9Wxn2YX1rs/J8hDQxGQLe9z2DYiNiHs7pB0P5cn/s+H/wRE5PJ+h0XlhFpKdkKN5gj/skU7d+bY8QN68Sh+g6PmxYSHSSs0xhqokblR57S7hkgDGqDkuIGs8oD/b73Dp8yPitKKescG3UfhMtrXWy65s5mWIKH4bpZ1SYuQFIVohr3dyZ9hdQfU7wAo8=;
	20:ILu8GlM7hCiGdA0MNeBj1ZHh5F8/6sHAoBgpR4HJFYZ5fMt+8XMNBBlRzKytZYlJCweWcA1KSMyz6PxVpXnn2VLtrPQwt8kkVQ73aYPEtELNNQ6DEIEr2xZwrBlDL1ciqxEXtKAT+z0dtQXcMW5dgwU1dg0bOmWq6bjQxneo4HVMBhNVGVcC4EFWFpb2qbREW1NpDmiC8B+T1xXhMqriATYaHCnyQ7sfXNEcu46L/AGA+6Nixm4xXv0uVXnOy0qNV7JFJZiVPfe1TB9imHKL6ioJQ6ftfuw1WJkUWo5vOYgSh6MrwXZZD9zDj7GwDqlDcb0+ngZuZ9bfXw1S2LmgIEMsieoLcK79GEZl19J7ZM8TWvlRWhyHMaWsqW5aA+3R9qZcsXING4Lp2u9MdO/g3yTXtJyKYgcKOQmK+X6u58l5fJYjor1EQ/20dgL2GJWg6OL6NRKZRcDWLBu1XY4kIzhpgmaT0GTw32JMoPSW2GoeDEOb966aICm/fcmGi2Xf
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB22603DF6ACC791A48172ABB1B9DF0@BN6PR02MB2260.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231220)(944501244)(52105095)(3002001)(6055026)(6041288)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011);
	SRVR:BN6PR02MB2260; BCL:0; PCL:0; RULEID:; SRVR:BN6PR02MB2260; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2260;
	4:QYVHmNPveJ3eSNy/dAyI54vTLBp4JrJJZq+WVFxyIkfysLU4OeVa52rWhxC3gnZILKNl0LSw6oysOIW8vePGg/BALGmxzjSNVZw9q7Rl4ATcQHvQhSFXnXwILb2pHCTC7fIDUKQ0ERrz8+rEiNLwlUXmNWAR0ywG0zjJ0RCHaBrzxZrnJpaGZLjanL/03ckuMpnmJJ91xI4I1c+EJ7/noQ9wr9kNjSHfr66xT1jc+WfJnFIwvf/GNUGSrAP3xHlX3yw6V9TO5P7ytF6iLtYLcwWds/8judqAx7Lz3SKXer5tHvxI90mSeLgi6WHWlgta
X-Forefront-PRVS: 060503E79B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIyMjYwOzIzOm8rYUNaSEh3c1pyZ3J6L3UxdEtBZzVqckh4?=
	=?utf-8?B?S1c1MFNmbUk3STJ0QUZDVTRVZWtKeTJPa0RTMGFJYlhyd1EzTWMxOXZFR0Jz?=
	=?utf-8?B?UUZoUmp0UXh4S0lTVGtnWUh2eUcvQzNmSlF6OVJLOXVHWlY2bVQvNkMrVGdF?=
	=?utf-8?B?dEp0RWJsYlErN3dadHZ3VTdVWDRTM2RmMmhOYktyeFVIMU1oaEUxSk5qa3ZR?=
	=?utf-8?B?MzBwSVZGeGJCU3dKL1JVa3RUZGZ6T3U3K2s0d0lHZzFHMVZDYVdzOCtaVVVi?=
	=?utf-8?B?em8vaSt4QThFRU1BSStXZVpUYzZLU0pJQU1qMVVLdE5jeG9Rdk1VN01mV1BC?=
	=?utf-8?B?dFBnMEZtQTREdFJnNzdlL1hTSXBhTVFSRzFNY1JMemNjSUZ4MFN6Y0p1d2My?=
	=?utf-8?B?R1F6N1VON2hFQ1RxWmMrODBsMlNkZ294eEJra2J3SDhjN2N5MEtSYXNBVWsy?=
	=?utf-8?B?aTg5b1FtUXZQbzRjZlM5YjlISnBtZnk3aTRSb09CNmRkdm1TdWV3eGIrL3JK?=
	=?utf-8?B?ZzAxRzJRc29wN1M5SUlCZGVtZ3huV2RrWU9IcFFyVWhialUxNzRralc1eStL?=
	=?utf-8?B?eWtvQ0VuN1NEb1M4V3laVlNDYk82ZW03Yk1qNEQ5UlRZRzgyNHVGTS85blNI?=
	=?utf-8?B?Y2Y0dHhYWDgrVDFlNWtQaStaeCs5RkJXUE8vUFZFZjREYTBzUnZoc1FxbXVH?=
	=?utf-8?B?LzUxSjhJWTRvWGk2N2cxT0VrMElZWU9HTzRDV010b0o4bVFhZ2RFMEtLUzNv?=
	=?utf-8?B?bkJjeWNsdGN4Z0QrdDNCd1NBRnloc0JtQU43UzF4QzY3Q2twZ1IyRm5Hd2VT?=
	=?utf-8?B?TFRlWXZRVDM4OFdiUmt5alp4TGQ5Z2hJTVZGbEhZb05pK1dCaTN0bEU1S2FI?=
	=?utf-8?B?cENPWlNmQlNGeGlldzFUSnoxRlVWZG5wWnR6WkwvdjI2Tlg3Skp0WEpGOG9T?=
	=?utf-8?B?STBDTUIzcTM1ZStDL1pGYVBKcUNycStuWHZWeEYwYk1kbXkvYVRvcU9mVE1L?=
	=?utf-8?B?cXdzaTJXRjRYb2Nrdm9KbUZhb0lTZTRSTWxycEx6d0hUemlEVDlTYzhxQzRF?=
	=?utf-8?B?a3NxV0hHMXNYZ1R6SVNWYWNCQUh1S2JEVWU0S2s3Z1JZREM1blk0bkJvQzcx?=
	=?utf-8?B?M0xGYmZrdk9QaDRTd014RTFjU0ZFSmVEejlRVHlwUlg2aXBhSE1QYXA0UXpX?=
	=?utf-8?B?RzJMdWx0RGpPcVpuYWJLL3NjUzc0TmY1OFhDaUZlWit4SHJuQjJlcThZNC84?=
	=?utf-8?B?d0FkdXhZOVdjR1pJRlFqNmVuT25yM3doa0MyS2NFd05POTNJa29FL2NPNlFx?=
	=?utf-8?B?MHR6bnJFcllxa1ZzNlpOYm8vRzBtZUlVZklEcmNJOGRTVzhFSTIwL01WYW5V?=
	=?utf-8?B?VHB6QU01c1EzQmx6ZkxPa0JBejJzV05PMi9PdEZIdHZqQTJNR3NXSlkwWGJI?=
	=?utf-8?B?TnAwM0E5ZDRaU3N3RTk5aVZ4a25RZE5KV2Nrdk5FRlZIaWpZODVpRDZGQ0s3?=
	=?utf-8?B?NklYeG9GWVg3MTlqZ0djZUhLVzk4K1h0V2p5ZHRqVDlmeGVwQ3JYNk9Xb0s5?=
	=?utf-8?B?UnNYWWU0Mis0K3phSWZINHFzWWs3T3RqUXdFM1pLdmJ1WFk3eEJvTXhmT055?=
	=?utf-8?B?R3hMc3B2cGhXVFpVeTlnQ3M5M0l1ZWUxSHRpeHUvVWtiTnlpcUlmUWc0Zmpp?=
	=?utf-8?B?Qk00TG92ekpOU0hqSDNuU0RJT1FKQVEzMXJXY0VCR3RvYXpZck9scTBxZE9k?=
	=?utf-8?B?OHREYkMrczlMK2FnQkh0VWRQSWtrSDJwK3p0YnIxVEpDM3RKVms4bkhIRXBF?=
	=?utf-8?B?Szd3UTlxZERkTUVDV2x3SXV3L040a253akEyRW9nUm1YQkE9PQ==?=
X-Microsoft-Antispam-Message-Info: xBXUURtF13IAafHhyLb9Ns6xhHfMbJn32nnjgYYUB9aXureawem3j2A+N7GmuD8ZGBNIeyu7ZroOo6uTM45BZn3PnJxm5wo4M99XsXWpmGf8zZ/MPe7blAnYGFrqEcBcnJjom1k5HsgN10wQRltVS58HN1wz7HWFYhFbUaFZIGcxXuo/uL1XbBv9ONBode/+
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2260;
	6:+mEUhdr/9Jh4X33cL2E9UpF6GuuqBuyCqHTjLkNnvVOGeM+wghdSo9qWprDIx3jbrCUU+6rHf9oj7YesLYhJnyQWQyiYvQ0TaW8kq2/H/01RrJRenYhoxG0Gq3y9KvqDf4X5D9KDvtgNvf7vLwq8NEiq140FDUZTsXDjss7zqGEzF4YYOaEz6LX8z7YQN2w4fNJwnMc+tCW5yI0OVJ2STDwJgKW0zZED7K/d9ohc9StoMo9Qa239V4gJ7Va2n9jeZxFklfWDVtgLzn9Qu9e9pY57IUTYCZOwkATOHSOI75d79NXEVoPXOUQbHGxYoeM/OywHnO0AtCoVZ/hiNpetBgaTBkQ1USd4n/30qQeP0Ow=;
	5:o4M/RNFKAB75wQT/67pqIEv1i2+dCJEUDuxlk+lOmJs3Ex36Ul5k+Bj7AMtpuG586e1NGeoz89GXwEjGSG+OHg9h1Tgnl4D2upfIwL9I/ppxoY9qtUsH9yzt/9h7ntQCs1vyk3Fx/nsoQJAOHkXj2icOafbfm1bnq6i6hCi74xE=;
	24:+cSUdKqyaUpWrTCV3ReJ6/UfC3MeM9C9AZ40I+rTL98/KuJyT9Y9y9Znz7kii9iq15cnx8PfwEgwW8NxRH3sYtgN2jZ5FSvXqWSnIFqebVs=;
	7:U//2CcSppTrxcU0cHN9C+DcUelJSP81nBTnk0MoWYViel4SKiLsrDcVzsqaaArSceqo97lw7SPSXVITWy5evASFHIiESkHn46LLoPNKtMTrSwVnZM5Fy4Q4trsu85bYZe/t8hxkBUNHTDpOLLNxRhGZudN8yRARJf1kXXrMM8C/tEdnUl6+dkMcbT28FUqm2Rxq/aTvtFmHWowt2fRtcSHnC+JPez7lZ6dEip7ippmFgfii0nyNTb4Q9+YLbyj35
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2018 04:40:32.5064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a341f2ce-e4d1-4400-44bb-08d584aeba43
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2260
Subject: Re: [PATCH v2] kernel-fitimage.bbclass: Deploy fitImage without Initramfs
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
X-List-Received-Date: Thu, 08 Mar 2018 04:40:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I am getting the patch failure error saying unable to apply.
https://patchwork.openembedded.org/series/11297/


I did these steps:

- git clone git://git.yoctoproject.org/poky  ( master is at 
83cd2b3e775235942dd4201622dc5cc2d4328994 )

- Applied this patch, it went well.


Can you please let me know what is the mistake .
I was sending patch on master.

Thanks
Vineeth


On 03/08/2018 09:00 AM, Vineeth Chowdary Karumanchi wrote:
> This patch deploys fitImage (linux.bin + dtb ).
> The use case is to have 2 partioned sd card, with
> FAT partition having bootloader + fitImage and
> ext4 partion having rootfs.
> 
> Signed-off-by: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
> ---
> v2: Proper signed off
> ---
>   meta/classes/kernel-fitimage.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 50a91e1..25884d5 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -464,6 +464,10 @@ kernel_do_deploy_append() {
>   		linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
>   		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
>   		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
> +		fitimage_base_name="fitImage-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +		fitimage_symlink_name=fitImage-${MACHINE}
> +		install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${fitimage_base_name}.bin
> +
>   
>   		if [ -n "${INITRAMFS_IMAGE}" ]; then
>   			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
> @@ -478,6 +482,7 @@ kernel_do_deploy_append() {
>   		cd ${DEPLOYDIR}
>   		ln -sf ${its_base_name}.its ${its_symlink_name}.its
>   		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
> +		ln -sf ${fitimage_base_name}.bin ${fitimage_symlink_name}.bin
>   
>   		if [ -n "${INITRAMFS_IMAGE}" ]; then
>   			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.its
> 


