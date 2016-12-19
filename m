Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0089.outbound.protection.outlook.com [104.47.40.89])
	by mail.openembedded.org (Postfix) with ESMTP id 18E037732C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pBlSmvN8NPi3dwavqdFwlOlw9so3nZ7/X4oDWUaAFRw=;
	b=Ga4RsFsWI/K1BkeT17gIeveGf7pah8qNAvai/tXfnW5eZvCH7ZQs0y/j69dPbSgTyfJVX0UDY4+vzyCIgPTBZpa7Kx5FteJEdcnpxfoJjcAhLAErK28j36u5YkRgYGFfLjhxqNBJIpBwcu0D1W4EM7ualMFlxyjgTPjmcPfylO4=
Received: from BY2PR02CA0083.namprd02.prod.outlook.com (10.242.32.41) by
	CY4PR02MB2774.namprd02.prod.outlook.com (10.175.59.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.771.8; Mon, 19 Dec 2016 21:33:04 +0000
Received: from BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by BY2PR02CA0083.outlook.office365.com
	(2a01:111:e400:2c2a::41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.734.8 via
	Frontend Transport; Mon, 19 Dec 2016 21:33:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT057.mail.protection.outlook.com (10.152.77.36) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.771.7
	via Frontend Transport; Mon, 19 Dec 2016 21:33:03 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:2083; Count:20
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59216
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cJ5YM-000231-KE; Mon, 19 Dec 2016 13:33:02 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cJ5YL-00076Y-8s; Mon, 19 Dec 2016 13:33:01 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uBJLX0JG026196; Mon, 19 Dec 2016 13:33:00 -0800
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cJ5YK-00076Q-Kw; Mon, 19 Dec 2016 13:33:00 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453D84890@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<CAJTo0LaqOXdN7ASeT6gnGFqnptyB4NYAycR0w6kPG=7yTtNF-w@mail.gmail.com>
	<CAJTo0LYYkQDxXC0Eh4Z9o1X9=HtnguaF0hUL_xLDQ3hymbEHsA@mail.gmail.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <3532674b-525d-3bea-3165-d97865a56a5f@xilinx.com>
Date: Mon, 19 Dec 2016 13:29:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYYkQDxXC0Eh4Z9o1X9=HtnguaF0hUL_xLDQ3hymbEHsA@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22770.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 20
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39850400002)(39840400002)(39410400002)(39860400002)(39450400003)(2980300002)(438002)(3190300001)(199003)(189002)(377454003)(24454002)(65956001)(65806001)(4326007)(83506001)(38730400001)(229853002)(92566002)(93886004)(8936002)(110136003)(36756003)(356003)(77096006)(6666003)(6916009)(33646002)(2906002)(2950100002)(4001350100001)(189998001)(63266004)(23676002)(8676002)(626004)(50466002)(81156014)(81166006)(5660300001)(31696002)(305945005)(9786002)(76176999)(65826007)(230700001)(54356999)(47776003)(64126003)(50986999)(31686004)(106466001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2774; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT057;
	1:wLoOMp2EcNsNZ2rHq2LJ7lDREnOpCp73GArZynCX3ALY5LTlPpokdShr9oWQ54RWg0oRY2g5iFszxeydR6o+oQ52A6Rj13y2p/Yv3rDW3eyZVSg1ydeeqkdSp/SCW898VWqXjLue7Bvcwl4U6PAQ178dDqiCN4a1bBAsnwgz132NEbwSj1uLHg0eTSLjK2242lULCaNXKWnHR+AiNabPkNXX1SC57JP67UVlzuH+kfdMgx2cRFb0iMWSHW9ntUgYqj+WePUYPVtAMh5i1yLD/na5xfBhy/26T//FDpuYV1iWb3laFUJ1sGhar5WYBSJXW95cF1yAcS6Nhiv4xe/9KymJCWCrTkgPPahZVN9KB5ypHkT9kDGhHzOImMOFD2t3fyZJYMVmToXhCsln0amWjPm8yOel+a23iTAMNb4A0u/xdlJm9dBR6yD7Y06B+L439sS1VhGCVPHaGR7zip5KXSvVpKVpEGiAzuNxlWUPqVAvMR4Tw6td/xxjAwTdzAq02VwmwdJtLTj+O5+rp41uVBQJ7G4l5/Mz21MQHBC6h26FcaffQ0ZdFxr+ZhXOxJj7Dpw4SAGHbYYRYyMFheTfWwqOuhAejhidQg5yv89JHhSSPACyRFQeWw1vDaNzlHKiWSLsvKlYzn+5rFYF0JDggw==
X-MS-Office365-Filtering-Correlation-Id: 7e8884d6-6ab3-4d65-94e7-08d428569d17
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:CY4PR02MB2774; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2774;
	3:XCTEjNogMgYJgcdEGRIoP7oUECOOog/zrsVKLTene3gn9wvAVmuKdHzpVZrYWHfkCbkaKPcgzR5i78PYRUA4cNk1R112sfH+36IK+woQfruUyk2Iz06mE8G7L998dxhpUscanA45u5+G2+iQjEzDV1TUKVUpze1XFQn6rjaGt+I5IYtJH2y7NFZG8rKX+R9r+dFp8SaEwYPctnernLPlhGW9CvX4fyAVZTrRq0K/WVo6Jq52mBlIcS1NuXgJ9fdK92PPGvpmngfGryqn95GHaXTlku0AZinUbWPOB1zyZBX1jYi/8pwKyYTObQ/5RiTQG7upwHQ4DCFHisdaIUqvQ9MemNh696iBjdj9A9F80Iv/2Gs90Mpk1mtPa/GhYk3npUoNdE1PKZKJIGjz5keGqA==;
	25:Ci/8jawfzgZ2v+iHcx7kBydL/ovGj0QhF1DrkNMm/j9z3RAWSj9lvTqxtjgnX3QsMIC7mFLcyoS+H6yzDukhamw6KerQtRD+gMKfcMUHpYIZgCG5HhBhD8KeQ30G2ZKnEn2q/DI+4vLZtZMJyYcJFC4+R1KbbJf7v7Lv0KK9f2DXlsAvWvasiu4XjVMbk+BuppnbuOQj3oANWPs+JNHMoBrt9NFyjq3PENxwzZZ9yOG1Pms+OynxBIUPU2FU1Mc6lELXgBNsRkcm8zgUAJtyQ4aZddPM5tWqgOoiSvlqKUAZclCkKyCFRZXAGY+L/+hXfdYtbVDDuJgN32jFwmtRCP9ZICAheEB7UjZOFwuXNBM+2N/c4iOI8AG9a2vfLtjjwTmYBSW4FnYNrStWg+Kj3UpIHYJLtrEK8M+0uYpk+6tFjQcY3VgyIAXqHQ2IJ+dV
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2774;
	31:yG6lmvI4+tRPQHEcjdRExS9YfJdqjw5thi56v5HH4fzu6yIiFDCI+dZBfqcYAgdVnO/5DdFBV4klNtLKXX5Lji2YCS4H6FfCvevpYW82Pi5U7MMojIKBT0WhP/HdMjT+rXuDIFCxKEKFAmedzVpc4o/q4zKQzrGk7/zdiwfG4okTQaNQuZy4+mXN7CW3umc3af5OHXUCllT7nWqilLkBd+r2lVh51Ty8Sj1Ub4qaWkXq84nL+KFXw7HWBwVK8BtgleBKjD+YKv2AEyueUB9nBg==;
	20:gO3LGe8oH7EIUXpUbiptYTeNLuRxtVLWhPwUumQ4Tl5nTYHf6PIIj+K885VSWkUbIUFOeCAlr3AZ2JcZSX5cDRI5eTrzEKpMOMQ2aqne2f6ntcQOwmAyUyD8y1WXimTEsEjjcsA2dc0oL1MR8NlmojodTO143JlZIE96J0DY7/H3DSOmtDU2NYnOrO7SWXbD5O6QQ+yeKG2MhTCZqEcMAoS0RHNnfKBP480UsJ7BUSV1v4W3FsoopasQP2P+tpJ+ua5d6iiZS3MVfGkEXTd0eBPdgFSEHPgLBbF16V84NUHHORpGhv1aSAg3N5H+mMXlf+Y13Ttj1kxX7le0UGJNkDJOm5jJzZ+K5CO8dju8ZEw2RkX9RoJRoNo+RMSJtWuK2OaFe6XrgE2S4j9SejQ+Mv/xGhDYsc55dsVXBJdSA2OUuYfbjCdgww4xBHDgRGuec/W7gdvjUa1+BeMbzsDUsFfgqYn6Bhc8NQMgjk1IxoxYLO2hSs2do/VR2Srf8xvV
X-Microsoft-Antispam-PRVS: <CY4PR02MB277411D90E65F6960B5E296FB9910@CY4PR02MB2774.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13023025)(8121501046)(5005006)(13024025)(13017025)(13018025)(13015025)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148);
	SRVR:CY4PR02MB2774; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2774; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2774;
	4:/O2F6jeOB1O++E3rc/w+4Ack/RPWEy/V2iDEKvjzZsPo4f5jeEMO3Tz1lAWmR3vC2A4yqPiqYlsUVGMzM3+WkC8lGugxLLnFXuYluIT+3DdeA+yG5eat8ahayKOGnRndov0gW2X6sceO7rGoZxJKVTWEV2dDo6RsE4qf1uq6LtZemIg+9BO2l2EA82fIYTv5SoXzu7LBZpocTHXV1P32qV1NQ3QcKdyBBj5p+DNnrHjXkv5G9lh3dz2+D5FAOu/NV9hTMH/+1+KVfxHQMN5ywNvU2OsrlPjnGKmlET9bH78eZvALzex6JdiBqQ7SxH8+o+eUrSi+wSXWZa/YRBEPzbyi6g/XHXpvG1O5xIsbQaUAoAiz2AWwogZoI3Z/NDZ87HBJNca/kkPfDomGiTLFTWX85Iskxn1hKGeHr2hmI45vyWDoNY8etzWP/NRvRbrqnpPwdwLp4PMpTWdDfOKGlNnW+s1fmzwTqVhGlJ++1gtVxGRXLFRcrePZpSZv4OAP6v3/5pddCifcPK9T+NxAX72UiD1lJOPi5UYG3UNGVJphzd5KrqN5v6goHj1l4/4paRfcTnAZJl4/P/5Y7Zk+PISo/5AwwOeLgjyFEuVHHSODoFtAlbVSTjWLYSQDBdoscFt5uIz/JHT1+l5ftEAmqcAI+yEWxkCXUxrvS6QxymyCVHOecO7suN0UQYL27cYVwfRIiXexJ2X2Xo2Iq8vle16zbyUcRnJZEfJ0EBNQHGM=
