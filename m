Return-Path: <mubin.usman.sayyed@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0059.outbound.protection.outlook.com [104.47.32.59])
	by mail.openembedded.org (Postfix) with ESMTP id 3D80773216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=i0OiH3SesfEeYuJYHlO273L1100AXOaLSA3BfQFaBx8=;
	b=lUx46PcJyBfpi1UjsG8AfFFQxMsr7Q4Yz0kF1ZONPsOG6IcfaAAPD7bg6mN2rbWLkm45X6KcxD5dQNHalx5BOrL4kSAyO+8TQ6P4gHEnNX9bq/TMM+hUpHcwZoZKdHP1X9O0CyzvGVf/eTUc4sZ4g/enwf7d+3m3h+r05usp9Gc=
Received: from BY2PR02CA0052.namprd02.prod.outlook.com (10.141.216.42) by
	BLUPR02MB1620.namprd02.prod.outlook.com (10.162.212.158) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.9; Tue, 23 Aug 2016 09:47:43 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by BY2PR02CA0052.outlook.office365.com
	(2a01:111:e400:2c40::42) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.587.9 via
	Frontend Transport; Tue, 23 Aug 2016 09:47:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.567.7
	via Frontend Transport; Tue, 23 Aug 2016 09:47:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc8J3-0006xT-7l
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:47:41 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc8J3-0000ov-Tp
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:47:41 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7N9lYZW006162; Tue, 23 Aug 2016 02:47:34 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bc8Iv-0000nw-Oc; Tue, 23 Aug 2016 02:47:34 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id A6C812CE0885; Tue, 23 Aug 2016 15:17:32 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 15:17:27 +0530
Message-ID: <1471945649-3164-2-git-send-email-mubinusm@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
References: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22530.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(189998001)(5660300001)(92566002)(110136002)(2950100001)(626004)(33646002)(107886002)(47776003)(2351001)(36386004)(15975445007)(229853001)(2906002)(8936002)(50226002)(90966002)(11100500001)(356003)(103686003)(5003940100001)(19273905006)(586003)(52956003)(42186005)(305945005)(87936001)(50986999)(63266004)(81156014)(81166006)(8676002)(50466002)(7846002)(76176999)(48376002)(106466001)(86362001)(4326007)(4001430100002)(46386002)(450100001)(36756003)(19580395003)(45336002)(19580405001)(107986001)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1620; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT022;
	1:CeRXC9AyxrBmHmMVxkKHURLt7KRgd60eHjoNQMbMek1ytR/xR0V35eW6U6HviFXX9Cgnl/bv8v8WsCDzyVV5phAy4WzZRIuWMMeacK7KfqO9No+AQj4mJrlvCgbDMhYXM4zemGHVMQlLa0jWrkNaL436T12TJUsQGo4Ck1MbwKX6c2auX4FgQKs+gWbp6eZGhm1U+lXPP8h9W35RYRd97CqQdSFeLBovKBOKG8VYv6sYpPK2h/9kA+2/DagUIzy4svbrR4cTjBn4NVSugYsCrMXy8gLvAAK6K4ldXdp9eZ6j/fdz4umlYpNZMlpM6b1xoT6H6oyrHXvfb5dwINxj05WOoUigjHjQNfHvemPFYysvFM0QeYzzF4+pKIurMnCFEuh20/FEr96xM8q9a7QDTfhojyWCfyMEn9rwaoyRrOC3G2Vr4VAV8Jq0ZSymZg3Fj+gKg36/x5lej0s5KtEOMSh7IUw6RVFahVqGC7tjwKhWlkC92iAHLyjQ/M0F57d/zImOp8OGy/EdNbaYYc8OEQbtOqR9iOXOn86frDAPuGB8rieByQu/3wdVyK1L82dY
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c00c5539-fed1-426b-57c9-08d3cb3a878d
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1620;
	2:KMbruPCuSnGOHsJuZT3PiQJaNGgZfUHj/Uth4wzY0SuouFwDwJzYRhs/18eySmVq552J1/SGSlAV1XNQs3m2WPpnYluBIg5HncIjqWdE811nJgVUU7qvGZ7Hyl7hR/RGKJurKJE36ebaryahzXhTvae87c5Ak6KD1lhNrkhAKULvewb5eDvrFOuA/6aKnF0e;
	3:/FnbLHdN6IXds27NbM/wBR8sJTuV5Z/DkJPdoLK+Xj4VMFGVEffvnFAFr04U1F2Tg/4evpoAkRV/GLHNfZBk7+Jfe7Uqg0fdPSFTYT2efBXMzTerceZjJtRsgbSUjCQr1R+r97pXXCVf2QodirtF1gth02/JxXTSSKBS9mWACrmGUxWj+sPOibQk16uAlnmrlLGRYtpRdwtyemmDTggSLPfJjUxijD/d2WobHgqNx+3WyvMkUVNU22d2b3Jbv2RYGaG2FhsfSZVynZjTyt9c5Q==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BLUPR02MB1620; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1620;
	25:pz5a4gcnOvUXy+qHx6xILH+mthGm+i+FXZOHcsAnQMBrhinS4tDS3ZYh9di1w+e2Es6apiqdGBQH7Xgt7nTRa0BXtqso7YyYi1xKkUfRdtuDLAhSLwpDcmwRpTk+y8ZKKJ0q8mqxwLIZd4T/B70AZCqC6hRphKyZuQQ5tIeBNyFTDbHpeIlLb7Cxk/9MWw2bipqiDLv6BN4D9usL+O0c/aR/dJiapxAJVG/eomq9r8ri+2LhHuKKT4xqJUwuDTxLva89PkabYxyl2K606ckNWoWbCBCMEnSQU6Etu5CaSixGkA5xIbDOSLUvs2DEMwSYMCDC++SKJm2UFtA9LFnZ4tXk23+etZRQd/gathbDS2KYvFQgFloDQp7iXbwF3c8bTKVPFUMqLdrdMvlRZVzStuF9IbS2yXwyo7bx1XtE/SwbuWXINclMU52zq5B0IoxAmPDjiWsQlrLGzDjvCFyOBrjXKtojm/6K9XqWJjRwtOPk+tMnG6ovNWzoZLAf7Mntzx9cd14wLpRcTq8C40mnr8suLZK6N9AaTW5qBwtJnZaQ+ia85fKJ344yPyyR+EfcVZCucA2DP51BXIFO65EbN5KeaPuclWWJkoD2ddi5ZT7n12IWgpTDSkP/3lTGqpUfr5hbTzCbbKJn+zgNsX5JU3xWPkY4jS431kpWVEiuDRMg/oIRzmBJKLWteXlAdt5W5N08KYwcnniTmPS/LMWhXWyfG9aBkxyL8HegpKDXglqoNzTZdnLKt4lmaadD2YwaZ+sKf8l62nPxdtWl0ETlOmf436F9gF0ypA/KwJL/NmtZuGOacceMewo1iyPQV/1PTX2YTpfU1N9KclNdt+68sFb07JNj8QZ09+JFL2MTWHioboaukS7XLk2+z3H/8Cizcf0WsrwpW5MG98Bm9f426g==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1620;
	31:A0mKirD7Bl/TrDqbGBjQ3QKw2EDhA3EghxARyp30ydqMLYq3krd3wIonHBYRJ7SlFJ9s0VYV9vQ7o5DygKssZSJWp8RdeUuZ/YXvY122lwH5dUHY404Itzuwvxho21cioUnDhUwObjsxNMxrKPfBKIpUyWZAWJaqsTqUT+INsOv1dIINHwnG/XBEzPOYHA+HWzRy+j37IHNJzSQzBS7Nz9UzNPSeem7QpnstyQcnFr8=;
	20:ydcvDzbbdFmJuyaKDSLQfcEk+LGLcyMbgqGEjCQSsig3OFuHHGX+SSpVXXWEomGyWoA+Unw2EI/3yaiGwO4bS1ZtstCyvG5+SkOQTr5Ptt4IJjXAgD6m4/0oy3hkpHdjlfmA489tOunvI4ScamF+unhvq40RcDG5imIZSaKQjKR6iNrkXDgUvuRiRmMxvB8atKZtmkr1wX6hXpnouOt7xcMcWrdD7JBRzPuMCl1XdDE2Ern61RgSNIUBsr6CMyakX/p3cXKu34Ir3T4uGOmctI7CRmN/V3E26BQ3WT8lqYOORjm+QHxoAx6o5Mzh4Y/8Qpd1VL2Ob+DnvPStTmd4/y+yGy2I7tePWebCczX5eI2nSWPLEN0CtaxLUHSsNaejHmORRC/nE4RJi44nugchn1HLgVKmsdF4gj4fI2Y+6+2D77dSHipY6g2seUX1eg5adLjE+Yj2NS1uuG00AaHAxLX5voCkeMklQvsEsZ1Qw+4i3+OXPWwXBWz9vOvAgnjp
