Return-Path: <mubin.usman.sayyed@xilinx.com>
X-Greylist: delayed 1617 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Aug 2016 09:56:57 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0062.outbound.protection.outlook.com
	[104.47.37.62])
	by mail.openembedded.org (Postfix) with ESMTP id 477596FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DNmWkbHB3SCXZ05YmHY/aCRdtUmTgRzDf/9WwCbkz0U=;
	b=aCgTxdbsZnacsIgQhJpw3UwtR6WWWOSVKG2946j/ZZkGRk702Up6cbJpIraqJodU6rtimOLbdtnjT73XM9qM/826ao9a+sBRIEvgo0si8nUNO5YMNLGRWdQAvDwGyHTX/bxOsxJdHzPEPslWpu5uGYfSCmyVyYobJ4CjJAEuM8w=
Received: from CY1PR0201CA0027.namprd02.prod.outlook.com (10.163.30.165) by
	CY1PR02MB1301.namprd02.prod.outlook.com (10.161.170.16) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.587.13; Thu, 25 Aug 2016 09:56:55 +0000
Received: from SN1NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by CY1PR0201CA0027.outlook.office365.com
	(2a01:111:e400:58b9::37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.549.15 via
	Frontend Transport; Thu, 25 Aug 2016 09:56:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT023.mail.protection.outlook.com (10.152.72.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Thu, 25 Aug 2016 09:56:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55708
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>)
	id 1bcrP6-0002Ts-RN; Thu, 25 Aug 2016 02:56:56 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>)
	id 1bcrP5-0004Pm-9M; Thu, 25 Aug 2016 02:56:55 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7P9useV026768; Thu, 25 Aug 2016 02:56:54 -0700
Received: from [172.22.159.25] (helo=XAP-PVEXCAS01.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <MUBINUSM@xilinx.com>)
	id 1bcrP4-0004PZ-Cr; Thu, 25 Aug 2016 02:56:54 -0700
Received: from XAP-PVEXMBX01.xlnx.xilinx.com ([fe80::4c50:cc5:695a:c7f8]) by
	XAP-PVEXCAS01.xlnx.xilinx.com ([::1]) with mapi id 14.03.0248.002;
	Thu, 25 Aug 2016 17:56:53 +0800
From: Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [meta-oe] [master] [PATCH 2/3] benchmarks:Added
	recipe for dhrystone
Thread-Index: AQHR/R1V2+ho3msB1kSlubeDgkIxIKBWxH0AgAKundA=
Date: Thu, 25 Aug 2016 09:56:52 +0000
Message-ID: <366532EA46EE364DB88242E771105CB59D1428@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1471943028-8276-1-git-send-email-mubinusm@xilinx.com>
	<1471943028-8276-3-git-send-email-mubinusm@xilinx.com>
	<94CF2103-219D-4209-AF1E-6667B44B0A1B@gmail.com>