X-Forefront-PRVS: 01613DFDC8
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAyTUIyNzc0OzIzOlBGMlJMOTNmdzBRMTFFK0ZIZDJSWHozUVFw?=
	=?utf-8?B?MHB3NXRIZ1dlc0JKME9oL2RZQi9JQ0FoTklHWmRUQ01CMGxRQW1taFJoUTM1?=
	=?utf-8?B?NFpTUkVQTDR2NmxwSzdGekFVK1l5c1VWSTRhNmxueE00MjVqRitSc0wycms4?=
	=?utf-8?B?NThrR3JpRWJiWlhBc21oQ2M5Yml2ek1ZR2N5R3dvT1JLQXVvZWRrTVp4bXN1?=
	=?utf-8?B?d3FIZFhlMXFaaURSS2c0VkcyU2pBbEVCU1N5OFZhMHdsTFJNUUlWWGM0VmFS?=
	=?utf-8?B?L3lDUkR3VUdTN1BobGtYREtKenJaVGxzUkdHMUV4R01WeTZJVnE4a1RhRngx?=
	=?utf-8?B?TXN1R0QwY01kZEFrVHd0b1hPQ2ZhVWREcjhrYjBmbFlhMUNYZ3E0K1ZNU3h4?=
	=?utf-8?B?UDNZUGMza1BVMXFnR3Jwanc1cHhQT1JSQjljUTh0T2Q5VVZDMnptWFRXNENF?=
	=?utf-8?B?UGwxTUZybVNxZ3BJUWJJY2RqNTkzNEg4ZXg5YU94a2NBYWhaRCtNZUNtcnV4?=
	=?utf-8?B?MWFuam9ycFdwNWNzREFFc2hFaWZneW85dzBSVnIweWd5QS8vN0VLaUFpbDBS?=
	=?utf-8?B?ZndOeTVzQWkwZ2tCNlB4eGRUVGhWaGNzWmFtYVNqZktRcVp3QWF6OUE0ckEx?=
	=?utf-8?B?TDREakdCWTE3UklMT01aeXEvMFNDSXo1bzdEVDBVbUxNZmxEVk5JOXBoYkJ1?=
	=?utf-8?B?VUs0V0R4TVU1SDdxT0g3S0tpOWgwTitKRk5Sd0hRMzE1bEJSdG1ZZ1dENlZ2?=
	=?utf-8?B?U0w4cS9GUjlka21NSm1yNkVOcXJyNmwyZDZhZHFxK2RURGNyWk1rV0ZhNlQ3?=
	=?utf-8?B?amtjK213NlBOTm5ZZkJXWXhCcXJtSGxvUm54b0l6RjB0N2dJOTBhV3JNS3c4?=
	=?utf-8?B?MktSTE9KRG12L2dHVm9IRm95TXVYTXIzcFE0MnJrc0tGVi9HUWlsZjU0Z2Nq?=
	=?utf-8?B?eUtVNFR6L1ozV25FS1YwWUlKZDlOSGI2YkN4SjZLaHkxZ0gyMklzd0FmZFhl?=
	=?utf-8?B?bWJlcVhzdnlmUzFsR3QydzRmMXhodjRBaDVRY2pqT0x1dEtpbkF1Vk93bVg4?=
	=?utf-8?B?TjBXQUFwcDJiWTFJTGxiWFhSYUMzWWtUVHlvdW9aYkFVM1NGeGZFZmM3V09V?=
	=?utf-8?B?elBONDE3L0pkUmQ4NDFQdlViNUNIanMveUJBei9FUk0zYS9FKzdRVzJPWEFv?=
	=?utf-8?B?REZzeDYvL0x1QmZRajlkY25pYjdabU1scVdxb1ZaVjRzVUxqKytydDlpRjdR?=
	=?utf-8?B?aS93djBncEFIODJJUlBhSTVXNFlrSGY4SWN4VFZhcjA5QVBkQitwMU93R2xP?=
	=?utf-8?B?ZlNqK0FKZVNsbC9YNE9JOGZXYWFFMkZOUGpTTkFKUDZqakFvTE0zbVV1M2FR?=
	=?utf-8?B?UmtRNU95K1IrVkNoRDVuS0g0S016ZGsvMEpJMHZBVkR2cnNDd3dvK3ZodDUy?=
	=?utf-8?B?bzRqazJjRFFlRHNUcERkQ24rMEc0QXR0a0Z0Z1RIdXQ2UFQxOS9iRGtxUjdO?=
	=?utf-8?B?LzFYVm04V2N1ZXVnb1B1MjhlTmJkejlxdUh4MFlPM2FKMUlPVlJPcGNkNDJn?=
	=?utf-8?B?dm1PaUtmZHoxRUxmODRzb0N5NUtTdjJ3WEN5ZmQ5dmdZMng5UyswdDRTVkh4?=
	=?utf-8?B?Z2d6cFU3cCtrVHdBMjJmN0xlaEpKOFN2TUNwRVZ3cjlkbzA3ZFVnZHZMNGNQ?=
	=?utf-8?B?QnVSWDdxTXE4Q3UrT2lpNXVITXY4c0M5UHNkTWpVVDdCZnVxeWpvZSt0dXp5?=
	=?utf-8?B?aXB3VTlzRlp2QXNkZDJDMjNuTXhVUmt4SkJhdi9nSEg0K0JhNTh2MHlYemhW?=
	=?utf-8?B?TWhhbTZQSG5FNHZrc1p5UXRMRk9YRTJqTEdweUtWS1JMQ1E9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2774;
	6:B+NDtgPpKeM/04tpV6aNfRRZRE1hzoU/lSvRs2uL/k2vFbFyGirVa9r9tacxRIXuBquswdDWkDaFkjmdD7bTUX3aNukKB5ao/9nf0YyHthUw3Wvjo+HFNTODQU3xvbLUlH1p5Fa/DCgGNlPWWDidqBbTs7Ync/mmoaOSKWlP4OJHFqkPKhyE/38kO7MfHw05FIUdU57IgqiKnZEml3beD2QdsMTCxovorSiPKw4s/a9Zk2k3C5UwEvOfJ+VaimjleA6RD4IB53kDWs3MjftPNAGgN73WWMOlIm4KTbpsqCh/c9XvmU1R4XOMQlYUSK/K+Gg85d31DM86uvOMeRrMK4clP01OTFw2hGVIZo4p8XqYAKO6vF0I53Ia6D51q7fcUX97oXsyER5WSR0fgoSdxFS3VK9rYm929mopX724G58TKdmBKDIjnyqDg3HNeD8c96LRCqQ5jPUnzGbtXjiZQw==;
	5:/8d3/eYnZfmpr3kSMVU3JTk7rn5tQlHCXRmBw8BWq+XKHT0LiDIdt8MVEeJDb3oIbkq8HxFHHQhn9lbL++AigxXYNKr6zq+4MOG2cdgF/1G2YStYCDHSbfTs5GnpQGH26SBnCBebcOwLzXQ7l98GGg==;
	24:IomuHLoEuloCuC9wt2N+r/ZozM7cc4YG/pLYyIbDllfsd/Ocdovge+KEAgrYOz4MjzrGm++2yM1eCCjOKJygUJBxiou3rZMuIaF/4iOKW9U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2774;
	7:vJwJMvB9Hz8JOSZMO0tKlJJYfceSVgrnTEIxOh1uTsxNrNkJ43ips8ejF78ywQfnlauVHpSBxQSb3qX7/FR6lwiY8fGxqFMo2jebpy7DFOw5JqcoV8FD1n2e8fB5Qtl902NZsmU/e4c0dUKT9x04tBDZWngeYBwogmqjW0aOzI+xSUqmr88JFvG5gYN+FchGZwgnJkmCbHpG4U4ZYnl2qWGgsGvKLdADEfV4N1hdQDmGTACd9sKpi6egpfaZ/j1DykZxiCJf2moHvqABE61aF8Roa86gFByVWv9ieBCPghB1RWjDLwRXvPo3INP7tIcpBGWFf3nOKnJd8vq151bac0hDRMt3e19RxyFYhh7cnr+5bbHGg180OnOvHRlWsxubkhzDRJIlFP+MQdkc2u7UVgkeHUIPJQe8ZqJ7u2Tj+cIy6oRJSvlvvshRDlcOlOkPsH3uf07jwjzHi9/mqoY8Ew==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2016 21:33:03.2074 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2774
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Mon, 19 Dec 2016 23:07:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/19/2016 05:05 AM, Burton, Ross wrote:
>
> On 19 December 2016 at 13:04, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>     You'd marked it for morty, so I'd assumed that it wasn't for master.
>
>
> Ah just found the master version.  You can thank GMail's threading for
> that. :(
>
Hi Ross,

I sent v2 to master couple of days back, because the first patch I sent 
earlier wont apply cleanly on master.

Thanks
Manju

> Ross