X-Microsoft-Antispam-PRVS: <BLUPR02MB16208308FDFFEA8F55F4066FBDEB0@BLUPR02MB1620.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BLUPR02MB1620; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB1620; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1620;
	4:WbdRgvcyWWF1A989idwPydxfu5/7Rnl6bxpjXRPOdWGFORdoIhAvNC4qNS9HvORyxMhQKTBCRJw5w6uX/8n78xD51Vb0Jd3vetzAqJKUV8MnHDdelod2/6mN8d3DF+CDsMSsMAKmurMpEilsGmyCn1PI/BJRxaG4uBxKaQfNwWiKqgKnJER2RJI+Fv44k5/ktr8tM24xTelkwBvWC1brUVR90quohJRLUA2TYifpG9Rny7ConGES/eQ3xMIpYQMLOn7dsLHWZM5nCTRMCn0kVCvSZ87xALyc6ozZWHKeszD5J6Cv1PWffm9hnU1xMqFkmPijl6WMIrrBw749ou9UJcnW/vinRHhpFB1JMrH64gKWuwIsTKg+AmtSYf5KDza1h9IPLr/vRv2hgAOK+dpifCREyUmivBpM/puP1MDnadFSrr/fScsnNBfeG4t4mIpfNKLtLq0/d+IxNth38yGqI3KmtYxHJZI25yUohs6NRtxZYSLdooNQA0nHEvbHpqrc9cpQDQaJ43SSffUzSdjWWp4xsax6dpeID23Ue/bjEzk=
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB1620;
	23:IDEAP5bSU3jsH7D9FRBvrXDg4lym4MB6oyY08qsCY?=
	=?us-ascii?Q?luoQo0ntPjZVbm6j8jN9AJfzUFIiu1CNcZyp8MkwAG5uvtFV9X6x5meeo28L?=
	=?us-ascii?Q?y94Pa6V0bdReAMI2TdqAyr/m1OOtOOTJtvAq4PIIplT1cSaDKIgortj3XVND?=
	=?us-ascii?Q?Ncsw/kyywl7Ct9M1h03URAwfwhwmS/eouKQ2AeC38J7qVOp2EtE4wVWD3rf+?=
	=?us-ascii?Q?awMxLmyYfeEoxOwsArpV1mJtdXL3YLJ1igMXnxXQC6TY1ualdiLuXGXX8v8I?=
	=?us-ascii?Q?yjO3YDSf56G9HdTHQg7lzrEpdRspLWTkEQ2RKJhFatxFhU5/eD1fi76sAc5v?=
	=?us-ascii?Q?/+r81fQ/NhOJXPhyCv++EBS+FPKGqqajOExqOHORvoeBqIvIAzjOHhsYcNuT?=
	=?us-ascii?Q?iPUVUL6bYzg+85oiFu3YPR1wvrbkkwC7F1chzON2zbp4hwYE7QaNv57SvAZX?=
	=?us-ascii?Q?Hh8gWw/0+sUfoLxuxayqkEoW14fzki+GVUACvGnawCYzL2KfINcQfezdDygb?=
	=?us-ascii?Q?Czd/EaEZ1Ydax45qkkbhFn4YdOzHuSDJA/pzttopUNvdER/RxlI5+WIgadRz?=
	=?us-ascii?Q?7u/JEm3ffrhpLUHwXdkrJqHl0Ln2cjFxiuucyqdVWnGMW7Q76JVZYLvB7mlE?=
	=?us-ascii?Q?3yO/SGCTtImlM1GmwOhm5CM/dHIJUyFh2wLt4MFNkQ9o2oReOLdlxzgVLMFZ?=
	=?us-ascii?Q?VwfeJYnYVAY9as1F+JiywefGO+uKXzBCcgMJV+kE74JBVbZuv2qOBQKWQazF?=
	=?us-ascii?Q?RO4Qvqm0Y9Fa7MMKiTnqOj0ubneOjOIeK5I/mnKK2s7xy2pZt6HjQLli4Y96?=
	=?us-ascii?Q?fOtAQayYcbUbB+Xl3VnElsq9BooYN5iro1aRizL1H/fajwrzSTqRRvYyTWxq?=
	=?us-ascii?Q?aclIeFEPW8WnXV4g55rEqpeoz4Brzxk71sq3ClLQySIlHQ5VLbv4yiL20Yk6?=
	=?us-ascii?Q?wJ5+snlWiuraiNI7AndM1nEIfOEzW6m1F32dNdkJ1ShzU3A/Ivnwn5agaJxK?=
	=?us-ascii?Q?6Jxhwaxb05exhMMS1jBB7Vb8BRvOUa+qTLRnacbAG3f16KGVsEUtPRyTPOfI?=
	=?us-ascii?Q?gpe2LUsz6VHEmdTGEs+1OAABmlJiPr5Nyxp6Bahc6mUpuc0DnNTA1FvwtlrU?=
	=?us-ascii?Q?ia/91U91qiIaKXt0/7EjTG4cKA/jfzosiUp2RIZGWIr9DKs/HLoAFB08uthh?=
	=?us-ascii?Q?eq7psWitnOMd3yaANZhjPCLpJ4+OMv8pWBt5YfbKVFU2gALpFzf8OK9+z41q?=
	=?us-ascii?Q?oSLwQj5jz9UUHFR87bT2hvD/7diskKo4lzKcukcN17iCP0UX2uPCezTgwqxA?=
	=?us-ascii?Q?nf9TN3Ld914wMJ5Y25qB6w=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1620;
	6:VzEVFZY+ZcmkUUfDzJeAy0LjlRDzDTk0XhU8Al/RgSTsJqnHhQa4uYZO3ZX4Be3QBDaEaH4ahuAb7H/SV+rglRWlKZ9Cg1oQYqsp4ezsIgVeHYoGlyrY7ufzvK8DFeWbsDNw8WebK/+sDb6/K6Dt3rZ0Bo/JqiPirHXWbiYGMdW0TFxklu6UScJI5HLydmZIN99xq/ON7pOvaGFR32bf3X+/GOUMdHCpA3Xl+COTF1VLaToBrgMn//teU2IEK5tiq4mcoyeSGvhUva5KTuVFxzfSskAkmWOR+aJMd0QA6bzuUupBKRg/SODCsExJD7vqOBnEnq5Csu9D4watfLmmKA==;
	5:5hz7Nj2qgOf/HIhPhHN/eZLCoEGnKjPOtLFGAWqlGb0xnfHBDvdlZb0RoeyKM8z17cIap2Y1aFHW7S0Sudc+5jm1LxwKYRIQ3vwJRX9E4Wghrw6MuTJYY2tBIlz/2TDoIxIhY4DnncCT7iphwt/liA==;
	24:b2T9qZQuC+znroA/g0yo02xnb/X6tpWkno9BPiyrApNZDz15hXV3bJaUgsQYxmzQgZ0suGChrcp6Wc8kQwICh8wyuDXCY+va3GD0ZAPHo8s=;
	7:urvoKUsCCiMAkYJoSWk59uhKe9zJPyJTIy7P+SrflgLZzdq/noaukxWqsm0in6nSBXRlEQ+eupiq4CxTQ0Mod10xt6MwZeHHDGqr4QbbSzqb8K8K6sOfAcBY6QWssouxl9YHE0m/AOS3xjczaUxBjeZE6OsQVMGsw1pDeCQG4aT1JlZzKQ3leYPPVGP2WHAzc3LGVZK6SklPl6z+lO7ygmANI0Ec8Nj9rd4qYx4jVBBZ+2o20J0EJjrib2soQ1Ff
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 09:47:43.0538 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1620
Cc: Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [master] [PATCH 1/3] benchmarks:Added recipe for whetstone benchmarks
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
X-List-Received-Date: Tue, 23 Aug 2016 09:47:45 -0000
Content-Type: text/plain

This patch adds recipe for whestone benchmarks.
Whestone benchmarks measures CPU's floating-point
arithmetic performance

Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
---
 .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb

diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
new file mode 100644
index 0000000..e6f51cb
--- /dev/null
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "CPU benchmark to measure floating point performance"
+HOMEPAGE = "https://en.wikipedia.org/wiki/Whetstone_(benchmark)"
+SECTION = "benchmark/tests"
+
+LICENSE = "GPLv1"
+LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
+SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
+SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} -O3 -Ofast -o whetstone whetstone.c -lm 
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 whetstone ${D}${bindir}	
+}
+
-- 
1.9.1