In-Reply-To: <94CF2103-219D-4209-AF1E-6667B44B0A1B@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.95.144]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22534.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(24454002)(377454003)(13464003)(305945005)(47776003)(110136002)(107886002)(55846006)(92566002)(8936002)(5250100002)(50466002)(81156014)(5890100001)(19580405001)(356003)(81166006)(7696003)(7846002)(2906002)(15395725005)(8676002)(23676002)(189998001)(86362001)(2900100001)(626004)(63266004)(54356999)(4001430100002)(76176999)(2950100001)(2920100001)(5660300001)(33656002)(106466001)(19580395003)(7736002)(87936001)(586003)(102836003)(3846002)(106116001)(50986999)(15975445007)(1720100001)(11100500001)(4326007)(6116002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1301; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT023;
	1:JGh9ulzc715URyBoIA/CFmamDZccw6p1lmtnG6AO9BHAD+gMV4lMmnSrenyeUj5+j4QdfIGA/ybPa5PX4nLCcdzx5xM5gWCZewPtflU5ysuDcW7PPcWx0OtxiemMVQADU2x0J0RbLokt9HFqfR4NUiNbwREh3eizG+xi+GXzSA6WhkrufAcNbz50fK/FvgK0yphQkUb8iOrLjl/EGnJaokDeehcjq/wRUvUnT7JywZH0mRn7IGKnfMRr7P3jrrMQLYtX/ubodJGMFBeJraB9HzOtn5I72U67Qv2uw9EQj+iWcBoVLcg33AIi7MxsrpV6F3Gy1GEzQi/ffPUfFtB9lx+LtsMksqFegTiUCtYgyKt7xs958QP8ZH+Zmb2kCLTKQb/UaRzp+DnwzjlXfJZcsPaSb6hkguhB8N24TnadkY7uTPKFJwqvjevhfQLFav8RYd+qASCD/LZD6DY+zUCokJzTiqXwK0XAokAGTFncEPT7OZk4wkAYIOgxPpKL6Oo3KE9wdI+INoe8haFT1P6ayT2Avf4QCAoiOPDYukSD3EK6nKXpcfobJZJ7OXjWAxPYPrtIHNSVqS64V8/MoLluhR1BxQ0gy5vT0Xp1Xr9O5Q8=
X-MS-Office365-Filtering-Correlation-Id: bc81328d-f07e-4b7e-c108-08d3ccce25ef
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	2:eO9JWJcyBJOXKqPKdzzlznr6sizxINLGicD0SghIOcKm3MwgQO6HiMZ5xkTOaMTR1UrWxQE7IpqQ2/2aw71Y6y2/nSR7rQv00HXRVmEDlCR8CKi/nR27q/Kus5a146zSpjYkKu8RBdXysjvzGOcCmOoL283OzbcBVMXxgPbE5scCcPGdjMwLv7+bKz7DFLub;
	3:QIeOKuriprxVwL8MQXGXaSqwUq6QhovuyBT+aPzQ9TV70cltqrCEibYa8ciEbkhLMb4ksiFVNAdRgrZUTHDUyrBgR96shqA097QRnY/IHTc3POTf40LU0qXVhm2skgzOs9WwMHgMNaEv6i42NwDiUd4oeKHbwX+67bo+rFZnh32yb4d6iq/9ZM1qqfaww9VrJ1tzPdyQNQJ90kVD+xMrcKgc8e6zuPshLJe4lvE43AIswZv3H3RqGRlDDhidQs28LWKdma3x5r4EW0Wci6Dlxg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CY1PR02MB1301; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	25:+OW3NUgiPw6wFUzcCYRV/jhvMG7Jww/kK1LgQqi/FMW34jfgC1D61z6HpkA/FIpGuaCOuteEC72u9w13oA8fviZ4Sd4il38fee+gAMrMI97VWQO8sm6u9LIj/ZP7wf7wXnAWZGiGEt1vubXbjM4S+KOi8B8s1m7VkvakPU1B5mGuWrgM/puPALwr0IZk2AGcXNOKrQAy9A5/6WRSiQjciv6zj7p/TKPrbplupg9C50LqjTH54f9ukyoGV+A0vJPtqLqDUrJqu62mz8LKYfbfBr/6cKhXjMPoJgUEndc8cSECKmiplzTc7+Jf/xE6V1966k0YYBQGGGR3odSzzsjLAaqdKnG3US6x1VQ0dOuG4ZHKnJYjeK5bZPB5QP8zJgQz6eRgCWSD/4piqbT4tIZ190MfBYZmMwvqcTL5/ef6ZO3nPY4QWsucEV/GZ5QfaG2iOnypYiwGatRPmL2IWTjgIOTez3nI4+XFP0QswSso+xXIUjUl1dz3lqNbkqtOOI5GVZ1MtBeA1c1Vkzbe+7jlxVcXxYguioOQAz+VK4tyDcTciUtVJYRRado00C2AOhlLKI2vBlK2VGhrBzEHf1kkjwsinVvo+l8+BJLb0e9gSDOnsS2cvDw57wO/ftbwXO8nmbGbba/gg2BvZcJv0Yc2q0HZkXUVA/n73L2+5ckpRhT0i5O8WYhOwcBWDsty8OKhA/UmzsUIX+5e0L4nPfIUjVCV6sFEGQaJne8fm2G4xG+IEttxG26GtnDPmVBwIN9/rB9XiaW7ZuDgKf4zM00uf9mkfxIfblM7f/Qf28xK93N4HLgpwrRfWAWZT5ntDD6A729wiND4gWdcJogs/eR13HnZYjaxRVzJ0/jKJUj7yk2H4NnWuq2LlHiLmmvsf9zZ
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	31:RSZy3dOniCmxFuFSVsKy9gcPkWa41USHeqs8YamhG0R+9NsC2KD8I7cT8DsSlrXHE0AhOZ9Ngk1ibi8xmDZJagznQVZqcUCkCkzLwiwfQeLY7fO1Row/iw4XOxdd7cTjz19WFcz4K4EQ3dRE7KlM1t1Z6LJOWlqGx/X+mCr/Uw+6rgy4FvMfrQ68uhfEyLcQERoatvXxWGFIp9o0mhdUAtmcHPMqqlHNp0O1mXBDZkE=;
	20:96sWkCW/c1aWeZMAeM6TF5xUBkfq5npoG+r80Yf835Et76PSyFcaRPQ37zWK0SL/0UHugSdOIoIE1meLdpVRhcKdB78x0M3h3JHkWfliH9UyS+U74NsMrQcrk3rSIhcQl4O8ufzlImTzQGvrfhzoU1akSLkAwBm1TS1YOCO2Hqq6+CVH6UvzP/h1WjaN6FINkd1gClfYnYKsHHyhRdEM1mZ0iT6KusNDU6QaojzOiFV94IONmU+jpf5NOfARx+426XEMzizyN+LCDNngk0ngHJ+piZYqP9bRuBWH0RlG1caEh2xXX9JXcsecK3tpCd3UAmiqUBgSqFl82PGxbeEEhE3bTrgx62CSrcgJP7cDavCgt66/PhgzcoO/N8YKyDVBenWjMVZ8Ct4ii6UEJXSxX9qdZPHVt1tN7of0LF3rPMTc5nzqn8U60wo7kfOHPvFIfFXCkw94MAWt/jzSWzan9Le83r3DXSgaQh9tkNjlTo525zJ/r8mSn9vmpEFh3huG
X-Microsoft-Antispam-PRVS: <CY1PR02MB13012E77BD9EE36609E30A8CBDED0@CY1PR02MB1301.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:CY1PR02MB1301; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1301; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	4:Plq8ZgKgCQt3DtiQcM091sqzi7MnDcct8W96jJHO76i4rB+tMk8wuKijqJSVy/ep9ajViEC9QfvyrCycf5JPgK2Opg1UeFJUiMqkW+VJhWl8Tbtglkzvyi8Mv+RjZ7pN607qBPtsEFQN266yaSetjrUv7TvCUOv2hus+GDsEKwCaxVU2nIzXmcZ3Jj+SnWc7+8Psiqmuh2JkLwY/Fr68L/6mq0IN5ab4Ept1DHpHNkCeL5ypWv+ddBvlkBM4x+Eorkr0VswEfbh4zTm9MDiQYLBfHZ9PG2bCJIBIT6g0Q+BDI8x0H2ggA2ol+BpZD7617qly1Ip8gFAQU4PgciiqUn9st1256xRmj0zoFFQX0PsaICB/pmDwO5yhDSd4GSQWPZxCqciaQL4beH0qAZGHEOn0Y8jis/jmaETc98KT4KqvMNk4aG8EeSWZ6VKNjXZ8uLxwbj1gqJloexn1fvrJx5gz/b39YxlmS2FsRteCnk4yqms8dMYeKlSxTgHYI199FrDp17V4bTKyHIwOyPAiwUhrTw94jF6AJFg456FIhBY93ICkQr/cY//6ifZezl47
X-Forefront-PRVS: 0045236D47
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAyTUIxMzAxOzIzOmJNYzJDSGw4ME5OdEhtVU9PYTBuNWVkTmhS?=
	=?utf-8?B?SGtWKzFEc0VRQ0d6MDhLdXAvNjdXdXZPVi9IZGNwV3RPZ2ltL1ZYNmcvOGVx?=
	=?utf-8?B?dnZISnpNSlQrVHFzcmRLRWFCREhnMFN5bmsyUVo0eVlxaXJVUHFhaStwWTlL?=
	=?utf-8?B?QmNjQW90cURMQlZITXMzWWZYMUFVR254U3ZMSmNrYzFaOHlnTW5UVHpTd1Vu?=
	=?utf-8?B?TVZsY1VMQ2VWazdHT2c3alk4dk1sY2FIaWhuMUJjb3U4alU5UGRHaXdUTHVP?=
	=?utf-8?B?emF2dW16NUttM0phWW5UZFROWGVCbmwxeU4zRk9hcEtTdkIvNE5yNE9JWTNp?=
	=?utf-8?B?VU90MG1wM0NFQ1lWMyt4dEFMK0NyenZtekI5MFQvdkZuamNRTWI1cE9NclZr?=
	=?utf-8?B?bGJ4WkpLdVVBNndRaXdSb3VvMWY0Uy9lZGxvSy9FdGNuMDNzbXpJQzN5Qmt5?=
	=?utf-8?B?bEZRdEhqbktNVE5rcndWVlpjYlh4eHUzbkJJdDg4cU9hNTh6NjN6dWxSYUFU?=
	=?utf-8?B?YXg4em9oWGM0UDNoWGdZREtzb0lpRzdyWnNQb0dRRHhUcVNHdXlDSEZOREo3?=
	=?utf-8?B?ZkZxbWRrUDFPV0N4T3puazBWUTg1YnRTaHhuTllpdjVpc2htT3lMbFRGNE94?=
	=?utf-8?B?Tmd6Tit2OXQ2YkcyQndlcXpCd1ljNGNNbjNiMFVFcnZYcU95RHhjZGR5ZVU4?=
	=?utf-8?B?dUJORGMxOXBoSXVsY0NTMkhySjVCY0xqT0VLRk0wdm5mQS9RaVFSajY4clR0?=
	=?utf-8?B?SnF0SjNjUHpQTUhYeWhlbGpSa3dkRUxaMXZtOTJsdzZ0MW0zcHdLSEhlQ3Fx?=
	=?utf-8?B?N2Jjb3hKSVJiNTUzZUxLaVhrejhwRWlYLzVtSk1tZ2ExVG5VU2dtYUZJZVpX?=
	=?utf-8?B?REdHQ1F0WUN6dWoxaVBxcWJvSWdMZ3I0cHpwRDRjbzV5dm0rcnhDdzFJVXIr?=
	=?utf-8?B?V29qRXFjL2lHSmtXRlFqaFk2Q294akNHVmY2S3RPL2FLV1hTcHdKZGcyMkow?=
	=?utf-8?B?VEpVOGk4d2kwY2p6VUl4L0ozSjJubm9PYmZDNU9SMzZvd2xwMW1TSWNFUDVV?=
	=?utf-8?B?QVAyMmEyN0tXdTk2WUorWXpoMnV4OE02VUdyUVF2bUdEaFVNbnJWcmVOalhj?=
	=?utf-8?B?bm1KUzIwU3pSQXRUeWFtSzVsSlZwSUJudTUyR2lLSWxYM0VlYkR2cDMzQy9M?=
	=?utf-8?B?L29ad1BhQmRVRkxxNkRFM0VYeUd5MTJMbWs2OXRadGJGWmpZZ1BmN3paSlBu?=
	=?utf-8?B?TWM0cEp6V05JSnFUTUJmRUFPUFhNZmlsZDNoYkRBdW9nZW5YMk1sOHpqclpP?=
	=?utf-8?B?SDd1U2RZTmxaK2ppWEZ1emNwRnM4d2cyRTRZYU5MMHQ4LzdUdGp0R2g2TXNh?=
	=?utf-8?B?RUtoaVU1blFSaHgxM0tQeklHYUtMRmZVZ0c1V0RjUWdKazFHaWtiQzZ6MXJs?=
	=?utf-8?B?RCtUazNHNlZPdnBUT0tzNVl4Y1ZqUGNuSk8wTWV0MXR6b0pNcXF3dVR1MzhE?=
	=?utf-8?B?dS9Fa08vRCtFNm9La2kvM2JLRnNNUEppNStSYUtQam9zYUduUWVEWUE0cXJM?=
	=?utf-8?B?Rm1PdzE3aTd0cTNmUjc4L1RXTXJWUi84a2VZckg0VGxxNThmaktSWEt5UWdQ?=
	=?utf-8?B?OEF3VWdNUE1ZQ3hzWmdSQlpGeFBrekhwQjY2L0dQeWhjQ05tUmVFczlGQy9S?=
	=?utf-8?B?NHJZV2h3eDFhb0tEOXZVWHdhUjNVZEhDWktsK0wrQjhOQ3BOL0t0WmV6QkVv?=
	=?utf-8?B?eUVKWG14eEhob3hnaDV6L2d3YkM0c0RKMW5VUTVxaDJHczJBU0EwWFV3NGo2?=
	=?utf-8?B?TmU5NGVNaTZhVHRQUVdYak1GZ2F3VjFLbzB2OVFsNVFFemJrVUh6TUtqSk00?=
	=?utf-8?Q?gJdGCRGc91M=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	6:FuTo7YJ+eEPEJkKOqD5r+yg0E2mRusIr0LclLSV5RsLZLd0J7VPyIvfamGaQ2YtqSpFFxqh/8FpqIGZ34ktpYTX2FXf6ej3eFd+zHdOaa4dYjXW0u64LWGTHfv0n24ypfpGiy2GIfYQzDhK3Clujce2dTChr5d7HD3nSS4JwhcFRgrR+NEpYMsUxx6Xt6IF1FeK4ohycwhy1v28WzJTEdTPSAOYTDJxNsQ2EPDHqADNoN3uNDltka0Kf0IMgNbmu6WfTURj282We2R6QCBtxD3/XZiHdFl49csp80OC5pKjTcn9CCMaM+i56XpDAqShTwOdEg7yzGa315ClI6rt1cQ==;
	5:ceyKFYp2LRJf0fhxyE7PA2xqlmDlBzWq1u37JncmRvykREa2BS9fy3pG+HqxK/iyQj3+s3xJVqM/3N6W8/kzQT7oFLqy0M501mvmSKTUx8DU8XlkQ6tJcpvzKJh2+aITq5WejmwLWf0aXqZBMtABOA==;
	24:e+EgJKe+tZqYmY59j79yRSEybV+j8LU7fTz8Dr4mJvOGnXOb7QsjBb5PqrACl9BwS97QaswxiobsEtAnBfROQBNIqaf0rZ2NeIsP0jIMzIE=;
	7:1hP/oJRea6iQEGz7pCuN22/uecMSkiJBjBgrCXrVcEub3QMfPSFnKFkAnswYQa3hk8SdKLb+ttCIxKwEYY+kf9AVQFenIkVNjicAzS+9EZCyBjjxhMwSTE3sfqPTnoULwBpUQCVrqLKBoS94BvhsKrUTYUG0hO3HztN2Tz1oQ6psgyiSYlWzgxO9TLjNNiBIsjXH9UP/n1YLvXb2OOwoDTjM/6NQB+S424LL2FJT2xYcaxq1MEDWj5fqeMZgkHmQ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2016 09:56:55.9451 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1301
Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] [master] [PATCH 2/3] benchmarks:Added recipe for dhrystone
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
X-List-Received-Date: Thu, 25 Aug 2016 09:56:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21h
aWx0bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDI0LCAy
MDE2IDY6MjcgQU0NCj4gVG86IE11YmluIFVzbWFuIFNheXllZCA8TVVCSU5VU01AeGlsaW54LmNv
bT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IE11Ymlu
IFVzbWFuIFNheXllZA0KPiA8TVVCSU5VU01AeGlsaW54LmNvbT4NCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbbWV0YS1vZV0gW21hc3Rlcl0gW1BBVENIIDIvM10gYmVuY2htYXJrczpBZGRlZA0K
PiByZWNpcGUgZm9yIGRocnlzdG9uZQ0KPg0KPg0KPiA+IE9uIEF1ZyAyMywgMjAxNiwgYXQgMjow
MyBBTSwgTXViaW4gU2F5eWVkDQo+IDxtdWJpbi51c21hbi5zYXl5ZWRAeGlsaW54LmNvbT4gd3Jv
dGU6DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGFkZHMgcmVjaXBlIGZvciBkaHJ5c3RvbmUgYmVuY2ht
YXJrcy4NCj4gPiBEaHJ5c3RvbmUgYmVuY2htYXJrcyBtZWFzdXJlIENQVSBwZXJmb3JtYW5jZS4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE11YmluIFNheXllZCA8bXViaW51c21AeGlsaW54LmNv
bT4NCj4gPiAtLS0NCj4gPiAuLi4vcmVjaXBlcy1iZW5jaG1hcmsvZGhyeXN0b25lL2RocnlzdG9u
ZV8yLjEuYmIgICB8IDIyDQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IG1ldGEt
b2UvcmVjaXBlcy1iZW5jaG1hcmsvZGhyeXN0b25lL2RocnlzdG9uZV8yLjEuYmINCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2RocnlzdG9uZS9kaHJ5c3Rv
bmVfMi4xLmJiDQo+ID4gYi9tZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2RocnlzdG9uZS9kaHJ5
c3RvbmVfMi4xLmJiDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAw
Li5kMDAyNmQ1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1i
ZW5jaG1hcmsvZGhyeXN0b25lL2RocnlzdG9uZV8yLjEuYmINCj4gPiBAQCAtMCwwICsxLDIyIEBA
DQo+ID4gK0RFU0NSSVBUSU9OID0gIkNQVSBCZW5jaG1hcmsgdG8gbWVhc3VyZSBpbnRlZ2VyIHBl
cmZvcm1hbmNlIg0KPiA+ICtTRUNUSU9OID0gImJlbmNobWFyay90ZXN0cyINCj4gPiArSE9NRVBB
R0UgPSAiaHR0cDovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9EaHJ5c3RvbmUiDQo+ID4gKw0KPiA+
ICtMSUNFTlNFID0gIk5DU0EiDQo+ID4gK0xJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovLyR7
Q09NTU9OX0xJQ0VOU0VfRElSfS9OQ1NBO21kNT0xYjVmZGVjNzBlZTEzYWQ4YTkxNjY3ZjE2Yw0K
PiAxOTU5ZDciDQo+ID4gKw0KPiA+ICtTUkNfVVJJID0gImh0dHA6Ly9mb3NzaWVzLm9yZy9saW51
eC9wcml2YXQvb2xkL2RocnlzdG9uZS0ke1BWfS50YXIuZ3oiDQo+ID4gKw0KPiA+ICtTUkNfVVJJ
W21kNXN1bV0gPSAiMTVlMTNkMWQyMzI5NTcxYTYwYzA0YjJmMDU5MjBkMjQiDQo+ID4gK1NSQ19V
Uklbc2hhMjU2c3VtXSA9DQo+ICI4YzhkYTQ2YzM0ZmRlMjcxYjhmNjBhOTZhNDMyMTY0ZDI5MTg3
MDY5MTExOTlmNDM1MTQ4NjFmMDdlZjZiMmYxIg0KPiA+ICsNCj4gPiArRVhUUkFfT0VNQUtFID0g
Ii1lIE1BS0VGTEFHUz0nR0NDPSR7Q0N9JyAnUFJPR1M9dW5peCcNCj4gJ1RJTUVfRlVOQz0gLURU
SU1FJyBcDQo+ID4gKyAgICAgICAgICAgICAgICAnSFo9NjAnICdPUFRJTUlaRT0gLU80JyAnR0ND
T1BUSU09LU/igJkiDQo+DQo+IFRoZXJlIHNlZW1zIHRvIGJlIG5vIC1PNCBhbnl0aGluZyBiZXlv
bmQgLU8zIGlzIHNhbWUgYXMgLU8zIGhvd2V2ZXIgd2UNCj4gcHJvYmFibHkgc2hvdWxkIHVzZSB0
aGUgU0VMRUNURURfT1BUSU1JWkFUSU9OUw0KPg0KPiA+ICtTID0gIiR7V09SS0RJUn0iDQo+ID4g
Kw0KPiA+ICtkb19pbnN0YWxsICgpIHsNCj4gPiArDQo+ID4gKyAgIGluc3RhbGwgLWQgJHtEfSR7
YmluZGlyfQ0KPiA+ICsgICBpbnN0YWxsIC1tIDA3NTUgZ2NjX2RyeTIgICR7RH0ke2JpbmRpcn0N
Cj4gPiArICAgaW5zdGFsbCAtbSAwNzU1IGdjY19kcnkycmVnICAke0R9JHtiaW5kZXJ9DQo+DQo+
IG1heSBiZSBqdXN0IHVzZSBpbnN0YWxsIC1EbSBnY2NfZHJ5MiAke0R9JHtiaW5kZXJ9L2djY19k
cnkyIGFuZCBjYW4NCj4gY29tYmluZSB0aGUgaW5zdGFsbCAtZCBpbnRvIHNpbmdsZSBjbWQNCj4N
Cg0KVGhhbmtzIGZvciByZXZpZXcuIEkgd2lsbCAgc2VuZCB2MiB0byBmaXggcmV2aWV3IGNvbW1l
bnRzLg0KDQpSZWdhcmRzLA0KTXViaW4NCj4gPiArfQ0KPiA+IC0tDQo+ID4gMS45LjENCj4gPg0K
PiA+IC0tDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiBPcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KDQoNCg0KVGhpcyBlbWFp
bCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBpbnRlbmRlZCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRo
ZSBuYW1lZCByZWNpcGllbnQocykgYW5kIGNvbnRhaW4ocykgY29uZmlkZW50aWFsIGluZm9ybWF0
aW9uIHRoYXQgbWF5IGJlIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkIG9yIGNvcHlyaWdodGVkIHVu
ZGVyIGFwcGxpY2FibGUgbGF3LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCBkbyBub3QgcmVhZCwgY29weSwgb3IgZm9yd2FyZCB0aGlzIGVtYWlsIG1lc3NhZ2Ugb3IgYW55
IGF0dGFjaG1lbnRzLiBEZWxldGUgdGhpcyBlbWFpbCBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVu
dHMgaW1tZWRpYXRlbHkuDQoNCg==

